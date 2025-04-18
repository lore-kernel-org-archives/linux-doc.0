Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AE4268C5E
	for <linux-doc@vger.kernel.org>; Fri, 18 Apr 2025 05:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744954453; cv=none; b=mgUjxkl+fE8eMjqbqJkOGdoHpjWtyzh58KNFnWQOV9/A05N3z9/bOROtiQZsayQSvzT57iuVTc8l9zFc2KPu9TTqnADCtiyKCGQUcR9lrcb4CmOSwHSLfhwBPqrqlQuugz/tlkbYcCvqZHCI1Jw26rlxEY+1Q+Old4lBeoMc2Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744954453; c=relaxed/simple;
	bh=DX8ANuBD37AaCsG4m/4Vvl9WpEL+PaWaTmB70vSnpr4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=makYlRkphKApnu58UuXwzCINs2xRQxlmhIAPgurbKvIKBgnnqo9HtidA5NaToUkR8c7zNPRDJY0cA+nqDL8a3HiMzxD56tm5wItTuVnsEaXmI1FMsfFiR1PL7aUUcltDahYqcKZDFvhfdUeCVK+i7dVDrXKXtiTGRSLEPXZU8b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=AQiGBQ0k; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="AQiGBQ0k"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7376dd56eccso1606655b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 22:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954451; x=1745559251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/1Q/grKIHBXXJrclQRt4Hnq6m7fwFMEX/d1aTuTzzM=;
        b=AQiGBQ0kCPt0Qp3IPPKlu00o/HxfnUr6+LAof1E0efavpl7+uqvojGdSKcK66lWrEm
         Qj2q93lt+e1c/5gJAufbgy2r/F3zh3MX4fPqUXINJEXc5FveffPJv40SCZDcv3s3g0B0
         PpLxsz/9aOroI8C+TOsKAMNb6BEMSaIAe29JquKdfnE/mr/exHdpPGWh/Um6G1ceoHF3
         +3wuAhOqtmCQh9idBM0z5PXyttnCqpUNt888jvuQFl56f8CpgfjKk0a6c9sPhET1EXsm
         lk91fA++e9vw14Y+yPmR3GQM8IqhbdsbD5DeGmaX6t8Pi8bZ71+HvA35SU0JYEv+QnmS
         BdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954451; x=1745559251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/1Q/grKIHBXXJrclQRt4Hnq6m7fwFMEX/d1aTuTzzM=;
        b=b1ZtrhhHobE8jy5nn217ak8VFBetREK3zk5lFB8D0U4uheMukhhOaCw+qUqQxs4OB3
         vd8VrwTJvDdElcMvTXIr7Ov24DiO7FcOdwZGGfOcthq1HzqFaKFqYVAiGjICvXX9rkjk
         rzsw+gv896Fnfx91ks6tDo9PL5cMxv++s87fCF+kAAkvG37cpet9v93T5Z023e2JRQwP
         7r3u/JbPON1/Xm+2Z+XnZgZOo+SEL6QpSeETCh3013HKcDa+le6NBJJsxgNTDUhcPLmt
         ZZrnxNMjSYbnVLY3OHtz9bqMHFhRUAmCYT/M2noUIBcjfxB0xhkMeocOlIYXIg0W0eik
         mrzg==
X-Gm-Message-State: AOJu0YwcOMzki9MTHJ36qTfanm/95nGkOGfEL3mASvpTOICIJEAGFoiw
	DbIX4YuhuhVT4uNZlA1buDlKn1DmlA1XweAJSTLyPoKx2o5UiMMh7AkMGfqElto=
X-Gm-Gg: ASbGncu197JOR8R0vEGyqapeHqrxvnuoFXjvv1fIYQYr6XvTDR/i70vxS8r4Eu3FDfP
	UEmKwl6ktf4k+6fMU3hMNdwKvqjUW+mDiD479J3PBtZmkq77jaFFOGcDJlFkke3oj3wuoeW/B1X
	e9PyhMUcsYw+G7XWDXGimizKgekUXiFIrHVClQqLJiPA48fa5HmHtKUoWWVyF4R3F9uEJUDmwpJ
	2rDbVTN/Vm5eYloYAykLc16YH2D4htMZDtF+BZrvD7MKeE3Xv60IjUBORvHo9g8K+9yGIc2fXH2
	ALwZ0idpIh3pE0MUani72Z/xl5Q90+Fw/atTkv7LMivbPPT71j/HTAlnLyTcXNvS2DSAiymFrv1
	a
X-Google-Smtp-Source: AGHT+IGMRejlAoVBLGVcqScGqmbNq0551GAav/cav6iV405yVX72VUMx1OuS9YTxF9TkwljSuS7HEg==
X-Received: by 2002:a05:6a00:39a7:b0:736:73ad:365b with SMTP id d2e1a72fcca58-73dc14cca6bmr2149155b3a.14.1744954450904;
        Thu, 17 Apr 2025 22:34:10 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:08 -0700 (PDT)
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
Subject: [PATCH 01/12] dt-bindings: riscv: Add xsfvqmaccdod and xsfvqmaccqoq ISA extension description
Date: Fri, 18 Apr 2025 13:32:28 +0800
Message-Id: <20250418053239.4351-2-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418053239.4351-1-cyan.yang@sifive.com>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "xsfvqmaccdod" and "xsfvqmaccqoq" ISA extensions which are provided by
SiFive for int8 matrix multiplication instructions support.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 .../devicetree/bindings/riscv/extensions.yaml       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index bcab59e0cc2e..d36e7c68d69a 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -662,6 +662,19 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # SiFive
+        - const: xsfvqmaccdod
+          description:
+            SiFive Int8 Matrix Multiplication Extensions Specification.
+            See more details in
+            https://www.sifive.com/document-file/sifive-int8-matrix-multiplication-extensions-specification
+
+        - const: xsfvqmaccqoq
+          description:
+            SiFive Int8 Matrix Multiplication Extensions Specification.
+            See more details in
+            https://www.sifive.com/document-file/sifive-int8-matrix-multiplication-extensions-specification
+
         # T-HEAD
         - const: xtheadvector
           description:
-- 
2.39.5 (Apple Git-154)

