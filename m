Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56E12DE6F1
	for <linux-doc@vger.kernel.org>; Wed, 24 Dec 2025 15:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766590774; cv=none; b=qVk2Fap39IoBRizlmp1SLt9rzbBwnhc6xuyiJCqXfbg5Dk/JLT1MU6CD53r4bQKvWjxZmjzAYOZjZ5D4sJ4hAY3zukfBbaADrWRJzRgPDA1zwwJaQc4+LB7Hm2Mz5J2A6XmBpy14qS7ynmhgVN7AH0WCFwm2dDTndxVHG5Uueus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766590774; c=relaxed/simple;
	bh=V8fJyoE3LNmPBgSO30v6KNG/sPF/vAGaGrWf60SkB60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Av2TyeaWOkqCCA5hbGzTft9oATirJs4hPwIY7GRkrflRGrDEpb22+TSe41sgIZxwNW9OpPAk5Q3v0Dxyt7Ceocd7aoKcq8iRPcpd6eLkNp4Hj8zuA9ly/EpTwuMe2INo4WAtluGHjGxvmZwBimq+DZYeCF9v4zXCbnor1XoFRqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=fail smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20230601.gappssmtp.com header.i=@osyx-tech.20230601.gappssmtp.com header.b=negWqxrH; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20230601.gappssmtp.com header.i=@osyx-tech.20230601.gappssmtp.com header.b="negWqxrH"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so44224945e9.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Dec 2025 07:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1766590769; x=1767195569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehfxbEVnQJDewCWJrGs2ak+KMNFyhQdtz7cgsTLXZDQ=;
        b=negWqxrHW6g6x9fWLOneBGelzYUjGLyU7LKek03gtSFOw3LhBEy4nAPoi2gYM5RvhD
         ihsExrVuzKlMQSbxFpgS5c+NAY1PZJV3aMK8/5Yw8ags3xMUncABgMZjpcBCY25yvceq
         auBDHPDVBXB0zX4IEqMQv2mg3jkkcYBy4dPuhoSy/FCC3hCKTyOgnwDd69GTTeKfP0d3
         on57E0yDQyG7jTAlpdT1SjR7IEnotu/wA/iqxRfRSDy8fTQ4MwS3sJR2PhK8oyuJZJvQ
         Xv3FPgxGrKP065xCl6F+x7MRjfW/VF4Yg0471tU0K+//IZ7dq03UNkzFXV8lNzX6YJt3
         GT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766590769; x=1767195569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ehfxbEVnQJDewCWJrGs2ak+KMNFyhQdtz7cgsTLXZDQ=;
        b=qwWOa4RelApk3h8g2pvEnZ37bJvtjQ9NHqgW3AzOBee7etBpmg6u7XxdEJL70awlOh
         2YxYXNP/zGxZKGXa5+VTu/nWrxjtg2gy2MoQUZ3lcarPW0kCVl+0xenKETp/72uZC9Gg
         S+grKtfZGJeBu7ccYFhHqnn8RwDrku98y7fQMf3UqoTuXeER/fqJ/eO00qk/iWSolH8w
         fXxK1gB0iqw2C8f6iMHcxpYEPkssBa+Z8Icj+yvt0rL2rFR6YTEJkHG3ZdGNU/dh8fG7
         tMBIOHQDwfZcuuqDU2lQRaHaWUOOf990npq3gDLFEdXPt3RmmPzYTidKJOFPVl5bTvyg
         AjBA==
X-Forwarded-Encrypted: i=1; AJvYcCVsyrpgO4wiLcdaN/2s39uBhH3DEWtJFwEHXQN6jkQeOvTz1P1YzebGPhREKOrAp2HNQHEcFQjw03g=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywld3Ez2yPXKrbAn1pm/+njgmfQxQWmaZfcf8fjNLXSQqvJdo2Q
	fV7Sd0lUPHoqJVpR6z3vyUI+D/5wPxe3A2I8573iVbEA9Q1woiTTclG+Ub6btRvoP5nh
X-Gm-Gg: AY/fxX4nQ16WJ25ZKQUx+oUZc9w4m50t0oq1xLN2sVP7vWhZ+YoiEf3QenzTBl4Ic1B
	CsOKc/zuf0u0pUeYY4Yd1dBnRVQKZ2zmcvLo1+lovRH0XKgVmQyRBx1q54c0aRbLRpLwINUSHV5
	BC0zuLb8qfkso3EQBF8yo05RYhbz7laDliSLvj7P9g35JbsZks7NKw5XO3JS7mwzaZgMrstnm+Z
	LeYBwQGxpEy9Co9v4oPRWvG8VB1qM8AsvdtokWSysGf4c1zvCILAiZpRQS6tU4dqMsGfMOqvPB2
	zJrHyktmWN4qdcMvcqy1f9KZad6FoAd9fSnMz7910xpfVdA/ZPLs4z8PlWV+Ct2BSwTI6H7SGDQ
	P0X0APxLs2IBvPi28IYXTnUuDc4127M/X4tkqgqm4U3JF7KcgCpJZ/R6w3AueRflfCv84wZs11F
	YO5gUYwW/fsnX9geogHg==
