Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793392547;
	b=hWDxGx24EChKl44U67y8j39VTViIq5VOmD6I/BsK5WkTaKin5X8JTUCPoqzc7s9HM80b
	 poRqauwCMNvopv3+gbBXS8XQmihiwpdDvdGTBQR2DftQGanE8s5Ss0xSxv3jDZiQXfXDz
	 KxZLzEMH/Qa0YWXfmIQXw1p0tIebly4THbbpvVhliwUDSdws+5VzWPUQAzc9np4niD9Db
	 8p8ksKNXRITF4YigTp8ecZNn4kJ1PvbWuov1FoyhDgMdE/7pIt7J3+vXZ86p4oF80Au+T
	 J8kgJ9UC+gmx/RlFoBjrvxMIaPzUeol9LR7Vs4fuxTv4q89HPYOkkvopaChxITW7bjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793392547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Vesw8q50bxaqrPi7FemLEo6X3ZjANSYOODp2BdhZ57o=;
	b=Tl1kb/C6/exnm5tuopygDFv3gg3JV1sRnIQK1gP5SMvHFs44TleiNzO699moc/2n+V++
	 XGWfi2ouPkvio/CW+4zl+1k2YsJWK3Yb1asR3NVw4+XoZ8SIjWTeSDhNMKSpZ08KAyJw4
	 2jx3PaasVf3+Nwfl3k4F+8hvPzsS0F2feWYDWhAY+8x1qpMELGWVULlZYorIfBFObjKHS
	 dhJVcTDEIUnO6zGgV6S40PgkJKKYvpqkuZXaRqh5/7QMyF070NifoKZ7K9Knouc/cOzPC
	 6ih4JWWe2usenhR3XrzYPYUHQHYT+jxmywAp0P0ZTLUupOZbetZyEGFDY1xofZ1bnJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=gRfj5uki;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E5E606A324
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 20:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1E5E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=gRfj5uki
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a1947498bso189248eec.1
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 13:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793392546; x=1793997346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vesw8q50bxaqrPi7FemLEo6X3ZjANSYOODp2BdhZ57o=;
        b=gRfj5ukiFnQcPmxwrG0sQ0WdFQjOXz3BybyC09i7cCNIXdMGl5c4zCiujxCEpx0TTA
         X1jZ1Q77aDNWtQDOooLsEs8NHHDV+C0uZaaL4vxs71Ys+FiRei2FRoyYkuaVdSNcPi42
         mkfNaaOkKl8BP8PY5r1jTJF7rw5y9B0gkep8DeZewg0V6+UbFvIwk7xpciLVnOpUgqO1
         /pEhwKpOhybIHVM+NwErNQbPp9jpnVkAtr1Qmg/+wXderXJNYxqEwRzgnnyIuSqQ2Wu7
         ro7H4QmoRjZjt5hhawODG5i5m6k801iPspjwCp1fmCPv4BGVPXEhZeYaj6q06U3LzNZ0
         RVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793392546; x=1793997346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vesw8q50bxaqrPi7FemLEo6X3ZjANSYOODp2BdhZ57o=;
        b=u7XTXkyof5towyAbt0ngaUkf8dPH8sfhisVBUr7EIyClnrn7WoRT8FG8HL+7DH2Z1i
         3W0X3Cdl0bsVgcsKLQe9RQ7ybEiqiO2bNAy3UFHiN9VPo4Fxhrs4UMSlQLB4bwKgu8Ji
         NNChuiImEZvwWXr+FU5NJ3zmt+DFWseYtGORQde+YhmAvK4yBpnhEfEUdYVOb0nISK9q
         S9rlSS4Dqy7JroASBv/81d0AFWgu080BbNJL3OF4A0fplLV4CjPm2lJbWMua1w8J9Kr0
         Uj/DJvR/9a1T5GY/t9n8Qg+TVanPDYKMdAPVpfvLLlUHLU8WMXGAyQLoygtB3shPFMT5
         y8vA==
X-Forwarded-Encrypted: i=1; AKwUvByXkDxWtJtahPwdM9QTxPk+SziPHvxUbTYuVQwSVxYrY3fDKf+4QOBbaTug30KCIhZdHIviPtmatJs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZZvCQrCMXy7jvhcFxehKysk9b78rRREQCV/g0tc/9CqWqgPwD
	hux2e92bbu4mvc7KsgaWcB9SmPc57Iwd7zs1kGnTP+SqogEwHRO9zd1s4q0i9yR22BQ=
