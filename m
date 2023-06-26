Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FBFEB64D7
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jun 2023 18:20:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbjFZSUn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Jun 2023 14:20:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231717AbjFZSUi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Jun 2023 14:20:38 -0400
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BDC910FB
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 11:20:31 -0700 (PDT)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-666e7b83930so1567110b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 11:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687803631; x=1690395631;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ImRtxMlYFksXesGcg5ZEwinCVjK+1eznyzb1zuEq5IA=;
        b=Tdy68PWDHkjiU3GFNBhBXBkqsqiqqWAGIXJ/q4OjjptAOSfM5EY42+vLqgA8D8nXAS
         clXF5BXCK0DJ71Va0Wz2nmU5U75ABUVVNq5Soj0T8VDpURZ3pOkkmiT0d6CAOe1ulwju
         zjeQJ1DH2VB+yypRy/vE4EAQw+QA0GV5wZ7PWldp9hocIQmtrsxFMYgGiycX6CpHqZ+C
         255CmNUW5d30tex1Crn09VGfnKT0f9g0h5xWaV48MbkB4xvLFFnOQMwOlGyQja8q+FmG
         9OnaPlIw+hwtf7bPt6nXd4VP1MQrnjlW8kFoiViD+b4ievS/+PZxZqEjIARqxF5GbQdU
         vW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687803631; x=1690395631;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImRtxMlYFksXesGcg5ZEwinCVjK+1eznyzb1zuEq5IA=;
        b=BDZDot6vAYQmLiSXcBNxBAm+gEWmCp7gLjIfWcWh8ohmJuUz8sXpO7MslnjB8IBeZa
         moZMUOZnj2DXKXK/5rA5B7kz0oQgNxEniVu8GQJiVSUT13+DWS+pvfpE341hOOIcyFp/
         HyJJ0pAwNoqVczHq7rOSKkLAWhULHCtpnws8lorSkFGr3dgaYs7uQ4bcawmvJchJn59z
         HhZjGf3FVWVSSx33V9Vra9dQlRg7gwrzHJUuwQ1p3ifLCuMkTOg38DV9mczRZFkQTUVy
         3w/+TCjEm4UyP6hUK5eNekP6TocfjBBIqGgtyLkV4vw4Tum1V4JQXPJmnddJrNQiYYtA
         tGlA==
X-Gm-Message-State: AC+VfDyWNk5s9wnjqU+X6BilB7Zi79r2Rsv6PTb5eawpe7u7IL7y5z9k
        3VIZpPmR87xohyT3+ts5ZY+GGamlV2S6
X-Google-Smtp-Source: ACHHUZ6Xm5XTTB6gU7PnMdzSwbfdec0L51WkX0uwv6yQ15WhSWbv1AKPANZ7pk/pz4xlrtsDhZ9AsKLmNz+V
X-Received: from mizhang-super.c.googlers.com ([34.105.13.176]) (user=mizhang
 job=sendgmr) by 2002:a05:6a00:2d0f:b0:675:b734:d30f with SMTP id
 fa15-20020a056a002d0f00b00675b734d30fmr1001451pfb.4.1687803631156; Mon, 26
 Jun 2023 11:20:31 -0700 (PDT)
Reply-To: Mingwei Zhang <mizhang@google.com>
Date:   Mon, 26 Jun 2023 18:20:16 +0000
In-Reply-To: <20230626182016.4127366-1-mizhang@google.com>
Mime-Version: 1.0
References: <20230626182016.4127366-1-mizhang@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230626182016.4127366-7-mizhang@google.com>
Subject: [PATCH v2 6/6] KVM: Documentation: Add the missing description for
 tdp_mmu_page into kvm_mmu_page
From:   Mingwei Zhang <mizhang@google.com>
To:     Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mingwei Zhang <mizhang@google.com>,
        Kai Huang <kai.huang@intel.com>,
        Jim Mattson <jmattson@google.com>,
        David Matlack <dmatlack@google.com>,
        Ben Gardon <bgardon@google.com>, Xu Yilun <yilun.xu@intel.com>,
        Zhi Wang <zhi.wang.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add the description for tdp_mmu_page into kvm_mmu_page description.
tdp_mmu_page is a field to differentiate shadow pages from TDP MMU and
non-TDP MMU. When TDP MMU is enabled, sp->tdp_mmu_page=1 indicates a shadow
page for L1, while sp->tdp_mmu_page=0 indicates a shadow page for an L2.
When TDP MMU is disabled, sp->tdp_mmu_page is always 0. So update the doc
to reflect the information.

Signed-off-by: Mingwei Zhang <mizhang@google.com>
---
 Documentation/virt/kvm/x86/mmu.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/virt/kvm/x86/mmu.rst b/Documentation/virt/kvm/x86/mmu.rst
index cc4bd190c93d..678dc0260a54 100644
--- a/Documentation/virt/kvm/x86/mmu.rst
+++ b/Documentation/virt/kvm/x86/mmu.rst
@@ -278,6 +278,8 @@ Shadow pages contain the following information:
     since the last time the page table was actually used; if emulation
     is triggered too frequently on this page, KVM will unmap the page
     to avoid emulation in the future.
+  tdp_mmu_page:
+    Is 1 if the shadow page is a TDP MMU page.
 
 Reverse map
 ===========
-- 
2.41.0.162.gfafddb0af9-goog

