Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190C321ABC1
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 15:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760024882; cv=none; b=e3Nigeom087U79ov8RB2px8JffJkb4ICMqLpHfFQvtu01Ki3iX/xKrW3v7Ljxx9ls/3V1y1Y+GJBmN0x0rPY10yP/j4Et5Lwu1m+uwmWn5r1WJuHTaW/6Sedtq296OZg4EDjyDcYe2q85oFBnvXXATmPwCMz5WDSErAKMPlpQHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760024882; c=relaxed/simple;
	bh=Jy4TuMmx3/HLlDxqQuBgdsjeuwfYURVj3Hf9AtpKJv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uwOQASXQoXWbVd4uBURJjbKc8kTkiz0lz9oJnZ87N5Sg9q4aVOhUttwmYrJ7Ew77j0gJqb2IX0mzYP4aCW9TgVbILOWGj6seym1qwL1MXQqXNpTdPkz6MzH2MsI7wIPJ/LtIMnah2xfWoxAjT+1YRYCugXNu9q+a+l1WwNWJJIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pJTB4tk5; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pJTB4tk5"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-78115430134so777452b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Oct 2025 08:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760024880; x=1760629680; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XGAnFwEnHBldyC19wfHUDKGZkjsePFCHd7Iuxyaa00k=;
        b=pJTB4tk5S0fARhMASc7cmBOqLukTct8vfQGHHD0SEyEsd+iTWy16NyrPx8bl68rOki
         RGrDponZvTf/tqOkUxinZPFBVfiPA8spwj56LCN14CjG+zAMr4ujNVWHH2y0m8AgZtVB
         VVkdVa6QTAJemMAjPpMMksGBAwPRo5i+7mlxMQrwl+kf49t4Esnj7X9zW4arv7zyl1QU
         QAVRig6gWr9X3hTXPNwe1eZo2uAHxWazVVqxlcAnrH3UISSDdpxWzVaTR2zziJM+/wtc
         Am1uakaK+e/J8AJer46JPIq7eRzuIEY48MNUuzxzRr6I6NuTb4oPBuBFDc7b+YxVwo1+
         rmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760024880; x=1760629680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XGAnFwEnHBldyC19wfHUDKGZkjsePFCHd7Iuxyaa00k=;
        b=Ibq/gnQfE6wYT+dnPgwMbYc9FZwaGb6TYNiASmHEsA0wRKt5IqbtlD3brH/JuqIWHJ
         qK87GxcfV5mIL1CZ4k9rFxKlWEO7chDHc4w3mX/ZKcF+dIvbWgVXbgEg+FyWDxvyRcKO
         NtQIJM+vDtrfk3MQDaN3vpHLnQt9rEcCvlV9XVlH3ltGyk7dMDFVDkTfFW0C56sgW1Zb
         ZyZ5dYE1ujcQiwjVR/inXN6HySePsV5DNfsE0+B1htr/Qc2OBL/N138a4L5aPbD8hxKs
         nRnaBtZutHWypSdKEvN9Rl6Y1NUjIrkmkua0kF7+1INsn7BbKchWoP78gr7kKLGe7i3t
         tYww==
X-Forwarded-Encrypted: i=1; AJvYcCWwF6WHn7CQoBfRkU3LxSE3KGLFWjXVpXJb+/plz84S3doZVF9UsegeWej7clC6c77Z4f4vthjElZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXmZUcPnnzPpyBOa7JI/unI9j07R8mHbc4qawHl4hplrLWqqJ2
	QUnF7bX8esLp7+ul14ZAua9RAZ5eEJAVV6W8R7FS2Yc63VsjD+MHrATpt82hFwJPOtK3zHr2Hag
	cErzGXtEh0IdGwTO8GnI9Hdny+Xam64nFn37nXwKJpA==
X-Gm-Gg: ASbGnctxbSj9uq7/Or5bl1h0Zad6FFGZB978XdOMmHZjECQ3eE1gYYISlmLTYxeZgF6
	sNGgy+JGKMjxa81m3yaOo2kMwkQ1+1KQ4AnFfCESeUsfkTBA6qco+H3w02iC46vXSGYIsLSf6m7
	j8+d7fZNQLozPKnoige+VwkbivZ6jAKBypNKe7oKKM1n6SPy4o+7ujLtBAeH0ABl9/DbI6yfjsq
	G7H86y4Eed2sMGqqhlYvyvipp5TwCSZnAC7
X-Google-Smtp-Source: AGHT+IF6lNhbzZO84mSJkdUy7VjpvOVO74iscs8MhONQ8FrkcE27gvqJ+bzvDUmuhGFY3PpfCCeaHDOpOi7Q63g9uok=
X-Received: by 2002:a05:6a00:987:b0:77e:7302:dbe7 with SMTP id
 d2e1a72fcca58-7938792ac35mr8571610b3a.27.1760024880220; Thu, 09 Oct 2025
 08:48:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org> <20251002-james-cs-syncfreq-v3-4-fe5df2bf91d1@linaro.org>
In-Reply-To: <20251002-james-cs-syncfreq-v3-4-fe5df2bf91d1@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 9 Oct 2025 16:47:48 +0100
X-Gm-Features: AS18NWB8g7ZmaX0Xqd_icgqiHaagJoUhKP2NaShs4bRrD5R5X7h97DTqGwlgzNw
Message-ID: <CAJ9a7VjGfiZ2VsnyB05YVv4zZ7FC03uBueKH4M4NUys+=eCaQQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] coresight: Add format attribute for setting the
 timestamp interval
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi James

