Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867997;
	b=TL1lmXECBjC80+ZFsztNGLo1aaLKO1Xke5DCaiS8y5miCPmBwB6eW9bsM02IwQ4fz/U6
	 kcCYi2LUJBvoP0e8aMj/TZo4nbK3gCZyIzsnEKP1zWtw0GvggeOzvo2MB8CKyjsdlj3aC
	 Q/NtZpqUlEq/0tpnSLw9GVs+pRU6hsvFSLwg4tEIvZ9AonczwGpxjRcOsjzpbTw4D2OCN
	 dXz+MZPsnOb0BpBReKs6rhZH/z9qFNTJzgXU4y10d3+6Ao+5r2ORoQiiVNrWZGpjiTLI+
	 Qo2bhOIxQnNN0OTRUD5VArIRh+H1HloIEBDMFKkePp/mNU2YxdcVzHTHaBQnUk3NzYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867997;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=bH6eRMRI9GI93XxK3LngmN0vMGIuvmZRyEVAjIvrs+I=;
	b=tJbCU0LBjLWC+0QWw+UBhJM1gXeE266SYQSi4iVz8V0tOAQkYDUKzyjXHxd3t3eR7Di0
	 qsdvG+/rOSykhnOjqs/u8sZqaNWIIz+tM//3ViQfU8uVfSkv+n/oOjhepvCt0S8TPwZjx
	 v/t7LzKUYxANqb7edlTtEPYRhgXmYdeak6vIBU34LBRkGDCEsnBrDx7g/OnKit0+cCqN+
	 54MwltQV1aUyfnkYfzk0c6yR/hIYQBk0yP7UF+klFQj6eULieRtra3HesRx4pmXKtjlUN
	 GpxWEsLIVrIvOJ6QUCezGd4XQGfkPPjMCalxQ9Qj1tPxUzL5q6LtoN4rGjJbJOzBzMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Zc89Seil;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651BD606A885
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 22:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 651BD606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Zc89Seil
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso1556359a12.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 14:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867996; x=1795472796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bH6eRMRI9GI93XxK3LngmN0vMGIuvmZRyEVAjIvrs+I=;
        b=KyBH7GUgN5Cf9ekKf23/zeQ+xLtxLImJ4W6ic8PrQXL/9zJoLJyHmSjuw1/QMghMLH
         2KY6oyegDCIWBH0Ud9zqfEay2tr/wyJUg17E3GQNAoTEs8qUKAEzsnL5LwkiR/rDF/k3
         sJ1attPe1eMBhIn9OxLulIWuDP5sSH/a5zClDGO+DnuM8SiqljWJWuY8jObtV8w7gMMJ
         BkaD1RnsyjQqZdaaswcmT/sSfl9fc59Br+qy/s5LsOJfQmRH+1wVddPgVIZLE+d5gNYw
         cUoIn/1bcoNInYXUS7PirJOQ4KWCNcp5y2kO3TPwCQ/ofVsvNPSOx5bf4MCVE23fnZa0
         2aFA==
X-Forwarded-Encrypted: i=1; AL+hErGm09SWNiYHzHWx1a7yVFXDI+KMB9f1n4uXPeQoijPFBGjgBGonSRTP/A95/Lrc78W/bpUnr43CV5A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/k4qZ2SwLCHYJosGkeoHjkjG/g2Q5swZLnvLNBOqCoZw7tXrSE
	Erb+KsmaOVbMwQHaQYAAZ3HZbeXEaap2AhK7neoUhWv0rzElfCCUB/GxSdnZZVzA82VjgCBE/co
	KCmjnax7NtvXW+z0F8PCxfWhCCCMR3pyaNz2I2w86H+9q5e66chl1BZeCfhyTJ1IC6EPpZPf9Oe
	kybix3hrYlkqg9F+cdBpDWlxFiDKKEW+xlKkzmHF3YEQjKYsJxGzB9G5mV/a/wcGZo18baZAHrZ
	u4MZnij5QMp6/QXq5cI
X-Gm-Gg: AZFdTZdqqeTR3gtFpansxhlGSZVBqSM+qRmmqhor28ed51lVZCQWtwRXfgDLtoGe0bI
	JfAOc9F+7K2Dt5UR3ulorzKaw9wQ/BX3SHOt++V10CCNoDqDVzoxk/FOkL4q3gsm9tASBi7X+Z6
	TNUnEmPyANvGOdsRBpE8BlV3c8ey1dUDLtOOMSj1OIFjdvhnhViljxBtvdsdLqZ4SYnaaAlda4L
	85NpxbRaAST0geXjaJk2Cxiy1pLiEORPIr8pZp1NbCALraU1S4DQ9ZbhHk/f7c6rKQw6l43NLY1
	cLwZjmIbYDbcSn7Buw3eOWxWb41IKs9ffNSKTHQdAkf8TjPwZ4MutimjeQJzz759O/PutnDiYm5
	8KtugdiPHiCg5fAFe0+VWQjLoxAqBec9SHtP94Cj6jvapGYJ4wbVa83VL+LnFHBQC1NSO2RGci/
	mDOywbUZvmeTqZdxyJRqUm1K73sLNf4PseSOXRD8nH
