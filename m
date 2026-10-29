Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237933;
	b=CxhnFwFJ0wqc3K0cOf9YLTXD1dJYc93NZufflt3FaHERHhacYy2SlN7BiPlqyJ7pRt61
	 lNSkdej6pf/URx7NW6ooDa2/G/hLXCWxrVBt5U6wgYjpiaofESiVrO8MedHwNarOWxi/h
	 IPdbjghNpuGbC+xOJIYITeOkDRUslsnDUzx6VE2H75DqApixl0yJhwzLQN5vAHK/Lgx/A
	 pdnMMBMFROgXOTlReGZvZhfClJkJW6UMZRRCcZ7bjPwdNx/DfndP0GgxhTKccvb1+3Xlj
	 qZt0oYLCcR8w0ZNHZKrXSEiinenOkg/jGLMRPQqCSQw+8AwOrLDmcQm1cHlPGhTPymA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/cTHNomGdMzdwGOEPd/Mb+9dZ6EWwM9vGNpl5GZyT/s=;
	b=SeljT3xS9UTZmfpupu3veVoPsdBJRCRXYwbmLBk5ooJn8QfSrUgPeXb1Yd2M2mv88QOU
	 H9HylCM52Xoc6A1b2StLUGBUo3qRDMkTnukrAPvzu5hWq9gs9QDTUA0E15DNhzgMw/8Bx
	 HCNP8ioYQqhC6wofW+Go6fZ5TkVJsQl6DVLj8Qsqcr7BU9x0SONqTsZPP3gZ8sp4GgXHI
	 qh/qXKrc6wGCDeVQksJ1sxf840/A26r362q88ENis/20W0Fja6KGaLELIF00Hync2JxmN
	 ywxfWYRhJ65l6ZuaxHvbYujPtHhfX1pF044r1qSndJO9qpxXMAgXitm6LdKi/zICUVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L6c+IPE+;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11232606A332
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 01:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11232606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L6c+IPE+
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso115949f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 18:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793237931; x=1793842731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/cTHNomGdMzdwGOEPd/Mb+9dZ6EWwM9vGNpl5GZyT/s=;
        b=L6c+IPE+TusQzbodaS4Y8bDimeOge0wsfqMCW09n1Xz70yNq0U95vP2JdsERw5EuIU
         Aq9f9+D7DXAqUux6+m96MwkWa6k9MknozLsKMTQJHXERZo0mT+larlyUAIvXjTkFVuYm
         Cn0coLa4xlTb1kcTnZPWBvbr+evtFxizLmVV6BbCrrv/oswQl3iBu47c1Fk9XiNW7SEi
         R40Hc4C6LQEKRyArjcAeR7UtoinslXuLkB0cOe16olQBRR+6gmYAqVZ7v1tCeT/TE2s0
         dgVEM1YAG71RjPDbaDQJDAJMUv/nQAdazE4UpVLZLkjjwyzi56d1fX/Iupz7HP7mPYwO
         OlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793237931; x=1793842731;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/cTHNomGdMzdwGOEPd/Mb+9dZ6EWwM9vGNpl5GZyT/s=;
        b=PeIGigq2yA2hsVDrRH0TxTnIl/nJWEyduKJ8rF/jwfqWB0pTbYdpDy6f6MNJcAnRGZ
         QP4sQZjHcmTzINlNSACmBlpveOVtQLjfmzrRJBIa9zVim/y0NLbkmC2aoqY8opSFXMYb
         TJcAQbPhbSAUBaf5jP1b1Jv9yBQt4RlwiPaU6x15BJFhDYqteDBcmfBWZqbwXYlrn+2e
         RayEEQZ03FbBVYggOiD1QBeaBVSKITlEvCYU8XBI8WXT2Lz/T9Hu09yPFireZCuvOALw
         EOVzAOawnBcABxFr5x3wlk07d/AUlhGSTFyIMR9I7lvHK3/kcvD5nNR/QUehNbGbLrC9
         3rsw==
