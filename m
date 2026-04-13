Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD263B3C0F;
	Mon, 13 Apr 2026 10:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074942; cv=pass; b=hhvB5/iGZl2vYgVH8blh2ErrFDtvHYYckh+mRPEkl4HB1PUu8I08m6ytxMaGabcfFtOWu6BIDBj5dg5CE+8I2G4GrW416b+LawSBn0N68RPZZqiDYvACh+lrNbnMGwGbLX5ftH6yAb7EdSoZHrbJLUpWdcseKSIJxaDgRbkGYBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074942; c=relaxed/simple;
	bh=0hcVvOpy56F4b8NAFc6vIijYLjfQpngP1TkQAGKKzsg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F0cOLrURiumnFoPtsAqsivviMONJouPlByNXFlgVSVBQCQwLBoVnQFBoF7yZ1fZAWRJrmp3N4eW19fgQvkLGJ39KhAUAhcC3aY60oaDFasE3+sVUc8kEAtsVHQcT5Y5rgrmOSgxVNIOkR8IiLrDp/TTbi2LmnPmPAikHkfoT0O0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=Udc0KEwV; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Udc0KEwV"
ARC-Seal: i=1; a=rsa-sha256; t=1776074899; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cD818MkwZJY3ZCKytg3FGlnUbcG4OfpQMnGwDpSqw1GopLqe9VThc3aEN34eRkntOW3jnYXd32XjsXayntyPuI9PRii0mfhGvp03g6bNztfA2BNSX4Jbf2vPa26O+MpRnluGQQ/GTCVaeb+hqBTBg0Nv+BosWdV1e7/o33t+b7Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776074899; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=edtnmsaCFOIW2dF6ZPDgcIxSPKqi37By5CYi0TNxv7E=; 
	b=F8r+H5BnWr0Y6zBsJqGsVCGzAjUr1lEbPGXE4mQFT8X+hCM0o9smf3dx33AssPoPFtmDa4UbbzVxWsg1BvJm7SardCXQUTmci7tOx7ZvzHufiRnrJURSn/3N0RhRvPMDWIlR8pX2ThKUPznQOZQd+1qTsIDfnGEGuZifJ17P06Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776074899;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=edtnmsaCFOIW2dF6ZPDgcIxSPKqi37By5CYi0TNxv7E=;
	b=Udc0KEwVE71SDj/utQ5zTM168W0F7G6WBtHTk3BjZTO85yd8dk3wK22szkH2jWCh
	PMdV8fMWutZEkAUQ0UoV0tEEkK5KPjRpt4PmelQPyXJ9wCKOxuMYW++WHMtz9dDb8T+
	zMg8yX8RcyPHw0kYsdBnYEblLCy0oiJFJCewYuig=
Received: by mx.zohomail.com with SMTPS id 1776074896853799.7351548980962;
	Mon, 13 Apr 2026 03:08:16 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 13 Apr 2026 12:07:18 +0200
Subject: [PATCH v13 04/27] drm/connector: Let connectors have a say in
 their color format
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-color-format-v13-4-ab37d4dfba48@collabora.com>
References: <20260413-color-format-v13-0-ab37d4dfba48@collabora.com>
In-Reply-To: <20260413-color-format-v13-0-ab37d4dfba48@collabora.com>
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
index 1c4f3ff7d84f..d354ab77d3b8 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3690,6 +3690,22 @@ void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
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
index 620f700fbe76..21767fffcba4 100644
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

