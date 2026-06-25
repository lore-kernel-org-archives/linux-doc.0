Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD52D39B97E
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 16:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782403509; cv=none; b=Z10LOFLaSPYCNRBwvO+4NJVLKYs1cbDC5oeWeaLdTQ80mkfTruA10LJDv4GCgf1U0ilJ9mtTQSjvaP61xmZ8nwL8GOnpe9h1+N71VsNyg0w8baskgqQDxhq0nSfryQ7BaFbdsPD5pXoN0UzyOPEpg6d9xOcsGYI/hlnQIwaS7Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782403509; c=relaxed/simple;
	bh=f5C4+Bt5ugEiy2LVyokcq17w8vPsIll+88We6QbmemE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uaMpYMEaCEnJSKiXYzNmX/4ktpiTbeHLriBOgxNgdCjZtN8Ss60axdyZGj0CjCG/VH3TB/iZYCRlBl1v1xIxRQHZp1htmM4JDU9NY3bzbhuCICMm7SQ4q5OQ8COyWl32iOLTV7YQrg+Oa29VscDeY1d8SaxnZ5x6ZQisenF0y4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Irtaw5nb; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Irtaw5nb"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-46e30429b10so485901f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 09:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782403505; x=1783008305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EjKkKqp9fBdZiADoXkPIOzR6TnKUMV6AHpcUuhEviCE=;
        b=Irtaw5nbN4SvenQo3FpAg3NpzzAkMJtoyybgHtk+XnSgILrcrSaLWXHMKsZ+rtOymu
         dvn/+Qg6nq5+uKO9/nFeyKJy6s33oYNsCOT3QXTlmZP2LEhi9wQgyzT09LMl7rcaruRN
         wRTQ15fRMcZg/LrywQpd3gD5qvvmJmXEXCzPdvfk67HI0aYJk5YU8C7sZohRy/C1D5fb
         zrpn5d4jL7PTToey2mFhdC1+Cn9iIcjzQE1PAy5oMws1f6+kSwjA9A2LpcSXt/Jq/bRk
         DtaA89mmpslcQPElZmwV+5bKZYGJ5zgE/2jrjBFd0OsrjIbJw0G5LpRau7AjeaPUbDKG
         iU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782403505; x=1783008305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjKkKqp9fBdZiADoXkPIOzR6TnKUMV6AHpcUuhEviCE=;
        b=seMCRz2I52RuwMQfRVeS6FCA+CF0sDfTD2mgDus6J7DlBKuh5IbCr7G9U+Wcsblg5q
         nxNTrgcKoIUdYxXeZvm/CCPKsuB6JqXHryNHcsXqC4TpbjY9M7aV4bIdjV7aEKzcqEoL
         sO5EVvZTO3lIjAZc58XGVVNRJEyjd4vkuexhyE39tsWy7qH0tmKhWBfjm6U3NoYkgPW9
         hmGi2Q03Mh0lZ0Gth0QZ9UFELrIXZcgCjZUXCTvJS1HR9ErbvMUvtzFZ9IkFL8EJLVw9
         KRuzDX1R2EJI45vvsMMQMqsEVAekXJ7nABkG4Kc3z3/7pW61/JMixoYZIN54zi3qzBtP
         Q6Kg==
X-Forwarded-Encrypted: i=1; AFNElJ9Qwi8JaWOhRTefDUArCuZflQVYtjM4Z7gKOsOwnPV2Ja8u7DWx6HylBp+kOm2bBdIraKRGGuwyUeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygj2wiu0NFqDXnSjPXFx8K8+lzjdI6DtP4GOXiTegs/bpxgiBP
	9qpNaB+rOqZ8MRFKrLIUyvvF2YT7v/mLKVStLp2fBZBPWm+1wjkf4I3/
X-Gm-Gg: AfdE7clR09BQlPWZ9vdmglAYp2uejH3XANJsYyS8BfNy6dliP4Pfo1RNrSOAa/B+sRi
	pLnJosrKgrDdYUev6j4GGmQpY+bGpZa8AeVFp3NcwYkxJy/cJaq96RqlLkPd7XehZ3LKhxZk6Dx
	z4GPsdYL1AvW9rU/JK41ICHhWWhcyXbJhQCG7dzZfBOZlt/Zje09YqRURvE5PF4GJhqS5GydoQb
	WNeUDWUcppfkhHiRXw1secA68PVH7/28IjyaOb8BOobUctOkMpbV/JbSZhJLcZUHyHyodRIMlNG
	reeASqfi8K7Gcz8N//K/KrP31Cerc80J6CJHZRjLbZDxErxxkUVJ7KSmU12QdvJwHQeJwGrFIim
	o4gfQStn2GlEXJXgi6g/G5yh8jIWGlTTl3ypoNKvgIJZcc5GnjxV5253wYd2PYSA9WH0PU5/4wB
	Je/hGkZbDSDC27fOiTgdlL/LgWg21s8/v05VoL8qj5eCoMxsRDGL0MbgelU35NGQ==
X-Received: by 2002:a05:600c:4692:b0:490:4b89:535d with SMTP id 5b1f17b1804b1-492668677ebmr48000945e9.1.1782403504589;
        Thu, 25 Jun 2026 09:05:04 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.86.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926543be74sm52220975e9.1.2026.06.25.09.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 09:05:03 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: hwmon: chipcap2: Add label property
Date: Thu, 25 Jun 2026 19:04:22 +0300
Message-ID: <20260625160423.17882-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for an optional label property similar to other hwmon devices.
This allows, in case of boards with multiple CHIPCAP2 sensors, to assign
distinct names to each instance.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
Changes in v2:
- Implement suggestion from Javier Carrasco as proposed by Krzysztof Kozlowski.
- Link to v1: https://lore.kernel.org/all/20260622122200.14245-1-flaviu.nistor@gmail.com/

 .../devicetree/bindings/hwmon/amphenol,chipcap2.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
index 17351fdbefce..56b0cecfca5f 100644
--- a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
+++ b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
@@ -45,6 +45,8 @@ properties:
       - const: low
       - const: high
 
+  label: true
+
   vdd-supply:
     description:
       Dedicated, controllable supply-regulator to reset the device and
@@ -55,6 +57,9 @@ required:
   - reg
   - vdd-supply
 
+allOf:
+  - $ref: hwmon-common.yaml#
+
 additionalProperties: false
 
 examples:
@@ -72,6 +77,7 @@ examples:
                          <5 IRQ_TYPE_EDGE_RISING>,
                          <6 IRQ_TYPE_EDGE_RISING>;
             interrupt-names = "ready", "low", "high";
+            label = "Room";
             vdd-supply = <&reg_vdd>;
         };
     };
-- 
2.34.1

