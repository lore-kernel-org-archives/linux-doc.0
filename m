Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55422C11CD
	for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 15:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764258498; cv=none; b=UXLh50oZq7aU09B0ftECdjZ9Z0pG+WLnkVtSehqOeTDnoFWzbP51XfOxIE81FjAfEQQvCpfzJJOqe/xx1rKxMfoOph26rwPcmfpU2cGiNmiqBE5oTnKZ9TnLz96+JBjtxREKKxfkEBfH1xxIDolTgQzzuLQxrlmlGkK5ntTjQaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764258498; c=relaxed/simple;
	bh=gw7FHnYkfECYMAE0qc/PFiQCp9YAXgLP1tsa1P7Dzj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JZVZtxoHFT7kGdTwmd8EbY3SUHZ2G221bikj4VDGyA/K9IoG+YF5mQGW4VnnNGAF4VO9yk2YDXXuYnkdRPUZ1GclW0qoi5/OcOWms7pUBxlljjV7VdERNFNRSPBwjWkSzT6MxQcDAcX5k+VSVTdk+ealltXbFhMJD/8mPZ48d2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EniaWW9f; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EniaWW9f"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8b29ff9d18cso88800485a.3
        for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 07:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764258495; x=1764863295; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vtMBZcajxCOgwMc5Cr5khAy3BKxvnEEBT1x3xJ3pIV0=;
        b=EniaWW9fHTvgStkqswoRueaFzSsL3w1TMCvvsRJZn7NN12B1rCVBr/NOXpPHwVJKqX
         LYbRlAmeB2SBUxP88BspeKlcPVoD3HzP/RsmRh1rASQ1kIqqm9tnb4SVSssLQxCVSvlN
         meppZDBtCESranRyUYqPfHmh0T1yZ30ZhPIOcxBwL5p37/VO+yOdTkE18cNUrlv0A2nG
         qgv6PIPOe7v4Vgo4MygqoxgkrChEo9CQibN7FavuVrV1eriQwXu9k573hvBQ0mYHL4q5
         rt4c90ub1ltrCE/zwmAuGqKSERdx5O9yM/EZVG8JMP7+HHRFS/37sy0io83N0nYdv1yM
         W8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764258495; x=1764863295;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtMBZcajxCOgwMc5Cr5khAy3BKxvnEEBT1x3xJ3pIV0=;
        b=AoDQpEERI2Yo4a1FqPkz2ua/+z8hFUvxn2FYRG56qqgmr45kclbokxcuLxEfJTjFBx
         sU0ZndYKX1K7z+dxcntaWS+R2Ut8OVlNkVGgeiyP0gsVXmsu7z+jxMViZOcHCkKZOJ82
         QyR0tOgTyjDvkW8F2u3Vd0X3fbHX0fFbJ/I33Vhs42GitUWUmXKmC4J/Dvt1NqTy8CUG
         3LZ7JonqKipqlQhxIiUVyq31tq3gJIre2wL9aGTlhfbbFViy/FmvHD4qyQx8RPdy5ePk
         h/BR441p+DIWiOpumkUz2PmZQIQmQIAME6QFOggwgoavToxjtxFoeaW6onN05ZxBB/e1
         riTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPXxxB32k2G4aURRponEibugQj7MTXWjoCJcT+M1SUUd8zbvEPwNrkBv1UDMQYBe463T3sTazqJDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzujQUiSvVYNPos1ZGFn75vqYT6EadhT2spW7NryxagguU0Y3WE
	nppXfY0Y3WTgkZcpuwxSVmoAKgvQLj1SpCVaxVGVgsxaTnd6pXDuqoub1QLc+4L7Ubbp1bkKjb0
	WrNKm4AphjFH/3Mq7QfF3porf76u4jB54GBfUp7b70g==
