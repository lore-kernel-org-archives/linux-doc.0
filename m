Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B087350A3D;
	Fri, 27 Feb 2026 19:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772220223; cv=pass; b=Dkg9498u0FjitLtuhCbH+tCchKdcSS28+VUjQ4A6YVjdfUrhGu31+7noxSV+lHTuHAwjJFPDNe402C8ec5Vohn9Hn2AbhVHiblIiz3PAFsV3BoICHLeImauq3jWMKl/GJLzLTun+CE7Ul7TqrBQ5EJrWtr19gG9BBLbG8mIzAvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772220223; c=relaxed/simple;
	bh=aofyhEbMaL60N7WvX0FkZ8CNdPkgnbdqfv/2Itq/FY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I2ywGXmXTL/j1y9wQA4jrTgVJApUt/J7Q29mWd6QnO+H6lr4fwKR48CBy7Ey5ra7oEtwiD7vujfaMmR53mH5g1lnEb8FKo0VRpb3v4gnNnc03q5rz101q3yk+RqC4vVhXiMMvErp1kWf5Zvnpk3RYzt9ETj/QOiahmUo1txWtoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=jnnqqo2x; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="jnnqqo2x"
ARC-Seal: i=1; a=rsa-sha256; t=1772220105; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AULN7JGgjOc1bXvJUcILNtklwAlcAHAUODbZmYPhTkw8rMvYxZ07KJt/0NwDvW9oRlA/odRaBFS6xvkO9oSyj6jAY+mNfCwQQtFM5hhBkn2dU/iJSFSn6G/3c42hCnzrLaqGLtW5aKR9T6B/oCMnEEcXF/xu7Cpn6DLYvtEirsE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772220105; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rwxTJdKl/d602FDC0mIdoL/MoUbuZ1KesTpLdFtLuuU=; 
	b=mrZPpBujWnBgaMm2nB21cYNG3FLrZCEIttOGSLjO+RW7fmM3bJDRo1grMEZIdKDZ+ew/DzZrhwIdTGatRGwf3JXWz7YfjvQjf1j13tY0Ed7ZJ25wE/G4MS/jDIX5qHtzA0mRKmg9qCEmL7j6Ivsjwcb0TiFjRkrTz8zDlNi2TFw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772220105;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=rwxTJdKl/d602FDC0mIdoL/MoUbuZ1KesTpLdFtLuuU=;
	b=jnnqqo2xRwPEUp4Wu+KlzmADBMNj335HkPyKkHUsVqJBnbzkz2gXqu35J1jpZVxc
	UlQ+acSOOziz2TmauK500hzYFUy6fg198i+7PL9TfCkk4pZKok1jk6pPevLre2Gyqi1
	GWPe5XUUPiccvhWtbE8XkcdQv44bH1YcSB4w3lvY=
Received: by mx.zohomail.com with SMTPS id 1772220103079110.57047502546686;
	Fri, 27 Feb 2026 11:21:43 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 27 Feb 2026 20:20:14 +0100
Subject: [PATCH v9 09/19] drm/rockchip: vop2: Add RK3576 to the RG swap
 special case
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-color-format-v9-9-658c3b9db7ef@collabora.com>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
In-Reply-To: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Andy Yan <andyshrk@163.com>
X-Mailer: b4 0.14.3

Much like RK3588, RK3576 requires an RG swap to be performed for YUV444
8-bit and YUV444 10-bit bus formats.

Add its version to the already existing check for RK3588, so that YUV444
output is correct on this platform.

Fixes: 944757a4cba6 ("drm/rockchip: vop2: Add support for rk3576")
Reviewed-by: Andy Yan <andyshrk@163.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index a195f5c819a2..39c64296174f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -337,7 +337,8 @@ static bool vop2_output_uv_swap(u32 bus_format, u32 output_mode)
 
 static bool vop2_output_rg_swap(struct vop2 *vop2, u32 bus_format)
 {
-	if (vop2->version == VOP_VERSION_RK3588) {
+	if (vop2->version == VOP_VERSION_RK3588 ||
+	    vop2->version == VOP_VERSION_RK3576) {
 		if (bus_format == MEDIA_BUS_FMT_YUV8_1X24 ||
 		    bus_format == MEDIA_BUS_FMT_YUV10_1X30)
 			return true;

-- 
2.53.0

