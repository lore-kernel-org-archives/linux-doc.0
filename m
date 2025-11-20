Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439BE32D0EF
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 11:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763637711; cv=none; b=R6X7LwTHPq4i/Ti38bE0BE6zU0heyeba1KnVqmhGVVcu4h9DdiJflqfQTjpoijA+G0dR01ghTAsvqxaLtQGvm2c5ZVPyv7/To7S085ELg22fwoy2W7qX0LVOxPmxfqyuInpRHP7a7I6jNg+ThD09UDDPa+s+hAV899Q9tgZcn/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763637711; c=relaxed/simple;
	bh=5ATCu+GZq1Ng+yp0pYSAT059uJi4JWZCJieF2U4iNo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SaiTyLy5YV4flOKNSatrwoybhl3vOwavbWtMTVA1E8ZXgdWg6vpEp8j1yEXbEuVm+vbmorZYz9z0/kDoIBcYHLHBWP93xyWCREOjDNgUCOq4KImg0OJ1Pw+hWqyDdYie5mGtPhdydlbk8yA7IO0x+/Pa0QjVQ5t9m93PZ4mKC3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FxgSgZY/; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FxgSgZY/"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ee0ce50b95so16268231cf.0
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 03:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763637708; x=1764242508; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZI9OvNHyteLma7cxTfxeTFiEdiK8jrJPjX74p/zZ2dY=;
        b=FxgSgZY/MvTssijZtAMPb/cYA2JqWv2s1irTIwkCbNIx9u0l9/90vYzaQR7XZOcdc5
         FKIrtt7WeYew6aIj3E/t6gM+3VQh3v75IiegZqPGD0ngQjwf3G7Rl86NleU9cyJkAgwN
         +v4OqjmxX/fqJKzliSUiNbUil4Qu+/fZF5HZgSPwZgrfrQeDVpepqAvubcuJXm6eaxMj
         ENZySuaZx3lQD3Q9+9o3MPD+71728UO8NJmmq0UeVy4HHoByyWDnGAtQW4UpPPAzmxZR
         u5MFhU9Gfk+FijNaVCrqL2QZDXTQtaEO+VYvMdH9ctyfLkTTAv8SVWlvOZwL7KojjeBM
         r/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763637708; x=1764242508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZI9OvNHyteLma7cxTfxeTFiEdiK8jrJPjX74p/zZ2dY=;
        b=EHXzeUd3yvkkjEIffQ7miUJFLJ8ddyB1Jdn3TkjslkvglzSVGhWi5jU0R2chWofGlp
         6zMrP0gHIUzPv3P4nxsFNXZLDIHvE8sHNrlzoO84rVdELrRCeALwVZhUwUK3zDAGaNJZ
         Z3+JaMCKA2tvagsQJre/GxRGa8LtAKK2e0g0+PCGL0pXuctqETgAjY3495lvA4XWgLsp
         HMQFpmeEIu2wdbO21s2KnbFmH+oDf3kabjaGVMiPBelOUYwRZYCVebPvLcaGJ1r6/mcR
         XGxbPIQzjAUQisNjnT4lw4g00JGyTdBRQqHQVclZqKaaVTaO/qC3OWdnyjcEGRnH5kvL
         T72A==
X-Forwarded-Encrypted: i=1; AJvYcCUIarBrNG40c7qvVmz5qO2xIdK7N6elE2ogU+1ETbOtOiCJ23oLEI09ClnJPHYTNkHeep4t5hkEmqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMOEIyUV27tPsjRPEoQiFR6S6FFVRQP/0ZMUskSGjTAyhXTWji
	WR9Goqwx/jNF/EQKfRXOAhu5RASCo0glLfdod1H8O3yFWMyKlGgSGNPP/AqvPIdd4mSmu+2Ydbr
	fZp637Q1Er9JeBysNjY/G9l8NpC1kOxSrXLruj1BwEw==
X-Gm-Gg: ASbGnctoglh2OZlCAbx3x9elOJO8v6WZCw14irIgXZmA5gyvpkQLfdioMHTr1r6nvuJ
	j6+9wmV32QFp2gMYfSIJGjCDLx3RcClWAB4TPtiT/WNYwg837VcyfQQm7+4aueXaNpistYGbnph
	yxtjXyqoCAobe51cV8C2l3jCkqrqCyy8/sxVCfoOTx94kL83m5j6l0pFeWivmCfUxVrEMMrQMl7
	yLDzuXKPReFpcM+G3fiGZFJEzYL5qCXdKa+afe/BwJMLdDVFULkF0lyR2gHcMwVHHLNR5OQixSN
	Ia7OJwi2d00/QWqLITAMfCFm+P0Q
