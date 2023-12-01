Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CKlUPadg"
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D5FD171A
	for <linux-doc@vger.kernel.org>; Thu, 30 Nov 2023 23:41:54 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso200801a12.3
        for <linux-doc@vger.kernel.org>; Thu, 30 Nov 2023 23:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701416513; x=1702021313; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRTbG9MnOftCv1Qa1lMXv18AQKHyindz0rc4DD79Q+s=;
        b=CKlUPadge9ethxaEITdL6zbVpQQt7FKqCLuKn/vNUeLC1gp2u4hTyoTBlULxGtj6jd
         8iKRVwjEfrZJNpawJVUwf3g30cf2OMuZ7VTc8BOcmGLVMVH2IM68KtoYPIZV871e1Rfu
         jaM8C4F6kRoyBZ8wcFYgaCswNZ1M9uL66QVH2yRKg78kLCtHi2nQMeHAN17GU7gSoUbE
         bRzsdH8ol2hNbI8CL+bpEhiJ5YaoAWoQG1vmQNzx5KE3K4pzDSA0AnB3gOESJC6/XHua
         LzLyUvjO2IL5/9RWnXyTJ1gGoq0BJPjjq4Cw9b8Qzkr13e02d42pX6/gCM1souULT5jp
         J6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701416514; x=1702021314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRTbG9MnOftCv1Qa1lMXv18AQKHyindz0rc4DD79Q+s=;
        b=UTzAxJNyUIZK4aC+LwW5Huoc3WJ3UaeNNTltsdLCF+ExwHTk+Wq8sJpI2anE+zjSLF
         27DPsDNzqrAxRoJU/JF95br4riG+L3u27JIPa0rskpS1vIWEBznWQZTGBBSs6lXMMZRW
         /jFEc4Np+C/IWWkc9OMP/FMMBnXUTGDu4gNoZ0eknkPGAA1uirjv3J1QijRpgAZnvYbT
         +gVxX7LlRUNmlH3qEUFhkl585x9+NQgnclBkbU3uJ7Z4vckn8aGkIykKCSKZahupBj4B
         o2UKQtrU5PyLk79f1kqdwT6p4f6PrguUOs7SEGFKdsSWMnHsLF//6B66dT6j/gUZ16UK
         O09w==
X-Gm-Message-State: AOJu0Ywh2Ar0cPR1zwQQ9ckRw/g/og5SP+PTkmsyRyBQ9dfamd31KC+b
	8OYZ5gOva+XCKaIkJlDthIim5IbZpIeLkddPc3kyIQ==
X-Google-Smtp-Source: AGHT+IFoj9gnvKt9cpdreLzI8cuj3yOz5sl9OaRRKU0KY/F3NShitS8EFrO8e1+Bmqs/+RzK3TVl1t8qh+OziAxtp2w=
X-Received: by 2002:a05:6a21:99a6:b0:18c:63cb:e86e with SMTP id
 ve38-20020a056a2199a600b0018c63cbe86emr23607706pzb.2.1701416513565; Thu, 30
 Nov 2023 23:41:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127143238.1216582-1-vincent.guittot@linaro.org>
 <20231127143238.1216582-2-vincent.guittot@linaro.org> <8009d5c4-4012-44a2-883c-0d7f74c4a2c1@arm.com>
In-Reply-To: <8009d5c4-4012-44a2-883c-0d7f74c4a2c1@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 1 Dec 2023 08:41:42 +0100
Message-ID: <CAKfTPtDqvcnQwYT-P6AvzsvuaJjeyVx12nsLzR3adN9rCXX5fQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] sched/fair: Remove SCHED_FEAT(UTIL_EST_FASTUP, true)
To: Hongyan Xia <hongyan.xia2@arm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, corbet@lwn.net, 
	alexs@kernel.org, siyanteng@loongson.cn, qyousef@layalina.io, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, lukasz.luba@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 30 Nov 2023 at 21:30, Hongyan Xia <hongyan.xia2@arm.com> wrote:
