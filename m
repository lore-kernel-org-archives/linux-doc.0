Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793049124;
	b=cFzl7kmJRwIAELJIheQbZ9BydHMeIw58t54A9YMkLgmplYWNX7QYijATOlsllPJ++IIT
	 FeRX3ywYhV4yjOMSDWrzQL/PIFi7mrr/zeF0MYtMDUI/dIAgnjw1VKtnUoIxOhpYUoede
	 +f+SPuD7FBH/n2hFq/ozrZk01K3ArrtmHdI58wyxB2mWBWJ9e+3r9Vj1JEST65ukeVHDm
	 jR0ahKmBZxpycYE0bveIL75FolBzp6ieEK3EwM/Fxsb9Dfnu02w7TQVP64u0vMnd/XhEk
	 0Mh83DS8gxt7ngHgaQJ7y1MbsKdZPb+4ZpXExveYSJ93MY3niEh9trJC9IZE2sNhk9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049124;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=C6OnP1vGWmb9YnZS8P9AwgUEc+BdAnjPfL2XGArdBN4=;
	b=1duc+gEfOYQg9LkIZe+JaG8wOcGP5vRckI2fkdZ9KEnV9sN1gqoImlK6kieYA3ykwIjv
	 pbM8KoDsvq+/TAMdBzsr4C0yenQeJy9CHEMY0eQVzStACP9v2xG9C8uerm42oPqFkmueX
	 NyNVNxSg2+f5atqweMmSX6rehoKAmI/z40eaoCpah8f0kCmLtCe9hmJfm2TH/SqE+R0lA
	 CgA+g7MzvnDZhQeqYY8LS/wW6T09FSSh5xICadBwhqkHKw8fMw49IiPpP4AVVjUUucFK7
	 fT93+3b8207KbXXZN+VkHtvZdtWaowT9+uPZsXLU1pWPXLgxIWaruRgpv/X1YPz8zIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NnysnYU7;
	arc=none smtp.remote-ip=209.85.222.226
