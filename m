Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6262B2D5923
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 04:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760934558; cv=none; b=B75kZ4FClAqVteqGJG8DlEtNnqk2Nt6NKSETtzTzFjoQHfFe/9jDL8x2Rh6sH6fMdk57mMLBv9C/MuVA45F3CgAml3IVxT40Rupel1usjz9SmXBGKqBMrM+nqA2ubYMXipUgMWCDe+og1Fs3F4upH73bfR7W+8Tf2QbnfdkKZ4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760934558; c=relaxed/simple;
	bh=c191XMGekjwyT0k1fIaZ95ZvPfNZBLAH+N5NWD52kwE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C9pILDbMHbvHhD3V1BaPz4iMyfI99sYcPCc7ZUFErq6ecX9wQIET2tG1cvWBXkjRcBuuSgQp22Ce405Mz9HlMBZY6kJ1KcT0cRPRW5GjRcfOYneNyoDRQQwKQ2bHnPx3xixGlCTT8zPHpdXurnB/2bng7MWr5b+u1Q6fD48AVqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=NSs58go0; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="NSs58go0"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b5a631b9c82so2532613a12.1
        for <linux-doc@vger.kernel.org>; Sun, 19 Oct 2025 21:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760934557; x=1761539357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K/wZtJxRjsPgsFT1TZQP06vJqUDEl57iCFv88CuZkP4=;
        b=NSs58go0HdBRQ83pu6c38OEJRSDMhRpsd+KZ2YVjUlboshhfT/vxGd/2WLOMHiKz0v
         0AogOMMMB4f0CDGLoVD4P9emzk6WlUT9U1UtCMKz8FAEVcPifE4x5uPWzdE4WqaPYa5G
         CleVhyKg/Cna92SjsvQezDjAyGaLRsjr5nxdzmc1nT6nYom6JJZvNRtnBu+nfRtcVGHX
         Y52Rmcaqt0eEE9bfrivHoDfP2C4US5v0vUq3THvEBYWZiOaVBGLVdP+vLIXjtHa2lj1K
         6U75MmoNuW5JzafRxxBVACIFaAlWuUMIZSJkdilwdiUFGWQpD3XPYc9EFjQwUy6M8EAE
         kyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934557; x=1761539357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/wZtJxRjsPgsFT1TZQP06vJqUDEl57iCFv88CuZkP4=;
        b=HfkYHNomIAktZhoFHmrDS0jfwVo1yfjgPPiLxSZ5Db+HDMByDYrpjTcQfAPZNTn//0
         xgw+GrIhzR5SJQ0c8dnjEqxWO3HBWTU28T/2wd5uK0xB20Os7e7DmY8jrsOjIZfNbiiG
         U8JFLErvcL9dGlG5lRV9bsv4FRTW5PGUCpKpNVRi+QUd3T4rN1gA6GHUWblaDNJdm5an
         oLGJL+BLbPzz+HrytScnNZgcfz3oNeLW7odjQaoUTpNmPajbPhq+4vb72I9WjsGRH//K
         WFQmAQz7d/G0rQVR1owRpFnXeYuObXSLlRrx+QPOd2Q9/uOVWWiktoYMHQ9rowI94C9k
         j5tg==
X-Gm-Message-State: AOJu0YydFoI2qEA42/OVYzQE8AaugRS1OdeyS6ki8O2J2mc8iYjO66ci
	C3mBeLGJt7w3s0ZRMLV6mK+pkCLBGI6Fj+6xRv5vNhi+UhtqVqvH0HI42ZsuU/zt7BU=
X-Gm-Gg: ASbGnctDTLiXEwCJaqsdQs/Bk3zcuYpaE3jvqegpLXLq+CENCcggt9d4iqex3qKWn/c
	PflKUI7jLNvlJOnImeUza23fRszD52XyEeoozOSdbB/PNnjnnXEN0UkYFvGLHSZu8PUhkrrtrQa
	Tl4akMrTi3CxzjKPjECPMDE3OxM8WFYVzzgAO5sXeFDKRWvM/bZJLeyj2bE7sfYatWEtq48Gl6Y
	UICSV4Mj7o3C87xzTqYR9w1auaRQcqQ1kz9TuAkG+G4uW0hX/Sr7dBKHHUQqUp5wFbSbgaNsNHG
	w+9MRb27gNcCpjkJfqokt2CqrO48cmqbAXaPOWLrXtfiMFnjx/y1g44paGFd0RZ18p+czzZA1NS
	O8nNpM4gojJ05x8/Noq5Yd6/kyiVZ8Qt0YIcFJl3pRXMuRr1G07qWpkXCvdDYwoDiOBDRX6yJHL
	p4TZl13VX4gdJiQh6HdlA1Oihab9ktTN6Fbe6+TiXCM+d5ibhZjm32ClLGkS4hitQ=
X-Google-Smtp-Source: AGHT+IFpyzb2lc+FEvYmYTlRzjGRaKAbU2/1KopbwUla+EaFbZIWmZ4VSEnrtlloLabkn4dzpBObsg==
X-Received: by 2002:a17:902:e5cf:b0:290:9576:d6ef with SMTP id d9443c01a7336-290cba423b1mr160239305ad.54.1760934556712;
        Sun, 19 Oct 2025 21:29:16 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b35dadsm6932872a12.26.2025.10.19.21.29.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 21:29:16 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	guoren@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	lukas.bulwahn@gmail.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v4 10/10] RISC-V: KVM: selftests: Add Zalasr extensions to get-reg-list test
Date: Mon, 20 Oct 2025 12:29:04 +0800
Message-ID: <20251020042904.32096-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The KVM RISC-V allows Zalasr extensions for Guest/VM so add these
extensions to get-reg-list test.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index a0b7dabb50406..3020e37f621ba 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -65,6 +65,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZAAMO:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZABHA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZACAS:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZALASR:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZALRSC:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZAWRS:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBA:
@@ -517,6 +518,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(ZAAMO),
 		KVM_ISA_EXT_ARR(ZABHA),
 		KVM_ISA_EXT_ARR(ZACAS),
+		KVM_ISA_EXT_ARR(ZALASR),
 		KVM_ISA_EXT_ARR(ZALRSC),
 		KVM_ISA_EXT_ARR(ZAWRS),
 		KVM_ISA_EXT_ARR(ZBA),
@@ -1112,6 +1114,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(svvptc, SVVPTC);
 KVM_ISA_EXT_SIMPLE_CONFIG(zaamo, ZAAMO);
 KVM_ISA_EXT_SIMPLE_CONFIG(zabha, ZABHA);
 KVM_ISA_EXT_SIMPLE_CONFIG(zacas, ZACAS);
+KVM_ISA_EXT_SIMPLE_CONFIG(zalasr, ZALASR);
 KVM_ISA_EXT_SIMPLE_CONFIG(zalrsc, ZALRSC);
 KVM_ISA_EXT_SIMPLE_CONFIG(zawrs, ZAWRS);
 KVM_ISA_EXT_SIMPLE_CONFIG(zba, ZBA);
@@ -1187,6 +1190,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zabha,
 	&config_zacas,
 	&config_zalrsc,
+	&config_zalasr,
 	&config_zawrs,
 	&config_zba,
 	&config_zbb,
-- 
2.20.1

