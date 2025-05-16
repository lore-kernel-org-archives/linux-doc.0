Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABD9289E1D
	for <linux-doc@vger.kernel.org>; Fri, 16 May 2025 03:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747364766; cv=none; b=bPCzdFYdBQyW7vcgjvBI08lYGPbGbvodclz+DSJiFpabggyC/ZvdHphfiDcecYTcUcGWaHofdXocKynC7hCA1ANAH5/8REviNoot2QfaN063JUF6OjyrnGcTj9ymTSvYbsKL6QP4MP5qeRry1LWtMCTbp3YIMGC0wc2xy6xDH0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747364766; c=relaxed/simple;
	bh=bhQWzwzdrX7ubPUq5r19cW3FDkwf3YUojySLLaA/ijI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VL2+Z78UpCFl8UUunN4/G72bQUYKK9Dp6meWq8DWaXujXOTn5E+w2lw6guyS5W+lNk3sgUECbKu0SaxC7XMklsRRieNEbToRxExfAK8F6sVZ2dWV8cPktVqfc/Th9lvnKSS3PO0NHyQoZv97LSbHcfGejiY0oqMstdikRCzU8jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=UijzKf/V; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UijzKf/V"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-231c86bffc1so12251075ad.0
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 20:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364763; x=1747969563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weomedr6rI+xMErQTjwbgFjghxDoWxu8k2ihmuNB5oM=;
        b=UijzKf/VcEfqbeXlziOtxoPFpRU9y5goOesPHRnvr8/Nf0uSf8MHpGWgxVV+EFkD6+
         797+ODpV+7Sonuv5d+WPahftrIidp5aO/I0YHy8Bi3p5BOb5y4ssmtV+SW6SG3b30T8r
         k0eFHHDG0Q55iq76n/P6qDlT1YrgO/+iy9iIevCmO9gyrUuaTDaE2ju1wUKucgC5X7NI
         xttcaBERMz4S251AFKW1F6fPMO+aRobhh4ytPNKIOFnvhDKJsZA6diE4CsR1wdzo10wL
         17kneljzMRgJA6A3p1p2lbRQDRqqW4BOqclwplwQhn9nn7Jb7wgvxL8NYCQCBScczrqG
         w9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364763; x=1747969563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weomedr6rI+xMErQTjwbgFjghxDoWxu8k2ihmuNB5oM=;
        b=wqv6cGLN1DK/yYs+Q73fPZpTey6rF5gyWiXUQSerp6CEJvk+Stipum5rW9b7DmP9LH
         9L4OUyhO7TxKAnemx1LA5nQ/0k2ZJihZ9AfdnvYVOn79POWf+bdnehP2gEfYgSCibkWG
         dcA2OqOeccUG3TqN3Cbxyht/eWzEvYc4sAJFM3outXVnIjY5+j504d/YwsLngxGR8fBD
         bQcwHupHn6k3Xj90LOdD0TYg+ZQBaiQhy7a5S3lHgXjO5Bk12bmiu2zFifoATXqosPJS
         0lyBm5BegHM4fEGWe6FmKmPgLHp1glvmvAMbWG0NEyvetBxZC2Mrc1AuvVE/at5HfQsa
         jbpA==
X-Gm-Message-State: AOJu0YwKvl4NNMsIq82NSQULR5f7bmXCW7yeeTNghSmJq9aq1DLjV+pk
	B7dOcURHhlOCQzDIHuiBNwdnYkq6sPshex7sMRB9VE2XAgJYC/0s6KtNPLlotZV2QEI=
X-Gm-Gg: ASbGnct82L0eeLkbAxRcbY4ITdx7XaiO52EYODt+AyKjFjI9KrmFiZhCDkmx9Qsy84u
	JkXcJJcQ80jqDqOrXe/h7/eWcTeCFQuvvegMu1nDvwN3PAOIdTxb/EIG5esOUEt96O0IpLqgeDh
	YnQY4DAkDIwpPdMMnR6DVSSwjng/3WG5JdEwNjJNg+K8mpVk7pwYEvfUuONBaIrM8+B0kzjH7p9
	VFDpbR4QA78ak0aalTpBMELy+RdWMjsq5kyPqUSgkVR2/8UmlV7DX8c+a49+igZR2t0eog7yPZ3
	mKjHoeeNXpSymPlDij7YvIlFncbWVzaCcRMICcqfCv5ehITgjWxKdQ7Zj4kc50S1G9yaLWEqGGD
	WatFB9PJFgl4=
X-Google-Smtp-Source: AGHT+IFhBAB1eXwbz44Tr8KVKAa/EYR58v7s/kJ7HdKTeaGSBrcNqWOoBWoIKH0YeOJevu/4lqzf3A==
X-Received: by 2002:a17:903:46d0:b0:21f:f3d:d533 with SMTP id d9443c01a7336-231de351537mr10196975ad.2.1747364763529;
        Thu, 15 May 2025 20:06:03 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.06.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:06:03 -0700 (PDT)
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
	Cyan Yang <cyan.yang@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 09/12] dt-bindings: riscv: Add xsfvfwmaccqqq ISA extension description
Date: Fri, 16 May 2025 11:03:07 +0800
Message-Id: <20250516030310.16950-10-cyan.yang@sifive.com>
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

Add "xsfvfwmaccqqq" ISA extension which is provided by SiFive for
matrix multiply accumulate instructions support.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index be203df29eb8..ede6a58ccf53 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -681,6 +681,12 @@ properties:
             See more details in
             https://www.sifive.com/document-file/fp32-to-int8-ranged-clip-instructions
 
+        - const: xsfvfwmaccqqq
+          description:
+            SiFive Matrix Multiply Accumulate Instruction Extensions Specification.
+            See more details in
+            https://www.sifive.com/document-file/matrix-multiply-accumulate-instruction
+
         # T-HEAD
         - const: xtheadvector
           description:
-- 
2.39.5 (Apple Git-154)

