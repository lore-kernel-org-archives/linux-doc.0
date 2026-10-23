Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750336;
	b=QAEOPoxmZCZ2CtcTX3rQR8FO4VANtYTtnAiHzINzo+fcFPV2ete106sjb2Fe3geueLVT
	 XvE3ZrOjzFQ7n5POXMLfGbYLkafJQcxtPxdwRQZ/BpurIKRLLFxbW5+ZOIRK/8QaWezr2
	 vsz9DrLbSI9V+vpLcwCQ3F+CswcqbOHQ8ij9gffJb6wSGfSY6JIWclBfRvKCUc1RQVjLL
	 xKdSPy3VhQXNdl9O9e9DGAYnSHibJK5nwcjMEa8ecnc7VT2wMDRywDvmlAeBLUoypePcy
	 Q2Ksz1VZhe95PA8FI2J0kZbM/Ck6iDSCbRIo9LIKr3kSiTHYR8SMMfwVM9/QiqFqWnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Dq6GJJsBaSDY1IzgGawT/TFz8VL5osKrrjfnYgKJzYM=;
	b=xdOlUmrRKEtkK6sf/z75iIfYsShm5KSSpRcr2igILpwXk6PYPZnUaIsL4qNqMgunVKBx
	 nxN2PJWQIwiwtCxWARWCv++5Vndtp6Qg4kF3ucN5CtgO6jhOVfCuNlcjBalxyoMj+eJN2
	 17kmK78lKyoB8NGmQfoEB1FhOW2PX8COvEqgOazfwxbqgtgJG5Vhp6fkYBXdT8AQXkjo5
	 HUPY9gY/4gsDh3P2wRDBNn8QLKdfbLbU5c3cSTYWJvOCXZ/zsJzVtyab7OCPhYbTFCh36
	 nq7MZs+Ibdtf+J71NOzyrFOU1cjLEAm1X7AfJjT0w7jfZ2JcbemdvVvZkf3MW6mMW9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IWpQ4mhj;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E94A606A32A
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 10:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E94A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IWpQ4mhj
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so8060045e9.3
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 03:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792750335; x=1793355135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Dq6GJJsBaSDY1IzgGawT/TFz8VL5osKrrjfnYgKJzYM=;
        b=IWpQ4mhj/pj4bJh7MP/vuwmzTylNCkSm5qEGtWhOQtmmvPT5IVx9weMxPItekIw2dE
         UIuPuYiLLCs+z2+QbEPtwC739zCnY0WJBZ+1kn++bUAIqd/ljke5fS8Y9y9JS65pAUlR
         U+y3VP2jNC4yavrsbZNGYxuAZc81aXSZRRfUaj147D/RORJhI+T/G1Nz3lGvWO76/xaH
         cSUQZNVtXSQmq6ru9hXj4O3FyfGAnuTKlYWZ8IIXaFBlrVMfGUSHqGJOSkUUa2KkGS4/
         Q2DcRr90fnljjn+r1qN/pyNqmhEQ76pH1fLTCKe7Tes2yWkPX/J0Kd3prY9jBSOLwEjq
         8XDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750335; x=1793355135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Dq6GJJsBaSDY1IzgGawT/TFz8VL5osKrrjfnYgKJzYM=;
        b=cZopE2/TVlfp6+Ezy49FMzJE0xIpoJ2amD9pwctR1PU7HKimUb3LCMIKMVO0SzuU17
         DcY07QTzKtrnZpUJ/5STUEix/qM/Iwbg3UrUNRV4SerGKyk2XFdA2tseYQm7xQ/3M6/U
         H7Yxxa39E9sV9keZg4Z6IaNSMGNy3UMnRSYv4KLAndOIzIybx/cz398egSTm+7MHVcSO
         Y5UIi4kN+qYc4nZ/G9RuuDMAioEszVu2hFikr4g1VlBXMGvzurny8Q9kX6LLYjCC44xD
         U6ly8/DnsLtXzqbg6aNsXFLzA+kT6u4hMjHtdo8oxu/XMxbv7D4n2rlLCj0TKfp+iY01
         8wAA==
