Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720233168EF
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 13:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780494242; cv=none; b=cNrAGOxM+bIwyJKExsENm5rKrh9oZbdUd1JjU+bUQ2/5MLVHoxLcuq3CTC/ZeULIDI9HEwrwc2oBTk9b04ggMceveAt9yyMOmuZiybytlzIAoRcfuluUx3wA3EhAwxhWPazK62mlmp9bn59LslwmLij/TVPdHsEUUfsKeJzktZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780494242; c=relaxed/simple;
	bh=a8BDW+CrunOYbTFlwKZkd/OyryCGgg8B9X++SYgSnD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jxt8fJz7XMpAFtliEVyoCVyuPsC2WR4NQKrzlaC21xumuDD8chLgIjqekTB0wjxn6B+3zjp9yd6+omB3jpHdyYi2qaG5Qmub1Wu833OVprdsw0Ga91v3zbciPvNpSBIVqP+tBYPUbUwDlEOG443Hm4QfO80J3H0qP2uG4RFJaNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EyyhwZTb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X02eUVuV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EyyhwZTb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X02eUVuV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653ABKfn3552790
	for <linux-doc@vger.kernel.org>; Wed, 3 Jun 2026 13:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kRbnU8V6Zsc+nav/FJky6GGhRnGxbQyRHCJCHQ8YEm0=; b=EyyhwZTbQfhFDZMd
	7/4fMwTCUpSRhTNsWsHAyx8UwJfcKZIMQ4/sbAEpnkbOlhoUJvKrU3m/nGKyn5mG
	rSnp6b+aFYgaLyXIQZsfy0p73XLEmKHqgQJVSe4CNf1IL2ZH2BZfT0VZdw8yAQ2u
	2qe4dGi/2pzYRIsbCkw8p8gWxLJAdlIz7PRyqJEzN0XIkosS0/k7uTzC1HrNn3ki
	vBV3JDExkb/BOU8kc6q1ZmOJ5OVpYxY1AwVdbUrQku1ZO2MkOmndJD73lqU/QRtM
	fxQuxERcwTum1w1uAJbJ2maUN57342AI6ICT5qZzpKAuV0frf2oeH8Hu15aw2X93
	IiT8vQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj9mrs1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 13:44:00 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963d7e5ac48so3725625241.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 06:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780494240; x=1781099040; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kRbnU8V6Zsc+nav/FJky6GGhRnGxbQyRHCJCHQ8YEm0=;
        b=X02eUVuVVLXm722Ig0GIoGnki/uD3Q6ICNn1zewY7DQcjFohX7WmhAxDX5eamsnmpq
         BrT2YpivEsa6+T455ip0QgNi5mq38xF+nuPW30iogoc5Y9ZmdAQxE2b+r1rapT3p4dTx
         I5kUcXtq/6O/xuKcDGNKTChGLKjSyD4nO0so+4BmcPlQ/ZWpw1qcHvN2IdrMZBWGUlZ+
         CQScyPzv3oYlPhG/3nJzMGQMu2CIBIVWZAzfwh60fZ+rDS4sNXzS/BCRNOxLbPrmqZeD
         SLsFkxdHxzoXrPEHqrTMI1OSBMOkqay0w1cfV3BRkPu8ZO7k1oxjchth2DiHwsc0URxV
         j3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780494240; x=1781099040;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kRbnU8V6Zsc+nav/FJky6GGhRnGxbQyRHCJCHQ8YEm0=;
        b=TwEK/gaCLm+SB5kmOvwYRsVJyIqkl6ZCh3y7sXSW4wOHzZin5YOOYIt9Oos13MprOM
         WA/d9jUF2UCK89L6YaBnhnz4iSVZwX6q8zNvmRAXzjIJKgt8Nh3qXp6ew9ydDH8tlXry
         QqyFquRZkagRrv28x9iu5OoPKtuGK+FNovsjL4ZepgfbEEZYFF1pLS5K1iR1Y3Wg/F80
         g0G5x/B5F6XlJJ0Y97rFesWV8RHHPVsQCzyarwfsPQSkQKskV09/jn9pglGy57juHWFz
         wboiDbAV6521NWtPylGJhx5iN2jUZHbj5zTqwUBT8/3RKoeSqJVYyNo2MCntVKxsbCUd
         LF3A==
