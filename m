Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF952161319
	for <linux-doc@vger.kernel.org>; Thu, 18 Apr 2024 12:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713444245; cv=none; b=X16SBKTS70c1lUnUXVVvJSKPXNUOxGuxfb7DupBgAQYgfRmE9kwOLvGKQlx59gF0G6X1GLsbcYyQcf+fGugInoHYiUfhWIGG7DJOdVRmNS+ykXirJJ+naTVaiyYJZ7Jwdv3U3JzRQ/SGAt0dJlkpGGrYYzOUxrE0O1q9WZZIJNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713444245; c=relaxed/simple;
	bh=2meeqYrGqS6N+9ES03sW/IZ0HWVimfJczOdorGfrJB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rjoxTglMl/daaNv7uQnbaDb9f+9B0imwVXVOvFElMIr3hCUyipyDtuv+VW2Owom0nWIr+wunS0TehGKQTx+AjiIlYYUlxu9y56EWKzfuafZtqLFS4MM8VIUt2P82fR8xmDcF8ZZS5Vg42wMoJ9SAmR7R/+3n5UIvq1ZRY2NvXa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=orXBAWIl; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="orXBAWIl"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2dba429a246so195261fa.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Apr 2024 05:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713444241; x=1714049041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=av0fCRvJ5d6BdL5At0wE/CNS0oRVP43ZLfrJceTJ89w=;
        b=orXBAWIlCbFEPZnXQnevS9f95mR5781Pc2yepFZQDAFvlJNBdvAcLHH8vprt+kGonx
         u/y21dbj5GkzC7GC9zD2/TDSztHegfMNMN2C/DhINA2H23Kk5mfXmCCyvY+gHjagQ+Hx
         oaNLoRtTXs5HQDI1JZgqE/2mtGYT+M2IaaZRjHo1RF13bMsHsiJE5d1wYa2P4OdVwI/A
         7BVKyu+mMSKhRKMcLyd/ObTNE0DshORErxAfHhUT+3WDt27HEN2cxYP1ZMIOX/m2Rzmg
         m50MJceZivYeNEpP/zgsWdA0CNd/KAvsGenYKqMMettqNaLTycWsPrXjixBOhvkaLotl
         ORBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713444241; x=1714049041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=av0fCRvJ5d6BdL5At0wE/CNS0oRVP43ZLfrJceTJ89w=;
        b=aHlA00azr4+M3OEEsmBKBRK22EP/TQyz8+eRO4RpU5uZ2QcxWIVg4Yu2tWCuUQ4NeG
         n0bh5uGK4lRDi26ilBAyS/h1ditEwp1JaqdXFZAg7Vgt+ri8kjhNyIoClcW1LhsDWcCm
         cw+RuGix0fy0kRlAPAknZmLULPUtEj6tTyoRxseAWRnjXYcX43PmepfPUygStJ5M4nVA
         qOwCh3867o1cDfWCrM1m22mPKCp1fTmaeanuRRpypZfJYjfZRKfsV6fXIVVa8SAZXFGY
         0EYEs+9NF3gLvMzj6wLwgTG/oEx4WF/LzV+Q//DHM/OffRcIy4wOT61x6axxpjzbCSv9
         rWJA==
X-Forwarded-Encrypted: i=1; AJvYcCWv2Sy71VWGuR6K7bHf6i4okIBsu/hp2EjKP/gCmdfA/nhkKBSWEcx8m0xB2ZpXsDni+v87Wi0O3uUCl5dc8ZCmpmSEcR3MXzFQ
X-Gm-Message-State: AOJu0YwxapPeB5hDr6cOaFkza94IJo0gw1xl4eUbu7mee2PgUiPV/OtE
	jtRx5MWUsehWg6dC8jud95iyeQD61g5SkXnN36uuzaQU96PjD4bc3+t1L6pTBlE=
X-Google-Smtp-Source: AGHT+IHdzMsUCMCexL1xcSXK55gyqNVYHzfsqQON0oQtcwPFlYxqOUNzTjfk86rgRUdr+Vw8mFv+bw==
X-Received: by 2002:a2e:3a19:0:b0:2da:320a:6739 with SMTP id h25-20020a2e3a19000000b002da320a6739mr1487240lja.1.1713444241121;
        Thu, 18 Apr 2024 05:44:01 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7b64:4d1d:16d8:e38b])
        by smtp.gmail.com with ESMTPSA id bi18-20020a05600c3d9200b00418d5b16fa2sm3373412wmb.30.2024.04.18.05.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 05:44:00 -0700 (PDT)
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
Subject: [PATCH v2 06/12] RISC-V: KVM: Allow Zca, Zcf, Zcd and Zcb extensions for Guest/VM
Date: Thu, 18 Apr 2024 14:42:29 +0200
Message-ID: <20240418124300.1387978-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418124300.1387978-1-cleger@rivosinc.com>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extend the KVM ISA extension ONE_REG interface to allow KVM user space
to detect and enable Zca, Zcf, Zcd and Zcb extensions for Guest/VM.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 4 ++++
 arch/riscv/kvm/vcpu_onereg.c      | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 35a12aa1953e..57db3fea679f 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -168,6 +168,10 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZTSO,
 	KVM_RISCV_ISA_EXT_ZACAS,
 	KVM_RISCV_ISA_EXT_ZIMOP,
+	KVM_RISCV_ISA_EXT_ZCA,
+	KVM_RISCV_ISA_EXT_ZCB,
+	KVM_RISCV_ISA_EXT_ZCD,
+	KVM_RISCV_ISA_EXT_ZCF,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 12436f6f0d20..a2747a6dbdb6 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -48,6 +48,10 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZBKC),
 	KVM_ISA_EXT_ARR(ZBKX),
 	KVM_ISA_EXT_ARR(ZBS),
+	KVM_ISA_EXT_ARR(ZCA),
+	KVM_ISA_EXT_ARR(ZCB),
+	KVM_ISA_EXT_ARR(ZCD),
+	KVM_ISA_EXT_ARR(ZCF),
 	KVM_ISA_EXT_ARR(ZFA),
 	KVM_ISA_EXT_ARR(ZFH),
 	KVM_ISA_EXT_ARR(ZFHMIN),
@@ -128,6 +132,10 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZBKC:
 	case KVM_RISCV_ISA_EXT_ZBKX:
 	case KVM_RISCV_ISA_EXT_ZBS:
+	case KVM_RISCV_ISA_EXT_ZCA:
+	case KVM_RISCV_ISA_EXT_ZCB:
+	case KVM_RISCV_ISA_EXT_ZCD:
+	case KVM_RISCV_ISA_EXT_ZCF:
 	case KVM_RISCV_ISA_EXT_ZFA:
 	case KVM_RISCV_ISA_EXT_ZFH:
 	case KVM_RISCV_ISA_EXT_ZFHMIN:
-- 
2.43.0

