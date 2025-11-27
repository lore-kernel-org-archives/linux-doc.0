Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF57260585
	for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 02:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764210484; cv=none; b=SRSKb4unUfGGaXqKl9hPKpCxBbbOaS2fRyGcn9QEOnlqsBhR0pOhvoC7GtfBHKOQ7A4ESBJJHIcZw0VxewM5xbVgraerEIxwHrVvsBx0seOKC8UkS3DhUK3Gfto7vShQ9pTN0U7zdBf4CpGCEEpuXlK4F8/oKhtW3Kt/g0d35kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764210484; c=relaxed/simple;
	bh=/GSTbng1KH45KUTGnscH8u07sm66tO9a/Tje6/MFjGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CMrKAn13c6H10nOiCk2nbKVLcwNs3Gxg6o+TWS3/44F2d4soPI8cilkcQ87W6sacDaLJBwK85OVfPSwL1OGN5zqJilYcU78UMuo3g86WyRMHj4otKVN8pErLd2lu7iGSup1vfonz0k5Wae/3X5ILIJjAUkmYHTiIySku6MOq4qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eKgaAJ2O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WWF0MzKj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eKgaAJ2O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WWF0MzKj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQEVcwC2355326
	for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 02:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aQm/hpjl97YQhN4/UPkldLLMmAXJLOJiRTjQPPZOSf8=; b=eKgaAJ2O+i/ngqoP
	krOXmGzyCdGQbK4Ges1lA4B8fztG1LvLFYyvyQnvn72+bYhCzVDnEj3//9gAPhDV
	lqyeeybBKzkZvIGpoWUvjJQN2Xz8BD+na9hRZ1n+BtRsJRux+YoToYPxVRIL/57y
	yPjJYZc7gdh8LTRoh88driSM4uYw5jUx++/FEqNUp+8YusrPZhYBhIfCDTpVV/5E
	Y49bmwVumJqlJif2hp2TwpdlhS0GlZykD1JROZWw3ravlO5JzuKy0rkXO8QBdUSp
	7gXi2+ayiSSuqG1ouypivQs91eL5dFfqrjtfEXTZ6CDM11zYUPpfkByNIo4RZLR6
	g9b3gQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap3d1hpyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 02:28:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b8ed43cd00so356251b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 18:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764210480; x=1764815280; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aQm/hpjl97YQhN4/UPkldLLMmAXJLOJiRTjQPPZOSf8=;
        b=WWF0MzKjSK22VoYern9ogp8eTLE9m73pfjqa9+A1+YHdLQGSKPxGnVK++rnmYlQXSN
         JDbU5EPkw91RzHMACm762e1YaHjndEk0bVTfz4SMpxU7HhJH205gKNjYtec5OJd3zxaZ
         q5GM1cxAvTC+KyyqH+KMt7oA9WXJcbLfzC9sRd+Fn5xHpZJEX2c0hPOQVvx+zSOqkB/Z
         sRCT3Vk0qkneDaaXZcd2bHoCL6UlDrhvFHqB1EedlBADjoaAmZLxoue1vUd6K3ASk/5G
         1xP+6avfGFL8mfMSgCd/Ba3xQdylB3FVjaseA516iUguleyyHHm7IZZCkdXlbNWd9ZqV
         6NwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764210480; x=1764815280;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aQm/hpjl97YQhN4/UPkldLLMmAXJLOJiRTjQPPZOSf8=;
        b=JUI+AI9ROHXXsjIzb4AEMc7DRr6qRxcFiiwB+/vwXihcRY6IO+NhF8f6gGbGjYK2Wr
         dS8uaFXIBxbbRuu7fJnxWxHf2jWFqRrc0T7+0cmDRS72WdlJ6+FUbemVaXyLyxblRGsL
         wddFUiMDqwcbVS27j6lJbyTYya28b4lcYN94m6GUlrnMqZ0XLEF3d9g8Fb1MhMw4qczR
         iVCw9Jw8Ra9X/yusZDTvcxMXGLE/weejHmwYJ1slwH9k9igI4urhu4ZUZjdaIdyoCLnn
         JuFCtc5FVZ+oZDVZIHt/MRWk738KGpad3SYiA4wYeV/Z2kJgYiwSAdkwqaRgJEBYy2U/
         4ARg==
