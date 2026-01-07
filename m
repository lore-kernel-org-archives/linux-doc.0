Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87F13775C9
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 16:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767803388; cv=none; b=FwRKxSDdbWaieqoteF8HYsvb/RuVoC8ghN6cTPITgrIaE38jhk+ex8p5GVTjs9Bvq+gdWcItX3Vm5XreyTId5bgNu6nS4Mfiu71F8NPzghhjo9+MYyK+5QeKkpjurhYa8i2ICd91mXsIuK6LKzK09XMQUl5EruhcF7AAUKma+mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767803388; c=relaxed/simple;
	bh=oAuMYqefV0Wi9VhdkCSojuqJJYP2+QlUbyj1AsBLPnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o+J120Bc3oYGKcr/pq/kZztCAwW3yBgA3OstZcq7qp4eIsBv5NWCbxpMqVs7MVUqZ4THaxRviowqubQMX37M3JTglbz/8pkNNB1/xl2bK8gr9aHyl6+BAxpoolUQ5NWV8JoyAKaqLzok0E3qWjYiRUQotObnpJJBzxRgwhZJI+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=fail smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20230601.gappssmtp.com header.i=@osyx-tech.20230601.gappssmtp.com header.b=P1O1Q76z; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20230601.gappssmtp.com header.i=@osyx-tech.20230601.gappssmtp.com header.b="P1O1Q76z"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso1160521f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 08:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1767803370; x=1768408170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvVGowKlmlOk8ufl2dgbwZUQhdQ7tHUGcyk69lSV+dw=;
        b=P1O1Q76zsdGjugbH1YnjP/PT/dZI5VPWJ5brFYqBVo7N8H/wFpA4po+K3s+sF8QV2a
         ImT7+3B7yTYQKFoq60wQJ4vfRMJk0S5nWsbBu2NrdK06h/GRYKOxZO1Q8iO/jqbEC7OS
         Mo2maFrGqXEIP0FOCLovs13kX/rOL5osL9f60W5kJZE9gnomuL3NN3aQTTUEDz+CQqyP
         oTPw8kF0aQ4AWIWVrQ1JWT/YtmpvzKQ67r0f6kVXE2L6RizZnCebiGYL1jAJqkQKWs2R
         u7XuVBQcjO6hz4PfppjFbytmy2bnxxfMEMiV6jF/o39VwZydVAAKP3t/RHfqsOrP4W1z
         dS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803370; x=1768408170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dvVGowKlmlOk8ufl2dgbwZUQhdQ7tHUGcyk69lSV+dw=;
        b=Kb3OYvGtgc+QB9SEOSTrKN3saBWuIo8ForeA20J8zqVwrx7b6j616e2KMepG+wYqQV
         RtsMltNum2o/ceuxw8DFLKIMB/je4u0R3k/eD9/sb5N/0KmV+bgbHUAGBWW/p9w3+Wyz
         1/YDxvRgR863cZYqEzpSxx4Vkk6aF8g2iRe6oF+uo80qB4Ykn6ZtAN9kfgYBlMWKqbSR
         z5trhJYrKwkI+Bap3HojwrEK2jUFZYwXVUoc9AdDcynS4n8jBngWn6bqkAoFSMqbPSHK
         5QxZhyzoEdK0HzzNiUkPd5S1KTjSofQKITUuzzBejvc/SV8XzIgdyS+Gd/z/N5vFUEX6
         Y12A==
X-Forwarded-Encrypted: i=1; AJvYcCUgIAvQEOTkZvCDn8/tkJP9vPPJJuqo58OtwkuYcX6uSF/tpnq/DISZZ/id3bBbHwrPisG4Ujne3XQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5EVgKY4SOr1YLs4jVVvmKcB/D+dL7X/IQepLsHSyc8nI5Irps
	on/YNTvFrHKwkfDv8ly7QkM+2T+WQPOrkawsiBa0NsNJSmAgIcP2pvn1fCCHkkkdGKlh
X-Gm-Gg: AY/fxX6Q0Ihv1X8HFfeTcl3RupuX2WUiQIzb89GTxBwe6MaZwdIbRqwk8g7/MhIM8Vh
	Gg36lOD6sJrJ7SQFB40GLSRsLifViIcBLKSFgOsK0shUfQjtsQi4OXkecNieEmyYslhFPyfEohN
	UtarY+VJOMS7n3a5ZUXqFtvT3DmrOX7KYRnfFwC97gEomFsILQDNgaQuhYI/l92alM2bQTD0wBU
	0LDxITvD6UmbvEbj2z4T5eWA5VSBWcPKLPnrKAGaIbP3JR9rwjNG0rEvnMuSVD6TxkHoI9XLfZZ
	JqC2YUonY3RreNZox9gTkn+fDzOYP1p79SuguCEOOai4PszqGirXahK/nUJ/0qz2kwxR170+Q2b
	2OO9/9WhpCFiAv9j5IPS076IKLwBdaVlz2DU7zc+xM9veav9kC9LdQS52ToL16Q/RIo3fBWhL6h
	qWda03UIosSiKEX5qX3zMNVq4zO9Y5
X-Google-Smtp-Source: AGHT+IGZvgVIRVCpFA27SlFxqTQCtBZyTJkVQlpD5nx0fxVjL9cGeTsV0wkJ5rzD4sY1Y62BW2/V+g==
X-Received: by 2002:a05:6000:144f:b0:431:54c:6f8 with SMTP id ffacd0b85a97d-432c377239fmr3846262f8f.1.1767803370264;
        Wed, 07 Jan 2026 08:29:30 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:4a3c:13be:a1c0:7b9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff0b2sm11117030f8f.42.2026.01.07.08.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:29:29 -0800 (PST)
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
Subject: [PATCH 1/6] dt-bindings: Add Bao IPC shared memory driver binding
Date: Wed,  7 Jan 2026 16:28:24 +0000
Message-ID: <20260107162829.416885-2-joaopeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107162829.416885-1-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: João Peixoto <joaopeixoto@osyx.tech>

This patch introduces a device tree binding for the Bao IPC Shared Memory
device, which enables communication between Bao hypervisor guests through
dedicated shared-memory regions.

Signed-off-by: João Peixoto <joaopeixoto@osyx.tech>
---
 .../devicetree/bindings/bao/bao,ipcshmem.yaml | 82 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml

diff --git a/Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml b/Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml
new file mode 100644
index 000000000000..fa91800db99a
--- /dev/null
+++ b/Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bao/bao,ipcshmem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
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
+
+  The device describes a set of shared-memory regions used for
+  communication between Bao guests. Each guest instantiating this
+  device uses one region for reading data produced by a peer guest
+  and another region for writing data consumed by that peer.
+
+properties:
+  compatible:
+    const: bao,ipcshmem
+
+  reg:
+    description:
+      Shared memory region used for IPC.
+    minItems: 2
+    maxItems: 2
+
+  read-channel:
+    description: |
+      Shared-memory sub-region that this guest reads from.
+
+      This region is written by the peer Bao guest and read by the
+      guest instantiating this device.
+
+      Consists of two cells:
+        - offset into the shared-memory region defined by `reg`
+        - size in bytes
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+
+  write-channel:
+    description: |
+      Shared-memory sub-region that this guest writes to.
+
+      This region is written by the guest instantiating this device and
+      read by the peer Bao guest.
+
+      Consists of two cells:
+        - offset into the shared-memory region defined by `reg`
+        - size in bytes
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+
+  id:
+    description:
+      Driver instance ID.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - read-channel
+  - write-channel
+  - id
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

