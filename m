Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB7C350D72
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 15:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763654370; cv=none; b=L5tPlAyUBECKT+0VUfgomyGmOcTLAQvg0WIBi8nSHdjhJ8OF474tpbhwcPLYWSb1OcdI3r9LQmXMLOEwG6iSFFunAq8iiKZLkdouGcIDXwC6/sNgc/fvY1EQUuNbJFVHNV200AuPKZNKzLXZkmkK8yj27dZgrBh4SoSZWL4O1sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763654370; c=relaxed/simple;
	bh=5hJ8Ui5TwktvXj7fGVGksMs8cJYowhNWNUl6tR6wgUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uGAoo5LZI6DMIVWcEwt/5RZBkPNGdaUpx1ouxdp18uiO6A5HbOTcraYSkHjsPHlRIFDNEPyF1YMjvRC2ut45zU1D+3Eeup9OMoa8VKrup8jXVSGKcmCB7NjJcQvgg4HhxgFgxhvpikCNe4WGuNpfH83sKJzUFK1/7IBLiXGs+Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wkmkFYmg; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wkmkFYmg"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8b1f2fbaed7so80109185a.2
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 07:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763654367; x=1764259167; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xKzMiSJJ52R4a8UwUG3jpi8BLyMUSMJY3DIfmEVvyjA=;
        b=wkmkFYmg+iG8TyurmlZIr+qKOwKRBuz+Rea9V8lcmWdgLG5B/UNEmyp4jOtWk5p2Pu
         nRwSK5PFTA0dxhU3lwR3sy3ee3nRoF8Tp61ep0e+ogM9tNqCDYHaaKqSs2gPzagVg5OS
         NCjXbX7QlVk2wTjzo/we894j9ALYwUC0r10RV1c8JhDDs1z7Gw/p4rci5BHxfHnPsQt/
         VQRYzQU1jmNxDr5cE+9A1UVYjkyulS5NBk9wDIKRb/X50bE3e75snx41FCZtrMwWHyTx
         9at1dPwLesN0mMiMZ6nHMpjakAXPnGVXIEAVj8tOhXigYTL9w1RkQLasewVs0zUEWB3R
         EJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763654367; x=1764259167;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKzMiSJJ52R4a8UwUG3jpi8BLyMUSMJY3DIfmEVvyjA=;
        b=A7a/xeNSFB63D/AjX9hqn8vv0Kv3okNXRfROD9kCB5A2HyeZrkfjd3aFig+IJfAciC
         Iub/MJgrVh+X8WS/gxq/4rphQE8c9AK1weee3i6BD9QW5eVLrbTKcblgZBjcfwT7BCBq
         k3/galwxvUupO7OwmaKzDGHYcwTC1mdo4xW5JU/duShHduQ2gdbnRNHsYz+UyI8oGUSX
         yOSzHEeP9v1MWSb7jDR/nT6RO3yifu95joNTNVjCcBwojWWbIs1G28vXsUTg9EynqP2P
         opleHXDzQaWVDiGFzuQ1SeW/yCLwm8LxFEnOUKU4ViZ/XNCWhZOzzG0x37gDk2Ql7Fa7
         BRuw==
X-Forwarded-Encrypted: i=1; AJvYcCWgPWkeLsX8BffkaULsgSdLSS8Po1pK8EegJmFfV3G4QvfFhQfQEvpmJR2240jAfvmXWQR9ww0E+yM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx11izwcrlT6M0jwLfZy4mbIjtK1RBXjetIXBvWlxeGtiAgjTZl
	2SRaqHsb3CV7appA6HyiGVPHm3cPIf1k0uJoDlKc2Cji81sMHWV8xxScG85iJfQ5Xxh4ifhrbBy
	5leFdm0kYORQOQxT00bd/bF3Dv1QS/JTfi6xwzusZ6g==
X-Gm-Gg: ASbGnct/34enHT+0hsZRxKh8e2PkTErfkA4TWZhafqJgic4YFWJwEjHBpvr+dfLAktH
	1xE/r3eXLdu2Dvn+C6MA2IVnjzxytdRceFpBhCdd7M4V9/VrRh1SWX2k0DeYyfchjUw3kXQoTg5
	h8EW1b13N+Dpiv/fBTTdtGTbXBSynsG4g894vi7wY5wJGlzuJl9i3ZNVBYleF9iLIYl8UYXsUOr
	pAtbVhXitSXGwowG8+/oE6ThZS0XBqgMW7OF9yC9xK+TGSIpYsiQhkC7hLKSRHEDGoliADTM+56
	aAVhinRjsyiD7dzk6iOBdboVYBSQ
X-Google-Smtp-Source: AGHT+IGBoIJQSOQgcFp7Q1w/IaRvFFn+9jbL6qZVEjA9+AYRXy4BoOTsXOneNoHjHiJmtw4UqdIs4V4vVcNg1bZnDzk=
X-Received: by 2002:a05:620a:4095:b0:8b1:fde4:59ee with SMTP id
 af79cd13be357-8b3274b5b75mr477062385a.85.1763654366737; Thu, 20 Nov 2025
 07:59:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org> <20251118-james-cs-syncfreq-v5-5-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-5-82efd7b1a751@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 20 Nov 2025 15:59:15 +0000
