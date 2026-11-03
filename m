Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679263;
	b=5cMqG+uqaDL1W6LBHSAGk+8RVq+Ol+wA83C8JJt3XCGz7uNli0X66vppg2wZHyHnhpI0
	 9jHP7KRLLPREfrbCxgvlbz4HDUKc2AFQza3qRm40NIE7TEsgWfa936h2ZlAVqlG3K32fk
	 KVPwy8n3f7MQv+YlBHSlX09vUN8+OeKEZdq16gUwplb1GxdV2409XZCCYvzmK81ih01D2
	 q7Ow06Ylyn4flUZT0AT/mmBWJfys96rO7Lp6sLF6eOuCekfuuoBZVyPMfRnwWhpQ3vLNX
	 UTp3O8fEpy0AWc6BlmpTOF7eadLx9rv3liRIuH5ioKY5ucV+aIH2Nw28GdY07QDXGDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=RCDzNKPwpp/Q/HkSclv5Zusf499nja7ZNvT3ZXN5ATk=;
	b=Mizoj01RiTKOGBQbgrhSqk/yPLRMGTq1IcMWFhsnN7aU5Q2YX7doz8qxTJS3rFNzem0h
	 zN6N2YRKZG053LF2COs/cgmnU/WbnNVn6sLnEeS4NCqSGI0fFhDGf/Snl8du7zHXf2ezO
	 R1bE+oAM6Z4xQcIHLK7ltR1IRKjYB8DD4IFV47xMOmy8AZFi96taEzE5yOAXYIlo92Im4
	 Z7+gTh91aB4V/ReqGYHvtN3ETt6uahdDYMtbfFY6kDjy1RJeyCbZXSlCVB0/vK1zmUnya
	 F7PPxDlYDU1Hk9ni7YFI1iFdiIVFxJcod4mgQ06cEb/pWkuC32U0lCfzQdHh8jMgTsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZyvhXTZT;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CE4606A335
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 04:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63CE4606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZyvhXTZT
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a1e2485fdso9257856eec.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 20:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793679263; x=1794284063; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RCDzNKPwpp/Q/HkSclv5Zusf499nja7ZNvT3ZXN5ATk=;
        b=ZyvhXTZThFj1pa4BAVcpdk43f8cHO/ExiEjtWUtWc9sdC9Us2Pkh7OLLvbAsyJRRbZ
         m/+22OSPxSlutHQyEZeXCXhSWeM6qj1wa3paj3AOM61xwBVLra88gTq9SlIy1EmQ0pY2
         hkF6AZJfnsP/8WVtZiTcYS0W5i1IRUxCGMWJkKm7Kf0hm4YxYELS+GasI0xxiB2vx79P
         H+zoJ4BSg0T3BAZ8cJ++3LPzSa1nso8LAzTU8iRN0Pdx93a8tRd64D97kIFFYSKdD6Ed
         M7TP8jYXi1kIAHKEiX4dEY+3i4OJHCpX9duWco8zirw+Vw3NGzxKxAF4X7anelHF3NkL
         PumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793679263; x=1794284063;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RCDzNKPwpp/Q/HkSclv5Zusf499nja7ZNvT3ZXN5ATk=;
        b=wsho/ULVXSiioFpRRg96c6JDq7DsGNHy6JnergkSAVqjwygcqNaYo54s3xaO4BWS6m
         ytV+dTFQXZYRNt4pJiI1p81prR7n887sMqAnY3HoSFN2iePbJn6EVXaZ37pDVw/WZGT+
         JQnxqgA7rd82w5JZMeBaqmVl9mCQGm2eIsak0ZAi1O8w6tQKPLueKFEmH0Afr7+O/QS8
         FQ2GuDUFJn0WzLnUEaky6Jml7SIeqkNhQqx4ynyMOgoqZ7XPns+b7tF1UGCO0r6ukd7J
         SydLQh7ryFEFkbNN9W6OCGWob7hHrqWWeo93D+ZmXrxhUdzDAwPRf2IqwgCuAT/C+oiq
         GfzA==
X-Forwarded-Encrypted: i=1; AKwUvByrAq4y5YYHkCsw8onFvon8VDkfETnIaxmy3R9REEUyRJ6nzSM5jfLUG1cmeZS2O4YtZ0St9f3ZEeI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuK8X1OkoiOif6QNdJkUEf38TawOPcKRuPQQfbOiIMPAuKFm2A
	afW21AuyzA7oFHjCzHrBoDLr2+wq8y7SffL9JbsCOCB/k4mIWuTJvMCwOYxON/I5pzqVrVXn7/Y
	tFC6u9dyDYQ==
X-Received: from dlea6-n2.prod.google.com ([2002:a05:701b:4206:20b0:18f:4e29:3ddd])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701a:c907:b0:151:6e80:baa9
 with SMTP id a92af1059eb24-1ac5a2a138cmr18327294c88.12.1793679262015; Mon, 02
 Nov 2026 20:14:22 -0800 (PST)
Date: Mon,  2 Nov 2026 20:14:14 -0800
In-Reply-To: <20261103041416.2940213-1-irogers@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103041416.2940213-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103041416.2940213-2-irogers@google.com>
Subject: [PATCH v16 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI PMU definition
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

