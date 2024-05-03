Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2117C158A03
	for <linux-doc@vger.kernel.org>; Fri,  3 May 2024 18:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760325; cv=none; b=I6SZNs7fx0nCqIZHv+xiQvx5zuGnqUH7rRS1BQY5rEEUfyGez1/LEoWGPWoYHeeksMQwemtfmPpAcWcY62gJQ8HyhptpQ3r2/kjgA56Rvk+MrWhGhJnHvyVzwpE8X0lMQPh/V4g9ligjh7HT41EcLQi4oanw5NGSQBFajRuwJgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760325; c=relaxed/simple;
	bh=BFeF/rMqjmAL/T3qO395y21tghoeF4vuGyaBxCV02tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Te1BKhJi2VfILn/lNLbKkkwcf6Ae73s6ZtNWExepOx16/ffyYqgTBO8+p1I2aYoYzAs827IVnuouwMkUjisTqUE8N2rOCQzuYYMPhKxfcKdiPmkAMIq1/rYKLS8IZs53iFIWVhDmv3CHziLX+f9dC1sY46DjBwjVixHTI+9G0W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=bybE6DFp; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="bybE6DFp"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6f3e3d789cdso8595b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 03 May 2024 11:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714760323; x=1715365123; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=bybE6DFpG76YWSNupvA+YQQHIsL1ZIADJN56vMYrzl+dbNLBqY2TV1Hf9F/q4NC1dn
         wVzVWUmOzM1Mc7ddzAxlDzxcYWX5cVXdIYEdBTIumugumbOcRLWByJK7wIX+asuLN57q
         Uj8SGO5kPtSDmFV/3KJUjCgCMbL8EXGLbs+4N/NPymm7YDxCaTKQ0uJ/65jw+bq5UseJ
         F4aQIOCLAA3WhObA4NgmIso8t2ydqDfH7j1DVUk9W3IMrLtFkSitPwwcY74CR5we836z
         +eZ/EtyFkX7/3faV2sKp8apZRhL85VX3OlFmEaoGLMDd+JbJt0qPLG8L7+0EJqyCLbLk
         jSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760323; x=1715365123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=Ry2p1UHMZajVbhpxr/IqH9QKOnVHMcB4A0fFBZdgVvtvGnbgan12WIges9oHurMTWp
         18my3X84Uu0VLBDLPV2I/ufo4VYFhB1nYFQxVXHl7i1KH1jS2KefFZ1ZnbMY4ZWE/jq4
         PeDDck4G41y0Uv77xoPo4yPUNVe1Sc2Eh8ZI7d3Ixfvr34IghA3NU9zq4xDjrth42znD
         nAPFqok42sNYW4n7sslC7wV7+SXR1XFFb6auRVR9TnG/lSW7Rn8bBKtjgx79l+H5L88i
         Awvah6A6lFom7eljsJ3oSaa8uPBWpW1zmLISIoZUb9KlPS//yXTfIPQSaJl55uV+AsuX
         Ylrw==
X-Forwarded-Encrypted: i=1; AJvYcCVcXqwEaPziec2DrIKnXmX1QYxbU7cgDFvd82ss9eDRf8rzW0WdEOiXXe/x285uyZZ03mRcWVO1omrU0gxw8BWQGDc9bDr8X/hk
X-Gm-Message-State: AOJu0Yy5RCynKA0deto+sygRp24nrgf+SWByPU1jn6T9V6rea+iNMgra
	c4xQO/4l+lpNSLVzuf3HR0BLQP+CXujgIJP1BIcXnlZd9NYOeVWDG2wc5GtqpfM=
X-Google-Smtp-Source: AGHT+IGBOKl57I24YFZySzh3mz54yFRloG9YDHhQIbdUi/b1ycprdpu0E8l8Tpw+3ZKCGJzBqSM1lg==
X-Received: by 2002:a05:6a00:2411:b0:6ea:b818:f499 with SMTP id z17-20020a056a00241100b006eab818f499mr3821023pfh.19.1714760323428;
        Fri, 03 May 2024 11:18:43 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fu6-20020a056a00610600b006f3f5d3595fsm3355421pfb.80.2024.05.03.11.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:18:42 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 03 May 2024 11:18:16 -0700
Subject: [PATCH v6 01/17] dt-bindings: riscv: Add xtheadvector ISA
 extension description
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-dev-charlie-support_thead_vector_6_9-v6-1-cb7624e65d82@rivosinc.com>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714760318; l=1767;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=BFeF/rMqjmAL/T3qO395y21tghoeF4vuGyaBxCV02tk=;
 b=3O6DNsqnjho0eOFsM+BkkXkbFm6aePP2kGmbXVZ9SDtJ/226s0zD2dPzdYEZM526omlhaNz9u
 R6CoU3n69abBjslwqGP4BXTu4vuglNkUKagnVw882sVEOVJf8MhdD5N
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The xtheadvector ISA extension is described on the T-Head extension spec
Github page [1] at commit 95358cb2cca9.

Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc [1]

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..99d2a9e8c52d 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -477,6 +477,10 @@ properties:
             latency, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        # vendor extensions, each extension sorted alphanumerically under the
+        # vendor they belong to. Vendors are sorted alphanumerically as well.
+
+        # Andes
         - const: xandespmu
           description:
             The Andes Technology performance monitor extension for counter overflow
@@ -484,5 +488,11 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # T-HEAD
+        - const: xtheadvector
+          description:
+            The T-HEAD specific 0.7.1 vector implementation as written in
+            https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
+
 additionalProperties: true
 ...

-- 
2.44.0

