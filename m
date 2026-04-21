Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6AE363C40
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 16:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776787270; cv=none; b=dUaytcEIXgi/H3L5mINCDOOgCw0+seWZdat7JCuYS7r/F09nABnoI46NDB1g2U5kDk4jqotqUDTQAW9FcYgl3ootsNSEYypCtRakJ5wzYI+gjEezA5j+8wUprqWsC5/nqLrrGkPowT0kSGMVE2CGwB0KxL/wmTB94HHgcot1paw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776787270; c=relaxed/simple;
	bh=K5A5IBj81U0pWcmLlm9AaUPwcY4KMqLy3IiFW5rGiTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAA/vl3T6/Pm38xqFiWGWKyrKqjn93tQs1Q/7c2s4rznxWwB5Cxm8J2NoMCDoCr/Ui2TFPJZKZXaU0FTzUWIByPyHFcAluHozOluY4MlW68vo5w1QV6/cPt82iRKIje5rZbYcWifshlTlPs/gkBYDMvqz8cUm/LrZlarYn0PgQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzbnoL2g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IKPee+Ib; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzbnoL2g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IKPee+Ib"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LCbVS63257367
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 16:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xLFoe4oGDCwTz6b0lGYMIAWT
	Rfszp9f/hXCp89ws9Mk=; b=BzbnoL2g7OaAxndjxnbTnrQXShsD7Wz96KcjUSvZ
	6Tsi/MRp0ynlWCK3xvISh++rq4+7VR3d4KxiUGp5YwU1KKObEivtapREcPNEd0ML
	9LsVPbRM6PWULYn7gISno1YYB4nIyRkS5zUU6y7Qse/xBRmki1c+KmEc6x/PpNHu
	WpwMDahQ8BWa4r2R1VEQW7r9L5xiz5hClS3Lh8YJZ8Di1Rmn/uUoACo5ot7CLtQ9
	R4G/ylpBTDdx4hMXttsZkARlomwjggP3jXUOzeY0jyJoRb0sK7hxYrVVO9ptY/vN
	TbwIOOBIlm7oYSFE04tdIxEIYSrRnpR5Fs74YVyVMxMbpg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp3naa33m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 16:01:08 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-46ef241b62aso3580985b6e.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 09:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776787268; x=1777392068; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xLFoe4oGDCwTz6b0lGYMIAWTRfszp9f/hXCp89ws9Mk=;
        b=IKPee+Ibpu6UYt7SmxGk9rdXBkZD7B/R/3H7aVGZGofzvJK5sLtdJuwHHFQ1gcTWCB
         3HPrRP0/I3W5rwosfUTi7JHkpq9NSM5MEOQY1CU/9cfy7fEz67CMarMeyrEC/PU4zCfT
         uIE+ahm2yDUdoZybif5LXt8T78Y3bY5skTNxVCyltVO1yxlhUWVel+bLYoXGT+pPvk1a
         lpdABSYv+8hmMrvdeKCA4h0nsZwFTahgB6ARjixTAHI72XgNcgubZz+g81qybtlqJ36g
         QyfrONG0vrA1ZDdgFXwqDsko9p3Op5u4EWSMpbnV6DSNTLPBtqeif+8xvvlcvD2OzFOM
         9fEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776787268; x=1777392068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xLFoe4oGDCwTz6b0lGYMIAWTRfszp9f/hXCp89ws9Mk=;
        b=Et+aqIslsT7VHFvHzwdLf7WBZB8ljLTQfivc2PBZ0LNvzA1ATt42NnbqlmLokIgeMQ
         YWV19mBfG2Dg1N0QMDpApzeEHuk5hBtaxJKKDpHHepIUeosDpH1zdT/dKR/AOEABnp9I
         71eF8OvuLVvAwe0RmuhRZrm8YD5gVqn622VLkLj2IzeK9/yME1zfHA6TbR2j1fucne+W
         MZpEPSv7uJSkvJe/MrYOvL6P9trooqtVH1jQAzV61aFhWLVHkbfQzZ0NFX2vYe9uKR5l
         slLNMY2Eyc+T3vjiEvIMBmm/cBogJVuQsKnegQgLqz1abswmUZfz31tZojCg9Iyqu5AT
         yTGA==
X-Forwarded-Encrypted: i=1; AFNElJ9geC9je5NKOhbnpViYBB90FlOxiyvB7h1xPXAXAn5K5XPk4I7I8zcmxb8UsjtwcrSDss/1QK51VEs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFNqPwlxSU/c7eNekuNcL9HhuX0zJG7xaHnhmnpY1PYQT9lnOp
	QL70VlC4ydAhptADTvscbqxanUVVsIX88iqEeta7zeHf8D7PvYeqxN5UdAD4skmet8kKx8p6zKs
	sT/XFfRO6VUpTLZ9aCs8nSs3ze3pumU14Uo98wdZ2QcXWp7haRPb+qyGCe+2MrR8=
