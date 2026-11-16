Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794784935;
	b=2Sl443uP0GMbDB6rWZScD7ynC94YG7eN/vQG3wzYr4l5Q9kRGPrVdwvyfHoljj6czFgP
	 a/ujqak8ajDTrRJ4K93H5xFOc8eYDEkPMF7uCxf9WO+CiB+n8FXWIajC9QoWuWmSBBgeA
	 GhhEVpVCSYdXiE5k2Bw+b2N63Zq4WwjNxNnupaoqwwHQmjMgD61JMzAsOFOLHkxOZJArc
	 3wHx+81U0n+3UFxHA4zoSz99jEOJkW5YpJEvEnXRjqbPqMmx9rkVThqQPzvYcAaZitSIP
	 VjlNNWVLS2rz2PGFg6w4rsWkHR7lxm2u8JPYlwabvYEI3gYksyaK3K9WR0tU5SZfU/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794784935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=uREsKIEDczdDVdj720bXK/T41S+3ar5PxkrrHsI/TEM=;
	b=FL8LodNKtFnxYVQ9Yuj3TVQSokPTppibg1HoIjQlSHo02PgtxSc9rQpDf4q64wxzuX9R
	 d8ULLw0rPisxc0Caz15aD+Pt646aH1jjQGHTAn4VEMsckm0711U30/dtqQBL+yVPb0gWV
	 TqEiokflX7g4lr/lbeEVpN/8eeAem2BREcHkyLZLRrqYIiQsbFKgUbkGmy+HcRIdxxAFg
	 S7yqdBwM13+ZMB90i5gts79Bi+UmZ3MjaY3yanAPtYQWmUxg8Ws9mvMQ4PEmleSDzKj4/
	 mVWmJ1XlmYTo4SqYXbXwfvxcigjIB4IVUb91l3HlZh51EvwA4KvVp1Up/0UA0xye5fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jQkNrinm;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A536D606A331
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 23:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A536D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jQkNrinm
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso21144295e9.1
        for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 15:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794784933; x=1795389733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uREsKIEDczdDVdj720bXK/T41S+3ar5PxkrrHsI/TEM=;
        b=jQkNrinmnyiH3DT7YlgTu03VUyhi7q9DOquQaVlWG2jLJQvITuOTfMsr31WXFI+y8G
         +Ms42TCNfD1X8Dl6ARmdwurW4X+BahBcgVm8UHxkrzd8kxbab0jv+ZArjfC5id5O4hdm
         GzWp+0uOyvdUhTypeyVI95yeEE2pWqOZXxXXhi8gCTsDd6ZjFC3cyM4MtwGcv3j1c2E/
         I84JM9NZjz4EQwQzv7fYTqHIxRyZ1rZX8ReX7qzYdCxIqdLajnu0wbev3sqsM13aXYpO
         PG+kJApuGBCqeDWtl3PDAywcNnmBGGlKcyWUwatKPfe9hZBUeNTrDbGmpnHeB+Dymb9V
         upkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794784933; x=1795389733;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uREsKIEDczdDVdj720bXK/T41S+3ar5PxkrrHsI/TEM=;
        b=T4H2g7Hc8cMJvCmzzZJm6Pg9B2b6rrzs1UL9vxZGy08d0ArALuXd11waYy3N29KiPI
         s+tgU0hJ9CXbMnIvfyNEPc7CTVdZPTC7OEJnsrp7WwvNnOyYRcPRBZMRtAfyx+2Udh74
         4G+h5qyiJLfA24pte/9WcR/K/W58uAPZdiDhqS2Ljh37QLawzMb5xH4LFp9fgzlucyfW
         GgvN0dyNngyF+NFGmbYXEm3veqR3CSRy0vkvkxT2dlBWJogp3T05cwHQ5k77M/C0TSE/
         9i95vKV+ZBnez4jpZDcPt9R65escFApDOeHyg4ucbMM1EMePlHxRv4BpYfOQoOABw3CJ
         eQgA==
