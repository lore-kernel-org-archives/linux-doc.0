Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574293451A9
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 15:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776787130; cv=none; b=jCBKXrT3pU0c+OTPHwcKaEBxr8kYphH9wO5bNzLrsu1IPFCN7YXd2WIpgwDgpWAfAvMkNsLoVvLKzZH28JcZRpyTSwQ+Af87pRNyIve7IH4fjkF/Ptxsxu9eEadpTrIO9BOIrRSGG8KvtSX7NYfAcmz687dyCuOcXgh6yohYI/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776787130; c=relaxed/simple;
	bh=w2PYSKSQEUm2HjPn/LjJUHhEU4iqxj4SQUHJiEAXPq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=moD3ZhTY8AIxnCamnwY9OCh9I19RNI8sHnvK+mAWl+6MFPVaoFERq6mErBz4c0cXxF4qWX6c4X5+f3wvKpSN6wcnyn+2xNU3IcgHS6BSKKKxYQ0BsAYwgt4gVMyB8FuP7z2Mt0j4fgAokKFJqYyvleyCukxcc3vXFUC9XXLEk50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0SFiySz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=arXujhC+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T0SFiySz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="arXujhC+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LFbI2k3337117
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 15:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2rlmangFWK+0INg27+5z36YD
	N+j/0s+7d9Y2woRTfSA=; b=T0SFiySzaezo2/7b9AmZz/YWbxYaR8QXZFSTRY9E
	GIJG6FUoGiv7oMrG/MuhO1luUIBzqDS9Di3R8cHZkheeVvtY9tnXtBv5c8xdqnzO
	mQY5VYjrqIGt5qiBU1i/VnnwLNYmhzPWxcl0Ag0LfyOa2DlgIHfJ3ruMbJh2/K79
	iYHNsmis4GWjcHz50PQ1pjBQvjUWhUAvlQ+UD1NQBZVJ/Dm2vTiR4tx45k54ZUDk
	yHUW3E2/4Y8RmVns3vj9kkK9gIjhyoMvvdEsmWPAQ3vUB0GDzHqMOFcmp9mtBVmz
	LvGD7gdvz4gUMMwCImnYk3adl2OhMTbdM3y/L4+aHoDtMQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpc1jg2hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 15:58:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4b81c632so100770441cf.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 08:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776787126; x=1777391926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2rlmangFWK+0INg27+5z36YDN+j/0s+7d9Y2woRTfSA=;
        b=arXujhC+BTGg9QVN+CHq8bGHTSaHzHm9YFnbUljLBkHnhPHnx6fshw22EiDKWO3dtx
         oHOZulOiMhkpwBXS68/eIsGRDZGWNKyYu6Q2wQo77JV/nQkOv/NDuiOMjBMyVu5Lfkmn
         Xt7diRGflR7d+eR7OaX/PKXl9i5yszSCisq0B9VmxPNxLxohx4r/4Rp32lzpCnpIEbKp
         1Of5VHkEeOs7ppkv0dhET+xtDdG1gcJBX7C9V0RuZKTYWwjGlQS9EepGts/jnJTFY0Sp
         8lZsD6WiJ0EKGZXkLUdy27p0dGsUHTtIhBhGr3rbUFCYeYgLa6eBF+EAynMFAoZ3RYcc
         m89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776787126; x=1777391926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2rlmangFWK+0INg27+5z36YDN+j/0s+7d9Y2woRTfSA=;
        b=Q7xBT+bPD1+jvopLTtCcCHZJJf4GOxtNUu8bucaEvo2f+P2AEYh9yrbAPozSY6w8Cs
         422YLaOBZxesFM/bI/jMhGggmYvDZYkTEy/+oH+UqpHn6G7vP6n/kEMsSf3LSGRkvHSA
         UDihSB8z0doE0rNxui9q3FGblk+ezdPmCKF2DE9GPnSmEXQThoz9dyv8N0TEahYRa8b5
         7O1fHLo8LQb0OZLPoVutHWaLk2Zhfn/gD0uCmKBCPDyQ+UxGh4nbTLAkeSVqvAKLTMMv
         U5sg9LgLaUnyT23WyNn9xbeFMg82mF0yROidoaOCTC/njyFu0j2UAn3h/zm2ZywSrwfF
         WaTA==
