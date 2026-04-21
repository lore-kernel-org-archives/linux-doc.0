Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41183359A90
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 15:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776787185; cv=none; b=HKNpHIoHlzOE64/96yoZNddItQXfEdGsGnpXjFxN2myRoBwKNbAf5JdVKApDJ1qxbiZuEM7sPR5HfyksqwCkrQ3R9903xQRlYUAn9ZAsajPqkTTLNbvsRb7Tqd88WeJq689/xtsB+odHYFuPVvKuKvJG3Y85DlyIMhZsRw0KNOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776787185; c=relaxed/simple;
	bh=xq1DWaWJ8J6cY+rY0xaqvpa3PGUx4ZgFXvOBlxB0GpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JjSCSIH2ChROefjfEqVkrQ60WnxevRPIP3g5fW4hgkj6vuKB4ab6FbTc2t4R9Np+wR105yOy8ztimNiZ/FEi3QF/FQgZL/DlbDDM2lKGwLUwetxqDoDN2GekOmSgcupkYma23ItaZcVekSk946f2ZbedfC1/T6/8RBv4a6tfSTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blC0KCuS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmiAcSts; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blC0KCuS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NmiAcSts"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L9e4cl046047
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 15:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qTGT9dVHn9ZD4VlzKf8b4LWl
	wJ6q97WIUZp+d0WZsqE=; b=blC0KCuSqm9wlc6YuJb5fJBNdXfodybBI8mwiIpG
	cu6otodaBirp60rUNTgROxukDQUGZiL6De3HJPM03wiuePdz0xSeBsYSBoirf4PT
	qoLPdE+pPdkw5yTbWy+PGdRwzUBM1+HV++fY4+Q+ZbgP0RdOMBRXxnbSIjPoBKgc
	hF5Uyg91dwehoFyGu0H2aXCfOynF8KmbWq8KKtVGWSE5p7KJpLFXx+76GAYxak9D
	p94Xm6IMiIlV3m9FMlfL1EKhpkJ0NfmkV80pk1th44BQ7+TPFCpqlNJMiPj9eL6T
	se3Lg0BuYQoLayAbgATtnlnbdQjBs4NA+YoK2kDwBPuY7g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp0y1tqtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 15:59:43 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-950bdef305cso2662126241.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 08:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776787182; x=1777391982; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qTGT9dVHn9ZD4VlzKf8b4LWlwJ6q97WIUZp+d0WZsqE=;
        b=NmiAcSts420yaOgdYYY4efmXtC0bAcn4bjNYGTkI1has+d1Dx49vwU996EBx0AylEK
         k/jSXImSc1VuSRjaMGx/gk13s/w86zgouVpG7W+olUPYoXI3c3j87op5TS4nXdHaVT3r
         m3T0NN3LQQ0a0cUUcu6CDA1w8ysA4XqDmz9seX93pC3oT9gDuoxtWBixTMwEq1UYhOpx
         9PAhFUAgdbRGg/PPvhYh9GtTORPZ0fTPakBg2M2e7WHpKGVA6W4T3Qr6LLDE6lwrodZY
         5BIQdV1/LZr6jTD5Qwta8GBNFntGzyIbuIYYzncfSX/RxTu6AuUqegjb1w+caZcjKHVX
         7SAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776787182; x=1777391982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTGT9dVHn9ZD4VlzKf8b4LWlwJ6q97WIUZp+d0WZsqE=;
        b=PAiBPMiW4OjQ52il0ZDnDm0KnnM81QZ6FK0zbCTrpLBo1/2douP9HOrB2LFtGWDuCO
         BXdPwWraRqkC+2AIZHQN7Ht2eRtoKrogzPihvj+/lUj0pkPGbTnjpM4OwLQhQZv2dHAm
         XXiCwQN77pbu1U8PK48GvF2utwccYKNgCXIMdMESpqyyk6Xp+uvrkIeoqTBhQZy2Rydb
         8yQP3FkuFrr6nNpDQQVkFNQujOJcCbBVsC2xLB4xyAmzjIqnI+89D40bNY8BeXSQy5mr
         NNZAgaG+7uqe30fi2/sOP4gYpF/C9Pn9LWHip9WcTzladl6/eE/PZQQsr84U1KQWvx/a
         tD/A==
X-Forwarded-Encrypted: i=1; AFNElJ/DJcrpEJCM9kHdXgjuIV9r/8Hhg1uMWgl0CJIHH7MfZePG+8jJ6ieWyQEWsOmDjnijeFCiQisHY8s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJv8HNiAWaIGytuYItz7Fg9zMB5eNCqqs0KpT5cgj+t0mbrtQW
	NGDvrJ17HwNpHmCtYUhk6hVCh9b4AkSxyXYFoastZ4SbkNbzlwSmCIc+9UFrAGGuOomJYeNfSiS
	15EDok6xqXff/+3pgCjwbT2ebsqtFWHqSYoj8HY9JxWS5Q/jQzY1xzt8yIbk7cbs=
