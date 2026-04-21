Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD952DA76C
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 16:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776787332; cv=none; b=KFCdBmBjTflDjkQIA4qrEheDCuIwFJRtUwQc5gS2xhf9JcOqO4pvlTqBO0Y/5Khly2ZTs+2m1vSbCBYtpCgYEpdiPxngVhTqhqS7FF6Z+VaOwc81XFp/YiNR16MRx6hNHcwDUE4pkxz9ZEo++EC3X5cLPUH8TQUcaUrBRMWKvS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776787332; c=relaxed/simple;
	bh=vT1w5VVaoDof8uokCQo+xengm4g71tyRJzvxTA3+bvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4QKjeb7rrAM9e34ySXn91it+fwWKUmoF1DX1Mci0/4MRMNghl4ncy4/U+YDMvF+c4iJcAvxsnjZX7Ktgmv+loeg2o/JBzCur93KsF2yCXoa1iCkGs6Hlx+1H2ClOulzcjrIHkuOmx1I1BuKR1NIADiD7EetFYBiC/wJuG4FrQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DoC4TJD1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HZ169DpY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DoC4TJD1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HZ169DpY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LA3akd1085759
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 16:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=laMpQ/PEThA++8VKoCP5uoEG
	KvqMhipe1NJOiXj6OFA=; b=DoC4TJD1tox6cQCMrbUYn1E6UWT7nQKw64cl8O7+
	NPINHQmS86XXE01DFnSK+4Iq8z/cJ9md0LTLnXSvwDY99fNJEnGBBEtU2hXt8Tns
	X/oZu1q8unPKTYt/aULiBdGGz4oxZot83flyQIozJYQI7cHemjuH9wj7Nid6f/Ul
	8YZSwK+xIBYxPGW368kAHIHy3ICmMhIMt4BK9nnyTlys1W/VZdyVlJkg4HrkGdVW
	z/CGvbjYIFmHKcpRDrDGBTGKC+OKGu+5hx+6iAc8n9bZY8VbLIYiyeQRd+HhqlTi
	y+Afw1j0QBfYxjVU8jsbrX3BtzHQ4NhIhObbJwTXckxD3w==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp75a96nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 16:02:09 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-47545742e67so5892253b6e.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 09:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776787329; x=1777392129; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=laMpQ/PEThA++8VKoCP5uoEGKvqMhipe1NJOiXj6OFA=;
        b=HZ169DpYfJasw8jWRFYrL5DK83rA+Cu5Y0UUdqPaKAnhunLJxT/5wm7uIR9yA/zeO6
         riUXkUs7lFLPkNAdQJgk7RehJYojkzmnX9KzYMSzuFn+B0uJBPNGbh/HA5lUslC64KVb
         XGaiy3Wx9xgrMLbHH+JPioGSaV/pjA/nLTepUt53AD4pVTA07GyPdXuq9jOmFsMsbdW5
         CUBYCvPbLB3LyaHorseOFrYplGWvWu6FyxPIuMKnltNmqI06C1EnwjsOP+G/tt1uJ87/
         4co7NnKKG5jOI+OZTH6kt4NOyQ4atlrRt3c+DJGxOlQ7gu9SpxQAKeCtm2MVtH8EGBki
         dr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776787329; x=1777392129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=laMpQ/PEThA++8VKoCP5uoEGKvqMhipe1NJOiXj6OFA=;
        b=NG2T0QqcRJiecSO7y3s5VywxP1sfbTtvSMHou3ejDjVq6Pq6MmduR6dUFOqT8fIpYd
         t/wUVD0fboxfBa13EhIpBSU1ds/ROP5CTX0vcX9+5EEkgjW0upESl142cAP0xCN0bl1T
         adDolBe3wfZ4/rqV3KEeBUq/EkAyV2sNq1lYzm24GKeN5ucZrBo9qwTRsKl1TjiXiq1Y
         FhtQvypgC+3kNAFPRJPluRtWOizWo/mw1pjiG1N3YbDQKBtz+9wAAtHtQ9MGyVhltf8F
         zxs4dGv9Oc219w4URN+KuT2tlYBLMQkX1mWPd5J7a0fxL7DymR3ObW/iG93R6zLcHFGk
         7TLg==
X-Forwarded-Encrypted: i=1; AFNElJ+f33AKs+2EgavGknyqaBvDZQRNQN+cfJ2KLb51cd7IxwyWjzKHqmQJCc38x3mbhH5xL45nwy/QTzE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNI+MGr2vUSiU3QZszOWVTPp0flW+2lwFZhz3/FbJvi8t8NkIg
	U8CKXdGEz0Loc5aX2ymFvzqYBUkLGenS/uzypDGnAHo1/usNmSb+sedACBlYbAIQHKw0zw49/ru
	I0ugnWzD3FJ1MLwZQyZk/D1ES4cA3KLCcoyJaMlWPXwCnChxiiRY3yD1oG7lwqfE=
