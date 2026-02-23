Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE907379992
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 22:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771885504; cv=none; b=bIyO16HUrdTJuFRgpXuDrqdcofpagmkO3P+fRozsI+TVL9Xzq3zUmFe/FLT4fOV9e0DbcU9LFqTTUQvHfATd3GHEbGdXutae0xq4yhLAw3Z9lx1DcyxhWt+Lue2q4jRw+Or8pEMfBOlrp6x+EXfDjetIPCgrQatbnXoJUX1UO3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771885504; c=relaxed/simple;
	bh=MwKJDhOjSy9TdjHhjCLJ9vblSJrwhPM7tm/CCU/Mc0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igxBCEoppPF7sFiMF8x6Mr9Gg/Xa3AgXugN+I7wz9JTvVNo8lbB6DT4EaazqiToqGu55OHcj1/yoxs9CMO3B4tm70hvTbjfaWPoX0p84JCZjIil26IuS5/Am74KhftmSWGaUWSxSCNS9O+vnvIFoD0EpgRnkPf6EH473fojozSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NlNaGhn1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I5hYx8V2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NlNaGhn1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I5hYx8V2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NIP17C561295
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 22:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4t4vMCyeh5FO8jHV4Nz0hUoW
	U7ZCESWTx0v5D054J3c=; b=NlNaGhn1KhBjgV9mj/VYdOuU5ehV1qao8RrvyFtR
	zExj38kIV0zWDm18pJGvUwLfN6wyNUWJ0IFpc1fxavo7aNESt99sIkVzsBUgJnCe
	DtmbrMykIPEaWOw3+hHEb5Zx0PRP76gidoainjQqZT8VENFUGVubnn+4YXe3Atva
	HAdUbM4MvYcDVGIhfHjgt5+W423EZIwsNzjzMyHVqyj39/ifQyrMju7P2HHNDdJQ
	G2i0gn4V72P8glMZ+V4M0OOeHcXKV8pa/ud9ZJOXhycGqtZxcfx/BLylq7WdFuOP
	p9x4sCFuEFRfdlmXYyI/WJaHS2iU7AjJ8a8MhG6T7TMt0Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8ra2ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 22:25:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89493622b50so68487256d6.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 14:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771885500; x=1772490300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4t4vMCyeh5FO8jHV4Nz0hUoWU7ZCESWTx0v5D054J3c=;
        b=I5hYx8V26o7F7p5JiPLZzq+F2g8bYTeo5aysQNXgji0W8zEtwoZodcCoCG5LylXZjz
         uA2RL/pV7JSHz00JhGjt081S37tEzWqkBXNXCDO29tPjvTYLSU7MNK34V955LltruRHi
         JxsRDv7OqbtAe7+wPrdsuy0oIK1nz29tFPMsDr25jDj4hw521azBWVuXBTgateiACVO3
         5IN92u0udMv2ychmZFppjAcEN2rf9pxHmxdANljD2ljmzh47EyVYPHkGnRJoWus/9ugG
         6z9FWS2t+km9hyBZGTv6gVSDZb0xsP8w3dneVkEailT1Aozs3zWdPqzrSm0rAw+uxFv5
         p1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771885500; x=1772490300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4t4vMCyeh5FO8jHV4Nz0hUoWU7ZCESWTx0v5D054J3c=;
        b=WDHJRa08hpRkKLca4mIeX8a0Ap/4vnllgstGiMRMHvrcvLvdM2EyyAXi2G33Nf+7p0
         RUGk2TVXqhu1Eo/vvzcx3kg8FdFm25fSIhfjx9Lmf5KvwcxONI6oeuI5wowh9BZgFiih
         WgUa0B5xQiYUokJNJCJBe9av9qNdFoGBCfrYXe6+XydAjMwmrsGgRraMzEv+vyML2JtC
         dOKLbgjfv0s12wplQBdiepokS+ST8lNrCD0zqLyESkelEeDn4gA+8jl5TjFFOMR3MNYR
         Azc/wwc0KlOR4dwBV4iLZntjGP589Pwrh9X/XR9O5TWEYvIh++G9gxeITFchM8tPNpvj
         d0tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo8VZ09iILD4A1zkS5MQEtubAx3z/3H6yHsfOfYA3JtsS5A71Pe7sN0d6VaaryBjQbqRHQScLYE5s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2VhI03ruVc62OBvYnuMofCuu47i24V5YNEuVha9bn6TZDndPN
	HNJFDhU8BFU9ZrURXrHw1L38i4dEEoshNY3rRkz68mVDLoL6rcgiMbr97oqfC8Em763qRSz1lX0
	lMu6EDbRSyJnFEOCR49SvNSaE6bYlCeCxzAiwlL2bCe8RtCZF1oRcys9KwYgPLBk=