X-Google-Smtp-Source: AGHT+IFqP19dt2VG1hPpM2WYJhNqheRS/5whksM3UdvdL2gWh2MKdA11saX7GOb3KMgk63dxD3aa3A==
X-Received: by 2002:a05:6000:2909:b0:42b:2dfd:5350 with SMTP id ffacd0b85a97d-4324e7077c8mr21170738f8f.56.1766584379482;
        Wed, 24 Dec 2025 05:52:59 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:39e4:e84d:192a:5c5c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa64cesm34494677f8f.35.2025.12.24.05.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 05:52:59 -0800 (PST)
From: joaopeixoto@osyx.tech
To: linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bagasdotme@gmail.com,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	corbet@lwn.net,
	dan.j.williams@intel.com,
	davidmcerdeira@osyx.tech,
	devicetree@vger.kernel.org,
	dev@kael-k.io,
	gregkh@linuxfoundation.org,
	haren@linux.ibm.com,
	heiko@sntech.de,
	joaopeixoto@osyx.tech,
	jose@osyx.tech,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux@armlinux.org.uk,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	maddy@linux.ibm.com,
	mani@kernel.org,
	nathan@kernel.org,
	neil.armstrong@linaro.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	robh@kernel.org,
	will@kernel.org
Subject: [PATCH 1/5] dt-bindings: Add Bao IPC shared memory driver binding
Date: Wed, 24 Dec 2025 13:52:13 +0000
Message-ID: <20251224135217.25350-2-joaopeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224135217.25350-1-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: João Peixoto <joaopeixoto@osyx.tech>

This patch adds a Device Tree binding for the Bao IPC shared memory
device, which provides a standardized description of the hardware
interface used for inter-VM communication in Bao-based systems.

The binding documents the following properties:

  - compatible: "bao,ipcshmem"
  - reg: Memory region for the shared memory device
  - id: Unique device identifier
  - read-channel: [offset, size] for reading from the shared memory
  - write-channel: [offset, size] for writing to the shared memory
  - interrupts: Interrupts used by the device

This enables kernel drivers and userspace tools to correctly
instantiate and configure Bao IPC shared memory devices based
on the DT description, facilitating efficient communication
between VMs.

Signed-off-by: João Peixoto <joaopeixoto@osyx.tech>
---
 .../devicetree/bindings/bao/ipcshmem.yaml     | 99 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bao/ipcshmem.yaml

diff --git a/Documentation/devicetree/bindings/bao/ipcshmem.yaml b/Documentation/devicetree/bindings/bao/ipcshmem.yaml
new file mode 100644
index 000000000000..398ac610c29f
--- /dev/null
+++ b/Documentation/devicetree/bindings/bao/ipcshmem.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/bao/ipcshmem.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Bao IPC Shared Memory Device
+
+maintainers:
+  - José Martins <jose@osyx.tech>
+  - David Cerdeira <davidmcerdeira@osyx.tech>
+  - João Peixoto <joaopeixoto@osyx.tech>
+
+description: |
+  Shared memory based communication device for Bao hypervisor guests.
+  It allows the kernel to interface with guests running under
+	the Bao hypervisor, providing a character device interface
+	for exchanging data through dedicated shared-memory regions.
+
+properties:
+  compatible:
+    const: "bao,ipcshmem"
+
+  reg:
+    description: |
+      Memory resource for the shared memory device.
+    maxItems: 4
+    type: array
+    items:
+      type: integer
+
+  id:
+    description: Driver instance ID
+    type: integer
+    minimum: 0
+
+  read-channel:
+    description: |
+      Defines the shared-memory region used by the guest → host data path.
+
+      The value is a 2-cell array describing a sub-region inside the main
+      `reg` area:
+        - The first cell is the byte offset from the beginning of the
+          shared-memory region specified in `reg`.
+        - The second cell is the size of the readable region in bytes.
+
+      The driver will only read data from this sub-region.
+    type: array
+    items:
+      type: integer
+    minItems: 2
+    maxItems: 2
+
+  write-channel:
+    description: |
+      Defines the shared-memory region used by the host → guest data path.
+
+      The value is a 2-cell array describing a sub-region inside the main
+      `reg` area:
+        - The first cell is the byte offset from the beginning of the
+          shared-memory region specified in `reg`.
+        - The second cell is the size of the writable region in bytes.
+
+      The driver will only write data into this sub-region.
+    type: array
+    items:
+      type: integer
+    minItems: 2
+    maxItems: 2
+
+  interrupts:
+    description: |
+      Interrupt specification for the device.
+    type: array
+    items:
+      type: integer
+    minItems: 3
+    maxItems: 3
+
+required:
+  - compatible
+  - reg
+  - id
+  - read-channel
+  - write-channel
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    bao-ipc@f0000000 {
+        compatible = "bao,ipcshmem";
+        reg = <0x0 0xf0000000 0x0 0x00010000>;
+        read-channel = <0x0 0x2000>;
+        write-channel = <0x2000 0x2000>;
+        interrupts = <0 52 1>;
+        id = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2aec2a..c047fbd6b91a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -223,6 +223,8 @@ patternProperties:
     description: Shenzhen AZW Technology Co., Ltd.
   "^baikal,.*":
     description: BAIKAL ELECTRONICS, JSC
+  "^bao,.*":
+    description: Bao Hypervisor
   "^bananapi,.*":
     description: BIPAI KEJI LIMITED
   "^beacon,.*":
-- 
2.43.0

