Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678C1C83023
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 15:55:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3294A21D46
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 15:55:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aDvl7dCl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403904AbgKZPzb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Nov 2020 10:55:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391423AbgKZPyn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Nov 2020 10:54:43 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0774C0617A7
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2020 07:54:42 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id c198so2579195wmd.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2020 07:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZrCAS9ygWkC2ufXbj2Wobao4dQO/5x9OhapFi6lV40s=;
        b=aDvl7dClV2uddSkR11BaXY3pN+uz5HABtJLBS7EVNJEKoJNZV0iBk9o8D59nUGH/+a
         3B7FnrMyxDa9I5WhiMmMzlAgUJydOA7B1ixiCwBNjGHS2f23ntZe758HSRDydqFfNx0G
         AqoHtivWbZj+IUF4KFbqnve9WibgLTwyw/zq0e3ULZgspz4+L2SoR4O0BzQb0HfNfyP+
         VYu7VHGair8YbXPnsqfj10NbpQwbS+RfY/5HLENNvh3lTrEkIqim4RFcHVQKoZZ6IQRB
         oNuaz8WBT941Oa80szhb6hkSCeWKRh0zO+o7NbC2ztdnZAqmYks//F5Q/aWEttvKUeYa
         +CyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZrCAS9ygWkC2ufXbj2Wobao4dQO/5x9OhapFi6lV40s=;
        b=flWFz76vXVxyjifY5QuIsxqSdSdS3M338ocjlpB2vF5H49O8pfmkXWdrMndO9wkqtH
         2Boqy/ofCU3Si+N9QNbR/0e/7swvsV4jvTkepJtREQxCjtgyFOjINhwOa8/uK2LlxwTb
         paqPmmfgNZZAk0yRs8f+ovIlViwOeqCKhzkxbet+y3A1Q1lIHHW8qb0+Hp3wlvVRWiS8
         cFgdRJbe+oEvGjk2KWyKcL2EvAdjHm1rF8hz+89AQhcWxkWjwRz20kD0UNf4VNmLLqzO
         3r7zWKPT6Mk0NIe6vKmhZccEaR9PUGafn/GI3juE5Ul/cnnTojlNoVpEE2zFTHR04rzI
         dtmA==
X-Gm-Message-State: AOAM530kTwpigh0+3JDpc0TfNTeyDiTL2DbACSQPYPcOi0aX8Fy9fpBu
        3tZEiz2Jl2l7x7P3/C3yXJyGfQ==
X-Google-Smtp-Source: ABdhPJzjuSUApvEOEPjZQvj0RwSRQkwjvpqFgqkQbvkP2wAo7cyRvkYNRsvgHC/RhJaCaStDd8X2AQ==
X-Received: by 2002:a05:600c:286:: with SMTP id 6mr4043009wmk.125.1606406081513;
        Thu, 26 Nov 2020 07:54:41 -0800 (PST)
Received: from localhost ([2a01:4b00:8523:2d03:f008:704d:8d4b:9951])
        by smtp.gmail.com with ESMTPSA id s2sm9141206wmh.37.2020.11.26.07.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 07:54:40 -0800 (PST)
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
Subject: [PATCH v3 07/23] kvm: arm64: Initialize MAIR_EL2 using a constant
Date:   Thu, 26 Nov 2020 15:54:05 +0000
Message-Id: <20201126155421.14901-8-dbrazdil@google.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126155421.14901-1-dbrazdil@google.com>
References: <20201126155421.14901-1-dbrazdil@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

MAIR_EL2 is currently initialized to the value of MAIR_EL1, which itself
is set to a constant MAIR_ELx_SET.

Initialize MAIR_EL2 to MAIR_ELx_SET directly in preparation for allowing
KVM to start CPU cores itself before ERETing to EL1. In that case,
MAIR_EL2 will be initialized before MAIR_EL1.

Signed-off-by: David Brazdil <dbrazdil@google.com>
---
 arch/arm64/kvm/hyp/nvhe/hyp-init.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
index b11a9d7db677..17b58dbc3a2f 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
@@ -111,7 +111,7 @@ alternative_else_nop_endif
 
 	msr	tcr_el2, x0
 
-	mrs	x0, mair_el1
+	mov_q	x0, MAIR_ELx_SET
 	msr	mair_el2, x0
 	isb
 
-- 
2.29.2.454.gaff20da3a2-goog

