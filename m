Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0912D47FF
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 17:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772039819; cv=none; b=AYqvHmsrE6vVkyv0P4j/KrtxMFznYLwBVHI1C0F7NSxbHYA8vqsKeswGWcXUngiBEeYTeWajlxcvrAMS0t4yqWasRqoYWWBoX8E+jB2/jTghTZsvL7Zjzrk9hhCU+kVIB4INzPlG0AEv/SiTcJo13NZEaOdlqqSQEuRNiQyBpHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772039819; c=relaxed/simple;
	bh=kf1VhgEVHDSWqNcgyUIDo+HRqqLO7+Jy/6FcfuBfgYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p2Ltqtr8sI8IjiQDpHrMpuhY9S1+YlAR81oIG8p2N+Vsh6gy5hgrQ15Tp2AeDXZCQpBs6M6ayuvKKKpzu1B8Xf5ZnoURFE7fwXNwV7aYdl/dUTc5xNKLQP4jDtrvMkWxcBMjcP4mRLEe1Ifa6WpnkRUAK2yMw1jEYw/EfZ8exvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NgTnxjVb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OA/Qed7x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgTnxjVb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OA/Qed7x"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PH3nvr1196028
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 17:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ucOIudrT1HeNKGnFCXAy5PnfmnhZNLc1JNcH6FfXVd0=; b=NgTnxjVbxDx9PZC5
	eGbsvbueGpTBBWMYr+OFoWbIvqGBsXta8czs7u/FZQDW8JT90NymttscOv5eU+k7
	x7NfD+8UKxeEeoYNei4v94NM5qEltXFJKwY7hQ+Y6DJO5cnkYXLuqN1IGuo/D0xz
	XkC77SKISOGHcM3Yb82rHZJ/FsZag32wE1EtFdPBHJAFnPUA347b5wzkNg0GRMaa
	Ak2PQPcQKGBqtHFFKq5SxRg9NIDOQ0TT4UatCNo809L44/hxRZqbj7FxP5FUmWnG
	ghDrbr2nXwT1LfvwWYVDZMv87NHDPzVDZanIg54SU9VvVjcvwrOpImmDxI7aTlu3
	xSyWLQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj559g1sb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 17:16:57 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-824f7591956so23928983b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 09:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772039816; x=1772644616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ucOIudrT1HeNKGnFCXAy5PnfmnhZNLc1JNcH6FfXVd0=;
        b=OA/Qed7xDW+18igzRPtB7eRXBq88vcGRPsmP4/Vvhi5E23l/LPZGrzUOX6TiG8VW+w
         p5+pPLJtbkiGBjh32wJBMZgS6KkxYC6/SLkftV4vWfzwb5EQkkSOwlLrhxfWyeU23wII
         O2OR+bkZleeOGYkF12mpswriQLqHSt6ka+oi6VbFIHzusQFlJDZxS3URR0p0gYw9cxtL
         nQAIbMc8xVexZd4HgW9LS8wPwY7MDKgGmMINT0nKd9Knj6H3YwSvVmkWkitWRUStUJ16
         pCKkuGOEOFTLRxG/bV0X7+2bjJicLSL32cRW0WxVBXRSwrbEqQ5GgjYD9I9+FJDsq116
         /6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772039816; x=1772644616;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucOIudrT1HeNKGnFCXAy5PnfmnhZNLc1JNcH6FfXVd0=;
        b=wLi8wEdfmRIfmP86mLA0cMMMd0toc8gXZ+6JIXQVIw2BH2yLUs+zy4gP3E2h18Zw64
         iKeJqTu6oCap8bc5z4tXU2pVQB5kTAvKiqrhWdRE5V5OAyl2DakY3UI3dl3/B0Q+pjdy
         P6dD4b44RDriww5UeELgiTj5ZLlRkwodq7+T5HUpAG3uxwLmxSydIAND+auvJfh+96fX
         QYNqw1wofVCp5uZYXBv1GmDZsAMs5TN7GtuQ2SnaB5J37sBUFuF2BMRbjT4Aw86x40VQ
         I5gxIaKn6MrpLaML5Vc8/L/sEO2w/WHCBU/V+J90bcQeR2G8oprCK3xKZQNwXWsU2eFz
         09dw==
