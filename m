Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7A43DC4AF
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 05:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780465916; cv=none; b=jViPdlyEYINcchQcbQT5trV9+vMTSGxt3CIYGsdnlgrFg1DaSqia1i/Fp+PqFxkuAfndGLuMlh7j1FleuhpDDJsLpvSP12ypKyxT4xOAjrPG3RxfL/KXCDvgoCoCiex7v/xZXlb+l6s8F/b9YYnODHAxpWaRQhxwAqlT1pHfDwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780465916; c=relaxed/simple;
	bh=JU12tekL6GBhR04YvsNYNHGTnRlGN/sSSSIxQh1PeUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NgpIgIT06a2mcqkj9YcfvPtOcH02a6aVGnQwhHwX/wrgHPHRjc1M+KX24Fc1z4Glqa60Qwqq/Kb8k/nucT6Mz2bmkg1truwZs7Xe1NWHPvRggD+Slb5qgUA7qlnYjSDMLZithrfRh8MKM+kzrcHMLOKVsl3idQbXvpYuLwEMhWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gLRejsnA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tp+lh4EP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gLRejsnA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tp+lh4EP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6535WLH12955888
	for <linux-doc@vger.kernel.org>; Wed, 3 Jun 2026 05:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AoBXmuqEDW/B4n4M1GtYaMi2nefd/8NaLnywKReRnKk=; b=gLRejsnAQCm/y5ik
	ugn0LJwtvecXJpobc9QOcYHsKyVw+1ctVQ18LgKhz/YIJ8x77vwGfOGruVZ5gEz6
	PSY3LGCD/rL1Hrpr5QKxUa0viKgbwk6mSIWn+e/jqfFl4jt9bA+jSSS2Jc0BuH3A
	64KAweYROTEsZ2x7VVaixA1e4+OChDAb/vVr5su+lQxNgVXcW4dSZo51c/lhoi7H
	8GMSAC4i+tsgxdkS+RcNO7Xik29ObYSD5xYQSRNZSLK2jYAOKtjKyUZwvdRy81cY
	Ia63ghCRnpR7QDZpBU/i97wmIe/mD4/sAwW/obIKA1m9GJoUica6Q3apSplGsIEJ
	iTxykw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabbruwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 05:51:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf1dece2ecso56281615ad.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 22:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780465913; x=1781070713; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AoBXmuqEDW/B4n4M1GtYaMi2nefd/8NaLnywKReRnKk=;
        b=Tp+lh4EPnzXF56umkgDjKvZhyKD31jkdrqfEotS6V562cNk2Gp0cGOn5ZCe68tEp6k
         JtLoKl7Gza2CRtqgEknYYvDktgtE82dpyWKmtcf5D+FtG+PYA94kd+7K3uSybTwH8lEV
         PrlTcqoaRNYVndgv0miy6/97azEQOYDly6SMfmUnhL3/Gq2soaZVZ8zvoFrqg37v0dH2
         7DXLHRxbfNbh4wXQJfQC/ph3aO2i+avDqysCotfAlBkmeR3gUoszFdBL3NzEXeOBDHKg
         ZgWtSJGBECbLvbHNb12USU5CxPuABRuDAINO/4e4ng/kOOOSYbhit2ozpOuzJUEgaK7E
         Q/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780465913; x=1781070713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AoBXmuqEDW/B4n4M1GtYaMi2nefd/8NaLnywKReRnKk=;
        b=LnvrEEXZT5PDhwrmfzfW1W/9f+BroBMT1ZDpjnpGQ9gzCHiy64VnRQ9ZqjB1RmcKT7
         sfvPKneaUM9CqO//tE2gOgYQYJyjKrqVxfvqaFkA4+OEmunB5zlS/wiZSfpo2070Wl0T
         vpEXeUHba751VSGF3Kz73FOjMnxaeCsQwrGmPWTHBHQeXEN6oNqCraBL1KYamA5Psa0o
         ww6qdHZEM7AjZnKYvR/WdaAU8cQ46IP/yO1Z5HZ191wmcvbQEjhqIJ16nw8SmHBCzdmJ
         h6cEnpWS8PPiQlhlfZkAJbNnEauMe9mqBMmeQKSJh0bKP3dXYh3jG1vM5VSY/ausyzGv
         EDuw==
