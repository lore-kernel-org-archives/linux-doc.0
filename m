Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IJAWxRAe"
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E79DB3
	for <linux-doc@vger.kernel.org>; Mon,  4 Dec 2023 01:54:40 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5c1a75a4b6cso1056494a12.2
        for <linux-doc@vger.kernel.org>; Mon, 04 Dec 2023 01:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701683679; x=1702288479; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hUsWs1Nvk+Jou3+4Sjpg4bycXQIYoHKO7jqfrQ8ZCms=;
        b=IJAWxRAeXQBOaGQ6v2MVvGZ69vDURHh/b6sxUxyVbBOt/1vyLdZwRTlgTS3mM6+GOt
         Km1udSbP1wZpcLSAAikAyDuJNS932uQlrzdCRbx1IjDa5VbwhyAl27tpzJ1CTPx8P6rN
         lWecl5nTpsEjGnvBniujmo4hB3SNHXJyPejb//WIzokHXrLRLwHmz7bBDh7F1JvrVr8K
         1p56/rf/L9IaEBeENDjQ95DKFweFDCXsD6y7mRRlXooyTw0B7DT3WY4JoP/RtBNgkp34
         lcKoHpPRUFOanq4T6uJ5vb1RgDnrpLQvFx/oy7lcJjasU/qglbpgXxQPr6glxTrkng5t
         KTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701683679; x=1702288479;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUsWs1Nvk+Jou3+4Sjpg4bycXQIYoHKO7jqfrQ8ZCms=;
        b=h9ZhrxF8pU1VzXmQFv62XGhq22Q0boAMhb9xXnzgDy9qcvv7ytxnyZK7kSV7fIcUJq
         p47IR34gDWs2mhgizScMcWzgl0IgyrO0lJpgGHfQeh6240KhpX3IpyAHLVXL6N8EJNWr
         m1DETuETafkJrq5ZE6Qc6Sgvn0PYp2NJWaVV5KWp2a0Ew/2sJ3lnDxo5pBYltop4WfPD
         gUtoZhVqUVp/YN5sh1F5QaozJcV/hkV96fbAEmrb4ksaFVEr4pObBvYWV8uJKgeuact/
         sEofw42faNMDRr5Cx7YnZ1fu25BYrXDPqyd1BuvtoAaFoGq++ccQUaRysnX53mhxbFm8
         AxWQ==
X-Gm-Message-State: AOJu0YwdUa7GIw8TyrEZzcdB/ULevJm6NlTkQZfx6NnYyAqyJ5vXlaSg
	eWEmOjlwuk2hypl5dkk69CcWn++Gpl00VNkF4ll00g==
X-Google-Smtp-Source: AGHT+IHPMq8cYQ67dLAceR4HoLFnxH0xvjOES1gCYUV17Diouoj2bI+S/BdXbWsamChxOsIk3L3g7vT6yVsJX4MYsU8=
X-Received: by 2002:a17:90a:e7c2:b0:285:92c6:cc26 with SMTP id
 kb2-20020a17090ae7c200b0028592c6cc26mr1026221pjb.40.1701683679503; Mon, 04
 Dec 2023 01:54:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201161652.1241695-1-vincent.guittot@linaro.org>
 <20231201161652.1241695-3-vincent.guittot@linaro.org> <20231202233812.cq2nodia3estdexy@airbuntu>
In-Reply-To: <20231202233812.cq2nodia3estdexy@airbuntu>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 4 Dec 2023 10:54:28 +0100
Message-ID: <CAKfTPtBcF=sL6O17Vq-zCwqp48LNN46oTG=Drs5=MEh=gbuxPw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] sched/fair: Simplify util_est
To: Qais Yousef <qyousef@layalina.io>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, corbet@lwn.net, 
	alexs@kernel.org, siyanteng@loongson.cn, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, lukasz.luba@arm.com, hongyan.xia2@arm.com, 
	yizhou.tang@shopee.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 3 Dec 2023 at 00:38, Qais Yousef <qyousef@layalina.io> wrote:
>
> On 12/01/23 17:16, Vincent Guittot wrote:
>
> >  /*
> >   * The load/runnable/util_avg accumulates an infinite geometric series
> >   * (see __update_load_avg_cfs_rq() in kernel/sched/pelt.c).
> > @@ -505,9 +469,20 @@ struct sched_avg {
> >       unsigned long                   load_avg;
> >       unsigned long                   runnable_avg;
> >       unsigned long                   util_avg;
> > -     struct util_est                 util_est;
> > +     unsigned int                    util_est;
> >  } ____cacheline_aligned;
>
> unsigned long would be better?

I thought about changing it to unsigned long but I prefered to keep
using the same type as before for the ewma as we don't need to extend
it