X-Forwarded-Encrypted: i=1; AJvYcCW5o9pOLcxvNqRciZAyfFh5eDFbeViRU3QhXNVSV4rsl39g+nd4UKZ8GFNj1p7V7p0U4BhRpB31/rI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzduiZLcWsRMH2gpVk975ZNSatyh6ctxLgsNEYfp2xlG91TgXhv
	/8w81RbuuW7lDdXooCf2D+u/CjpkuNGjRs3Svu1ODV6HcxD/lBw34uEwiRdm/EfEzFI2UJGjckp
	r8cSaLDMTaw5X6leF0aZhPWpYkGHE8llCUtGAZG9K2BS/UUGI/x7ijTsNVeurjKXZlAeG4yzMmA
	==
X-Gm-Gg: ASbGncs/DfxYghNlG3/UuLMVFZdODbvY1DWi630s8zrFW4cdOw3CriJK1feCo7tx0yl
	nQHl8NyMJ2O3DHTQWg/nqVnPpKRnqKYNpXUQyUTcrN6Iwy2q7YXsiO1JR7QL7fWQ3jSXNUU3Xu7
	vZuj1ife1e/lhkq4kEY4M6GlTwi+DgkuEuMFNO14d/mr7VP2A0Kf+av4w64JFsKMwwOKayqRleW
	DpRhVyW5yS9JhPSA93luGfmW76j+blOXEUb5cSAVWMvZOpsun1jlXO3hz8zyUaQMVQXBYbisqcT
	bM9TPUGtCxKvoULe4lM9T2l7cZnHQxubborsWJgI10LTotnXUZAOTKwJNBflo3Sl0tqZgrHXSEN
	lCnTejoVSJuiifQSdoDDeD3/3APe6f1hJ8u+jnOg0WSWF+tfqzi4bjMuMxkgXyZl7WbAmcXW8qT
	g=
X-Received: by 2002:a05:6a21:32a2:b0:340:db9b:cfe8 with SMTP id adf61e73a8af0-36150e1fc11mr24519945637.12.1764210480252;
        Wed, 26 Nov 2025 18:28:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGiAeOMpYdHf1InUmL+Cvmp8kK5JBuNuxbX5BxzSEmVGWKC6I85XJ5FtyO3p8MYiH5dDy/DAQ==
X-Received: by 2002:a05:6a21:32a2:b0:340:db9b:cfe8 with SMTP id adf61e73a8af0-36150e1fc11mr24519915637.12.1764210479728;
        Wed, 26 Nov 2025 18:27:59 -0800 (PST)
Received: from [10.133.33.251] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be5095a1d85sm160891a12.26.2025.11.26.18.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 18:27:59 -0800 (PST)
Message-ID: <78956452-7c22-4338-823d-bc3d619cef7d@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 10:27:52 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/13] coresight: Allow setting the timestamp interval
To: James Clark <james.clark@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
 <20251126-james-cs-syncfreq-v7-12-7fae5e0e5e16@linaro.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251126-james-cs-syncfreq-v7-12-7fae5e0e5e16@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mn7UaAc47nXyvMFTEYutWIhwKse5Xh4h
