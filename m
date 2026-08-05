Received: from out-178.mta1.migadu.com (mta1.migadu.com [37.59.57.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4913F65E7
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 09:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.59.57.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785921168; cv=none; b=uq8rhZ2xnRn07WjMsB30ryZ3C8xkx/0bJKoi1YXB6glGzo4jYC07VPiNUjF5QAHSbJmMbe3slFc63cZ5Rd9YeOa6B/PhPjj/Z4vMr8WTAhLC/Z3d71vttDGrrCvf64dNbq5gGy+sPxsmCLGwjk94k6eAa1r8P+bI8rXsu1u4Be8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785921168; c=relaxed/simple;
	bh=KCvIoqp/+fM+IQnsjqs168omOMWHR2iMmUGZC2CmXlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 In-Reply-To:References; b=Q4uloM5gjIphSfTTph4KfFlp/drzOTK3OJmw5dL3IyUaEavPN6fIotJNg63p62lhzEJgl60s5wkYCHBaziFxRpmraUeI10VAAZmaWJynFtLzgdovmFFkaPB9JoR6u6N7XHKOahpQTxFhBJ/HY2ecSWRkzW5zUpB6rLik1bAyPNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=c+kkjdwI; arc=none smtp.client-ip=37.59.57.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="c+kkjdwI"
X-Mailbox-Line: From troy.mitchell@linux.dev  Wed Aug  5 02:03:29 2026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785921165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HbQVqT/KW/L2AONpoOSIbgjQbA7VEc8vzMKs12aCiiQ=;
	b=c+kkjdwIqbVfFxu5b8ro6mxkFsKpVCFP/K0BBKmrToaTBWxqd5IxRQ6JnCqJRIW/Ns6+K+
	A8YE8aIu+c68TnirlX+MYh+iSjSJp21dnvoGOD6BJGyXGAiWCY+2uV8eKLpFr4azEjVzKg
	cPZE69px5B8R1WLXlmCpcK/9QPe015c=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Wed, 05 Aug 2026 02:00:53 -0700
Subject: [PATCH v3 3/6] dt-bindings: hwmon: Add Sensylink CTF2301
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-ctl2301-v3-3-b86c75d1c552@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=1614;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=KCvIoqp/+fM+IQnsjqs168omOMWHR2iMmUGZC2CmXlo=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlFv49Jyy4J7RW49X6lXrfHiUgn5Tun06RlN9Wo3D1b/
 vjtqUr2jlIWBjEuBlkxRZbuBzzbCnyibAsECn1h5rAygQxh4OIUgIlodDIyrH23UO/fzT0ij1hf
 3tbyiJLZcaRuZbXVyvn1exZz6m15sIyR4fjcvdVLns5MMmR/fuNXgvj+D3kFVXtd5zZprTGdptP
 mwwIA
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
In-Reply-To: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
X-Migadu-Flow: FLOW_OUT

Add the Sensylink CTF2301 temperature sensor and fan controller to the
LM63 family binding. The chip follows the LM63 register model and can
provide a thermal cooling device when #cooling-cells is present.

Do not provide a national,lm63 fallback because the CTF2301 is not fully
compatible with LM63. It uses different conversion-rate encodings,
extended local-temperature registers, additional fan lookup table
entries, and device-specific PWM and ALERT/TACH configuration. An older
LM63 driver would therefore not operate the device correctly.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 Documentation/devicetree/bindings/hwmon/national,lm63.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm63.yaml b/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
index f2e0993cfbef..4c8d0a15fbd1 100644
--- a/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
+++ b/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
@@ -12,7 +12,8 @@ maintainers:
 description: |
   The LM63 family provides local and remote temperature monitoring together
   with fan speed monitoring and PWM fan control. Supported devices include
-  the National Semiconductor LM63, LM64 and LM96163.
+  the National Semiconductor LM63, LM64 and LM96163, and the Sensylink
+  CTF2301.
 
 allOf:
   - $ref: hwmon-common.yaml#
@@ -23,6 +24,7 @@ properties:
       - national,lm63
       - national,lm64
       - national,lm96163
+      - sensylink,ctf2301
 
   reg:
     maxItems: 1

-- 
2.55.0