X-Gm-Gg: ASbGncsCy4+EDtDGFcHiXW2z/kU+ZCdlVWZ6eDh3nYwODtcYWAZ9np35lwWKvB7oD+H
	GwjD4OUasNV6ifIGZQRQ6bIdZKXiCccEsxcmCJE8lzMX9C+1nP3IDt89p6xAHs1Iexw8vIYkSjL
	wJlfZ9P5yuIQy3+Sp1yzPyJ0tUUmIFt08LGgHdkYeVM6QLGz7Rrov6qYW9Xp7laURTxjQZIaBqO
	sh2nEoludrgOUzwb81gwTcriMCjtjpijD+u3F94zaBXTnIsfhchB7fi2RqDFKj9oBbTxgMBx5JD
	6HW+bu36Q2USoEFmrjmRlDmuxodL
X-Google-Smtp-Source: AGHT+IFGwX2xKjZ8zJ3ufBUfaizsNdUaJKyCmefwgS6iGyjsDIT0trjpyT1ZheKEA+VbXy1GrSLZjBsVFvn+NFM/III=
X-Received: by 2002:a05:620a:708a:b0:89f:db05:1643 with SMTP id
 af79cd13be357-8b33d48e2f2mr3163411085a.89.1764258495434; Thu, 27 Nov 2025
 07:48:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org> <20251126-james-cs-syncfreq-v7-12-7fae5e0e5e16@linaro.org>
In-Reply-To: <20251126-james-cs-syncfreq-v7-12-7fae5e0e5e16@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 27 Nov 2025 15:48:03 +0000
X-Gm-Features: AWmQ_bkzMba4JL0CdLihlk22izMToOw3dK8aUMj5q3QJJV-vmdb-ii6vOW6lFiQ
Message-ID: <CAJ9a7VgqGJ=YLG6+ypMnqV9YJ_dMBw6qyhusXdR_NR2=RTis-w@mail.gmail.com>
Subject: Re: [PATCH v7 12/13] coresight: Allow setting the timestamp interval
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi James

On Wed, 26 Nov 2025 at 10:57, James Clark <james.clark@linaro.org> wrote:
>
> Timestamps are currently emitted at the maximum rate possible, which is
> much too frequent for most use cases. Set the interval using the value
> from the timestamp field. Granular control is not required, so save
> space in the config by interpreting it as 2 ^ timestamp. And then 4
> bits (0 - 15) is enough to set the interval to be larger than the
> existing SYNC timestamp interval.
>
> No sysfs mode support is needed for this attribute because counter
> generated timestamps are only configured for Perf mode.
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm-perf.h   |  1 +
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 28 +++++++++++++++-------
>  2 files changed, 20 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
> index 24d929428633..128f80bb1443 100644
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
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index c7bf73c8f2d7..0129b0502726 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -651,7 +651,7 @@ static void etm4_enable_sysfs_smp_call(void *info)
>   *  +--------------+
>   *         |
>   *  +------v-------+
> - *  | Counter x    |   (reload to 1 on underflow)
> + *  | Counter x    |   (reload to 2 ^ timestamp on underflow)
>   *  +--------------+
>   *         |
>   *  +------v--------------+
> @@ -662,11 +662,25 @@ static void etm4_enable_sysfs_smp_call(void *info)
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
> +       struct perf_event_attr max_timestamp = {
> +               .ATTR_CFG_FLD_timestamp_CFG = U64_MAX,
> +       };
> +
> +       /* timestamp may be 0 if deprecated_timestamp is used, so make min 1 */
> +       u8 ts_level = max(1, ATTR_CFG_GET_FLD(attr, timestamp));
> +

I could be missing something here - but if we have a perf command line:

perf -e cs_etm/timestamp=0/

is this bit not changing that to timestamp=1 regardless? The docs
(patch 13) indicate timestamp=0 to be timestamps off.

This command is used in test_arm_coresight.sh when testing the
combination of options on the CS system.

Mike

> +       /*
> +        * Disable counter generated timestamps when timestamp == MAX. Leave
> +        * only SYNC timestamps.
> +        */
> +       if (ts_level == ATTR_CFG_GET_FLD(&max_timestamp, timestamp))
> +               return 0;
>
>         /* No point in trying if we don't have at least one counter */
>         if (!drvdata->nr_cntr)
> @@ -704,12 +718,8 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
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
> +       config->cntr_val[ctridx] = config->cntrldvr[ctridx] = 1 << (ts_level - 1);
>
>         /*
>          * Trace Counter Control Register TRCCNTCTLRn
> @@ -799,7 +809,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
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
