Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004D81A76B7
	for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 07:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722410896; cv=none; b=CtwghFhGRa0kVOtpvOd/xV7OT2Lxdx7UM5bP/TLZ8Qghhr/o/14nXeyEQdTiVQ71hKpqc3Joc4g783MpaqI7gd3ZeZneyJbN8b+1GqUKsk/Vv9vUfYNLsaQXSfTMlC3J0xIjnPIzegeHsMsGMLZK0E1O9DFLcDLZy3XDo+12LxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722410896; c=relaxed/simple;
	bh=CmTtLX5RKwq4LF8rnnTG1fDkLvs6br7ryZDyRU7huqg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tFfNpra7ugoZNIeCDJcJvwLGXKDicMZFJBtD45ugKmBVUTeIVsnSs5ugp+ml0bfB5fZpHQ/igXzX5vKjtbzp8nH+X01hfvdpRaPG2SaxDOBJVYuyOoW5tftfrMooR6gpx2NUoXScbFIfFiL2n1I/8nvv7ruq+UtorEgUq4tIPwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ZcfM32kq; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ZcfM32kq"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2eeb1ba040aso90112341fa.1
        for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 00:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722410893; x=1723015693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttjywx6Mo1/3X2D9jge6HvTlgUDsJ3yzsugn6JInGgA=;
        b=ZcfM32kqfqq3puQI2vnxu6q1EZ0wDSDuHIWKlnZI1HRnKOeTq9f6YXEf+vBrPw1gb2
         laKur3vznCeRwfX8Sa5U+uR5GK5smS0YfmgxWtCvpk10uLEJKw5yJe9JlTApg9OMb80t
         CtdeYwbeTHUYHoecBQ5jZzJEfNlFgfLG6/L+fAly7sGZG8gkKPhakkIYrZQZBVIwx9x8
         k26YyVumDYtJInhq9LCcjC7q+y+eAVz0VXhHWpBDPdlOi3l5pShNIgrC7SZpOgIj6pC1
         du2y/v0n1Zo7DeWw8nB3m4HxsLPSlteUMLVK0e8yu8TwmViRHwcHklwtLl/YlSADJ9qo
         KxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722410893; x=1723015693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ttjywx6Mo1/3X2D9jge6HvTlgUDsJ3yzsugn6JInGgA=;
        b=qWkgL9bWyzwz6yphYXtod/GijoAcA4UIdbD4DUyvUR9I6hJEeV04IyeQkzALPRTw9z
         TNE6F76lNSLBqpH0/NV2tpEP7eq5VD2DHGL0MCB8vbLxvv4DW3jy6ZYIsNLcY3DonX5S
         kOniwPxb0foc28+FSuG7zhn4hIXQNpx79BczSc9WYEFaOvOWb6L/iAoLcKBBxfzzc/J7
         aFJMcqD4uCdXl84kEw3DAllh97iRvvfXNXpnbRJG8V1n/J+J14HZimB1dtzaXSdwztNC
         ut0eHVCNzIRV8M0kuPKJAtAVhUaI4OEiCC5yWNV4XKSfejN8/6359lGUVJrO7DABvmh+
         sLRg==
X-Forwarded-Encrypted: i=1; AJvYcCUBU6Y0y+i41rNHMoYKBJ/9vmyPqtT8JnOt3eMMy5c/+bDBhrvFGoN4r77O2oQHTXXUp61dA7qSql7nQnshY79AZ8Gk+El+Oob5
X-Gm-Message-State: AOJu0YwWJARkgowTy7xy2mPhjV3MapYFdxLX0HQ8QLXwvCIkSY9T14MM
	X9M8zxh0k9dH2jUGolBhSh0PSoKH7T9E3KY1wklEkPf94mcuS0/+C/UWbxyd//Q=
X-Google-Smtp-Source: AGHT+IGwuD5WOsjtT2bfQ2zXne4CrgHWP6AcnVi1hE62VKVHJr7T6wk/7agmQ1tHhyxNcI20/8ivqg==
X-Received: by 2002:ac2:5690:0:b0:52c:ebd0:609 with SMTP id 2adb3069b0e04-5309b259bb9mr12112105e87.7.1722410892990;
        Wed, 31 Jul 2024 00:28:12 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282babaab3sm10562035e9.28.2024.07.31.00.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:28:12 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 04/13] dt-bindings: riscv: Add Zabha ISA extension description
Date: Wed, 31 Jul 2024 09:23:56 +0200
Message-Id: <20240731072405.197046-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731072405.197046-1-alexghiti@rivosinc.com>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
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
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a06dbc6b4928..a63578b95c4a 100644
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

