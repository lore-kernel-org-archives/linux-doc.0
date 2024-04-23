Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB73D137C57
	for <linux-doc@vger.kernel.org>; Tue, 23 Apr 2024 12:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713876235; cv=none; b=cEK82pW4XV1grpskQkTJnd8/R1zByj/hibprq6sT27eQ9Y/vETI5lP4I7bKVN+bGaJudIrnXK7KyQSHacIPRO5bwRMaGhqMA/aTvUuiR8ZLhR875/1uF0nSw0U50hstoH9qGEOB+B3/1IQcXZg4eqRUJQxKac4EjajOKMLdduco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713876235; c=relaxed/simple;
	bh=a0XzsdggPUj0Ja28kYjSZ2eAp6PAvvyuna/HjP+bSA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=db8zsPq/n/l7XQBSh8lPAk4sc5g85HmxJBGXSCJJLRnu4dIfwM0on+W8i/huliL6oyKPsAYOrNNhEYiQ3wbRyu6SAYTeOKWg7WXWuKbtnxQZfHSH51GOI7pC/+kIyW7VdMqoJBU1jX9yUsf4bNIJX5yIVRVDvsdgFfgY/knfT9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=c0XJltOj; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="c0XJltOj"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-346407b8c9aso1491803f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Apr 2024 05:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713876232; x=1714481032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCiDEygHIpDe3Ww8uIgQjb2MclVWFXcZkaD66mBe1pc=;
        b=c0XJltOjiNF57/b+YdDEOIGt4isxWKV7BV1IoApSsRcpNWY86kZV/VygOxWAyB84j8
         ZTMKTaN5gtrvhH/+1CbR66Il1a1Z9vWoCEAZEqYgwxsEJLHgyFWV+jtcC8mtvWV1jk7r
         0KiVugH8UiGRIYxtPvfBf+/B/v/GSwvf0o354DuroONxu+k01hX4IWDtIMB8MddqKieD
         PP7LRF3WzfJ+tx/yHAZcZWHekpnL08XTsIps85/ZWA55DptlHhloyDWIsDbHiZ75+UEr
         uoiyBUQ/UxODKLAKol5tZulk6YZ3q2sZQmfnoTnAkFqPBxcZJ10xBBjSF6ziHrq40JlN
         dwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876232; x=1714481032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCiDEygHIpDe3Ww8uIgQjb2MclVWFXcZkaD66mBe1pc=;
        b=wGBJSB0IDOcc0CVv1kznDDbTdJ8RTSm5JxzcPUmRUu4FRkPg/F99LYR7TIrLrp8SyC
         3kBEh2oSMkPWqn/AGu6z9gSgR9oOiMu6SpzKn15AfepZ4lxlrCX1FNndgfPSG6rG3+6W
         YEEr1sd7QGbtpq/aeg9UF6mGuIaptjmOSvX3m9HOtemnf/Kij7NS9I6c2XwZ/7SR5HeH
         HYn3Axww/bv6ufwgSTYmTaMKZsU9NXm+JQm4aA+weoPSN3+/hA76AVaeMV8JpIKFPAOG
         zRQ/GkvKV6UZsPYDtU/2+CN9O0KaMISouBZdWur60dbKjKlQE46GFznecmNDUE+Cko4b
         BR0w==
X-Forwarded-Encrypted: i=1; AJvYcCU5WqbcXFd5lbSrQmEHU9K8JTqHMg5Io4I97K7VzcchCaxUe9QrQjL+dZU30nh5UCQpedpuHqASziOQC+JlkFXg0ulKF2php5k3
X-Gm-Message-State: AOJu0Yzeqw3J3ZmZyItHl3M/+dcpZylkRIn8EX4W5raHxFR8PpcnJdq3
	gynsWMwPUoEjiyuRW809ukP0P7QcBAzLgnWsg6ygxc8xy3bjUdObb8bKDmRERlI=
X-Google-Smtp-Source: AGHT+IG8Y0QuKdCdamw6m12y/zyBhHBAXQlGn8wgQVKcyAjav27SlxD5OClQSLzPK55ylnTNKzC2Ow==
X-Received: by 2002:a05:600c:3d95:b0:41a:c4fe:b0a5 with SMTP id bi21-20020a05600c3d9500b0041ac4feb0a5mr958105wmb.4.1713876232338;
        Tue, 23 Apr 2024 05:43:52 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:71cb:1f75:7053:849c])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b00418a386c059sm19975709wmo.42.2024.04.23.05.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 05:43:51 -0700 (PDT)
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
Subject: [PATCH v3 10/11] RISC-V: KVM: Allow Zcmop extension for Guest/VM
Date: Tue, 23 Apr 2024 14:43:24 +0200
Message-ID: <20240423124326.2532796-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423124326.2532796-1-cleger@rivosinc.com>
References: <20240423124326.2532796-1-cleger@rivosinc.com>
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