X-Gm-Gg: AYBFou0ayFxEoAi61mQBV/3+JwMAjJ6mMJOvqpwtEY+EybIFP5tiK3uMyMVczQ+3x7j
	ELH6+xkY/pORKP6OTCrXBguVPaRdfN6daibWMqYvVvg9zFJmt2uEqOGWMr8G5cIoe8WnmvdrzZA
	y5zO2d4ya8yE+YCLOLayqzys2qK7hsuqcDDC1TgN67CdccnA5LQKKlz2iuhyoGPFOEtHpUl5+Qm
	MlsBz/EPbjMQY2/8+gHEJmYf0oKcFQ4rlyUJHkQJuEVcryhIMXJQ90E7jLovIgUhIZzGmzfEl/e
	VUvUJsuZ3HKyJx/gy/77pmZise/kF3NUtVeKub0BDSN5UIY89MqKPM3EKwnF5Fazj/rx/Y+h9R2
	RGOcbBQdDHTqge11pfXmHnQMCY9OIHu1MVErynTFLHwrOIptGGoEb3cGu451veHrF0JzYB/E0bX
	LSVOZ4j7udbWOweRc5+iMa61dPoRJz2HhHCrgpJ2gfMatyFjxDm9dGZopN4XDTSFmyqGsjZGhyy
	vq799gNO60lsH25JvpgZ62OrnFgeBWRkPuiqIkA9vvS8WpGQIJsE48fGp1jjmglt4EeLWdQK+Fk
	wSMdwE1XQL+KOS1tx3WMdmo=
X-Received: by 2002:a05:701b:42d1:10b0:196:aa86:fcf3 with SMTP id a92af1059eb24-1ac5d3bb2e3mr4938101c88.26.1793392545641;
        Fri, 30 Oct 2026 13:35:45 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm15120020c88.7.2026.10.30.13.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:35:45 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Date: Fri, 30 Oct 2026 20:35:37 +0000
Subject: [PATCH v3 1/2] dt-bindings: hwmon: Add TDK FS160x and FS1006
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-fs1603-v3-1-6f8963a74def@nexthop.ai>
References: <20261030-fs1603-v3-0-6f8963a74def@nexthop.ai>
In-Reply-To: <20261030-fs1603-v3-0-6f8963a74def@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793392543; l=2267;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=xGdKc4ht4sX2nlaRXtCYdgqs5k7lEYKRlHOOJw+KAlQ=;
 b=6YG0xUeBgjJalLeVwtKSnruKW+t0L+cBhZ/wxrcpzArMdPEhJChqtHGyaPZOCG3ljIySGOMnV
 0ya2pBT9441D8bgW9ZcVLwL1/sy8bT1w9SPyxbEGBclq/tIFmK73jhz
X-Developer-Key: i=kjia@nexthop.ai; a=ed25519;
 pk=TcHV4RjX7qo9R0iryPJ/gWzq3O9yq1SUw0VO2QXQ3Zs=

Add the TDK FS1603, FS1604, FS1606 and FS1006 uPOL converters. They have
no ID register, so each part and factory preset has its own compatible,
including the 3.3 V and 5.0 V presets of the FS1006. The FS1604, FS1006
and FS1606-2500 encode telemetry the same way as the FS1603 and fall back
to it. The base FS1606 reports in 10 mV steps and the FS1606-0600 needs
an output current correction, so neither has a fallback.

Signed-off-by: Kevin Jia <kjia@nexthop.ai>
---
 .../devicetree/bindings/hwmon/tdk,fs1603.yaml      | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/tdk,fs1603.yaml b/Documentation/devicetree/bindings/hwmon/tdk,fs1603.yaml
new file mode 100644
index 000000000000..48d6dc72f248
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/tdk,fs1603.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/tdk,fs1603.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TDK FS160x and FS1006 uPOL DC-DC converters
+
+maintainers:
+  - Kevin Jia <kjia@nexthop.ai>
+
+description:
+  The TDK FS160x and FS1006 are uPOL DC-DC converters with an integrated
+  inductor. They report telemetry over a proprietary I2C register map and
+  have no ID register. The FS1604, FS1006 and FS1606-2500 encode telemetry
+  in the same way as the FS1603, and fall back to it. The base FS1606 and the
+  FS1606-0600 preset encode it differently and have no fallback.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - tdk,fs1603
+          - tdk,fs1606
+          - tdk,fs1606-0600
+      - items:
+          - enum:
+              - tdk,fs1006-3300
+              - tdk,fs1006-5000
+              - tdk,fs1604
+              - tdk,fs1606-2500
+          - const: tdk,fs1603
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
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        regulator@40 {
+            compatible = "tdk,fs1006-3300", "tdk,fs1603";
+            reg = <0x40>;
+        };
+    };

-- 
2.43.0

