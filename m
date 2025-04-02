Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32FE23770B
	for <linux-doc@vger.kernel.org>; Wed,  2 Apr 2025 15:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743606324; cv=none; b=SAcGcRyYrnLOuoyZ9aeTNTYpGzSGnotHJth67C5XvYz1sbDCkZDVYL2CbEevCOvCQGXpSw6cpEhhss4reBYoKraAwdg/xZKKYk81KBQ/ChYon++fmNwZbWRUNPvuxnNiiVvLihgR6dIbz5TxOySZdC8w4BOWTcQEk3Au8HQFoe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743606324; c=relaxed/simple;
	bh=Unu/61vo2+4T7YVbdaSWpZ6JGVx4x2GuAlhj84lG+Z8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QqeuK7Df6eqHv2+SG1fSogoGZ/5lNvlmQoNJ+7kqNFW7iz8a4jxXvagtS5KDjZDUleKxp2Aiv7dlyivCIkwV8605Jq35nV20wKsYMMqhRAme+ccxl1IySOY4rT2oTuiCkEg/lwPMZjzcIRM3XAJCGgYYqlg4Gexj8OAjHBmhJW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xPyAG5c+; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xPyAG5c+"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-224191d92e4so127155415ad.3
        for <linux-doc@vger.kernel.org>; Wed, 02 Apr 2025 08:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743606322; x=1744211122; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+wfDbDw7PZnoCnsPrhm6swez/hsddVhdthnzc2lFnm0=;
        b=xPyAG5c+LLAT10SdwYUbo6weVsr4ruN73fV8KU9NOuZ+fVPTJIfKFUSXtDSShgct3D
         dkHftIuM9LgBYa+ORlxFo30zZg0Q12wjEgS05BhHUWijQVIsmn2XA3C7x7XoC65GuQBS
         NLHRv1yM15qf4fvDbwrMkcUKMAK8HwzFKtwtODqjNRe2YRXEAThuqkasn9wIEcHy231n
         ModY8MuOBfjw/Rft5AUsJoGTmMW3xiwlcvurH6vME7hlf9h9uN0DBiQ9583TTOHJWQHM
         r6WNTBL4u1cLscxnPPmpgv45Pp02BHL/xudbT9XiKzBz+pVCRfL8qTjT1tGpTXVLUjQ5
         OLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606322; x=1744211122;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+wfDbDw7PZnoCnsPrhm6swez/hsddVhdthnzc2lFnm0=;
        b=tOOpC86e0BjBZp8Wab9POIBITSpO/y0yXKbP1YxH5doqsAgd/mVUnUex8dA+1A95bD
         C1sR19k7flcUZtARtofZPWSJ+oUyyXHL48pXR547RmO5OdLVDU/pwa3beRRW0sffz0ge
         Lv7XpnrK0VbFcw5AXiA6l4G2SQgdAstnv+kGhm3pf99Tkd1L9qe2N88G1uGzWb1dj3Qm
         Un/2Z08YkkJAckJ0PFKuO7yPKYlbmkoM2TAkEjjifwCHcDw9pEV+kPv0vzlyFqtaf5LF
         la7jic/FkmldQFLcB+gCfY5Kq8aOW/OYiamatni6U5RZbw9wr8vurM2KuoM0/cMOm7uh
         baPg==
X-Forwarded-Encrypted: i=1; AJvYcCVKmqfFX1WO7BwQFdwWVf/uZ9ULQO1qpmZxV9hH+LxhEkvJ7kHI55Lbz/oC4UubvsxDpQgrJ7ywdeI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3pi2MqditmiYHglJjORVBzEt5hqnVP/Ga5bJf8k4H38/wq1c4
	wQSA1JwGvw5fTO07y3dx0RDeg3fxxFMqxXqiz25vhkxw5L7XFoYqT2riBPIbEiP+vkqGt+U4usp
	eghKOrvoYkApe02tolCxnKHVTkR25QPKPsV5NnQ==
X-Gm-Gg: ASbGncvZrB7GD98l+3b0R/+2OTfOQ/lLd0s1EHtyq/expUf6RzjWn8K/cqdhLRzWa/H
	I2TzGZ100IfD7NNk7UX8vd7hsBBZcV+zNIMenCsgOSCpncxMbIksBQlzi0hWqau6+eJhU0jlsyZ
	VUHLW/49iU6BfWSP60A9p4JyoC6p0=