X-Gm-Gg: AeBDieuMN2BrVx1mW5CL3xKOfw5fjlP0QaP/ezZY7vHAAquucdl+fELPcGy4SG+9Cgt
	hZtsJAPTLMXSN62GgUeDPbxMHaqjU/Hl50gWbjB9DXvu1u0JuOoMA4D5GPzk6qOXZ6SWlsgzy73
	eyjYyhu72GxfrkjlUkJT4NvJL4Pgd+BzM2zec/asEa9Ca/7eY1PzSAJNFiORmwlzlRKDJKqtUn6
	KkKSJUJJbzXjFDGX3zhQkYN+rKi2z2e6N4XvHV5MMm1iTRLiatH5ZgbWrdussm6lWMMxQDZHOlp
	DmrVzBHmm40LAhuj8up2k+O9io+FYnyzb8oGM8yWmYJ4TXuJDx8vzozImLqIm4N6dHBnDoQePPw
	yE52fSLBaFis0tVgDVBlXQN0pY7XgyievbCcXLmutLlbtHcvfwehRgfgIhuekpQWPmqRZCJwQjR
	IPKK1B2CJ/UgPNMM196KhxspR81eMUtJ1Bc5+mFU/uXglCrw==
X-Received: by 2002:a05:6808:1394:b0:468:2a6:e32c with SMTP id 5614622812f47-4799c914da6mr10924412b6e.10.1776787267438;
        Tue, 21 Apr 2026 09:01:07 -0700 (PDT)
X-Received: by 2002:a05:6808:1394:b0:468:2a6:e32c with SMTP id 5614622812f47-4799c914da6mr10924279b6e.10.1776787266651;
        Tue, 21 Apr 2026 09:01:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad143sm3806113e87.7.2026.04.21.09.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 09:01:05 -0700 (PDT)
Date: Tue, 21 Apr 2026 19:01:03 +0300
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
Subject: Re: [PATCH v2 10/20] drm/crtc: Add new atomic_create_state callback
Message-ID: <bmw2xqyaam6rr4c25ccxonvd5nglrw4iihiy5naznozcevs67h@ub5ycjvfrxjd>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-10-c63f1134e76c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-drm-mode-config-init-v2-10-c63f1134e76c@kernel.org>
X-Proofpoint-GUID: 81yZ-ZpSzlWjU0Ospak4UjoVb0rXbtuZ
X-Proofpoint-ORIG-GUID: 81yZ-ZpSzlWjU0Ospak4UjoVb0rXbtuZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1OSBTYWx0ZWRfX6QB0vareje0R
 2mei/371WMO9ouPz7KV0bdINiroiF5hxeFIjtoo7doT653FhhlVtjtr6fzoUIM4cf0F2qVCWYWW
 Fw4uHj9QduQ3F60pIwzFHtYiROei6JRCVJAw7LUor6o1VfEc1Knra7nU7xMJSckAjuWi5f9WGaz
 8oQxvKBXloPoT1/sYHK6YFUgKrt8sTxqYjC9AXGEcRushFtRjZJ8k8bOPaJcOImZ/lhDRr6Oovn
 JDuj1QAtjmrUu7Fg3n54gM6RR2pOlfAajRoN7SGQU4PfQV5aiWZ/CQyMPQYF0/q/acvZP2izWR1
 i8/2QeWogcqVgw+4RIRWjgK+1IWjik0/0t2THL6YvDBxmi65/SJoldZ+3l5EsHZav2Wn6TJSxHY
 DbUHdgyjYgJDtor174zDZlZSuoaxlEHYBa9InDiMwFJye/9qh131/tWUjLjixfqUIVyzPbv2K6e
 Drq1mHRFDrF53wc0w2Q==
X-Authority-Analysis: v=2.4 cv=O9cJeh9W c=1 sm=1 tr=0 ts=69e79f44 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=sh7rbVFwc6wKdXg0ZAwA:9 a=CjuIK1q_8ugA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210159

On Fri, Mar 20, 2026 at 05:27:17PM +0100, Maxime Ripard wrote:
> Commit 47b5ac7daa46 ("drm/atomic: Add new atomic_create_state callback
> to drm_private_obj") introduced a new pattern for allocating drm object
> states.
> 
> Instead of relying on the reset() callback, it created a new
> atomic_create_state hook. This is helpful because reset is a bit
> overloaded: it's used to create the initial software tate, reset it, but
> also reset the hardware.
> 
> It can also be used either at probe time, to create the initial state
> and possibly reset the hardware to an expected default, but also during
> suspend/resume.
> 
> Both these cases come with different expectations too: during the
> initialization, we want to initialize all states, but during
> suspend/resume, drm_private_states for example are expected to be kept
> around.
> 
> And reset() isn't fallible, which makes it harder to handle
> initialization errors properly.
> 
> And this is only really relevant for some drivers, since all the helpers
> for reset only create a new state, and don't touch the hardware at all.
> 
> It was thus decided to create a new hook that would allocate and
> initialize a pristine state without any side effect:
> atomic_create_state to untangle a bit some of it, and to separate the
> initialization with the actual reset one might need during a
> suspend/resume.
> 
> Let's continue the transition to the new pattern with crtcs.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 47 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_mode_config.c         | 21 +++++++++++++-
>  include/drm/drm_atomic_state_helper.h     |  4 +++
>  include/drm/drm_crtc.h                    | 13 +++++++++
>  4 files changed, 84 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