X-Forwarded-Encrypted: i=1; AKwUvBxpEF9BItfD8cfQkva3oxNojTAX8ZPpw7M3PPLsYm5pwtEtbe2LZ6x5tuLbxrjjdP1U3ex8/S7g58U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJ9eRjHzqsYgGqjC71SmjbRX1cqv/shv09DbZ7OILqRHPS0Peq
	KATU0tJTI3gCb9S/oRC8ZDiaiUTEXMrprpADwb1mSNbZM8p5fgfxZn4EqH3ty9+n588=
X-Gm-Gg: AYBFou2N8W06ifMuY87e5H9b2SeQeJeDc0LlPN39mqrEK61PURvAtmBFpQhLmpVTe1p
	mf5oW+JLOMq1sYcXtjy9XJAfQtPIQLs8ytRKWY32rbbt1vKLU5DLVfG+fBxVADma6tT2OXUSnLz
	Y3Lhu1qmigOqdFwvwDPkfVQhi/x3kaNZrXn0I8/jH6KIKdOymfo8eTDGtUzeEkvJpzsePo16LlH
	1DDukbOq5U+eD/CdqWLBaqynTPXfeunj2DSIP7jjG/0M+mrb9Yq0ZkhAEtHhkxsqzZMuMPu7Knm
	jzNvVi0X8mq/L5TgOxA7LquTNCikymhjpKcNNa+hqxUmw2rnUknRyc1KxYdStn3s7mCMzSEJsyL
	avGDP4zBQjy8w4xCW/BLUBoCu2L83Vi/DRbeDDIBAe6FDa5ZtlTJDNrzQX/rgGczEx1Bggo70nr
	4jpTawQkayYR1Wid7IucFWc3WnEapIMI25J9m350ThgYLosBjXctCKMcDcpEaTLv2UsQBR7U7KL
	cly2kTiCsyJ33wNjxcJV81bGDnrn0nAH1qcoBhMBLq6HKKO0YWvZrc=
X-Received: by 2002:a05:600c:4fd4:b0:4a2:1cc:6551 with SMTP id 5b1f17b1804b1-4a211f3a5f5mr23914985e9.35.1792750333373;
        Fri, 23 Oct 2026 03:12:13 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211b898d2sm50139165e9.4.2026.10.23.03.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:12:13 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH RFC 2/4] dt-bindings: hwmon: Add Raspberry Pi RP1 fan binding
Date: Fri, 23 Oct 2026 12:15:55 +0200
Message-ID: <0a9a27c58336449e5a2e243b987a8bc85b05aaf8.1792748690.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1792748690.git.andrea.porta@suse.com>
References: <cover.1792748690.git.andrea.porta@suse.com>
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

The Raspberry Pi RP1 is a multi-function southbridge used on the
Raspberry Pi 5. Its internal PWM controller block includes a built-in
hardware tachometer logic, which calculates the fan RPM by measuring the
tachometer pulses. The computed RPM is updated by the internal Cortex-M
firmware into specific MMIO registers within the PWM block.

Currently, the Linux PWM subsystem lacks a standard API to report
hardware-calculated tachometer values back to consumer drivers.
To avoid abusing the standard 'pwms' property, this binding introduces
a custom property, 'raspberrypi,pwm-tachometer', to link the standalone
hwmon fan driver to the RP1 PWM controller node. This enables reading
the tachometer MMIO registers and exposing the RPM via sysfs.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
For the rationale behind this design, please see the cover letter

 .../bindings/hwmon/raspberrypi,rp1-fan.yaml   | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-fan.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-fan.yaml b/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-fan.yaml
new file mode 100644
index 0000000000000..53e5b67fa856b
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-fan.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/raspberrypi,rp1-fan.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi RP1 fan tachometer
+
+maintainers:
+  - Andrea della Porta <andrea.porta@suse.com>
+
+description: |
+  Hardware monitoring driver for the fan connected to the Raspberry Pi RP1
+  southbridge. The RP1 PWM controller hardware contains a built-in tachometer
+  logic that calculates the fan RPM. This binding links the fan to the PWM
+  controller to read the tachometer values.
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-fan
+
+  raspberrypi,pwm-tachometer:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the RP1 PWM controller node that contains the tachometer
+      registers for this fan.
+
+required:
+  - compatible
+  - raspberrypi,pwm-tachometer
+
+additionalProperties: false
+
+examples:
+  - |
+    fan {
+        compatible = "raspberrypi,rp1-fan";
+        raspberrypi,pwm-tachometer = <&rp1_pwm1>;
+    };
-- 
2.35.3