Received: from mail-qk1-f226.google.com (mail-qk1-f226.google.com [209.85.222.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AC5606A32A
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 21:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04AC5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NnysnYU7
Received: by mail-qk1-f226.google.com with SMTP id af79cd13be357-93a40a9a01aso39657185a.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 14:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793049123; x=1793653923;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C6OnP1vGWmb9YnZS8P9AwgUEc+BdAnjPfL2XGArdBN4=;
        b=04lKwdva09XudfttxP/VRcLBLjMPctmQRuHEmvS6WDu7ejEXibsMXjxscZZpyZOIR2
         NawGPekVxheBpPwaW4Ycz3qqUgXIYnodk1jOvXjU7G2RMdkyo1qOWAlQ2CcJ7IxUvm22
         Vu1VqZpYbgyyyuaQR1pvIvPVWtGk8Kn2BRfl+/3/QzGnatUmUIeXKYeWK+DvElhmM9ko
         boQOPiFhFC3UAB0HtBuqZi3P/AVlaQsZnV1aQa0EaHGkVFeaIJgh6yisSsMpGhandGRX
         rOnmuD1Vi1CQndZm152Yx+1LO+4mSZKmMrGyem3IlxDFvnMUYunPmUjjyq6/lYt3kbi3
         d3UA==
X-Forwarded-Encrypted: i=1; AKwUvBx/pSt4+60ouRMLjDmJW7AzUjxMT4Y+thzRI4AbKqToy0wShzR9J/Iia0tqsplD1JYpT+/CiK5EHIY=@vger.kernel.org
X-Gm-Message-State: AFq9FYImjvw1Ms1TSXpmDGdt8VV47w7eZEkKGtdHTTRfUkV5/aVOFO2O
	gK/OgIe8rqUcYIrRBY87987QXinNI8Je/4x7e72uwy1wX39Bc2GAXGgHQZBt4gqlDc1BLhJAZSt
	Vy+IiQGLk+aeWU3KTwNh5cUzzta0GC7qmfcmlVHfoBcWTL5QO432rphMjIYQWgKIy3NnInUS6YV
	eGygh2s2EErkjT7q0Cs/JGKJPACrTlmqahvtd1OKk1n0b5Z+sLUVTXHSpTtMmy8jZR8GbY9AbYz
	alL+2fFuEKq35vhPC0qJXg=
X-Gm-Gg: AYBFou0G9JT9EgDm8SoTd5NbmBCEN8kXumF6h6wKCdvAfGn/O1G8Q0CexUAGC3XM5ES
	M78q+rLsoEx5awd07pt5Ni+dzjTmVsmfbIlk1WmOYnz93z50vI/uoVmEGSo1YeEDEvL7Hlo6NV0
	fZxbUhdsmod5aDMOcoAASRX/VZkK746Q+kWrUlh66LLyABkb7T5/WF9o8GtyymJKGa5wFjE2PaX
	tJPkmrOl74GkdeLHGRl43hWrVK8v/mAJMa+PiQ+YCw31UwfoTmluEtAn7H41fFdbKTZQtrsdYL7
	9YGWTOfaP4+iomYOsp2DAGjjVcDq3NARxMukLyTq6qnbHaCEppQvgPQMQrIHZHW+Ce94JIy6SY0
	M5DfEgqUwj8TEpMHWMTNqfNdg4aed04jmMi8jtPr/1FOznKK2epoToqJM/JaJxyA6jWw8EtlgrP
	LHtMJy53mRHVHth5XFqUjFuOLCN04NBxaY4tbVsFjdi5g=
X-Received: by 2002:a05:620a:1983:b0:93e:c12d:4eca with SMTP id af79cd13be357-943f4c19e2dmr170770685a.42.1793049122951;
        Mon, 26 Oct 2026 14:12:02 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-940f06613cesm121430985a.6.2026.10.26.14.12.02
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:12:02 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a2b6fab7a6so380733c88.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 14:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793049121; x=1793653921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C6OnP1vGWmb9YnZS8P9AwgUEc+BdAnjPfL2XGArdBN4=;
        b=NnysnYU79YnMhg6jBSRtE+Fl4SdFXflwUjWH0sCUcG7gUl7ebUhnf3ZwNUCXCAF9VP
         jxtfuO5z99UZUwaeAM7SVNyvAPkFb8Q1uHbiSN4Gxl44r+eZz0fD3E+5EBEjPK5eVgOA
         rT+ZXQTw6PMvAANqPbelwSi4jlqjcLxNRVa+g=
X-Forwarded-Encrypted: i=1; AKwUvBwg09onZSZ61CAUlmDsnDlTWarltfyTdPgILCwtvmpC7kXd4kxn2d/8WZ00In0ZUuQ/df20xHkVYEw=@vger.kernel.org
X-Received: by 2002:a05:701b:42d1:20b0:158:b944:b15 with SMTP id a92af1059eb24-1a3c6150260mr1039959c88.22.1793049121357;
        Mon, 26 Oct 2026 14:12:01 -0700 (PDT)
X-Received: by 2002:a05:701b:42d1:20b0:158:b944:b15 with SMTP id a92af1059eb24-1a3c6150260mr1039903c88.22.1793049120586;
        Mon, 26 Oct 2026 14:12:00 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm31915678c88.11.2026.10.26.14.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:11:59 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-perf-users@vger.kernel.org (open list:ARM PMU PROFILING AND DEBUGGING),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH 1/3] dt-bindings: perf: Describe the Broadcom BCM5301X AXI PMU
Date: Mon, 26 Oct 2026 14:11:49 -0700
Message-ID: <20261026211151.3212237-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026211151.3212237-1-florian.fainelli@broadcom.com>
References: <20261026211151.3212237-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Describe one APB register window per AXI Trace Module. The counters are
have no overflow IRQ.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../bindings/perf/brcm,bcm5301x-axi-pmu.yaml  | 43 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml

diff --git a/Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml b/Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
new file mode 100644
index 000000000000..686b20d4cd29
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/brcm,bcm5301x-axi-pmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM5301X AXI Trace Module performance monitor
+
+maintainers:
+  - Florian Fainelli <florian.fainelli@broadcom.com>
+
+description: |
+  The BCM5301X ARM subsystem contains three AXI Trace Modules, monitoring the
+  two PL310 AXI master interfaces and the Accelerator Coherency Port (ACP).
+  Each module has its own APB register window and fixed performance counters
+  for commands, data beats, channel activity and stalls, latency, and cycles
+  with outstanding commands. Counters support local start, stop, and clear
+  commands. No counter overflow interrupt is provided.
+
+  Each node describes one module. The separate ATB trace output and its
+  CoreSight connections are outside the scope of this binding. This block
+  is distinct from the BCM2835 family AXI bus-watcher performance monitor.
+
+properties:
+  compatible:
+    const: brcm,bcm5301x-axi-pmu
+
+  reg:
+    maxItems: 1
+    description: APB register window of one AXI Trace Module.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmu@19003000 {
+        compatible = "brcm,bcm5301x-axi-pmu";
+        reg = <0x19003000 0x1000>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..b97f22107fbf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5220,6 +5220,7 @@ M:	Rafał Miłecki <zajec5@gmail.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
 F:	arch/arm/boot/dts/broadcom/bcm-ns.dtsi
 F:	arch/arm/boot/dts/broadcom/bcm470*
 F:	arch/arm/boot/dts/broadcom/bcm5301*
-- 
2.53.0

