Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EB93E9C38;
	Fri, 22 May 2026 12:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453370; cv=pass; b=luAmdRHeQR1dxDqmcuFOq9r0AQ5J4mZIs4Rn/Xa3aPIme0CTfiC2Y4CANiF5EzKd86WbrdAj4DmDYZK+Qil4N6mwcitDrdhJv1vIDh4Hh8sNHGQQ6XmvmEgowHuoNCCgZWuG7INH6rIx3bUS1HuUEmiynx7DypJIHJ1+++GG7Wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453370; c=relaxed/simple;
	bh=I5cUkwhliZP9H1WigkZtBpuYNiVtDyQciTvCR5DbwBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WQ8oz0DQjhgY/DV+p0/yAo82gdIqLA/bLVrrYx3GhdMrh0Cgd4UYClB+02slQnvfBaSLZDePK5DsKCPFTwOLOXJOnHZuHek99eJ9xcAqvbUrZMnibFn3PsMryTMHUlehnS7BpDm9/Z2eD2Jh9ebIMKSxYZ+9MoaXcinPgxqxjao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=GGUVYhuc; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="GGUVYhuc"
ARC-Seal: i=1; a=rsa-sha256; t=1779453329; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YpcFeXc5iMRX/UuUNcjYyPKkEMiLr2HjIW1CS7oTkpW3e21y3CnphyQp90ujZiDllCeQm3EPQqCfdkAl/MTrLlzJDkc1SkTeCEcA4y8ZotR/rmFDhc6Gphj7HjyYGqDXwyrAujcshTQeSWuJUOE6iuyNgInBYqjomPtwJOdXPmU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779453329; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Q+B7brSOXhFKHfF0p2ZhjGn8o6we6nqw9IHhgBjHhzw=; 
	b=jlFc9PPUjgnGyt/IWLj79j2PCPnAc6PsEXbaHEtyUfhYAPxNP74mZQKqteYO0NcAowqXdH584kM0PYGQd/BYKhLX80hWTSkE2UQ6Qk7c2XAJHZysPtd3deeMSpUOMviOcUoe5OhGkXjLHyIsclFsOGeY/S5cssNubgm8YhdZt+o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779453329;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Q+B7brSOXhFKHfF0p2ZhjGn8o6we6nqw9IHhgBjHhzw=;
	b=GGUVYhucIuOWq+4NVry8//glJwIevWUJT1OyUfnCAxurvReNxBXND/NLXXW/mwAa
	YIWapyrX2IZMb9KXJPYN+SyK3PnZMnKX/ti6+0cfGObMbLV+uRp4CQaSxFHorFT0lNn
	8UNsMvwlciX24KDhQfO9fNwmm1cabsn9K7rqyNdE=
Received: by mx.zohomail.com with SMTPS id 1779453327567261.26591020544936;
	Fri, 22 May 2026 05:35:27 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 22 May 2026 14:32:10 +0200
Subject: [PATCH v15 19/28] drm/bridge: dw-hdmi-qp: Use common HDMI output
 bus fmts helper
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-color-format-v15-19-21fb136c9df2@collabora.com>
References: <20260522-color-format-v15-0-21fb136c9df2@collabora.com>
In-Reply-To: <20260522-color-format-v15-0-21fb136c9df2@collabora.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Daniel Stone <daniel@fooishbar.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.15.2

Make use of the common drm_bridge_funcs.atomic_get_output_bus_fmts
helper for HDMI bridge connectors.

This allows dw-hdmi-qp HDMI bridges to participate in recursive bus
format selection in a meaningful way.

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Reviewed-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 1c214a8e6dc2..13fddd5ebc82 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -1190,6 +1190,7 @@ static int dw_hdmi_qp_cec_transmit(struct drm_bridge *bridge, u8 attempts,
 #endif /* CONFIG_DRM_DW_HDMI_QP_CEC */
 
 static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
+	.atomic_get_output_bus_fmts = drm_atomic_helper_bridge_get_hdmi_output_bus_fmts,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,

-- 
2.54.0