X-Gm-Gg: AeBDieuwnWnLxbNwm5aJKic63pHaHOpryZ5qiYj0go4sH/7f6xQ+6ZXdO8oec+Spx5y
	5K8G20T4zklAbBAZW0uZSRZOKyY0PhFYL5dVanm2FZb/O11Lusb4MLz1COUgG86j3zGgHaf0PAG
	SbNbIIz/Cc1M+MaXeH99M4wNs2RZFZezV2gd/h6nVea57Vk/BYIVOl/6cSSfT0CJD4ZUWJdxaoS
	d7dehTGS3c51+g5a6GWS2kePYstvUYIDqEJWLZKLcrFAL/aNrmd4SnimnShNgA8oc6GRuqYpRIh
	oCu6c7cREY/P+wPBp9hzNzO2jEPyXlQ8piCz1bXdNPp4AL+Zb+lQXNl3jnKgBHWecGmXLl1CmP6
	OnTDkAT0FNQ6pmZC2ZnKLhHR5dGIiYTnWdj4oZcAtm7+GYeTrATKfktXz1PROepGq9T0cy2ysau
	Fh82svATr5Uod0EaW6hex7FPEDsoB5AD33oXZ9ZO5myYaFjg==
X-Received: by 2002:a05:6102:6052:b0:602:8c16:b24c with SMTP id ada2fe7eead31-616f806992emr7568538137.19.1776787182079;
        Tue, 21 Apr 2026 08:59:42 -0700 (PDT)
X-Received: by 2002:a05:6102:6052:b0:602:8c16:b24c with SMTP id ada2fe7eead31-616f806992emr7568495137.19.1776787181651;
        Tue, 21 Apr 2026 08:59:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0bfdsm31472081fa.26.2026.04.21.08.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:59:40 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:59:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Simon Ser <contact@emersion.fr>,
        Harry Wentland <harry.wentland@amd.com>, Melissa Wen <mwen@igalia.com>,
        Sebastian Wick <sebastian.wick@redhat.com>,
        Alex Hung <alex.hung@amd.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>,
        intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 16/20] drm/atomic: Drop private obj state allocation
Message-ID: <6fp5keyrgfic7x6rsopxpqdqfrbotkofv3vzni4bstphxwbc4l@5nlu63kpuwas>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-16-c63f1134e76c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-drm-mode-config-init-v2-16-c63f1134e76c@kernel.org>
X-Authority-Analysis: v=2.4 cv=VNLtWdPX c=1 sm=1 tr=0 ts=69e79eef cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=P1BnusSwAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CGuZyk7pIeUWItkfYpsA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NyBTYWx0ZWRfX884aNPwwUtln
 ti6rpql1RHIbqKvEl7nWdY9EZv85VSHhBsRf052nZ0NzgE40GuVSEsnqvYwlMldz+sLssAtnUwC
 8VCU5Mqd4WV9htM52yuOI33U+o9NvuqAxPVRA5jqzx6hb7W+dyqK1UtrNb6c5YIyOf7zezkDa44
 Nv9QLeRowd16fCsesnZW/X79gDlU4x4slZHZzygSxc4eST2E73/x04YR3zVjcEGd0a6Xt2gXm8a
 W3n6+Of9JMXF0qrwoWlWuSfwNdl0rQMdZyKL14+KLsnBfAkJ3kk+/PaWOSZPh9z88HkopOP853h
 UKZLmvhOLrexDoREvj+O6UU2GWIIhepsgKRlAVHbxopRbyxA8Dn/kOR1nlw4q5xV6QcXdbIY0TL
 naafB/ubS1YEHX6TOro3CW50vlwffy+5aF9jEF9TIBDi1PW/hfdtzzAXqMrP21SZPVBzZJG9xh1
 AfQAB8cVIa5ZMHPvYsA==
X-Proofpoint-ORIG-GUID: XbHjjyLWdmyfJ8t1L0MyRjMd63jH-Nap
X-Proofpoint-GUID: XbHjjyLWdmyfJ8t1L0MyRjMd63jH-Nap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210157

On Fri, Mar 20, 2026 at 05:27:23PM +0100, Maxime Ripard wrote:
> Now that drm_dev_register() calls drm_mode_config_create_state() for
> every modeset driver, the private obj states will be initialized at
> driver registration automatically if they haven't already.
> 
> Thus, the explicit initial allocation we have in
> drm_atomic_private_obj_init() is now redundant, and we can remove it.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic.c | 7 -------
>  1 file changed, 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