X-Forwarded-Encrypted: i=1; AFNElJ/bgn3A6LfclRzqWv1LgFZhnGGdNHsyI+Z0cESlnUOpc+KJShSO3Kg4zCSed3D5imOhZnC+qlJlxhk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLtC0nszPrOizq+4bFGNlD4r0L8iDx9xeTwaHNWSAyTlHFL8YY
	H9lvsQib6a6WC66nez9LXBkvzFirwrFQXIpwSfwiqswK0HeXLGnG1gBzQ6QJWkhajfdjsHtbseM
	AGAWoUSWarOsqG2HKy20okzL1UZvgd5eEnnd4/0RFFE9pRJEN7upCsuNsRXzhyrc=
X-Gm-Gg: Acq92OF3E/SPHbLLWNObhTAq7oB4gD2Hn4N6gGv5l6AgPf9uznIBMvgJrMSoOXIUJHX
	/MTKyD5+HlZwaXXWKKH1Dwzkfy5E8xad2uGENmjkoIVShE3qEapNVa9hkxoqYP/Kvg1GrcQ/HkQ
	QZ62ww3/xztY4qU9vIfbCHXyx0P0O7eWXNPlfzhtYKG2/6fGcTyUCq/fEbCaERnPWF2QtBRgvWS
	9YZsLJ3P2ZfXiH9AxX97HxdLL8w6zCh4y//p0F/8LMeUhv/CxgIj44xqDNUVD0AUI8rdQJ4xUVp
	WRnqjei6IGjrxOanSoQg6RI25A/LrLBGZwWYHCTQU7SwSXCEhBcMpoQicfN3n6KaVIxuCiaI0H0
	TJuSw6lZ3M4phlFuNpnLI0kJSAwuEfdYGv653pe7eGrsCMFaRO7JttQuMHjBfhxcXqJxR818cds
	CuX/aYOLLazVp8NhhOqmF0IwU6iP+RRgnPF41HRhbQ94XbIw==
X-Received: by 2002:a05:6102:dd0:b0:631:2973:5c2c with SMTP id ada2fe7eead31-6ec469592aamr1534016137.21.1780494239374;
        Wed, 03 Jun 2026 06:43:59 -0700 (PDT)
X-Received: by 2002:a05:6102:dd0:b0:631:2973:5c2c with SMTP id ada2fe7eead31-6ec469592aamr1533992137.21.1780494238918;
        Wed, 03 Jun 2026 06:43:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2ed56fsm9210311fa.37.2026.06.03.06.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:43:58 -0700 (PDT)
Date: Wed, 3 Jun 2026 16:43:56 +0300
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
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 08/15] accel/qda: Add QUERY IOCTL and QDA UAPI header
Message-ID: <2ztwmdejpkp3f3naz3g2fkjkpd6iomlb34bqnpnp6bhzn27vbb@wnd3fjcz6tgx>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-8-b2d984c297f8@oss.qualcomm.com>
 <m4zo2nkxtl5yeyo7riuata6r5saflmdgqf37cz2g2ezrwhk53m@mnad6bb7n3ik>
 <b5c9d149-1a48-4c0d-aa0d-9ad331896f47@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5c9d149-1a48-4c0d-aa0d-9ad331896f47@oss.qualcomm.com>
X-Proofpoint-GUID: o9MY0n9NMkRGULriFd6AMHOVmU7Xr2BM
X-Authority-Analysis: v=2.4 cv=XK0AjwhE c=1 sm=1 tr=0 ts=6a202fa0 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=LflQWrLztFwobrB7iZEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzMSBTYWx0ZWRfX5z7dFeZjbstZ
 QkmuzXaKw9NQOGjTDRNmEHuVBgWRD6Awp/wXd1QlVcCblHhM/6yBj6IRtPI/IzHWgFPwPsmrp7e
 HMXDRBMAEXVB5dfBeiHoJ9pvFmCg3M/0lLEzRkm37rLrsRm4nbEGgufV7q5OTREdvmjcXwmHFvk
 T4q1w7czTNCU1ksA2Z1ev6rwIONLd6vvCuAcXESA+MiRxk0cYKcgTVt/lb98ivK6zYcFnNhtWez
 kSck+8SyqLJC7icTSsrLDxtEQlkwpY0r3gBdabc7iAgTAQ0pWyw8xBt9xZD4up/NysK2kvPxKb0
 xo3VDL3pH/kGwHTEmGWFxWWRJxhjStMHe32DNjOSvuIuRSVzCgVeillTo2cZh3VSmgbq9c4rBX0
 mE2UyI+240/YdhE22tShVHHGzu7N3hcjqKGZQdRri6BGq2HJOXDEx4hrIER8rhFXC8lTrMI2zIV
 Bqlc+6chxPR5TlWVQfQ==
