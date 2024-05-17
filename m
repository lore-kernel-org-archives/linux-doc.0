Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893296E614
	for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 14:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715957605; cv=none; b=R/lIpry3pP5rd51Ki0xMmxVUh5S/zXS41O/y1o3k7s5FX7VzCavGHpGZXv45Ue0xw3fNqTEnr2+yefgmBDiVhHElSW6VuV4buLh4n4ElNwCRYj3MHCoOZEUov01Kdc3brBl6iEqDHQzlOxUw/rjdEEc/UyydDkBretS/ZmNqGn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715957605; c=relaxed/simple;
	bh=3pUouzGKtTo71pYkdkJFB3gRP9khPlS9i6RZ43zvw+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iq3PkHCQsFOJvu0vBUXZnm45s0x2+vcWYffdm8FW4/ukJZIHYY+c2DjZpeYog6SMRiLFr4qDSM897XJziezSSf2rrqcik1JWc9X18fxKCTWMLMVoMj7rLv9x7MM1L7+is7hnBpjHvWNzL4aMUMAq1Ok/5AwC0JoD2aqQXCCskVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Od07MaDS; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Od07MaDS"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41ff95798d4so317995e9.2
        for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 07:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715957602; x=1716562402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrSVtGZRwZdqSUCPKBtbbPV0rvcWw4KEF79SGVRT1V0=;
        b=Od07MaDSgqqLKczElJ5KdqW/Odq7UViRs9G6uHM16OeF/GlxqrWYQkTs0MlFXp7rAn
         bJNUiteNjPviSW7SOcOpNHhL1CNp1rAZr9VxGyGXtfiBuO/blte8C+PuP+xxk9NUhSEr
         +MkD1KVa/IZKRxZYSdpwGTk1AWr1Eya27EPIpNnlkmC38w0lrOuHttfq9gQ2495tF4Lh
         pRGh0Vt+N3BCSlOuAilA4gVUP96iEZqfc+c4CAXjNXFKQYgT0PJ09Sk9V2wdV/2vTLOU
         mzzm1nhamMREERi7fFLuF5YEDnneFzoGjsCMtDffn2I+mYb9CaMGyWHdAhLEY7NPovMa
         IVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715957602; x=1716562402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrSVtGZRwZdqSUCPKBtbbPV0rvcWw4KEF79SGVRT1V0=;
        b=XjmO88DQ+vkyzKjIkB/K6G/8ojMThIE8BQePUPusQ0Ct7OFEpVno3uJNc5/rpL7k8X
         GZHdkwRDpFAhnMiE6I5+BRM+47iKamScb9JCtwrlFs467DMUhdDQ1iMH9B18FQ35zMAW
         0jCg0+rw/h0/Rit+wxvykr6MW7md0rkW5IHHZg/gPGQkl1vTH8qEWbqzbdnEIIuGMM5d
         ZLrCj4WzLJV3IrrNXgKgCpGi58gpdDjYhTMo98XZBRX7Zk2pp9vlDpe2fLFvQn+BDpra
         97RMWIl9O7uncJb8/HUm/QlQSCoHT+dGCO1TL5NMNQ98ZEQ8WWbu0yTfrDvq9eVph26O
         ypwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXos5WtDgWxI4PhwBXhXqwWtA0pO7l8bEeJNILJUdJ/0aVnOpOlR52B7zxTviNKfQdLGItJE4SauTjR/GmIwMHKuA5eRRPX5Ren
X-Gm-Message-State: AOJu0YzwOuBjGUhadPxg4onBwegiSNodKvjIGh4Y+WDKw/2GZO6bSQvD
	cpP0YXwo7dpPcRp0ovBpLLjJgRg6y/oRPVz1SFlk7Ni9o5TYwNajD8hYwQpwZ4U=
X-Google-Smtp-Source: AGHT+IGsuE5xt92dGgSdWc5RJ3a8C2oD54vDPB0hNfYCMvTglFHEtoobZF7XlkesElGq2tbCGZs/Lg==
X-Received: by 2002:a05:600c:1d0a:b0:418:1303:c3d1 with SMTP id 5b1f17b1804b1-41fead6ae1bmr185460015e9.3.1715957602088;
        Fri, 17 May 2024 07:53:22 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:46f0:3724:aa77:c1f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9431sm301723695e9.28.2024.05.17.07.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:53:21 -0700 (PDT)
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
Subject: [PATCH v5 05/16] KVM: riscv: selftests: Add Zimop extension to get-reg-list test
Date: Fri, 17 May 2024 16:52:45 +0200
Message-ID: <20240517145302.971019-6-cleger@rivosinc.com>
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

The KVM RISC-V allows Zimop extension for Guest/VM so add this
extension to get-reg-list test.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index b882b7b9b785..40107bb61975 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -67,6 +67,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZIHINTNTL:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZIHPM:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZIMOP:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZKND:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZKNE:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZKNH:
@@ -432,6 +433,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(ZIHINTNTL),
 		KVM_ISA_EXT_ARR(ZIHINTPAUSE),
 		KVM_ISA_EXT_ARR(ZIHPM),
+		KVM_ISA_EXT_ARR(ZIMOP),
 		KVM_ISA_EXT_ARR(ZKND),
 		KVM_ISA_EXT_ARR(ZKNE),
 		KVM_ISA_EXT_ARR(ZKNH),
@@ -955,6 +957,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zifencei, ZIFENCEI);
 KVM_ISA_EXT_SIMPLE_CONFIG(zihintntl, ZIHINTNTL);
 KVM_ISA_EXT_SIMPLE_CONFIG(zihintpause, ZIHINTPAUSE);
 KVM_ISA_EXT_SIMPLE_CONFIG(zihpm, ZIHPM);
+KVM_ISA_EXT_SIMPLE_CONFIG(zimop, ZIMOP);
 KVM_ISA_EXT_SIMPLE_CONFIG(zknd, ZKND);
 KVM_ISA_EXT_SIMPLE_CONFIG(zkne, ZKNE);
 KVM_ISA_EXT_SIMPLE_CONFIG(zknh, ZKNH);
@@ -1010,6 +1013,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zihintntl,
 	&config_zihintpause,
 	&config_zihpm,
+	&config_zimop,
 	&config_zknd,
 	&config_zkne,
 	&config_zknh,
-- 
2.43.0

