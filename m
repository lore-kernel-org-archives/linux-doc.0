Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C277935CBDE
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 16:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763655068; cv=none; b=ZHhdEFBC92+mbbXC3L2PMsmgqG2PsmDun0ZhPSIN7wPP9sdPwhefo9gq00Mb0BMYo9fAmjWjjAOc+uTNoHOwD2FNnCmF2SiAKVQmdEVgGLso2hPp8+5YlOtkY8PaG8fSBuvavrZfAYy8FIbn3yxQy8yYlviSDnLfXx7F/tFyX2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763655068; c=relaxed/simple;
	bh=Kydt9MQc6tDgk1goXToeZHcC337OSM0OW5pHEpLKkQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dZ5+AXGpevoyYlLodf7LVqqsRcqcNxEOGMvPYu9g63qnQcX8qql+u9OzP0vrooWB6OZLUBbWI8l7WbZUQMvh+gLyDglbz0e1V6Xsh7A8DwLt9SN1vV5i9LGKYpQ1G29p5/H4jDhmvzUn+oGjjm6xHAompVWqwvoSP/sJw5BgxNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WDPq7Rin; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WDPq7Rin"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b2ed01ba15so87651085a.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 08:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763655065; x=1764259865; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NC66yCYtByGbmL0G9T+1ZptR//0cP5kWdBfOjIW3o4k=;
        b=WDPq7Rinuv1geo4pZmXbMZfif6zSrrYrzaBLldOELEsHm0H9zy2sQxHJxpJ+BtSDAi
         9NK0xufomv2Wo4YmuvnldGyzDyknKKvIVfxPfwKgPvu//JYkxar0NewQl3l2MO9CoAUJ
         e5OE2YrKqFWzIfkTL1EWO7qXcTiaI4W0XkvuTSO0d1E0cD07cLZnxHINbTG66EM0lEXc
         AUN0882hmVcT/sGOn/8Bgv4bzrboogkwePwkUbCPUOzsMmYt5Y/CuqEtJsoklw18oQH2
         Q3w6QYDPPwxx7Sk68sGCZhw9dnoUUFzLS9FAoZd3zyoeUl1rSAKbUnaGUKXnJZp9bUkZ
         W+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763655065; x=1764259865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NC66yCYtByGbmL0G9T+1ZptR//0cP5kWdBfOjIW3o4k=;
        b=P+C/qdBhI36s0FOqI7SRcdAuzKnH4p5KlU5PNNiCyJZ9XvevzVimq25KPuZ0VuDk/R
         cxZWbM9hoyMs8QxVqfoH32+Hx8yoEAXFe3fwFxeOs1LQpWgB+bYO8FCvi/vgmlUII8QQ
         wIAWEoXw/khUDV11rcEL7NGmxNyhpsucI3fpG0ggSLlEXRczeRHvTdEKOq9wzRDwDmug
         L+EGWowbwTYLTiPSZ0na2S4rjcDzri/mFtK8fpCZ5aurCD6+YZkjy04omsQTYs+o2lcB
         KPUqdGzTGLGKfkPD5ccryfq/OphbU5PE5Aq78o/vKpTe5VALN6eUNTG/Zq4u835c8gaz
         MuNQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+qEpsv3ccKE3O32c8u1pfOhTVFCrNkrLujj3f6j18tat04l0YCf2cuFLuc0GIOSxYO7jEwz864kw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWnbl6/BGjpdMyQxMZaeqomT3urSYtIHWP7qJxM4iOsn3QmxTc
	lLHWe5WDb5G7BSvpTvxgR3+zc/UuEPdkuSorlaY+xRKZIam4C7JPYBtbdYSkG7FpRSEM2qOCPAs
	l5pq68s0b5u9WkTIaTgC+pMFb67VZGe5zy8qyVQC+2A==
X-Gm-Gg: ASbGnctcQMqgCbxTGlDxuMJ+X6mol7zPRVA9RED9gQ2ar0oAiJ2ko0GkZfDE1OE5/Pn
	tVPG2my3nK6hl4L14+hLhPPDbQ5zgFFR85s3e2w9zoFwCl1ueASOuEjpBQG3uck278d8kNQYWpd
	C3EqhGYVpggKNk/y33tUZW7NCGgHXxEgnR41APCCyzi3KrTe8kt9QlXL+m6DuF/+NZdH+CI5dg6
	61m2o8PQaMQYi1AKGFSR9nl21NXngHgSB5VItrMJD+cZMQVJp88bSejMmLm6zndJVNyLscoxjnO
	J6JZCryM9pa51WzdNAY/dW7zkzb9
X-Google-Smtp-Source: AGHT+IFAsL9ZZ5dsE+7OqtUWMt8jK/zT02YmKKSJb2s7WZOEZz24NLjndXe9DfyQ9/pPQenldO5JJZKGTRYBSMu4/RM=
X-Received: by 2002:a05:620a:461f:b0:8b2:f371:5601 with SMTP id
 af79cd13be357-8b33875e6c2mr10281785a.50.1763655064662; Thu, 20 Nov 2025
 08:11:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org> <20251118-james-cs-syncfreq-v5-9-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-9-82efd7b1a751@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 20 Nov 2025 16:10:53 +0000
