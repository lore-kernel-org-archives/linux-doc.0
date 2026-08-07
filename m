Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FA73793B8
	for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2026 07:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088453; cv=none; b=XzE4EAdZ4we6I3lRiUSD+oWkJqtYojErPdKlwC9vjSBQkavdD2d0jcixu40h+X2RxXRcXa6sIAGOqbqeTJG31+uVYEtBG7xUc6hD+xFrPZurgqYt7eRNBqnrmgPI53CRrI3f/eElLrspsLuGYhpromGLcgZNX1dWBnt97xD+j64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088453; c=relaxed/simple;
	bh=XRjWR+Miez9ABrBTjcbrpXIpp8Y7F55xFix0sC+e4s0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s4ADRGRhYgBa1LOD5b6qiB3Pxi8DIf7/JVp76v08Zhv/u7691HGCiJHbHpdOsPa98um1hAAaGER20aVCgrE9LS9P40xt+yw/sv9z5eec0xPHPxmO4SMrNr5NHBD/UQ6IiyfvGBXqqbprYmaZHlhHzu3/q16nW9CcPZv/KaaT3PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=none smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b=Y03dLBLr; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b="Y03dLBLr"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-472326ca506so1994110f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2026 00:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088450; x=1786693250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=37E29zaFhLGOrDb/ZTD96WxUaP6LZSPazQ7ZZ2/0O0I=;
        b=Y03dLBLrZvklntcaLJuPjYXR9VW+ycGwcGeDMdndTzfuqWm/V7TjSjIeMvkjo+CkoN
         RcjVL/ARmDZBn8SN4aRF5BmtjXJ3vfJggQs5oQS4JdugZP61EeE8UDGWxdJwPmiNb01K
         tQN3lk+a9GusYTSkR8Mqum5m+qvLWnmiqZGLjPywlD9M2Ehtg7rPPcs9ZQZ8idymvUU1
         veX+lDz5eu8joy8BAKogHYnsUVDurA9GrK99UxdqYpvh0GB9XA7Z5n3tVd+cazvVRYP0
         2XJSr4YRV/8Q9U93fgNas2DHxKaftf0JKWnxFfPdhydQvyIH/QGa5R3mMwdAeTmdlzUC
         Eb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088450; x=1786693250;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37E29zaFhLGOrDb/ZTD96WxUaP6LZSPazQ7ZZ2/0O0I=;
        b=COa3aNiFXjaB+RrKJyJJCfEwTXaNs3GCa3SlJ359EA0iQk5kRu72jUbuC2PBV+LR6a
         KDGNcxBYxjYA0xtjj8/F2/puKde1940PMDzqwknAcc+X5PX1emn11Q7ehmigGA3Pldtf
         lMyj1Cz2JNKT0IkmJoEoG2/hdOg11izCw83eBLRB8M5v465M9Wb0+S4bNpWTajuGKrNx
         2BSrMlKKPxCnvPnZCv+esri6W+m1MY3TbXY3GW2/pgFO6iNXZCVJxmgzs9HYuvrvEY0C
         l8T3kC0wmGyaifZ32QJJ8PzkELNDn6Ppdwf0Dde0gbQdYDEBN9MXKQZ2OydgRGAfrCSI
         jL8w==
X-Forwarded-Encrypted: i=1; AHgh+Ro280gXnUw4VJFnx5zmC1amsWheZe8O8MymlVSGAi4oB6/JbY7VTcP6XZJ8Oir0t7MXdVL2bMGPgZI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd22/Ynt9AxfWx4NQaODQQjcdoIHIXoI32uFeGEa/YDVZH87Ju
	/Vkvh5gwkzIWzv9rB78kB2vp98CQFzxrD1bT1Z6O0y9eQ687EuipBYfrQYhzJ1e7V7qS
