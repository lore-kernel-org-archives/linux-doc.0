Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F0B2857C1
	for <linux-doc@vger.kernel.org>; Wed, 24 Dec 2025 15:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766591358; cv=none; b=ZB3BNFZ0QE6iW9We8NYnjH0J8fBRsc1/OIZDEk9c5GxCiATzzZ0krixJxIqSDOFNYEVeL1TfgNzEVtKhMaI5EPny9BU4knwqht/AUo6NuoV/j9hCCLHIYEx1L9bf7ZaIgYjR+Pou2b9cdz5aC5ez87k0rrNehQcJr8C4vqt0/Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766591358; c=relaxed/simple;
	bh=/XFBsT6bOPJdMrFhqM2OxGpyhSJ8PLQtianBu5UavFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JywWGajwAPZ7IATJOr0uNK3SyvDmYcccGe30AsP6izcxOQapKj6CHIG2RQWU1WwhzV1J8ZnIPZak85XgUQAxw78RekY18a2pjBdKAz190HvHObA9VKE8SXmWP2IeXTqlSL73TOWGfBRJSeQXZhfirGbyS7ulBe2gcJZzfCJgXHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=fail smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20230601.gappssmtp.com header.i=@osyx-tech.20230601.gappssmtp.com header.b=IB1oWWz+; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20230601.gappssmtp.com header.i=@osyx-tech.20230601.gappssmtp.com header.b="IB1oWWz+"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-64b8b5410a1so6807477a12.2
        for <linux-doc@vger.kernel.org>; Wed, 24 Dec 2025 07:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1766591353; x=1767196153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPMvizX4aiSFiPWN4zq9M2mNvcGpcgi2Bqmh2GmQ0o0=;
        b=IB1oWWz+93h9ogJV6b8gEEeqbAETF1w24LLlJIU5P8EzwGLr3c0jXTymErK0duDfts
         lI+iRG01xfyeDXw6+pjTxw/nCdfJjhchChvf6Gn1C0hkUZQ9fbqfky3tWw72pfauMq5U
         YZNMlTAFMyyr6aDfbkfv328TuFknF97gDxevMD9VoJs+Bj4pF5qCN+B4APiSoXfEBWo8
         hyzR3FrVB8oTPPQjYAt2utaVmiQ4D07uGJTDnmCpNBF5VayuUjh4alyfnI72cqCI3N6P
         AJibESsQWyDf+eppq9TP7HqB0okuGO7Wyl47tRlhUMjOaK7ZHL1/Jr09nCmGMYluanpX
         0smg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766591353; x=1767196153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IPMvizX4aiSFiPWN4zq9M2mNvcGpcgi2Bqmh2GmQ0o0=;
        b=H0679Dlzx0ybB8bZMjYPORdfZumwcuHhJv9s7AND0Xsoo6sppzbNplxUUGdr3p7n1g
         ksymwFfTCGDcaozLB2CY3sQrTWwy0bgWYCaqSiSnD2FG7E7gY7muD8zHi+1VfD3Al1Za
         xZJZHmMEcQ2VFCdbGgN7qrYlQzKujQM3QqujdpdlQL6/x5Xk4jvFhUqSgHm+PGX2sEVD
         OgQ/H8dT0l/OVfwmnZRTtYIS992gMJsJJ61kAVfXd5jJL9RX9YNE65Tn3IJrRZo+PDiW
         OJPdLYlz+tzagj7nrMlwqC0pubAjpwGitCgSQek6xoNPPgTMJiu4DpCFoyswoqogzSjX
         K1Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUiFnNmIJMB/QBhGr3koL67bRznHSBDfx5bbbeAuCAYejIjt0xM1Agugg56vAA6FiyS8hBJL89auaI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3c0ajWGyBbYbbgjwSOOtoTvw27Jjfxe/6vM63ya1RuG3Pz5uf
	q0LNEGzXJBQalFrJj7C00kUHh4iwYSqB50vWwS4RgYNoar4BzFl4agdT0L8dD8sLp/La
