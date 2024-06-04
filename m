Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2DA146A62
	for <linux-doc@vger.kernel.org>; Tue,  4 Jun 2024 12:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717505240; cv=none; b=TL0/DCi2MRQ7er0nNk4/eaVUfnvPbh5M37W710mPlsXtGx5uLCXmsCBTOwHh2fiXjcDP1M2htXwLV4qXB2/zGA6SQl2/E9gYiv2GYJ8eRUFMidjctmhscCTkHkhXplQd5Di+zzJGFOoSzrLAzoogdxbs6zjavqxn667sO4jPCwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717505240; c=relaxed/simple;
	bh=BeTgSd0+/cjAAYS23pyY1QSxXrTM/CfR+Kb+Gb5WH3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VRwQpeEl3EDjcoPlla4Z3/fEbreGx+uNfARLuiGnRtscGbht3S3yz/3J73bKU02ApPhIXwndY9kJiry1izsyQGekiAas4aUyLRYtCEvTz3QVYuo7jWQU7nvewvAm9FulN8lvHL3oBO/qCCtgVcRmKa2ZaTUtEzaIj7MBpHMQevM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=BrWG3W3M; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="BrWG3W3M"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f61cca4a17so3706335ad.2
        for <linux-doc@vger.kernel.org>; Tue, 04 Jun 2024 05:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717505239; x=1718110039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDggCbJq5xAgdt5U/mnZ4/8n6MHnmjzG09lZvHegJVk=;
        b=BrWG3W3MdLdBsAlySBsEDS1VJcm5ESRHlXYwVzaWrADGgQKgyidVMzUC9gHLNCaLer
         T6x7Zxo1dXpAQAzM8Iquo6QbX3bNOn/Q7aFiSAaISwGnMBsZlRAhNH0VsvyN08RYtjxP
         KdcxF5Qx8YAoezWZ4uWSyngWjZVOo5/LY21tmXWJ06lmrLYA+EPs5egwoAOZ+BRqHAhM
         6+WKgMBR8VZ+FHZ+lNH8P7sF1zzGwnqxvxf1cPb70z3MUxls0Ep1nbp7A5cRVoCs1R8q
         bieBmJK02GVH9RTSrhESb9yio8DU0n1Orx6JXWmrikfxVZIXXURnaawGJhaDQiMLJ2aJ
         sK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717505239; x=1718110039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDggCbJq5xAgdt5U/mnZ4/8n6MHnmjzG09lZvHegJVk=;
        b=g1VxkcOILK2T2lPwdJZJZokTvV+JEivBeMAAFecfEV0qvg28u2Tchef8EW2N8zockY
         I0Hy9I9JG/ILm/dL2NyMYsamq+6FyepT8qk3RE8LFqKx8VhjoBHhQWBftPbL/oObb4po
         5X4Z0i7C8+csZ3gD5G6fjz+BSrzGN3WmtAsK/NZ+EuPh2eSOGlMsQcZCSEKzuEMJfvRK
         e61s2OR0VMlkiY+Rm6gqk5Uu/XBG2GiFshlCx4410IqeRkJlXoa/WjQZuu1pTjhKneGH
         5ECqDqJq/TS1w51wuK4JvdOPMwdT55+/IZUWza6k5PGsCxqGWbkiKmC2qByrSfinlB9Y
         dnhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIyrWOekPqIzdZwnbMiEGU+8UzVF3QgHCB6XMhbVMbHbYt+4sjyBmjv4tjDUl2QKVPWnU6mDDDxNA0ziEq7NqrcF7jtRt1mpNm
X-Gm-Message-State: AOJu0YxJ6gimQK6RCYb6LeuY5FONwO9ge43vQ0t7I1kSXVMLmz4UsdGi
	3KD8mn8qpwHFWfhy362EPIIsJMSguhnX9/U5SQngx5WPTm8eyutg1MfjYvq3Dho=
