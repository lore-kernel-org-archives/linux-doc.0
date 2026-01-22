Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48FD26A1AC;
	Thu, 22 Jan 2026 13:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769086865; cv=pass; b=us+pg6EN3Pf33Z67AGoG3LMIIDgVrxObFlJbTdNpkGft1+P7Ofs8UDc2QAiIEOYpW3IMu3/RYLNdUFgxxAyM/ZZ3i0nXO1v/ne4cbbTKce9cyJ+fgggONXWlpNcjaqQPsEkBz0b2dR2aMza0wQaipj//4O3RHYmIfVAmjhw3FTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769086865; c=relaxed/simple;
	bh=7+C9lDKN1sXNrWrBRM9Kbzke7AXUFV6I/EMeh7mhVYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uoPCIc6z84cADQ/BP8a12LBx1ZfckJV4f6bOmSQPvnjAYDdkGbcKKoZF05B867Pl3vSNxp1b+0urch500u2n3egWn1UswO/Qu0pLFCVCvPvO5/kVqy1ezkm+1tLhOavh7s9k/ZzK3/OBC7gtu1wMCbfg/0xumz5f5tqjcvoTUJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=XQ+af+yj; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="XQ+af+yj"
ARC-Seal: i=1; a=rsa-sha256; t=1769086792; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VKqPDXZqQscCYPdjRAFzVjNUl2wWtTJSvTiRTzEYXbg2KRiiyrzw7Fgd5F4aj/GqLRkPG52NFbg+LSpLjs4GAECVbS01LsWvA9Fz1NjwIAPPjcU/3BNCDvAgEzXUnKfZB2evUSGJlSirmL7GTIXm02Roe2I5pcvUy99ppcqfscg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769086792; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uaYzvb2XfnnkbyKx6FP5LwKsEl3/GXRkx9jsqA5CXcg=; 
	b=RJCKftJsR+YMsCXvoJUwTAO3XJ8vrGzxjCCYZQmDVjdkydhhqR4Bgvb/ZHdXIutEzxgIJnul+AxHTbyPdvbqJo6hzUNsBlNrvzLsDYiCWTGUDpqGZqeaDwo+5XzzCEUSynNz4SiSmXQzIFLwIW+bzQeySP1wgm4RvmR24fr4xfU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769086792;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=uaYzvb2XfnnkbyKx6FP5LwKsEl3/GXRkx9jsqA5CXcg=;
	b=XQ+af+yjMhxPFVDC94pM4PlfhBu+gM6eH/bwFiy44r2PfvdSy4/Aodursm5Hdrqi
	VZ1oIeM9xzg5jXHXTAll2xKeZgInWMdf2dKrQIFjeVJqLYGJlLr9PJTsgJ/NoOlwVW6
	ezT5oPGKFoHngWSi9Nrm67krvXYabnOVwbijhWko=
Received: by mx.zohomail.com with SMTPS id 1769086791692511.35700158955376;
	Thu, 22 Jan 2026 04:59:51 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Andy Yan <andyshrk@163.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, kernel@collabora.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 10/22] drm/rockchip: vop2: Fix YUV444 output
Date: Thu, 22 Jan 2026 13:59:41 +0100
Message-ID: <6631107.DvuYhMxLoT@workhorse>
In-Reply-To: <7ab32c86.7542.19be4d21f69.Coremail.andyshrk@163.com>
References:
 <20260121-color-format-v7-0-ef790dae780c@collabora.com>
 <20260121-color-format-v7-10-ef790dae780c@collabora.com>
 <7ab32c86.7542.19be4d21f69.Coremail.andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Thursday, 22 January 2026 09:28:54 Central European Standard Time Andy Y=
an wrote:
>=20
> Hello Nicolas=EF=BC=8C
>=20
> At 2026-01-21 22:45:17, "Nicolas Frattaroli" <nicolas.frattaroli@collabor=
a.com> wrote:
> >YUV444 (aka YCbCr444) output isn't working quite right on RK3588. The
> >resulting image on the display, while identifying itself as YUV444, has
> >some components swapped, even after adding the necessary DRM formats to
> >the conversion functions.
> >
> >Judging by downstream, this is because YUV444 also needs an rb swap
> >performed in the AFBC case.
> >
> >Add the DRM formats to the appropriate switch statements, and add a
> >function for checking whether an rb swap needs to be performed in the
> >AFBC case.
> >
> >Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
> >Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> >---
> > drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 19 +++++++++++++++++++
> > 1 file changed, 19 insertions(+)
> >
> >diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/=
drm/rockchip/rockchip_drm_vop2.c
> >index ec3b4fde10db..469c63dd97d5 100644
> >--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> >+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> >@@ -176,6 +176,7 @@ static enum vop2_data_format vop2_convert_format(u32=
 format)
