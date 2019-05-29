package com.github.ybq.android.spinkit.style;

import android.animation.ValueAnimator;

import com.github.ybq.android.spinkit.animation.SpriteAnimatorBuilder;
import com.github.ybq.android.spinkit.sprite.CircleSprite;

/**
 * Created by ybq.
 */
public class Pulse extends CircleSprite {
    private int duration;

    public Pulse(int duration) {
        this.duration = duration;
        setScale(0f);
    }

    public Pulse() {
        this(1000);
    }


    @Override
    public ValueAnimator onCreateAnimation() {
        float fractions[] = new float[]{0f, 1f};
        return new SpriteAnimatorBuilder(this).
                scale(fractions, 0f, 1f).
                alpha(fractions, 255, 0).
                duration(this.duration).
                easeInOut(fractions)
                .build();
    }
}
