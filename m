Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FB41E2606
	for <linux-doc@vger.kernel.org>; Tue,  1 Apr 2025 10:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743503469; cv=none; b=jGDQRbvRCPpmWcOqhSH5udnmRfH6xaUQiND78Cr7S9yNyBb9AbZisNQn6SWO0b7GDIl4xau+6LAHuBXFENWbUqOdgWoAq/mlONMNBo3fRcIjlr0+6GhyDiQaLl34pehYadoHm/7NPCc2sEKHJUzI48VQWmYeIP5JbvOa8DgOuZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743503469; c=relaxed/simple;
	bh=QqFM1vfQjGdP0K2150jiwwrgTgAFp5WKlwXkWvT30yk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O1m58i3k74qZHyzBCx8s25RLrgHYaRSkJLvPwZTzbLRP1a0ZTYWp9Ahhk4g0MzzR8nsWagvTDPz2Ez5/uzW97qNqaZ2axAerelPjWVSNvSx3mnlhkE2reGuJ9ArpaMI2Dr0JfGEePB3ob/THawn7QT/fXD3dpXscTtY+ZOA1Y6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i6rbVCy0; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i6rbVCy0"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-224019ad9edso21173945ad.1
        for <linux-doc@vger.kernel.org>; Tue, 01 Apr 2025 03:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743503467; x=1744108267; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bdu1GymYGk23uvATKjkOqthpfEU/FO+XWbjGjjdLCmg=;
        b=i6rbVCy0pjEIBxIk83zMABH5XPfv4TFXtf5GlwH1AlxtijaiK6thjsWFAkSG7ysMAO
         MOrXTQeJ3XkoS9QVISfp3Hu7X4mg4rDTbXQe9LOeAKTNweAb1cKTkidYTp2KDcYvLX9U
         zVF1kC5GDgHYkR/nbVzHLJho1CFHtMN6A9U3N2Yp3CFZB0F/jqAAaPN/K1SGU7pMol9Q
         eZ47vVblwxjCQOl7zO7Cwc3KTUv0EymQoZgIGUF7L8wReS/jZFqmzgMn4KDY9li3yTJ6
         z76rS+ye9mzLLMJOBMvKuxTficJQQZssJ7C1M5wapgmuhKJSfJdm/l5vnHm//l5ZFRtv
         Yqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743503467; x=1744108267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdu1GymYGk23uvATKjkOqthpfEU/FO+XWbjGjjdLCmg=;
        b=vojoI4FnPbaSONhiDKHT6zxG3ahwrlb5934nHgycaUj2RbdYV0oTj79T3pG8lOxWVf
         d0XEUe8N81/Hp+MVh4Yebik3EdAr208hMP7Uidauxw2XWNk593lUkgFEOZqIP8v+F8SC
         YnhghYV0tYU34tNY0/oMTe3rFFO2hsbsdYdOBCb+5PY0i3yyQF9xUor/nBiLZeYRTO8z
         0RU42n+EsBbjj5LFTAgUYMuSLS8+lCXeacOMhfgCiyHG3/FfIGqKyMECRYyEUP/bZfcn
         oW3oLLAfX9HoGA+OOO1JbwjIRvlRmXkVJgZOYIl3BFppD7LWLwCkZu893HaPv2Z8zPF6
         OpWw==
X-Forwarded-Encrypted: i=1; AJvYcCXHQci8VL4s0TrNTYW1U+HyoNM57NKifUos82r4gOgNoeg49JI24rfZd4wF/Mi8da2yM92Q6KaabqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWqzmnIjezYdHmx2aWMXdA4+PWZBx4p8sBt9/KtyWdAYFgZhC6
	eU+HeTYp3w0InNGURiug882I70CMGy9ZNLbW0dkFK9bUsCy3h66TVrTJ/tpytBh45r1h1RrHHRI
	v6rLvbrLU066Eogs0Qg9+HqNS8siW5uPlyDC5IQ==
X-Gm-Gg: ASbGnctM4VcGsG6+zZ6B/nryfVxYnYxBQ72o/piiNbxGzq3NusxbluTVDJPuimQ4gqB
	08T5sZxUaCRiYpHGN68ZB01BHRCnOyPDDmeyglRi9WqyidZ9pcErz8/gCe43vtEIeLCpf0X6kpE
	X/Ah6n4Kf414QREoqGqTgFbuFroXewiz4uICudQA==
X-Google-Smtp-Source: AGHT+IHTkvNe0ilh/P95MoDbxvfJtDi6TR93LnesNUxLFdWsIE/Px5Q1l9yNZZvD2lf1p5NcKRG1U03AkQgQjCO8L1s=
X-Received: by 2002:a05:6a00:218d:b0:736:fff2:99b with SMTP id
 d2e1a72fcca58-7398045dfecmr21978181b3a.23.1743503462715; Tue, 01 Apr 2025
 03:31:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311170451.611389-1-leo.yan@arm.com> <20250311170451.611389-4-leo.yan@arm.com>