X-Gm-Gg: AZuq6aJA3wOZ7fyBXJrGvQFeUsw9yjdjditYYvxxIHuyD32wXV9ceFJIcp2q2667VLC
	6nVtJDoOMV3Iyfv4XRhmt5LUqvxHO9eBBznfUoTSFMl1UHnt8yBOLyvD3F+FkQGjoeAxgByJ7Bu
	UkQXfHcbXZ6G4qO4DxE/5J3BiBO7v9KfkRCT8Ge5Q98dZD4FY/eJHS896YQ8/Tz6D2+V8jkL/Xq
	zFfcj8xHlVuJl3cbGK91PTb3rgWHmVmky4RnilG273eH03K/0rk2MqxtPsscXsJ56n70IOLLR80
	mZAbv3tP/F10fECQgWbCSv+IMpbjG0OTNdLvObuMQiWskTI2TKCimKrelWE7ALOm8RljQwidltP
	EmbhupDs49U6HmCnUILYkQ2HZHTd8k2gl02NZnZjsdGcqsQBcyhKhkDehC6vjliGcblaEdofQZZ
	b0fX+HtKulFa2kjrI7Vqmx78ThdT6x32ucgD4=
X-Received: by 2002:a05:620a:bc2:b0:8cb:3fb3:7bee with SMTP id af79cd13be357-8cb8ca65f6emr1222850785a.51.1771885499785;
        Mon, 23 Feb 2026 14:24:59 -0800 (PST)
X-Received: by 2002:a05:620a:bc2:b0:8cb:3fb3:7bee with SMTP id af79cd13be357-8cb8ca65f6emr1222846085a.51.1771885499171;
        Mon, 23 Feb 2026 14:24:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb1541asm1818660e87.33.2026.02.23.14.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:24:58 -0800 (PST)
Date: Tue, 24 Feb 2026 00:24:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 09/18] accel/qda: Add QUERY IOCTL and basic QDA UAPI
 header
Message-ID: <fzfuaeninr7lfbn74reoare7y2zoflddcvvnvyifnriw26swjc@igixj73zawrv>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-9-fe46a9c1a046@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-9-fe46a9c1a046@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xC4wkVxYl__eNg-5noDEvjSjs1n_a92Z
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699cd3bd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=AzVrm9-Iib0IivHGxGkA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5NSBTYWx0ZWRfX0LrCeu/DON/i
 HvEcMDD5A5rFk/K4EmNkckePT5bswQjDz1oMr4DOhlK0xW1MqjebR5M0WboRJTmAsrfBgfRQnXY
 u3f+f6ea0E1ITZDTOKF5KRklmCJ+ecIogcKPuz+KyoK5+WwNh3DOXWG8Xffb2BmTkoXRqKRbPQm
 6pdwUDPfEdNWVlojmyntjKpEGTA/tyKHhGyf3FzZA6rbEIKKhev0GevEq4TO7etsX5Q5QMnEcxA
 oOx895vYWpdnRgLGC9y3B6yw5PSbcDM40hYr/ClMQKFhlvP9GWOWQOba0NuK7Qe28xS38g7Y6cJ
 UBRMJRXna2HSVJluZOsAQr+OEvZYhR1VtHtR7kGPP+fTzcPBmoRFOTmsh4ZYKU6RD5Pwi68HoWK
 CffWPoiRbkXnt5e+CjQCUAPep3WiE7o5bpGnWUpGcHbBm6ifndtjzjQpNl2KvMRdOzYlDyk6RJ7
 wiLIBjp99Xru5ajkmfg==