X-Forwarded-Encrypted: i=1; AKwUvBx8XNTcY7h36L4cT1gnvhadzpS50oqgEgG9A6Nmds6eD/Pe/Trtx8imy51K1lfoZEIRv1qvJ2oj4Lw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3jc/cMta/1W+nR1NdISFonC5fpEx1zdjivyB6yMwQUH0zdld1
	7ZK3Rcpw4XmoopZmiOX8f7di9GBv9zJfpTfEmi6UmaAiDCmhnJJWj8ZH
X-Gm-Gg: AYBFou1uDUGyQgscTKMhC9C0kEY/mwRH+Zwv2tXpDrUkNK870wdnrO6dWbPIi2ZR+t7
	vv7wLUf0TwNtiuWiCw0MjbIfubAZEb2BtyQdH48KjPZv0FrWBpinZ502OJWv/7wPE2yguafXYg9
	DTD71qMaXHx4Mly8q12bLTah1m4N5RPL2Z8mbiCo6EZ1HwM2PT1aYPtDfleZTwQwA/LmNQEI5kS
	drZOylvzeN4feZ6oI2loZeT/ja/Mzno+myuFMCsyD42KRgic6+CPfPf7OuGleu1MbyHH5y4NXE9
	AvENJjXaOUgdrN1YoGHxM0JxeC7Z/ylEHg/0RUHpZg1def5ghDnOb7dh2mDq24SCbkvjOBfMlQJ
	N/GLfdCDdJ/CHDSiiPVgLz3eNw3Az+G/F+/1xjp4JzqAk1d0s89l/PhU5m1/2pu5PwRGYaggCPh
	Pk50GZO3TG3bGz0A34SM1XuQaUJCqGz9NiUS+/ExDp3cbFhlTsSD7Yez6B8vnGx2Cvo3KCfiWwt
	KRbwiQIylgz/lVuN6sa1mB493CHomcmOBofr9Mg79Qa9FH9e2GyBa8fdknSTiSsPizxFGZ/MAUb
	+lxH/Na4fqDYJE0Xu4dF+CDyZzhVNoRRgT98huu1LBoCBnOE61Bphq32sWh+l3FAOTvpQTySkBU
	YWya3oPzf3Y/fUc3kxd5clNbJ46asHfIJ+ndj+SWTqQnz+Ij5qz70Qs8yYMuPW1PNys4HyqMgNx
	UzYeSzUaamFfrM/8KdfoKN6xA=
X-Received: by 2002:a5d:540c:0:b0:48a:fad8:52a2 with SMTP id ffacd0b85a97d-48e64ba60d3mr2291450f8f.23.1793237931074;
        Wed, 28 Oct 2026 18:38:51 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-077-007-226-156.77.7.pool.telefonica.de. [77.7.226.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm34154098f8f.48.2026.10.28.18.38.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 18:38:49 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v4 2/2] docs/zh_CN: PCI: Update the pci_device_id header reference
Date: Thu, 29 Oct 2026 02:37:17 +0100
Message-Id: <203f4407e5ed5335cda17a74fa6aeac311a572d5.1793221199.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1793221199.git.kmehltretter@gmail.com>
References: <cover.1793221199.git.kmehltretter@gmail.com>
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

struct pci_device_id moved from <linux/mod_devicetable.h> to
<linux/device-id/pci.h>. Update the header reference in the Chinese PCI
guide to match its new location.

Fixes: ad428f5811bd ("mod_devicetable.h: Split into per subsystem headers")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/translations/zh_CN/PCI/pci.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/PCI/pci.rst b/Documentation/translations/zh_CN/PCI/pci.rst
index 347f5c3f5ce99bade1221f083b208972baf102ec..452e073b8c067ce16c76d9a5a5883532ebce3296 100644
--- a/Documentation/translations/zh_CN/PCI/pci.rst
+++ b/Documentation/translations/zh_CN/PCI/pci.rst
@@ -92,7 +92,7 @@ ID表是一个由 ``struct pci_device_id`` 结构体成员组成的数组，以
 
 该API在以下内核代码中:
 
-include/linux/mod_devicetable.h
+include/linux/device-id/pci.h
 pci_device_id
 
 大多数驱动程序只需要 ``PCI_DEVICE()`` 或 ``PCI_DEVICE_CLASS()`` 来设置一个
