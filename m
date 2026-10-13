Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99B431E858
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 07:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791877905; cv=none; b=eVGmDQozBMdQLD0ZxygAs1t5Nst58jTC2Y2zgOQQkvQKdRA3PuNH2yHoKPA3EdTU0kOxZ2eN4XY5WQPRU8nCl9ci2qMYVykbjp/2IL1UqEH6s9oj4IyO+DcPFK3TZTstweGWv3zRkQ5vIEL4L8ai9qjq37LaUtVYLDvIGKXDkKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791877905; c=relaxed/simple;
	bh=O/NVLhRI0uawWFT3foKO8gI9P0F95k0wJeBb3Mfs/aA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gNCZB2T6lAB2D6MhdiAWlIDlKEo2mgfRDJJwLyq9QItUOqbn+t4R7QJI0D2BHY7iVRMIkqyJMEEHKgCOgObd9rFGxL2c9lWCq7io8xQEkGkjrF07etwOxXUa+VgzA1CjCrGrPCwIIQputupPzkdgt8AjxyAJkcEc5X1KT7LW1Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IMSdstEk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eoep68y3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IMSdstEk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eoep68y3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D21E1X3752542
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 07:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2e0hEvdU8b8VrnJnCx9DHHAI
	iFUZiYK3o3ou5ROhbTI=; b=IMSdstEk9C7fgUIBCRRMTC8AKGYIHkhw1+ksTJOv
	1xAVpTwk8ypXQCinfCkzKpAWKSf2Hl/CJM6Traomk+keHHaEymGGukXeBEJbQd1b
	Zj+i9Bgdhnly5F4cpvXsc+3lJSne7PHNgdGkQNjyeycWf/hCWnyb0jP3gxTCR2aC
	EOqmQhiEkUxSGZjN4f4M1aNughBK96tzuaI9CUPTv27jIKwZdA/O9E8lHdnmJFS5
	OAbyYsyPSNwX2O2e6nl5/Zdcgr/CiZ7EuMEmRNBDV4ptXRliXFz1OmAe+ewtvRyJ
	J6wm7P9/Ytx/lVWRt7NuGNguRBJh7b/+5iK64S2v7N7Vig==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h940w2xf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 07:51:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cbacbb996so438041685a.2
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 00:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791877902; x=1792482702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2e0hEvdU8b8VrnJnCx9DHHAIiFUZiYK3o3ou5ROhbTI=;
        b=eoep68y3LhLe5ZfP5ZK7KiQWHNKhwo7hu05t2Vz9e1DnBWyAXJ8TlbAF8hs7/lsDqc
         BnsuFfz0EMI4B5p2rSsXBxEJYfifDfNjRimZ/eFUmCwOLOWmy1rYrFYLt3co6oLqqGbj
         08+gZv6rKzzE/rWkApdGZIUCTcS+PPnDnwS6D+h6BKuKXz/GMfeMMxjct4wkNSswlfRW
         1ZU0Hru9gEyLZoK/Jl4+F4pnTY+GX7739e6RomLaSpS03Mlbq3ZHzQ0XG/YPnWaelZf6
         Kc3a2JjKyilcWP9FLjLSICQ+EmAMawsoQ1g9zCZt8c9dsWpkmqEaF2HZs4rRD+P4UxGe
         +DtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791877902; x=1792482702;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2e0hEvdU8b8VrnJnCx9DHHAIiFUZiYK3o3ou5ROhbTI=;
        b=Wg6oCFoDqu4DlZnuZDQZyrmZO68/Dymv/eBxGY5olTscQPabRQ6jM9YFlNw9hywVf9
         +3iCLctuG/E43O/AqNkd5XT2WrAFSxAy6qeubXgAk8WPAa1dKiVEhAzexwLlJNimDaes
         gpA42XV9LLu1Kqne2cTtebVcL+OYVxOIr0beG0vG72TpyaESESvnkakEACf3dVAJGVYi
         7UA+5+a8sugu6DlMRTkAqDOVzRvN47TlJPSN4dmFO/Y3ySuDRW6DLJC73rSrQiDdBjzY
         1dDfblV8jqQk6goxUU4o6AkE0cRq3174pKpyk70d333zrZEbNTEBAug74zZdpg2t/BKQ
         70JQ==
