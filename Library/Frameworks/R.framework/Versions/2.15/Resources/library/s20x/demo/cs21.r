data (teach.df)
teach.df
plot(lang~IQ,main="Language Score versus IQ (by method)",type="n",data=teach.df)
text(teach.df$IQ,teach.df$lang,teach.df$method)
teach.df<-within(teach.df,{method1.<-factor(method)})
teach.fit<-lm(lang~IQ+method1.,data=teach.df)
summary(teach.fit)
eovcheck(teach.fit)
plot(teach.fit,which=1)
normcheck(teach.fit)
ciReg(teach.fit)
teach.df<-within(teach.df,{method2.<-factor(method,levels=c(2,1,3))})
teach.fit1<-lm(lang~IQ+method2.,data=teach.df)
summary(teach.fit1)
ciReg(teach.fit1)
plot(lang~IQ,main="Fitted lines",type="n",data=teach.df)
text(teach.df$IQ,teach.df$lang,teach.df$method)
abline(teach.fit$coef[1],teach.fit$coef[2])
abline(teach.fit$coef[1]+teach.fit$coef[3], teach.fit$coef[2])
abline(teach.fit$coef[1]+teach.fit$coef[4], teach.fit$coef[2])

