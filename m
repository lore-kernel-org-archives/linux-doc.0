Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7A2C433ED
	for <linux-doc@archiver.kernel.org>; Mon, 26 Apr 2021 09:09:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41B3461184
	for <linux-doc@archiver.kernel.org>; Mon, 26 Apr 2021 09:09:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232743AbhDZJJk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Apr 2021 05:09:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230343AbhDZJJQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Apr 2021 05:09:16 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83D5CC061760
        for <linux-doc@vger.kernel.org>; Mon, 26 Apr 2021 02:08:26 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id f11-20020a17090a638bb02901524d3a3d48so4788347pjj.3
        for <linux-doc@vger.kernel.org>; Mon, 26 Apr 2021 02:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V50YyMbdbg4kQSCC5l/2b7FBtbZFhZcyEXS5Kc3/Kqk=;
        b=Za4K1kqevYO48etJVHFvsJSz5Lpt2B7otONeFbwl8U91tfs2k0ZWOgpaTPJvoqt87r
         GnZRGMhsbds1i7v30bAxXk5gcYXkOtmC8hBem5xAO+Hi8iW5e62iU0AlU5brTo4SNSyn
         JDC40NZFnx4VaEdPeYrHKVQeMEDa1Q9y1dXiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V50YyMbdbg4kQSCC5l/2b7FBtbZFhZcyEXS5Kc3/Kqk=;
        b=qiNului+o3veLWK/LvA62QojVlcSksnWbQgNgq5gdjTNOUb16fKRJC7KTOivP+Hsre
         m/bwgie7WLhcWbaK9vL+U2YiinYJ+u5ERyuAYptDTZbdsnFU3J5x3VDTfyu1vzPhQiNC
         tmZOhn+ywfO6Uc0TNnxE8zH+Rw2AAbC94pU2AsLdUnOKdqJSRB7YBv1AavX/keS9GlfR
         IzIdxT9+8zH/qtMB668RiXpauxr/R89ytLk9QFBp7hOJNR9U9fm8+jalAZenfC29KtDZ
         zitIuXvZiiLQo3iacpMg05GOH/hQ34HRQn40tRSgbNPQFMGXEWx4r+8z4ECkDTQeQn7g
         CJNg==
X-Gm-Message-State: AOAM533C1qdUu52HZDRRn//Aav08sufhKXZPdXMxvIXO5vCyt/XCth33
        8wZZ1qf/ebZNlwrPoYblTqhTtg==
X-Google-Smtp-Source: ABdhPJyQGYzq+3+Y2biONIrwkE7niPYsewV7PhLNOyYleKr/TJht+Nwnjq940Dao4JQSvBYmyTDSFQ==
X-Received: by 2002:a17:902:d2c3:b029:ec:b1ce:c488 with SMTP id n3-20020a170902d2c3b02900ecb1cec488mr17905356plc.4.1619428106144;
        Mon, 26 Apr 2021 02:08:26 -0700 (PDT)
Received: from localhost (160.131.236.35.bc.googleusercontent.com. [35.236.131.160])
        by smtp.gmail.com with UTF8SMTPSA id m2sm10679322pgv.87.2021.04.26.02.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 02:08:25 -0700 (PDT)
From:   Hikaru Nishida <hikalium@chromium.org>
To:     kvm@vger.kernel.org
Cc:     suleiman@google.com, Hikaru Nishida <hikalium@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Paolo Bonzini <pbonzini@redhat.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/6] x86/kvm: Reserve KVM_FEATURE_HOST_SUSPEND_TIME and MSR_KVM_HOST_SUSPEND_TIME
Date:   Mon, 26 Apr 2021 18:06:40 +0900
Message-Id: <20210426090644.2218834-2-hikalium@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210426090644.2218834-1-hikalium@chromium.org>
References: <20210426090644.2218834-1-hikalium@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

No functional change; just add documentation for
KVM_FEATURE_HOST_SUSPEND_TIME and its corresponding
MSR_KVM_HOST_SUSPEND_TIME to support virtual suspend timing injection in
later patches.

Signed-off-by: Hikaru Nishida <hikalium@chromium.org>
---

 Documentation/virt/kvm/cpuid.rst |  3 +++
 Documentation/virt/kvm/msr.rst   | 29 +++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/Documentation/virt/kvm/cpuid.rst b/Documentation/virt/kvm/cpuid.rst
index cf62162d4be2..c7cb581b9a9b 100644
--- a/Documentation/virt/kvm/cpuid.rst
+++ b/Documentation/virt/kvm/cpuid.rst
@@ -96,6 +96,9 @@ KVM_FEATURE_MSI_EXT_DEST_ID        15          guest checks this feature bit
                                                before using extended destination
                                                ID bits in MSI address bits 11-5.
 
+KVM_FEATURE_HOST_SUSPEND_TIME      16          host suspend time information
+                                               is available at msr 0x4b564d08.
+
 KVM_FEATURE_CLOCKSOURCE_STABLE_BIT 24          host will warn if no guest-side
                                                per-cpu warps are expected in
                                                kvmclock
diff --git a/Documentation/virt/kvm/msr.rst b/Documentation/virt/kvm/msr.rst
index e37a14c323d2..de96743245c9 100644
--- a/Documentation/virt/kvm/msr.rst
+++ b/Documentation/virt/kvm/msr.rst
@@ -376,3 +376,32 @@ data:
 	write '1' to bit 0 of the MSR, this causes the host to re-scan its queue
 	and check if there are more notifications pending. The MSR is available
 	if KVM_FEATURE_ASYNC_PF_INT is present in CPUID.
+
+MSR_KVM_HOST_SUSPEND_TIME:
+	0x4b564d08
+
+data:
+	8-byte alignment physical address of a memory area which must be
+	in guest RAM, plus an enable bit in bit 0. This memory is expected to
+	hold a copy of the following structure::
+
+	 struct kvm_host_suspend_time {
+		__u64   suspend_time_ns;
+	 };
+
+	whose data will be filled in by the hypervisor.
+	If the guest register this structure through the MSR write, the host
+	will stop all the clocks including TSCs observed by the guest during
+	the host's suspension and report the duration of suspend through this
+	structure. Fields have the following meanings:
+
+	host_suspend_time_ns:
+		Total number of nanoseconds passed during the host's suspend
+		while the VM is running. This value will be increasing
+		monotonically.
+
+	Note that although MSRs are per-CPU entities, the effect of this
+	particular MSR is global.
+
+	Availability of this MSR must be checked via bit 16 in 0x4000001 cpuid
+	leaf prior to usage.
-- 
2.31.1.498.g6c1eba8ee3d-goog