X-Forwarded-Encrypted: i=1; AKwUvBwI5N0hVihUatQtVNXcPj+UBgIpuUbv7hlxhRP6W8fGxBeVccvh5ZcVCs9KIXJ3/JcSBwy8Yt+0JrY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK27InjcnaOvtuqaDix4rQ2sJP6N4PG8JQwo/vMNL4TaPDdk16h
	3vnbhpifC/Sz/qnBNPurY2sxSsOn9FJbg2EpmJq619idQZQrxAtx474EOZTXpreX0o7BeM1l2S1
	1Jz3THidLQe/VHvJk0h+5t1O3ZiY7otHcBC2GhTMXhsEu66TzNQvC3b6w3b7JOPc=
X-Gm-Gg: AYBFou2gP1ax25iceMv6oaNoY68Nj5jDxjlvxOwQMKT+VSGv59+3D1DHSOB6vgnDNcP
	L7AZLgacBszPOpB6bLAUcCqAThERiMMPhy2vdBf/QazjeedsWWsiCbMV6z8i3kow2yCu8Evy+xz
	Qplm1XByZdsFtxqimP26YhRDAuR1SjXhvvPghls4ZtEy0fIBnTzA7JvifQ/nhpZK2G7HwMCqBC9
	+te0y7vmrUDKFq8nwSQQJGDKnxgFxojemVWec/gGZBFcd9lLWPFRFftA1A1f9kk6+NiRCVwT/YV
	y2kjYi3ceU8+ZW13lmPUPeaPgbFt2MAf2xBBG71U/g2VAQ1BqM+E9hKB/Bwwyp8k/ScP//EuhFo
	cJIv0SksPQJxt+aKmIlmWvqf7LZAoRaYTZ95LVvcDlXe5xTp2vWfrlvD5UQ2eIDwds7Ymgimlqd
	/3+fBbylgbialk
X-Received: by 2002:a05:620a:271a:b0:93e:48fc:aa85 with SMTP id af79cd13be357-93ebd2598c1mr1901243285a.43.1791877901686;
        Tue, 13 Oct 2026 00:51:41 -0700 (PDT)
X-Received: by 2002:a05:620a:271a:b0:93e:48fc:aa85 with SMTP id af79cd13be357-93ebd2598c1mr1901240985a.43.1791877901188;
        Tue, 13 Oct 2026 00:51:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde91281sm3367573e87.19.2026.10.13.00.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:51:39 -0700 (PDT)
Date: Tue, 13 Oct 2026 10:51:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Val Packett <val@packett.cool>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC 0/9] drm/panel: add atomic state
Message-ID: <7pptulwzceqg7xozps5boncgcpd5fpw2pdabcslp4den34ixjn@rzgkoe36itwm>
References: <20261008-panel-atomic-state-v1-0-b157fddb8de1@oss.qualcomm.com>
 <asyAObcpbFy3OeE2@houat>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asyAObcpbFy3OeE2@houat>
X-Proofpoint-GUID: sFh8_l4po7eKYvEJMgaxktVjtyKFKGbS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzMSBTYWx0ZWRfX0GsTXnZ6+VWd
 adv/H1tVNnRXfM4krNlt3cxPjS2bAx/7hcfTpJ5V78v48anONxAZ8QbHLFVlnPFZs4YA2e+0Gg0
 diIcZG6S3C5r//MNrUtmyaD1mGGOukqrRiHeLy8d9FnLQkT8QefWaWrhy0wfygByJoaSgpX8O/7
 FAdvhVkFjNOUk2NAvbC8nHm2aCL9wWgLTlo0YTm5spB7XCpOpGiGtCOL5W0ahRyH7BI0W3eSdRS
 VtSOV2MMZJSoqL5MwqT260cZzs8ftnDxBFejQh0XYEJo9gZJ1+8l/w2qST30RuXDPT88FDdHe6f
 yiIm+J2QWxwdnDAjYes9KWZ9c7uuajPgpjjNjRIiBEJugNHYnUOhrWBKffF9YrB0xUzg9Z296Bx
 y/RrHVj++oqc0hRJJLbbELhBOtaOm+j8hDQYKZxbC3r6+N3lREFWti9yTmkGoA1Nub3tgpcDkb8
 vwgf3ACNmZtNvkOwgHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzMSBTYWx0ZWRfX+uzpE42M97PG
 KdcgOS5qhJPWiGRYrnNkZNZyrqTiwUsfRMii9nW4s2PP3f1jfQDDDm69VyvJGGukuBIwwmEjtKy
 Yc0nZeenQ0JNZKc9xcw2/SRIqtT3sVg=
