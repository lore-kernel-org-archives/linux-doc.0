Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C623C3444;
	Tue, 10 Mar 2026 16:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773158869; cv=none; b=j0cXSj3RPPR7ty6vT//GYm7NsVuXSYBh7WP9KqMpcQBLh1spb3jI0degL+pE/N1Wj0ZOlN3g51SoKC2JYjcS+XWy5sjnFdB1d/GexaCdymhjzlui7xsZTx6I5zrbC5GdVJPFAh7pZ7fNylCZDFHeBbzH//maTr1pBf4kb9ZNkVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773158869; c=relaxed/simple;
	bh=QxfzcvVPW0aFM70zbpbJXgcgM90rh002u3bQmLOy+YE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eHVM+L26uGZUup4er017zZSiWLuBehp0FJkpkfzFLBdBTlGIMPjYC3U6RdMzUsi8cKCc13H+8dcwSZtGCBG4LWqAWtHJlYcHOwJmqeGY8JGtGzjRrseUwb668j0qPhRKO3MaGkRPowba6sw/cyLSyX+w/WpLUZGByD6ZnAA2r2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1VWal32; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S1VWal32"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10422C19425;
	Tue, 10 Mar 2026 16:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773158869;
	bh=QxfzcvVPW0aFM70zbpbJXgcgM90rh002u3bQmLOy+YE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S1VWal32GmVLOUnQmKwE4b7WY9M1o/kDLaFwOcRlkuACNA4hcGwa3ES82K3e6vL3s
	 OTzZgDIo2yb2/OdZYH8r9Hyyj/uz3JMY08FlaDkrY93jYSPbOZFsaMQVP0m+IPp0rU
	 +fcHdqhLJx4lJvD04hewcwMzaxooH5IFZ+5HXJs9tquG4OJfOLDVLpYxjPYHYxDUKf
	 iRErQbG+hGEYAZp+1CMG11TQh288GljsRHqgv/ld/VZkfs0CHCKQ+p/b5sc6j5yq9y
	 adsRhuXyqKVufTkuMcgtlaCimsrmGBOFL79CHweXOQX8NPCp0GdXxUtcyfYTBXxfEu
	 WMRNhlr7I5Lbg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 10 Mar 2026 17:07:06 +0100
Subject: [PATCH 14/14] drm/bridge_connector: Convert to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-drm-mode-config-init-v1-14-de7397c8e1cf@kernel.org>
References: <20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org>
In-Reply-To: <20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2138; i=mripard@kernel.org;
 h=from:subject:message-id; bh=QxfzcvVPW0aFM70zbpbJXgcgM90rh002u3bQmLOy+YE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkbHFfmzvp4b3f7OoPGmCqxQj7x2GCjw6/jHZ5mpvxSX
 8T8M3Z1x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIg42MDYs71vUdf7fAgEf5
 HPftD2VaZRv1rl9/lHZg4dqEuT4PXj+Unv9Lmuvzu2+1a59LGiRXljLWu6S6TNb5ODt14+NvEgl
 qXFkTTUJZ/lvKTH245M55vYWZ3nXdc8X7g06o/gkpSuHfe5UTAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The connector created by drm_bridge_connector only initializes a
pristine state in reset, which is equivalent to that atomic_create_state
would expect. Let's convert to it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index f686aa5c0ed9b84dbe5e0957df22d08aff2f1945..2f73576783f5f69ebce277a7537accefc94645a9 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -263,26 +263,33 @@ static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
 		if (bridge->funcs->debugfs_init)
 			bridge->funcs->debugfs_init(bridge, root);
 	}
 }
 
-static void drm_bridge_connector_reset(struct drm_connector *connector)
+static struct drm_connector_state *
+drm_bridge_connector_create_state(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
+	struct drm_connector_state *conn_state;
+
+	conn_state = drm_atomic_helper_connector_create_state(connector);
+	if (IS_ERR(conn_state))
+		return conn_state;
 
-	drm_atomic_helper_connector_reset(connector);
 	if (bridge_connector->bridge_hdmi)
 		__drm_atomic_helper_connector_hdmi_reset(connector,
-							 connector->state);
+							 conn_state);
+
+	return conn_state;
 }
 
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
-	.reset = drm_bridge_connector_reset,
 	.detect = drm_bridge_connector_detect,
 	.force = drm_bridge_connector_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
+	.atomic_create_state = drm_bridge_connector_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 	.debugfs_init = drm_bridge_connector_debugfs_init,
 	.oob_hotplug_event = drm_bridge_connector_oob_hotplug_event,
 };

-- 
2.53.0

