Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692762;
	b=dPxK3DJV88GKsudheY2YfjRZ17cPQ2+y0TJjAnBeQvmGNIiNe+KH70/ESC3DHx46U4v6
	 JO9YgiaxqBylnFmwI/ikg+j1gvigLD0HwatMhCIJbCsb53awkL1z1ySnxpWvx9dd15dd9
	 B8zT2OZUbnRSz3tQk0fCmHsMMkt09xAyXiIpIY1vWerkt2gc+JiV0pCNhv2dFxdy+Ss51
	 5g7doERRODRxUR4Tve6NlL1LYMGQCTjEYV6lAFQcYyrqYOO99zYJlAkQ5EaZjLrZ03fm4
	 tmK7bTQITuj7NEaaARwLMY8AFibgJWlCRc7AL3nXcmhI6mufh0QU15P6TMZKgMNrEyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692762;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=Nrm8ZkvMtJ1LoyX7hx5ty2/5+Ey+zrYjrtFvVUQtOZY=;
	b=FT2Lu+2FPM5KSR9pT/0RTga+y8oLmQuJ06wR20Ud6xyd7hkst0OHjqQonAdk8smxoqk2
	 P9RtT/0UJCGHxWfY+5SJFor1WED5UW4W82RkVXwlbT9QCQuJZ/cl2SknoyeNrOmkelcq8
	 M7HwscTkVDiRabq4I9VgDWTdWnITnT0YOl+g5XHMq278pHI0QMCFF5DfD+V2/iuQkLudu
	 MP1b6l0Fb+MgiP9EC/bo5kj12W/EQ/m0dKp3zMwnqWDkXgCTLspEY8/nT+i/sdvzVnzBS
	 wH9Y138klzC3h0AtoOkY0F2UJuEEWiixhVyVLufcRgItASOddykaxiP9dq9kybStB2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=l6vw+347;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87B9606A32D;
	Thu, 26 Nov 2026 11:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B87B9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=l6vw+347
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A0A65C2B9CD;
	Thu, 26 Nov 2026 11:32:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5838960237;
	Thu, 26 Nov 2026 11:32:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AAAD011E6B36E;
	Thu, 26 Nov 2026 12:32:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692758; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Nrm8ZkvMtJ1LoyX7hx5ty2/5+Ey+zrYjrtFvVUQtOZY=;
	b=l6vw+347CTyHrb3i30+FjhwiNCKdU1eeznhrL0z3Y3o6DK2XDNMua03kE2spsbOYHsZv5S
	MHvT9auT5awIQMnSLxYKhByklU1RiAJiKfuK+c8Dq8KsyHgykYBaiRtbiVpqZpbJS6j9ar
	BQb+C2AAD0DvmRgbw+3K2JdzMQMQy5tntxWbVWL5o+lKRYc+C+W4gC26NbyWuEynnPRzyG
	SslEqAnJdqhdFBkRqPQKuGcslzWKfgWXqwPd590btMHuqBKLrXV7Qbdy2TIpoLNFI3PBj8
	7YVSmmcysAdUQBqJREyKNlvacaMBYIJFAPyjY6HDCleIJFUn+qy4XinJgoLhLw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 26 Nov 2026 12:29:18 +0100
Subject: [PATCH v7 35/43] drm/vkms: Introduce configfs for connector
 supported colorspace
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-vkms-all-config-v7-35-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com>
In-Reply-To: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>, Oarora Etimis <oaroraetimis@gmail.com>, 
 Harry Wentland <harry.wentland@amd.com>, 
 Lucas De Marchi <demarchi@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, sebastian.wick@redhat.com, 
 victoria@system76.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, llvm@lists.linux.dev
X-Mailer: b4 0.17-dev
X-Last-TLS-Session-Version: TLSv1.3

Add the attribute supported_colorspaces to configure the supported
colorspace of a connector. It will allows emulating some HDR features of
displays. This feature is only supported for HDMI, DP and eDP connectors.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/ABI/testing/configfs-vkms | 12 ++++++++++
 Documentation/gpu/vkms.rst              |  7 +++++-
 drivers/gpu/drm/vkms/vkms_configfs.c    | 40 +++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
index 4974f3851090..79a9486e359e 100644
--- a/Documentation/ABI/testing/configfs-vkms
+++ b/Documentation/ABI/testing/configfs-vkms
@@ -48,6 +48,18 @@ Description:
 	USB. Writing fails with -EBUSY if the device is enabled and the
 	connector is enabled.
 
+
+What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/supported_colorspaces
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	Supported colorspaces for HDMI, DP, and eDP connectors.
+	Value is a decimal number, where bit 0 = NO_DATA,
+	bit 1 = SMPTE_170M_YCC, etc. Bits beyond
+	DRM_MODE_COLORIMETRY_COUNT are rejected. Writing fails
+	with -EBUSY if the device is enabled. See enum
+	drm_colorspace for the full list.
+
 What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/possible_encoders
 Date:		Nov 2025
 Contact:	dri-devel@lists.freedesktop.org
diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index f2622b3fd8af..11058b6e6250 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -137,11 +137,16 @@ Last but not least, create one or more connectors::
 
   sudo mkdir /config/vkms/my-vkms/connectors/connector0
 
-Connectors have 2 configurable attribute:
+Connectors have 3 configurable attribute:
 
 - status: Connection status: 1 connected, 2 disconnected, 3 unknown (same values
   as those exposed by the "status" property of a connector)
 - type: Type of connector. Same values as exposed by the "type" field in drm_connector.
+- supported_colorspaces: Supported colorspaces values for HDMI, DP and eDP connectors.
+  If supported_colorspaces is not 0, the HDR_OUTPUT_METADATA will also be created.
+  Value is a bitfield, 0x1 = NO_DATA, 0x2 = SMPTE_170M_YCC... see enum drm_colorspace
+  for full list.
+
 
 To finish the configuration, link the different pipeline items::
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index fef731bdb059..7377d967be75 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -1153,12 +1153,52 @@ static ssize_t connector_type_store(struct config_item *item,
 	return count;
 }
 
+static ssize_t connector_supported_colorspaces_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_connector *connector;
+	int colorspaces;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	scoped_guard(mutex, &connector->dev->config->lock)
+	colorspaces = vkms_config_connector_get_supported_colorspaces(connector->config);
+
+	return sprintf(page, "%u\n", colorspaces);
+}
+
+static ssize_t connector_supported_colorspaces_store(struct config_item *item,
+						     const char *page, size_t count)
+{
+	struct vkms_configfs_connector *connector;
+	int val, ret;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	ret = kstrtouint(page, 10, &val);
+	if (ret)
+		return ret;
+
+	if ((val & -BIT(DRM_MODE_COLORIMETRY_COUNT)) != 0)
+		return -EINVAL;
+
+	scoped_guard(mutex, &connector->dev->config->lock) {
+		if (connector->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_connector_set_supported_colorspaces(connector->config, val);
+	}
+
+	return count;
+}
+
 CONFIGFS_ATTR(connector_, status);
 CONFIGFS_ATTR(connector_, type);
+CONFIGFS_ATTR(connector_, supported_colorspaces);
 
 static struct configfs_attribute *connector_item_attrs[] = {
 	&connector_attr_status,
 	&connector_attr_type,
+	&connector_attr_supported_colorspaces,
 	NULL,
 };
 

-- 
2.56.0