X-Received: by 2002:a17:90b:3b4c:b0:3ae:898e:a123 with SMTP id 98e67ed59e1d1-3b1b0a1ff62mr11515705a91.14.1794867995613;
        Mon, 16 Nov 2026 14:26:35 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abe7d05bsm515579a91.6.2026.11.16.14.26.34
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:26:35 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f479b9819so2242659eec.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 14:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794867993; x=1795472793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bH6eRMRI9GI93XxK3LngmN0vMGIuvmZRyEVAjIvrs+I=;
        b=Zc89SeilmA8pkJTOitA3tWQx2H35lHyqkp7mwjmsa+LSMkFk9eXsnruIPJqWvTd5qY
         HHlAIzlV33N9McClLBxdYzPJMqI584oQ5YCAyymIYRrIOPP2ZkPbut0lFgM+wgknNiYn
         ootihCUiItqsD6KhtRguTInxgVRlV6FdR7njs=
X-Forwarded-Encrypted: i=1; AL+hErGNxv2pBKDRdIZ5MzOtp4BwdeEzkVFigZ1I2EZT+NZBELM6lGa0WwHq4xVQO4adtyuZLUUtyPGw4io=@vger.kernel.org
X-Received: by 2002:a05:7300:3083:b0:36c:f88b:caae with SMTP id 5a478bee46e88-379675fc82fmr19195207eec.22.1794867992567;
        Mon, 16 Nov 2026 14:26:32 -0800 (PST)
X-Received: by 2002:a05:7300:3083:b0:36c:f88b:caae with SMTP id 5a478bee46e88-379675fc82fmr19195151eec.22.1794867991619;
        Mon, 16 Nov 2026 14:26:31 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm50176624eec.19.2026.11.16.14.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:26:30 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER)
Subject: [PATCH net-next 4/9] dt-bindings: net: describe the Northstar flow accelerator
Date: Mon, 16 Nov 2026 14:25:14 -0800
Message-ID: <20261116222519.1416501-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
References: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Describe the BCM4708/BCM53011/BCM53012 accelerator register resource and
the GMAC2 consumer phandle. The accelerator is inline on switch CPU port
8; GMAC0 and GMAC1 bypass it. Document the additional port-5/GMAC0 CPU
connection for exceptions that cannot safely traverse the inline lookup.
Keep existing boards unchanged unless their topology explicitly opts in.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../bindings/net/brcm,bcm4708-fa.yaml         | 45 +++++++++++++++++++
 .../bindings/net/brcm,bcm5301x-gmac.yaml      | 27 +++++++++++
 MAINTAINERS                                   |  2 +
 3 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml
 create mode 100644 Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml

diff --git a/Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml b/Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml
new file mode 100644
index 000000000000..f744b23433c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/brcm,bcm4708-fa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom Northstar BCM4708 and BCM5301X flow accelerator
+
+maintainers:
+  - Florian Fainelli <f.fainelli@gmail.com>
+
+description: |
+  The flow accelerator is inline between GMAC2 and switch port 8 (IMP0).
+  GMAC0 and GMAC1 bypass it. The GMAC2 BCMA Ethernet node references this
+  register block through a brcm,flow-accelerator phandle. Miss packets carry
+  a prepended accelerator descriptor in place of the embedded switch tag.
+
+  Switch port 5 (IMP5), connected to GMAC0, provides a second CPU path for
+  exceptions that must bypass the accelerator, including TCP control,
+  low-TTL and oversized packets. Describe that CPU port with an ethernet
+  phandle to GMAC0 and an internal, 1 Gbps full-duplex fixed link in the
+  switch's ports node. Port 8 remains the data connection to GMAC2.
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm4708-fa
+      - brcm,bcm53011-fa
+      - brcm,bcm53012-fa
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    flow-accelerator@18027c00 {
+        compatible = "brcm,bcm53011-fa";
+        reg = <0x18027c00 0xc0>;
+    };
diff --git a/Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml b/Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml
new file mode 100644
index 000000000000..76fbe2abf515
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/brcm,bcm5301x-gmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom Northstar BCMA GMAC flow accelerator connection
+
+maintainers:
+  - Florian Fainelli <f.fainelli@gmail.com>
+
+description: |
+  BCMA enumerates the Northstar GMACs. This binding describes the optional
+  inline flow accelerator connection on GMAC2, connected to switch IMP0.
+
+select:
+  required:
+    - brcm,flow-accelerator
+
+properties:
+  brcm,flow-accelerator:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Phandle to the BCM4708, BCM53011 or BCM53012 inline flow accelerator.
+      Only GMAC2 (BCMA Ethernet core unit 2) has this connection.
+
+additionalProperties: true
diff --git a/MAINTAINERS b/MAINTAINERS
index 56212dbc9a0d..dce9a88f4aef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5669,6 +5669,8 @@ R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/brcm,amac.yaml
+F:	Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml
+F:	Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml
 F:	drivers/net/ethernet/broadcom/bgmac*
 F:	drivers/net/ethernet/broadcom/unimac.h
 
-- 
2.53.0