X-Authority-Analysis: v=2.4 cv=MIVtWcZl c=1 sm=1 tr=0 ts=6927b731 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8
 a=ANtGpvVd1iEdTLDb4B8A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: mn7UaAc47nXyvMFTEYutWIhwKse5Xh4h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDAxOCBTYWx0ZWRfX1eZXzvBKwXB9
 GbCmvbb9qLkHRy8WKh5+bg0iU1gXsluxxAsYrazscnaoVq/YxzUFcWv7cNIWgPRgsL2zR7pQ2QI
 sIeQ2mJCmC/fbfe2/Ya5LK6JYuQjQcKOgesq8ez4ba2QE2nyslkg3649n0wuxg1bGnSLv9Cud01
 V8v8u781C3r+JR+wpZV40MbnMTbhmPzydXrRjwYAUk1Y7BKkCp/orLTOV3H1YxYPootDq2P42mh
 1SFdhRdQn+RHB6fZiaViA9g0ZiYxTH2P0pSoIUKpnhDT1Fq1yuZG580BK98pd/uCD9kdr1KYkj1
 mX9RHsFuQuTWL0qSHYXDXqQ/jdkJ3JtmckwD5Z0upcHXdw83GjUwQEAg2Bk7OoLS/nNioh0AZcB
 NDToEFhebWNLtriOxGcNzYgcMMkcDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1011
 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511270018



On 11/26/2025 6:54 PM, James Clark wrote:
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

Tested on Qcom Sa8775p-ride with perf session.
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>

Thanks,
Jie

> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.h   |  1 +
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 28 +++++++++++++++-------
>   2 files changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
> index 24d929428633..128f80bb1443 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.h
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
> @@ -7,6 +7,7 @@
>   #ifndef _CORESIGHT_ETM_PERF_H
>   #define _CORESIGHT_ETM_PERF_H
>   
> +#include <linux/bits.h>
>   #include <linux/percpu-defs.h>
>   #include "coresight-priv.h"
>   
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index c7bf73c8f2d7..0129b0502726 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -651,7 +651,7 @@ static void etm4_enable_sysfs_smp_call(void *info)
>    *  +--------------+
>    *         |
>    *  +------v-------+
> - *  | Counter x    |   (reload to 1 on underflow)
> + *  | Counter x    |   (reload to 2 ^ timestamp on underflow)
>    *  +--------------+
>    *         |
>    *  +------v--------------+
> @@ -662,11 +662,25 @@ static void etm4_enable_sysfs_smp_call(void *info)
>    *  | Timestamp Generator  |  (timestamp on resource y)
>    *  +----------------------+
>    */
> -static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
> +static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
> +				       struct perf_event_attr *attr)
>   {
>   	int ctridx;
>   	int rselector;
>   	struct etmv4_config *config = &drvdata->config;
> +	struct perf_event_attr max_timestamp = {
> +		.ATTR_CFG_FLD_timestamp_CFG = U64_MAX,
> +	};
> +
> +	/* timestamp may be 0 if deprecated_timestamp is used, so make min 1 */
> +	u8 ts_level = max(1, ATTR_CFG_GET_FLD(attr, timestamp));
> +
> +	/*
> +	 * Disable counter generated timestamps when timestamp == MAX. Leave
> +	 * only SYNC timestamps.
> +	 */
> +	if (ts_level == ATTR_CFG_GET_FLD(&max_timestamp, timestamp))
> +		return 0;
>   
>   	/* No point in trying if we don't have at least one counter */
>   	if (!drvdata->nr_cntr)
> @@ -704,12 +718,8 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>   		return -ENOSPC;
>   	}
>   
> -	/*
> -	 * Initialise original and reload counter value to the smallest
> -	 * possible value in order to get as much precision as we can.
> -	 */
> -	config->cntr_val[ctridx] = 1;
> -	config->cntrldvr[ctridx] = 1;
> +	/* Initialise original and reload counter value. */
> +	config->cntr_val[ctridx] = config->cntrldvr[ctridx] = 1 << (ts_level - 1);
>   
>   	/*
>   	 * Trace Counter Control Register TRCCNTCTLRn
> @@ -799,7 +809,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>   		 * order to correlate instructions executed on different CPUs
>   		 * (CPU-wide trace scenarios).
>   		 */
> -		ret = etm4_config_timestamp_event(drvdata);
> +		ret = etm4_config_timestamp_event(drvdata, attr);
>   
>   		/*
>   		 * No need to go further if timestamp intervals can't
> 