In-Reply-To: <20250311170451.611389-4-leo.yan@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 1 Apr 2025 11:30:51 +0100
X-Gm-Features: AQ5f1JrhoMjcpCkzXCXq-qk91PQYs0xMOO4GtS2OMtCAe1f01A9RYiWD2k0hQzw
Message-ID: <CAJ9a7VjbCTzycnYUMyCJbVhFpwqhTA6b7LSxtyiELqBii8iW4w@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] coresight: etm4x: Hook pause and resume callbacks
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Mar 2025 at 17:05, Leo Yan <leo.yan@arm.com> wrote:
>
> Add callbacks for pausing and resuming the tracer.
>
> A "paused" flag in the driver data indicates whether the tracer is
> paused.  If the flag is set, the driver will skip starting the hardware
> trace.  The flag is always set to false for the sysfs mode, meaning the
> tracer will never be paused in the case.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  .../coresight/coresight-etm4x-core.c          | 42 ++++++++++++++++++-
>  drivers/hwtracing/coresight/coresight-etm4x.h |  2 +
>  2 files changed, 43 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 53cb0569dbbf..5b69446db947 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -577,7 +577,8 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>                 etm4x_relaxed_write32(csa, trcpdcr | TRCPDCR_PU, TRCPDCR);
>         }
>
> -       rc = etm4_enable_trace_unit(drvdata);
> +       if (!drvdata->paused)
> +               rc = etm4_enable_trace_unit(drvdata);
>  done:
>         etm4_cs_lock(drvdata, csa);
>
> @@ -820,6 +821,9 @@ static int etm4_enable_perf(struct coresight_device *csdev,
>
>         drvdata->trcid = path->trace_id;
>
> +       /* Populate pause state */
> +       drvdata->paused = !!READ_ONCE(event->hw.aux_paused);
> +
>         /* And enable it */
>         ret = etm4_enable_hw(drvdata);
>
> @@ -846,6 +850,9 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
>
>         drvdata->trcid = path->trace_id;
>
> +       /* Tracer will never be paused in sysfs mode */
> +       drvdata->paused = false;
> +
>         /*
>          * Executing etm4_enable_hw on the cpu whose ETM is being enabled
>          * ensures that register writes occur when cpu is powered.
> @@ -1080,10 +1087,43 @@ static void etm4_disable(struct coresight_device *csdev,
>                 coresight_set_mode(csdev, CS_MODE_DISABLED);
>  }
>
> +static int etm4_resume_perf(struct coresight_device *csdev)
> +{
> +       struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +       struct csdev_access *csa = &csdev->access;
> +
> +       if (coresight_get_mode(csdev) != CS_MODE_PERF)
> +               return -EINVAL;
> +
> +       etm4_cs_unlock(drvdata, csa);
> +       etm4_enable_trace_unit(drvdata);
> +       etm4_cs_lock(drvdata, csa);
> +
> +       drvdata->paused = false;
> +       return 0;
> +}
> +
> +static void etm4_pause_perf(struct coresight_device *csdev)
> +{
> +       struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +       struct csdev_access *csa = &csdev->access;
> +
> +       if (coresight_get_mode(csdev) != CS_MODE_PERF)
> +               return;
> +
> +       etm4_cs_unlock(drvdata, csa);
> +       etm4_disable_trace_unit(drvdata);
> +       etm4_cs_lock(drvdata, csa);
> +
> +       drvdata->paused = true;
> +}
> +
>  static const struct coresight_ops_source etm4_source_ops = {
>         .cpu_id         = etm4_cpu_id,
>         .enable         = etm4_enable,
>         .disable        = etm4_disable,
> +       .resume_perf    = etm4_resume_perf,
> +       .pause_perf     = etm4_pause_perf,
>  };
>
>  static const struct coresight_ops etm4_cs_ops = {
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index bd7db36ba197..ac649515054d 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -983,6 +983,7 @@ struct etmv4_save_state {
>   * @state_needs_restore: True when there is context to restore after PM exit
>   * @skip_power_up: Indicates if an implementation can skip powering up
>   *                the trace unit.
> + * @paused:    Indicates if the trace unit is paused.
>   * @arch_features: Bitmap of arch features of etmv4 devices.
>   */
>  struct etmv4_drvdata {
> @@ -1036,6 +1037,7 @@ struct etmv4_drvdata {
>         struct etmv4_save_state         *save_state;
>         bool                            state_needs_restore;
>         bool                            skip_power_up;
> +       bool                            paused;
>         DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
>  };
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
