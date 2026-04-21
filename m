Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FCB20E334
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 15:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776786751; cv=none; b=WEI5vLEoCGF0YbKgHpn6ehbSEnWBwgaHOmWULgNJxSl84M+wlUcNPX66o5AvAPTw+Bbfhwu26X1k/nPHipJ9uKhWPocAByD5kwJtnQeK5nf4uoVx/ohep0D4GimlpGJhdKlm8RXi19wE6JPdkoXJLkw4B/iQsBPt4sXJ4ZNJ1gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776786751; c=relaxed/simple;
	bh=GNs+gPCDV0nnnPJigbuhD+D05AfAFH7qyRS83GJl/hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWibTio7ZcO4YQRwr71Q+k/S9IBFi9ub1B0sPl/kv87D9RPGmIN6zIn/WCdTJw3FXES9Bauuy6cu/bjPrnIO+pYJrw4USPZzo7hJDhRdGtxLcV3vLdp7CFa/A3hWmH9wJqx06gNi8YXEHzvtQcxp9mSDUvnMJtv2vJwKMbAI35o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FzMpBM44; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=egxNsA11; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FzMpBM44";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="egxNsA11"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LFbSe13337238
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 15:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b+TpPDtb4A8gF0EfZG351FvS
	a4dKKMV4oqQnvGwrL7A=; b=FzMpBM445RAAHk5vR+lJe3EuQLfi6pcaUmmL6Xb9
	pkqyCdRuKRhZYAeqdBBJ2p1rB2QhDqfjc4uESrNlx8tLhu9mFxQavV7cIkg86e5E
	jl1qY50x6SO9v9RStaYY3lHz5+nW7bmI7NcFSslRK+7b+S/0C9IUrmJqcZATLUJf
	2A89t2dcihv7AiNmjqqmr/qGXD8xwxUGwSpTeLRoWZi2riO6PFahpYkrbwsFUpRl
	XBQZJyIiY/EUvf9DgVklf9v/P3PRDwS/API4JnlMpTcAHWX8nB71fgG+GogTQYds
	S5CZ8df8UR1qDGBLUvIErjMWyL3xS3pbyYK5gM4Kf7TSbQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpc1jg1qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 15:52:28 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9539bc7e2d0so7424144241.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 08:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776786747; x=1777391547; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b+TpPDtb4A8gF0EfZG351FvSa4dKKMV4oqQnvGwrL7A=;
        b=egxNsA11Ed0lRG5gZ8rQWrmAKb+QReamD6q+fE5BTGk/QmSo4hK8fCiOPTmzsB9CQF
         GSOthHI+uX95E4Oulx9PmasHdyomrcmcPy5J5NCClVLYY95r1T5RYZxTRFdUpRtU5j6h
         EFR2/LNT//BMHu2/N3ESA/PUFVRgh+pSq5+l1SO6lcF4KqUedbTerpldu/6cNLOIGglZ
         EhvekgCNVI45KAbextXJlNKmlZaPf2yBLIj2DzB/D6ZG7JILUaCN9rvadTIMIyM61Vvy
         6eU48gv1zX63VD5F1NZdkN9GVcK+N1pTpLG7+4WTb61UOiVhfmxWpv/1P1gy8QLy7BLy
         i0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776786747; x=1777391547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+TpPDtb4A8gF0EfZG351FvSa4dKKMV4oqQnvGwrL7A=;
        b=cd1Rn9IfxaDdXHGRAWpZIbx3h2gtdmrLVgBWb+XfxwDZYF2h5McBJlC9XCkKgE27dL
         iiy8nA1h/SWamgXXzggw6Q2G047SfQkGXqwHt0jY1Ab9qNnefDXKEzCjL8xEn3tQD1+Z
         r/oTk4PKoP48WZTvUKz5yA1EJg0/UahN8W/FAZfqx2gJ+Emg5ucfNW2cwblhPRHAuLSu
         KlQfPIxB93izcEHEvrBkwwXLG+E3vR536aM6ULJR9YMR29YJr0NSFAGqnKeevlUSxWML
         um7SUthuXVcqh6F79NazzKLMLH1hxlxoiwie5c86DYE7IBYm9ByqFi7RkuCBUGlq9F4i
         XsbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tTRSijhARxyDwp6wrKu/E1A8wKrCEHFy0Z40bCT/oq3r6DEeYHhh2bv1il/XlOzJJ+fS/0pJYr8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJxISHkGee/4j8iKXUvCJzlrocaqjS+bB83O2ouQM2t0U9AplC
	cy4IFxXnao0phLScI1Ye06fuNMaqI/8ZY/Z9y8f8Y3XUHUB6OqLRrFFIGFB30agRG+lbgpk4zsw
	FSTS5bMEWLJ36nrU8z8mGc2JQRg//ViG+xJYnUnYUPMrN5o8gx0UxPygHU0fP4Jc=
