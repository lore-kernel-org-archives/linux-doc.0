Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF6A9C64E7C
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 15:54:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8551421D40
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 15:54:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WB708Y6Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391363AbgKZPyf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Nov 2020 10:54:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391347AbgKZPye (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Nov 2020 10:54:34 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60275C0617A7
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2020 07:54:34 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id u10so111206wmm.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2020 07:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t3ZEYk2Uf0v1klDyIVNllC4hj8a8TzhOU5HlrW3d3XY=;
        b=WB708Y6ZQsVTnPDe3k8SGt1N+Zi1ArG5DNJ8Ikjx+GwIsVyKkyANitm+7v9D8STbCN
         4sIx6XZ9WxtYX8XP7V/bVY64iZPta0oEQJhY5JctNUzEqp/siO8Mh7MOaSHI9jTKRX/G
         ba18CMjyRpguJUKBwLVRI8k5AHvlNVRnB1DKj5K2COahoTLJrC8pp74gWQmVJtRJ8ivp
         fJffW03dFEtg1jOc/x7+J4NtCy/6j6euZgUM7vcZ5okmBEc+hu9CLbAHOr83RhZZ7PAd
         Ya9qvceAHvZJLaq5R4L/3OTpAnWZot8Djf5EA45iNDBN22H7c4JKiI1EzSkX09tYRLsS
         Ahyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t3ZEYk2Uf0v1klDyIVNllC4hj8a8TzhOU5HlrW3d3XY=;
        b=M1QvpzXaAQCTLzmWnVM3XWg6ary/1cnR1SsrRC/kUqcVQioYcgaaw2IITEAwT9f5se
         N0Ugj75Axbq9wJ2k8fRStKm2y/LchP5WFom+qlsTn/AiaX3TXWY3THXCQRIrfx/9iSQt
         XVnLR0EHCzpsiGPFeCD6KZKY4/aN92XfAsBo3gwUnk8BzFHFAv4Oxz2z9nh7+Z6uYc2y
         gMWlK6qzS2IcI/M7nscJb50b8PZTx9MBbVcYg79WAsGaPhdyk6pUL4HvihJOompa6/lj
         r78a7HLI/iRFMcHTMBzQys4HAtWqD3MdUOEWpHOtZAZnUPZoqLsxeTHVnM0/mlobl4xD
         Ku1g==
X-Gm-Message-State: AOAM533cD6MDCjzSuJTy7NaL2nKmM4cv6GvvbUHKtKQu4ZR7mEottqZm
        b7cLFZE0e604fg7M8W7BizgGUg==
X-Google-Smtp-Source: ABdhPJwqAqu5fiW6MkcfS54w+9X9od3V8YYUykJ0+y44LSiV/rX3jrG5iDECe1WB8DPMFJnBgkCsIA==
X-Received: by 2002:a1c:3b07:: with SMTP id i7mr4113356wma.118.1606406072986;
        Thu, 26 Nov 2020 07:54:32 -0800 (PST)
Received: from localhost ([2a01:4b00:8523:2d03:f008:704d:8d4b:9951])
        by smtp.gmail.com with ESMTPSA id d8sm8607196wmb.11.2020.11.26.07.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 07:54:32 -0800 (PST)
From:   David Brazdil <dbrazdil@google.com>
To:     kvmarm@lists.cs.columbia.edu
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@linux.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@android.com, David Brazdil <dbrazdil@google.com>
Subject: [PATCH v3 03/23] arm64: Make cpu_logical_map() take unsigned int
Date:   Thu, 26 Nov 2020 15:54:01 +0000
Message-Id: <20201126155421.14901-4-dbrazdil@google.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126155421.14901-1-dbrazdil@google.com>
References: <20201126155421.14901-1-dbrazdil@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

CPU index should never be negative. Change the signature of
(set_)cpu_logical_map to take an unsigned int.

Signed-off-by: David Brazdil <dbrazdil@google.com>
---
 arch/arm64/include/asm/smp.h | 4 ++--
 arch/arm64/kernel/setup.c    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index 2e7f529ec5a6..bcb01ca15325 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -46,9 +46,9 @@ DECLARE_PER_CPU_READ_MOSTLY(int, cpu_number);
  * Logical CPU mapping.
  */
 extern u64 __cpu_logical_map[NR_CPUS];
-extern u64 cpu_logical_map(int cpu);
+extern u64 cpu_logical_map(unsigned int cpu);
 
-static inline void set_cpu_logical_map(int cpu, u64 hwid)
+static inline void set_cpu_logical_map(unsigned int cpu, u64 hwid)
 {
 	__cpu_logical_map[cpu] = hwid;
 }
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 133257ffd859..2f2973bc67c7 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -276,7 +276,7 @@ arch_initcall(reserve_memblock_reserved_regions);
 
 u64 __cpu_logical_map[NR_CPUS] = { [0 ... NR_CPUS-1] = INVALID_HWID };
 
-u64 cpu_logical_map(int cpu)
+u64 cpu_logical_map(unsigned int cpu)
 {
 	return __cpu_logical_map[cpu];
 }
-- 
2.29.2.454.gaff20da3a2-goog

