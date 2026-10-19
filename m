Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792435546;
	b=0NdU6soVXFG09lJHbX4lXhbBbAIVcdE/NiJuYAH/uv6RDFQWcXbDr1GcOnesNVSREFGm
	 hdiEqOkeunVpW3bRs/hpv2fctaMJSQ2JqmZ9GGBZ6Gputa7T5A8OYGwG5pgG9EUUgD0Od
	 PRw3NXik8pjgZeGfPPq5F9JXtv0Cz8vO26apc3w+IZCcUOg2KIeq7deRqBkF0kCvf8Ml+
	 614wr6rHcBlIriSIupTc361kVTnmuYf+3P/0JlcD9ehWQG96O+eHxxU4vSsUKUVSI4RWL
	 WgK9lsgMbDiDc/3Vs94Qm9GqRMX0cEhGz2ee0jewBAa8Z09p8FnQct8PnQTdEBzazAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+5EOVY9DUNw8s72Nx7os6foE09oFwHGfwPgDFCi+jYM=;
	b=WeBQujf3Je5VlZjVfrj4QdLZsX7zNkrEODHZpEHwn9FGKZ6ogJGwDX0PEgH369rZNVI0
	 RRO+EgASCu9yBuQrT7y5Vc44dXTA4Bo7P2MP8bW8AW9cXdMHRdonUoeHHV6QDc1qqv2a1
	 TJ0jtPQxxq51F3FHzg4eJxlXrr/BgDB6viFujEIpuU4t0sDU/KU5lLFDeiL21xHHsQiyq
	 HjlIB/Nrg9s9CL8eErY15qrJjSO5nTOcVvB4qKSaesPmkTFUoC8ORgjIupIKMn9Pnw+eX
	 Sx5WwkOEyfjgSh+fZ0lF5+u9bZauxJhlYnRstDgSYKX15W7uVmxZcLvyqslS+duC2Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=CROF+cxV;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6CD606A31E
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 18:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C6CD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=CROF+cxV
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-18cdcfc05ffso899679c88.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 11:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792435545; x=1793040345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5EOVY9DUNw8s72Nx7os6foE09oFwHGfwPgDFCi+jYM=;
        b=CROF+cxVEiQyCpnV1Ol+NzHGgnxT88R0BFkUrod3jp1qyJ7/I/GHJIX1pjnufC3RC/
         ME4OtYwxOG2Z+oFmXjUkYoN5GAvf+zrekJVQKECUa1xfnKibOZYk31oflHTnbBYwIutp
         5/fq+mxjPPz6IQNFabdq9vjeD9W09bc/k+5+nljvtz0d6+0KrvrAjh87LydLiL8SxTyg
         9VcuD61HvEFIV9gZb0dmRGPXYSoRZHpXlJ14rarNUTq/REoCvjFzaPbxhxPKgmWxrdgt
         GiFzOHkr6uMOwHjIgXPq4MHaYFYw+Wnpmxczlv360BFsjRlnxG4mp5M4g1J7Ueamh8mn
         3nYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792435545; x=1793040345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5EOVY9DUNw8s72Nx7os6foE09oFwHGfwPgDFCi+jYM=;
        b=T01COldzZD78/7xQRRwd4N5rXfSW8e+60x9rzUF072t6JDydWQxPFoKQ3tnr5/xbGB
         X5ogNthqlHL9P3CSc42Ei3GPbXaSR+r9bH7zRmJuxuBwq0cLUbxmsRBpnbs90U6pJaJQ
         fTdCwwQqFV9hFPAAkYqRukFKOZekP2GJSm+2XCfT/mNhyqude0tCn21XXDe5t4sCtB3s
         oAk8Rd8TJuOGLnH4rLnUVs1MREFNMqw3F4AiobHUZfx536vPHTY+04sew5eHZJSKlsj9
         U+GeOJD4tgUWpmiFbDwgtykuJup7eBfgNQJZNEFUrR6yNLk021sz3Xz7DyXwyBJ3JNAr
         gt1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxx4GVREr5vftLtMMRr0hMOFwjYtIkl8DIWlrjucygR88iMA2egW0SgbZnYsh4yKeuA1jyKdtoIv3w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwbt4IIJ+e01ZUuzC8QsxoF6cw/2Mbcuiubcd2Hqmk3VjoCdWT
	2ioUq0MweZV3vGVy6jDdQIE1pkCFrTNrGLX59mAep8VEG+3t3LfU/AaZv55QNvDOs+3b60WgZE+
	Fi1cpqrA=
