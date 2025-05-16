Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FC522F774
	for <linux-doc@vger.kernel.org>; Fri, 16 May 2025 03:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747364741; cv=none; b=BXdMwXtBqXIisb6LJ29OJbLXO36z9thZu2AjIYKDXZKVPg1d8nssLZVBsfBDh6iIoWYLQRCf0wG4IsVgq3x7xUGsioQ8MOQoqWtz+QBerZQTi5E/n6+SO7SCKDhxX7JaUMAnjNVKloH/m/4V5dXdOh7TydC2o6ApCTpcdXJ7fhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747364741; c=relaxed/simple;
	bh=rGgZRpxBVOFQLMc4IbKbxX0j+8pNOxLzfGBnh6hfkdE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BLNdmBJuJqRkEIGPqvZmQ7+Lv83zj8xX3gBhsMr1+8EAlEDbh8CZYri+w4ztMY45H5PGI5BKTESj2s2xdFX1H74TBuo0liVHE1Q4UWfqebVCslRnZObtd2rv4pJanV0ZbDSt5VRlWTuLoKqX8aNfBCq8/uC+6JAXYZfknkLmktU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=C00lH8L6; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="C00lH8L6"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-231e21d3b63so1656805ad.3
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 20:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364739; x=1747969539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zkq5aqcqgDyI2pIygo5ON8Kqr2pvfOAQO6NeyUgej+M=;
        b=C00lH8L6fcInmV+ejalOPXNC0FNHPNdv0iMtVHNKBkXBALyyp9ohmY2NpMt/RYCKrr
         hfPiD/PoWGctFFwkQvo34pKWuwOMMqMs+yDKsoazyb9kmzoIxm3ycX0MryIseJmXXNSk
         9MZnCLGYund/T6vdd0NHxRJVVPDgeAPIpBjWEOJP6VKXpPwHzfiaY3/CdCHcvD0SOwJp
         5QvJBOmYlIcuSCXB/N+0Mzi5Du2HJBcmjC6P2AlExtQdFf30qWBpFUHCrxDTNNZwgbXd
         FSq1oNIRnNvjBCcyeRyKlQ9MjKSpt3PCEUxg2+oRclOgd6n68IBkoylEXGF4TLxOpsoY
         cswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364739; x=1747969539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zkq5aqcqgDyI2pIygo5ON8Kqr2pvfOAQO6NeyUgej+M=;
        b=dqQAQOnm3CyHJRgI5RDBDYkzxbreh1joXqbFJiX6SnWHHE2xEHIex48xrRprfDXKhB
         DFw6UhXEdywpq5+dclXUSxNPdr/V+zZ4UPoj80HMs6uosc/0l9sSt0cW6tUf0qwGt8t5
         xV+qc/fMMOIfxA/W2cCRWlIVABO8FTbPfkkG5flacJh7W/nGyB5awW6ypiTesGILU7LW
         GtVXYtIX53tXXPzwYrIFlTJj5L8Q0esW1RkwXIGVktmgdpORo52aHYHE+8JXKzZU7XTf
         UnxsBK6j792SXM5BsarqsB48P8mP3/TpH85oONQyw23BVjuskEYXaICF5D5XvB6l6JK1
         IT7w==
X-Gm-Message-State: AOJu0YzQz+0iwj06inK9JnO8akmWOQ1N+iIHY2eq/fzzkLjIcrJ4RBtR
	1Z/2tZq+MN5z6YAJW/06QYw70sCDmFiD46mggqgAMETO3mzk3cj4BZXUlFfaPhndZeU=
X-Gm-Gg: ASbGncuehduPh7RRdX9fIJBsfIL96l/Y0uKM7sZX1FbvSmutR3xNC6iK9MSbectVaQi
	p1J+jXcvio3vKdbNB2IZ2sBdVif6zvCZJM+vecvx/pBk5l7EeoG7NAHpbNSptZkQ1TiDD4gJvak
	3RRs90w85AMBSHYiWfyeGE+bJ+DDW3Sq5t0wi1qci6J7Jn4LouShB0SGV1GBVVQXJLvx+ygQeV2
	OHg0avxh9ENi7gxLzvzsqJ4hfrgEhJeZ0tNrXmPyrmzDznAMu948Jgw0uZV7BeZ5ehSk0BvV8Ad
	vXkLKFmMNPUECUarptKmljQnB/3AzPaX07twvSX0gzp4KJG/o4SCR/fV2zzs7YsEX87Q2hgk29V
	MjmPZwuW8Tm+3g/fyC6jbRg==
X-Google-Smtp-Source: AGHT+IGhn8VCzQ+upEiABqh6yMLEnwbq/fKp8JleBYzALUrKxgEFyJXQdx0bVgVT74oP9BQ13kZiGg==
X-Received: by 2002:a17:902:d543:b0:231:b7e1:c977 with SMTP id d9443c01a7336-231de3763abmr12204855ad.29.1747364739403;
        Thu, 15 May 2025 20:05:39 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.05.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:05:38 -0700 (PDT)
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
Subject: [PATCH v2 01/12] dt-bindings: riscv: Add xsfvqmaccdod and xsfvqmaccqoq ISA extension description
Date: Fri, 16 May 2025 11:02:59 +0800
Message-Id: <20250516030310.16950-2-cyan.yang@sifive.com>
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

Add "xsfvqmaccdod" and "xsfvqmaccqoq" ISA extensions which are provided by
SiFive for int8 matrix multiplication instructions support.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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