X-Authority-Analysis: v=2.4 cv=ftZJ914f c=1 sm=1 tr=0 ts=6acde30e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=1JtaHRqB5YIky_o9nyUA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: sFh8_l4po7eKYvEJMgaxktVjtyKFKGbS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130031

On Mon, Oct 12, 2026 at 08:40:33AM +0200, Maxime Ripard wrote:
> On Thu, Oct 08, 2026 at 04:14:22PM +0300, Dmitry Baryshkov wrote:
> > Panel drivers don't have an atomic state and so they can't handle
> > additional data to be stored at the atomic_check time or to be retrieved
> > at the enable/disable time. For example, it prevents panel drivers from
> > supporting multiple display modes or making DSC being optional in a
> > clean way. Drivers like panel-novatek-nt35950, save the connector
> > pointer in get_modes() and later dereference
> > connector->state->crtc->state from prepare() without holding any locks.
> > The panels also have no way to reject the configuration they cann't
> > handle, as it doesn't take part in the atomic check.
> > 
> > The panel already embeds a drm_bridge, and the bridge has an atomic
> > state which is property handled. Subclass it to provide atomic state for
> > the panels. The callbacks can find the state of the other related
> > objects (e.g. CRTC state to get the display mode).
> > 
> > The atomic state is opt-in. A panel that doesn't implement the state
> > callbacks keeps working exactly as before, with the plain bridge state,
> > so there is no need to touch the existing drivers. The panels which do
> > implement them can only be driven through the embedded bridge, since
> > there is no commit to hand over when the host calls drm_panel_prepare()
> > and friends directly. Those entry points warn and refuse to handle such
> > panels. There are still a dozen of display drivers calling these
> > functions, and the panels used with them can not be converted until the
> > hosts are switched to the panel bridge.
> 
> I really don't think we should extend the panel API. All panels are
> bridges now, consumers only care about bridges as well, and the bridges
> API provides what you want already.
> 
> Why not simply turn the panel drivers we want into bridges, possibly
> with a bunch of specialized helpers to manage a panel state, and call it
> a day?

I think that panels provide good abstraction on top of the drm_bridge.
For example, bridges don't have orientation, panels do. Also panels have
followers, while bridges do not. I don't think that either of those APIs
make sense for bridge. Last, but not least, we have drivers that were
not converted to the bridged approach (*). As such I think we should
evolve the drm_panel, extending it to support atomic state.

(*) git grep points out the following direct users of drm_panel API:

drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:		drm_panel_enable(anx6345->panel);
drivers/gpu/drm/bridge/ssd2825.c:		drm_panel_enable(priv->output.panel);
drivers/gpu/drm/exynos/exynos_drm_dpi.c:		drm_panel_enable(ctx->panel);
drivers/gpu/drm/logicvc/logicvc_interface.c:		drm_panel_enable(interface->drm_panel);
drivers/gpu/drm/panel/panel-sitronix-st7703.c:	drm_panel_enable(&ctx->panel);
drivers/gpu/drm/rockchip/rockchip_lvds.c:	drm_panel_enable(lvds->panel);
drivers/gpu/drm/rockchip/rockchip_lvds.c:	drm_panel_enable(lvds->panel);
drivers/gpu/drm/sti/sti_dvo.c:	drm_panel_enable(dvo->panel);
drivers/gpu/drm/stm/lvds.c:		drm_panel_enable(lvds->panel);
drivers/gpu/drm/sun4i/sun4i_lvds.c:		drm_panel_enable(lvds->panel);
drivers/gpu/drm/sun4i/sun4i_rgb.c:		drm_panel_enable(rgb->panel);
drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:		drm_panel_enable(dsi->panel);
drivers/gpu/drm/tegra/dsi.c:		drm_panel_enable(output->panel);
drivers/gpu/drm/tegra/sor.c:		drm_panel_enable(output->panel);

-- 
With best wishes
Dmitry
