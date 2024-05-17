Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D8080031
	for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 14:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715957618; cv=none; b=LohdBJ+PP0AqLVvEJ7VQcZBNbXxyTBMtV3tJjB29CQ3JBBmK0YaqdHd2q7t5TJjq5U8YakSYtVjOhYQO7B/kTb2n/5KY5LQ3//9KHEVRIrk5etCI1TYjgH0WmWrxOAM3cV8Xm8gEolN8f5F505RtFzHcmZ4JHhA/qndBbbdj1UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715957618; c=relaxed/simple;
	bh=EGRDfMh2SVfhcOaGJVOkgRqDiFwCscmPw9tcW5SPCcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RghmQoN5NZU1yx3CXWJzPhu8nwnG+CXMzK7HrtnshFnCXxdMGgi1zJWzeetaARtebxYcw5z6weHdKRK7r3fuBNTE0S+ZkUYFYWIBGhoVwkXKsNM0pa/+jh6cM6hQwCJIl5rL1O8vX2wXSrY2L1YlAbRkxMKD0ykYEpbBMgHX/PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=WmM058JE; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="WmM058JE"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-351cb099fd7so39748f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 07:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715957616; x=1716562416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9KC0tuSdit7TUVEzTpSp24//kOo0UeQXa0Z7JvTEow=;
        b=WmM058JEtw06IAtBA0tIQ/Yj40FoneIqCaX2MaeHFCKClC7N+TuNLpUc0hOkopwqMZ
         iRvQp1AnzXT1UUn+e69T9kgw+vCckNosyKEvLozEWBPkRJFwQoJK9ZL3LSzOwVHIRNm+
         jsjXCKPlpPn1+8ToR690p/53ozNAbNV5b0qI40Qxj5RKnen72D2wC6cvgNxS6olatwA4
         xoutzhOh+QMnpUUods4vP8/N5/28/JQnTziV8vFinyFmhNXgYLBPLN+amKzGlJWICbqU
         l3Zuq82vSudOgyICFy8syffO0S7DloHK0IV3ipkUQnqyJ3g2yf55Mk/vuKI7iEhcnf5G
         32LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715957616; x=1716562416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9KC0tuSdit7TUVEzTpSp24//kOo0UeQXa0Z7JvTEow=;
        b=JxZadU3h7dWc3vsWJ/C9RAXD6+efGy1RgAxgrRCSGAoC35Po6y7Fnje1GHjusBEtL1
         FrOcbwh0fWa8SvXrK+FNBgNAGIYS4cWHyanNwd+f4EjB/+Od2HIw9yJOPiFDHBCKI2PA
         Yowp8y7uQIv9wpUDF5tFSJQrdbFasloHNZNWv+mHaI5/Uy7Zal9l0/nVsbx8ILNfBOE0
         S6ODigmgPBydlH7BhEM/hfmYTkSJ3czXT2Wm+G1ZdvKcKZywuUpoSgO8kUyJjTSejLKL
         kHzTVkTOzHzJAgZYOqRzTve76YOmR6LNvmNgDYlenypcrTFpfh3i31Kk5hPizSWU9fTV
         7bUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsUDaUL9N/sCA3iBcyzHuf0eQY+SYx5p5fbVtdRMMLk9xV6716B0BxezNBna+yVs7z3AJ81+or+etVHa2Alaejmyutn+tp4AuL
X-Gm-Message-State: AOJu0Yzl/C7Tz8DI6AkYGIem1ct1RCymjdXKCQb/6vFK6dqUCvMjRfhJ
	oewR0EaJhCxG32QMRUUyku3NqIlehCWtsEJgfURAJ3i1p2Vm4SpqduQ6BqNqV00=
X-Google-Smtp-Source: AGHT+IHzMauOaObmH6bJHd+GEHQtwrBkXzklFT3v/zPDqrR2YcC6kkpEK8DoADrBqc2G886rfeUyUA==
X-Received: by 2002:a05:600c:3b26:b0:41f:cfe6:3646 with SMTP id 5b1f17b1804b1-41fead6b0f6mr159820025e9.4.1715957615814;
        Fri, 17 May 2024 07:53:35 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:46f0:3724:aa77:c1f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9431sm301723695e9.28.2024.05.17.07.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:53:35 -0700 (PDT)
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
Subject: [PATCH v5 15/16] RISC-V: KVM: Allow Zcmop extension for Guest/VM
Date: Fri, 17 May 2024 16:52:55 +0200
Message-ID: <20240517145302.971019-16-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517145302.971019-1-cleger@rivosinc.com>
References: <20240517145302.971019-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extend the KVM ISA extension ONE_REG interface to allow KVM user space
to detect and enable Zcmop extension for Guest/VM.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 57db3fea679f..0366389a0bae 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -172,6 +172,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZCB,
 	KVM_RISCV_ISA_EXT_ZCD,
 	KVM_RISCV_ISA_EXT_ZCF,
+	KVM_RISCV_ISA_EXT_ZCMOP,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 7d47fc910bd9..af4fefa189af 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -52,6 +52,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZCB),
 	KVM_ISA_EXT_ARR(ZCD),
 	KVM_ISA_EXT_ARR(ZCF),
+	KVM_ISA_EXT_ARR(ZCMOP),
 	KVM_ISA_EXT_ARR(ZFA),
 	KVM_ISA_EXT_ARR(ZFH),
 	KVM_ISA_EXT_ARR(ZFHMIN),
@@ -136,6 +137,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZCB:
 	case KVM_RISCV_ISA_EXT_ZCD:
 	case KVM_RISCV_ISA_EXT_ZCF:
+	case KVM_RISCV_ISA_EXT_ZCMOP:
 	case KVM_RISCV_ISA_EXT_ZFA:
 	case KVM_RISCV_ISA_EXT_ZFH:
 	case KVM_RISCV_ISA_EXT_ZFHMIN:
-- 
2.43.0

