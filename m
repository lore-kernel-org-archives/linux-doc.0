Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01D53358A6
	for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2026 11:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777115374; cv=none; b=cUWlgf2vEMTKfOM2JFb9t5wTamMcm2UjCimdFAbgLju9yGcGZtUlfUY2vLzKqHeBCYs8CzaSbM2Zzzdkh8w6H3dMABrLOFbBE/bFOurHiwtU37IeZTUFwsI+iW6gI6jTsj7Dp+2BFWKjd1AQaAW8VTOH0IYQTBqTLq+l3C4agJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777115374; c=relaxed/simple;
	bh=P2DPWKEjaX+4L5pmHnYVDh05cYlTh3oqsErAGwQCoP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPLyxbywL4/OtKgv4Lcm3vYYbhO87rwyzFH3FmmESwQ1vcLImaQw/RmAbFqD0uXdW8tAdbbP8DgHfa/A3DoLLKychd5si8MSTn4deM92/Gf5Gk9KE/uY2V8x6sHqt9ipMaziLYJ7/8SIqHc9HReuhbaoHblCiPhSOrWjoCJ0R8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RJk2YCDy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G9WvS6Hq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RJk2YCDy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G9WvS6Hq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3N9Y1207455
	for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2026 11:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=skggYkTTFObHeIE3RudQp0G9
	1CjiRon2TwvgONrTWQQ=; b=RJk2YCDyCRrYvpfj7deR0E+7F40sA7ecy3s5LwuC
	JwrLO0+41LY8A8E8LR/ubgVCS5crHRH15ux1KKMvHODIbUrQADAzhDKgh7DgKvuF
	boQxjUCJyrrvL6yo7vKI5fZ2xQpzDowy54280huGdhYwzFB9c65HxxfKNPRI4dgf
	TzvtBwc/KZplZZc4LERPGuSZRVGn6F/7kMgsRm/Bdsa4aRalN+daxsXP7WUoJgWj
	bYrYOvtt7Z3WHlGDs8HW63uk9QF9uu+0o4W20QEDD2bTA4LKfF5OGr5Xv65hOcT6
	YIz1ZbrnMAen9tBpnWm8cneIfIV5cwOaJh3zaOUNqYsNPQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnnf0re6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2026 11:09:31 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56db8ed8e40so7897149e0c.3
        for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2026 04:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777115371; x=1777720171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=skggYkTTFObHeIE3RudQp0G91CjiRon2TwvgONrTWQQ=;
        b=G9WvS6HqOAvWWE0w78pSRVGEoToHZVUZa6seFvOFIkss/S4qoBEy1u/5/fWeXh9U1J
         upaQTi2sZpvxpA3CSz1rB6C1blkIopdWFCMWa5c01ZgwBQrGLHB+lEe636Zd2U5HA37e
         jdGwv0TToEaJVI+oFSGQVYEZ+9t7nz7DL7ZBonIeJijPrbJTHO3+Wle7z+3XxahpheYW
         T/WHBdP4WsOABgiQAMfg9z941Lfpfs9W7TGwS7gIgborc40EcuFcQFUY5S5gIZxrIRN3
         5hlK+yn7dA1GahlJ6h1RCKWbSPSVWl6y8w0ed3dQhux/UprVQiFns3EUzPYF/kffqwId
         meeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777115371; x=1777720171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=skggYkTTFObHeIE3RudQp0G91CjiRon2TwvgONrTWQQ=;
        b=VDHAv/TGu/kswacdKWL7/1GM0tScouP2A+sWk2scMketno8otxLHT9jdrXVftNMgOk
         /yaLmSdljP7pD0wvjr0FXg8q0eLL6DXTEZ4mdIkPmUAdHKlXW8z5u2D42L+Btk2tTHTi
         9X4a5MwItR+/T9qfbXWuCszD/p/VvewWgGggMvhJub5JnZEalYQn+WnLG0tjtCuTD5qz
         I9e6MstsjirJ7m7zkAjbllGIPKfhJXb0G1jWHeVwxQ4bpUu1wb0pUmOo/RV4IMJARJ3w
         V8sd9JI5IOz0adPdox4e8HNXq9fd/BEntO+XKFxS73ksvntgSJ3tXcCtFBzlUcnlt7mH
         XJ8g==
X-Forwarded-Encrypted: i=1; AFNElJ+YTCox4cqeFUkwVJSjdinvIKmVfdYZj1CpAtJu1LiUpOFlLJfNGdqKkMWzUfzZElnjxUo2FLjGmv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVHVk0QDPo1DVxdmCONPiRmjoiue2zZs8pqBXJCYub+TZN0hVN
	PY2g4PtLhPKf2yPfJJ35gkgEC9GDi/kh0a3oBgeh+QD77G9molfrk+/X+Ps7YJgEJN719gQccnd
	nsWVyttTW6c+0THB+ZreVLUlyVfldmd7Xe4zXgo8Z6iz+lXfRz4hwtlaHlBusslA=
