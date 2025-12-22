Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16CE31354F
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 10:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398292; cv=none; b=tajNyyN2fKcKgImQXl/Fg+LuVHLqd3B6xd2kN4Jojth0CA1JBLly7jQLYP6r+CElS2ehr1krL/c+0Q5ZOPfxO/OI6mig+AoPJkE32F8Y4mSjmRB/p4y2aTJYTQN3v+Fnc3SoE5ZUqkfHEbV53qlGmP17X1qX0LeecNx/JBDdM6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398292; c=relaxed/simple;
	bh=u0WV/Itb+bzS/drY6Q8gQzG4ZgoFZcPdwt/RXarf84A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b6/ZU8nqMpgeq6RB6OLrm/Vfmq9C4wmtGQ5IHzSRG3O0FJkQU4NPEd0KMuMiTfJYEnr0dDFwZTOAdM+JQ06OogJiszKdhVUK4CTDjy3uItiQbpqJrphFodTo+ehbDConswckFXCYIYc6USeioZW7OuLZm0ff5LW4X9FK74uuw0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qI+G6e26; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qI+G6e26"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D469B4E41D33;
	Mon, 22 Dec 2025 10:11:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB0B4606C1;
	Mon, 22 Dec 2025 10:11:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 401F410AB01A4;
	Mon, 22 Dec 2025 11:11:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766398286; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TUspDMV4sV8T5ai7L9SrDaEiPOHe9taUzFXuPZLSI7g=;
	b=qI+G6e26K+/+hErHo91wmpdUAQgmWysXCEaFlII0l91qT0zZr/0R0YsoW7uEn5g0XRyD9r
	2croLSLYdrxyWkPHexaxOnfcOIiUcbjvpyk5Z7OfqhJNEkqZoiG+ZHy8CMJcg/09PmbuBA
	n/r1SjG4YCoNhiebrCls7Y+YEgq9s8wEeNgC1b4jYa7dX7gRDLIFhie3unbYjM2nTyxNn+
	sFZg8q/jIFITDcKh+OoxnCo8udR1mnuqgcI6SPLXJMB5V5CYYEhbTsoEWyvRpoiRDL4bFt
	XXWm/7d22ajjAl8Mgva3bVm3sbj63LvxkAQHlCip9RMmbwtsl84ObVdTE6Ki0A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:09 +0100
Subject: [PATCH v3 07/33] drm/vkms: Introduce configfs for plane name
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-vkms-all-config-v3-7-ba42dc3fb9ff@bootlin.com>
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
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3319;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=u0WV/Itb+bzS/drY6Q8gQzG4ZgoFZcPdwt/RXarf84A=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlAs61L/0GKf17EWT910wgFNdvYV02ahN+PL
 x5x5F0AA6OJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZQBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLA/RAAr+BlasurCyHPZhhUEGUE5I8uXxx22yg
 RojGL3z27M6oT+7bYhLgkvFxw6CHXsClK0YtCsVb0/i6GHxFH9vJnUH7rRAdXE++3dJUjG0cufE
 sWMno6uKM0fFn/7VVdem2tVGlqIfECk6fqY2+jq6Jt47DkwoopK/ric8Lf1LB1wZxI1+7eecmGX
 xvPrphWaYyfz5UxrFz578UCZk28QUKN1VWF0OLt3zmkyFEf5RtKvfhIB6ZJ/IdcxwJrC/Lq3jEb
 W4Hld80mfzlIsqi7jVZPzpXht6mBJt4u3998Xv30OiIDOUn25o5QlL+TKk6FPQleoFDsDEdEByz
 wK61zqcNG4R8RdxpHfsZzcTzqgpj/sYPnBPpdcIH18k2Kl/zHOnhzbtOx8SO5ATtCFpnXz6wFM3
 FFsl6BWnVzz3DMTU/FraCxn7UMYO7Q6UdIBQV7dN8tWrExAeKRRr3fWX1el2agjUG9FjZGemmxv
 OGzfHy/umQ7wnorcRAiyseD2U08ALUCwfBxU6sEXwayGrU6vZqv3pmb1MxA+iIbhRraZ05xyoA3
 wccbxto6udx0QwsqG5a/UKnDqAjPXDbyawZvuRPHQdiGCUYkTJ06l6nS8QPvk7CBc15WwlXI79P
 IcizpwTUSMOL1eXPuwQ5pVNI98uZGF7CnELVT4C4VmaDOxEgE8SY=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

Planes can have name, create a plane attribute to configure it. Currently
plane name is mainly used in logs.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/ABI/testing/configfs-vkms |  6 +++++
 Documentation/gpu/vkms.rst              |  3 ++-
 drivers/gpu/drm/vkms/vkms_configfs.c    | 43 +++++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
index 0beaa25f30ba..6fe375d1636f 100644
--- a/Documentation/ABI/testing/configfs-vkms
+++ b/Documentation/ABI/testing/configfs-vkms
@@ -103,6 +103,12 @@ Description:
         Plane type. Possible values: 0 - overlay, 1 - primary,
         2 - cursor.
 
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>/name
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        Name of the plane.
+
 What:		/sys/kernel/config/vkms/<device>/planes/<plane>/possible_crtcs
 Date:		Nov 2025
 Contact:	dri-devel@lists.freedesktop.org
diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 1e79e62a6bc4..79f1185d8645 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -87,10 +87,11 @@ Start by creating one or more planes::
 
   sudo mkdir /config/vkms/my-vkms/planes/plane0
 
-Planes have 1 configurable attribute:
+Planes have 2 configurable attributes:
 
 - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
   exposed by the "type" property of a plane)
+- name: Name of the plane. Allowed characters are [A-Za-z1-9_-]
 
 Continue by creating one or more CRTCs::
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 506666e21c91..989788042191 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -324,10 +324,53 @@ static ssize_t plane_type_store(struct config_item *item, const char *page,
 	return (ssize_t)count;
 }
 
+static ssize_t plane_name_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane;
+	const char *name;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	scoped_guard(mutex, &plane->dev->lock)
+		name = vkms_config_plane_get_name(plane->config);
+
+	if (name)
+		return sprintf(page, "%s\n", name);
+	return sprintf(page, "\n");
+}
+
+static ssize_t plane_name_store(struct config_item *item, const char *page,
+				size_t count)
+{
+	struct vkms_configfs_plane *plane;
+	size_t str_len;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	// strspn is not lenght-protected, ensure that page is a null-terminated string.
+	str_len = strnlen(page, count);
+	if (str_len >= count)
+		return -EINVAL;
+
+	if (strspn(page, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-") != count - 1)
+		return -EINVAL;
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		if (plane->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_plane_set_name(plane->config, page);
+	}
+
+	return (ssize_t)count;
+}
+
 CONFIGFS_ATTR(plane_, type);
+CONFIGFS_ATTR(plane_, name);
 
 static struct configfs_attribute *plane_item_attrs[] = {
 	&plane_attr_type,
+	&plane_attr_name,
 	NULL,
 };
 

-- 
2.51.2

