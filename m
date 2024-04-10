Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8751315EFD0
	for <linux-doc@vger.kernel.org>; Wed, 10 Apr 2024 09:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712740287; cv=none; b=eFXw1/dPjjvHr6J9ptC4cNQOgMkSmggt0YE3WV7emcilTBq5P4wumkOOTRM5v2yY3+I/Fao4jTyOAHZOITHnnD9VsuCnSOl4V20pXpOi0ZEmN3ubEIojpLaXFQyl19iUXuzCzQ+EapN2jKFbFst1WP3hmwvvxJHwtEPIKal4NNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712740287; c=relaxed/simple;
	bh=dIKOQ7+8Gx69BlGHAWDa8bC1hIUZKhgNODc1wgGNviA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WEqo1NakUAY8DT8KwsRH5s5ZFpAYhd5aDOY42vBrGhe5kri1ydkcM7zyNZlCj2je1gnMjQaTMWPccozQodLGSasCrZddt5mHqfZ2Zab80b9qU889NuTG6MAOCeyc5+/rRjYGY4DxnuLhVM9e/lZVzRfQBb//DhL3U/fq9fsYzqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=H0S06gwr; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="H0S06gwr"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-516d23d3bceso1854841e87.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Apr 2024 02:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712740283; x=1713345083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKIlCd7jL5ol5qvLgWGPfJLjgIu96MFC3958FRvJI8w=;
        b=H0S06gwrd6ANiW4jrbHvPyJjGiOIaqcVz4LTDzaaXw9vRTwJxBwCfRaGBDPwmq4Yh1
         cBUW/u2wEhyEo9Jjf0PG0vUrX5/JP9IR8f0e77aLywkf6tipp3gm0/Neyknnz1mRcygn
         wcW7z1Jt5Moi45dYyMjMdMIP5X4jTjC6YrgUu9d2Wbv4MJgq+GRzDQ7RQ1p0GBl5sFbN
         HYLFNUl/oZWw3kGA35H0eIAj4ljEzRdZHtyEKD8UnuU2xUBtxUuddWs+BoSNp4XZFUXt
         GrHm/05lsIvlPjaczukw+t6PGpG8GRwJGms9l/cS+ioiUrohW8mvEjAnZybyHId1GbdJ
         5/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712740283; x=1713345083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OKIlCd7jL5ol5qvLgWGPfJLjgIu96MFC3958FRvJI8w=;
        b=FpFjlnukKht9SFEpf/spVkAE735tZ0tjw+HvRfl180Cru6VRTXnePbRgdGQSTeAhXe
         CGAor2KY+JoAewtLdOrufKdmqEx0DJ1OBCiE8QK7knGP4Yuh0HeKwHxO7F+dN4bMjpN6
         5YbZ0Dc1HF+BE1fTBWXojm2CJwurj3ce8cMSR7UxUf0wKFxhr797ttKEnc0ozWBb3YQd
         Q5r4z+yWf/pBkCfDvey8FxSEo1cJjFEPnurBjBolfEK5w2jZYnk/nKUrr70x1LZPIrFO
         1MK6lL965O5wfoxiTNtsi6HnazoOIWUh24YSTWaOfq/RKigNxpNGUxIgiCMJpUJvs8tB
         33nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVas4qF4I0GtG8rUSOyVxYHm7XQT1JTKD6/a37UU5hqv9M9vjjquILOlM8Um5+/nlm/iGsFLhBuLpYy4Rf0LW6GaTggPK6yIFbx
X-Gm-Message-State: AOJu0Yy6W8zT6fQPBXUFLEuOE9SGdTiKp07oq+3hL0fzhzON7hMyH5te
	kR8zOfhNOBEGQc+4iru/vkMkCWavPxD0A1rmX62uFj+mPYXih6Ui7UuEabdHH0k=
X-Google-Smtp-Source: AGHT+IGArQ/ya3SIwEsTsgk2V3XdyzaxCK6c7Q9P5Y6CwIgF+pnuGurqpRxGE7Q7fP5In4aquwsCLQ==
X-Received: by 2002:ac2:484a:0:b0:513:c1b0:dcb2 with SMTP id 10-20020ac2484a000000b00513c1b0dcb2mr1173103lfy.3.1712740283581;
        Wed, 10 Apr 2024 02:11:23 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:d4a6:5856:3e6c:3dff])
        by smtp.gmail.com with ESMTPSA id d6-20020a056000114600b003456c693fa4sm9079086wrx.93.2024.04.10.02.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 02:11:22 -0700 (PDT)
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
Subject: [PATCH 10/10] KVM: riscv: selftests: Add Zcmop extension to get-reg-list test
Date: Wed, 10 Apr 2024 11:11:03 +0200
Message-ID: <20240410091106.749233-11-cleger@rivosinc.com>
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

The KVM RISC-V allows Zcmop extension for Guest/VM so add this
extension to get-reg-list test.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 61cad4514197..9604c8ece787 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -59,6 +59,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZCB:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZCD:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZCF:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZCMOP:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFH:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFHMIN:
@@ -429,6 +430,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(ZCB),
 		KVM_ISA_EXT_ARR(ZCD),
 		KVM_ISA_EXT_ARR(ZCF),
+		KVM_ISA_EXT_ARR(ZCMOP),
 		KVM_ISA_EXT_ARR(ZFA),
 		KVM_ISA_EXT_ARR(ZFH),
 		KVM_ISA_EXT_ARR(ZFHMIN),
@@ -957,6 +959,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zca, ZCA),
 KVM_ISA_EXT_SIMPLE_CONFIG(zcb, ZCB),
 KVM_ISA_EXT_SIMPLE_CONFIG(zcd, ZCD),
 KVM_ISA_EXT_SIMPLE_CONFIG(zcf, ZCF),
+KVM_ISA_EXT_SIMPLE_CONFIG(zcmop, ZCMOP);
 KVM_ISA_EXT_SIMPLE_CONFIG(zfa, ZFA);
 KVM_ISA_EXT_SIMPLE_CONFIG(zfh, ZFH);
 KVM_ISA_EXT_SIMPLE_CONFIG(zfhmin, ZFHMIN);
@@ -1017,6 +1020,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zcb,
 	&config_zcd,
 	&config_zcf,
+	&config_zcmop,
 	&config_zfa,
 	&config_zfh,
 	&config_zfhmin,
-- 
2.43.0