X-Forwarded-Encrypted: i=1; AFNElJ9RtX6qyJ2eVJ0ZPVUS+E8ukHRUD+zq/vVZGvOP1ZREAtJjK2JS3YU5i/UzFjHNIy74qaP6RYe23+M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzor9+76jY9Zhfe+QNmmcMvXfVdeyeCBo04Rvt1pQTg7/dRcEfA
	NSYasDlnWyjtiivg0uuaXC+la/5XnKmZo2Y+dEKxhx2eZmDoINpfAfolhmkGpHZ7I0WaU25dJgN
	ZV8oZ3RO/5DjxDGDQY6rZOIH2OxbkLHzBrJU7yfO/Bf9nyYG24M33J1/zWFtoI6g=
X-Gm-Gg: Acq92OH50eWek0gNl0bVJzS3w0izzRvKwVd1dc0NofZoi+jEiLjf4jct0VH9wOuhpIc
	uEQoXp2UupY44lCeodzK56zAXcPfN2Nrr4IfOfeBdInX5nSqXVqrKhJ5VZGWNwFzNrfa23MCfEK
	Hl227tCZoTa+UaXIpTToX5fCzLTZIzkBJq+208ZImRTe6K85NNEkkQfIHcTH5EbHHQidouwg7N7
	utcA/zUfPOXs0VEhl2dsHJ3+VgyOoLajW5FKGcYziohacQhpkYE64QqM8Ox2DPQcYUICntjr+fs
	VviqI50FI9WfmMGEHsWrRAxg/77+nYaD7IpVT+SDT0p4f5L/olvaF04FfmMtWK2ZqvoKYTDsk3a
	wztPwLdOxfBeWxygw5tGmLumgwek0JOdc4hWtv1Q8x6ggnkFvvJu9bKaTF2Mp
X-Received: by 2002:a17:903:2312:b0:2be:fefc:d5b9 with SMTP id d9443c01a7336-2c163a1352amr20027005ad.5.1780465912913;
        Tue, 02 Jun 2026 22:51:52 -0700 (PDT)
X-Received: by 2002:a17:903:2312:b0:2be:fefc:d5b9 with SMTP id d9443c01a7336-2c163a1352amr20026725ad.5.1780465912431;
        Tue, 02 Jun 2026 22:51:52 -0700 (PDT)
Received: from [10.204.78.54] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2d4sm11280795ad.77.2026.06.02.22.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 22:51:51 -0700 (PDT)
Message-ID: <b5c9d149-1a48-4c0d-aa0d-9ad331896f47@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 11:21:43 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/15] accel/qda: Add QUERY IOCTL and QDA UAPI header
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
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-8-b2d984c297f8@oss.qualcomm.com>
 <m4zo2nkxtl5yeyo7riuata6r5saflmdgqf37cz2g2ezrwhk53m@mnad6bb7n3ik>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <m4zo2nkxtl5yeyo7riuata6r5saflmdgqf37cz2g2ezrwhk53m@mnad6bb7n3ik>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA1MyBTYWx0ZWRfX+qG7LBp7Nj3u
 vpmhc5N/F90bR4lOEJqpcp3WteJJsRb7mQKEwHSFggWOPOVh9D+EKll2BLUDeJRge++Nu7CjUxp
 C9hVuNt/oGyW+6pcUGHjeBojCURRNvj1FQTfC9oS14roi6igle1Ou2XmTI5nAJAUgk+vLwX+dyM
 e76/kLNkT76mEcqu8iYJ2kGKgE+Y4KlIyPJDJSJuIHuqLWvZmr76S5aVDHIhvpUJsGPJTMc8pVR
 8yhFPLP9MbEbVsUDbRgNpTiev0LUnKAn/Um+b3RkExcppSn0SMcZ3/ZDzSXcN/c+FD6g75OhZpR
 aw5ZyrbX3RHmI2VpyldOh26/777RPyQGOTEWdvZ/0BENBlEGLMoHzJv/Y/m0A4wzRFR998QKdh4
 cLxsIJRCQvgTrcYGqhjYtk6EqOdOyMztblZYfOtl1+TStsmgQbcIxxsH9Y+QIlPAJy2Hotb63rV
 TP76R3Bs/Dv1mm1xtOA==
