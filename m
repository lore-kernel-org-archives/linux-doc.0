Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8668626461F
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 15:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776786613; cv=none; b=Gfg9HKRPK/+JF5weJNqe0Tr5mM37l61BQXOsBtzjuFxmx3kUCHLc6Y+WjiSYnS6FoVYSBqq9UoZBO5YCy871bocHSuOoTm7Qf02GOPFm3TOuDRPLUJXv4JqZuKxuRKAptFfSs7LBWty2QjY4DsDj8l20idtygiboxAwPLqMldFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776786613; c=relaxed/simple;
	bh=eX9z/nS9NLqTAk07+rarrdCjtxJOf5SjHqSwKmwuoEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RbXHgureucqitAQ6IxiXkF9byg/yP6CNeFiu1lTacKBJkltWxDNYytHXs70EFyEOx4q4UZs53ue6VCX7rgY2AA/kkkGdaSZ/oJVQ158LbhwYQtWGLrqYXJqYRA0z6VfrqSMWPuTXedsRnIY3Ti3iZA6r9i5AMU3kWw+VpzgZAXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3JfPtk/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YcrAafPZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3JfPtk/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YcrAafPZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LB4HRW1011843
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 15:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mo2f7WcLf3osCcteJk9O/SCd
	aTHE9e4ZotSTHgD8zF4=; b=T3JfPtk/F9qTRPbRfkl7o2BZSzyv+JBhAXxS6ttT
	MOSjxvRnI4i77iSapmiJCFDnVsEq0QW/Jtnw0oP+13HCbJQZsbIl4o0nBZ7BM/Ak
	dIm5WQtrFpcHBrWUTfX0DPJz2/3k1CpYkjeUEJsBotxlqW8cHl4C1IzB9EukfqBJ
	WziBCJ4gy7miFoopX+oh4xsVOQF0GNzaP2l4PhxJYGlrDMcyomR8Wgf+5BvOL2B9
	dB4LcWEqOCSN3Mkne/6U/Pgvif/ICIcmjzDdVgPKjCyZVEtz3mctUrd2bbmrhx6Z
	XFkpDlnDUmrRcpSLJdCXg+25TftEYna+RLl4BXLJNiiZyQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnt903vgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 15:50:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50da529ff48so104683141cf.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 08:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776786611; x=1777391411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mo2f7WcLf3osCcteJk9O/SCdaTHE9e4ZotSTHgD8zF4=;
        b=YcrAafPZdT4w0HI9crmeu6Qm1XGJuMKjloBjSY57fqnqRb6UADu9Wo2Y/TacV4EkV9
         YBdiYpzJnMdqeIfUPhyYckoW2YeXRO004T8MciBWiELKfl7pnRT9T0xLr6HObPpsCyDu
         mPxGmjwPcWSAUok9zlvO57CXYy2hqGCQ7h8Bytd9YbIZ45BH9O8NNhvBzca07F5DYvQA
         Yvy0mFZ1SclzGTfn8MCDcPSBWrVOH8cAgGH9RHsMHDyuI8WAA28fa5Y5fbJEQjcCOQw4
         fJqd+PbSABXhVcwE7SV9eHk6skA3DLjHejrC3x7+mUtgAd7Id23MZ9heyIx40RUYA6Zl
         1WqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776786611; x=1777391411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mo2f7WcLf3osCcteJk9O/SCdaTHE9e4ZotSTHgD8zF4=;
        b=sS64/343NqRuSu0sZuXu75BTLCPFMvd2l3ytEAKkTRUII5iVn8bO11s6Vs1/g89UZo
         R1XSjYg+00g0yOzPdwNeYkx8L1SQl/RSmxMJjq8AXNMh85SAoBFxKgeWrkclMxGnFBaf
         xrtWF0q6vyKqeqqlyrOFZrc35KAP6DB61ZdZTBDA9044AKb1xqvaNit9CpFjUAo0o3UQ
         XiRHkEob0BZwk47f8cGNLYUXrFuoFc/WreQeDjRg3PcHQOzG/VSwznI2vTRfQfGPpVD+
         xPNW45GcRscla//UH/EYOqc5rzXqzEKnRD8r1d+S59Y/GVNlybaxTFKWM5+38mN1b6Dz
         Ufaw==
X-Forwarded-Encrypted: i=1; AFNElJ82O2FiGY6vrrCV4hXFUDpgxDJm/qR55C11vaJVulZqbBSsqGd2muxxEBHu8I5MBsEABHJImJVYDYU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp4hKTEj+zSwqjcQyO/Ah0C6/uN57BOMtYWkE+qpCAkMZsHm4h
	SGZbvP+Qzmdg/HexjaC8o04LtUpMUcEPIrMjRD+s/DgXU8odiqnK+lDF7B6p9F/E4ZPVrjSfDQL
	MmL9NxvHjerPt2oitqJRZTYQc87z2q5Jhvz1HTj3s7nlVJ2AfW/PXdG8DVd3HUCI=
