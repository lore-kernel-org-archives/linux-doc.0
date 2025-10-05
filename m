Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121FB15278E
	for <linux-doc@vger.kernel.org>; Sun,  5 Oct 2025 20:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759697467; cv=none; b=jxUnCBxZeiMJTqUAjWIBSJH7K0tPNCbLri2HLf5mhG338FJDIR93oR4kEFssPacOK/ZbVZ/6YNndHQgpyUkLxVLdtciYpg7dcS7zxXWAF5cMng1tb5U+joavIyHcJL2MxFYj8HmbLjsIDx+rl/b9lxUNnY9hrwv/tCecofxRQ8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759697467; c=relaxed/simple;
	bh=sGOdOd5lj8RNH7bLfh4PeOtHP2wnFce2PImaX2QQu08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B87wuCnKxsUXqvQaVV/yz4W6Iu/O6lm2yxeZRkV/40BneDtOyRtWx3CKe/87XgQKVsmR1NJ1vn3IftEU9f1xY12lnbVSs5cJ4M0MxSr2vmSWsICBuKOy0yrrYEQvEBAbzGpQ5e1/m3N4glfZZcMjE6Y8r2UnqIDCUOQnWBmHFYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivFkiYE0; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivFkiYE0"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-28a5b8b12a1so40747115ad.0
        for <linux-doc@vger.kernel.org>; Sun, 05 Oct 2025 13:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759697465; x=1760302265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o0PulYaesouydzPIXRseNOAbBXULJfQ7jKlImAk9vNY=;
        b=ivFkiYE0o7K4WkX9n+kh+TMo6ZOgNr5RZ8iLOHOHvaKgNiLxAFoS89nsKO2uUI4fle
         DsAojqYYYJELjUOYB9P6x0Lprx6iXYKY3R0hC1R2qOe22COgS7LusomQYxJUeMOXZn/O
         rHKmSoj+ZX6AWQkfXd0skCaEXYHytFatdKmtAU1tq5piM10EP+6CAMi3bzglYPmvzvu4
         sflASavVE4od+IYZ0DZ89Sbwp45wp2Z7eSF8IcOFDCPkuQmwNazm+KycIf1xbRkeiMJ1
         SSHiOIThzXSnyEPZnnadvvbK7iwMobYBLoXHDN6IUGR3HCoEpEMy5JzSK8LLC5SufYBd
         r05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759697465; x=1760302265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o0PulYaesouydzPIXRseNOAbBXULJfQ7jKlImAk9vNY=;
        b=MRJkPJeHz22TZbP2wioWrDhIzrCAV8O9W7/QkvwyKdwWWrE3UcNaWznbz9+GcOVBSA
         LG3AvHcFpoHGo5IWk4nrSsqScpu3gX1uIV7ICE1eRY1NdVDddQV4ThInNI1BY2RcjmVS
         AjXwKZ26kM3eUvr9hImoJbJlEz3VS0uq4bafjWGwHqqeacge0x1cxxTiIrRW/uB9wNxP
         r5cfixXJhPLgyRRq4NOdc9CqAqRSRS77e9723Y8RCObBfaidSStJoatOQpzkEdTi2v7y
         +FegKCx1o5O37eSyRPaS/VSvnHwQfZi7TzIowEqaLKSU7JoUgSpyyhQwZ8XK+CJr7UTB
         MEFg==
X-Forwarded-Encrypted: i=1; AJvYcCVH88zqNjeUf/xhVPscVf/6N3XgbUcAVbs/Olu/u8C3ocyPFfmh40sVKPokXsbko0gQpQVYUtgGjmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqPcqJ7GJV+HM8NIqJtahRpR1zS9ON4hI9L4AbzEO0YkxQlJR+
	NlhfGsC2V+2JqBXwSZ4iPxbb4CkrrndgbyCEImWKxL20pZs3rnAKPOoO
X-Gm-Gg: ASbGncvkHfR6iSFG1nhZ8U0cqGVGZtiMjuauooMs3uB9QwzBithK8GrMbRY9rpWwduU
	1M/gN8mjiz6ns6c85nYkJVm8x4xRbNQelO2vMWDxbaJ4herrUYOW60f6PzkyE+B+WYIaGklCgk0
	E73zHxssnjm57Bj703vbtkAXLQ+JI4ArOEEhvpuPraZM7hYhKLnJk8BQPKcKHktWRZP8LAzXkRk
	+yJCqQkfH9vopYQsZ4Rcbmc0OWRw1OUyEzv/mjo9X8JBHQKUclIbJvyoWWo2YPZF8sptQNhFb35
	SWyMEMxUUT2izH8V+WWS5YV1apFUAalyG6ipT2EhnqRa8Tby07eIO8kjJRrHZLhreO+QCEhHb8B
	75pkxQE+U5bt/IS9e9MPb+XxApDosU5g3l6KIMtfYB5LlCPqBsC+9iH1kU4r4kyUUS4Spsr68Mg
	NTEK1k2y+VOPRLQCMOH70PKy+vxgyUrunumuPckTVBGvgAE2Odi2AyFISMrg==
X-Google-Smtp-Source: AGHT+IGE6psfDyF/tpG5iD9+AN4sMGtubuFXdijlLDL6L8UyOx68nbT2vXp8iohVZVMCKB2D81UvNw==
X-Received: by 2002:a17:903:1ae6:b0:269:936c:88da with SMTP id d9443c01a7336-28e9a61ef1fmr103838395ad.41.1759697465228;
        Sun, 05 Oct 2025 13:51:05 -0700 (PDT)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1267d7sm110498115ad.49.2025.10.05.13.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 13:51:04 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	corbet@lwn.net
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH 1/2] dt-bindings: trivial-devices: add mps,mp9945
Date: Mon,  6 Oct 2025 04:48:54 +0800
Message-ID: <20251005204855.190270-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-bindings for MPS mp9945 controller.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 58ff948d93c9..08e2ca1b573e 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -317,6 +317,8 @@ properties:
           - mps,mp5998
             # Monolithic Power Systems Inc. digital step-down converter mp9941
           - mps,mp9941
+            # Monolithic Power Systems Inc. digital step-down converter mp9945
+          - mps,mp9945
             # Temperature sensor with integrated fan control
           - national,lm63
             # Temperature sensor with integrated fan control
-- 
2.43.0

