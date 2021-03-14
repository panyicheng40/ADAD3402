package com.zking.diypointtouch;
 
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.os.Handler;
import android.os.Message;
import android.view.MotionEvent;
import android.view.View;
 
 
/**
 * Created by Administrator on 2017/7/9 0009.
 */
 
public class Practice extends View{
    //画笔
    private Paint mpaint;
    //定义圆线的宽度
    private int mstroken;
    //圆心
    private int cx;
    private int cy;
    //半径
    private int cr;
    //发送消息
    private static final int FLUSH=0;
    public Practice(Context context) {
        super(context);
        init();
    }
    private void init(){
        //初始化画笔
        mpaint=new Paint();
        //抗锯齿
        mpaint.setAntiAlias(true);
        //设置颜色
        mpaint.setColor(Color.BLACK);
        //设置圆线的宽度
        mpaint.setStrokeWidth(mstroken);
        //设置圆的透明度
        mpaint.setAlpha(255);
        //初始值
        mstroken=0;
        cr=0;
    }
 
    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.drawCircle(cx,cy,cr,mpaint);
    }
 
 
    @Override
    public boolean onTouchEvent(MotionEvent event) {
        // 判断手势按下和抬起
        switch (event.getAction()) {
            case MotionEvent.ACTION_DOWN:
                cx = (int) event.getX();
                cy = (int) event.getY();
                break;
        }
        // 初始化
        init();
        // 发送
        handler.sendEmptyMessage(FLUSH);
        return true;
    }
 
    private void flush(){
        cr+=10;//每次都加十
        mstroken=cr/4;//圆线的粗细
        mpaint.setStrokeWidth(mstroken);//重新设置
        int nextAlpha=mpaint.getAlpha()-20;//每次减20
        if(nextAlpha<0){//避免透明度为负
           nextAlpha=0;
        }
        mpaint.setAlpha(nextAlpha);
    }
    private Handler handler=new Handler(){
        @Override
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case FLUSH:
                    flush();
                    invalidate();//重新绘制
                    if (mpaint.getAlpha() != 0) {
                        //每100ms刷新一次
                        handler.sendEmptyMessageDelayed(FLUSH, 100);
                    }
                    break;
            }
        }
    };
}