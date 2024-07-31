Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4607C1A4F0A
	for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 07:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722410773; cv=none; b=X3R74rCcL0o175jwbVT6bChmp+vYEP9ePjvl8YBhbWI+ns/U92W32Fa9NAjAZiQLL0+Pd1xVlciVm4qXQoUNH1SaJZqKxzOsq/5XWGev/P5B9t+eEZUQ2QFp4R9F4b4Cxn699uS/dxLhJc4eHWMeMfPywqY2N8GSPBizb08DnVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722410773; c=relaxed/simple;
	bh=J67YKbYp1c1+dYtGt9ihjp1nazBSRKyY+Dh1Xv6jDrs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GNc66IZ2qGWVeOuaopf2bEBCBcgQmTaOJTLm8/BGydcNfypgPN6mgxb/Wv3JzRHbaF9q5kqPtcAvlyQ0QnhYE+G1VmciY3KN4trlr9HMyPOxMAkvlHo2xXnpyRY5d8g7PgNAZRyHWA336WCQMvvTxdgL0RUADincEJwoiE7na7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=b5Gbn6IR; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="b5Gbn6IR"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52efa16aad9so8164570e87.0
        for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 00:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722410770; x=1723015570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5b/A6qU74AkfxdtYyxiBPFCfAn9Wby9ZSL7Rzcj1cY=;
        b=b5Gbn6IRAvY0tHkf/7Ai9odhhMKW2ZR1PwZk/hpn/QFX8afSXWRTbRRFejDQkRzcpz
         hIvPfOUBhPNSk5oQpwMQAvPfWoMvqIcIghXxVyut5fi2n9skxp4vcNAd2N1+4tiNCdhx
         qQiuKvRncHIN7rbh1e7mgLryENr9OLKIiHTuJameD/AseWb1vepFfMYmyohMdINw3Q/C
         B5R4r4O9wUtxSNoHQ6lAx2Du9EpDgvUqf0dor8OPcoc3SLCo2yjGpkwMmPv1HVzuuQI8
         GnpJphVjN0E8smQjioiIhltCn3vk2bdgpC7GLfkaAo1XOXVVpZq+Frd/aFPHYzWtO9KE
         ue/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722410770; x=1723015570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5b/A6qU74AkfxdtYyxiBPFCfAn9Wby9ZSL7Rzcj1cY=;
        b=tvuJ9W7Qfhsmei/MsuxAlABbSlGFXCqpO4AiUi88aseBCuzBpVARzypenjZK24N7BC
         R63go4X9ywgl7pjcoC/lAYyPbL1ffWNsoGlvMPrAt7zCyKhFA3Ageb/tPtZgRh10wcvl
         ddi6gCs/EIMG6FiCAs64R3l+NKwNuoEeCKTCJKA4u4je2rpjedZvLJYuVRL2110rlp3u
         KKjXCzYSQjKXvsCGAAD6iSLh8mvm2DKVbSucbrFOk/N91QAxrz5pwbYzZyH5o2duogeQ
         +XCXBi6v0RDYOIUlEN172oyxk26BXhjyxm534jea2VShPYcZSXPb4+p2SBrA58lOQVIK
         tbSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7tZFjNwWNJ5Brsv0Ozi1gKx//0vtSsUD5fa2kW1MB2yvTim6ppRhRg+K4QgAVoASqV61AG6D0F0Hvx+phRdSsT8kOBJmxdtxN
X-Gm-Message-State: AOJu0YxZxZRmDIZ30vGuLrUrOS+P16vkCAtglxNNjntEGnASWxYNXm5k
	RedmwkhC7DQabJ5st8zGCEY0rc08Wen+c8RElGhgBvGcO8tP4+09OsDaeWsbpNs=
X-Google-Smtp-Source: AGHT+IElDfoIlakrFYsMBeeLlbntHhhP6Di7Erttb/4pd4dWg5QISN3W8tux4DC9SLwXgyAkaGYd7g==
X-Received: by 2002:a19:8c58:0:b0:52c:f12a:d0e0 with SMTP id 2adb3069b0e04-5309b27a656mr7792329e87.28.1722410770171;
        Wed, 31 Jul 2024 00:26:10 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bac7349sm10525575e9.27.2024.07.31.00.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:26:09 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 02/13] riscv: Do not fail to build on byte/halfword operations with Zawrs
Date: Wed, 31 Jul 2024 09:23:54 +0200
Message-Id: <20240731072405.197046-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731072405.197046-1-alexghiti@rivosinc.com>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

riscv does not have lr instructions on byte and halfword but the
qspinlock implementation actually uses such atomics provided by the
Zabha extension, so those sizes are legitimate.

Then instead of failing to build, just fallback to the !Zawrs path.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/cmpxchg.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index ebbce134917c..9ba497ea18a5 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -268,7 +268,8 @@ static __always_inline void __cmpwait(volatile void *ptr,
 		break;
 #endif
 	default:
-		BUILD_BUG();
+		/* RISC-V doesn't have lr instructions on byte and half-word. */
+		goto no_zawrs;
 	}
 
 	return;
-- 
2.39.2

