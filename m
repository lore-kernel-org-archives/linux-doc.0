Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF773171D2
	for <linux-doc@vger.kernel.org>; Wed, 17 Jul 2024 06:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721197325; cv=none; b=uRlFJi2aZwgJAqizhqSdjffFeyE74e0kDqWKJjWVHhXViMaaqRxkRLNILTXS5rwLX+zAZASYf4en0Dxq+LEU0eye65oEvXDNJ/Po9BHAJGI98D1gJkFUgTuggMLrRihU08l9B0XZGhLsNXAFR0qRkf65UtfSsJ8OY1kvEXpK66M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721197325; c=relaxed/simple;
	bh=tYSKztlvYXjqrUVGqUlFZcjNQFbhaN4iVt2oyZFJdVA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZAI5ZWWvjPx6WixJ701z2q88xiP+M22C7oC9bvqJrQrFEypXEjDcorKh497smr8C1pL2jybU/asQR3sFrpxp8fn+2SN2NsY53H8P1WNmyLAME0Be1gJ6xW6zOy5NgxyRa38HB8V+k16msCvOykL0mfJC/ntcKbSk9Lz2iHbdYBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=v5D9HJzy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="v5D9HJzy"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4265b7514fcso2173995e9.1
        for <linux-doc@vger.kernel.org>; Tue, 16 Jul 2024 23:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721197322; x=1721802122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6LJZCR61gmm4dvekAa0Q1TIoLF/ScrG5TtOv9gDZ/w=;
        b=v5D9HJzykvK6DabPsxgMNqvbW0n51rd+JSbAtFnwceusBsHjz2wdH3U9KMJgg3pTYg
         9P5/rvGxRfjFwCgfF95hHSw5MNO1o3vxeI5y7/Q7OsDEjsWa/QCBSlDLLd9MY5C+4fzd
         tQOzriEYeDbL5YxKpZNKLnu6M9ZaC1TQU2jxFcbbIZ5njJ63yV42BlukYZ6TMnf5xnzz
         1e7u0W+ilvjaa6skOURXZN+VWVX/I6DE4TvKHnbqWTHquufyqGhCtDX5w+6bc1kzVeMN
         Vk+hywQr5W4Ks2X5sZ5soeFKqK5pBFef6h9N8BVcfm5pvn2c1SEsNQb4M+yx4+QGWunA
         PCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721197322; x=1721802122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6LJZCR61gmm4dvekAa0Q1TIoLF/ScrG5TtOv9gDZ/w=;
        b=TtLG2/jwGnmifqhd3T4bS+qB92vHD0BTgz6fcEpTtj/eDJUa6RSAh0v5CP/rD3HBZl
         DezxlRdruk6TBMC+sYzq9obY9cokir2K39sT5Bkcmt88cWm33lg+IseqcOj1yOPPLgrS
         kdlA6DKa6B/8lGFV8WYuQJxPju+ithesRR6qjTNspFkdD2pagT73d0wj4it4rcpjMdPg
         tm3502eFR1+0qqAwbRRVOdtwR+TXM1/W7ohn1aYBGDGtVO9tjRdvMpSydZ+u+Fz5PdcK
         UuSUn23A6OmHapooCyLc8bvfPnWrnB1KUqQ6ZcEjkCm3b21VYIs7sbvFNZF47J4p4/Do
         SSMw==
X-Forwarded-Encrypted: i=1; AJvYcCXDOCV/x+Iyk1fgNNmRgPIIjNYTjK73ZqBahhUBcScdSi5ETYGd1wDrQarGX7I2iPJ+gyB8ydyx034MJnMT8cdSqCa3jZvM/UKm
X-Gm-Message-State: AOJu0Yzj+vaiFOvXWCsmZoqP4nIql5ppbTtVdFFnpDELjkZ8ToL36ug9
	E6cVDZ2XKOOX5PILIs9nPR7haiGh8sfqtKZqmFRufA+xh7LYQCHPGxpPFdfCCC4=
X-Google-Smtp-Source: AGHT+IFU9J5ZIoNE9rhylPtawNo/bVXV/Y54qi/t2Pf5eJSgSGKg9qXAA/fSZkpR14Z9Af1ks6C3xQ==
X-Received: by 2002:a05:600c:1d28:b0:426:6981:1bd with SMTP id 5b1f17b1804b1-427c28fa6a5mr5014165e9.5.1721197322313;
        Tue, 16 Jul 2024 23:22:02 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f23a000sm194474825e9.5.2024.07.16.23.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:22:01 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 02/11] dt-bindings: riscv: Add Zabha ISA extension description
Date: Wed, 17 Jul 2024 08:19:48 +0200
Message-Id: <20240717061957.140712-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240717061957.140712-1-alexghiti@rivosinc.com>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add description for the Zabha ISA extension which was ratified in April
2024.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..e6436260bdeb 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -171,6 +171,12 @@ properties:
             memory types as ratified in the 20191213 version of the privileged
             ISA specification.
 
+        - const: zabha
+          description: |
+            The Zabha extension for Byte and Halfword Atomic Memory Operations
+            as ratified at commit 49f49c842ff9 ("Update to Rafified state") of
+            riscv-zabha.
+
         - const: zacas
           description: |
             The Zacas extension for Atomic Compare-and-Swap (CAS) instructions
-- 
2.39.2

