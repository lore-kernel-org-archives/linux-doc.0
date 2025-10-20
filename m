Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE332C026A
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 04:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760934346; cv=none; b=RSz00Mgf9R5hn5R+ECyepXNOxwQQ96KjHMiHcS008mM67RPV1PhuYCJdSj61WQBl8fCiADmdyqIg7jjcvBwUbbxkfdVgPj81NsGolQb1aKHZUVK/FrNBZDSsRN2+I3Rew2YQR8b8Ly0pNKjCwTEJIkt96sMdZPtan16E7AO64EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760934346; c=relaxed/simple;
	bh=B02ziWQmo5WsV+VWudXschLhIhlEAVaMv4vSaAYkoAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gmCXRi+UlwnBN3u/J53THd9Nys/GzS4oz2l8G9/cXllhQYZ3W2VN4AEea2f5wqOwvPo2ca7wLdbn6qgEhq1G/EYT2Llc7m/Ibxksez301ZHRa1NtqA2oAEvAUf0/vIsZM54h9vZ6U2GWlXVq5hIEfn7NOn8+eN7PoDn4jmSXgEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=XGPSyqSR; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="XGPSyqSR"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b6a7d3040efso956261a12.1
        for <linux-doc@vger.kernel.org>; Sun, 19 Oct 2025 21:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760934345; x=1761539145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvb+N79+1rz+7OJYvNB/1WfSxRwqST+oSw7w/swSoZg=;
        b=XGPSyqSRnRhq5JmulstB1NXdKZIsaEyEk5/nwN1cBuSSDVPpH1LoGGVlnP8clTE/aE
         my4xciFeoPjbtJRO/3H1D6AXEgKk3pna5kfEOLDSaRVTprBYPj94nkdjxgWTPDkWI5/J
         fiCqGnJXalcvfT7223jn6dqZTs5nGGBHEp7di2alh48AR53v+J9ViKkdy9RNoSRSG+Mf
         Mz+g/E0pOUZpxEa6UJEAuHAGLEfSKHNy2zE1qthztfi+RF2fLhZi0cA9tfVL6k42+ymy
         tHQYcAHS8xUBZqlE63JTOV3ygUPL14ISJbRktfNbt8Ewpp7PGEHZ5XFDCR3jwd1f6lEg
         8BXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934345; x=1761539145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvb+N79+1rz+7OJYvNB/1WfSxRwqST+oSw7w/swSoZg=;
        b=IptdWwbVX5JhnL69v3Fh45yAvZBWK4AOikzTtlgVCcYMlrFOSaI08WKQb+3jvpAium
         iItJ9d62O1guWnpBy2VF4rcMyXn2JnlUDUV9BbHTNHwCco7+rmdAxDLRzEoO3yW/IwQu
         yGHqdt5pCDcOnQpafGqQffq/AfFOAFHayn2iu8cJ0C4p+PTrZ4equqOq+dO5buBQlAvQ
         6+FDYVASbx8Y7CdwVOE9JvDbZIskbKRdBUgw+0yJn3lJvO94+FysPNzYt/Q0kc/HAC6B
         EY1cfHfbuK2hLHCuItDTo3wMSinXscB4ars+m7PwavcMoBIFXQSD7IXOGSl275LQCs1X
         eZdQ==
X-Gm-Message-State: AOJu0YxBjiKDeeN4jnGfHxdW83ohd/e4jXnrKVSM1U/VNJv5or+No8aF
	fzw0MeG6AHsBjDaTvPsg9NjRW4tSeqkBZIA7KoI80Qsa9mfnswJz8c7hB4Xki7iDIpA=
X-Gm-Gg: ASbGncvTR4nqv8ByY2J+3ZVwj97Ky2qSwB6dPHLRKErBiRgRLQpqYr/2nenlrMklvSs
	XdklLiWqJeGTFkiwGtJgvfErCIuKV7c2NGOUBusKK0ysEeaXY7FhFRG2vJSCVpb8xiJemKyfWzE
	n0LaHbUaJ3WI1B+vHBNS24nMck5N1vXoODwxHpQ/K7OgmgR+5QcYSwr/nLld6qhsnQf2IkTyXQO
	rHEiMNvjBHbqoyh0GwFtiWqi1WnzmuKiQdzIjFEr6XkC0o1npueIp8Mkq0rLxdhUaEe4kQ8VbMJ
	j6SG61wSHWejwknFygC/dBecQQdOLrxl5owTznmXY5G/iMbiZN9vley6AZkAHOSsL8cnOCTPB6R
	tb06Ogb10IG9dE1crFu0+Ke4JP8NnaSSN3AfSiO5bpo35WC7N70aS2V6cPv9keFq/YlVwJmNSEH
	4LPFVjaAx9EJIWH7XT/xlF3azlhmmM07Pju70p+xCj8Y+klxOFPDglKsmBWA+6JOo/Oyjq3mfoV
	Q==
X-Google-Smtp-Source: AGHT+IH0j6CDe697/Hu2JYLa69TXmwS2tLcGClfdWod/OVynSzlnBv0UTOF6Th9AWlAgJGMUHpIxww==
X-Received: by 2002:a17:903:3c24:b0:269:8f2d:5221 with SMTP id d9443c01a7336-290c9c89cd4mr136224525ad.9.1760934344799;
        Sun, 19 Oct 2025 21:25:44 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ec20a4sm68319325ad.7.2025.10.19.21.25.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 21:25:44 -0700 (PDT)
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
Subject: [PATCH v4 09/10] RISC-V: KVM: Allow Zalasr extensions for Guest/VM
Date: Mon, 20 Oct 2025 12:24:56 +0800
Message-ID: <20251020042457.30915-5-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020042457.30915-1-luxu.kernel@bytedance.com>
References: <20251020042457.30915-1-luxu.kernel@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the KVM ISA extension ONE_REG interface to allow KVM user space
to detect and enable Zalasr extensions for Guest/VM.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index ef27d4289da11..4fbc32ef888fa 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -185,6 +185,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZICCRSE,
 	KVM_RISCV_ISA_EXT_ZAAMO,
 	KVM_RISCV_ISA_EXT_ZALRSC,
+	KVM_RISCV_ISA_EXT_ZALASR,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index cce6a38ea54f2..6ae5f9859f25b 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -50,6 +50,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZAAMO),
 	KVM_ISA_EXT_ARR(ZABHA),
 	KVM_ISA_EXT_ARR(ZACAS),
+	KVM_ISA_EXT_ARR(ZALASR),
 	KVM_ISA_EXT_ARR(ZALRSC),
 	KVM_ISA_EXT_ARR(ZAWRS),
 	KVM_ISA_EXT_ARR(ZBA),
@@ -184,6 +185,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZAAMO:
 	case KVM_RISCV_ISA_EXT_ZABHA:
 	case KVM_RISCV_ISA_EXT_ZACAS:
+	case KVM_RISCV_ISA_EXT_ZALASR:
 	case KVM_RISCV_ISA_EXT_ZALRSC:
 	case KVM_RISCV_ISA_EXT_ZAWRS:
 	case KVM_RISCV_ISA_EXT_ZBA:
-- 
2.20.1

