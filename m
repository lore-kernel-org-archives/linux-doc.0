Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADA415ECD8
	for <linux-doc@vger.kernel.org>; Wed, 10 Apr 2024 09:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712740284; cv=none; b=F8zWG5WfOewrfbHK+Q7YW35OYqfkrAkC8p4tX54RnUNn19ZIzhFLhhsHumSYWt0UZzyUjbs4Q0ndkKiouzYRVsKaUk10EKyx2aTr7TNVRcDvApi2GQNEcvfZ115zvmX9uhDsDMg30k0TLe08dOVAIvTroZK5lCGym7FZyn2e2eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712740284; c=relaxed/simple;
	bh=VBYIkTZIleyOsUo3Vs7GTW09WzwtONhQK0/AstEMTYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YE80bG4/oV5CKwDMiCztlRj0vK1QIkAg7FFVgJcJiNctWyiU5qrYFthirKyi460vxYt0qsNSFfV+z/Lma27iTDOvtrzttDWvBrRDyFRvSiI20+MiHscnf/OMWmcW58zJQzXeWmkaA8xrFLC1cQ6TkKDXnmTAJ5Km1mWXx0Xe0I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=rURAKkLA; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="rURAKkLA"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-346407b8c9aso516614f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Apr 2024 02:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712740281; x=1713345081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdCfPjm06PN8DLWdVlWU7iGB8QhHqS8f5T3HQCXkkpY=;
        b=rURAKkLAJayoYMZmBWpG7FHBtQg6jl2K3leOahNRXDAY4m33zhBke182MWQowzMAMe
         PAblFOE+HRE2eqyemvWVgZ+8Bdv3qYrtIOEpB34q2y8ksesCErcBIk+a6S+aWEq80YWr
         T5R5Iam5LQYimS+hduyUboWljva20ji5R42Br+Gt3HmpMH/pVA3d6i8dNPp7VU0vHKav
         dJXCFsivvEFUuKs5CPEseJKheKF+96hKMT0JkdIe5Rn+b4BnaP7UJsvt2/mWdBegQVSu
         epKKZezClXlaVZ6pH5sEvdwFQjL+kmsxX+3QBGvzmtHRcrmiiJv9kALNXnizz0OdMCkz
         v+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712740281; x=1713345081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdCfPjm06PN8DLWdVlWU7iGB8QhHqS8f5T3HQCXkkpY=;
        b=E/Yril1Mk1wia0/F+hqpKobi1SkV+WOu8n4n1y7ztWdN8K2yrWylEVqbor1IGhzSRT
         6/D4Rq9oQn7Rhj3+Mq/qtmCi8oq89i0Vr10aGCJxYFL+y50xpKwEKfpovQW575sn4Mv5
         yQeXyV0mDyitAihguYZ8OXSRicUBPdn132jV8/Al/hdIAjm3/bc42wIJnXTqQfZPIJ5h
         yuwkJvhZKLwVxx925Q3DqUUUjWT1GLKvpV2wHj60UABYDOMurL2XHovlhXjWVFofkFA+
         AMjBuiqJta7wzx5TmDgsvO6pOBE64IVMpRhrFoXvfichIae1V5MIciUofesBSspLOblm
         YZ6g==
X-Forwarded-Encrypted: i=1; AJvYcCXW0JCV7nfnPFgx9TLAR7zOLHMfHnktn/xtbCcVVSQsXABixTNqYeetrEnGNsg4nxePJ/axOwgKdKTojcP+YS2WKBc8jrxW8+GO
X-Gm-Message-State: AOJu0YwplKjSr+LAcIGHeODJL2iqNAnld6CapXP/kmCO6r0MQeJqrX2+
	7Z2iX9SigCMlmOUs54AihoKfnI52l9+CG9twnJmgBFWSPsoiyW3Dxd8OwpS6k/4=
X-Google-Smtp-Source: AGHT+IFQJ5p7pLG6t5Azs3+BcKGV7vPPdom5bcR5KV8gVA1LUcuSXTuOIz79sOe0bN9WIkFT5A1jwg==
X-Received: by 2002:a5d:47a4:0:b0:343:39d8:bf3a with SMTP id 4-20020a5d47a4000000b0034339d8bf3amr1645951wrb.4.1712740281298;
        Wed, 10 Apr 2024 02:11:21 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:d4a6:5856:3e6c:3dff])
        by smtp.gmail.com with ESMTPSA id d6-20020a056000114600b003456c693fa4sm9079086wrx.93.2024.04.10.02.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 02:11:20 -0700 (PDT)
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
	linux-kselftest@vger.kernel.org
Subject: [PATCH 08/10] riscv: hwprobe: export Zcmop ISA extension
Date: Wed, 10 Apr 2024 11:11:01 +0200
Message-ID: <20240410091106.749233-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410091106.749233-1-cleger@rivosinc.com>
References: <20240410091106.749233-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Export Zcmop ISA extension through hwprobe.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 3 files changed, 6 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index bf96b4e8ba3b..e3187659a077 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -212,6 +212,10 @@ The following keys are defined:
        ("Zcf doesn't exist on RV64 as it contains no instructions") of
        riscv-code-size-reduction.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZCMOP`: The Zcmop May-Be-Operations extension is
+       supported as defined in the RISC-V ISA manual starting from commit
+       c732a4f39a4 ("Zcmop is ratified/1.0").
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index dd4ad77faf49..d97ac5436447 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -64,6 +64,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZCB		(1ULL << 38)
 #define		RISCV_HWPROBE_EXT_ZCD		(1ULL << 39)
 #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 40)
+#define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 41)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 2ffa0fe5101e..9457231bd1c0 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -114,6 +114,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZIMOP);
 		EXT_KEY(ZCA);
 		EXT_KEY(ZCB);
+		EXT_KEY(ZCMOP);
 
 		if (has_vector()) {
 			EXT_KEY(ZVBB);
-- 
2.43.0

