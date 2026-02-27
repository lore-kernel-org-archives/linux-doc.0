Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A2B41B34D;
	Fri, 27 Feb 2026 19:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772220307; cv=pass; b=KY0LToHwAwOuPQGIIe7xbYt+wyoRr4z7JdvGFF6KiT16rvqWeky+d0thzGNFfsRVrOyOdUBPU/a+naYlI9Nhvs5e17FJQbJcSo6HBncblyt4QVJ4G7GfNH3+GTv9fmUNYuhO4CUVSOI6W/DyQ8bSDwOazne0L9yFaqFYw+8rg+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772220307; c=relaxed/simple;
	bh=XAO+o9C6CXrNpJ8gSeMZuoNlLdd8/SKSzGTiMQSwQv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DKPo1KdJ2SVqllj/NkVeI9oSHa9hF1fK7qoZKkWDp1YiS7FksuY/S6sH+ggEkOzyV9DdymhciMJWfS6fnFJZkAwkjEc6Q+nfiKEbU1Xa4yAjUdM8Ib90eeBmNImIeW9htIQAsL5TooqjNGN+mopr0PJvbAsFMB5w5dAQyqlJruI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=CH4N7j+X; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="CH4N7j+X"
ARC-Seal: i=1; a=rsa-sha256; t=1772220180; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=P2pzPoFvy0wU/x1Gyo/7UXFShSqFzHf1Ufiy/IiOeWMVi7abFUPvnPtM0iUX54ktqMVkuAPQadaBgoBPlj2GGJxdXdaZOijunRp9YwnRkQKd7oU1apCtIa2/NR1DG0CRKznvGXpFPsL0/ZoHMMqDUhcNcMJhL1RbfIJAwVlkD0I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772220180; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2cUtFea6Xahy8xUmQNtz3A7vjD+5c56XmJo8KM/uRi4=; 
	b=BXUOrITizjsYDzIshH/s7p8CFp+5WomRz8L6td11kdrpw4WX7gQrPafonGJ5tmEwh/oenDe/rOXzKj9/qq8MuB4rundIfgRlX8eaJojn9RqAH2yHzk/MFkgcECqHyr5Bgqv7ntC805HL52MHPlxHMFpKhI5vIAcjRU8+WX+z6Hg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772220180;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=2cUtFea6Xahy8xUmQNtz3A7vjD+5c56XmJo8KM/uRi4=;
	b=CH4N7j+X6O/PSdWKZjDZoUc7rSQfogTTA1B0ModHEUrCekEKaDgfNt/Uk9jDWIuN
	4YXwiHa1BC68w2/zeY7Prb2f2hw0YNVSpRv3Y4oxZ0ezVmgozZfTwdPFXkyzm7VfqFQ
	P9Ap1VdGLZajvX9DuwjQGo6Kaa2GexM73Th5E4i0=
Received: by mx.zohomail.com with SMTPS id 1772220177756116.00125529261277;
	Fri, 27 Feb 2026 11:22:57 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 27 Feb 2026 20:20:24 +0100
Subject: [PATCH v9 19/19] drm/bridge: Document bridge chain format
 selection
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-color-format-v9-19-658c3b9db7ef@collabora.com>
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
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3

The bridge chain format selection behaviour was, until now,
undocumented. With the addition of the "color format" DRM property, it's
not sufficiently complex enough that documentation is warranted,
especially for driver authors trying to do the right thing.

Add a high-level overview of how the process is supposed to work, and
mention what the display driver is supposed to do if it wants to make
use of this functionality.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/gpu/drm-kms-helpers.rst |  6 ++++++
 drivers/gpu/drm/drm_bridge.c          | 40 +++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 781129f78b06..47c4f593cf9d 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -181,6 +181,12 @@ Bridge Operations
 .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
    :doc: bridge operations
 
+Bridge Chain Format Selection
+-----------------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
+   :doc: bridge chain format selection
+
 Bridge Connector Helper
 -----------------------
 
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 5938fba0a983..74f9af3f301e 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -198,6 +198,46 @@
  * driver.
  */
 
+/**
+ * DOC: bridge chain format selection
+ *
+ * A bridge chain, from display output processor to connector, may contain
+ * bridges capable of converting between bus formats on their inputs, and
+ * output formats on their outputs. For example, a bridge may be able to convert
+ * from RGB to YCbCr 4:4:4, and pass through YCbCr 4:2:0 as-is, but not convert
+ * from RGB to YCbCr 4:2:0. This means not all input formats map to all output
+ * formats.
+ *
+ * Further adding to this, a desired output color format, as specified with the
+ * "color format" DRM property, might not correspond 1:1 to what the display
+ * driver should set at its output. The bridge chain it feeds into may only be
+ * able to reach the desired output format, if a conversion from a different
+ * starting format is performed.
+ *
+ * To deal with this complexity, the recursive bridge chain bus format selection
+ * logic starts with the last bridge in the chain, usually the connector, and
+ * then recursively walks the chain of bridges backwards to the first bridge,
+ * trying to find a path.
+ *
+ * For a display driver to work in such a scenario, it should read the first
+ * bridge's bridge state to figure out which bus format the chain resolved to.
+ * If the first bridge's input format resolved to %MEDIA_BUS_FMT_FIXED, then its
+ * output format should be used.
+ *
+ * Special handling is done for HDMI as it relates to format selection. Instead
+ * of directly using the "color format" DRM property for bridge chains that end
+ * in HDMI bridges, the bridge chain format selection logic will trust the logic
+ * that set the HDMI output format. For the common HDMI state helper
+ * functionality, this means that %DRM_CONNECTOR_COLOR_FORMAT_AUTO will allow
+ * fallbacks to YCBCr 4:2:0 if the bandwidth requirements would otherwise be too
+ * high but the mode and connector allow it.
+ *
+ * For bridge chains that do not end in an HDMI bridge,
+ * %DRM_CONNECTOR_COLOR_FORMAT_AUTO will be satisfied with the first output
+ * format on the last bridge for which it can find a path back to the first
+ * bridge.
+ */
+
 /* Protect bridge_list and bridge_lingering_list */
 static DEFINE_MUTEX(bridge_lock);
 static LIST_HEAD(bridge_list);

-- 
2.53.0