>
> On 27/11/2023 14:32, Vincent Guittot wrote:
> > sched_feat(UTIL_EST_FASTUP) has been added to easily disable the featur=
e
> > in order to check for possibly related regressions. After 3 years, it h=
as
> > never been used and no regression has been reported. Let remove it
> > and make fast increase a permanent behavior.
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >
> > I haven't updated the chinese documentation which also refers to
> > UTIL_EST_FASTUP. IIUC, this will be updated afterward by the
> > Translations' maintainers.
>
> Here it is in case you have to provide the translation:
>
> diff --git a/Documentation/translations/zh_CN/scheduler/schedutil.rst
> b/Documentation/translations/zh_CN/scheduler/schedutil.rst
> index d1ea68007520..7c8d87f21c42 100644
> --- a/Documentation/translations/zh_CN/scheduler/schedutil.rst
> +++ b/Documentation/translations/zh_CN/scheduler/schedutil.rst
> @@ -89,16 +89,15 @@
> r_cpu=E8=A2=AB=E5=AE=9A=E4=B9=89=E4=B8=BA=E5=BD=93=E5=89=8DCPU=E7=9A=84=
=E6=9C=80=E9=AB=98=E6=80=A7=E8=83=BD=E6=B0=B4=E5=B9=B3=E4=B8=8E=E7=B3=BB=E7=
=BB=9F=E4=B8=AD=E4=BB=BB=E4=BD=95=E5=85=B6=E5=AE=83CPU=E7=9A=84=E6=9C=80
>    - Documentation/translations/zh_CN/scheduler/sched-capacity.rst:"1.
> CPU Capacity + 2. Task utilization"
>
>
> -UTIL_EST / UTIL_EST_FASTUP
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +UTIL_EST
> +=3D=3D=3D=3D=3D=3D=3D=3D
>
>
> =E7=94=B1=E4=BA=8E=E5=91=A8=E6=9C=9F=E6=80=A7=E4=BB=BB=E5=8A=A1=E7=9A=84=
=E5=B9=B3=E5=9D=87=E6=95=B0=E5=9C=A8=E7=9D=A1=E7=9C=A0=E6=97=B6=E4=BC=9A=E8=
=A1=B0=E5=87=8F=EF=BC=8C=E8=80=8C=E5=9C=A8=E8=BF=90=E8=A1=8C=E6=97=B6=E5=85=
=B6=E9=A2=84=E6=9C=9F=E5=88=A9=E7=94=A8=E7=8E=87=E4=BC=9A=E5=92=8C=E7=9D=A1=
=E7=9C=A0=E5=89=8D=E7=9B=B8=E5=90=8C=EF=BC=8C
>   =E5=9B=A0=E6=AD=A4=E5=AE=83=E4=BB=AC=E5=9C=A8=E5=86=8D=E6=AC=A1=E8=BF=
=90=E8=A1=8C=E5=90=8E=E4=BC=9A=E9=9D=A2=E4=B8=B4=EF=BC=88DVFS=EF=BC=89=E7=
=9A=84=E4=B8=8A=E6=B6=A8=E3=80=82
>
>   =E4=B8=BA=E4=BA=86=E7=BC=93=E8=A7=A3=E8=BF=99=E4=B8=AA=E9=97=AE=E9=A2=
=98=EF=BC=8C=EF=BC=88=E4=B8=80=E4=B8=AA=E9=BB=98=E8=AE=A4=E4=BD=BF=E8=83=BD=
=E7=9A=84=E7=BC=96=E8=AF=91=E9=80=89=E9=A1=B9=EF=BC=89UTIL_EST=E9=A9=B1=E5=
=8A=A8=E4=B8=80=E4=B8=AA=E6=97=A0=E9=99=90=E8=84=89=E5=86=B2=E5=93=8D=E5=BA=
=94
>   =EF=BC=88Infinite Impulse Response=EF=BC=8CIIR=EF=BC=89=E7=9A=84EWMA=EF=
=BC=8C=E2=80=9C=E8=BF=90=E8=A1=8C=E2=80=9D=E5=80=BC=E5=9C=A8=E5=87=BA=E9=98=
=9F=E6=97=B6=E6=98=AF=E6=9C=80=E9=AB=98=E7=9A=84=E3=80=82
> -=E5=8F=A6=E4=B8=80=E4=B8=AA=E9=BB=98=E8=AE=A4=E4=BD=BF=E8=83=BD=E7=9A=84=
=E7=BC=96=E8=AF=91=E9=80=89=E9=A1=B9UTIL_EST_FASTUP=E4=BF=AE=E6=94=B9=E4=BA=
=86IIR=E6=BB=A4=E6=B3=A2=E5=99=A8=EF=BC=8C=E4=BD=BF=E5=85=B6=E5=85=81=E8=AE=
=B8=E7=AB=8B=E5=8D=B3=E5=A2=9E=E5=8A=A0=EF=BC=8C
> -=E4=BB=85=E5=9C=A8=E5=88=A9=E7=94=A8=E7=8E=87=E4=B8=8B=E9=99=8D=E6=97=B6=
=E8=A1=B0=E5=87=8F=E3=80=82
> +UTIL_EST=E6=BB=A4=E6=B3=A2=E4=BD=BF=E5=85=B6=E5=9C=A8=E9=81=87=E5=88=B0=
=E6=9B=B4=E9=AB=98=E5=80=BC=E6=97=B6=E7=AB=8B=E5=88=BB=E5=A2=9E=E5=8A=A0=EF=
=BC=8C=E8=80=8C=E9=81=87=E5=88=B0=E4=BD=8E=E5=80=BC=E6=97=B6=E4=BC=9A=E7=BC=
=93=E6=85=A2=E8=A1=B0=E5=87=8F=E3=80=82
>
>   =E8=BF=9B=E4=B8=80=E6=AD=A5=EF=BC=8C=E8=BF=90=E8=A1=8C=E9=98=9F=E5=88=
=97=E7=9A=84=EF=BC=88=E5=8F=AF=E8=BF=90=E8=A1=8C=E4=BB=BB=E5=8A=A1=E7=9A=84=
=EF=BC=89=E5=88=A9=E7=94=A8=E7=8E=87=E4=B9=8B=E5=92=8C=E7=94=B1=E4=B8=8B=E5=
=BC=8F=E8=AE=A1=E7=AE=97=EF=BC=9A
>