X-Gm-Gg: AeBDieuxBS47eXEgMlg3TbpDT4MYdNPbbZhzjBnXxQkrcdXo3/T1IAAoQ3gyyqYwvNZ
	yhTxqAH8zRfaYIJO0hh/weC2pLh7daK0G5xY57DB6Xzzz+0wJ4z/IN0r3YFm46qRT7S4ChXEG1Y
	6BLiKxyAnWz4XokqOaiO4JZuXJHGFhHti4gj0arGfVJBknV959H9yDF1XouXNY5hA8cz3dHktfV
	zib28yRfYsPxoxICWTq+bn5QrKtI0Wx2HiGg9kEIPPfypzWBg91r9OGJwfBFZcunkmLWyg5orWb
	h1ncDkr1wyLbnvZ769/Qt1yCDF0vZglM+OKTssgQh3s0INU9dlpZDwcbOXjGSUSKbR5l+X3d9bf
	ycr1Uva/ft9s6USfgSmgt6gRHpp+p+rC2VTWmLtWrbW+U3E/MC4FTunKai241yiNslONQXvMvco
	UL8fodjJmvB4dn4pNk5Jw48JmAWd36XpWL8pCQ9riowgrJtg==
X-Received: by 2002:a05:6808:4f1e:b0:467:1941:1f18 with SMTP id 5614622812f47-4799c951609mr10816725b6e.14.1776787329112;
        Tue, 21 Apr 2026 09:02:09 -0700 (PDT)
X-Received: by 2002:a05:6808:4f1e:b0:467:1941:1f18 with SMTP id 5614622812f47-4799c951609mr10816664b6e.14.1776787328396;
        Tue, 21 Apr 2026 09:02:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb7613a9sm31882641fa.41.2026.04.21.09.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 09:02:07 -0700 (PDT)
Date: Tue, 21 Apr 2026 19:02:05 +0300
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
Subject: Re: [PATCH v2 14/20] drm/mode-config: Create
 drm_mode_config_create_state()
Message-ID: <uzfggjuv3yfegfnzjd4jm5losp6zxtxzrhtbncappzekyrcdzs@7awi7qw4kchv>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-14-c63f1134e76c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-drm-mode-config-init-v2-14-c63f1134e76c@kernel.org>
X-Proofpoint-ORIG-GUID: 5PMM-6MI-KLCIlk_YaahC_MGQ3URtG6t
X-Authority-Analysis: v=2.4 cv=Fo81OWrq c=1 sm=1 tr=0 ts=69e79f81 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-GMv20tOWX2ILgXXLssA:9 a=CjuIK1q_8ugA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: 5PMM-6MI-KLCIlk_YaahC_MGQ3URtG6t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1OSBTYWx0ZWRfX20Je70KyrMtX
 8oAJVx51n3WZn82lomVoe7qo/NWpx63EHV7VMjdKxZSmxXM4wkBMOmG2Z8hJOkp+Gb6Z6rerLSG
 n+3ASGM3OZkTkyfKNFfJU61nfGG4xEt1+ifX6rBMceVahT7UfvzCi7th9JGVm8crsbS6RmyCay8
 x88IsDSP7nuhd50A+ViSSSFpNLaf7sUSH/tWQm9vOS1aO0Iv8iP0e8dZjnCZj6WsQAOJIBr866x
 2y6iNTPxWPZXRO/++X4JQwySGJ3uPBiNyBF6Cs15jq4kakDNr0rJdjtN2G+Fg5nLPvFRP3QRBoI
 XZr7OJmSn/TASIn/8rPgp1n+10/9hZyrPeuOto7YSX2O/PhD7qkzX0bkL/Ur8tjcFeEeVKff/TT
 OWr9wymIlN8KRYEAvKa0nQdoQp4yzzZRf35i0QDJpBGlDLoQB862bbxbO/XfehzQhLvF5i2i6mh
 bAWDTszh9yd+tLbE3oA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210159

On Fri, Mar 20, 2026 at 05:27:21PM +0100, Maxime Ripard wrote:
> drm_mode_config_reset() can be used to create the initial state, but
> also to return to the initial state, when doing a suspend/resume cycle
> for example.
> 
> It also affects both the software and the hardware, and drivers can
> choose to reset the hardware as well. Most will just create an empty
> state and the synchronisation between hardware and software states will
> effectively be done when the first commit is done.
> 
> That dual role can be harmful, since some objects do need to be
> initialized but also need to be preserved across a suspend/resume cycle.
> drm_private_obj are such objects for example.
> 
> Thus, let's create another helper for drivers to call to initialize
> their state when the driver is loaded, so we can make
> drm_mode_config_reset() only about handling suspend/resume and similar.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic.c      | 12 +++++-
>  drivers/gpu/drm/drm_mode_config.c | 87 +++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_mode_config.h     |  1 +
>  3 files changed, 98 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