X-Forwarded-Encrypted: i=1; AJvYcCU3+E6DnYZgAHsuQ0FKwGJx+ZUS5qx7b7qKXQ/fsdEU0Ay2uO6ODAV41AYn2e9eL7IqF6zrW72Dw1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaFnBqkL/WZ0pYjwkwhHcPgELBg/yve34F/Xta1DfULOCOd49n
	SD8S/iuW2t+0vnYnJsY/5P+x2ahQlQ5G2L0x9pIEX525zvi1zifg/JVY0MLQFZOBuB0Ex8QhVXY
	1gXu6A1473oHlNRNYVNckwtRrI2jTbvyUMMozghDTpl/u4Ml32m9juHT2d0/9CYkuiPEEYXQ=
X-Gm-Gg: ATEYQzwzdpfaqbTwT1fzXOpZEDR90eI1B/ssMlq5Nb7YMPrNRLu3Z5gUt4xryuS+2yN
	SZEyYurITDF6ok1ptqxibAQtV8eCH896N/fE4ovH5hYX9iLWCIX2b+Wp5RmOW0EF9VLJCpCSW+T
	+xbA3HaYoRXrTMQEa8WvC8MecGWZTzYnCIrIjsL/97YvOfoOU6fi43nfF6ANSqn/dcNW+XY57El
	wc5zZJ/Ib5vCOZRigSQaghiYOfmNhJNwkVzGW6ELp+XjelQa1xZyodWxY3a4Vn4GvN7/LblLzsA
	uVOaYmH3UjrJV0Om+2kBJIDa26tYxKKBXG1c8j/BGPIv+MKExlh2gzD3UiVMmOoD+zYeh//teMA
	VqtDdrrhJRtcMYoiGIGptIaxbl5OkZfhUiaePrma4HAzOmA26VyQ=
X-Received: by 2002:a05:6a00:4501:b0:81f:3a83:9756 with SMTP id d2e1a72fcca58-827337897f7mr909005b3a.30.1772039816303;
        Wed, 25 Feb 2026 09:16:56 -0800 (PST)
X-Received: by 2002:a05:6a00:4501:b0:81f:3a83:9756 with SMTP id d2e1a72fcca58-827337897f7mr908946b3a.30.1772039815684;
        Wed, 25 Feb 2026 09:16:55 -0800 (PST)
