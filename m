Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DCA204C0D
	for <linux-doc@vger.kernel.org>; Tue,  1 Apr 2025 14:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743518160; cv=none; b=b/Tf5kUIa+eiyMsTkNRmVv+fLF21muf+p2DajyRwZFlhnPV1qEdJkKZI1UcmJnkIFVJFCmz5nRfr/36BJntIVgDcVStKDHgOwR1M4FgMr367FkilmBnTP0yzMQAMCkWBkkm9Jg3Fbu7G7n3j1T5NjoB9P1ghO1BfkVCXN3ntCiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743518160; c=relaxed/simple;
	bh=FnEOMPtHXvmXWNykCouBSk3dwHkhqcz3bglrKwEvwl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FXQHwuq0Za8jLAM7G8j/wTl6jfRJpBC06VVtY1sR2Cd7IbU1FAdJQQWICWUo7PV5RcH03mFpdLzX+n4BQDCwyxWa8TdNIYnkDQDLbPR7jufbE3xrDiXMA4dXsBlYhLdbq5llvui+/K41gTIw5bIkAy/T11nXlRlmFn2/FP17/vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KtvC7N/y; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KtvC7N/y"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-225df540edcso121984325ad.0
        for <linux-doc@vger.kernel.org>; Tue, 01 Apr 2025 07:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743518158; x=1744122958; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LoMDKExd/0DHBDdQYNCjd1xpr7uBzJ6GzizlZJKTOo8=;
        b=KtvC7N/y48XI07BhkMDPUFv3HRJuN7zO57vOsjX+ulDYfUCQIGuWV/+vvs6Rvcq8su
         7PZh2h9Cu943CWtF0HQw2gMkZL48Cg3IqGjTk449loVTUNW8uBRfimh8cVfy7EmShpkT
         D+bFbnApJxzqCFJxNweP357MtDdy6qf35F6LWwUISGjfSm/vCW9fSRv3iSW9CPZG58k4
         fDvNOlRmtCx4EjsXkOiUoEAtJmbqTFHyxmp8le2HNGrA7L8pKaWbfqlWCIP6DZUqLfcK
         IBs93UAX9kaDxQRsU7Gzhqu0HWaAlu5cl1OTTXqsBuuulWUAIYYWDGVD81JBV51h9Llo
         yBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743518158; x=1744122958;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LoMDKExd/0DHBDdQYNCjd1xpr7uBzJ6GzizlZJKTOo8=;
        b=rDjdkXoIe69UIs2+e8fc6QICYawHjIK4oASF//zt2p5sIGDkGVmgJZ7kI9geV9b7ve
         AZvJBoftAYKgDUWzyPkRykO0OIuqHBNmL9C80ULkjR5Ae2lxIZ8K7Dqdy5ZbdKqXYvaw
         RqqI17Y0G3iOtYaPd3JxfM7SDwKT/WsuGAxdwGFaD3DVYcd7rM8NbzZvFmDjhGKS/ql7
         iuk+vTM51oRD+QqQSk8qLGBl1kShiESWgidvBwZmyG2OnPRiNJvi5S0npp8FWAKhAQE/
         1RnrKrTbZ1XJktC310IBT7aUJcKZolQZK2Or4muijul9YAK83MA4hjLCVagPajylrzP1
         H3uw==
X-Forwarded-Encrypted: i=1; AJvYcCWFQZw1qhVReIzNr7WxOrNCMtjn1trKbU/sCS6mXPiyK4Wv7TPGovoBfr7guEdZGIFOPD2XAlj5Shg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiFtyzQbpL1zfFJMvwNdXLedlEIrWHks3aBcGHImjkCCGLrxMm
	HboW9izIDzbJKd8BDxG/VruNvm0QNzb9I94WGYhpfXxsx6mqqnJbl21JLurFUfzQ65oO7ufO/Db
	YlWc5vqYV5/Sz5D5XW8pPOoH56WPuI7Snch2xPhefW5SYF2Uz
X-Gm-Gg: ASbGncu+QiDf8trKBOOArBbCpzsKcw72P2tSf6CjrYwb6I5qgPmpjU8+kow2uCoaw4J
	AxNTRTgyeLnu9WJqMv2iEmSBt5lnXCcBhh9CWK8CX8jyOkZ5kI5Mk2JxpZUP/P8dDm0tYPR50nb
	Hs6f1ScO9eIZ8hIEMiWLbTJECF6+k=
