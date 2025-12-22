Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636E131AA82
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 10:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398354; cv=none; b=EsuN+tnUL/zTskbAWVtI/YreOTtda2i0QCcsdKhDLkScooY6Qkzw+7clSLRTBfggaj5mzJT8PUvyqVj9IGnYASiGuLlV7qfjyG159VPYgzYhgWjw591qKlfWk9XKCIKNThVlnduy7SISCf8XeAhFO7sTEyyhRk1aOaTlKjwsT3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398354; c=relaxed/simple;
	bh=KnGxFis/5j2zHTEy3YIbGEDRffhNaf3bRQz4h6vtkb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pQzMiGRFlgx9hAxs4pCpyqwwYyI1eqawWKanWa1I2STOwW3KY3B94T/jd7r65UFhLGEdeIPZOjFmKKGEqrox5ZxELla8b/YyeEDEzWmQyfbtN/TYksbOFoA/qeIbJhUkySdH2jwxTrmzpPPUYKRYZ1o5LM7eJYArOVTJGCEsYTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Nk4eLxdT; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Nk4eLxdT"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 19C9F1A2373;
	Mon, 22 Dec 2025 10:12:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DFE8E606C1;
	Mon, 22 Dec 2025 10:12:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9924B10AB0199;
	Mon, 22 Dec 2025 11:12:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766398346; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eL8Crh30dL9IlFxIAQwRgzxl5mvrGNMvjII/yDEj1rY=;
	b=Nk4eLxdT99+QMbI57xFNy+cINopA8trUBDYj2lJAHdoGMMwAKCsE4NYKFPpjdolwvwuIFb
	roP9TL9pS/CO/r86p+P5dj4jqz/E+aJrOMhnHUntTxoHTBwwIT/7LDZ6DOF9+sj4bVxGx5
	vqdgKyEbDYLonLeCCrHGNijQUG8nefr2HbKEJgZJZlPYan3Go9mHl97yMhYwH+Noz+Sk2j
	2WLMmvi6ChwekfdrGp4oV/r8WnnwHR0wtJT6q8n9jFi3XORvv9JVIif7hzm4AzKCStOZSJ
	EtyfWq6NGJJPm1gTWI8ZHY2wV+FuvDx7k4em/wxLi1Zg23++n0e9/PRa/R/KQg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:26 +0100
Subject: [PATCH v3 24/33] drm/connector: Export drm_get_colorspace_name
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-vkms-all-config-v3-24-ba42dc3fb9ff@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=723;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=KnGxFis/5j2zHTEy3YIbGEDRffhNaf3bRQz4h6vtkb0=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlCYv/2NRWZPHdZgmTWGcYb5Pn/WYdMRpHdo
 iKyp80tFh2JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZQhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIEPw/9HqbUC85b5C6fdry/ocb+5EoGqJzOF6w
 rV1sShl+DPjDUcEt5wi1SPxnsV2GS8WdnfqhQbeJ8j4jCiCBWSSsoTo5PVJRwRXAJoVSXR6XJDk
 NPVToqHnNX0sjurwlNsTqcdoFI9ayz6ijw2bTiiwVO3aLKjNuupoWaRChkQW9dORZQhtHzD1YyT
 iNswO+sRTS86dtGEwX90XUpqxikF6q/KR5RydRHMTGkMaHWQTC8MyIuDY3yNIVnjseVd+n52y9R
 mqoTutifW4rzoLDbIzxuKMB4oV3gskytGggvnHMLk1OtqGAJtXWUP8W1qdRfGpPGsMycENxbvZx
 J0ZvUEY3ItC0/D3oDHt4vGfRFo1vY+mJ4DNnUlHlg4H+5BKFkePv/Y0f/H2u9kQSxXkSzEnt7SI
 lSQRf5pWa/mRDFnUILNZSKXIBSdqPR9pfWWj1uvwU4F2l/UuQDOzMfC3+oBBa4Ie3cU73dVyzoy
 urVohNTmMOK4up6XbLg2vvrxxjBKlGgepVLAc08XYCCRxUBjAZq5C2NGQVwhdQ/tToOTnVHMazw
 KReEHGhqtTSoo3xBUMu6Bm3SQWId+TZzyzTsIO8gEpGX4Uukoc0Quwkm+LVUUrt09s18f2P/RcC
 eoKAYzakxZxfcMugbxhGDrAzQP0v6JgH6PoFzs0AD+/DyWSrdWCY=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

Export drm_get_colorspace_name so it could be used by VKMS

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_connector.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 4d6dc9ebfdb5..77c2fcd4f222 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1362,6 +1362,7 @@ const char *drm_get_colorspace_name(enum drm_colorspace colorspace)
 	else
 		return "(null)";
 }
+EXPORT_SYMBOL(drm_get_colorspace_name);
 
 static const u32 hdmi_colorspaces =
 	BIT(DRM_MODE_COLORIMETRY_SMPTE_170M_YCC) |

-- 
2.51.2

