Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAA231AA81
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 10:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398348; cv=none; b=G4hCTix23SPF+2yKag9/JLT9oYjU2zdhYuv2K/riRl66XggyM/veylVAaZWrrvNUZNBERs0i6gBSLOFQReOo22S2Jo5JZkJw0js7apvRHA1d1v5hNPwGC6hgcWRVoxY4k/M+spQu0el8hw4zxhU0dxznH7ACXuvVos3M5ytNzWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398348; c=relaxed/simple;
	bh=YfhHPCBRadtLDnNh6hkyyciYwfxoCIh5V5YD+cL4HxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UPCZyLfWHAXPgJdubo1fuwql0TE5nLmWnURvcVY79vD63nVgbshiVN/b+iasRGK0s1IxgoSyfoTviMgyfer32Tw+Dv5uvavv+0EmY0KZqg0yweL+tjB9SCYUaoULSPi+vjnqppzMTLno7Q062d4OM+sYuwT4q4yclbNLO7apad0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AT9a7Bjs; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AT9a7Bjs"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4C4724E41D33;
	Mon, 22 Dec 2025 10:12:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 235B8606C1;
	Mon, 22 Dec 2025 10:12:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C51D210AB019E;
	Mon, 22 Dec 2025 11:12:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766398340; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2cObqjoFfW7734SjxgtP+ltDMD9c+ams0J07Fvg4daU=;
	b=AT9a7BjsTitNatmwcQ80DMAxftQfySER1x1nOaLHFQL5qjKDdf7ojyhVQ6YQDLIKQaUCPA
	Q6rLLjTDg4ZVC5ERIML1k/TnxfwJfPne5UDqwW567hm2dVmo4Yov/B2zYbdhQ37LWEbKU+
	B3ZLlq9JQ3BetZbvyu79C/bY+uOWjOkvZLUgOpbQJT6fM9Gbh7TOlXEOOBudMhsTNyo9yR
	23US1wLy48AVDuwhXVuUU+jyp1HFJNlCzeLRLxw988hZef2dUdm31/m/mhkazddt/ST/JR
	3ntbAyHqQG93SFEvwXxtwR6BONF/bCUkVZOS+XlAAdk3emVufebva0D1m8XACQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:25 +0100
Subject: [PATCH v3 23/33] drm/vkms: Introduce configfs for connector type
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-vkms-all-config-v3-23-ba42dc3fb9ff@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4190;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=YfhHPCBRadtLDnNh6hkyyciYwfxoCIh5V5YD+cL4HxU=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlCEvo5eXQjVmXy2NXcs3egEbysfYRulNVMO
 qNmF6LeJpeJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZQhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJqkxAAiGQIfm2wq87Dav2MEYQlo+0UY+6XM0f
 cNhHcMwZU72X2iMslQop9CH2vCJtctx2clOo4dPU6rWJTdSwGCtfnJoZ2pK9yuOxeyNrP6Trnxh
 ZEFHfTn4qEsYZOBuaB7iUR+y7Vg+zM1F1pr4kShNT7kD8Wk96ry8qIjetA24Bh6PD5ci0ryWwD3
 Lv4owvJayUAwGdFBvsBul7XCLDW0pz22c/2x5pRHwuZHQvBM+LpVxv8jQNC6LikmAB+rO1x6qVP
 ChJC7yYZBzJAaztOHMdq90GuCEc4pa6IH0Y9saK2A1EckxQfH/hDxgD21GN2MGKoxIhtA+CliI3
 vherv2xNMWl+2bBi1JWr0BjKUMdWyUCYD1U3wSeupMm1PIwpzOgVyFHrw7WaRqi1SWxJt1giALY
 XK8Q2WsUmutN8bX5oF18slzua8Q7S+/an74J0vuivyMlnbg6hoMjkSyFolw9QZpSuhCqhwQ4CwA
 hDtWP9XuT3nSNznwlg0PFA0NmNQUrcFyDllvPU2ykUIES//oy6KkEBAPyNJ/J6IcVqj+0Rm5bPx
 oROKMM0HNafas4Vhx5zBhTukJsO2ELgdOL5MNRChXojxrI1nv5tT9U28PbeV7RJb/54jy3XAZ9k
 FsFTbXUGg4hFyLUsqzhtmCPhBIko9zbMEm7iVeiKnXR/aU6YP2fg=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