X-Gm-Features: AWmQ_bk67t0Rxh3fHd1PdSZQTAaW2NpP3v1ZIeR9WE8KZhxBSYLhvS_chL6Uylc
Message-ID: <CAJ9a7VjYQGzchv9z1Pypv1VtkMmZM99xi2eX4wdc-WksNPXB1g@mail.gmail.com>
Subject: Re: [PATCH v5 05/13] coresight: Define format attributes with GEN_PMU_FORMAT_ATTR()
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
>
> This allows us to define and consume them in a unified way in later
> commits.
>
> A lot of the existing code has open coded bit shifts or direct usage of
> whole config values which is error prone and hides which bits are in use
> and which are free.
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm-perf.c | 22 ++++++++---------
>  drivers/hwtracing/coresight/coresight-etm-perf.h | 31 ++++++++++++++++++++++++
>  2 files changed, 42 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index faebd7822a77..28f1bfc4579f 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -13,6 +13,7 @@
>  #include <linux/mm.h>
>  #include <linux/init.h>
>  #include <linux/perf_event.h>
> +#include <linux/perf/arm_pmu.h>
>  #include <linux/percpu-defs.h>
>  #include <linux/slab.h>
>  #include <linux/stringhash.h>
> @@ -54,22 +55,21 @@ static DEFINE_PER_CPU(struct coresight_device *, csdev_src);
>   * The PMU formats were orignally for ETMv3.5/PTM's ETMCR 'config';
>   * now take them as general formats and apply on all ETMs.
>   */
> -PMU_FORMAT_ATTR(branch_broadcast, "config:"__stringify(ETM_OPT_BRANCH_BROADCAST));
> -PMU_FORMAT_ATTR(cycacc,                "config:" __stringify(ETM_OPT_CYCACC));
> +GEN_PMU_FORMAT_ATTR(branch_broadcast);
> +GEN_PMU_FORMAT_ATTR(cycacc);
>  /* contextid1 enables tracing CONTEXTIDR_EL1 for ETMv4 */
> -PMU_FORMAT_ATTR(contextid1,    "config:" __stringify(ETM_OPT_CTXTID));
> +GEN_PMU_FORMAT_ATTR(contextid1);
>  /* contextid2 enables tracing CONTEXTIDR_EL2 for ETMv4 */
> -PMU_FORMAT_ATTR(contextid2,    "config:" __stringify(ETM_OPT_CTXTID2));
> -PMU_FORMAT_ATTR(timestamp,     "config:" __stringify(ETM_OPT_TS));
> -PMU_FORMAT_ATTR(retstack,      "config:" __stringify(ETM_OPT_RETSTK));
> +GEN_PMU_FORMAT_ATTR(contextid2);
> +GEN_PMU_FORMAT_ATTR(timestamp);
> +GEN_PMU_FORMAT_ATTR(retstack);
>  /* preset - if sink ID is used as a configuration selector */
> -PMU_FORMAT_ATTR(preset,                "config:0-3");
> +GEN_PMU_FORMAT_ATTR(preset);
>  /* Sink ID - same for all ETMs */
> -PMU_FORMAT_ATTR(sinkid,                "config2:0-31");
> +GEN_PMU_FORMAT_ATTR(sinkid);
>  /* config ID - set if a system configuration is selected */
> -PMU_FORMAT_ATTR(configid,      "config2:32-63");
> -PMU_FORMAT_ATTR(cc_threshold,  "config3:0-11");
> -
> +GEN_PMU_FORMAT_ATTR(configid);
> +GEN_PMU_FORMAT_ATTR(cc_threshold);
>
>  /*
>   * contextid always traces the "PID".  The PID is in CONTEXTIDR_EL1
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
> index 5febbcdb8696..c794087a0e99 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.h
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
> @@ -20,6 +20,37 @@ struct cscfg_config_desc;
>   */
>  #define ETM_ADDR_CMP_MAX       8
>
> +#define ATTR_CFG_FLD_preset_CFG                        config
> +#define ATTR_CFG_FLD_preset_LO                 0
> +#define ATTR_CFG_FLD_preset_HI                 3
> +#define ATTR_CFG_FLD_branch_broadcast_CFG      config
> +#define ATTR_CFG_FLD_branch_broadcast_LO       8
> +#define ATTR_CFG_FLD_branch_broadcast_HI       8
> +#define ATTR_CFG_FLD_cycacc_CFG                        config
> +#define ATTR_CFG_FLD_cycacc_LO                 12
> +#define ATTR_CFG_FLD_cycacc_HI                 12
> +#define ATTR_CFG_FLD_contextid1_CFG            config
> +#define ATTR_CFG_FLD_contextid1_LO             14
> +#define ATTR_CFG_FLD_contextid1_HI             14
> +#define ATTR_CFG_FLD_contextid2_CFG            config
> +#define ATTR_CFG_FLD_contextid2_LO             15
> +#define ATTR_CFG_FLD_contextid2_HI             15
> +#define ATTR_CFG_FLD_timestamp_CFG             config
> +#define ATTR_CFG_FLD_timestamp_LO              28
> +#define ATTR_CFG_FLD_timestamp_HI              28
> +#define ATTR_CFG_FLD_retstack_CFG              config
> +#define ATTR_CFG_FLD_retstack_LO               29
> +#define ATTR_CFG_FLD_retstack_HI               29
> +#define ATTR_CFG_FLD_sinkid_CFG                        config2
> +#define ATTR_CFG_FLD_sinkid_LO                 0
> +#define ATTR_CFG_FLD_sinkid_HI                 31
> +#define ATTR_CFG_FLD_configid_CFG              config2
> +#define ATTR_CFG_FLD_configid_LO               32
> +#define ATTR_CFG_FLD_configid_HI               63
> +#define ATTR_CFG_FLD_cc_threshold_CFG          config3
> +#define ATTR_CFG_FLD_cc_threshold_LO           0
> +#define ATTR_CFG_FLD_cc_threshold_HI           11
> +
>  /**
>   * struct etm_filter - single instruction range or start/stop configuration.
>   * @start_addr:        The address to start tracing on.
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
