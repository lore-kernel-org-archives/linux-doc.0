Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794024562;
	b=07+FNfWOOTWaIVIRS1iKZWGVcTHfNC8BqY1VO5ts43/a3MxA55f+DmmQdE8rlX/Ngqxy
	 Wo7W1vwxcPtTqAh8eqKeTpI8/44j+s1EhlWQRq9FJJZxr2J6/UmutXi1OqhOy5KTWIX1v
	 WHlH61PJgm70Z9ASZi1FAY3opvMoFIPPVrU2sok9qeiE0j7Qe0oyhhSrkaAfq7OxcRUYe
	 JJsc5eRFhISzjP/7lsGHKeoDjtN0oXkIRokVTZn0XMSKekQoBrODdx+1iTBfT8ShF+Qfv
	 yBKC5oOD9oQvwCwgS1nw+wLAgtZFHiUy52C1YyPllnjMqQShlMo3XF73hZhBN/uPVoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794024562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=prsA8JhE/unyEIYGc6slZThJHzBfFZOfgI66gJXsR94=;
	b=gYFNLv6xRMGrFBuB4cjQVZTBsseAyjkX9kGkYOCluqw9esiij8ZulOXXk3b8JLsQftcV
	 J2UPIcWblnvnW9VEv4Egav4vkZ4NcTi1Ig5gnatwHw1xOrN/PACIpNUJH4VvuvTW+hisI
	 UULHszOUutIER4gDL48TGZMro3ay1T8L47vMRI09tYoDoRMi2QkBdML3czicBcdt/F+/d
	 vvpRmSyAUdVjTwx1V5SiGarwYAzD6Kgfsi2e0b7PW6mNlFMkHe9X31+3KsnWd+Cfc7eQZ
	 t23dDkvcuRzDFg/FPNCWdTjZQbMuoqPxDni3H1PA8GYdXlNAIfFbJ7J5zmdBNxFqUPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="cfYi/HUt";
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A505606A33B
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 04:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A505606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cfYi/HUt
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso1783933eec.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 20:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794024561; x=1794629361; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=prsA8JhE/unyEIYGc6slZThJHzBfFZOfgI66gJXsR94=;
        b=cfYi/HUtXTdaFkxjTm0be72coJUQQc41E8j04FV6X2JEyKQYG7THOsaMjurHfX29x0
         iZwv2PCh4Y1fQOCSPQf0k5J985suT7cmRuVlAKtcE+f02TmdccXn2SdYTXqUmbhk2YT5
         8gb0tKrkwSTBiL0nx0kDt6NzN7VK8zWo6CtJXz1tk5hgegHCq7Ji7tcipHXs4AWb+6Y3
         5sgrvghuLR+3ffIbtFYFFXAH/ju0aQSeG7e7wdJh1UQsfVzO1Zm1bvC+ixHCqrxuwgT1
         jAkuhUJD7cto/+ZW/58FVtmR+W3waeU123aPM930TobiFK5+LnujAX9jZuOS+aWFaa1D
         KWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794024561; x=1794629361;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=prsA8JhE/unyEIYGc6slZThJHzBfFZOfgI66gJXsR94=;
        b=FbWiGS8K2CMCKNe6yZPVNxiORDHce4l2lr5selan7snebzyzBx3SgS/45L2newiZjl
         LSS5ykgT17/ulKYx6n0ZXRWqpiFY2tTk5Z2TJw1JwlDkLPPHlEXD3XC+F43dzTLnODs3
         yRfM8DZKVEVB6rFH4TK/drk4sERyWrnQVPh3QJGnkTAfrdi9y0FSZomLrfKYnJJq6ba4
         /7ZFwpnLEa1gOY7NvGdgK6nGcPvn7pYCtJWJrSD59aH6/zggEQRHsW3wOd+WyISWWgcV
         1+CbqXMp05Sd5W15KH0ObjyRPPS4pAiZvJI18xnC/9hmSFMEyQjQaM8LOoy3+iFZFp7s
         G0EA==
X-Forwarded-Encrypted: i=1; AKwUvBxshXdcv8hL4fqERYPoB/mmBZZff8de3zxzrlJjN+M8Hk2e5RNtJYvN101DGi8xC5dko0WkahMRx+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z//Nb1at9r5qiqyU4ngyxmPX/gVbNtzZuau8l1o4OfzGmeLzm/U
	lc3pKzSqVpe1I0+/ElrhRHgIDbFkp59sWkPPEn0634eDwF0ZZIegwrUE9edekTZwHTyC5tFhJpn
	hlRgKR6B5Ew==
X-Received: from dloo22-n1.prod.google.com ([2002:a05:7023:a56:10b0:1b2:4d89:1614])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7e0a:b0:1b2:611a:8a10
 with SMTP id a92af1059eb24-1b2611a8dd5mr4522194c88.19.1794024561095; Fri, 06
 Nov 2026 20:09:21 -0800 (PST)
Date: Fri,  6 Nov 2026 20:09:11 -0800
In-Reply-To: <20261107040913.1384033-1-irogers@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261107040913.1384033-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261107040913.1384033-2-irogers@google.com>
Subject: [PATCH v18 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI PMU definition
From: Ian Rogers <irogers@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Dom Cobley <popcornmix@gmail.com>, Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Add device tree bindings for the Broadcom Raspberry Pi AXI PMU block
found on BCM2835, BCM2711, and BCM2712 SoCs.

The hardware exposes two MMIO register blocks: the primary monitor
evaluates the System fabric and the secondary monitor evaluates the
VideoCore VPU fabric.

Co-developed-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../bindings/perf/brcm,bcm2835-axiperf.yaml   | 44 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++
 2 files changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml

diff --git a/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
new file mode 100644
index 000000000000..e1a5a16b8d75
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
@@ -0,0 +1,44 @@
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
+description:
+  The Broadcom BCM2835 series (including BCM2711 and BCM2712) features hardware
+  performance monitors on the AXI bus for evaluating memory bandwidth and
+  system traffic. Two monitor register blocks are present, with the primary
+  monitor evaluating the System fabric and the secondary monitor evaluating the
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
2.56.0.455.g6c5a503b38-goog

