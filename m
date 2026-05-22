Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1E438B122;
	Fri, 22 May 2026 12:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453265; cv=pass; b=iuSqen31YqmzYfCdyOR6YDQ0zTmEMwF1K8R5DZgJN0rk8SIe01o5bwWYuusbtiJOXxf6oxocJzEIbbKwPDWdDYxm1fsTgaDzK4bHiM0AxyZUu4LmwaZBQupZ9BQjJPLZajinI+0GEUrZQuulk1l2eDq/GUwlEQkIHmAs8m2mzdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453265; c=relaxed/simple;
	bh=idHvY7uDbyLRUd1NACdgp7z7Br7cR1/7OnjyZz1jchg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aoP7pjxoj3a7BP71Myc43KoZBbn5ga+SyvfNsSrB7MvA35ciuiSoiYi+eC9+aE+1vnSJBPpR+rBAlyaQAbixyiSxn1Y4nInSuK7+Og+A1YWxgwYT6MWv96DfEXrkqo5ohowZPnk/GBVDqkQR4pKmHnY2z4EenFqHXuB2W3VdJtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=clG2lVmh; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="clG2lVmh"
ARC-Seal: i=1; a=rsa-sha256; t=1779453216; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=W+VKVaN7BYH3lBwdru3GhFWT1R4zoeF7S3Bv5duVy4qmJ0lZ7ZrvdHYoHTb2kep+piuu3iloSfpI7xNJZ+Vq2oWt8oa8f50yXrn9MPExYVQunRTAnANxZ304d2hU9lBaBtOENHZN2vzSP9B3yZBsim2A3Z3IYq6f7QMTQ6W7hOQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779453216; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/PUt4P68/4rpObwZlHYIVoutXtcTKnMeaTTL4VAZHho=; 
	b=KEHm1I69kfISyXoiwY+WGOMtY8atFeF+5CdeXsWAa8uFeLcJo44w0GaIPwk/gtGLBQs9A+rXZZtM6r+9Ty7L93u95FHChCNr4l5xC5UXeU0DLofhZqwyINsmsuKe0PdMWqUXq0RpEeA40YEIX8v7r6XUFDNQc/2spGaXF8rMCU0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779453216;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=/PUt4P68/4rpObwZlHYIVoutXtcTKnMeaTTL4VAZHho=;
	b=clG2lVmhn9qPS4FzPm+ApeqxxUYzZVdvks/22zV2FiY7Lo7yEN1ODzoKOaxTrzJ8
	oQpkfWnI5q1lbYnCPp2dh6mDx83HdU8I07/30ITJ1KolXDiQiYV6OBOS/B2id8e/XL5
	PN0e+LqBj28OenFTcwEoW/ZESjRmdZdVrNel834A=
Received: by mx.zohomail.com with SMTPS id 1779453214584670.9329500780323;
	Fri, 22 May 2026 05:33:34 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 22 May 2026 14:31:58 +0200
Subject: [PATCH v15 07/28] drm/atomic-helper: Add HDMI bridge output bus
 formats helper
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-color-format-v15-7-21fb136c9df2@collabora.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The drm_bridge_funcs atomic_get_output_bus_fmts operation should be the
same for likely every HDMI connector bridge, unless such an HDMI
connector bridge has some special hardware restrictions that I cannot
envision yet.

To avoid code duplication and standardize on a set of media bus formats
that the HDMI output color formats translate to, add a common helper
function that implements this operation to the drm bridge helpers.

The function returns a list of output bus formats based on the HDMI
bridge's current output bits-per-component, and its bitmask of supported
color formats.

To guard against future expansion of DRM_OUTPUT_COLOR_FORMAT outgrowing
the hweight8 call, add a BUILD_BUG_ON statement where it's used that
checks for DRM_OUTPUT_COLOR_FORMAT_COUNT. The justification for not
using hweight32 in all cases is that not all ISAs have a popcount
instruction, and will benefit from a smaller/faster software
implementation that doesn't have to operate across all bits.

The justification for not defining an hweight_color depending on the
value of DRM_OUTPUT_COLOR_FORMAT_COUNT is that this count enum value is
only known at compile time, not at preprocessor time.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 81 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_atomic_helper.h     |  7 ++++
 2 files changed, 88 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 3547f797a850..285aac3554df 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -28,6 +28,7 @@
 #include <linux/export.h>
 #include <linux/dma-fence.h>
 #include <linux/ktime.h>
+#include <linux/media-bus-format.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -4107,3 +4108,83 @@ drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
 	return input_fmts;
 }
 EXPORT_SYMBOL(drm_atomic_helper_bridge_propagate_bus_fmt);
+
+/**
+ * drm_atomic_helper_bridge_get_hdmi_output_bus_fmts - helper implementing
+ *                                           atomic_get_output_bus_fmts for HDMI
+ * @bridge: pointer to &struct drm_bridge
+ * @bridge_state: pointer to the current bridge state
+ * @crtc_state: pointer to the current CRTC state
+ * @conn_state: pointer to the current connector state
+ * @num_output_fmts: pointer to where the number of entries in the returned array
+ *                   will be stored. Set to 0 if unsuccessful.
+ *
+ * Common implementation for the &drm_bridge_funcs.atomic_get_output_bus_fmts
+ * operation that's applicable to HDMI connectors.
+ *
+ * Returns: a newly allocated array of u32 values of length \*@num_output_fmts,
+ * representing all the MEDIA_BUS_FMTS\_ for the current connector state's
+ * chosen HDMI output bits per compoennt, or %NULL if it fails to allocate one.
+ */
+u32 *
+drm_atomic_helper_bridge_get_hdmi_output_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					unsigned int *num_output_fmts)
+{
+	unsigned int num_fmts = 0;
+	u32 *out_fmts;
+
+	/*
+	 * bridge->supported_formats is a bit field of BIT(enum drm_output_color_format)
+	 * values. The smallest hweight that is smaller than or equal to
+	 * %DRM_OUTPUT_COLOR_FORMAT_COUNT will do for counting set bits here.
+	 */
+	BUILD_BUG_ON(const_true(DRM_OUTPUT_COLOR_FORMAT_COUNT > 8));
+	out_fmts = kmalloc_array(hweight8(bridge->supported_formats),
+				 sizeof(u32), GFP_KERNEL);
+	if (!out_fmts) {
+		*num_output_fmts = 0;
+		return NULL;
+	}
+
+	switch (conn_state->hdmi.output_bpc) {
+	case 12:
+		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_RGB121212_1X36;
+		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_YUV12_1X36;
+		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYVY12_1X24;
+		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYYVYY12_0_5X36;
+		break;
+	case 10:
+		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_RGB101010_1X30;
+		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_YUV10_1X30;
+		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYVY10_1X20;
+		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYYVYY10_0_5X30;
+		break;
+	default:
+		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_RGB888_1X24;
+		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_YUV8_1X24;
+		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYVY8_1X16;
+		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
+		break;
+	}
+
+	*num_output_fmts = num_fmts;
+
+	return out_fmts;
+}
+EXPORT_SYMBOL(drm_atomic_helper_bridge_get_hdmi_output_bus_fmts);
+
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index b84152810abb..4cfeec70d648 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -295,4 +295,11 @@ drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
 					u32 output_fmt,
 					unsigned int *num_input_fmts);
 
+u32 *
+drm_atomic_helper_bridge_get_hdmi_output_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					unsigned int *num_output_fmts);
+
 #endif /* DRM_ATOMIC_HELPER_H_ */

-- 
2.54.0