X-Gm-Gg: AR+sD115s3rSqf7JtdiSRjRSUKEw7Toq5GhxMVynpUf7WSTJwND93a2O91/vKFA9JOP
	sQmXel/7/oXYp/0FFUqs53XOi0qpEeIw+7VEU1dGpjNZu5wWOFOgXj/sh9Lj3oQa/VTcTJ9zNR1
	54QULjjqX3vnPbKBOI1nNDTodKP2O/r7vedsozKtYgvIxVl3GI/LfBMHpmDCP1Jylb35apM/484
	KygxI6etI9VYe9CNA1BgTHWRK8pc08Wfoxo9nz1dXJbfd8rDL8IQpX6K6vXV/SNsndKgYzWG4jH
	VoSNTzfOzvRK+NVecOLd9LrjigDfwWbHbEc1jx9b4z1gp9owhtJp8HSDxZM73voG65RElylNviQ
	qlqNiaRRxOHNRFUeBBI6XoTFCYOW+ZIyhL0FawCeUlqqfuuz6Wyw/t9PvbegOFvESUyRMZG/soW
	fOz7EgEoVEAadjdQ6q5/Ua34jX25vUq9pYgNfhshDXCTr5735LCkbvRgX70Kmac6o=
X-Received: by 2002:a5d:6f0c:0:b0:47e:9f16:c0bf with SMTP id ffacd0b85a97d-47fec63e205mr36677851f8f.30.1786088450464;
        Fri, 07 Aug 2026 00:40:50 -0700 (PDT)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f90f8sm2819904f8f.26.2026.08.07.00.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:40:49 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux@armlinux.org.uk,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 1/6] dt-bindings: bao: add IPC shared-memory device
Date: Fri,  7 Aug 2026 08:39:28 +0100
Message-ID: <7fe7fbabed8d932a9d8d82e64c9c4d76100964c6.1786010512.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786010512.git.jpeixoto@osyx.tech>
References: <cover.1786010512.git.jpeixoto@osyx.tech>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the device-tree binding for the Bao hypervisor IPC shared-memory
device, used by a Bao guest to exchange data with a peer guest over a
shared-memory region.

Co-developed-by: José Martins <jose@osyx.tech>
Signed-off-by: José Martins <jose@osyx.tech>
Co-developed-by: David Cerdeira <davidmcerdeira@osyx.tech>
Signed-off-by: David Cerdeira <davidmcerdeira@osyx.tech>
Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v3:
- Describe the read and write channels through reg/reg-names instead of the
  custom read-channel/write-channel properties; drop those properties and the
  "id" property; add a vendor "bao,id" for the hypercall channel id; use a
  generic node name (shmem@...) (Krzysztof Kozlowski).
- Clarify the "bao" vendor-prefix description.
- Subject: drop the redundant trailing "binding" (Krzysztof Kozlowski).
- Add José's and David's Co-developed-by/Signed-off-by.

 .../devicetree/bindings/bao/bao,ipcshmem.yaml | 59 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml

diff --git a/Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml b/Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml
new file mode 100644
index 000000000000..60947150d576
--- /dev/null
+++ b/Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bao/bao,ipcshmem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bao Hypervisor IPC Shared Memory Device
+
+maintainers:
+  - João Peixoto <jpeixoto@osyx.tech>
+  - José Martins <jose@osyx.tech>
+  - David Cerdeira <davidmcerdeira@osyx.tech>
+
+description: |
+  Shared-memory device exposed by the Bao hypervisor to a guest so that it
+  can exchange data with a peer guest. The hypervisor provides two
+  contiguous memory regions, one the guest reads from (written by the peer)
+  and one the guest writes to (read by the peer). A write is signalled to
+  the peer through a hypercall identified by bao,id.
+
+properties:
+  compatible:
+    const: bao,ipcshmem
+
+  reg:
+    items:
+      - description: region read by this guest and written by the peer
+      - description: region written by this guest and read by the peer
+
+  reg-names:
+    items:
+      - const: read
+      - const: write
+
+  bao,id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Hypervisor-assigned identifier of this shared-memory channel. The
+      guest passes it to the Bao hypercall that notifies the peer of a
+      write, so it must match the identifier configured for the channel in
+      the hypervisor.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - bao,id
+
+additionalProperties: false
+
+examples:
+  - |
+    shmem@f0000000 {
+        compatible = "bao,ipcshmem";
+        reg = <0xf0000000 0x2000>,
+              <0xf0002000 0x2000>;
+        reg-names = "read", "write";
+        bao,id = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..b11b3dd995a5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -231,6 +231,8 @@ patternProperties:
     description: Shenzhen AZW Technology Co., Ltd.
   "^baikal,.*":
     description: BAIKAL ELECTRONICS, JSC
+  "^bao,.*":
+    description: Bao Project (https://github.com/bao-project)
   "^bananapi,.*":
     description: BIPAI KEJI LIMITED
   "^beacon,.*":
-- 
2.43.0

