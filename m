Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043BA14658A
	for <linux-doc@vger.kernel.org>; Fri, 19 Jul 2024 16:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721405967; cv=none; b=NWZTmujYN2Zw8sDNxBkltdHQ5HIHmCoDjhIPhxkkgkf0cNJktEfOEqxOu6Lfjh2QYGb0fmuTf+wDE8Ob4qqfcYA5WGM2uvI2bwm3k9IMCeNWY1gEBXECQGSF2weSeZMKvx/ydUfa6RDbyXqIuLZHSDdN57uRiA+IKKl+ril9r6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721405967; c=relaxed/simple;
	bh=2W48pS8YjVGGuKgFcdTY4JQ+czvhIHjQutLR0sMQn0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bpKyXCa4ezTrRK0DSSckJ2DmZ8xqAIzE3A+Q/wsATsBn58VhHdUndk/777czPkvYUmmPxRv1p3jyWCy7FGtom9XQr2BAyTfNThyPD56Juc8KeZ/O1nlxC/Q0uDLNzhxCTbD4H3zK1qJUZvecc07P5xAdZh3qHxwuIVQFbwrJp5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=vLfgT5W3; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="vLfgT5W3"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-79110d8e459so1487649a12.0
        for <linux-doc@vger.kernel.org>; Fri, 19 Jul 2024 09:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721405965; x=1722010765; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFlUlKNClOcGHl95zNXTKC1SKxBdILei2erBqjtymyU=;
        b=vLfgT5W3x5RbXUQARm0SjSj9UKSYFLZmC45NKxvt5gQ/WkqkF4+JpZrXVzyGWQwHZ2
         GL8X1+HEDREXcsde0gw0zHJchR8zmeQVdVxrKjjVuea71UoFtf4SVXhhIEKW6e+L8C+Z
         eYsQ+XUMye+1x2u7NixnytpZu5v/b04QuebyTI31PmVjiu5/zpOAzeTxtOh4k64h+lz9
         JplGT6Gc3/AWO4YQ3bfj6DuK9pQLEn6DUz/IaHcaQm1zV5+BFZir4IzQQ3JdPYCWjzjS
         BxAYRaV4dnJyQvFOH+5+jKr/9nuGAnqIxZo3a6oTG29hzwTYeI8pbw3ZOt1A9vRizGIg
         EucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405965; x=1722010765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RFlUlKNClOcGHl95zNXTKC1SKxBdILei2erBqjtymyU=;
        b=G7XCXcpJsZoAr1AnAUhyxCbp05pvsPLAq4slALNtVBxCgkDcRA9XBZUVDEv9wXix9b
         xHo+nem517dyhKRx1MHyTjqmfOq0zXi3xfCPcvAAGFfpN7vnlip0vtmPdmBII9/Dojuv
         KWqmI3UgD0v6/Jfuqh1iXi/iZaMLm9mkmlx20n5yIVcNRbNTYBVo4admqf5mQwlScmTv
         cgCUsVFtHGI/rpM1H2f7wjBlZDShzCER5d1tjRGTnkVb6VNFvL3TSExtpEB/YLzBmMhN
         tUETspWFiSdqP1kGxqHIyR5niUvyFbkSiY3na347uSZ9DBi7RnvtqIiXJ5YpVNUhumNF
         wIxw==
X-Forwarded-Encrypted: i=1; AJvYcCVXkoHk/xNKSuK9f6ebZLcaEG4qS00wDbQ0CbOtfIqC+j5T3sd6C0s7duCAzbdzHwI5sdlWLct1ydTuKDuvUu0pjzfrQz415hVU
X-Gm-Message-State: AOJu0Yyq5TzUFzXf0ntJ7JZk98ABBDAIKvHedoLecWds4XJYBpIC8HGJ
	BcxDxTTn6vMGVNfuZ94Xr2eoCYgK90WoNjh77xY69R6wNCs/bSV3zXoNlVlcjXU=
X-Google-Smtp-Source: AGHT+IG+HB2jI/StGSr1RNoXn3VLStcFpRF57Fl88HYhdj4U0L5ilYL3NbTS5IfVnDvuqFD3dzZ+cg==
X-Received: by 2002:a05:6a21:99a0:b0:1c4:17e1:14df with SMTP id adf61e73a8af0-1c417e116f0mr3471831637.48.1721405965448;
        Fri, 19 Jul 2024 09:19:25 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f490dcbsm6461435ad.297.2024.07.19.09.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:19:24 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 19 Jul 2024 09:19:06 -0700
Subject: [PATCH v5 11/13] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-xtheadvector-v5-11-4b485fc7d55f@rivosinc.com>
References: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
In-Reply-To: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721405940; l=1260;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=2W48pS8YjVGGuKgFcdTY4JQ+czvhIHjQutLR0sMQn0M=;
 b=b83pN5cReLz65nLlW1uCxPTq92FYXBW2GeKe7Fpuvsl6LxGyKXlFlAxAXBwI4XgnBGKqCgHTD
 rGs33ThNbkIBx9DcZJKtD9WQGIoUh6HL3J3yb5Xn9Bv0sGlcUfNgfXU
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Document support for thead vendor extensions using the key
RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 and xtheadvector extension using
the key RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 02eb4d98b7de..b48a06ef80e0 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -264,3 +264,13 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS`: An unsigned long which
   represent the highest userspace virtual address usable.
+
+* :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0`: A bitmask containing the
+  thead vendor extensions that are compatible with the
+  :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * T-HEAD
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR`: The xtheadvector vendor
+        extension is supported in the T-Head ISA extensions spec starting from
+	commit a18c801634 ("Add T-Head VECTOR vendor extension. ").

-- 
2.44.0