X-Proofpoint-GUID: xC4wkVxYl__eNg-5noDEvjSjs1n_a92Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230195

On Tue, Feb 24, 2026 at 12:39:03AM +0530, Ekansh Gupta wrote:
> Introduce a basic UAPI for the QDA accelerator driver along with a
> DRM IOCTL handler to query DSP device identity. A new UAPI header
> include/uapi/drm/qda_accel.h defines DRM_QDA_QUERY, the corresponding
> DRM_IOCTL_QDA_QUERY command, and struct drm_qda_query, which contains
> a DSP name string.
> 
> On the kernel side, qda_ioctl_query() validates the per-file context,
> resolves the qda_dev instance from dev->dev_private, and copies the
> DSP name from qdev->dsp_name into the query structure. The new
> qda_ioctls[] table wires this IOCTL into the QDA DRM driver so
> userspace can call it through the standard DRM command interface.
> 
> This IOCTL provides a simple and stable way for userspace to discover
> which DSP a given QDA device node represents and serves as the first
> building block for a richer QDA UAPI in subsequent patches.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/Makefile    |  1 +
>  drivers/accel/qda/qda_drv.c   |  9 +++++++++
>  drivers/accel/qda/qda_ioctl.c | 45 +++++++++++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_ioctl.h | 26 ++++++++++++++++++++++++
>  include/uapi/drm/qda_accel.h  | 47 +++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 128 insertions(+)
> 
> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
> index 7e96ddc40a24..f547398e1a72 100644
> --- a/drivers/accel/qda/Makefile
> +++ b/drivers/accel/qda/Makefile
> @@ -10,5 +10,6 @@ qda-y := \
>  	qda_rpmsg.o \
>  	qda_cb.o \
>  	qda_memory_manager.o \
> +	qda_ioctl.o \

Keep the list sorted, please.