X-Gm-Gg: AeBDieuEpgqX5qL60I1Mazfy3rpTwSHd7QpIRIUam9JgO/4S8vlkbrsFCozlu4DTAMF
	nnYTqgeaUeBJPp2b53+m0s6nRsR+AVjsYtAtGjb+fjhi9Q0CTLb3t2+0SCqufQxb+q6ydHAVpiN
	Br/Hv95qQSotwr1Fo1fl/rSK/A/yrCndsW1dzJAmR/cDhvGd9JkUA9P613djKq53c6sufpw8Krt
	FzCiA3C1CWnAPUs+IHQ0lJfFugSchNwC0SEVhgyeMhfRZhhCjYAZE/j3ungm0yEEQ/RTg/NVRmD
	xgDYp8wgt19UsCgS2IvzmSOXn6+Ed97TjNGsTAgMDoVxz9z2SqJeaW78Cklp0W+7ZGCHGLxwoTj
	DcEnX8J8vMWooh5Xyj+FEihPwxp5EsdGdZSCB4iOCXDFq/S1Nv+z1zZ8NbjVzO3cMDvZnNpDHxt
	NrOYOcUsiY49BjMnlKEZqIQ6YuBkd9B/uMey1LmxE2FAYZiQ==
X-Received: by 2002:a05:622a:11d5:b0:50f:b732:202c with SMTP id d75a77b69052e-50fb73225a9mr33343821cf.19.1776786610423;
        Tue, 21 Apr 2026 08:50:10 -0700 (PDT)
X-Received: by 2002:a05:622a:11d5:b0:50f:b732:202c with SMTP id d75a77b69052e-50fb73225a9mr33342531cf.19.1776786609679;
        Tue, 21 Apr 2026 08:50:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185c8a33sm3824506e87.36.2026.04.21.08.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:50:08 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:50:06 +0300
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
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 12/20] drm/hdmi: Rename
 __drm_atomic_helper_connector_hdmi_reset()
Message-ID: <5me7yklungth6sss5okogfwtr2ed47fwaq3rxnfbhjqgauefis@h2c4kbfk2sqe>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-12-c63f1134e76c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-drm-mode-config-init-v2-12-c63f1134e76c@kernel.org>
X-Authority-Analysis: v=2.4 cv=KfbidwYD c=1 sm=1 tr=0 ts=69e79cb3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=P1BnusSwAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fOc9-Nj7kuNS0fQUIscA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: 13enmoVoDQA8N2lysHwmenAmHiGwhy6X
X-Proofpoint-GUID: 13enmoVoDQA8N2lysHwmenAmHiGwhy6X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NyBTYWx0ZWRfXwSA/eZWt+ooo
 o7o9Kria/0H9nMvIeYIUh/KF9ye22nrW4xsbUIesKNJlZ/n30fylYzlITtU/qhWMa4AvYRrOuDp
 +WrjT4vZ2Glc52e/HR5uKcQh6Xni/RcqQmR6mb6FpTnwantIbxPls5Z0ZwLMKnD5qlsxOCAzK0t
 JZ/jiQIxKYiHnZ8kXo+Xn9rO7/MxXlcOIM4v6DM4RJWxvnxVafyVczGbxd15wMH8mFFeoRT2SkV
 T6mgldrs9kyuHWjugLTJYUsDE5RrgzsoAPAkKaQG54WPGOJS9VjGMAasGERnhLv0WpwYSD1nVMm
 BaXUm1MMW3a5gxUBmXL6oRnB0jQzZbfcljZGWjdg+6PlfFVMlg37ECAsVCAELsapdYwOM5bvVuG
 X8dcrvjE81Vs8h9AMKB5DxPtkrcmRaAuDkXbGcor+LNlrPKC/hEnsPBzZZUtL+lkdP9GQ2k0jMk
 ApUH6GFF4hwnPEWEHAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210157

On Fri, Mar 20, 2026 at 05:27:19PM +0100, Maxime Ripard wrote:
> __drm_atomic_helper_connector_hdmi_reset() is typically used to
> initialize a newly allocated drm_connector_state when the connector is
> using the HDMI helpers, and is being called by the
> drm_connector_funcs.reset implementation.
> 
> Since we want to consolidate DRM objects state allocation around the
> atomic_create_state callback that will only allocate and initialize a
> new drm_connector_state instance, we will need to call
> __drm_atomic_helper_connector_hdmi_reset() from both the reset and
> atomic_create hooks.
> 
> To avoid any confusion, we can thus rename
> __drm_atomic_helper_connector_hdmi_reset() to
> __drm_atomic_helper_connector_hdmi_state_init().
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c     |  4 ++--
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 14 ++++++++------
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  2 +-
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  2 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     |  2 +-
>  include/drm/display/drm_hdmi_state_helper.h        |  4 ++--
>  6 files changed, 15 insertions(+), 13 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