X-Google-Smtp-Source: AGHT+IHIV7zUxX7vwPq1KtOa4ec6yAwSEMzkL8MwxJxJvLc9J7RQ3VXe0x+vXH5Cd+BIqWwNLNkHjzlSJPaVZhF8NOE=
X-Received: by 2002:a05:620a:29c9:b0:8a2:d235:8136 with SMTP id
 af79cd13be357-8b32acf12ecmr207316385a.25.1763637708007; Thu, 20 Nov 2025
 03:21:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org> <20251118-james-cs-syncfreq-v5-10-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-10-82efd7b1a751@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 20 Nov 2025 11:21:36 +0000
X-Gm-Features: AWmQ_bknpz8FJJonzf_St5zSPFDMr0k02Qpchp7EFZ42n9c20DmPXOAgT7c9Ghk
Message-ID: <CAJ9a7VgQO0_FuZj2CD0yAW10xefJNmqRC-0DxJTG9FJu6h-o6A@mail.gmail.com>
Subject: Re: [PATCH v5 10/13] coresight: Remove misleading definitions
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
>
> ETM_OPT_* definitions duplicate the PMU format attributes that have
> always been published in sysfs. Hardcoding them here makes it misleading
> as to what the 'real' PMU API is and prevents attributes from being
> rearranged in the future.
>
> ETM4_CFG_BIT_* definitions just define what the Arm Architecture is
> which is not the responsibility of the kernel to do and doesn't scale to
> other registers or versions of ETM. It's not an actual software ABI/API
> and these definitions here mislead that it is.
>
> Any tools using the first ones would be broken anyway as they won't work
> when attributes are moved, so removing them is the right thing to do and
> will prompt a fix. Tools using the second ones can trivially redefine
> them locally.
>
> Perf also has its own copy of the headers so both of these things can be
> fixed up at a later date.
>

The perf version is used to reconstruct the control registers for etm3
/ etm4 to put into the trace metadata headers in the perf.data file
for the decoder to be intitialised correctly.

perf_event_attr::config uses the ETM_OPT_* values, used directly for
etm3 since they match the bit pattern in the etm3/ptm config register,
and remapped for etm4 from ETM_OPT_* to equivalent ETM4_CFG_BIT* for
the etm4 config register.

The reason we do this re-construction - rather than read registers as
we do for the other metadata - is that the register value is not set
at the point we are recording the metadata - it does not actually get
set until the etm is enabled, later in the perf process.

On this basis it would seem that any changing of the attribute bit
ordering has potential to break perf decode. Probably safe to remove
from this version of the file though, but overall, changing bit
meanings in the underlying variable may possibly need a fix in perf
and  potentially a breaking change for earlier versions of the tools.

That said, for this particular version of the header, since it appears
to no longer need the values due to earlier changes.

Reviewed-by: Mike Leach <mike.leach@linaro.org>

> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  include/linux/coresight-pmu.h | 24 ------------------------
>  1 file changed, 24 deletions(-)
>
> diff --git a/include/linux/coresight-pmu.h b/include/linux/coresight-pmu.h
> index 89b0ac0014b0..2e179abe472a 100644
> --- a/include/linux/coresight-pmu.h
> +++ b/include/linux/coresight-pmu.h
> @@ -21,30 +21,6 @@
>   */
>  #define CORESIGHT_LEGACY_CPU_TRACE_ID(cpu)  (0x10 + (cpu * 2))
>
> -/*
> - * Below are the definition of bit offsets for perf option, and works as
> - * arbitrary values for all ETM versions.
> - *
> - * Most of them are orignally from ETMv3.5/PTM's ETMCR config, therefore,
> - * ETMv3.5/PTM doesn't define ETMCR config bits with prefix "ETM3_" and
> - * directly use below macros as config bits.
> - */
> -#define ETM_OPT_BRANCH_BROADCAST 8
> -#define ETM_OPT_CYCACC         12
> -#define ETM_OPT_CTXTID         14
> -#define ETM_OPT_CTXTID2                15
> -#define ETM_OPT_TS             28
> -#define ETM_OPT_RETSTK         29
> -
> -/* ETMv4 CONFIGR programming bits for the ETM OPTs */
> -#define ETM4_CFG_BIT_BB         3
> -#define ETM4_CFG_BIT_CYCACC    4
> -#define ETM4_CFG_BIT_CTXTID    6
> -#define ETM4_CFG_BIT_VMID      7
> -#define ETM4_CFG_BIT_TS                11
> -#define ETM4_CFG_BIT_RETSTK    12
> -#define ETM4_CFG_BIT_VMID_OPT  15
> -
>  /*
>   * Interpretation of the PERF_RECORD_AUX_OUTPUT_HW_ID payload.
>   * Used to associate a CPU with the CoreSight Trace ID.
>
> --
> 2.34.1
>


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
