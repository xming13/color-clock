class CColor {
    // all values are normalized. ie in the range of 0 to 1.
    // This includes hsl, hsv and rgb.
    float[] _hsl = new float[3];
    float[] _hsv = new float[3];
    float[] _rgb = new float[3];

    CColor (float h, float s, float l) {
        _hsl[0] = h;
        _hsl[1] = s;
        _hsl[2] = l;

        _populateHsv();
        _populateRgb();
    }

    float[] hsv() {
        return _hsv;
    }

    float[] hsl() {
        return _hsl;
    }

    float[] rgb() {
        return _rgb;
    }

    float red() {
        return _rgb[0];
    }

    float green() {
        return _rgb[1];
    }

    float blue() {
        return _rgb[2];
    }

    float getPerceivedBrightness() {
        float _r = _rgb[0] * 255;
        float _g = _rgb[1] * 255;
        float _b = _rgb[2] * 255;
        return sqrt(_r * _r * .241 + _g * _g * .691 + _b * _b * .068);
    }

    // Returns the opposite brightness based on the perceived brightness of the color.
    // Returns 0 if the color is bright, 1 if the color is dark.
    // This is mainly used for overlay color for text.
    float getOppositeBrightness() {
        return getPerceivedBrightness() < 130 ? 1 : 0;
    }

    void _populateHsv() {
        float _h = _hsl[0];
        float _s = _hsl[1];
        float _l = _hsl[2];

        _hsv[0] = _h;

        _l *= 2;
        if (_l <= 1) {
            _s *= _l;
        }
        else {
            _s *= ( 2 - _l);
        }

        _hsv[1] = (2 * _s) / (_l + _s);
        _hsv[2] = (_l + _s) / 2;
    }

    void _populateRgb() {
        float m1, m2;

        float _h = _hsl[0];
        float _s = _hsl[1];
        float _l = _hsl[2];

        if (_s == 0)
            _rgb[0] = _rgb[1] = _rgb[2] = (_l * 255);
        else {
            if (_l <= 0.5) {
                m2 = _l * (_s + 1);
            }
            else {
                m2 = _l + _s - _l * _s;
            }

            m1 = _l * 2 - m2;
            _rgb[0] = _hueToRgb(m1, m2, _h + 1/3);
            _rgb[1] = _hueToRgb(m1, m2, _h);
            _rgb[2] = _hueToRgb(m1, m2, _h - 1/3);
        }
    }

    float _hueToRgb(m1, m2, hue) {
        float v;
        if (hue < 0) {
            hue += 1;
        }
        else if (hue > 1) {
            hue -= 1;
        }

        if (6 * hue < 1) {
            v = m1 + (m2 - m1) * hue * 6;
        }
        else if (2 * hue < 1) {
            v = m2;
        }
        else if (3 * hue < 2) {
            v = m1 + (m2 - m1) * (2/3 - hue) * 6;
        }
        else {
            v = m1;
        }

        return v;
    }
}