>  
>  obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
> index bf95fc782cf8..86758a9cd982 100644
> --- a/drivers/accel/qda/qda_drv.c
> +++ b/drivers/accel/qda/qda_drv.c
> @@ -9,7 +9,10 @@
>  #include <drm/drm_file.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_ioctl.h>
> +#include <drm/qda_accel.h>
> +
>  #include "qda_drv.h"
> +#include "qda_ioctl.h"
>  #include "qda_rpmsg.h"
>  
>  static struct qda_drm_priv *get_drm_priv_from_device(struct drm_device *dev)
> @@ -128,11 +131,17 @@ static void qda_postclose(struct drm_device *dev, struct drm_file *file)
>  
>  DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
>  
> +static const struct drm_ioctl_desc qda_ioctls[] = {
> +	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
> +};
> +
>  static struct drm_driver qda_drm_driver = {
>  	.driver_features = DRIVER_COMPUTE_ACCEL,
>  	.fops			= &qda_accel_fops,
>  	.open			= qda_open,
>  	.postclose		= qda_postclose,
> +	.ioctls = qda_ioctls,

Please select one style. Either you indent all assignments or you don't.

> +	.num_ioctls = ARRAY_SIZE(qda_ioctls),
>  	.name = DRIVER_NAME,
>  	.desc = "Qualcomm DSP Accelerator Driver",
>  };
> diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
> new file mode 100644
> index 000000000000..9fa73ec2dfce
> --- /dev/null
> +++ b/drivers/accel/qda/qda_ioctl.c
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +#include <drm/drm_ioctl.h>
> +#include <drm/drm_gem.h>
> +#include <drm/qda_accel.h>
> +#include "qda_drv.h"
> +#include "qda_ioctl.h"
> +
> +static int qda_validate_and_get_context(struct drm_device *dev, struct drm_file *file_priv,
> +					struct qda_dev **qdev, struct qda_user **qda_user)
> +{
> +	struct qda_drm_priv *drm_priv = dev->dev_private;
> +	struct qda_file_priv *qda_file_priv;
> +
> +	if (!drm_priv)
> +		return -EINVAL;
> +
> +	*qdev = drm_priv->qdev;
> +	if (!*qdev)
> +		return -EINVAL;

Can this actually happen or is it (un)wishful thinking?

> +
> +	qda_file_priv = (struct qda_file_priv *)file_priv->driver_priv;
> +	if (!qda_file_priv || !qda_file_priv->qda_user)
> +		return -EINVAL;

What are you protecting against?

> +
> +	*qda_user = qda_file_priv->qda_user;
> +
> +	return 0;
> +}
> +
> +int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv)
> +{
> +	struct qda_dev *qdev;
> +	struct qda_user *qda_user;
> +	struct drm_qda_query *args = data;
> +	int ret;
> +
> +	ret = qda_validate_and_get_context(dev, file_priv, &qdev, &qda_user);
> +	if (ret)
> +		return ret;
> +
> +	strscpy(args->dsp_name, qdev->dsp_name, sizeof(args->dsp_name));
> +
> +	return 0;
> +}
> diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
> new file mode 100644
> index 000000000000..6bf3bcd28c0e
> --- /dev/null
> +++ b/drivers/accel/qda/qda_ioctl.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _QDA_IOCTL_H
> +#define _QDA_IOCTL_H
> +
> +#include <linux/types.h>
> +#include <linux/kernel.h>
> +#include <drm/drm_ioctl.h>
> +#include "qda_drv.h"
> +
> +/**
> + * qda_ioctl_query - Query DSP device information and capabilities
> + * @dev: DRM device structure
> + * @data: User-space data containing query parameters and results
> + * @file_priv: DRM file private data
> + *
> + * This IOCTL handler queries information about the DSP device.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv);
> +
> +#endif /* _QDA_IOCTL_H */
> diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
> new file mode 100644
> index 000000000000..0aad791c4832
> --- /dev/null
> +++ b/include/uapi/drm/qda_accel.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __QDA_ACCEL_H__
> +#define __QDA_ACCEL_H__
> +
> +#include "drm.h"
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +/*
> + * QDA IOCTL command numbers
> + *
> + * These define the command numbers for QDA-specific IOCTLs.
> + * They are used with DRM_COMMAND_BASE to create the full IOCTL numbers.
> + */
> +#define DRM_QDA_QUERY	0x00
> +/*
> + * QDA IOCTL definitions
> + *
> + * These macros define the actual IOCTL numbers used by userspace applications.
> + * They combine the command numbers with DRM_COMMAND_BASE and specify the
> + * data structure and direction (read/write) for each IOCTL.
> + */
> +#define DRM_IOCTL_QDA_QUERY	DRM_IOR(DRM_COMMAND_BASE + DRM_QDA_QUERY, struct drm_qda_query)
> +
> +/**
> + * struct drm_qda_query - Device information query structure
> + * @dsp_name: Name of DSP (e.g., "adsp", "cdsp", "cdsp1", "gdsp0", "gdsp1")
> + *
> + * This structure is used with DRM_IOCTL_QDA_QUERY to query device type,
> + * allowing userspace to identify which DSP a device node represents. The
> + * kernel provides the DSP name directly as a null-terminated string.
> + */
> +struct drm_qda_query {
> +	__u8 dsp_name[16];
> +};
> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif /* __QDA_ACCEL_H__ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
