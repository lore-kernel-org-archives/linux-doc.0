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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F92C64E7C
	for <linux-doc@archiver.kernel.org>; Wed,  2 Dec 2020 18:43:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81E46206D5
	for <linux-doc@archiver.kernel.org>; Wed,  2 Dec 2020 18:43:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731037AbgLBSm7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Dec 2020 13:42:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731033AbgLBSm7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Dec 2020 13:42:59 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33894C061A4F
        for <linux-doc@vger.kernel.org>; Wed,  2 Dec 2020 10:41:44 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id g14so5111943wrm.13
        for <linux-doc@vger.kernel.org>; Wed, 02 Dec 2020 10:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y2p8Ay2XnBVL3vmtVVdiQ6iCXfVcEKgd2S1Ri8Ky5yc=;
        b=RVZK76j4k6bFwiXLgYuFF1wtJaBoX2V07k5mb0zz2XzuAWmLJ1i+F8W5NohjH00/sj
         gWlE7qrSAwcbIAEG3hSs7PAR248eOVkY6Xm3SGr2s7GCAbFd1nsA3SXKbGnzIxFSrkg8
         irlXEGzEcD3yJ1mQ7deVRYJx/fqkEt/rYVXS4dv7nID08H9qJKazcokqFUOi0xPNWDmc
         wSiS1Rr8Nrm4KLg51r8BdgmhZJ5lT0++p3Ln9OxqEdQrrLW0MIdiVj2Hn7v3NIVuTRH5
         LzsCZkvPa5kTdTcpPz8VJgGlrbBlyP+9VsdgTapGlKyPChgjeyjIeM7KiQROiHGleMKZ
         qLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y2p8Ay2XnBVL3vmtVVdiQ6iCXfVcEKgd2S1Ri8Ky5yc=;
        b=lbeYK5/Veeghgfnp6XDBtP5xyMVcSq8zAzko7yM8D0LrmU1mlQ75ASR+0DK+wMGALv
         FwqsgoWnrb03ywDo/6Kv5I4T232tHCnuqd0CVIDBFZOxO/9yZ+R3NyVlN7jQRQj1IMHp
         n0CGk6k0jmVNic6D9wXER7hn7SNo1i4qT79thox7Le+rPShXz9UIpMz2rtDjtKnQyMvC
         dl0n7o47w2Jpn2V75iGvwOm/vMqgcUeGPYIg9cnVdlGxlyOK5rUH8i9gsjUKtfW0OA+L
         q4grLW/+L1vBxJwsUQX83buuIpQIwE/r8NB0nzstIi7llY2aOslspxbisO7FuSOZleUv
         XC/w==
X-Gm-Message-State: AOAM532d0qR+l6Et2eTxKf4E2xzHpxOPcwCcUG3afxVQJjS16e0iBsZd
        cWQTwpT4MUaTh7gSJY1F5RY+Tw==
X-Google-Smtp-Source: ABdhPJxAQnxesV8ENz1UWdK5eE8OCnghkt8xaIi7bsuMXjZf93/bl2MjqeL5MAHnTzF9beINxPa0Kg==
X-Received: by 2002:adf:c443:: with SMTP id a3mr5093368wrg.249.1606934502768;
        Wed, 02 Dec 2020 10:41:42 -0800 (PST)
Received: from localhost ([2a01:4b00:8523:2d03:5ddd:b7c5:e3c9:e87a])
        by smtp.gmail.com with ESMTPSA id v20sm2813264wmh.44.2020.12.02.10.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 10:41:41 -0800 (PST)
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
Subject: [PATCH v4 07/26] arm64: Make cpu_logical_map() take unsigned int
Date:   Wed,  2 Dec 2020 18:41:03 +0000
Message-Id: <20201202184122.26046-8-dbrazdil@google.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201202184122.26046-1-dbrazdil@google.com>
References: <20201202184122.26046-1-dbrazdil@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

CPU index should never be negative. Change the signature of
(set_)cpu_logical_map to take an unsigned int.

This still works even if the users treat the CPU index as an int,
and will allow the hypervisor's implementation to check that the index
is valid with a single upper-bound check.

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