X-Gm-Gg: AYBFou2/ZWKlKUZTWqYN8Nd2C8k6l4luAbappziz8uo2aahtCTnjADrrAEj0ZGcd0Xo
	FEv/nv1ix7K4P/jwMCVHidkPeJvY2qRStJXm9MFHiRez7cbnJLF4odtyvLLfS8LjjknvP+ko3tN
	KnFWWPzvS9Kf6QSbFX+AQNAthtKjuTcb9KScyJuAadBURL9besiGPTNGEyC4HXP1k3BS0lMsueZ
	m7aM/yYZGgfYPzdgw1QI0bcByoZrkPlhHe4Zi7XYoGE7kpmYUy+WjwuZBZGLoSHvWHVZpO9wyWM
	zM4uWbbyImJyhirN8W69S19wfZl3XOCZ2IS4AE/TIqhqT4uW6zrWWm1wkiOCVlF5XVcpoihxHpZ
	QcQKWWx/rfHqlKOmmK1yLmkRWGudBade90mmi1K+w5RBvtPnjMhrMJ7QQFV6OQcx9xTFhZ08OsB
	XDjO6N8nB8b8umj3xqR5B/O6rJlglQ5jn0t9bgHlsgXOp43VcgoF7hPK21lF3k4xqWXHZgWDEvv
	oE=
X-Received: by 2002:a05:701b:4183:10b0:14f:4b01:40a1 with SMTP id a92af1059eb24-18507fca393mr12939427c88.0.1792435545495;
        Mon, 19 Oct 2026 11:45:45 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm29907576c88.21.2026.10.19.11.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:45:45 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Date: Mon, 19 Oct 2026 18:45:15 +0000
Subject: [PATCH 2/3] dt-bindings: trivial-devices: Add TDK FS160x and
 FS1006
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
Message-Id: <20261019-fs1603-v1-2-8adf972386c1@nexthop.ai>
References: <20261019-fs1603-v1-0-8adf972386c1@nexthop.ai>
In-Reply-To: <20261019-fs1603-v1-0-8adf972386c1@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792435541; l=1668;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=vv7jc6T42fhaJkWqiEeKPohXQukidcy6joILhcZ0eqE=;
 b=HII5ZHZ2cEzr6ZQ/XjUeiKk53W1QW46O2/OsGyl1EYsF4RSfn6+1k5/9ZFqIGdPzQ9eBYU7Gg
 TTkqnYQGH9vAuwL2Di/mC8zwqZG7d0WgXEHuyclQQ3UGjf6wx+ysP8A
X-Developer-Key: i=kjia@nexthop.ai; a=ed25519;
 pk=TcHV4RjX7qo9R0iryPJ/gWzq3O9yq1SUw0VO2QXQ3Zs=

Add the TDK FS1603, FS1604, FS1606 and FS1006 uPOL converters. The
FS1606-0600 and FS1606-2500 presets scale telemetry differently, so they
get their own compatibles.

Signed-off-by: Kevin Jia <kjia@nexthop.ai>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 42527c7ee9c8..73bc8c130802 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -466,6 +466,20 @@ properties:
           - synaptics,synaptics_i2c
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
+            # TDK FS1006-3300 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1006-3300
+            # TDK FS1006-5000 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1006-5000
+            # TDK FS1603 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1603
+            # TDK FS1604 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1604
+            # TDK FS1606 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1606
+            # TDK FS1606-0600 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1606-0600
+            # TDK FS1606-2500 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1606-2500
             # Digital PWM System Controller PMBus
           - ti,cd9200
             # Digital PWM System Controller PMBus

-- 
2.43.0

