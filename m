Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8691F3BAD
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 12:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741089619; cv=none; b=Drtc0G1jLHVcpjPPXOQO01cCQDj6b3QzKkgV8Uurs1ulgbdIuJzW5EObx4Z+UTSOofYl/hjlzeG1yNUtC9yhvOiA/zwoPg/kRsKCn01rl3j/x8Vf5h+ulg4J5j7m2WhJxCWajOr/8TVrLM4gFO9o2Pjovl+4NBvRuEIYkg1Ux0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741089619; c=relaxed/simple;
	bh=lAYc3uG4ODtfGd5Uci1oNMxfRTh4DPCMHXRMjqJre6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NAiPuX6DEmJ1zkUGYepBBcFK5UIW1BKssOpR/zPBEm7g30peXp1ogzB092uyf5eWW40cmKotvPDoRw0cwsRwz5yFKFZgIYjsydUuJBWlw36hNga5EN6WzEvY+qHCRFO6jX8aGU18OJxr9cjJCIQY0ALyiomaULpNY3eXNYQPgC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Iau2oren; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Iau2oren"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4398ec2abc2so49863275e9.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Mar 2025 04:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741089616; x=1741694416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NB210ZztxQ2LtczNET1K44yOz6rQJqr3jB3V+b0mE4A=;
        b=Iau2oren3rnWy6jgmlRdEOhf6gWcweP21qbGPrfuDkJjP8NtfxesQKzli57/YUBEt3
         WGiHR62Lo6kaIrxuz0f/WQEU3qDW/JpY5ASXtXLLEUEO1Pu/3vhOwXyE44SoKHHg/1Gi
         UJ+WSfMktJr3xTguVqqUlDUvfPoODNQujGX7quc+5RnYuuEFXkNBHk+b09twHC6R6W7/
         E083pXjIrWzO7OWy6rdF8EpmyAceXSYRdB86K+iOqgRjCkAbbaJcFZhqeqRkmJ1/3SFR
         uaN96/0fnQAaeu3m8+XXk2ZWQFB4Kcq0Zjc6FUQ25z2tklxAUVLABn2TA2rUVZXdlqHO
         6fXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741089616; x=1741694416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NB210ZztxQ2LtczNET1K44yOz6rQJqr3jB3V+b0mE4A=;
        b=IZykI3Lv/Q1KvzEngPbQUItWBza+7m0K0G2FaRWxrvJJ8evnOnbpEpC1XhRuujnKVk
         lbMa2IHF/t1WnjSn0fVGRCqQkQOMYsOnvQ6/aQnSPQtoDZ0eNUv4Lz2oe5w4BVWPcQaO
         gRT9GbgznbrCnVis4Z1J37rKP93TP997jx45gYI+vdZfu0IefnT6dQJelP2hXkIIVHJw
         1gFmTWvuXSNrJ53PAx7O+pF38+L87uPblKf12UqLl78GqYdZ2OasNc8UgRXXorC4vrqf
         BOa2tOMtZ+jgVBi240fsy6j9gjXVSjHeWstOVsrFbW04W62Eh2HInHrcbHkEoK3lOu60
         4fyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVruFdGQ75Bwm3ayiWqUSFFAiHST5NARZFgZBivbWU8RYTfH1bn4E4gMt8awJVUV3fi2Hn6k11WKqA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx05tgiU5cwn/FYWGN9WvvkRbRDlj8bfXhPtmSIU73BaZqX6pMK
	e8QIdA5t/QnqRBKh/d2oY+7POaCGWuGehVbNgKsrs93CKE+cO1fRh7iY/NwXGG8=
X-Gm-Gg: ASbGncutCTAW0RAtarspTENrOPSVF2FD1eUM3aDd5Ac76tRGS4zH5KZdrGfLSta5K2b
	bwFpDoE2YKFcaX8Yfbn2DqTbI1gZZi3YIOUEZiNdmkGX60KCBy4mmdUdDzJt1lk4FTF/Q92qD8c
	qpiBpIhuirPjHTbd6knN8KBp2TWJaoVn/qV1d2S5dkPyMF6pWLpZ4H/ZeX1JREk3VVLU8lLqfbY
	PkEaFQ2wJPXTA6MkRCV3nJjqzfoSTILKpdmUxcedTstkzr/CGqUWlREFRpkMD6UksPtf9dCYbN6
	WLdrHruC195l33p74lHFK+9oYnFY33fn
X-Google-Smtp-Source: AGHT+IE28Ld4ZbsEY6m2165jne/c4f8G51MRYc/QAM+rC+BPf+C5KmQYo2vTrDADjsSOJ3h4TGPaEw==
X-Received: by 2002:a05:600c:4f95:b0:43b:cf9c:6ffc with SMTP id 5b1f17b1804b1-43bcf9c7b45mr3677925e9.12.1741089615752;
        Tue, 04 Mar 2025 04:00:15 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::688c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b737043aasm192879455e9.14.2025.03.04.04.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:00:15 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Anup Patel <apatel@ventanamicro.com>,
	corbet@lwn.net
Subject: [PATCH v3 0/8] riscv: Unaligned access speed probing fixes and skipping
Date: Tue,  4 Mar 2025 13:00:15 +0100
Message-ID: <20250304120014.143628-10-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The first six patches of this series are fixes and cleanups of the
unaligned access speed probing code. The next patch introduces a
kernel command line option that allows the probing to be skipped.
This command line option is a different approach than Jesse's [1].
[1] takes a cpu-list for a particular speed, supporting heterogeneous
platforms. With this approach, the kernel command line should only
be used for homogeneous platforms. [1] also only allowed 'fast' and
'slow' to be selected. This parameter also supports 'unsupported',
which could be useful for testing code paths gated on that. The final
patch adds the documentation.

(I'd be happy to split the fixes from the new skip support if we want to
discuss the skip support independently, but I want to base on the fixes
and I'm not sure if patchwork supports Based-on: $MESSAGE_ID/$LORE_URL
or not at the moment, so I'm just posting together for now in order to
be able to check for my patchwork green lights!)

[1] https://lore.kernel.org/linux-riscv/20240805173816.3722002-1-jesse@rivosinc.com/

Thanks,
drew

---
v3:
 - Fix compile when RISCV_PROBE_UNALIGNED_ACCESS is not selected

v2:
 - Change to command line option from table


Andrew Jones (8):
  riscv: Annotate unaligned access init functions
  riscv: Fix riscv_online_cpu_vec
  riscv: Fix check_unaligned_access_all_cpus
  riscv: Change check_unaligned_access_speed_all_cpus to void
  riscv: Fix set up of cpu hotplug callbacks
  riscv: Fix set up of vector cpu hotplug callback
  riscv: Add parameter for skipping access speed tests
  Documentation/kernel-parameters: Add riscv unaligned speed parameters

 .../admin-guide/kernel-parameters.txt         |  16 ++
 arch/riscv/include/asm/cpufeature.h           |   4 +-
 arch/riscv/kernel/traps_misaligned.c          |  14 +-
 arch/riscv/kernel/unaligned_access_speed.c    | 237 +++++++++++-------
 4 files changed, 168 insertions(+), 103 deletions(-)

-- 
2.48.1

