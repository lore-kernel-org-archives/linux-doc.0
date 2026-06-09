Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691FE421EE6;
	Tue,  9 Jun 2026 12:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009344; cv=pass; b=m7+SB2lUMcVVARYTiNNr+LIHVtX65yim1N52jTSTz00MX8/fLyw3YE7elFaMNNLtHbKtHyAeJ+jVkPFYBf/uUhobLVo7esd8BwIY/9gMeczMmTsRDr3OL8EHdYQ8GJOM+bRr5tOLsmTERs5vsKXyu4S3XLFky3OpwwgN3pOu8uo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009344; c=relaxed/simple;
	bh=oslKiYEQbaa2hwWUPLzKla4NoohLx7Y9XjcA9b20L7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q5vAOwZnERLFTPoUEswLilYujIinSWczT0qrVL26xFyAGCzwGAcF/wzghkC8p/k2CZqgXGY+uCz8Qd7UR8/ZiG9CFYh+tF65p0lTaNeymMzq5evlEo13rpY59KoidHoGIJxEBlD5nmXNHDxvVzxWYxmm82v5UoVdUh6Z3qC+GBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=g+ufCk/r; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="g+ufCk/r"
ARC-Seal: i=1; a=rsa-sha256; t=1781009302; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bYFYz1ujurLHtgRKzmDjEb+gL6uQmQZMHF6zOoLUAuyN3wdr8pvvQfAyWWxaE0Js0jyI6IG4wbRALVoRNChayDDhp8yZDbPcFXAx4SonwLilQVVavSHbFScsyOu+ylH6oB6NowCFwbABl5qu+/BBdhGcWi7CsohLb3bAJyZ1U/M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781009302; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JozXtiKcx7avKOj7xCK3QtSfIpe/5RCc9M60ZmCKepQ=; 
	b=Y079K/nlVdqtJvnQG6Ozl+Xn4reDShkYOmwyljUKOQYuKhDidaEqkmiqjxrKnoXWVS2c0i1dLLu1S8wbaby4UHv8gpEbSDZ1ycpDuAV8LEuSdSZSGoRs9UHwgTvpYSus7/Gs3iYU0G2KmqPWDz2lJ810cxbVxik15gItTg697Q0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781009302;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=JozXtiKcx7avKOj7xCK3QtSfIpe/5RCc9M60ZmCKepQ=;
	b=g+ufCk/rRYPveQUXnSfmyjwEk/NXMmiIeORy7Hs0u24VF8ARHuIMtCCufAyqjEmc
	QxKKzYSupOMdEiBOAe0a1Qr0VIOsFuVrYX951mIUNEFDSIgbye0ZIzOL/s8MSd0CPQs
	3GpgYpOFOkfkCASnirv2ouyi3DbarRO2cUxQI+Ac=
Received: by mx.zohomail.com with SMTPS id 1781009301146254.45527484098727;
	Tue, 9 Jun 2026 05:48:21 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 09 Jun 2026 14:44:13 +0200
Subject: [PATCH v17 26/28] drm/i915/dp: Add YCBCR444 handling for sink
 formats
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-color-format-v17-26-35739b5782cc@collabora.com>
References: <20260609-color-format-v17-0-35739b5782cc@collabora.com>
In-Reply-To: <20260609-color-format-v17-0-35739b5782cc@collabora.com>
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
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2

In anticipation of userspace being able to explicitly select supported
sink formats, add handling of the YCBCR444 sink format. The AUTO path
does not choose this format, but with explicit format selection added to
the driver, it becomes a possibility.

Check for both source and sink support of YCBCR444 in
intel_dp_sink_format_valid.

Acked-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index f01a6eed3839..7c69d3badf9f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1344,6 +1344,16 @@ intel_dp_mode_valid_downstream(struct intel_connector *connector,
 					 8, sink_format, true);
 }
 
+static bool
+intel_dp_can_ycbcr444(struct intel_dp *intel_dp)
+{
+	if (source_can_output(intel_dp, INTEL_OUTPUT_FORMAT_YCBCR444) &&
+	    !drm_dp_is_branch(intel_dp->dpcd))
+		return true;
+
+	return false;
+}
+
 static enum drm_mode_status
 intel_dp_sink_format_valid(struct intel_connector *connector,
 			   const struct drm_display_mode *mode,
@@ -1362,6 +1372,16 @@ intel_dp_sink_format_valid(struct intel_connector *connector,
 		    !drm_mode_is_420(info, mode))
 			return MODE_NO_420;
 
+		return MODE_OK;
+	case INTEL_OUTPUT_FORMAT_YCBCR444:
+		if (intel_dp->dfp.min_tmds_clock &&
+		    !intel_dp_has_hdmi_sink(intel_dp))
+			return MODE_BAD;
+		if (!intel_dp_can_ycbcr444(intel_dp))
+			return MODE_BAD;
+		if (!(info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444)))
+			return MODE_BAD;
+
 		return MODE_OK;
 	case INTEL_OUTPUT_FORMAT_RGB:
 		return MODE_OK;

-- 
2.54.0

