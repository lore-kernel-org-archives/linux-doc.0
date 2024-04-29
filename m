Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC80130E24
	for <linux-doc@vger.kernel.org>; Mon, 29 Apr 2024 15:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403209; cv=none; b=dZxTi4cfdZwc9SrGpOIhwJfOkqtVem2XRt5lKHsvicoGyrmnVJX1f4xBzevRlbsy8KG3UCQI/INnadg+tbLS2BNrXHetCG4RPirQ2WQbcGf+AXz1sR9dKwlHkDBqTu983FSyyLlcSeKWXaWeQypErilHuqqW1NEXwXytSJTz9Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403209; c=relaxed/simple;
	bh=a0XzsdggPUj0Ja28kYjSZ2eAp6PAvvyuna/HjP+bSA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LHnd3Y9ZmZZ+U97A4huBq72eLc5gw1DipkuHvWXzArU4aqT456iwYU30vTYekfDjD87ifryt05+8OyCGwnOtTSmx83URlDL+kurXpmO0Gs0n8eH4idChT5Lq6xqskj3zcKAoQeyigrckG2Gxya6ubencCGNXvL3RL8z2hp080NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=aWAbxd8O; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="aWAbxd8O"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-51d9d8c2c3dso210934e87.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Apr 2024 08:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714403206; x=1715008006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCiDEygHIpDe3Ww8uIgQjb2MclVWFXcZkaD66mBe1pc=;
        b=aWAbxd8OjrQcQBQSTsyapDR89j7Hvn6V4YW+znYTughYnB6q1FhjTG7cvzLseH0R2b
         MgyjjNrhALQX3CmNyN7WlGgprfPS4rV7IWiNpD1j5i9EDQ7FApvNLV2m46n1UtcBN9Rp
         SkxDjSfTP5daVZrUzMAVFW+B0VZZCFZSkbozB1Z6+LXWH0q4aFcUeXNzqTWJB+kgz+r1
         QqgpQa2JURgUOXG3TqSS0H1OSYY0hwpWCMBH+C2lMiBl6UuE641jBKUc7Om639SPTxNO
         WKXbZQ92OIlg/Let5OK2c5cO/ohU/KpP8qiojdrn/3Se2ZxN0brgR67SOF+6kYzB8xCn
         KzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403206; x=1715008006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCiDEygHIpDe3Ww8uIgQjb2MclVWFXcZkaD66mBe1pc=;
        b=p756lNxWSBuIXjmOsVfHcOwInDqJQmdbBoVXO0viVQqsyd1Kp/k5Y/XFBQxNM2COVk
         SYdnuND34xqbpQcwFclRA8t+bUxvFDxu2lem+EA1jBhgxrHhvjQTThUOJG3nMCKPOWsx
         vaMYvCKWr3dZNYQvAlheOPvZzCTZ8ckQy1sbpxKyd7lAoqWDMpSZzpp7tOSa0ejO6DQK
         baRLyo4LSlq+fE+jbOjmIVRyR5FRvhUYn6cP6zWUsXN+NDicAgUU++wHac4kauKvhiBY
         wBzEp0rMX+caQ6lhicuebQWr6SPXY09uuGtaosIiDMeIWuIOnZOA734HS8VOUjX8RE0/
         CQPA==
X-Forwarded-Encrypted: i=1; AJvYcCURHkJuHXvF7vCLur52m02a3ADXt7wCCZz7IQjKrz6vPQDsb7CmAa/ZmPcdGn6ckrklbV+lFE22WBVfZOscvvuJNrJeC79pHA3H
X-Gm-Message-State: AOJu0YyeTj8YPqz9n3aoKdeK8C9UScWW21CC2JH8obOHO+JepWawjyac
	vwXbhMY7ZFYsFbloDb2JFVyU6ohHPThMgIf7A7zp8un0pzlNjlvy0bBYADd7qUk=
X-Google-Smtp-Source: AGHT+IE3E1CESZ85tdfusGzp3Gx4J5COz1kqa8ttEMMgAMGJS6GXIwfFlC+IltwgNMfPv/k+OM7atQ==
X-Received: by 2002:ac2:4d8a:0:b0:51b:abbf:7585 with SMTP id g10-20020ac24d8a000000b0051babbf7585mr6945804lfe.5.1714403206709;
        Mon, 29 Apr 2024 08:06:46 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:2fec:d20:2b60:e334])
        by smtp.gmail.com with ESMTPSA id l23-20020a05600c1d1700b00418f99170f2sm39646638wms.32.2024.04.29.08.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:06:46 -0700 (PDT)
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
Subject: [PATCH v4 10/11] RISC-V: KVM: Allow Zcmop extension for Guest/VM
Date: Mon, 29 Apr 2024 17:05:03 +0200
Message-ID: <20240429150553.625165-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429150553.625165-1-cleger@rivosinc.com>
References: <20240429150553.625165-1-cleger@rivosinc.com>
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
index a2747a6dbdb6..77a0d337faeb 100644
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

