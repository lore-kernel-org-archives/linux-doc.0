Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22120389462
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 23:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768432759; cv=none; b=m6D6we9BIW2QkS6RfYepXMnExpa7dXOd8qKdW9DFKalry2afodUf8tikSDUP7DOm+x9Wgs49BDa4+tcnOl1rjp/P9DFa01PlBZFjEpjpPf+CVBcefRt3PIsIqDAGaSL3djBJEPdUUVjyLBX4VCLHILhaZUBDGGkYVAmC7jEoqcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768432759; c=relaxed/simple;
	bh=Z0/JjbecIj4mMFn/eww29bfEtMYsLkii0TunPLdkuaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JG5T6L8WsR5w4gKS//xRYytxxVjeBO8QFl2iNpfYx5FuDnSj7toG6Ql1Ll8aBEPtd+SDxwe4ht2UgQm6m6ghaafS7csEBqYaWlWYYzADDuMm32M13z6bYZ2D3P4sI4trmF6mN4uvjlN0Q4S0WQyF0rGfTHyB4RVZbYusgkWNIoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=3L3Uarpv; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="3L3Uarpv"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2a0bb2f093aso1901115ad.3
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 15:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768432756; x=1769037556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nbmp2d0HgOyIl8jX1BIaQZ3qrfCn/EZHa3mK+NXd3sU=;
        b=3L3UarpvnoSE1BCkAKka2b7aUvdBkeMooO4+u+QtHXxwmnHvbVYgbzKSIbb+IAxdp8
         nhcs9SRu0SufhLwfZtRjwgFmk61McJd8l9WBe0GniszTEdtuwkztc8zOVgTDklHmdD78
         s93vKB8GzW6F1mS1gAKmBj/FlFIQtAInVtZHU88I4C3bPAPA3DQ2WL6pM2euTs2GCwvD
         6BdiYHEh3URw6UKogpHvfu3/3cJu0UuNc/eBGiy8KA78eJIFX1SzEJAylX500mfUtwfb
         YmpGTWLZVROoYHls/XqsP5IzRpwEhsaTLeMhp4JDbU4RfB8Lilj023qni0sQWO4opkvI
         XTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768432756; x=1769037556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nbmp2d0HgOyIl8jX1BIaQZ3qrfCn/EZHa3mK+NXd3sU=;
        b=Hlv9kVW2WjM82X0sfSvo0UJ+wyTV0I2GDG73Jy0Sv7Xn8kfDTkdVojj9J1Fjvxf54L
         731WykTWlR9wZxfLnsQAY+oB7HhRK5YLbGN8/JjcaUsh6vdjkuXvAAdrfq3x6XrHofUY
         XDrp5xBxpisbgHHWMuuN5Jx72A20wny5BeVgjpoKkXBzPJsvMZPsH1xWF9gXIkQIN2Pd
         Nfl6UpuS7z4mq8CLdTQI+p53JD8nrTp6wb5IQyErXNFe7osWrB6NeeYXboR7G/jz7fRf
         hDRfR6j7aAwvIEB8KJprWuy+kt7wJuBIMJGPu1RwndufdMyiAsw+qfciQgTdGWSLy6Zp
         CsYA==
X-Forwarded-Encrypted: i=1; AJvYcCXNbz6DyJtjOeMHMMOUyzxcgM75Vt6B+iWVi+1v7WplLwg53t//ith0n8vRTn/12pdL4H/qUuY/G28=@vger.kernel.org
X-Gm-Message-State: AOJu0YxElvXdpOrp1DpIyr5d2mZA5j7T8aJ6MLKDQPfX8FoEEX9vk67B
	ouCwIByYwF/Y4N7VedK4E8HaUKarLvrRp4tm99WjJ6MPR/bui276IstdoggsvWUPNbU=
X-Gm-Gg: AY/fxX5iNu1395LpRCfP/vezfVLh5cTq94MHoVdN+XHJk3NwJjLmC25WHLh8LhURfs5
	RSGQzy7U+hpMcuRvPtcXFmpCO9G74jXK7+qLoVYaDpO1NlEyhu317SF71BhC91FOyhym1/Ihr9i
	vFzpJc6pCFJs7zpL5mwQ4Pc44d6IGGUtZcwLqdXBOha2cdeTAPCE+J8eH0G1YpyFZ5RFPSLYUBC
	CY8JN8kqFyFzVqp7mQwAlKyG6Z5rN3+eBwOKw2c52EMm1RjuJRQlik9v3t3XDvpvTjMUlbJ88b6
	DbpFx5sVM1tR9tMUxRDSMDcP5Q0kejtwK8r9EpoPyUQckE+bTBeYvq2Ku9AjxG619o87QBmp4kY
	n0QOR6AKIIGKFgI82hJirThnimGthCTpVBdtazTI21qxoxZp0aa0d3ByriBCkpeAcfnRs/YIEse
	ekbGS3uRvUdxZkW0iY5bI8aGyRfn5k/x+DG7Cffc/kWHgop8unbvFIuVLRbKZbSZ1k
X-Received: by 2002:a17:903:3bad:b0:295:3584:1bbd with SMTP id d9443c01a7336-2a599e8edb4mr40339635ad.41.1768432756448;
        Wed, 14 Jan 2026 15:19:16 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2d6csm238591755ad.64.2026.01.14.15.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 15:19:16 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 07:18:57 +0800
Subject: [PATCH v2 1/4] Documentation: riscv: uabi: Clarify ISA spec
 version for canonical order
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-adding-b-dtsi-v2-1-254dd61cf947@riscstar.com>
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

Specify that chapter 27 refers to version 20191213 of the RISC-V ISA
Unprivileged Architecture. The chapter numbering differs across
specification versions - for example, in version 20250508, the ISA
Extension Naming Conventions is chapter 36, not chapter 27.

Historical versions of the RISC-V specification can be found via Link [1].

Acked-by: Paul Walmsley <pjw@kernel.org>
Link: https://riscv.org/specifications/ratified/ [1]
Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA string ordering in /proc/cpuinfo")
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Add Acked-by from Paul.
---
 Documentation/arch/riscv/uabi.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/uabi.rst b/Documentation/arch/riscv/uabi.rst
index 243e40062e34..0c5299e00762 100644
--- a/Documentation/arch/riscv/uabi.rst
+++ b/Documentation/arch/riscv/uabi.rst
@@ -7,7 +7,9 @@ ISA string ordering in /proc/cpuinfo
 ------------------------------------
 
 The canonical order of ISA extension names in the ISA string is defined in
-chapter 27 of the unprivileged specification.
+Chapter 27 of the RISC-V Instruction Set Manual Volume I Unprivileged ISA
+(Document Version 20191213).
+
 The specification uses vague wording, such as should, when it comes to ordering,
 so for our purposes the following rules apply:
 

-- 
2.43.0