> > 	case DRM_FORMAT_ARGB2101010:
> > 	case DRM_FORMAT_XBGR2101010:
> > 	case DRM_FORMAT_ABGR2101010:
> >+	case DRM_FORMAT_VUY101010:
> > 		return VOP2_FMT_XRGB101010;
> > 	case DRM_FORMAT_XRGB8888:
> > 	case DRM_FORMAT_ARGB8888:
> >@@ -184,6 +185,7 @@ static enum vop2_data_format vop2_convert_format(u32=
 format)
> > 		return VOP2_FMT_ARGB8888;
> > 	case DRM_FORMAT_RGB888:
> > 	case DRM_FORMAT_BGR888:
> >+	case DRM_FORMAT_VUY888:
> > 		return VOP2_FMT_RGB888;
> > 	case DRM_FORMAT_RGB565:
> > 	case DRM_FORMAT_BGR565:
> >@@ -225,6 +227,7 @@ static enum vop2_afbc_format vop2_convert_afbc_forma=
t(u32 format)
> > 	case DRM_FORMAT_ARGB2101010:
> > 	case DRM_FORMAT_XBGR2101010:
> > 	case DRM_FORMAT_ABGR2101010:
> >+	case DRM_FORMAT_VUY101010:
> > 		return VOP2_AFBC_FMT_ARGB2101010;
> > 	case DRM_FORMAT_XRGB8888:
> > 	case DRM_FORMAT_ARGB8888:
> >@@ -233,6 +236,7 @@ static enum vop2_afbc_format vop2_convert_afbc_forma=
t(u32 format)
> > 		return VOP2_AFBC_FMT_ARGB8888;
> > 	case DRM_FORMAT_RGB888:
> > 	case DRM_FORMAT_BGR888:
> >+	case DRM_FORMAT_VUY888:
>=20
> How did you test this format? It seems tools like modetest don=E2=80=99t =
support testing this pattern.
>=20

Hi Andy,

using the rest of this series, which implements the "color format"
DRM property, and the corresponding weston MR that makes use of it[1].

I create a ~/.config/weston.ini with the following contents:

    [output]
    name=3DHDMI-A-1
    color-format=3Dyuv444

This will make Weston try to set the output format to 10-bit YUV444. To
limit it to 8-bit, you can add `max-bpc=3D8`. The monitor's EDID needs to
report YUV444 support, otherwise that Weston version won't let you set
this property.

Link: https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1859 [=
1]

Kind regards,
Nicolas Frattaroli

>=20
>=20
> > 		return VOP2_AFBC_FMT_RGB888;
> > 	case DRM_FORMAT_RGB565:
> > 	case DRM_FORMAT_BGR565:
> >@@ -270,6 +274,19 @@ static bool vop2_win_rb_swap(u32 format)
> > 	}
> > }
> >=20
> >+static bool vop2_afbc_rb_swap(u32 format)
> >+{
> >+	switch (format) {
> >+	case DRM_FORMAT_NV24:
> >+	case DRM_FORMAT_NV30:
> >+	case DRM_FORMAT_VUY888:
> >+	case DRM_FORMAT_VUY101010:
> >+		return true;
> >+	default:
> >+		return false;
> >+	}
> >+}
> >+
> > static bool vop2_afbc_uv_swap(u32 format)
> > {
> > 	switch (format) {
> >@@ -1291,6 +1308,7 @@ static void vop2_plane_atomic_update(struct drm_pl=
ane *plane,
> > 		 /* It's for head stride, each head size is 16 byte */
> > 		stride =3D ALIGN(stride, block_w) / block_w * 16;
> >=20
> >+		rb_swap =3D vop2_afbc_rb_swap(fb->format->format);
> > 		uv_swap =3D vop2_afbc_uv_swap(fb->format->format);
> > 		/*
> > 		 * This is a workaround for crazy IC design, Cluster
> >@@ -1308,6 +1326,7 @@ static void vop2_plane_atomic_update(struct drm_pl=
ane *plane,
> > 			vop2_win_write(win, VOP2_WIN_AFBC_ENABLE, 1);
> > 		vop2_win_write(win, VOP2_WIN_AFBC_FORMAT, afbc_format);
> > 		vop2_win_write(win, VOP2_WIN_AFBC_UV_SWAP, uv_swap);
> >+		vop2_win_write(win, VOP2_WIN_AFBC_RB_SWAP, rb_swap);
> > 		/*
> > 		 * On rk3566/8, this bit is auto gating enable,
> > 		 * but this function is not work well so we need
> >
>=20




