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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70AEAC433B4
	for <linux-doc@archiver.kernel.org>; Thu, 29 Apr 2021 20:51:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D6016143E
	for <linux-doc@archiver.kernel.org>; Thu, 29 Apr 2021 20:51:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236825AbhD2UwS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Apr 2021 16:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237260AbhD2UwK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Apr 2021 16:52:10 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F6C7C061345
        for <linux-doc@vger.kernel.org>; Thu, 29 Apr 2021 13:51:18 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id 99-20020a0c80ec0000b029017de514d56fso31422494qvb.17
        for <linux-doc@vger.kernel.org>; Thu, 29 Apr 2021 13:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Or34t9xNkasHEVB+RIcYh+c2ArZJTq9tqpVTRgs5Qhc=;
        b=qQTUPXh8PbZjsiPRcb25RIzV3VKbCt4CTsOEKgachSgD7r6bFSGas6y60WoGPbLKbL
         GhHwlbbMwxTNkHS4AFI7zA+XYFJIqPGfkbE2QCkrNFYgc4mVTtmLMpDeysTmM8roi6q8
         5BP1qHcnhMwrwiSBIlmgOk9tjUczYtwgwKtqZnu94O9/+tj6APx5wHcK6/DpHzOlDB8o
         KJcbvkHaygGTptIdKQ3L/OL4gMNrjEZUhEXylGcvFhJWCYuUxPE9Qx2gfjGkSjlc+OvK
         Sc9HQ9JYmwYF8Dis3MYvndvoT2IOPmG90lkb7LHpSWuqUToRZ/wvjQivnz9/5GYN1vG6
         Hu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Or34t9xNkasHEVB+RIcYh+c2ArZJTq9tqpVTRgs5Qhc=;
        b=fpyJnyJpSw8E9rvvmVYrXA/H5+g3foyIqjN4EuNLE7oGqJ5pVf5okT8UChMPIK89gO
         tQdrnLevVFDLrjq5s3qSpfy4qSVfobB3vwbh4XCSsb5Z8gOKbCVnQS1bzG2buTFmq1Qy
         dxRHym0UdtdPaxiKRENuNex8FKJFTFVFpkHv6je38RQKlxXokjCFT6Mxz8GPW8tepuKp
         bpf99HGWXnRTHOuGWMU5o8D4BCdgCYIaKeNmCiXWLJhyEsv6mtMyB+nDUGF8zLHEXcDa
         HfS7StWDMCbyrULcT7uacV/WSaQ/X9yqlyz3JIXxCXpIIwepaRl177kAwVVi9healQdw
         Qv9g==
X-Gm-Message-State: AOAM533G4wzF7GhMhxjtZi2Z9uym82HPHWIiGCTgRB7MqJfW/KHd/uqD
        fk9ToWTitqTIlnIkpgfKyUakTHL2KcaBuKWIKQhjCA==
X-Google-Smtp-Source: ABdhPJy2sPuUiFl8tQXq8A/BMXxBiMDGpE45ttlPeIxNjf9PihOuGqdKO+RMt5zzhNlcyWEQnRGSpt+QpQAWQgy6LMfpuw==
X-Received: from mactruck.svl.corp.google.com ([2620:15c:2cb:201:bab5:c64e:5a6c:36bd])
 (user=brendanhiggins job=sendgmr) by 2002:ad4:5588:: with SMTP id
 e8mr1698913qvx.10.1619729477203; Thu, 29 Apr 2021 13:51:17 -0700 (PDT)
Date:   Thu, 29 Apr 2021 13:51:07 -0700
In-Reply-To: <20210429205109.2847831-1-brendanhiggins@google.com>
Message-Id: <20210429205109.2847831-3-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20210429205109.2847831-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
Subject: [RFC v2 2/4] Documentation: Add kunit_shutdown to kernel-parameters.txt
From:   Brendan Higgins <brendanhiggins@google.com>
To:     shuah@kernel.org, davidgow@google.com
Cc:     linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, sboyd@kernel.org, keescook@chromium.org,
        frowand.list@gmail.com, dlatypov@google.com,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add kunit_shutdown, an option to specify that the kernel shutsdown after
running KUnit tests, to the kernel-parameters.txt documentation.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 04545725f187f..fb2aacb29a4be 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2233,6 +2233,14 @@
 			0: force disabled
 			1: force enabled
 
+	kunit_shutdown=[KERNEL UNIT TESTING FRAMEWORK] Shutdown kernel after
+			running built-in tests. Tests configured as modules will
+			not be run.
+			Default:	(flag not present) don't shutdown
+			poweroff:	poweroff the kernel after running tests
+			halt:		halt the kernel after running tests
+			reboot:		reboot the kernel after running tests
+
 	kvm.ignore_msrs=[KVM] Ignore guest accesses to unhandled MSRs.
 			Default is 0 (don't ignore, but inject #GP)
 
-- 
2.31.1.498.g6c1eba8ee3d-goog