X-Gm-Gg: AY/fxX6pfJHcs0uuhw8HF7aTeVHWQD4id+7GzlmEMGamE5IkWjACp4YU8JBdeNS1zxi
	89tbswk/tWk/UlC6n477pa4rcU0BdIuQ605v0V45uiZszmPR74Jf6izO8vCT/fwdAtcgDaxX/Ev
	uVatN1GHHnnddejMv+gfoElCD48qevU4Dxd/m8i1+VcsM4Qni55ole4Dp+Q7Lw0OOhp9+fcVnNj
	z8SCq7bv0AnhnhD5uKQgrHnMnNCzqp0NvBVLfURJO9VYubFtHnXfq6mAP/JtGJ+/8RAb05Cytsx
	7D1syAcqHpXyaubHCU+MTRzRYgRui4MZaB3d2IGquqTdzYZ1wK59LhO2HsWGWnJVAf+y4lj/h0T
	d1IjItwLUvGdZWdCJMvCp6UN9bKzPvcMr2Y1UbooTXcB9bsfW4Po/DXfqjnIOL9KYKb73rBfVM8
	6PEFzaLTroUYlSdysLEA==
X-Google-Smtp-Source: AGHT+IHwTgoJWLEso+A946j2blMKEWqz6uE5I08Gnk6feDE3r7jM3E2NW/e7qsJaXZv87W/jfEeMvg==
X-Received: by 2002:a5d:4e46:0:b0:430:fe22:5f1c with SMTP id ffacd0b85a97d-4324e703af5mr14626447f8f.59.1766584386173;
        Wed, 24 Dec 2025 05:53:06 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:39e4:e84d:192a:5c5c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa64cesm34494677f8f.35.2025.12.24.05.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 05:53:05 -0800 (PST)
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
Subject: [PATCH 3/5] dt-bindings: Add Bao I/O dispatcher driver binding
Date: Wed, 24 Dec 2025 13:52:15 +0000
Message-ID: <20251224135217.25350-4-joaopeixoto@osyx.tech>
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

This patch adds a Device Tree binding for the Bao I/O Dispatcher kernel
module, which can be loaded into backend VMs. The I/O Dispatcher
provides the bridge between the Bao hypervisor Remote I/O system and the
frontend device model in userspace, offering a unified API to support
various VirtIO backends.

The dispatcher handles hypercalls to the Bao hypervisor, IRQ/eventfd
forwarding, and provides a character device interface for frontend
devices, enabling efficient communication between the hypervisor and
userspace device models.

The binding documents the following properties:
  - compatible: "bao,io-dispatcher"
  - reg: Memory regions for the dispatcher (multiple VirtIO devices)
  - interrupts: Interrupts used by the devices
  - interrupt-parent: Parent interrupt controller

This enables kernel drivers to correctly instantiate and configure Bao
I/O Dispatcher modules based on the DT description.

Signed-off-by: João Peixoto <joaopeixoto@osyx.tech>
---
 .../bindings/bao/io-dispatcher.yaml           | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bao/io-dispatcher.yaml

diff --git a/Documentation/devicetree/bindings/bao/io-dispatcher.yaml b/Documentation/devicetree/bindings/bao/io-dispatcher.yaml
new file mode 100644
index 000000000000..7795f55d3ff9
--- /dev/null
+++ b/Documentation/devicetree/bindings/bao/io-dispatcher.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/bao/io-dispatcher.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Bao I/O Dispatcher Device
+
+maintainers:
+  - João Peixoto <joaopeixoto@osyx.tech>
+  - José Martins <jose@osyx.tech>
+  - David Cerdeira <davidmcerdeira@osyx.tech>
+
+description: |
+  I/O Dispatcher device for Bao hypervisor guests. Handles multiple VirtIO
+  backend devices and their interrupts.
+
+properties:
+  compatible:
+    const: "bao,io-dispatcher"
+    description: Device compatible string.
+
+  reg:
+    description: |
+      Memory regions for each VirtIO backend device.
+    maxItems: 20
+    type: array
+    items:
+      type: integer
+
+  interrupts:
+    description: |
+      Interrupt numbers for each VirtIO backend device.
+    type: array
+    items:
+      type: integer
+    minItems: 3
+    maxItems: 3
+
+  interrupt-parent:
+    description: Parent interrupt controller node
+    type: string
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-parent
+
+additionalProperties: false
+
+examples:
+  - |
+    bao_io_dispatcher: bao-io-dispatcher {
+        compatible = "bao,io-dispatcher";
+        reg = <0x0 0x50000000 0x0 0x01000000
+               0x0 0x51000000 0x0 0x01000000
+               0x0 0x52000000 0x0 0x01000000
+               0x0 0x53000000 0x0 0x01000000
+               0x0 0x54000000 0x0 0x01000000>;
+        interrupts = <0x0 0x08 0x1
+                      0x0 0x09 0x1
+                      0x0 0x0a 0x1
+                      0x0 0x0b 0x1
+                      0x0 0x0c 0x1>;
+        interrupt-parent = <&gic>;
+    };
-- 
2.43.0