Received: from [192.168.1.5] ([171.61.227.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd86ca41sm15171981b3a.36.2026.02.25.09.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 09:16:54 -0800 (PST)
Message-ID: <843e550f-185a-4906-b61d-15c9b34d341f@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 22:46:47 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/18] accel/qda: Add RPMsg transport for Qualcomm DSP
 accelerator
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-3-fe46a9c1a046@oss.qualcomm.com>
 <tqsdbijgjomrn7fq3sdz7v2axwxqvbccpjh4fmvod4kbrq7pod@af3igw5dx66p>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <tqsdbijgjomrn7fq3sdz7v2axwxqvbccpjh4fmvod4kbrq7pod@af3igw5dx66p>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8NvHKYTg1_2zqPTG9l87Hb4Ew1LhTUrX
X-Proofpoint-GUID: 8NvHKYTg1_2zqPTG9l87Hb4Ew1LhTUrX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE2NSBTYWx0ZWRfX410uCvnQb76N
 pBi9owWsjM+WH+uKDY0Jkw7RgvZN3s65ssUVfbBKpcZtMKV6ExeZEX4mA/lyiZvZr9En1KeP6dH
 dOJFH5JcNB/o7vafiGjqkZWeEKXqQ8s5MpmzTiAsRFhV704z5t7PXkRF9slNuxkdR7UWo2WbSmL
 TrfRJLpzxkRsLYuRYY4WJ/hqmky690DPBqr2puXHtpOdvcDl14Zt2gc+TFQHIHIYkH8d+4Llu+j
 uzePKs4aON1UwokV5Dg7FYFXAm9hd0OXMvGuDv/pQYXDespLTx9QkTarDralVVUBRqsJO4TpBpZ
 160GDgHbZwx+Dc/76qeP1xY5BDSy5osmoEXqHp2GclptMZ3oOwBxynPPfXHwcLi410c0D8QqsMd
 knfB5yxxbrrDF4iklRfwFcXOJAwdm7iegFs8xSSEjLMWroiVkDrfEPZfTYcBpDeNupXs78SZph2
 MNUdU5SveHfzw+A/svg==
X-Authority-Analysis: v=2.4 cv=TcybdBQh c=1 sm=1 tr=0 ts=699f2e89 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=CLJ8B99oKJtQbdnoKiLypA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=WvnbiS2QWwUXfDwCy_YA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250165



On 2/24/2026 2:53 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 12:38:57AM +0530, Ekansh Gupta wrote:
>> Extend the Qualcomm DSP accelerator (QDA) driver with an RPMsg-based
>> transport used to discover and manage DSP instances.
>>
>> This patch introduces:
>>
>> - A core qda_dev structure with basic device state (rpmsg device,
>>   device pointer, lock, removal flag, DSP name).
>> - Logging helpers that integrate with dev_* when a device is available
>>   and fall back to pr_* otherwise.
>> - An RPMsg client driver that binds to the Qualcomm FastRPC service and
>>   allocates a qda_dev instance using devm_kzalloc().
>> - Basic device initialization and teardown paths wired into the module
>>   init/exit.
>>
>> The RPMsg driver currently sets the DSP name from a "label" property in
>> the device tree, which will be used by subsequent patches to distinguish
>> between different DSP domains (e.g. ADSP, CDSP).
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/Kconfig     |   1 +
>>  drivers/accel/qda/Makefile    |   4 +-
>>  drivers/accel/qda/qda_drv.c   |  41 ++++++++++++++-
>>  drivers/accel/qda/qda_drv.h   |  91 ++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_rpmsg.c | 119 ++++++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_rpmsg.h |  17 ++++++
>>  6 files changed, 270 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/accel/qda/Kconfig b/drivers/accel/qda/Kconfig
>> index 3c78ff6189e0..484d21ff1b55 100644
>> --- a/drivers/accel/qda/Kconfig
>> +++ b/drivers/accel/qda/Kconfig
>> @@ -7,6 +7,7 @@ config DRM_ACCEL_QDA
>>  	tristate "Qualcomm DSP accelerator"
>>  	depends on DRM_ACCEL
>>  	depends on ARCH_QCOM || COMPILE_TEST
>> +	depends on RPMSG
>>  	help
>>  	  Enables the DRM-based accelerator driver for Qualcomm's Hexagon DSPs.
>>  	  This driver provides a standardized interface for offloading computational
>> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
>> index 573711af1d28..e7f23182589b 100644
>> --- a/drivers/accel/qda/Makefile
>> +++ b/drivers/accel/qda/Makefile
>> @@ -5,4 +5,6 @@
>>  
>>  obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
>>  
>> -qda-y := qda_drv.o
>> +qda-y := \
>> +	qda_drv.o \
> Squash these parts into the previous patch.
Ack.
>
>> +	qda_rpmsg.o \
>> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
>> index 18b0d3fb1598..389c66a9ad4f 100644
>> --- a/drivers/accel/qda/qda_drv.c
>> +++ b/drivers/accel/qda/qda_drv.c
>> @@ -2,16 +2,53 @@
>>  // Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>  #include <linux/module.h>
>>  #include <linux/kernel.h>
>> +#include <linux/atomic.h>
>> +#include "qda_drv.h"
>> +#include "qda_rpmsg.h"
>> +
>> +static void cleanup_device_resources(struct qda_dev *qdev)
>> +{
>> +	mutex_destroy(&qdev->lock);
>> +}
>> +
>> +void qda_deinit_device(struct qda_dev *qdev)
>> +{
>> +	cleanup_device_resources(qdev);
>> +}
>> +
>> +/* Initialize device resources */
>> +static void init_device_resources(struct qda_dev *qdev)
>> +{
>> +	qda_dbg(qdev, "Initializing device resources\n");
>> +
>> +	mutex_init(&qdev->lock);
>> +	atomic_set(&qdev->removing, 0);
>> +}
>> +
>> +int qda_init_device(struct qda_dev *qdev)
>> +{
>> +	init_device_resources(qdev);
>> +
>> +	qda_dbg(qdev, "QDA device initialized successfully\n");
>> +	return 0;
>> +}
>>  
>>  static int __init qda_core_init(void)
>>  {
>> -	pr_info("QDA: driver initialization complete\n");
>> +	int ret;
>> +
>> +	ret = qda_rpmsg_register();
>> +	if (ret)
>> +		return ret;
>> +
>> +	qda_info(NULL, "QDA driver initialization complete\n");
>>  	return 0;
>>  }
>>  
>>  static void __exit qda_core_exit(void)
>>  {
>> -	pr_info("QDA: driver exit complete\n");
>> +	qda_rpmsg_unregister();
>> +	qda_info(NULL, "QDA driver exit complete\n");
>>  }
>>  
>>  module_init(qda_core_init);
>> diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
>> new file mode 100644
>> index 000000000000..bec2d31ca1bb
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_drv.h
>> @@ -0,0 +1,91 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef __QDA_DRV_H__
>> +#define __QDA_DRV_H__
>> +
>> +#include <linux/device.h>
>> +#include <linux/mutex.h>
>> +#include <linux/rpmsg.h>
>> +#include <linux/xarray.h>
>> +
>> +/* Driver identification */
>> +#define DRIVER_NAME "qda"
>> +
>> +/* struct qda_dev - Main device structure for QDA driver */
>> +struct qda_dev {
>> +	/* RPMsg device for communication with remote processor */
>> +	struct rpmsg_device *rpdev;
>> +	/* Underlying device structure */
>> +	struct device *dev;
>> +	/* Mutex protecting device state */
>> +	struct mutex lock;
> Which parts of the state?
This lock is added to ensure proper rpdev before sending message to DSP, now I think
it might not be needed if I can ensure proper checks based on any existing helpers, I'll
check this and remove if it's not needed.
>
>> +	/* Flag indicating device removal in progress */
>> +	atomic_t removing;
> Why do you need it if we have dev->unplugged and drm_dev_enter() /
> drm_dev_exit()?
I'll check the helpers and replace wherever necessary.
>
>> +	/* Name of the DSP (e.g., "cdsp", "adsp") */
>> +	char dsp_name[16];
> Please replace with the pointers to the static array.
ack.
>
>> +};
>> +
>> +/**
>> + * qda_get_log_device - Get appropriate device for logging
>> + * @qdev: QDA device structure
>> + *
>> + * Returns the most appropriate device structure for logging messages.
>> + * Prefers qdev->dev, or returns NULL if the device is being removed
>> + * or invalid.
>> + */
>> +static inline struct device *qda_get_log_device(struct qda_dev *qdev)
>> +{
>> +	if (!qdev || atomic_read(&qdev->removing))
>> +		return NULL;
>> +
>> +	if (qdev->dev)
>> +		return qdev->dev;
>> +
>> +	return NULL;
>> +}
>> +
>> +/*
>> + * Logging macros
>> + *
>> + * These macros provide consistent logging across the driver with automatic
>> + * function name inclusion. They use dev_* functions when a device is available,
>> + * falling back to pr_* functions otherwise.
>> + */
>> +
>> +/* Error logging - always logs and tracks errors */
>> +#define qda_err(qdev, fmt, ...) do { \
>> +	struct device *__dev = qda_get_log_device(qdev); \
>> +	if (__dev) \
>> +		dev_err(__dev, "[%s] " fmt, __func__, ##__VA_ARGS__); \
>> +	else \
>> +		pr_err(DRIVER_NAME ": [%s] " fmt, __func__, ##__VA_ARGS__); \
> What /why? You are under drm, so you can use drm_* helpers instead.
ack.
>
>> +} while (0)
>> +
>> +/* Info logging - always logs, can be filtered via loglevel */
>> +#define qda_info(qdev, fmt, ...) do { \
>> +	struct device *__dev = qda_get_log_device(qdev); \
>> +	if (__dev) \
>> +		dev_info(__dev, "[%s] " fmt, __func__, ##__VA_ARGS__); \
>> +	else \
>> +		pr_info(DRIVER_NAME ": [%s] " fmt, __func__, ##__VA_ARGS__); \
>> +} while (0)
>> +
>> +/* Debug logging - controlled via dynamic debug (CONFIG_DYNAMIC_DEBUG) */
>> +#define qda_dbg(qdev, fmt, ...) do { \
>> +	struct device *__dev = qda_get_log_device(qdev); \
>> +	if (__dev) \
>> +		dev_dbg(__dev, "[%s] " fmt, __func__, ##__VA_ARGS__); \
>> +	else \
>> +		pr_debug(DRIVER_NAME ": [%s] " fmt, __func__, ##__VA_ARGS__); \
>> +} while (0)
>> +
>> +/*
>> + * Core device management functions
>> + */
>> +int qda_init_device(struct qda_dev *qdev);
>> +void qda_deinit_device(struct qda_dev *qdev);
>> +
>> +#endif /* __QDA_DRV_H__ */
>> diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
>> new file mode 100644
>> index 000000000000..a8b24a99ca13
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_rpmsg.c
>> @@ -0,0 +1,119 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +#include <linux/module.h>
>> +#include <linux/rpmsg.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include "qda_drv.h"
>> +#include "qda_rpmsg.h"
>> +
>> +static int qda_rpmsg_init(struct qda_dev *qdev)
>> +{
>> +	dev_set_drvdata(&qdev->rpdev->dev, qdev);
>> +	return 0;
>> +}
>> +
>> +/* Utility function to allocate and initialize qda_dev */
>> +static struct qda_dev *alloc_and_init_qdev(struct rpmsg_device *rpdev)
>> +{
>> +	struct qda_dev *qdev;
>> +
>> +	qdev = devm_kzalloc(&rpdev->dev, sizeof(*qdev), GFP_KERNEL);
>> +	if (!qdev)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	qdev->dev = &rpdev->dev;
>> +	qdev->rpdev = rpdev;
>> +
>> +	qda_dbg(qdev, "Allocated and initialized qda_dev\n");
>> +	return qdev;
>> +}
>> +
>> +static int qda_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len, void *priv, u32 src)
>> +{
>> +	/* Dummy function for rpmsg driver */
>> +	return 0;
>> +}
>> +
>> +static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
>> +{
>> +	struct qda_dev *qdev = dev_get_drvdata(&rpdev->dev);
>> +
>> +	qda_info(qdev, "Removing RPMsg device\n");
>> +
>> +	atomic_set(&qdev->removing, 1);
>> +
>> +	mutex_lock(&qdev->lock);
>> +	qdev->rpdev = NULL;
>> +	mutex_unlock(&qdev->lock);
>> +
>> +	qda_deinit_device(qdev);
>> +
>> +	qda_info(qdev, "RPMsg device removed\n");
>> +}
>> +
>> +static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
>> +{
>> +	struct qda_dev *qdev;
>> +	int ret;
>> +	const char *label;
>> +
>> +	qda_dbg(NULL, "QDA RPMsg probe starting\n");
>> +
>> +	qdev = alloc_and_init_qdev(rpdev);
>> +	if (IS_ERR(qdev))
>> +		return PTR_ERR(qdev);
>> +
>> +	ret = of_property_read_string(rpdev->dev.of_node, "label", &label);
>> +	if (!ret) {
>> +		strscpy(qdev->dsp_name, label, sizeof(qdev->dsp_name));
>> +	} else {
>> +		qda_info(qdev, "QDA DSP label not found in DT\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = qda_rpmsg_init(qdev);
>> +	if (ret) {
>> +		qda_err(qdev, "RPMsg init failed: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = qda_init_device(qdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	qda_info(qdev, "QDA RPMsg probe completed successfully for %s\n", qdev->dsp_name);
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id qda_rpmsg_id_table[] = {
>> +	{ .compatible = "qcom,fastrpc" },
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, qda_rpmsg_id_table);
>> +
>> +static struct rpmsg_driver qda_rpmsg_driver = {
>> +	.probe = qda_rpmsg_probe,
>> +	.remove = qda_rpmsg_remove,
>> +	.callback = qda_rpmsg_cb,
>> +	.drv = {
>> +		.name = "qcom,fastrpc",
>> +		.of_match_table = qda_rpmsg_id_table,
>> +	},
>> +};
>> +
>> +int qda_rpmsg_register(void)
>> +{
>> +	int ret = register_rpmsg_driver(&qda_rpmsg_driver);
>> +
>> +	if (ret)
>> +		qda_err(NULL, "Failed to register RPMsg driver: %d\n", ret);
>> +
>> +	return ret;
>> +}
>> +
>> +void qda_rpmsg_unregister(void)
>> +{
>> +	unregister_rpmsg_driver(&qda_rpmsg_driver);
>> +}
>> diff --git a/drivers/accel/qda/qda_rpmsg.h b/drivers/accel/qda/qda_rpmsg.h
>> new file mode 100644
>> index 000000000000..348827bff255
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_rpmsg.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef __QDA_RPMSG_H__
>> +#define __QDA_RPMSG_H__
>> +
>> +#include "qda_drv.h"
>> +
>> +/*
>> + * Transport layer registration
>> + */
>> +int qda_rpmsg_register(void);
>> +void qda_rpmsg_unregister(void);
>> +
>> +#endif /* __QDA_RPMSG_H__ */
>>
>> -- 
>> 2.34.1
>>

