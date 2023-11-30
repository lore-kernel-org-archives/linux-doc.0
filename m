Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RHlONaNT"
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE6A21A4
	for <linux-doc@vger.kernel.org>; Thu, 30 Nov 2023 06:56:07 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-285b3a14b12so1003928a91.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Nov 2023 06:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701356167; x=1701960967; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5jnslBvWjxL849QqKtDKP6TkAe33VNDOFl/nnQyVf2o=;
        b=RHlONaNT93l6uuTFUj+hnOa466Y+v+6MdiiJ49JmfwpaHdFcJn7j1El4jnTOBzISzs
         rkBpYQh77RQz6rrSJWr6Sdq3iRDwiBA6NiLss9ENfo0iVcbtHpt9bEyyw9TnpRUrnk19
         YMHPQYKQ4P/zLcGcOfgGMIr2wKCMJPY/OCs2Xc5QGgkLZPcmHR0B0znUU5tfm/RCHwOf
         aiCMzpZuzHvAN4N7dOUCNbydr+S2PVrtMJkPJVreyfwVp6jv4l86pl24jOylnsMKtPZz
         W8FKigPSfUoWkFpQUC4W/L35J3PTkf6z+2qd3MaLEhohbRiaM3n8Zx0Nvg047UjISwfT
         10/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701356167; x=1701960967;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5jnslBvWjxL849QqKtDKP6TkAe33VNDOFl/nnQyVf2o=;
        b=G2eDFeBuXEo/i4yaj/Sw6KduR0CDhc+MxdU1voSkiMKehiciRA+y+xDdTu0TcPZp9H
         Apxnt8bp5Nsr/mOKdu4uXcVdCH/UlYofuXNAwLW+9roZXxTyS/xG8vengEaytOZEuDJ6
         kpYGzKIc0DRuPsUtA/6TllBaLkUc8YZXs6DrMYVCyOxevYUPDWHEe9NTEX98wzZG8ud2
         t6jh5pwil3s0vRU3sueRz+5yhjJAqF0UUigeEQoKmOaR+Z++TF9d9HNDPlMQV8ml/Gl7
         vS1crodi2TVFSZY28JGhic7lbP2MrjxpOXQSmWJN0l0RZ3ja5MOc2XxHjjQa9Jo3eoZg
         KiAg==
X-Gm-Message-State: AOJu0YwhJ36It7QjoaTTSc763Wna1EpIcra/vbFLeBRo7zs2xif+6F37
	gNUAD9dHKMdQdEe/0B287Qp5LUVQjQKhnEmgG+7cVg==
X-Google-Smtp-Source: AGHT+IETknovbQYtURTxySOTRgstT+/ks+IwT+pDmsfJ9l+GWBq2hd5ZLsBHJJvigzUFbVsU0Y6qwELfNdriGmuNRr8=
X-Received: by 2002:a17:90b:1c8b:b0:27c:f309:f381 with SMTP id
 oo11-20020a17090b1c8b00b0027cf309f381mr22425588pjb.6.1701356167145; Thu, 30
 Nov 2023 06:56:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127143238.1216582-1-vincent.guittot@linaro.org> <f20c8c30-1379-4706-b980-73d2f7e5912a@arm.com>
In-Reply-To: <f20c8c30-1379-4706-b980-73d2f7e5912a@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 30 Nov 2023 15:55:55 +0100
Message-ID: <CAKfTPtAhnH8eREUEKo_5hJszxjNhug2HjJwKzqZ99SpvsmVRfg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Simplify Util_est
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: hongyan.xia2@arm.com, mingo@redhat.com, alexs@kernel.org, 
	linux-kernel@vger.kernel.org, vschneid@redhat.com, bristot@redhat.com, 
	bsegall@google.com, rostedt@goodmis.org, dietmar.eggemann@arm.com, 
	peterz@infradead.org, juri.lelli@redhat.com, mgorman@suse.de, corbet@lwn.net, 
	siyanteng@loongson.cn, qyousef@layalina.io, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Nov 2023 at 13:52, Lukasz Luba <lukasz.luba@arm.com> wrote:
>
> Hi Vincent,
>
> On 11/27/23 14:32, Vincent Guittot wrote:
> > Following comment in [1], I prepared a patch to remove UTIL_EST_FASTUP.
> > This enables us to simplify util_est behavior as proposed in patch 2.
> >
> > [1] https://lore.kernel.org/lkml/CAKfTPtCAZWp7tRgTpwJmyEAkyN65acmYrfu9naEUpBZVWNTcQA@mail.gmail.com/
> >
> > Vincent Guittot (2):
> >    sched/fair: Remove SCHED_FEAT(UTIL_EST_FASTUP, true)
> >    sched/fair: Simplify util_est
> >
> >   Documentation/scheduler/schedutil.rst |  7 +--
> >   include/linux/sched.h                 | 35 ++----------
> >   kernel/sched/debug.c                  |  7 +--
> >   kernel/sched/fair.c                   | 81 ++++++++++-----------------
> >   kernel/sched/features.h               |  1 -
> >   kernel/sched/pelt.h                   |  4 +-
> >   6 files changed, 43 insertions(+), 92 deletions(-)
> >
>
> I recovered my pixel6 and applied these changes.
> No power regression in Jankbench. No performance regression in GB5.
> Better score in Chrome running Speedometer +3..5%.

Thanks for testing

>
> The code looks much more clean, without the 'struct util_est'
> (we will have to adjust our trace events to that change but it's worth).

Same for me

>
> Also, I was a bit surprised that the UTIL_EST_FASTUP wasn't helping
> that much comparing to that new 'runnable' signal for the
> underestimation corner case...
>
> Reviewed-and-tested-by: Lukasz Luba <lukasz.luba@arm.com>

Thanks