X-Forwarded-Encrypted: i=1; AL+hErG5SECfHvI5EE30RKS4jXcG/E3LvEOkTyWHNxUwFCS0Q/yPJNHD105eudHFvV2crq4V4BMUeeUK62s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4jChVqu5Y+BRfVA+t9+iYRuxzgM5a6w5JwVY7KqWlfAgDQYYw
	1F97DwF/3Z+7R61P1tEt6T8OQjYX/jSatlvqej1hAjrJnH1eeksW/h8j
X-Gm-Gg: AYBFou2gI63XhshECbFRiRzlOkII9UQpzYU0xwugrzcmueR/DurATZyHuJocb+05Y+A
	oLeZHkKrViBzKw3D3vNoFZRuN1DzSMuSXqU5ji4jfxA7xwp5ssiap7JaXIqHmbYQi72b3B/jLDa
	ri0NtBz31+Q8EbO00dNWmeP0DfXOuXMHsO+7uzQRJ5/dl6dSyF4SDTw1i+ZrtoPtY2CBg1h7eKq
	yvR1rmRkMx78WT1X3cic/v9Bh0EgFwYZb3st39IillXH7W+30zrzNuIqSKRbnV1JZYqHs76lUWu
	RpLG0PdvG2rZHqD9rD8Qf+DW6rUOAiGg+v1M4zbLERRb9eDMlEsiFMHljyGTjQn/tLHDsef5Ypj
	lVTYeM3Oy6F+u3DKq40SoH0y86dl/nlA9TG5c728rPkVCr4FFGhjPGezyh7jIojznM7gGHWfTPt
	QEpiZAtJrNrtkAi+fojlFRij/M+tpeCWAt4IZq9esj09UdkBrE61pm3K33kG3wC1eVNMGNweoV+
	6TGISp7PU1mfidV2lBc6rbj9JIpLxO58A91NaEmELYgMSkuAx7KKOxxvDWOUdfVn3RI+jdfdFjL
	f/AJhnumLPpbD513y1B2lAXe5d4tunx71GHbq7G1eM179e/fYPLRSEo=
X-Received: by 2002:a05:600c:34d5:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4bb55ab1610mr175771075e9.26.1794784932986;
        Sun, 15 Nov 2026 15:22:12 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f976esm127920955e9.3.2026.11.15.15.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 15:22:12 -0800 (PST)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Helge Deller <deller@gmx.de>,
	Peter Jones <pjones@redhat.com>
Cc: Francesco Valla <francesco@valla.it>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	linux-efi@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 5/6] drm: docs: remove bootsplash from TODO
Date: Mon, 16 Nov 2026 01:21:55 +0100
Message-Id: <20261116002156.1027726-6-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261116002156.1027726-1-maximpedraza@gmail.com>
References: <20261116002156.1027726-1-maximpedraza@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Francesco Valla <francesco@valla.it>

Now that a splash client exists, remove the bootsplash task from the
TODO list for the DRM subsystem.

Signed-off-by: Francesco Valla <francesco@valla.it>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 Documentation/gpu/todo.rst | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index e6d36f8da086..5e987e18bfcd 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -756,23 +756,6 @@ See drivers/gpu/drm/amd/display/TODO for tasks.
 
 Contact: Harry Wentland, Alex Deucher
 
-Bootsplash
-==========
-
-There is support in place now for writing internal DRM clients making it
-possible to pick up the bootsplash work that was rejected because it was written
-for fbdev.
-
-- [v6,8/8] drm/client: Hack: Add bootsplash example
-  https://patchwork.freedesktop.org/patch/306579/
-
-- [RFC PATCH v2 00/13] Kernel based bootsplash
-  https://lore.kernel.org/r/20171213194755.3409-1-mstaudt@suse.de
-
-Contact: Sam Ravnborg
-
-Level: Advanced
-
 Brightness handling on devices with multiple internal panels
 ============================================================
 
-- 
2.39.5

