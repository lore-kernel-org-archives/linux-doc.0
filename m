Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C56B3876CB
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 23:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768432777; cv=none; b=R8Ab7uYX/rGT9ulbp0LbxdMS+uYQ7pbkijg2XYsrQ+QQphFPQjMtMmh4kkpOfnF5/vcnDnJ/+5owsl+Ky5WotYSTcM/YtpRSquvjI8wBEkDBb2wAvAm7XY/9BEZF4KqOmPzUA4f5ExIC0ninvKG46Vj8RKyaLSDVBqmQ1F5q9rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768432777; c=relaxed/simple;
	bh=g9R/DgoDWl6EF5D3q8DzkV6XBEbhurMxaGpLqhJaO2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qcfSSNwAAScINdmiaUyFxWDd3ZNFWHRMBBoqfPx+b9TBymn9gur/iz5KOlsX3gx2KoU70g2Q3tabwakSVDhe3r+WeQRhOcYG82VAse0xdiNFrWOi8RjOFxQ3WXwpELlr3sFKbmVyP5CrQA0/qvh5SHMQhWY1mr6ADKTg/vejRZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=06E9X8Db; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="06E9X8Db"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0d67f1877so2369815ad.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 15:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768432763; x=1769037563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaSWKwxLaghni7N9hjcOEG+LzgsthN0XWKW1He+SYHg=;
        b=06E9X8DbDizq7HZjDrz3eH+WNaCfytp50w6SeXd5h1DnyTv24T1pO39A5//oEqud53
         Q77qvAX7eFz1dxddDuvHqkpSZdQCePXx6padmaWdPABpG1EAD4ILzGWby3wjK+ZtNWXX
         VwQml3srcYfu9h6RX4iKcMLJPhweBkhtwnD2gXb6gRzFT8aukOOzFp49eWwzcjLkQEns
         3HdsZuMQw1idiWZI/qKI9lZ19ixCH/4PdxK0GW8d1ch/CssAVJcPb/y3dN0Z1F1vAfie
         duWJADyVv3RI+8kwy0eaXgALEYM6GbIz+fW8rNv0Ye2QlotYyDGm2OuBZuCW+b3zbFV+
         h9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768432763; x=1769037563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kaSWKwxLaghni7N9hjcOEG+LzgsthN0XWKW1He+SYHg=;
        b=RGkftQKs3BI/We8I5xWC6oOVwNSVBab2EKChkb2xWK4+jh/QulStNEaZlFbba3jFxr
         HsMhFVFTMbHPE/Uj9X2BokzsczcNoQlDs6u8QpQParQ5UiFWCR909Hb1fcAZove1bysM
         4xGk6YvrKPRDcb9UPZxvz2nsreEr36TC6cxE79Bf6cqoagFhdQSVbZu0H6l60evH+fw3
         U648SXlNqty188DNuWrHWiGy8/2lmM3vIb6EId3liZEe5TZB52JSWbvgq761Z1SfAtzj
         8dIwAat7gBpaz5IaLxlrwyLqdBrTrepumxVIS97HDNaEG5dHdiad0dyRq2hVaM7MYW0T
         YQsA==
X-Forwarded-Encrypted: i=1; AJvYcCUpT43+LyfXBECNr2rSVRasvqfQ+sNED+kqafTceZruZUdM2f+fS5apgl1DgNaO6H4vJeiJWTNbXTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG4KMRFpwIpI4ad6Sw59HsIGvJkbKx2UeKF60kGfZut012TDe2
	ccn0SWxeMbYGjyOC23xeE1yGPpTcEC72K+bP/PF+om+dz57PsORq/uBS5ho0QB/wxu4=
X-Gm-Gg: AY/fxX77WjMSCQPJFk86Yzto3bLrTmlJGz+icYh/4XwIdF2jc/NpsIonfmR3Q4GnqgP
	INr7XsvUqpjyycVRJtzQCMVr8mkezB0tzgQvOkgpMC91S+nsQ4ESAR1AwwUcMU2b6qGJqt4LmVf
	6OHqZImLTGj5Ftenbg6tHSaWUTWkwLrOUCskJ8/Lienw7OsYpVoSdR/UJ5kOG/Crf3G9GHfyKgh
	5/JE0ZYVXtMumILqHpw81SqHqaiqw45gSmueducsm8kZ/J0JOWHl/ma3qyM6Z7wrT47PwL1BSCB
	dAYhroe1UHTvjFRAWouJHcj58bH8Bmi9LwAFTLaWE4e3GmMXJ+SLp5WM8lvOhl7NUlZeRdJ6exZ
	u0G6hUYcCWPEeWZh800t7vGQ0fVhqr52LlsPeVLl36ucDqqDW/5JJ+6QG4wLTJJf+kE5yKbpihZ
	aP2lLz1CLJAHwuinMLLaPOGHo8KG7+3vNpAaSNzoxnw+XKocBVGVJVTA==
X-Received: by 2002:a17:902:fc8e:b0:297:f09a:51cd with SMTP id d9443c01a7336-2a599daf6afmr44260145ad.14.1768432762876;
        Wed, 14 Jan 2026 15:19:22 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2d6csm238591755ad.64.2026.01.14.15.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 15:19:22 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 07:18:58 +0800
Subject: [PATCH v2 2/4] riscv: dts: anlogic: dr1v90: Add "b" ISA extension
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-adding-b-dtsi-v2-2-254dd61cf947@riscstar.com>
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
In-Reply-To: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Yixun Lan <dlan@gentoo.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3

"b" is ratified (Apr/2024) much later than its components zba/zbb/zbs
(Jun/2021). With "b" added into riscv/extensions.yaml, a dependency
checking rule is now enforced, which requires that when zba, zbb, and zbs
are all specified, "b" must be added as well. Failing to do this will
cause dtbs_check schema check warnings.

According to uabi.rst, as a single-letter extension, "b" should be added
after "c" in canonical order.

Update dr1v90.dtsi to conform to this rule. Line balancing is performed
to improve readability.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: New patch, a split from the Patch 2 in v1. This patch is for
    Anlogic dr1v90.
---
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
index a5d0765ade32..9fe183f5f5c8 100644
--- a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
+++ b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
@@ -27,8 +27,9 @@ cpu@0 {
 			mmu-type = "riscv,sv39";
 			reg = <0>;
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zbc",
-					       "zbkc", "zbs", "zicntr", "zicsr", "zifencei",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b",
+					       "zba", "zbb", "zbc", "zbkc", "zbs",
+					       "zicntr", "zicsr", "zifencei",
 					       "zihintpause", "zihpm";
 
 			cpu0_intc: interrupt-controller {

-- 
2.43.0