X-Google-Smtp-Source: AGHT+IH1ueFnde/tdjqCikl2BWv6iv6T4BIHQaMPIq1f5OwqX63kwGuOYor9s4hDW+z5LXETkM7PQnIIwqfbkXlFKdo=
X-Received: by 2002:a17:902:f608:b0:224:160d:3f5b with SMTP id
 d9443c01a7336-2292fa0cd43mr300305445ad.49.1743606322178; Wed, 02 Apr 2025
 08:05:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401180708.385396-1-leo.yan@arm.com> <20250401180708.385396-6-leo.yan@arm.com>
In-Reply-To: <20250401180708.385396-6-leo.yan@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 2 Apr 2025 16:05:10 +0100
X-Gm-Features: AQ5f1JqPXimSTtAyjfj7SHk-fZPinJru6XpT0nsdzLE3awgdovNvQGTOPPystmk
Message-ID: <CAJ9a7VgTyKfebbYhEG5cGH4HyzU+4FavDXsAxGncXLsDtHSUHA@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] coresight: tmc: Re-enable sink after buffer update
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Leo,


On Tue, 1 Apr 2025 at 19:07, Leo Yan <leo.yan@arm.com> wrote:
>
> The buffer update callbacks disable the sink before syncing data but
> misses to re-enable it afterward.  This is fine in the general flow,
> because the sink will be re-enabled the next time the PMU event is
> activated.
>
> However, during AUX pause and resume, if the sink is disabled in the
> buffer update callback, there is no chance to re-enable it when AUX
> resumes.
>
> To address this, the callbacks now check the event state
> 'event->hw.state'.  If the event is an active state (0), the sink is
> re-enabled.
>
> For the TMC ETR driver, buffer updates are not fully protected by
> the driver's spinlock.  In this case, the sink is not re-enabled if its
> reference counter is 0, in order to avoid race conditions where the sink
> may have been completely disabled.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-tmc-etf.c |  9 +++++++++
>  drivers/hwtracing/coresight/coresight-tmc-etr.c | 10 ++++++++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> index d858740001c2..7584cc03d8e6 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> @@ -482,6 +482,7 @@ static unsigned long tmc_update_etf_buffer(struct coresight_device *csdev,
>         unsigned long offset, to_read = 0, flags;
>         struct cs_buffers *buf = sink_config;
>         struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +       struct perf_event *event = handle->event;
>
>         if (!buf)
>                 return 0;
> @@ -586,6 +587,14 @@ static unsigned long tmc_update_etf_buffer(struct coresight_device *csdev,
>          * is expected by the perf ring buffer.
>          */
>         CS_LOCK(drvdata->base);
> +
> +       /*
> +        * If the event is active, it is triggered during an AUX pause.
> +        * Re-enable the sink so that it is ready when AUX resume is invoked.
> +        */
> +       if (!event->hw.state)
> +               __tmc_etb_enable_hw(drvdata);
> +

Think that the  refcnt should be checked here too.

Does the  ETB case need to be handled? - somewhat confusingly the
coresight-tmc-etf.c file handles both ETF and ETB.

Regards

Mike


>  out:
>         raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index 76a8cb29b68a..8923fbc6e1a0 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1636,6 +1636,7 @@ tmc_update_etr_buffer(struct coresight_device *csdev,
>         struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>         struct etr_perf_buffer *etr_perf = config;
>         struct etr_buf *etr_buf = etr_perf->etr_buf;
> +       struct perf_event *event = handle->event;
>
>         raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>
> @@ -1705,6 +1706,15 @@ tmc_update_etr_buffer(struct coresight_device *csdev,
>          */
>         smp_wmb();
>
> +       /*
> +        * If the event is active, it is triggered during an AUX pause.
> +        * Re-enable the sink so that it is ready when AUX resume is invoked.
> +        */
> +       raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> +       if (csdev->refcnt && !event->hw.state)
> +               __tmc_etr_enable_hw(drvdata);
> +       raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +
>  out:
>         /*
>          * Don't set the TRUNCATED flag in snapshot mode because 1) the
> --
> 2.34.1
>


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
