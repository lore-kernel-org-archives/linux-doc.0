Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3893E0C54;
	Thu,  9 Apr 2026 15:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775749624; cv=pass; b=YAHNT8BtyuhgxkUymfi8DnwfFVuOm9NOoA3Y3Z8+5Ckp+WxUZoUOkUzF1KmSNVl8QBqt3gN1a3bELVj341dFdx4kW5zNl/k72aLsDt5um+FL9wHpI9mKwJe2WcLOA1IBFh7f+s87vDW69LrRFdOnVGVGttH9fWoP4vJLpJ0LpYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775749624; c=relaxed/simple;
	bh=3BwOkFc/5J5YuOw+qhkDoH6STDj0TC3J/X6PQUqNomM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QC73OiihNdDNwVT6eDIZCyjW9UYXWvcuTlMMmh5Anao5DZQTW0zk2ePpvFZeV81WHSaZzsGwW0/AFXfJ+e3DFn35GzGDbhp6O1HnijAbSjROtw+FKUXLlauHnBgj9NAP/VYEAvmwNruSZlN3r6g6t2XT+YhT980BmBc1VUBuVgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=BQuWC79D; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="BQuWC79D"
ARC-Seal: i=1; a=rsa-sha256; t=1775749576; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Vgu+V5lL+n8x/NU00LtblPZWSe7TBUbOg5Kd5ME6JtK/0poUfSJk4MAvjlDTbXGuy4gDc5VidmCqo/sgLl8fufNn14/FeDn07ImjIa4NBDfQSneLmRrtBMZK5Lh0u1JdnYCZNNZFbBirj+6aNGwUwDn2srpU5UND/RVmESaqHk0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775749576; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MC7m65enPeoK56w15mZU/jnX37Exa8SW0qeHJO7INHM=; 
	b=CGZ2SOd8Clvt0XRMhnjgmL6OFA2qgEB24hY3fJAwIurKm/+iV4r+zS8i02iZbL779NIhYtYTrDGaQEY7xLMjANyuQamXJJ7UPupURPgt7WFdkvdnjxt4S7kwFCMbykt1UawV+Gn1ZeaN761SZYjPK7khfg+f/nIH1ckcaI7AEWQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775749576;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=MC7m65enPeoK56w15mZU/jnX37Exa8SW0qeHJO7INHM=;
	b=BQuWC79DNXGodfNgo27ANY+g2bD92qLJWMBoaoAey4runf2ljOiaaUpVeAb6WaH8
	q7dw7B/UQr8UJKzsGX+mbKUfdAK7bfwyEm6sSMDThFlhLBwIz7N88RUMuftMT1oXjVE
	u2XvAg4fpJqVJeqlqFLHZjPsrXwQMe+YRhMIW0QY=
Received: by mx.zohomail.com with SMTPS id 1775749573589546.6363588482891;
	Thu, 9 Apr 2026 08:46:13 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 09 Apr 2026 17:44:57 +0200
Subject: [PATCH v12 07/25] drm/display: hdmi-state-helper: Try subsampling
 in mode_valid
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-color-format-v12-7-ce84e1817a27@collabora.com>
References: <20260409-color-format-v12-0-ce84e1817a27@collabora.com>
In-Reply-To: <20260409-color-format-v12-0-ce84e1817a27@collabora.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1

drm_hdmi_connector_mode_valid assumes modes are only valid if they work
with RGB. The reality is more complex however: YCbCr 4:2:0
chroma-subsampled modes only require half the pixel clock that the same
mode would require in RGB.

This leads to drm_hdmi_connector_mode_valid rejecting perfectly valid
420-only or 420-also modes.

Fix this by checking whether the mode is 420-capable first. If so, then
proceed by checking it with DRM_OUTPUT_COLOR_FORMAT_YCBCR420 so long as
the connector has legalized 420, otherwise error out. If the mode is not
420-capable, check with RGB as was previously always the case.

Fixes: 47368ab437fd ("drm/display: hdmi: add generic mode_valid helper")
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 954f8b2973fc..5cc30da30989 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -942,8 +942,21 @@ drm_hdmi_connector_mode_valid(struct drm_connector *connector,
 			      const struct drm_display_mode *mode)
 {
 	unsigned long long clock;
+	enum drm_output_color_format fmt;
+
+	if (drm_mode_is_420_only(&connector->display_info, mode)) {
+		if (connector->ycbcr_420_allowed)
+			fmt = DRM_OUTPUT_COLOR_FORMAT_YCBCR420;
+		else
+			return MODE_NO_420;
+	} else if (drm_mode_is_420_also(&connector->display_info, mode) &&
+		   connector->ycbcr_420_allowed) {
+		fmt = DRM_OUTPUT_COLOR_FORMAT_YCBCR420;
+	} else {
+		fmt = DRM_OUTPUT_COLOR_FORMAT_RGB444;
+	}
 
-	clock = drm_hdmi_compute_mode_clock(mode, 8, DRM_OUTPUT_COLOR_FORMAT_RGB444);
+	clock = drm_hdmi_compute_mode_clock(mode, 8, fmt);
 	if (!clock)
 		return MODE_ERROR;
 

-- 
2.53.0

