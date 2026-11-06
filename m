Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981885;
	b=DUojwkDC8F5OGM82LG5dOqOGiD5HpV3dnb3taOGdiQAQ6Y4N7d4GvKGjsHIuVyKZSvVY
	 yu4jse16K661Y6CVEfaitsL5SOnc0dBpxZ9nFGgF8bV0R9skn0scjQiXqzXHdGCoYaLA7
	 IYs1kU7meICQ0PXoYA3IXp900yJnE4xVVSUszKmhzngH14XgxRMrufbEFyOYHrM0GEFb+
	 y1f0AfKQXw69Apuch9G4MYgISQdht+VAqhpjSetNxvnAfIrZEUZX13VDDnS5v1xBu3UfM
	 i4cVPq/86YuETcV6E1AjNgCMbkUbGqXQMgwyjCEIIIFBpk8/O1FUltNL75ChGSOPYpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981885;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=3x7iGTfwP0zFRfuTC8P49hF9dS2iRlaB+/rk9f7a8BM=;
	b=AM3SM9ZVNmR3zbwkftMSMJyxXhvurGEZNMWwdNZpljLm4Mtg6D6aA7/JLVTWw8IK3xh8
	 6UP7obIeGLY3OM+/6ZTKMjiqkPOkhbd/O1atnhIGKkwSw7xnN2RVh0xZ680bOUELz7/Nz
	 4NxtQQ7kQmAXx72nbyHZw2R0/NFB1A3tJde0pgdVLJHFQizxibL/G5PuG1/2Na4grhba5
	 +VJCzGbQcz6BagXUf+jtgKKzed/N0hXfQ6ogO757dEA1ofZNepsYM9hnRT/JOhNyDiDsw
	 Kdnt4smfrgE8DNAt4wAvOmpQBZJCOQO/W/Vp+pFjVY6dMFEDoIjlrzhrWFYeiWhzNtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lXdKDX5R;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F50606A33C
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 16:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75F50606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lXdKDX5R
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E113F1A14EF;
	Fri,  6 Nov 2026 16:18:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE5305FFBC;
	Fri,  6 Nov 2026 16:18:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF6D110329280;
	Fri,  6 Nov 2026 17:17:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793981877; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3x7iGTfwP0zFRfuTC8P49hF9dS2iRlaB+/rk9f7a8BM=;
	b=lXdKDX5RICq5PX1ODUm/S7WmpspQRDhmOuEPTczGRZAr4Apd3iPVRY1EGMsRJ25rcEVBW3
	XbDQbWKdiIrc9mStMpw/kqKFoCV61REuAbOnrgP+In6tqxEhdK702TMO0zHd+MlDy+2B9X
	GrgzDR1beLKQGnqR5UmtPdf8mBnTG633PcLhxojFfvZBDXKelXI7PVmdHzilfG7J+4lrua
	CpQ9pX1CN/7ZxOwZqbKWp0tU8Q5K50Mg4hqmG42d+70ittupJYY4is35jBGqW8IoDg2yX+
	5arFEPSI9fgt8WPoNmfnuGieU7PUOronMHzqoei7alqLOMP8FPsnmXo3g/gz1A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 06 Nov 2026 17:17:06 +0100
Subject: [PATCH 3/3] drm/todo: remove drmm_of_get_bridge()
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
Message-Id: <20261106-drm-panel_bridge-remove-drmm_of_get_bridge-v1-3-c0ea3382b798@bootlin.com>
References: <20261106-drm-panel_bridge-remove-drmm_of_get_bridge-v1-0-c0ea3382b798@bootlin.com>
In-Reply-To: <20261106-drm-panel_bridge-remove-drmm_of_get_bridge-v1-0-c0ea3382b798@bootlin.com>
To: Sasha Finkelstein <k@chaosmail.tech>, Janne Grunau <j@jannau.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

This function has been removed.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 Documentation/gpu/todo.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index e6d36f8da086..de4de6f7a0b4 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -477,7 +477,6 @@ transparently, and the are deprecated.
 The funcions to remove are:
  - drm_panel_bridge_add_typed()
  - devm_drm_of_get_bridge()
- - drmm_of_get_bridge()
  - drm_panel_bridge_remove()
  - drmm_drm_panel_bridge_release()
  - devm_drm_panel_bridge_release()

-- 
2.56.0

