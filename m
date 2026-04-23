Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F29E3921C1;
	Thu, 23 Apr 2026 19:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776971108; cv=pass; b=EixeDNUgm4aUNuV7VAr9aCVo9LB9hDQr2REAfTyJQSjNz0kiQBC863Dg2TYIS/B1ecCVa3QgEytaEVFFv0KkhBsmZdFtYPlJt44gJXFMHgh6HM1Uuy2Rbg22jcclE4rOvz/MwP1MAqA9pNCbtvD6kgIZv/Bbc2NpQXTVollU5BA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776971108; c=relaxed/simple;
	bh=RdK7YSHJNSgODPuURrmgfLLUMb0Kqq0rYJ3CyAiF7mA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hMxDSjcPxtAkP70FH3fliWWx/Vk5cWgi0sFJGSr5KFlGvVx1Vm7aOBXD7/gh68PnWM6Fv1jtAfc95Lzhdy1nMKAQncTZsRuAKxKLZdb4qZcNiIpVSBOdUfkaRMUGi5MDHHZHqSFR9aVxfMGtrpTtqtuU1kVrkVKoEPJNDw3mdYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=lAVBKQXa; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="lAVBKQXa"
ARC-Seal: i=1; a=rsa-sha256; t=1776971065; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ju/4gqB3M0uGfz1CWbfpRIZovGD16qb7FhATk/U38CwE2coHlQzAGGLkjxkzJ5cKmoea7R2LK5zjva5e0bC9cJV3R+Uwln2q7IOZUgymm0hbS288y3GofbZps2bLVaOURzeCtgaHmz8DA1X7oLo8UcZ2HbeTUttlESEt7jnptE4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776971065; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+3ZXdBUtwsEIKAxIoWQ1BMFXFcfCNcQBw95rpjU83b4=; 
	b=RB9k06U3ycfA0Ro7aSTyo8S1wbQtQT/lk8uA9vFbbJaePnAZxGzowVhYcJTRtLgQeI6XrV6BIqxJAe6jWPqlS+WirCVUEg+gsIxdfTAuAizUTA/J0N7UECw4Z8nvzsth8bDiTmDXtMd8R+fOuYzVsopoKa2T0ErkudLIbOigsEY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776971065;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=+3ZXdBUtwsEIKAxIoWQ1BMFXFcfCNcQBw95rpjU83b4=;
	b=lAVBKQXahrwKuZJD5IScogH8k6oqNziR5v+pxDeq4LOKpU2u620Eq50KhYfNUZxZ
	bLrfvt5yrmYvREMESIjmaf6Z+OHE6OEfM6oXuob+TaL074c5UN6O0wLa7xTb5RAnt9B
	FaD7KfWQofYvtECxXFhbvtLqaHwKLqOahvWzwiWw=
Received: by mx.zohomail.com with SMTPS id 1776971064055837.7107731244814;
	Thu, 23 Apr 2026 12:04:24 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 23 Apr 2026 21:03:27 +0200
Subject: [PATCH v14 04/28] drm/connector: Let connectors have a say in
 their color format
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-color-format-v14-4-449a419ccbd4@collabora.com>
References: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
In-Reply-To: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
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
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2

Add a function to get the connector color format from a connector state,
and a new function pointer in drm_connector_funcs to allow connectors to
override what connector color format it returns.

This is useful for the bridge chain recursive bus format selection code,
which does not wish to implement connector implementation specific
checks like whether it involves HDMI.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_connector.c | 16 ++++++++++++++++
 include/drm/drm_connector.h     | 12 ++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index a0fca522f18f..41a5ab1e563e 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3685,6 +3685,22 @@ void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
 }
 EXPORT_SYMBOL(drm_connector_oob_hotplug_event);
 
+/**
+ * drm_connector_get_color_format - Return connector color format of @conn_state
+ * @conn_state: pointer to the &struct drm_connector_state to go check
+ *
+ */
+enum drm_connector_color_format
+drm_connector_get_color_format(const struct drm_connector_state *conn_state)
+{
+	struct drm_connector *connector = conn_state->connector;
+
+	if (connector->funcs->color_format)
+		return connector->funcs->color_format(conn_state);
+
+	return conn_state->color_format;
+}
+EXPORT_SYMBOL(drm_connector_get_color_format);
 
 /**
  * DOC: Tile group
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 3f7b94e4d83d..0178941bc0d1 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1811,6 +1811,16 @@ struct drm_connector_funcs {
 	 * Allows connectors to create connector-specific debugfs files.
 	 */
 	void (*debugfs_init)(struct drm_connector *connector, struct dentry *root);
+
+	/**
+	 * @color_format:
+	 *
+	 * Allows connectors to return a connector color format other than
+	 * @conn_state.color_format for purposes of e.g. display protocol
+	 * specific helper logic having already mapped it to an output format.
+	 */
+	enum drm_connector_color_format (*color_format)(
+		const struct drm_connector_state *conn_state);
 };
 
 /**
@@ -2627,6 +2637,8 @@ drm_connector_is_unregistered(struct drm_connector *connector)
 
 void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
 				     enum drm_connector_status status);
+enum drm_connector_color_format
+drm_connector_get_color_format(const struct drm_connector_state *conn_state);
 const char *drm_get_connector_type_name(unsigned int connector_type);
 const char *drm_get_connector_status_name(enum drm_connector_status status);
 const char *drm_get_subpixel_order_name(enum subpixel_order order);

-- 
2.53.0