Add a new attribute to connector to change its type. This is mostly
cosmetic and don't have direct effect in VKMS behavior.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/ABI/testing/configfs-vkms |  7 ++++
 Documentation/gpu/vkms.rst              |  3 +-
 drivers/gpu/drm/vkms/vkms_configfs.c    | 65 +++++++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
index 34cb6aeec411..5452140cc508 100644
--- a/Documentation/ABI/testing/configfs-vkms
+++ b/Documentation/ABI/testing/configfs-vkms
@@ -33,6 +33,13 @@ Description:
         Connection status of the connector. Possible values:
         1 - connected, 2 - disconnected, 3 - unknown.
 
+What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/type
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        Type of the connector. Possible values match those
+        exposed by the "type" field in drm_connector.
+
 What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/possible_encoders
 Date:		Nov 2025
 Contact:	dri-devel@lists.freedesktop.org
diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 791c4f33a90a..41c6f4733663 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -138,10 +138,11 @@ Last but not least, create one or more connectors::
 
   sudo mkdir /config/vkms/my-vkms/connectors/connector0
 
-Connectors have 1 configurable attribute:
+Connectors have 2 configurable attribute:
 
 - status: Connection status: 1 connected, 2 disconnected, 3 unknown (same values
   as those exposed by the "status" property of a connector)
+- type: Type of connector. Same values as exposed by the "type" field in drm_connector.
 
 To finish the configuration, link the different pipeline items::
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index e7f3ab54b5a1..d6a85d6c466f 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -1170,10 +1170,75 @@ static ssize_t connector_status_store(struct config_item *item,
 	return (ssize_t)count;
 }
 
+static ssize_t connector_type_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_connector *connector;
+	int type;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	scoped_guard(mutex, &connector->dev->lock) {
+		type = vkms_config_connector_get_type(connector->config);
+	}
+
+	return sprintf(page, "%u", type);
+}
+
+static ssize_t connector_type_store(struct config_item *item,
+				    const char *page, size_t count)
+{
+	struct vkms_configfs_connector *connector;
+	int val, ret;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	ret = kstrtouint(page, 10, &val);
+
+	if (ret)
+		return ret;
+
+	switch (val) {
+	case DRM_MODE_CONNECTOR_Unknown:
+	case DRM_MODE_CONNECTOR_VGA:
+	case DRM_MODE_CONNECTOR_DVII:
+	case DRM_MODE_CONNECTOR_DVID:
+	case DRM_MODE_CONNECTOR_DVIA:
+	case DRM_MODE_CONNECTOR_Composite:
+	case DRM_MODE_CONNECTOR_SVIDEO:
+	case DRM_MODE_CONNECTOR_LVDS:
+	case DRM_MODE_CONNECTOR_Component:
+	case DRM_MODE_CONNECTOR_9PinDIN:
+	case DRM_MODE_CONNECTOR_DisplayPort:
+	case DRM_MODE_CONNECTOR_HDMIA:
+	case DRM_MODE_CONNECTOR_HDMIB:
+	case DRM_MODE_CONNECTOR_TV:
+	case DRM_MODE_CONNECTOR_eDP:
+	case DRM_MODE_CONNECTOR_VIRTUAL:
+	case DRM_MODE_CONNECTOR_DSI:
+	case DRM_MODE_CONNECTOR_DPI:
+	case DRM_MODE_CONNECTOR_SPI:
+	case DRM_MODE_CONNECTOR_USB:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	scoped_guard(mutex, &connector->dev->lock) {
+		if (connector->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_connector_set_type(connector->config, val);
+	}
+
+	return count;
+}
+
 CONFIGFS_ATTR(connector_, status);
+CONFIGFS_ATTR(connector_, type);
 
 static struct configfs_attribute *connector_item_attrs[] = {
 	&connector_attr_status,
+	&connector_attr_type,
 	NULL,
 };
 

-- 
2.51.2