X-Forwarded-Encrypted: i=1; AFNElJ8mBlEfsux/mXOqVyTWdmB8gPyorVfrbujpkGZRjWJQ63U7zFYS/U0v9+gM2mQ/M5Jb8uLJKSjmH6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmUfezz7GhmAY1vsL84lOlK1OzsWJDv4ElFMKCLUnqLpDOhE/m
	a/NWNm/X9ZgDKXwZ3nzyOZjTuLxDR5Sg3Tz5jb2kVw/UJndBFg2+okVnpWC4dQgcfEghUgduAeC
	IgerWtr8+U0C0q6eZ1w4GxJUoWQfUm9hNaSlmCbwwvLmth/L3hJKukbR+K/i99U8=
X-Gm-Gg: AeBDiethIPMJ3vqRgkig+Y27GlirmRlIOtr6tgiX+68butiU9sDYA7m31+G0PJpfVU+
	G6jvvtNXow1hKLxvK9TuVlNoqLA8Dq+44Cbzfgn6OxFXcgevWW/9Sl/CymtB8/q9hUMKBmbREBJ
	6PRc8I7/1LzRg3Ay+0FkmaZiw+oLjbD2pato9a7PMN40Xnqhl/dMXZc5Hrm01mYjwEw/gKB78ub
	I/Re+abB1b1oDlAgTsXAF/gI656FiPoDxgDT53p1sijD1JnlP5488/Fp2bXnb+6bu4+KjicZXBM
	hrpshYqBQk5F5FBELwn2ELahxAj9byMT4Y9E8TNdqPQOTZvy7cyr1EuKIsMGw67ZuAQFkvPP89Z
	wZ7w224z4FwwZskvhYtMuwtCvWMjuDoVB7MTdJFgstcSCP0AKTtGyZ8KrKcZ58wqU1AcWx8oj0/
	bONpezE6FJ9CiNDoNwujsLJXXkyGkwOOdCLFruf5rkV7FDIA==
X-Received: by 2002:ac8:5a0f:0:b0:50f:ba8d:8b62 with SMTP id d75a77b69052e-50fba8d8caamr24329421cf.0.1776787125500;
        Tue, 21 Apr 2026 08:58:45 -0700 (PDT)
X-Received: by 2002:ac8:5a0f:0:b0:50f:ba8d:8b62 with SMTP id d75a77b69052e-50fba8d8caamr24328851cf.0.1776787124912;
        Tue, 21 Apr 2026 08:58:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e12c8sm3767238e87.49.2026.04.21.08.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:58:43 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:58:42 +0300
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
Subject: Re: [PATCH v2 20/20] drm/bridge_connector: Convert to
 atomic_create_state
Message-ID: <b7heherpjabs3xbgzxvaznyvfk5ok45uqrjotgr5esy2ctuvff@t5o25d65j37h>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-20-c63f1134e76c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-drm-mode-config-init-v2-20-c63f1134e76c@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NyBTYWx0ZWRfX9b0u49+M7c2K
 /D7atsqZr93+aiZixlbWRv0IlqrGv6cT0HtbPDAAjnMEP6ScKfEALTfKxTKQ7nVzPTACaw/uH3M
 Z2Qlke4wzfUjwM1kNN4QRfKGQukeT2wy+ufSkNU+bfBOfJfc5fYBbLgDSSWe/D3FzLrE1NhTbyI
 oq0CjGZoFsJrvti3ElkIJfFhHCQEwkU5ppsg/jZibOm1FOP5CShtbsq4RoQDbcwy/qWwOQ1VDv6
 eCO5wiI3B28mkq9gkJ7VwAS+15RiD4dFiQ/YMNnZS3Jr3ikYv9B2mhOOH0qegqmQZDVYJ9mUBOP
 W8V37bgZI46prJc6AnF07xnUu2DeySzHvw3xG6vJn6QqObtlN4soKBvJNUSFrlwSTFHGWypyD0s
 Ra/1zBUFTSVGc8Wrhb51a6LZVCg+eV32kyChs/RmZwlr/DuYk3s9XK07Rgq+VKYJ+thnIkxsdZ9
 k/0lNgNt40CkLXzbA7A==
X-Proofpoint-GUID: pMqo8p3Wm1KVruDSQGFenUWGYWxxcqRw
X-Authority-Analysis: v=2.4 cv=IcG3n2qa c=1 sm=1 tr=0 ts=69e79eb6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=P1BnusSwAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CGuZyk7pIeUWItkfYpsA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: pMqo8p3Wm1KVruDSQGFenUWGYWxxcqRw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210157

On Fri, Mar 20, 2026 at 05:27:27PM +0100, Maxime Ripard wrote:
> The connector created by drm_bridge_connector only initializes a
> pristine state in reset, which is equivalent to that atomic_create_state
> would expect. Let's convert to it.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
