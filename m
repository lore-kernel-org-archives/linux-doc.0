Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1815221BAE0
	for <linux-doc@vger.kernel.org>; Thu, 17 Oct 2024 19:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729191638; cv=none; b=JRpeSI3r8ydt+BDIhd2mXnD9FhpSljRr/bhDQSXxNq66R3yfuZ1d10jelyaFRz/wwiGml954uMOUXInr4du2QDOCF9lZwDV8HfNFMl3irLSlxazb+5pONtwXwg6KpinqHZB9HlvD7e59edp/Ze7B6ncnjaxtjvMfJoZDFyawY5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729191638; c=relaxed/simple;
	bh=g2tJiRoxLum8uoGCeorfGNfvWEQuDt/LiQsoCHBZJJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pfcS1Z5dRqAqdirx8kG1/2ekwxnu9u/9nYyqQZohDlp1iJzhK4f3NgGfRsGoLUbW5KxPUhPiVkvPWqEc9byzl1ymoFu0cMFpBQeJUFbuuxPM1Qf1d375gi0AjrYN5V16R4xNwY2Fh/5/mfCsQfk6tZcTUTpcow+i3Av3/yv68Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ZItbqyX4; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ZItbqyX4"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e28b75dbd6so972668a91.0
        for <linux-doc@vger.kernel.org>; Thu, 17 Oct 2024 12:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1729191635; x=1729796435; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZtSSNHjp9RieAv6xqx5h/2YC/5BXaB/H3bPub1QA44=;
        b=ZItbqyX4k4y42vnFPdE18dBo5jg9ggwpEi9D7WTVn5y8QxGFXgtah4F1z9fiLh4Z9k
         2/Z0cEu6RadvEzFAlTOl04KqglgrWsD+yHvVlGU8vdSAbVqWWzLR5CC6gLCifbzD6r+z
         cT2keiDvubL4C26gyo/PhUwg83RkumUOPxW7qErU3KwDxWoQL9Og3ggGyY/+9cBqtZ8j
         Bz1tlNcaKXNiXslUNcbGVA19HB2raaAqSzjkQ1NxcpnnazIUCqh0dwGx3yHNM2rzvmny
         wkPGP810d+XMD5Qp5xbXlTsf94IKbKUjQ7oYnKfq0qQgNk79pr4QrRq3hHRbhTM0VlU8
         nFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729191635; x=1729796435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZtSSNHjp9RieAv6xqx5h/2YC/5BXaB/H3bPub1QA44=;
        b=BxKwLL2bd82gPrnl8jIYvX4/kBa9CPYyoVdhyCf+3MfAr5203a6ytdeaawYuV2C2Px
         EYuyQQ4LbHllPO1PxL5Fh06W23gWKpibgpTdhw2Ui/hegZn4xsve9qaDggPAjkoW77tL
         pjh5Vi3ncycg6PNNH8vTwtg0ZQi1HDVqP5hdHUs6y21wlBq4mreHxQzyAqOsktvkcKN8
         68DjDRyDCr2xjpVvnfKr7BYNUffhV9R0BrmIEH+72G/pALNx5SsyZ9hszwUlPBi1N9mr
         nqTmk9YYK3NkICwkrNtMU5M7oyDSA4BEU/VlXpq8yPAYD69FHjTcgc6IQCy8U+lQ4fmx
         Z5Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWKWLS+ppbFTbd51VeGtnrfCwqMyaNKxVjCwbMIrrrGNzU3T/aXIL2Arooxc8yDe51PLsUEqqThbPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB/2lWnxUkUtrjhTAuQp2bpeklpiNBi61RI5srVYX+PtLAWrs2
	CsI7fQradb9BPC9D56aU9pE9L4Nn7PP7zorBHx05Q09l1qbdu/zlXAFSyHQ3E9s=
X-Google-Smtp-Source: AGHT+IHTHDlITbXdl9xEaSwI+H+sXmZc1xXbLtusAMsDCjHmg2KFj3D2j/1IOgRBzWvA/vwAqAQd3Q==
X-Received: by 2002:a17:90a:640e:b0:2e2:b64e:f506 with SMTP id 98e67ed59e1d1-2e3152cb666mr25543882a91.13.1729191635225;
        Thu, 17 Oct 2024 12:00:35 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e55d7bf9a8sm217766a91.13.2024.10.17.12.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 12:00:34 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 17 Oct 2024 12:00:19 -0700
Subject: [PATCH v10 2/6] RISC-V: Scalar unaligned access emulated on
 hotplug CPUs
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-jesse_unaligned_vector-v10-2-5b33500160f8@rivosinc.com>
References: <20241017-jesse_unaligned_vector-v10-0-5b33500160f8@rivosinc.com>
In-Reply-To: <20241017-jesse_unaligned_vector-v10-0-5b33500160f8@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Evan Green <evan@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Jesse Taube <jesse@rivosinc.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1176; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=NcyP21pVMP4IjhRseZL4TuagKvpz9wkgoVbiu+LRgZ8=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ7pg3Bn5OXGT99YZcU4/wHRNont+3+XS6ZvXNH9qjHla8
 z2BP7uro5SFQYyDQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgIlkzmT4X/v+nrzsbbmsBru2
 bC2zUyFFstsUis01F6sfulu3TPzTQ4Y/XC8Svm/Pfz57+5Lk9K5gEymResXbv+Uc+LTvhbzrOz2
 NBwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

From: Jesse Taube <jesse@rivosinc.com>

The check_unaligned_access_emulated() function should have been called
during CPU hotplug to ensure that if all CPUs had emulated unaligned
accesses, the new CPU also does.

This patch adds the call to check_unaligned_access_emulated() in
the hotplug path.

Fixes: 55e0bf49a0d0 ("RISC-V: Probe misaligned access speed in parallel")
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
Cc: stable@vger.kernel.org
---
 arch/riscv/kernel/unaligned_access_speed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 160628a2116d..f3508cc54f91 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -191,6 +191,7 @@ static int riscv_online_cpu(unsigned int cpu)
 	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN)
 		goto exit;
 
+	check_unaligned_access_emulated(NULL);
 	buf = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
 	if (!buf) {
 		pr_warn("Allocation failure, not measuring misaligned performance\n");

-- 
2.45.0

