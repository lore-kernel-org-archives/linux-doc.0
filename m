Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843893793AA;
	Fri, 27 Mar 2026 17:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631942; cv=none; b=JnDlc85SCuZY8ttw4EimdGd864GQC90VrU4tsvoFeQxcE03lSQDQRdiEn5feE7Ynr+ycIiYjWuQ8eVdLcLs5h+jsDNA8E1DCV24p984Eztup3mVsC+AGhWZ+c0XLncAr/2qItqxUKVXJ12iWKH5dKEnqKrUzm46FO5jYV/3gtzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631942; c=relaxed/simple;
	bh=jaaS6mlyRX/2Kim2UmuZp+0naniPgUPXpcBaOsGtUe8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SfV/SQX3+0wAwBuorwK3xvswqqCyFm/Ia4Q08h9OgtwTl9fw3xRzw9R6AELks+/ihZrmeYDH1AeZrGVWYlHgDBM16BSIbeYp8cH7Y6SplC9y+QjY1G2TctGwyMlwlAFYkBScyIS2ojd24nM1oU/ScUERs2PlrWWx2VOZIidAVNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SlmxtoYL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SlmxtoYL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774631936;
	bh=jaaS6mlyRX/2Kim2UmuZp+0naniPgUPXpcBaOsGtUe8=;
	h=From:Date:Subject:To:Cc:From;
	b=SlmxtoYLOGpVhtDwzaCHv6BqaHniziH8iqwPZ+uvSMSYmPPv9i3QUCpJNSnlvPYUD
	 bNTgtr9hwW0zxkZMQoFF/Ggo7XCcaFGAz12PQRV152v7KlZ/O6nHGJs4qp0NtZsk2+
	 2lZjLivByOncqZt+tJe9T1aYZ/wG64q8hVzTbZnf8dXht/oqjgQYdkRZW2SF3m87R0
	 dkVuodLFuwjt/J3dx4kgIBGB+aNJ+gFXBm7lXhodqzNY5DeYs5Z+TVEDVbT3xoVS7V
	 4Tmwst3GUlyWQ9lCXZ1jJRuv/H7dHYP5bmRScLTuSd+5AO7RgZk6SEOX98E9RtyKNh
	 dgqEtfIcxUN9Q==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6AFAC17E4A7F;
	Fri, 27 Mar 2026 18:18:56 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 27 Mar 2026 19:18:32 +0200
Subject: [PATCH] drm/vkms: Remove completed task from Plane Features
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-vkms-todo-upd-v1-1-f78409d9e70b@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyNz3bLs3GLdkvyUfN3SghRdw1QLyxRjSyMLkyRjJaCegqLUtMwKsHn
 RsbW1ANDHde1fAAAA
X-Change-ID: 20260327-vkms-todo-upd-1e89d39284b3
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Since commit 0b9eff726d56 ("drm/vkms: Support setting custom background
color") the related TODO item in the 'Add Plane Features' section has
been completed, so remove it.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 Documentation/gpu/vkms.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 1e79e62a6bc4..792eaeb43c82 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -217,8 +217,6 @@ Add Plane Features
 
 There's lots of plane features we could add support for:
 
-- Add background color KMS property[Good to get started].
-
 - Scaling.
 
 - Additional buffer formats. Low/high bpp RGB formats would be interesting

---
base-commit: e88b5cc6d6e5b1ba257f00e5c186ba137e6e8bc3
change-id: 20260327-vkms-todo-upd-1e89d39284b3

