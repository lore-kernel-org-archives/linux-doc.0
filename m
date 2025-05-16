Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD2128A1F0
	for <linux-doc@vger.kernel.org>; Fri, 16 May 2025 03:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747364771; cv=none; b=hcDntko9aga4prGPPof4VnOAzrkaQUEAekUX9bAKS+Dle+eumBhXNy8iXLfhPNUn3K2M0b2jNxj8lnpf+ycuuNCKQrMQqvxoz4hoRuNwruqSZ4NZuP3n7SBsTjXDSq7Z5l9R2hB1Prl658ur6BqPxKIwn6WaIEaXqJutm9ZgWHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747364771; c=relaxed/simple;
	bh=rf7VTAibhA1rsd++vGyUgsQGxAKMW4BWzucsOsuCqgw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C5FDYI9STc4hwLpPCSBfjWP7SzqZAVJcLHEkGyLax3tMkIz1lwqztVNqW5rV4G4cGSDXgD9p+Mpoo/bSNB0DjeV2D/fdqVqaxJZyG9mvK9Qf2DPWiuOBqoKhjv9K3/GMdnQCYdoKEJOvHs5+V6fk5od4LvU2HFcS7o1pR3l7m30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=ANohnbXq; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ANohnbXq"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22e8461d872so15380095ad.3
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 20:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364769; x=1747969569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAvviClstwfzUPfEFvJI1cAxXcDrrh9fZc4W+cMV6/0=;
        b=ANohnbXqXVg33Fh9fo4yuH/UVf8/s27vpKx36DmXdWsJ3ABJB/kZsGMAnF14nxTJ9s
         SvtpUsDdcmmWkeAs2SviehODZ8fjYY0lAIdeoSKMSplZUH1kfyx1LUkz/aQmhcK9oR6X
         pBCnfaZuXHdV5ObJ8rCJuFLMRaTwxNZ3wDOmuRl9HfGKp3kRrYtkWO0fz5NMmjUgZR9O
         gH/gRGRgBCuQe1sPybd6CF50KzRjeRSv/PGRWFHrySupvvhpafC9JUqy6i2EYOaJLOpg
         wHhouDT8H9EsD/KDTvdBaWiRBxN0BmwA9mktfY36g990U0o+Fj8VColAZG7RIDZ9BC5R
         OYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364769; x=1747969569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAvviClstwfzUPfEFvJI1cAxXcDrrh9fZc4W+cMV6/0=;
        b=fkC7wf67KFCWbxh6qptKYNGpz3rzznbNFKcMYb1Uok6+sKVeaT4Hbfsc+cxLvO6i19
         U4LY2hqdhk1XsP1PGly7SMU4ZN9f1MIZqfJTXJGclfKLNizDuAgqKv+Co+4W/epC8tbl
         eKpuisr8yo9NLXnFn4OTUOnxXmkETczutD8BYoFG9ONRmKe0ykg502jDivWLg84jgZM8
         vZb66A8hrvNlsURoUAsfIbgseV8h5gEpQUodMHDkCj+CwwpW+Arh1HYM1R3tBcPltSBO
         53nJtW9jxGocy4HqyopDIG5mJQ94WBwx1KcQppLKAbWyx9VtwPpfwGF5gmd0ankhl0GA
         yyTQ==
X-Gm-Message-State: AOJu0Yz8NZyBHntNrgfjNtQ1p7Q9JOle3cmJMEMYIfhCTHf+WaiI/mBO
	vujK4XiE6EWE00ojkLj0H33t1wHwErMlkKc1Na3EmBTtJ5UntY0EHGRtIqWTC6lgf9I=
X-Gm-Gg: ASbGncsoHjcF45vR6CwEbTi0eVLlpsP5W0J+CZO8axpu8jmm2s3A9axZKLkbkq71e61
	1RVNO/fetXcIKY0xvuDsDuS509TIWm3/3nu1EyMTcIWAPQD+D+i3Fa3HS+vCCGbK57Td661S6m3
	CNz0CBh5sqGt1qshUdvWDU/VNIh3gZb20IZ4F1aMCCo9mDM8goY7N4JMBhh11rUjKGhLOtDE78u
	LDPCYe+iZOkoUEpJieTbJx5og1uzuxQrN0X6pUF0GSDrWVCIq8FENh4LkHWYA3vLWz6HIyUZVdr
	s1Vdt9MBy+1lsyDk00fHPKXvE1HR2vGhIoBnZ6Ikp9k77sD0M3DCPq039MmVQplu3V9Gy08LGiW
	HXVM+/GVl3Ig=
X-Google-Smtp-Source: AGHT+IHVpCZywGkosLX5RQG0/6A89Lg45RQ0IyzHm6KOJO4LmSTZatNjMavA6pelGe0MU+ect8RLXQ==
X-Received: by 2002:a17:902:c951:b0:211:e812:3948 with SMTP id d9443c01a7336-231d334d209mr22719205ad.0.1747364769522;
        Thu, 15 May 2025 20:06:09 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.06.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:06:08 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH v2 11/12] riscv: hwprobe: Document SiFive xsfvfwmaccqqq vendor extension
Date: Fri, 16 May 2025 11:03:09 +0800
Message-Id: <20250516030310.16950-12-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250516030310.16950-1-cyan.yang@sifive.com>
References: <20250516030310.16950-1-cyan.yang@sifive.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the support for matrix multiply accumulate instruction
from SiFive using RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 Documentation/arch/riscv/hwprobe.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index e15405e12239..7c11351b1383 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -353,3 +353,7 @@ The following keys are defined:
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF`: The Xsfvfnrclipxfqf
         vendor extension is supported in version 1.0 of SiFive FP32-to-int8 Ranged
 	Clip Instructions Extensions Specification.
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
+        vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
+	Instruction Extensions Specification.
\ No newline at end of file
-- 
2.39.5 (Apple Git-154)

