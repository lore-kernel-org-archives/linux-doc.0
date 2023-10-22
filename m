Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4FE1078C
	for <linux-doc@vger.kernel.org>; Sun, 22 Oct 2023 18:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="YCZJcLa5"
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 369D2D75
	for <linux-doc@vger.kernel.org>; Sun, 22 Oct 2023 11:23:05 -0700 (PDT)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BED573FFF0
	for <linux-doc@vger.kernel.org>; Sun, 22 Oct 2023 18:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1697998980;
	bh=PFQQQyGHvq4Vgum/xnVjVuElfTVJmiceygKugibWkQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=YCZJcLa55cZCN0TCb69Nu55wpLkbBJx/QEil680/nOfaEcQkZpmLxP136xooMFlTB
	 ef4f9TMUll/2SYcsFDeDcMPIGfqgJ2DSOe8O3sQybVKyN8sv15rzf80AB09e3UqNBD
	 JZBWV/Xg3a1P9Z1/Ss/n2U0xFFymzXGhGXBH2R9oxja71VFFqEmUnzrUeAyGT31O64
	 dT5MAzSejsLYZU7Dm8lZnUB755b+MQhC9JK2GnT8KWBMH67SA9ziLVGs6RGLYv/XnR
	 4uieTEnihuzYbrcaix+Gf5qeaPi08WDpuJq5zSkmiGzoe5jHWu3ZtLDcDZscDQAQv6
	 PJn0+Sqw6oUcA==
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-408524e2368so12905175e9.0
        for <linux-doc@vger.kernel.org>; Sun, 22 Oct 2023 11:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697998971; x=1698603771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFQQQyGHvq4Vgum/xnVjVuElfTVJmiceygKugibWkQQ=;
        b=HGAJaxRZDlCsmI/1ciPEHY92ZIc5xLZKYO4FIVOpz50K85Zpb5Vx6X3KmONe4I8add
         lfxZnMpqbY7amV6jIny9ivOsNe+CgtfHh/yJvElPegU1u/ipjipYjH8eCsgfCLdxZx2N
         sGwjAu9Ja7/LARGmIfmV/uTHqJZ6mcr6SgZqqGUs3TKGJPPWspAB9RROYtOEJ/MHOcFI
         bIIlaeeWfk8eD4HYoXOdLkJ8n2Y4Z2K8//jVy5yckDwjScNFiy1kKXRXONtRJvrxDW16
         HmmLb0whwlx00qJ1UbgQV/TPlAgEwaVpJUAEBQg/srv4BTmqPAzJRLnXoY/9XHtpBfNX
         4uOg==
X-Gm-Message-State: AOJu0YxO3+ZCkP++2I6AL35yj09y8oiTRlKxYdeagz+x+efQNxTUw+3U
	FXXUXJ6zT5FfqG3U+H4mKF80PZJf8WgjKwmlC2qkYQSr5QZW0cvlB5t7FTVrXgQOFkymut1csFN
	EQrx6XNlH8Cx/XOtcZ/jzv4ALYhugL+QjlFsTaVVqLCoxbQ==
X-Received: by 2002:a05:600c:3d87:b0:405:7b92:4558 with SMTP id bi7-20020a05600c3d8700b004057b924558mr5636477wmb.38.1697998971511;
        Sun, 22 Oct 2023 11:22:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJQIKtMn/SYn1WUGMKRheSfZ+Femytgt+MFX4tUeo2/oPl9EgWulzTC+YwAtcdViA0qd/tCA==
X-Received: by 2002:a05:600c:3d87:b0:405:7b92:4558 with SMTP id bi7-20020a05600c3d8700b004057b924558mr5636467wmb.38.1697998971268;
        Sun, 22 Oct 2023 11:22:51 -0700 (PDT)
Received: from localhost ([2001:67c:1560:8007::aac:c15c])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c358c00b00401b242e2e6sm12360739wmq.47.2023.10.22.11.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 11:22:51 -0700 (PDT)
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
To: herbert@gondor.apana.org.au,
	David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 6/6] Documentation/module-signing.txt: bring up to date
Date: Sun, 22 Oct 2023 19:22:08 +0100
Message-Id: <20231022182208.188714-7-dimitri.ledkov@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231022182208.188714-1-dimitri.ledkov@canonical.com>
References: <20231022182208.188714-1-dimitri.ledkov@canonical.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the documentation to mention that ECC NIST P-384 automatic
keypair generation is available to use ECDSA signature type, in
addition to the RSA.

Drop mentions of the now removed SHA-1 and SHA-224 options.

Add the just added FIPS 202 SHA-3 module signature hashes.

Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
---
 Documentation/admin-guide/module-signing.rst | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/module-signing.rst b/Documentation/admin-guide/module-signing.rst
index 2898b27032..a8667a7774 100644
--- a/Documentation/admin-guide/module-signing.rst
+++ b/Documentation/admin-guide/module-signing.rst
@@ -28,10 +28,10 @@ trusted userspace bits.
 
 This facility uses X.509 ITU-T standard certificates to encode the public keys
 involved.  The signatures are not themselves encoded in any industrial standard
-type.  The facility currently only supports the RSA public key encryption
-standard (though it is pluggable and permits others to be used).  The possible
-hash algorithms that can be used are SHA-1, SHA-224, SHA-256, SHA-384, and
-SHA-512 (the algorithm is selected by data in the signature).
+type.  The built-in facility currently only supports the RSA & NIST P-384 ECDSA
+public key signing standard (though it is pluggable and permits others to be
+used).  The possible hash algorithms that can be used are SHA-2 and SHA-3 of
+sizes 256, 384, and 512 (the algorithm is selected by data in the signature).
 
 
 ==========================
@@ -81,11 +81,12 @@ This has a number of options available:
      sign the modules with:
 
         =============================== ==========================================
-	``CONFIG_MODULE_SIG_SHA1``	:menuselection:`Sign modules with SHA-1`
-	``CONFIG_MODULE_SIG_SHA224``	:menuselection:`Sign modules with SHA-224`
 	``CONFIG_MODULE_SIG_SHA256``	:menuselection:`Sign modules with SHA-256`
 	``CONFIG_MODULE_SIG_SHA384``	:menuselection:`Sign modules with SHA-384`
 	``CONFIG_MODULE_SIG_SHA512``	:menuselection:`Sign modules with SHA-512`
+	``CONFIG_MODULE_SIG_SHA3_256``	:menuselection:`Sign modules with SHA3-256`
+	``CONFIG_MODULE_SIG_SHA3_384``	:menuselection:`Sign modules with SHA3-384`
+	``CONFIG_MODULE_SIG_SHA3_512``	:menuselection:`Sign modules with SHA3-512`
         =============================== ==========================================
 
      The algorithm selected here will also be built into the kernel (rather
@@ -145,6 +146,10 @@ into vmlinux) using parameters in the::
 
 file (which is also generated if it does not already exist).
 
+One can select between RSA (``MODULE_SIG_KEY_TYPE_RSA``) and ECDSA
+(``MODULE_SIG_KEY_TYPE_ECDSA``) to generate either RSA 4k or NIST
+P-384 keypair.
+
 It is strongly recommended that you provide your own x509.genkey file.
 
 Most notably, in the x509.genkey file, the req_distinguished_name section
-- 
2.34.1

