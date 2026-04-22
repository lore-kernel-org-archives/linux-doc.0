Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7694D382F20
	for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 16:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776876552; cv=none; b=VpFeYKXyJAm5gzM4B65/vruimnZ6QlAWWYUpkLItygKIAo8Yn1DaX8u7YkzZ7izCDWYEaNdAtK6TSo9TP4oyMVbaUUCwiq3zmtTX3GTewYedpgV4mcywhPeK0GwN8qGV7BYn7m6uMv7sybAsIAFdxBZcXPGItMULptMgV1FONN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776876552; c=relaxed/simple;
	bh=M4IKg4jtN2coKi4h2W5OHuSx8L+kOjlkuI6yHVh2tSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dr0m9oGJ0w9MqKYh8hUn4Klcv0BKDMADzkmBEXQC0LJvc2CiRt9gAtzqyDZ/G4zA0C6W+LHWhEKD12X0Qj8FtYFKKCudRro21ux7UVAG82+1+otq0TyRcpNPEY40NOyeeHLj6Q/kTDVzQ1F/cDiQMMfPFQ0AOhe4pJW9kgy/3dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HcDVAzTH; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HcDVAzTH"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2072CC59952;
	Wed, 22 Apr 2026 16:49:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3EBFE5FA8F;
	Wed, 22 Apr 2026 16:49:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE2F310460BF3;
	Wed, 22 Apr 2026 18:49:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776876549; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OZ8EM81DGMlJ9qEgvUE9Mt5KnFr4O4RtbirwspUTjRM=;
	b=HcDVAzTHVCirt6CQPqvVisMsLuiOiNG9IUbiBRETLuOVj8WUqocJRx1lyWQbRSi9wAQF8d
	bszoxzq8RBSAGFtIwmj/f7dBd5XGTeoK01YRpA5XQKjna2jsThDFyAfHF3w7zSjkgfZzOm
	pag0n5lYdrG2tgfjncUEkL5XUIe8rZsq5Ey+FDxYlO905hZyTgeZqDq4piwnVfK4w7SEnt
	O5UxtifKtDf2i8/Oux94IqTEl21Wkfr5yqRB0/47ZTVE17eFd2lVLLWYvXVYwOgv0tK/8O
	EEHzSqAjWmWwMCQ2IpDAk6nfg5BO7hiAkRdor7docN5tA32iDQcn8pqcqAc77Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 22 Apr 2026 18:48:04 +0200
Subject: [PATCH v4 07/37] Documentation: ABI: vkms: Add current VKMS ABI
 documentation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-vkms-all-config-v4-7-dbb52e9aadc3@bootlin.com>
References: <20260422-vkms-all-config-v4-0-dbb52e9aadc3@bootlin.com>
In-Reply-To: <20260422-vkms-all-config-v4-0-dbb52e9aadc3@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 llvm@lists.linux.dev
X-Mailer: b4 0.16-dev
X-Last-TLS-Session-Version: TLSv1.3

VKMS recently introduced a ConfigFS API to configure new devices.
Add proper ABI documentation.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/ABI/testing/configfs-vkms | 118 ++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
new file mode 100644
index 000000000000..a1a3e186e50a
--- /dev/null
+++ b/Documentation/ABI/testing/configfs-vkms
@@ -0,0 +1,118 @@
+What:		/sys/kernel/config/vkms/
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        This group contains sub-groups corresponding to created
+	VKMS devices.
+
+What:		/sys/kernel/config/vkms/<device>
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains sub-groups corresponding to the VKMS
+	device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/connectors
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains sub-groups corresponding to the
+	connectors of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/connectors/<connector>
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains attributes corresponding to the
+	connector <connector> of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/status
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	Connection status of the connector. Possible values:
+	1 - connected, 2 - disconnected, 3 - unknown.
+
+What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/possible_encoders
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains symbolic links to possible encoders
+	for this connector.
+
+What:		/sys/kernel/config/vkms/<device>/crtcs
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains sub-groups corresponding to the
+	CRTCs of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/crtcs/<crtc>
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains attributes corresponding to the
+	CRTC <crtc> of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/crtcs/<crtc>/writeback
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	Enable or disable writeback connector support for this
+	CRTC. Value: 1 - enabled, 0 - disabled.
+
+What:		/sys/kernel/config/vkms/<device>/encoders
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains sub-groups corresponding to the
+	encoders of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/encoders/<encoder>
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains attributes corresponding to the
+	encoder <encoder> of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/encoders/<encoder>/possible_crtcs
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains symbolic links to possible CRTCs
+	for this encoder.
+
+What:		/sys/kernel/config/vkms/<device>/planes
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains sub-groups corresponding to the
+	planes of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains attributes corresponding to the
+	plane <plane> of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>/type
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	Plane type. Possible values: 0 - overlay, 1 - primary,
+	2 - cursor.
+
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>/possible_crtcs
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains symbolic links to possible CRTCs
+	for this plane.
+
+What:		/sys/kernel/config/vkms/<device>/enabled
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	Enable or disable the VKMS device. Value: 1 - enabled,
+	0 - disabled.

-- 
2.54.0