X-Gm-Gg: AeBDietiiq2bFZq6TuTno0AihyodGJF3I3gc9xUALE+rtWXxAtUOVayxef4QWymchEv
	X3S0XN4f2S7eYQAav2bx21iPZ+vkkV5XAMO+N0anSfjDV6hHshEREG99QBcON+SxAoc9eexH/m9
	ryFAwYQ25AikZwx6yCghSnhgR/bIZNIK4xtWZNmzwRhgn1wUDR9SqiMZ4S9r63nplX9A4CuFRGj
	lQTCHkgb8zkctsQKyNpsElkbZ9YThjfiGOxl/JZCMROjHRJefmrbjquoJROYMF0pQYRgPGO9QgN
	gIZgh4xlH5y+sSM+A8Bpl/0gEsvxpz12430ZyDZ8PaErL6zunbboMLjsLJwafPTaU7+8QxOgkh5
	DDJslLyCkrqZZbRVRQ4VgXwyst/srCSjrn+D48qQqJRrTUDD4r3iUurt4ehtCwcuzSC1Ecoq4tb
	quffoPvZVaDZzmxumUGdNDaEXPp/wuf9PWGAatpPvLL6y8iA==
X-Received: by 2002:a05:6102:5492:b0:611:959c:86b with SMTP id ada2fe7eead31-616fe259128mr6807892137.16.1776786747164;
        Tue, 21 Apr 2026 08:52:27 -0700 (PDT)
X-Received: by 2002:a05:6102:5492:b0:611:959c:86b with SMTP id ada2fe7eead31-616fe259128mr6807884137.16.1776786746729;
        Tue, 21 Apr 2026 08:52:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f66besm31845671fa.13.2026.04.21.08.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:52:25 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:52:23 +0300
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
Subject: Re: [PATCH v2 13/20] drm/connector: Add new atomic_create_state
 callback
Message-ID: <kxp5j2tsermgycxq2wtxsvfml7etawwc7mew523rtkynp2x6oi@trsnzjwlnjto>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-13-c63f1134e76c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-drm-mode-config-init-v2-13-c63f1134e76c@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NyBTYWx0ZWRfXzP6LfTWu22DZ
 ZRjaTGXE8N0eWS9By+j4c0qFFHUhcykBN3dX9cKS2oOsdrUmG1HGZEASRGgSnzklNtp+THSvyWQ
 08/kyBoonw9/mI0gxGCtgAW0h9kmvFPAEd3cJZU85YyK/nHoHUzu8bDBrAi1DhCw//OmhYsbQdT
 qsc74kaPlaO0t2qhge6jTqAp3857rRuFuzlUq+Pquaf9VVPaJR9yU93hLok50djmtnQAI60qcuR
 S7M6127ojnw6du/8Z5FvlJNDVhl3Fgy7g8NEzlOeBCclvaPcICSiAgKy4lCD65LwWAGpt7GiZZh
 3gWGX7g+6qcun1nvNyOMvnzLq5z2z5FtDbzyLuKnoxG2ygaTOvgoB8xPAqHNCmQWbG8jSJMvXoa
 k+wG5oJ2sApkMrFmbVkJxy5qHw1KlTarPqxTIO6nkdlTx3j5D3kb21OtmJoYdpHuvlwUvC6zsQr
 8PyOQl8RXf5FMlh8sTA==
X-Proofpoint-GUID: hl4kvIto4tNrkwVF-XNVHOadARmhJ3wI
X-Authority-Analysis: v=2.4 cv=IcG3n2qa c=1 sm=1 tr=0 ts=69e79d3c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=sh7rbVFwc6wKdXg0ZAwA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: hl4kvIto4tNrkwVF-XNVHOadARmhJ3wI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210157

On Fri, Mar 20, 2026 at 05:27:20PM +0100, Maxime Ripard wrote:
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
> Let's continue the transition to the new pattern with connectors.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 45 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_mode_config.c         | 21 ++++++++++++++-
>  include/drm/drm_atomic_state_helper.h     |  4 +++
>  include/drm/drm_connector.h               | 13 +++++++++
>  4 files changed, 82 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