X-Gm-Gg: AeBDietiAUdmIiWqiMNeWUrY3UCD+Z4rufErT/Wu2sqoywAzYLJbM2nPcBiflYfgcZE
	a4b38wGg7+6eZlWgm+0BGDBiDs67T5rrloY7r6/f7blY2TGaacc5eYpCyVoX5aQoEM0yAVqGNEP
	DjsQKLGm7EXl5QCZQ81t6OeVISdjAjfbstZ3DCSsYObD1pNhiwYkn58ynq97wpdwr3GUm22rvDK
	FB1DTU+Gq+7O5a8/n7ab1bztbEflW95cCIrJt9g1CACESUHABLMO9pl3fpjKeXBWcUqSHbOTlNh
	h8W5+PTfEvdEMtRcipqmfwyyFUuuQhMfVRsfi7JwAJmXxPxaSAhRWxzvPShDQWuRbScIpWbDrdA
	zbyQc3CVMlVRVwexG2RLDUkUSmjtkiT29fQzwCuBWim/t+tzpqi7IYnWA6U2yJi32IppmRLKYG2
	COOncsCjhNIwDxJtzveTQDyb0fd1ondIxcvqL3OH+sjJG8Mg==
X-Received: by 2002:a05:6102:1611:b0:605:7a45:c7c0 with SMTP id ada2fe7eead31-616f70f0572mr17646776137.13.1777115371014;
        Sat, 25 Apr 2026 04:09:31 -0700 (PDT)
X-Received: by 2002:a05:6102:1611:b0:605:7a45:c7c0 with SMTP id ada2fe7eead31-616f70f0572mr17646746137.13.1777115370439;
        Sat, 25 Apr 2026 04:09:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f64ebsm50476681fa.10.2026.04.25.04.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 04:09:29 -0700 (PDT)
Date: Sat, 25 Apr 2026 14:09:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org,
        wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v14 04/28] drm/connector: Let connectors have a say in
 their color format
Message-ID: <5uit4utjrezpuqok36apjrkojaklze4ftgp2r4zrqolus7gkcn@nu2hsrhaj6zy>
References: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
 <20260423-color-format-v14-4-449a419ccbd4@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-color-format-v14-4-449a419ccbd4@collabora.com>
X-Proofpoint-ORIG-GUID: b7X_FW4d-dvwfdYTWtjpUmzXSk3kBZwM
X-Authority-Analysis: v=2.4 cv=Y5rIdBeN c=1 sm=1 tr=0 ts=69eca0eb cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=vpl3xS56dgtxGFZ4nZMA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: b7X_FW4d-dvwfdYTWtjpUmzXSk3kBZwM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDExMSBTYWx0ZWRfX/trEsnr2h6cl
 A//QdI781JqVvZpac00yTml7ToPC2y7wUX2UDQCA2csKxgyuZiGjIPoYVSsRfSi4cfevWui5Ncq
 8F3fbc0KgU+lToPWpDmdbgdZv7NgTvJaVTuAhta4SViQISv2QB63dvAlVJW5V3U97ebAmnQ6w+2
 A3nbejW7LwDBYwVL0CAhXlTi3DwGF5i0ZPqDzUvFKnaRbbqsmd9Ly6Y0HNOwkI9eGRcqjPwEkcJ
 1wPQVS9QKvVqGlG4U7WvqGwZ8ADav6v2Xta6xfNf/S6BDuGEKS7WrAiTO303idg4bCvZOTKlzOp
 KJdgFnla5g7vjL1bHrVx1SiV9yL3jx5lyx7kTEflDufYDNxHywB2ZdNFqB3w1hvDvyaPK6e8j+w
 YRPjy2h8ti5uqef3kZ5q8AmyM2UA3mEa2ceuniTxKQtVyhwBc4aM7MGLx7DyutO9HSAVuXPdVU5
 0h0Ob+vx/bLuuvr92ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250111

On Thu, Apr 23, 2026 at 09:03:27PM +0200, Nicolas Frattaroli wrote:
> Add a function to get the connector color format from a connector state,
> and a new function pointer in drm_connector_funcs to allow connectors to
> override what connector color format it returns.
> 
> This is useful for the bridge chain recursive bus format selection code,
> which does not wish to implement connector implementation specific
> checks like whether it involves HDMI.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 16 ++++++++++++++++
>  include/drm/drm_connector.h     | 12 ++++++++++++
>  2 files changed, 28 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