X-Gm-Features: AWmQ_bndk5MrqOE3hlPSMYIUdZZipVhGm5EA_jJg6IcLxzkgaOf2Jf_Wcx9wb7Y
Message-ID: <CAJ9a7ViUiifOwnzO+AoP4MY-TuEtMwwrVAxnYSiMjr+ez0c-Ag@mail.gmail.com>
Subject: Re: [PATCH v5 09/13] coresight: Interpret ETMv4 config with ATTR_CFG_GET_FLD()
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
>
> Remove hard coded bitfield extractions and shifts and replace with
> ATTR_CFG_GET_FLD().
>
> ETM4_CFG_BIT_BB was defined to give the register bit positions to
> userspace, TRCCONFIGR_BB should be used in the kernel so replace it.
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 44 ++++++++++------------
>  1 file changed, 19 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 5d21af346799..c7208ffc9432 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -29,6 +29,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/uaccess.h>
>  #include <linux/perf_event.h>
> +#include <linux/perf/arm_pmu.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/property.h>
> @@ -780,17 +781,17 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>                 goto out;
>
>         /* Go from generic option to ETMv4 specifics */
> -       if (attr->config & BIT(ETM_OPT_CYCACC)) {
> +       if (ATTR_CFG_GET_FLD(attr, cycacc)) {
>                 config->cfg |= TRCCONFIGR_CCI;
>                 /* TRM: Must program this for cycacc to work */
> -               cc_threshold = attr->config3 & ETM_CYC_THRESHOLD_MASK;
> +               cc_threshold = ATTR_CFG_GET_FLD(attr, cc_threshold);
>                 if (!cc_threshold)
>                         cc_threshold = ETM_CYC_THRESHOLD_DEFAULT;
>                 if (cc_threshold < drvdata->ccitmin)
>                         cc_threshold = drvdata->ccitmin;
>                 config->ccctlr = cc_threshold;
>         }
> -       if (attr->config & BIT(ETM_OPT_TS)) {
> +       if (ATTR_CFG_GET_FLD(attr, timestamp)) {
>                 /*
>                  * Configure timestamps to be emitted at regular intervals in
>                  * order to correlate instructions executed on different CPUs
> @@ -810,17 +811,17 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>         }
>
>         /* Only trace contextID when runs in root PID namespace */
> -       if ((attr->config & BIT(ETM_OPT_CTXTID)) &&
> +       if (ATTR_CFG_GET_FLD(attr, contextid1) &&
>             task_is_in_init_pid_ns(current))
>                 /* bit[6], Context ID tracing bit */
>                 config->cfg |= TRCCONFIGR_CID;
>
>         /*
> -        * If set bit ETM_OPT_CTXTID2 in perf config, this asks to trace VMID
> -        * for recording CONTEXTIDR_EL2.  Do not enable VMID tracing if the
> -        * kernel is not running in EL2.
> +        * If set bit contextid2 in perf config, this asks to trace VMID for
> +        * recording CONTEXTIDR_EL2.  Do not enable VMID tracing if the kernel
> +        * is not running in EL2.
>          */
> -       if (attr->config & BIT(ETM_OPT_CTXTID2)) {
> +       if (ATTR_CFG_GET_FLD(attr, contextid2)) {
>                 if (!is_kernel_in_hyp_mode()) {
>                         ret = -EINVAL;
>                         goto out;
> @@ -831,26 +832,22 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>         }
>
>         /* return stack - enable if selected and supported */
> -       if ((attr->config & BIT(ETM_OPT_RETSTK)) && drvdata->retstack)
> +       if (ATTR_CFG_GET_FLD(attr, retstack) && drvdata->retstack)
>                 /* bit[12], Return stack enable bit */
>                 config->cfg |= TRCCONFIGR_RS;
>
>         /*
> -        * Set any selected configuration and preset.
> -        *
> -        * This extracts the values of PMU_FORMAT_ATTR(configid) and PMU_FORMAT_ATTR(preset)
> -        * in the perf attributes defined in coresight-etm-perf.c.
> -        * configid uses bits 63:32 of attr->config2, preset uses bits 3:0 of attr->config.
> -        * A zero configid means no configuration active, preset = 0 means no preset selected.
> +        * Set any selected configuration and preset. A zero configid means no
> +        * configuration active, preset = 0 means no preset selected.
>          */
> -       if (attr->config2 & GENMASK_ULL(63, 32)) {
> -               cfg_hash = (u32)(attr->config2 >> 32);
> -               preset = attr->config & 0xF;
> +       cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
> +       if (cfg_hash) {
> +               preset = ATTR_CFG_GET_FLD(attr, preset);
>                 ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
>         }
>
>         /* branch broadcast - enable if selected and supported */
> -       if (attr->config & BIT(ETM_OPT_BRANCH_BROADCAST)) {
> +       if (ATTR_CFG_GET_FLD(attr, branch_broadcast)) {
>                 if (!drvdata->trcbb) {
>                         /*
>                          * Missing BB support could cause silent decode errors
> @@ -859,7 +856,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>                         ret = -EINVAL;
>                         goto out;
>                 } else {
> -                       config->cfg |= BIT(ETM4_CFG_BIT_BB);
> +                       config->cfg |= TRCCONFIGR_BB;
>                 }
>         }
>
> @@ -1083,11 +1080,8 @@ static int etm4_disable_perf(struct coresight_device *csdev,
>                 return -EINVAL;
>
>         etm4_disable_hw(drvdata);
> -       /*
> -        * The config_id occupies bits 63:32 of the config2 perf event attr
> -        * field. If this is non-zero then we will have enabled a config.
> -        */
> -       if (attr->config2 & GENMASK_ULL(63, 32))
> +       /* If configid is non-zero then we will have enabled a config. */
> +       if (ATTR_CFG_GET_FLD(attr, configid))
>                 cscfg_csdev_disable_active_config(csdev);
>
>         /*
>
> --
> 2.34.1
>
Reviewed-by: Mike Leach  <mike.leach@linaro.org>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
