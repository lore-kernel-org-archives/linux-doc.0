Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCF231B810
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 10:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398358; cv=none; b=s758N0CPsxzUzrGpxCbvzLUx+IrU0YT7YIeCvVSbiX6+fvBsWkYsMZim0ejgh1mMrwi1fwpeih9618C3OHhh7eOZE1me3FLo3jQXHzPpPTXdWjkdYgAXKyTHvaGgnSWZlWYq69QAhJ7koCI8Xi83Vp6wx7yBcASBpV1cRFqfWKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398358; c=relaxed/simple;
	bh=zNfRFxKJmGCWDW0RYX4Fz/88QHBhgC3Pcntft5M0I1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o7fQnpDZxadhC73L9q8DuwthQIlCWsJ6fJRpMT03YMjQy10wsNw3IAvaKbk2dZLoAqNMc7+UdV5QRn375fH9V8R/b8PZpAJP8ZR7HEuF5GlFy5WdEqIQSmXto+C7DhszUO2fAEAfNA73r8HuxknoU/PLnO6Akg4W9Ste0w0daHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=H3/gjMiy; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="H3/gjMiy"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B2C2BC1AE05;
	Mon, 22 Dec 2025 10:12:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB2C1606C1;
	Mon, 22 Dec 2025 10:12:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 688CC10AB019D;
	Mon, 22 Dec 2025 11:12:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766398354; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3rDioDZW96sB584fik+FAOG3Tfu7GIllXvDUIad2QaU=;
	b=H3/gjMiy1Ah/0o28KH6F8ewKmPS92fchHI6LlHR6bEjCsvnaybUE2vRe5oD7A6Fk1ztL8j
	LSDWLJiU6CQZTS3Qsi992tS714usPg4k+dgs7nhyyeJC6EITK7fI/9dl78W8TlBOfGekWz
	oBxsSfLArza5C70r1SYf1+FMbE6UCwVeAKBfxryZCHZ9cUYNjZRMkq19p9dqWOk8MAkAOU
	WO17rFaoGYJlr1T+KyBsVt+PJMR6tnFUdOiNTlr+kvkcfXZWa0Jfn3nCtW7tDdPvimmiPX
	8qaGTuFE7IQTP9FU38+wUprGwx6fcr1fChcsbcKAfPQEAZH+pWlMLW+QN90FMA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:28 +0100
Subject: [PATCH v3 26/33] drm/vkms: Introduce configfs for connector
 supported colorspace
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-vkms-all-config-v3-26-ba42dc3fb9ff@bootlin.com>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4154;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=zNfRFxKJmGCWDW0RYX4Fz/88QHBhgC3Pcntft5M0I1E=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlDMqFdQIhDtPFad62IvTs5XqevUfd4TbXm2
 ozE3UzmGp2JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZQxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJRPxAArNKk6uHmRocRHNqJy5a+Iy7cMLJm6TW
 OKehyBJ2bvrrbW+8i33Ef3ehLPyn71gbdqkN2qO3bNvUoSzDTdIP3+EV4ceaLsefNRt+uRLmALw
 02DRivgqFxLbbqkLEREtPXhbMF7ipDleODNk2C4tviZvKhnhz3R9Q6O15A8XJ4TitrDTP2TAhDM
 yG9A9buLOxeiezxgKcBtH0Yza/+TARi1r1L2Y0UGVWW77/wQ14ZEcr714AD1E5m9KE2BeupoH0D
 fHQOuF4mLZkWUSSZAfeTstaS+gOgOeNrHpxDMETXlnmM7U3OWSIsm3EAaLcwXeidwuRLeu5q8Na
 lxuccMqYNTd6obEGFK0NUJTIVTSu8ic4u6fSApKfUk0kEIJ/0MXmZsRT2NKovWc+Qi9KNhCsncj
 fRwVkdUP4jtP2CVvlW8VJyAtYFnnx8/i9eNCye8U51CV3SvFfYk3sL75OyPn5pr0oqLh4moevqb
 JdrcIiVUnu2UNJcZ/FrtXCWez2pswo5rc4XAlendWMwcrogtZw+bL5Bk5BEYSyJh51gA+vQ2LaB
 IEp7RzUL/66iGY1A5DaWlGtEAhJoMEjWe7mOmU4vEX0PPq6PH+geZHZt0pHgLCMMFWLQwJyhTnq
 TFYP/8BOtMtZbTmWanfxpkstPhioR6AmNamqiD+m7QGirTlaWgOg=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

Add the attribute supported_colorspaces to configure the supported
colorspace of a connector. It will allows emulating some HDR features of
displays. This feature is only supported for HDMI, DP and eDP connectors.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/ABI/testing/configfs-vkms |  8 +++++++
 Documentation/gpu/vkms.rst              |  7 +++++-
 drivers/gpu/drm/vkms/vkms_configfs.c    | 40 +++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
index 5452140cc508..f750e616be54 100644
--- a/Documentation/ABI/testing/configfs-vkms
+++ b/Documentation/ABI/testing/configfs-vkms
@@ -40,6 +40,14 @@ Description:
         Type of the connector. Possible values match those
         exposed by the "type" field in drm_connector.
 
+What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/supported_colorspaces
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        Supported colorspaces for HDMI, DP, and eDP connectors.
+        Value is a bitfield, where 0x1 = NO_DATA, 0x2 = SMPTE_170M_YCC,
+        etc. See enum drm_colorspace for full list.
+
 What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/possible_encoders
 Date:		Nov 2025
 Contact:	dri-devel@lists.freedesktop.org
diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 41c6f4733663..1c4a8023374c 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -138,11 +138,16 @@ Last but not least, create one or more connectors::
 
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
index d6a85d6c466f..90bf6e6995ae 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -1233,12 +1233,52 @@ static ssize_t connector_type_store(struct config_item *item,
 	return count;
 }
 
+static ssize_t connector_supported_colorspaces_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_connector *connector;
+	int colorspaces;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	scoped_guard(mutex, &connector->dev->lock)
+	colorspaces = vkms_config_connector_get_supported_colorspaces(connector->config);
+
+	return sprintf(page, "%u", colorspaces);
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
+	scoped_guard(mutex, &connector->dev->lock) {
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
2.51.2