Thanks.
I will add it to the next version

> >
> >   Documentation/scheduler/schedutil.rst | 7 +++----
> >   kernel/sched/fair.c                   | 8 +++-----
> >   kernel/sched/features.h               | 1 -
> >   3 files changed, 6 insertions(+), 10 deletions(-)
> >
> > diff --git a/Documentation/scheduler/schedutil.rst b/Documentation/sche=
duler/schedutil.rst
> > index 32c7d69fc86c..803fba8fc714 100644
> > --- a/Documentation/scheduler/schedutil.rst
> > +++ b/Documentation/scheduler/schedutil.rst
> > @@ -90,8 +90,8 @@ For more detail see:
> >    - Documentation/scheduler/sched-capacity.rst:"1. CPU Capacity + 2. T=
ask utilization"
> >
> >
> > -UTIL_EST / UTIL_EST_FASTUP
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > +UTIL_EST
> > +=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >   Because periodic tasks have their averages decayed while they sleep, =
even
> >   though when running their expected utilization will be the same, they=
 suffer a
> > @@ -99,8 +99,7 @@ though when running their expected utilization will b=
e the same, they suffer a
> >
> >   To alleviate this (a default enabled option) UTIL_EST drives an Infin=
ite
> >   Impulse Response (IIR) EWMA with the 'running' value on dequeue -- wh=
en it is
> > -highest. A further default enabled option UTIL_EST_FASTUP modifies the=
 IIR
> > -filter to instantly increase and only decay on decrease.
> > +highest. UTIL_EST filters to instantly increase and only decay on decr=
ease.
> >
> >   A further runqueue wide sum (of runnable tasks) is maintained of:
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 34fe6e9490c2..146329678cb8 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -4870,11 +4870,9 @@ static inline void util_est_update(struct cfs_rq=
 *cfs_rq,
> >        * to smooth utilization decreases.
> >        */
> >       ue.enqueued =3D task_util(p);
> > -     if (sched_feat(UTIL_EST_FASTUP)) {
> > -             if (ue.ewma < ue.enqueued) {
> > -                     ue.ewma =3D ue.enqueued;
> > -                     goto done;
> > -             }
> > +     if (ue.ewma < ue.enqueued) {
> > +             ue.ewma =3D ue.enqueued;
> > +             goto done;
> >       }
> >
> >       /*
> > diff --git a/kernel/sched/features.h b/kernel/sched/features.h
> > index a3ddf84de430..143f55df890b 100644
> > --- a/kernel/sched/features.h
> > +++ b/kernel/sched/features.h
> > @@ -83,7 +83,6 @@ SCHED_FEAT(WA_BIAS, true)
> >    * UtilEstimation. Use estimated CPU utilization.
> >    */
> >   SCHED_FEAT(UTIL_EST, true)
> > -SCHED_FEAT(UTIL_EST_FASTUP, true)
> >
> >   SCHED_FEAT(LATENCY_WARN, false)
> >
>
> Reviewed-by: Hongyan Xia <hongyan.xia2@arm.com>
