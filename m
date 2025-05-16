Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3617725CC7C
	for <linux-doc@vger.kernel.org>; Fri, 16 May 2025 03:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747364753; cv=none; b=eldCIhMot1Rpe3m+i/zeZdNPzzQ0Tev+GmRNARBi22NNmfbrDUrtRV1NYt29tQATiSqXn4AFycgCghQSkC4UO8niv54y/4MkZER7QfUn4heQlsCYdPspvgSRiJSTx0c6z7cLNhJJqdsI1ax6rCi3wPHwgFZLGN4rm0JwqL0aX4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747364753; c=relaxed/simple;
	bh=WuywEUgD6lUv/g4w4ipAXm3mdMwnrw6kFyN1PZoHZqs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uS3rDhJvBE94Arl0E2QnraUjAsmguy8qa0Mtj3xAclT2Bw4Liib8ESUUgzPUvbP7S8dfbzhnfuDFbTE26FJcot9BgUVYg4h5/U+PTmKztrwNr0K8+j9zWExOkDpCRQeCOpuhBNehFI6vJYWliWtr6UjZY590RAnMsP7AHzRWxhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=fSlZEVLa; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fSlZEVLa"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22e331215dbso20328265ad.1
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 20:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364751; x=1747969551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z7pOHXSYxsUxaKbFAq5uwqDuSfbReGsHyjruZTLt0/4=;
        b=fSlZEVLaS38f52GTEGqV7csENO+rvA58jM8hwYn6EvNZ0Y+QK2hKFZz18f8Y4Vfe6s
         1NAGeeXudnoykcaBFee+VLAVIJYu5IbNWUOT6LL6MmliL2lr9LiXmELfL4nJSgUmC+hA
         4aUkxe/k12F6lpUm0nUSM/f05AVHjWzHZ9IKAwSe/0kNV43UyakhEyraqEfqZFl7u5Oq
         Ye3MkhEpdRmIndV2TBmLjQWXWbRHfWolLS7jb+UM+MocS7oaIxYOcH4VM1mK47seO13X
         YX4Q+4tqPWOnqAeisPxYsmvs+bSmEaR7Vnfkh+ZilEKKhtdLmvO6uoD8gKV373wMTNCi
         DEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364751; x=1747969551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z7pOHXSYxsUxaKbFAq5uwqDuSfbReGsHyjruZTLt0/4=;
        b=ZLrTkCFt3PbyCFVdwohY2yKJNgHnVc0ByXr0tPi9GhcmrAvVOl7FzcmGvh8cu+2wnT
         A6sLQFlgM7ylC+ppVcQ9c1Vvwn4R+OeC3vrpEzgmLwWC6j5+Wp9I5TmkQahakoyeZ63Y
         wYwWrgcG+5vLDH9yEeL9A4tCzjScsg4Cu7d3luWCOr3a/CgQ4pqHUaib0cM7TvnHvy6w
         lAeA3E0xVyH0fswGmpRde/w6wHny28QXWgvrdZotklJJ4Ca/6ULBqYmW3+c9aBWbwfaV
         BgnQEYD5KfArHa1ln0VEyXWA+H40jGJSIhNcPt2UqZzFVfPfE8SILgFpe4SwMe+RJTnY
         Y5PA==
X-Gm-Message-State: AOJu0YzlYoOEJgtBCTwrYsviNJO6rPNSRTkUkYDPSSSHATII29xZa7ph
	v2H3pmFablF2cGS2T5Waadct0FKN11liybN1+U5VUOLgdqwYDYbAm6rCxKo9hP7Xvlk=
X-Gm-Gg: ASbGnctgOzdjg515aQ5u0F1JDtK+JvymsNjXPSIBMpzuLKuSadnizO2VikF7NyqtUYZ
	E5JLTw7bn84pWCPEIslHYx7uZ7hBsL+3MzM2/M07BcyrSmvjqNiaw7P6rcgo7PHm2YrmqVg9K0i
	qJ0pgQ63vQ2ZqqGXDGzQAgW2PtHug++WAw3Q3qffdXCNKvzLfrLe6ZkA+0KT9l9tba6TFlny45Q
	K1FHihQFTVZi/BdIu/tLlr6+Z3J3juKt2P4eIRBCZy885w+AnmZsWAZjoRMXaPYwSofXuWlwuqw
	FnFrrPbm6GM7TTDKIuPikx0w2ytJ1+bLJ20y3Vp7xcSHGri0gDlImiuRXCIDwITnAzYTr9cat2S
	ExuzVz21Lltk=
X-Google-Smtp-Source: AGHT+IGSGQ1o4EfU6jvKJyK0KdV9naUkb1bONkc5+6ZtJl7+1gHYypaxCkXBkgWg6FreBtNlhcplKg==
X-Received: by 2002:a17:902:ccca:b0:221:751f:cfbe with SMTP id d9443c01a7336-231d4e64450mr21068285ad.19.1747364751569;
        Thu, 15 May 2025 20:05:51 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.05.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:05:50 -0700 (PDT)
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
Subject: [PATCH v2 05/12] dt-bindings: riscv: Add xsfvfnrclipxfqf ISA extension description
Date: Fri, 16 May 2025 11:03:03 +0800
Message-Id: <20250516030310.16950-6-cyan.yang@sifive.com>
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

Add "xsfvfnrclipxfqf" ISA extension which is provided by SiFive for
FP32-to-int8 ranged clip instructions support.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index d36e7c68d69a..be203df29eb8 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -675,6 +675,12 @@ properties:
             See more details in
             https://www.sifive.com/document-file/sifive-int8-matrix-multiplication-extensions-specification
 
+        - const: xsfvfnrclipxfqf
+          description:
+            SiFive FP32-to-int8 Ranged Clip Instructions Extensions Specification.
+            See more details in
+            https://www.sifive.com/document-file/fp32-to-int8-ranged-clip-instructions
+
         # T-HEAD
         - const: xtheadvector
           description:
-- 
2.39.5 (Apple Git-154)