On Thu, 2 Oct 2025 at 11:10, James Clark <james.clark@linaro.org> wrote:
>
> Timestamps are currently emitted at the maximum rate possible, which is
> much too frequent for most use cases. Add an attribute to be able to set
> the interval. Granular control is not required, so save space in the
> config by interpreting it as 2 ^ ts_interval. And then 4 bits (0 - 15) is
> enough to set the interval to be larger than the existing SYNC timestamp
> interval.
>
> No sysfs file is needed for this attribute because counter generated
> timestamps are only configured for Perf mode.
>
> Only show this attribute for ETM4x because timestamps aren't configured
> in the same way for ETM3x. The attribute is only ever read in
> coresight-etm4x-core.c.
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm-perf.c   | 16 +++++++++++++++-
>  drivers/hwtracing/coresight/coresight-etm-perf.h   |  7 +++++++
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 21 ++++++++++++---------
>  3 files changed, 34 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index f677c08233ba..0c1b990fc56e 100644
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
> @@ -69,7 +70,8 @@ PMU_FORMAT_ATTR(sinkid,               "config2:0-31");
>  /* config ID - set if a system configuration is selected */
>  PMU_FORMAT_ATTR(configid,      "config2:32-63");
>  PMU_FORMAT_ATTR(cc_threshold,  "config3:0-11");
> -
> +/* Interval = (2 ^ ts_level) */
> +GEN_PMU_FORMAT_ATTR(ts_level);
>
>  /*
>   * contextid always traces the "PID".  The PID is in CONTEXTIDR_EL1
> @@ -103,11 +105,23 @@ static struct attribute *etm_config_formats_attr[] = {
>         &format_attr_configid.attr,
>         &format_attr_branch_broadcast.attr,
>         &format_attr_cc_threshold.attr,
> +       &format_attr_ts_level.attr,
>         NULL,
>  };
>
> +static umode_t etm_format_attr_is_visible(struct kobject *kobj,
> +                                         struct attribute *attr, int unused)
> +{
> +       if (attr == &format_attr_ts_level.attr &&
> +           !IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X))
> +               return 0;
> +
> +       return attr->mode;
> +}
> +
>  static const struct attribute_group etm_pmu_format_group = {
>         .name   = "format",
> +       .is_visible = etm_format_attr_is_visible,
>         .attrs  = etm_config_formats_attr,
>  };
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
> index 5febbcdb8696..d2664ffb33e5 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.h
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
> @@ -7,6 +7,7 @@
>  #ifndef _CORESIGHT_ETM_PERF_H
>  #define _CORESIGHT_ETM_PERF_H
>
> +#include <linux/bits.h>
>  #include <linux/percpu-defs.h>
>  #include "coresight-priv.h"
>
> @@ -20,6 +21,12 @@ struct cscfg_config_desc;
>   */
>  #define ETM_ADDR_CMP_MAX       8
>
> +#define ATTR_CFG_FLD_ts_level_CFG      config3
> +#define ATTR_CFG_FLD_ts_level_LO       12
> +#define ATTR_CFG_FLD_ts_level_HI       15
> +#define ATTR_CFG_FLD_ts_level_MASK     GENMASK(ATTR_CFG_FLD_ts_level_HI, \
> +                                               ATTR_CFG_FLD_ts_level_LO)
> +
>  /**
>   * struct etm_filter - single instruction range or start/stop configuration.
>   * @start_addr:        The address to start tracing on.
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 920d092ef862..034844f52bb2 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -28,6 +28,7 @@
>  #include <linux/amba/bus.h>
>  #include <linux/seq_file.h>
>  #include <linux/uaccess.h>
> +#include <linux/perf/arm_pmu.h>
>  #include <linux/perf_event.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> @@ -616,7 +617,7 @@ static void etm4_enable_hw_smp_call(void *info)
>   *  +--------------+
>   *         |
>   *  +------v-------+
> - *  | Counter x    |   (reload to 1 on underflow)
> + *  | Counter x    |   (reload to 2 ^ ts_level on underflow)
>   *  +--------------+
>   *         |
>   *  +------v--------------+
> @@ -627,11 +628,17 @@ static void etm4_enable_hw_smp_call(void *info)
>   *  | Timestamp Generator  |  (timestamp on resource y)
>   *  +----------------------+
>   */
> -static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
> +static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
> +                                      struct perf_event_attr *attr)
>  {
>         int ctridx;
>         int rselector;
>         struct etmv4_config *config = &drvdata->config;
> +       u8 ts_level = ATTR_CFG_GET_FLD(attr, ts_level);
> +
> +       /* Disable when ts_level == MAX */
> +       if (ts_level == FIELD_GET(ATTR_CFG_FLD_ts_level_MASK, UINT_MAX))
> +               return 0;
>
>         /* No point in trying if we don't have at least one counter */
>         if (!drvdata->nr_cntr)
> @@ -667,12 +674,8 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>                 return -ENOSPC;
>         }
>
> -       /*
> -        * Initialise original and reload counter value to the smallest
> -        * possible value in order to get as much precision as we can.
> -        */
> -       config->cntr_val[ctridx] = 1;
> -       config->cntrldvr[ctridx] = 1;
> +       /* Initialise original and reload counter value. */
> +       config->cntr_val[ctridx] = config->cntrldvr[ctridx] = 1 << ts_level;
>
>         /*
>          * Trace Counter Control Register TRCCNTCTLRn
> @@ -762,7 +765,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>                  * order to correlate instructions executed on different CPUs
>                  * (CPU-wide trace scenarios).
>                  */
> -               ret = etm4_config_timestamp_event(drvdata);
> +               ret = etm4_config_timestamp_event(drvdata, attr);
>
>                 /*
>                  * No need to go further if timestamp intervals can't
>
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
