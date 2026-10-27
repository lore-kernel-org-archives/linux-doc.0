Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793123495;
	b=Nb6z8ID2YifNoOBDVibPMwcGYdTK9adLxUr4GKT6hYYt8fwm+IrpEGYj+6gYluYaRTfD
	 JV1EXnmI7A6/qslw7S3Ua71qaxMCrrSoByMruqmBDqKm9llTAVLswfaODwtNrRqGNrdu3
	 +hHuRvZqmLwPyX8bgZc713KKQUAFiDBUKXbeSUJk1ji+6+w+RgCrMmlltPNOX6uF7oWLM
	 uGHsA5OsagtXb7arH7EHAh+uZOWS6q9d9yQysx2vwPZgkgNHYtfN2DcUUe1Wh+PtMb/Cn
	 1M4TDIRka4eJjXt8XioU/Nggca0kQzqA5QunaUEr9O2YeuVkBrYn1t64mbuYxlbIsCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123495;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=C6OnP1vGWmb9YnZS8P9AwgUEc+BdAnjPfL2XGArdBN4=;
	b=MUenDlwmWjU/MBdJmWBAGBfky9WKVsdqbOBoA6dyPHPHHkNSjGgm8jGyCJ5KSz3x7Pn4
	 U+q1ZQ7nmkXLTqgUi72kQtTa6XOkCH13AoLipGgEki6DN233bgQntGmoHBQyDA5zTYKgA
	 2/E817g4yG0plzKe5A6+WZ1JnDm2sDh+PR6Z4s/VoYUmzpTjC5LONRUokRCtnhzjT1gD9
	 RXptZ/bD9df0T3a1Izsnr680aAUdR3W9gh+nx9sSrwCLDtb38alVwvqgLPukctqRrCVK5
	 kK4/GS4Q0JsbrdPBFZmAxFIc66ABa0V18PsFD/oQBoGuY8ifEO3hHb/kuJuCJmNAT7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fIArgy0H;
	arc=none smtp.remote-ip=209.85.222.97
Received: from mail-ua1-f97.google.com (mail-ua1-f97.google.com [209.85.222.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D49606A329
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 17:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80D49606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fIArgy0H
Received: by mail-ua1-f97.google.com with SMTP id a1e0cc1a2514c-99061e2171cso75707241.2
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 10:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123494; x=1793728294;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C6OnP1vGWmb9YnZS8P9AwgUEc+BdAnjPfL2XGArdBN4=;
        b=H6sbpR51CnYBui84u7xjJvic18CAVDpQLD0oDtk2V7/Os4nek9wXt7lu3wCvAxxW51
         I6LAZcJwIGGJ+VLv+XSqmjltLELV4qJeaeMi6HrfIDDPFpzicfZEJ9kXxVhizGqq0SRc
         KIV/WUkB3yp8LajqiGSiGSV/6VXviw9PnTX16rFtocJ5M5HGIoUokug2uvof29a4s0+4
         p2cqVdwMXnmeJCXd3egkw4jSqtBxK+ZLkR57YF5enNa0YN/qmb6ReObmYa/iCPgBkA92
         8b2DctehQsokP1JCJlHZ0qig5cmooZx3sbndGswdVwBRT8kTMMlTI4cAa1ZFKx02D/j0
         XFyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqxKJuiRbOx45J3bbsBx9vjd1+k5yyvLor7as93c4ry+Lr6XQMQlw84RsTEx7b3iIfMomwik+Ia4g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdUVCNHy9aDCtl9//x8NPbr6tKcWMl5vWy/+2U+S9zecYDtCCN
	0sjvyc/jeGSlWmYONh6YruLyucpPjSvZQ3y0NCFLAUYkunWSF70BvqJ5OF0DsUeL4wFeNr81/5B
	GW2DnF6lUigtj1zGa2YZmYytlbi3oHFLaIp2jfOlGsxRKGdI2Tkck6tDJmgTr8TUjilknZdvhcj
	cTn8impKXt93Qz7bech+NiGCUV0iGrX236POHk9o/13LMUQY8InmSEsV3/3u94qh1S03adz3gqY
	qD5oUA+/a+SNeotkjvmxWs=
X-Gm-Gg: AYBFou0UeCgWshwvTl2druwG/IsQZi16FhSkP3aV2shYpOy7wCCC+G6XHA7H5vKqpdL
	BUlhDkTk/MdBikHDAp8Ip6azFTzV1z051OM9PL0956fVKgmd7YPxvArxp8k1ObGEgLLRUnfhgyZ
	NBlpf3H/ETQxd1EXopsRnP8UdP2uYKgnX8qkzUwGrLj4BC9r0vGPK5dsA+PkX8Y1YhzFkauEHSC
	YqwcFmsv92h28hgO/XrcN3a/hL9GvrDA6OMpVwSgqhWt7gJQCiO+/Q7VFlgE+JYWtfLFqDnMKpq
	gYY23x2XkMtGcLDdwl6F6z4wYQitw+WOiJ08xpMrIngFB6QML3iBupbOww68Q5QVD6jDTnOY2ro
	obMzcLsODDOX6wr16rjjUQ8EIY7ZK4Z5PuBaXVs4RoK6MZAmESpZ48ih/qMhKuXFu2sNsbW0KKX
	IRTFAErfRzuKVH/4gzoXbeVuSvTikQQmljeLG0OyJ5
X-Received: by 2002:a05:6102:4420:b0:7a6:a24e:8140 with SMTP id ada2fe7eead31-7d03a56fc57mr3659137.14.1793123494176;
        Tue, 27 Oct 2026 10:51:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-991259fb771sm24284241.14.2026.10.27.10.51.33
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 10:51:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5337ed1ba44so4869381cf.3
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 10:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793123493; x=1793728293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C6OnP1vGWmb9YnZS8P9AwgUEc+BdAnjPfL2XGArdBN4=;
        b=fIArgy0H+v0gsmzP3Dh2wg3Vs5PuRfD54J0bLaAVAXK09gO2ulOnu85NK2V+BWpXVX
         U2ZD7AtClFrxDfiAeQMnYtM6ca8QfafDHndMef8fPHVWoVl/e7nt872rs8ziOF6HA0w2
         aMed9tDVBngkJxtDk+2nVV8tF98GM0VsPXRPk=
X-Forwarded-Encrypted: i=1; AKwUvBwAZouq1LxZGxQ2V8l+IuQmIRlNWaKMmI7DRTy2mV/UQcjRc5WKc71S5fM0IWchCcgY1IXSJF0hC4E=@vger.kernel.org
X-Received: by 2002:ac8:5712:0:b0:535:36d:dd97 with SMTP id d75a77b69052e-53fcc9bfcbdmr22041cf.48.1793123493307;
        Tue, 27 Oct 2026 10:51:33 -0700 (PDT)
X-Received: by 2002:ac8:5712:0:b0:535:36d:dd97 with SMTP id d75a77b69052e-53fcc9bfcbdmr21461cf.48.1793123492818;
        Tue, 27 Oct 2026 10:51:32 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5383970ab61sm83164511cf.17.2026.10.27.10.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:51:31 -0700 (PDT)
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
Subject: [PATCH v2 1/3] dt-bindings: perf: Describe the Broadcom BCM5301X AXI PMU
Date: Tue, 27 Oct 2026 10:51:22 -0700
Message-ID: <20261027175124.3518239-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027175124.3518239-1-florian.fainelli@broadcom.com>
References: <20261027175124.3518239-1-florian.fainelli@broadcom.com>
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