X-Proofpoint-ORIG-GUID: o9MY0n9NMkRGULriFd6AMHOVmU7Xr2BM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030131

On Wed, Jun 03, 2026 at 11:21:43AM +0530, Ekansh Gupta wrote:
> On 20-05-2026 19:59, Dmitry Baryshkov wrote:
> > On Tue, May 19, 2026 at 11:45:58AM +0530, Ekansh Gupta via B4 Relay wrote:
> >> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >>
> >> Introduce the DRM_IOCTL_QDA_QUERY IOCTL, which allows user-space to
> >> identify which DSP domain a given /dev/accel/accel* node represents
> >> (e.g. "cdsp", "adsp").
> >>
> >> include/uapi/drm/qda_accel.h
> >>   Defines the QDA IOCTL command numbers and the associated data
> >>   structures. The header follows the standard DRM UAPI conventions:
> >>   __u8/__u32 types, a C++ extern "C" guard, and GPL-2.0-only WITH
> >>   Linux-syscall-note licensing.
> >>
> >> drivers/accel/qda/qda_ioctl.c / qda_ioctl.h
> >>   Implements qda_ioctl_query(), which copies the DSP domain name
> >>   stored in qda_dev.dsp_name into the user-supplied drm_qda_query
> >>   buffer using strscpy().
> >>
> >> drivers/accel/qda/qda_drv.c
> >>   Registers the qda_ioctls[] table with the drm_driver so that the
> >>   DRM core dispatches DRM_IOCTL_QDA_QUERY to qda_ioctl_query().
> >>
> >> Assisted-by: Claude:claude-4-6-sonnet
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/accel/qda/Makefile    |  1 +
> >>  drivers/accel/qda/qda_drv.c   |  8 +++++++
> >>  drivers/accel/qda/qda_ioctl.c | 26 +++++++++++++++++++++++
> >>  drivers/accel/qda/qda_ioctl.h | 13 ++++++++++++
> >>  include/uapi/drm/qda_accel.h  | 49 +++++++++++++++++++++++++++++++++++++++++++
> >>  5 files changed, 97 insertions(+)
> >>
> >> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
> >> index 701fad5ffb50..b658dad35fee 100644
> >> --- a/drivers/accel/qda/Makefile
> >> +++ b/drivers/accel/qda/Makefile
> >> @@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
> >>  qda-y := \
> >>  	qda_cb.o \
> >>  	qda_drv.o \
> >> +	qda_ioctl.o \
> >>  	qda_memory_manager.o \
> >>  	qda_rpmsg.o
> >>  
> >> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
> >> index 0ad5d9873d7e..becd831d10be 100644
> >> --- a/drivers/accel/qda/qda_drv.c
> >> +++ b/drivers/accel/qda/qda_drv.c
> >> @@ -8,8 +8,10 @@
> >>  #include <drm/drm_gem.h>
> >>  #include <drm/drm_ioctl.h>
> >>  #include <drm/drm_print.h>
> >> +#include <drm/qda_accel.h>
> >>  
> >>  #include "qda_drv.h"
> >> +#include "qda_ioctl.h"
> >>  #include "qda_rpmsg.h"
> >>  
> >>  static int qda_open(struct drm_device *dev, struct drm_file *file)
> >> @@ -36,11 +38,17 @@ static void qda_postclose(struct drm_device *dev, struct drm_file *file)
> >>  
> >>  DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
> >>  
> >> +static const struct drm_ioctl_desc qda_ioctls[] = {
> >> +	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
> >> +};
> >> +
> >>  static const struct drm_driver qda_drm_driver = {
> >>  	.driver_features = DRIVER_COMPUTE_ACCEL,
> >>  	.fops = &qda_accel_fops,
> >>  	.open = qda_open,
> >>  	.postclose = qda_postclose,
> >> +	.ioctls = qda_ioctls,
> >> +	.num_ioctls = ARRAY_SIZE(qda_ioctls),
> >>  	.name = QDA_DRIVER_NAME,
> >>  	.desc = "Qualcomm DSP Accelerator Driver",
> >>  };
> >> diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
> >> new file mode 100644
> >> index 000000000000..761d3567c33f
> >> --- /dev/null
> >> +++ b/drivers/accel/qda/qda_ioctl.c
> >> @@ -0,0 +1,26 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> +#include <drm/drm_ioctl.h>
> >> +#include <drm/qda_accel.h>
> >> +#include "qda_drv.h"
> >> +#include "qda_ioctl.h"
> >> +
> >> +/**
> >> + * qda_ioctl_query() - Query DSP device information
> >> + * @dev: DRM device structure
> >> + * @data: User-space data (struct drm_qda_query)
> >> + * @file_priv: DRM file private data
> >> + *
> >> + * Return: 0 on success, negative error code on failure
> >> + */
> >> +int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv)
> >> +{
> >> +	struct drm_qda_query *args = data;
> >> +	struct qda_dev *qdev;
> >> +
> >> +	qdev = qda_dev_from_drm(dev);
> >> +
> >> +	strscpy(args->dsp_name, qdev->dsp_name, sizeof(args->dsp_name));
> >> +
> >> +	return 0;
> >> +}
> >> diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
> >> new file mode 100644
> >> index 000000000000..b8fd536a111f
> >> --- /dev/null
> >> +++ b/drivers/accel/qda/qda_ioctl.h
> >> @@ -0,0 +1,13 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only */
> >> +/*
> >> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> + */
> >> +
> >> +#ifndef __QDA_IOCTL_H__
> >> +#define __QDA_IOCTL_H__
> >> +
> >> +#include "qda_drv.h"
> >> +
> >> +int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv);
> >> +
> >> +#endif /* __QDA_IOCTL_H__ */
> >> diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
> >> new file mode 100644
> >> index 000000000000..1971a4263065
> >> --- /dev/null
> >> +++ b/include/uapi/drm/qda_accel.h
> >> @@ -0,0 +1,49 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> >> +/*
> >> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> + */
> >> +
> >> +#ifndef __QDA_ACCEL_H__
> >> +#define __QDA_ACCEL_H__
> >> +
> >> +#include "drm.h"
> >> +
> >> +#if defined(__cplusplus)
> >> +extern "C" {
> >> +#endif
> >> +
> >> +/*
> >> + * QDA IOCTL command numbers
> >> + *
> >> + * These define the command numbers for QDA-specific IOCTLs.
> >> + * They are used with DRM_COMMAND_BASE to create the full IOCTL numbers.
> >> + */
> >> +#define DRM_QDA_QUERY		0x00
> >> +
> >> +/*
> >> + * QDA IOCTL definitions
> >> + *
> >> + * These macros define the actual IOCTL numbers used by userspace applications.
> >> + * They combine the command numbers with DRM_COMMAND_BASE and specify the
> >> + * data structure and direction (read/write) for each IOCTL.
> >> + */
> >> +#define DRM_IOCTL_QDA_QUERY		DRM_IOR(DRM_COMMAND_BASE + DRM_QDA_QUERY, \
> >> +					 struct drm_qda_query)
> >> +
> >> +/**
> >> + * struct drm_qda_query - Device information query structure
> >> + * @dsp_name: Name of DSP (e.g., "adsp", "cdsp", "cdsp1", "gdsp0", "gdsp1")
> >> + *
> >> + * This structure is used with DRM_IOCTL_QDA_QUERY to query device type,
> >> + * allowing userspace to identify which DSP a device node represents. The
> >> + * kernel provides the DSP name directly as a null-terminated string.
> >> + */
> >> +struct drm_qda_query {
> >> +	__u8 dsp_name[16];
> > 
> > Are you sure that you want to query only the name? No extra options, no
> > attributes, no hardware capabilities?
> There are plans to extend this ioctl to support DSP capabilities and few
> other query options, but as per my understanding, I don't need to add
> reserved IOCTLs in drm case and I can extend it in future. Please
> correct me if my understanding is wrong and I should add reserved fields.
> 
> Copying the statement from the doc[1].
> "Note that drm_ioctl() automatically zero-extends structures, hence make
> sure you can add more stuff at the end, i.e. don’t put a variable sized
> array there."

I'd rather have a query type as an input here, to be able to return one
of querried params.

> 
> [1]
> https://www.kernel.org/doc/html/v7.0/gpu/drm-uapi.html#ioctl-support-on-device-nodes>
> 
> >> +};
> >> +
> >> +#if defined(__cplusplus)
> >> +}
> >> +#endif
> >> +
> >> +#endif /* __QDA_ACCEL_H__ */
> >>
> >> -- 
> >> 2.34.1
> >>
> >>
> > 
> 

-- 
With best wishes
Dmitry