X-Google-Smtp-Source: AGHT+IElYmfVb2yc9aONM2WA1fcc0/ZsfWcagvHUfiuxnFsCoq1ML/YcfpJWjED2Sr70PTdeBFSXfVPfj6mWtcfTrTQ=
X-Received: by 2002:a05:6a00:391f:b0:736:9f2e:1357 with SMTP id
 d2e1a72fcca58-739c43b578cmr278533b3a.12.1743518157532; Tue, 01 Apr 2025
 07:35:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311170451.611389-1-leo.yan@arm.com> <20250311170451.611389-6-leo.yan@arm.com>
 <8d9ad64b-a5f7-4a44-a557-7edb83322fdf@arm.com>
In-Reply-To: <8d9ad64b-a5f7-4a44-a557-7edb83322fdf@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 1 Apr 2025 15:35:44 +0100
X-Gm-Features: AQ5f1Jq5eJSb33lj_lNuU5GhQT-ygaUHLr5aCzHY0xeQqpsFwQFKMr8XTLIXVPw
Message-ID: <CAJ9a7ViUOZEyvqe-KGc-UdhmkqXpPdSeBWjk-=u1tAjFKu5Y+A@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] coresight: perf: Update buffer on AUX pause
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Leo Yan <leo.yan@arm.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Apr 2025 at 13:52, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> On 11/03/2025 17:04, Leo Yan wrote:
> > Due to sinks like ETR and ETB don't support interrupt handling, the
> > hardware trace data might be lost for continuous running tasks.
> >
> > This commit takes advantage of the AUX pause for updating trace buffer
> > to mitigate the trace data losing issue.
> >
> > The per CPU sink has its own interrupt handling.  Thus, there will be a
> > race condition between the updating buffer in NMI and sink's interrupt
> > handler.  To avoid the race condition, this commit disallows updating
> > buffer on AUX pause for the per CPU sink.  Currently, this is only
> > applied for TRBE.
> >
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >   .../hwtracing/coresight/coresight-etm-perf.c  | 43 ++++++++++++++++++-
> >   1 file changed, 41 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> > index 2dcf1809cb7f..f1551c08ecb2 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> > @@ -574,14 +574,53 @@ static void etm_event_start(struct perf_event *event, int flags)
> >       return;
> >   }
> >
> > -static void etm_event_pause(struct coresight_device *csdev,
> > +static void etm_event_pause(struct perf_event *event,
> > +                         struct coresight_device *csdev,
> >                           struct etm_ctxt *ctxt)
> >   {
> > +     int cpu = smp_processor_id();
> > +     struct coresight_device *sink;
> > +     struct perf_output_handle *handle = &ctxt->handle;
> > +     struct coresight_path *path;
> > +     unsigned long size;
> > +
> >       if (!ctxt->event_data)
> >               return;
> >
> >       /* Stop tracer */
> >       coresight_pause_source(csdev);
> > +
> > +     path = etm_event_cpu_path(ctxt->event_data, cpu);
> > +     sink = coresight_get_sink(path);
> > +     if (WARN_ON_ONCE(!sink))
> > +             return;
> > +
> > +     /*
> > +      * The per CPU sink has own interrupt handling, it might have
> > +      * race condition with updating buffer on AUX trace pause if
> > +      * it is invoked from NMI.  To avoid the race condition,
> > +      * disallows updating buffer for the per CPU sink case.
> > +      */
> > +     if (coresight_is_percpu_sink(sink))
> > +             return;
> > +
> > +     if (WARN_ON_ONCE(handle->event != event))
> > +             return;
> > +
> > +     if (!sink_ops(sink)->update_buffer)
> > +             return;
> > +
> > +     size = sink_ops(sink)->update_buffer(sink, handle,
> > +                                          ctxt->event_data->snk_config);
>
> I believe we keep the sink disabled/stopped in update_buffer. We need to
> turn it back ON after the "buffer update". May be we could use a flag
> to update_buffer() to indicate this is "pause" triggered update.
>
> Cheers
> Suzuki
>

The sink is stopped to read data, but also important is the
enable/disable refcount. The only time that "update_buffer" will read
is if the sink has a refcount == 1. These are ultimately controlled by
enable/disable path - which will not occur during pause/resume
operations.


Regards

Mike

>
> > +     if (READ_ONCE(handle->event)) {
> > +             if (!size)
> > +                     return;
> > +
> > +             perf_aux_output_end(handle, size);
> > +             perf_aux_output_begin(handle, event);
> > +     } else {
> > +             WARN_ON_ONCE(size);
> > +     }
> >   }
> >
> >   static void etm_event_stop(struct perf_event *event, int mode)
> > @@ -595,7 +634,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
> >       struct coresight_path *path;
> >
> >       if (mode & PERF_EF_PAUSE)
> > -             return etm_event_pause(csdev, ctxt);
> > +             return etm_event_pause(event, csdev, ctxt);
> >
> >       /*
> >        * If we still have access to the event_data via handle,
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