X-Google-Smtp-Source: AGHT+IGQMTJjGTRyExe5WucoZYIN7+QmoxG6l4x/LYMJNGm+8SMfBCqkxppCIaA9Kdjsd1UwcvgPcQ==
X-Received: by 2002:a17:902:c952:b0:1f3:453:2c82 with SMTP id d9443c01a7336-1f6370c3578mr132333805ad.4.1717505238694;
        Tue, 04 Jun 2024 05:47:18 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:327b:5ba3:8154:37ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323ebc69sm83042885ad.211.2024.06.04.05.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:47:18 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v6 06/16] dt-bindings: riscv: add Zca, Zcf, Zcd and Zcb ISA extension description
Date: Tue,  4 Jun 2024 14:45:38 +0200
Message-ID: <20240604124550.3214710-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604124550.3214710-1-cleger@rivosinc.com>
References: <20240604124550.3214710-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add description for Zca, Zcf, Zcd and Zcb extensions which are part the
Zc* standard extensions for code size reduction. Additional validation
rules are added since Zcb depends on Zca, Zcf, depends on Zca and F, Zcd
depends on Zca and D and finally, Zcf can not be present on rv64.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 616370318a66..81bce4fa2424 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -220,6 +220,38 @@ properties:
             instructions as ratified at commit 6d33919 ("Merge pull request #158
             from hirooih/clmul-fix-loop-end-condition") of riscv-bitmanip.
 
+        - const: zca
+          description: |
+            The Zca extension part of Zc* standard extensions for code size
+            reduction, as ratified in commit 8be3419c1c0 ("Zcf doesn't exist on
+            RV64 as it contains no instructions") of riscv-code-size-reduction,
+            merged in the riscv-isa-manual by commit dbc79cf28a2 ("Initial seed
+            of zc.adoc to src tree.").
+
+        - const: zcb
+          description: |
+            The Zcb extension part of Zc* standard extensions for code size
+            reduction, as ratified in commit 8be3419c1c0 ("Zcf doesn't exist on
+            RV64 as it contains no instructions") of riscv-code-size-reduction,
+            merged in the riscv-isa-manual by commit dbc79cf28a2 ("Initial seed
+            of zc.adoc to src tree.").
+
+        - const: zcd
+          description: |
+            The Zcd extension part of Zc* standard extensions for code size
+            reduction, as ratified in commit 8be3419c1c0 ("Zcf doesn't exist on
+            RV64 as it contains no instructions") of riscv-code-size-reduction,
+            merged in the riscv-isa-manual by commit dbc79cf28a2 ("Initial seed
+            of zc.adoc to src tree.").
+
+        - const: zcf
+          description: |
+            The Zcf extension part of Zc* standard extensions for code size
+            reduction, as ratified in commit 8be3419c1c0 ("Zcf doesn't exist on
+            RV64 as it contains no instructions") of riscv-code-size-reduction,
+            merged in the riscv-isa-manual by commit dbc79cf28a2 ("Initial seed
+            of zc.adoc to src tree.").
+
         - const: zfa
           description:
             The standard Zfa extension for additional floating point
@@ -489,5 +521,51 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+    allOf:
+      # Zcb depends on Zca
+      - if:
+          contains:
+            const: zcb
+        then:
+          contains:
+            const: zca
+      # Zcd depends on Zca and D
+      - if:
+          contains:
+            const: zcd
+        then:
+          allOf:
+            - contains:
+                const: zca
+            - contains:
+                const: d
+      # Zcf depends on Zca and F
+      - if:
+          contains:
+            const: zcf
+        then:
+          allOf:
+            - contains:
+                const: zca
+            - contains:
+                const: f
+
+allOf:
+  # Zcf extension does not exist on rv64
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zcf
+        riscv,isa-base:
+          contains:
+            const: rv64i
+    then:
+      properties:
+        riscv,isa-extensions:
+          not:
+            contains:
+              const: zcf
+
 additionalProperties: true
 ...
-- 
2.45.1

