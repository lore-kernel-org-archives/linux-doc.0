Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662997;
	b=bximQ4tOeiNRSMP2tjjo4vL2+eT26WnMpNoWer9oMyETw9Og/VQ5jTP6vRtlWZOHprJc
	 eNSUh6Ke/tZ5UhS1JlXAimRBGNkjGWvorVIbrCg4fWjRU/07QYJX1816d+Hyl5A4lvXn4
	 k6Lu6eO8/2vu/DKla1b+2YcgXGPprd4XIl3EvUq3E2f+XSru4Buz1kUlxZcN8wNoXHA15
	 QfdNhR/wR5gXo10Q3VqNLCz65604Sk29Px6/ClNrgOw+yGB6i72hHJOAQidgngkejbl54
	 H5wA6Q4wl/xqrxqWvmBx4KDcq+MCktCURHZk8CwLOkrUcUVrRiRd3P8nTOq1vnyFuEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=RCDzNKPwpp/Q/HkSclv5Zusf499nja7ZNvT3ZXN5ATk=;
	b=vmKzK2T2mrI4p/9e1dMTnUnHHdWPaSbat38iIcFYyTeqQ7ASElm1YjA6k2v4vBotIHiF
	 +ks38/imoSr7czPaSBl2cSkXm+m9Afmwlu5xrHCv/TWnq1nvBtBRyt+Gzt8VmA3ZAZkj4
	 2lpqFmCESAH0+ui70sPLqEnjcMPPMNWoLQqtl31oHqGEImrKldvAsJzBf5hyq7OyoAQIi
	 IQpRbaMi6tOB+4sL7zkmIfTPJ7nIC9oNKftXCT5d4B2uQMaZIOqAzVpnoKuv11hdL11zm
	 u9pbkZPRUncC5fbBlyBi3Mr+JpPXqG1DX5m/yG2htNBBxvJz89fQ5N/4PqZqxLKSooQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f6V6RDuF;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62173606A327
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 23:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62173606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f6V6RDuF
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso4307222eec.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 15:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793662996; x=1794267796; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RCDzNKPwpp/Q/HkSclv5Zusf499nja7ZNvT3ZXN5ATk=;
        b=f6V6RDuFAv+WlspbK0jUKd9ykn98XIEc5qKjAYKp5AELMfxzAXdvJuC1eaeC7ODgiW
         J+CIPIE/T7NUTZPdC68wG1YT/XGLkJ6EVw5SgV3yy0lNf8SWwUWDTJ0VzEwQN0v5DOAQ
         MaVzAXe7L1dRYfv7JYt09wG2qcxB0CJM8dWOJqe8TpNTMReMbgqBPM/2sXrWYmmiFYSF
         DoLrOT4gRSVnPcCpufrnXITNDBEwDD6WepjE5VQAKA4vr31bXt8QaMOnoRNcnq0RJVB8
         zu9Hd48YjaEztGdG2OAbqpjKC5wj9nnkOIG0S/cZB+03EWgATet3kh2lzJhCrdew39mj
         2DIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793662996; x=1794267796;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RCDzNKPwpp/Q/HkSclv5Zusf499nja7ZNvT3ZXN5ATk=;
        b=GO8sD9eB+2O2Hq94FpAXnz2L/4Hl/azHYX+EoEk9O6rxO8qzD6LdAp8BXl5jOnvSQ3
         61m1wcQpnonVYxQdlA6cS6J/k9MLC6BNDIw/u0aMNTwwDBIz3dZ6yc6jlQHGk1WrxPs6
         LklgZr0fyGz0fohaPrr0wMJ1yfhNshm0juEwEtWcNqJ/VdzPuGOcOLhtaqLOCmetSv5o
         nzlvjZ+vBG1LrYRPZtfRPY5b3X5kImhjXw79MTXuMdMy+vKVXPr2ffltWyZzM0XyfXcZ
         OcnNNTpXkXSXddeLvmRbzz2h/hOHNU5XY7Z0TBm9BDtPvVRYbJgSn/5cB45Xux6KtOuF
         78pg==
X-Forwarded-Encrypted: i=1; AKwUvBzLO13mp/BX+IgiZIMaiIipqSY9OL9jB1ungFZDy+tONLZAtWUSw4p2V2/E6PZ2ETbMLBirDA1tiG4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRwF/MWHfaZAb+63+gEiX1OlxmuS/40pNDbisO4sGyejbcc38f
	eXoFuq070A48Km7KV3UmAtdf1X3l1BWsNA2iy9MNxANBCWFQwDOme3EibGddoyOMESjeLwbk22R
	Swsiymq5+CA==
X-Received: from dlep8-n1.prod.google.com ([2002:a05:701b:4588:10b0:168:3bc7:9e8])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4213:10b0:1a4:fac9:aeee
 with SMTP id a92af1059eb24-1ac56d95c0amr16914327c88.4.1793662996134; Mon, 02
 Nov 2026 15:43:16 -0800 (PST)
Date: Mon,  2 Nov 2026 15:42:59 -0800
In-Reply-To: <20261102234301.2242242-1-irogers@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102234301.2242242-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102234301.2242242-2-irogers@google.com>
Subject: [PATCH v15 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI PMU definition
From: Ian Rogers <irogers@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Dom Cobley <popcornmix@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <u.kleine-koenig@baylibre.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Add device tree bindings for the Broadcom Raspberry Pi AXI PMU block
found on BCM2835, BCM2711, and BCM2712 SoCs.

Depending on the SoC and security configuration, these PMUs support
either direct MMIO access for the System monitor or routing via the
Raspberry Pi firmware mailbox IPC for the VideoCore VPU monitor.

Co-developed-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../bindings/perf/brcm,bcm2835-axiperf.yaml   | 50 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml

diff --git a/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
new file mode 100644
index 000000000000..08d8c7c7e476
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/brcm,bcm2835-axiperf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2835/2711/2712 AXI Performance Monitor
+
+maintainers:
+  - Ian Rogers <irogers@google.com>
+
+description: |
+  The Broadcom BCM2835 series (including BCM2711 and BCM2712) features hardware
+  performance monitors on the AXI bus for evaluating memory bandwidth and
+  system traffic. Two monitor register blocks are present: the primary monitor
+  evaluates the System fabric, while the secondary monitor evaluates the
+  VideoCore VPU fabric. This block is distinct from the BCM5301X AXI Trace
+  Module.
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm2711-axiperf
+      - brcm,bcm2712-axiperf
+      - brcm,bcm2835-axiperf
+
+  reg:
+    items:
+      - description: System monitor registers
+      - description: VPU monitor registers
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmu@7e009800 {
+        compatible = "brcm,bcm2835-axiperf";
+        reg = <0x7e009800 0x100>,
+              <0x7ee08000 0x100>;
+    };
+  - |
+    pmu@7c012800 {
+        compatible = "brcm,bcm2712-axiperf";
+        reg = <0x7c012800 0x100>,
+              <0x7ee00000 0x100>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..b8a3cb005c91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5338,6 +5338,13 @@ N:	bcm113*
 N:	bcm216*
 N:	kona
 
+BROADCOM BCM2835 AXI PMU DRIVER
+M:	Ian Rogers <irogers@google.com>
+L:	linux-perf-users@vger.kernel.org
+L:	linux-rpi-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
+
 BROADCOM BCM2835 CAMERA DRIVERS
 M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
 L:	linux-media@vger.kernel.org
-- 
2.56.0.385.gac671c819a-goog