X-Authority-Analysis: v=2.4 cv=UqZT8ewB c=1 sm=1 tr=0 ts=6a1fc0f9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-e_ofER35s36BqmFglcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Ry0eK4RfjqZaUgPKXi6nUqnJnmDDj1FT
X-Proofpoint-GUID: Ry0eK4RfjqZaUgPKXi6nUqnJnmDDj1FT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030053

On 20-05-2026 19:59, Dmitry Baryshkov wrote:
> On Tue, May 19, 2026 at 11:45:58AM +0530, Ekansh Gupta via B4 Relay wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> Introduce the DRM_IOCTL_QDA_QUERY IOCTL, which allows user-space to
>> identify which DSP domain a given /dev/accel/accel* node represents
>> (e.g. "cdsp", "adsp").
>>
>> include/uapi/drm/qda_accel.h
>>   Defines the QDA IOCTL command numbers and the associated data
>>   structures. The header follows the standard DRM UAPI conventions:
>>   __u8/__u32 types, a C++ extern "C" guard, and GPL-2.0-only WITH
>>   Linux-syscall-note licensing.
>>
>> drivers/accel/qda/qda_ioctl.c / qda_ioctl.h
>>   Implements qda_ioctl_query(), which copies the DSP domain name
>>   stored in qda_dev.dsp_name into the user-supplied drm_qda_query
>>   buffer using strscpy().
>>
>> drivers/accel/qda/qda_drv.c
>>   Registers the qda_ioctls[] table with the drm_driver so that the
>>   DRM core dispatches DRM_IOCTL_QDA_QUERY to qda_ioctl_query().
>>
>> Assisted-by: Claude:claude-4-6-sonnet
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/Makefile    |  1 +
>>  drivers/accel/qda/qda_drv.c   |  8 +++++++
>>  drivers/accel/qda/qda_ioctl.c | 26 +++++++++++++++++++++++
>>  drivers/accel/qda/qda_ioctl.h | 13 ++++++++++++
>>  include/uapi/drm/qda_accel.h  | 49 +++++++++++++++++++++++++++++++++++++++++++
>>  5 files changed, 97 insertions(+)
>>
>> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
>> index 701fad5ffb50..b658dad35fee 100644
>> --- a/drivers/accel/qda/Makefile
>> +++ b/drivers/accel/qda/Makefile
>> @@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
>>  qda-y := \
>>  	qda_cb.o \
>>  	qda_drv.o \
>> +	qda_ioctl.o \
>>  	qda_memory_manager.o \
>>  	qda_rpmsg.o
>>  
>> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
>> index 0ad5d9873d7e..becd831d10be 100644
>> --- a/drivers/accel/qda/qda_drv.c
>> +++ b/drivers/accel/qda/qda_drv.c
>> @@ -8,8 +8,10 @@
>>  #include <drm/drm_gem.h>
>>  #include <drm/drm_ioctl.h>
>>  #include <drm/drm_print.h>
>> +#include <drm/qda_accel.h>
>>  
>>  #include "qda_drv.h"
>> +#include "qda_ioctl.h"
>>  #include "qda_rpmsg.h"
>>  
>>  static int qda_open(struct drm_device *dev, struct drm_file *file)
>> @@ -36,11 +38,17 @@ static void qda_postclose(struct drm_device *dev, struct drm_file *file)
>>  
>>  DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
>>  
>> +static const struct drm_ioctl_desc qda_ioctls[] = {
>> +	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
>> +};
>> +
>>  static const struct drm_driver qda_drm_driver = {
>>  	.driver_features = DRIVER_COMPUTE_ACCEL,
>>  	.fops = &qda_accel_fops,
>>  	.open = qda_open,
>>  	.postclose = qda_postclose,
>> +	.ioctls = qda_ioctls,
>> +	.num_ioctls = ARRAY_SIZE(qda_ioctls),
>>  	.name = QDA_DRIVER_NAME,
>>  	.desc = "Qualcomm DSP Accelerator Driver",
>>  };
>> diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
>> new file mode 100644
>> index 000000000000..761d3567c33f
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_ioctl.c
>> @@ -0,0 +1,26 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +#include <drm/drm_ioctl.h>
>> +#include <drm/qda_accel.h>
>> +#include "qda_drv.h"
>> +#include "qda_ioctl.h"
>> +
>> +/**
>> + * qda_ioctl_query() - Query DSP device information
>> + * @dev: DRM device structure
>> + * @data: User-space data (struct drm_qda_query)
>> + * @file_priv: DRM file private data
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv)
>> +{
>> +	struct drm_qda_query *args = data;
>> +	struct qda_dev *qdev;
>> +
>> +	qdev = qda_dev_from_drm(dev);
>> +
>> +	strscpy(args->dsp_name, qdev->dsp_name, sizeof(args->dsp_name));
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
>> new file mode 100644
>> index 000000000000..b8fd536a111f
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_ioctl.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef __QDA_IOCTL_H__
>> +#define __QDA_IOCTL_H__
>> +
>> +#include "qda_drv.h"
>> +
>> +int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv);
>> +
>> +#endif /* __QDA_IOCTL_H__ */
>> diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
>> new file mode 100644
>> index 000000000000..1971a4263065
>> --- /dev/null
>> +++ b/include/uapi/drm/qda_accel.h
>> @@ -0,0 +1,49 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef __QDA_ACCEL_H__
>> +#define __QDA_ACCEL_H__
>> +
>> +#include "drm.h"
>> +
>> +#if defined(__cplusplus)
>> +extern "C" {
>> +#endif
>> +
>> +/*
>> + * QDA IOCTL command numbers
>> + *
>> + * These define the command numbers for QDA-specific IOCTLs.
>> + * They are used with DRM_COMMAND_BASE to create the full IOCTL numbers.
>> + */
>> +#define DRM_QDA_QUERY		0x00
>> +
>> +/*
>> + * QDA IOCTL definitions
>> + *
>> + * These macros define the actual IOCTL numbers used by userspace applications.
>> + * They combine the command numbers with DRM_COMMAND_BASE and specify the
>> + * data structure and direction (read/write) for each IOCTL.
>> + */
>> +#define DRM_IOCTL_QDA_QUERY		DRM_IOR(DRM_COMMAND_BASE + DRM_QDA_QUERY, \
>> +					 struct drm_qda_query)
>> +
>> +/**
>> + * struct drm_qda_query - Device information query structure
>> + * @dsp_name: Name of DSP (e.g., "adsp", "cdsp", "cdsp1", "gdsp0", "gdsp1")
>> + *
>> + * This structure is used with DRM_IOCTL_QDA_QUERY to query device type,
>> + * allowing userspace to identify which DSP a device node represents. The
>> + * kernel provides the DSP name directly as a null-terminated string.
>> + */
>> +struct drm_qda_query {
>> +	__u8 dsp_name[16];
> 
> Are you sure that you want to query only the name? No extra options, no
> attributes, no hardware capabilities?
There are plans to extend this ioctl to support DSP capabilities and few
other query options, but as per my understanding, I don't need to add
reserved IOCTLs in drm case and I can extend it in future. Please
correct me if my understanding is wrong and I should add reserved fields.

Copying the statement from the doc[1].
"Note that drm_ioctl() automatically zero-extends structures, hence make
sure you can add more stuff at the end, i.e. don’t put a variable sized
array there."

[1]
https://www.kernel.org/doc/html/v7.0/gpu/drm-uapi.html#ioctl-support-on-device-nodes>

>> +};
>> +
>> +#if defined(__cplusplus)
>> +}
>> +#endif
>> +
>> +#endif /* __QDA_ACCEL_H__ */
>>
>> -- 
>> 2.34.1
>>
>>
> 

