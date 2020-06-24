Return-Path: <SRS0=SGxC=AF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A289C433E1
	for <linux-doc@archiver.kernel.org>; Wed, 24 Jun 2020 20:58:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B6D02081A
	for <linux-doc@archiver.kernel.org>; Wed, 24 Jun 2020 20:58:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j/kWNJMp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391559AbgFXU6c (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Jun 2020 16:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391547AbgFXU63 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Jun 2020 16:58:29 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01018C061796
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2020 13:58:27 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id e192so3543832ybf.17
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2020 13:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ZQcLA3WWQzWhDh7XNic/G9qqCkpVYvgILX+rlRl11MM=;
        b=j/kWNJMpkLx+QCXq2SQxzFXE4HDX6KCmSJPXrZblzIllowutKkBsG1ud3ynRKeW8lJ
         MtI48a2Cpj4ziGJGkEDlnEQv6DyxH1ousx99m6BnZKWQj6+/LMpBSQfN3Z2bJMnOIIhA
         veEviOrcT/oF5/ldeqAc8VZut+QFQYvbmgweDJvMdfdtNxBA3C8QstHTAtCWJCFu/uEM
         g8XBJvmlW8ZgWrslgR4KbC9ZLSy7BQNUKbLrK1dtpNcacunnYBX6IN8LUDosSMZIIPFI
         SKEMPUUw5qzV4tY3UOeSc9MtEF27mtDWWzIJ/xKaLfYUcG1fAVOTQnmOwrBK/8eH1yD5
         LvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ZQcLA3WWQzWhDh7XNic/G9qqCkpVYvgILX+rlRl11MM=;
        b=LnIwqZVbKN0iugKwWDoSOa5F53aEpJ0GGEw7pKOKImdqz9zXpAx0ZxYp+ItCDqAgRP
         9pnPK3S8+Zcuq0VRzzl2MgIyJY42EClvnHd/QgvQbXwPj26/7FYGuxr4QgyK1ZB81DzC
         UE7FZSfOLcW1oJ1xZ+ppMH2sr+D9zd6j+5ku2z1s4qbjD7Nh9lFcWlzd0mM5nvINY+WP
         XjyxVcCY7qhmeNRHc3S1pkGpFV2NHdhHm3JlOqEz/EReI2pbGeOU/AjQ+nqIw8DFpfW+
         B5G/ujLJvMSTwi8GqoZ/Rv0Ror3DZ1qsTLKJsVwmcaIoZPqilpqcGhyLKoEMHrPNOpUv
         nh4Q==
X-Gm-Message-State: AOAM533InKLRw2uHB2lZajB1VLBxJ7RcKHatIygZOImKNWIw2eSyf0zD
        FWOiDF25XV5I5R6bA4XJzEBlOEuCNUUmbLvSrWaxfQ==
X-Google-Smtp-Source: ABdhPJyhpPPbZya9wx2VzaMGagNQNdOzG9SvfIE26+f96tSAZOYI00iBbgj44mO45Hc8tO4IzqRsiRZjGUUWMQvf7cudgg==
X-Received: by 2002:a5b:c8b:: with SMTP id i11mr45672710ybq.484.1593032307073;
 Wed, 24 Jun 2020 13:58:27 -0700 (PDT)
Date:   Wed, 24 Jun 2020 13:55:49 -0700
In-Reply-To: <20200624205550.215599-1-brendanhiggins@google.com>
Message-Id: <20200624205550.215599-11-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200624205550.215599-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v4 10/11] Documentation: Add kunit_shutdown to kernel-parameters.txt
From:   Brendan Higgins <brendanhiggins@google.com>
To:     jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
        arnd@arndb.de, keescook@chromium.org, skhan@linuxfoundation.org,
        alan.maguire@oracle.com, yzaikin@google.com, davidgow@google.com,
        akpm@linux-foundation.org, rppt@linux.ibm.com,
        frowand.list@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        monstr@monstr.eu, mpe@ellerman.id.au, benh@kernel.crashing.org,
        paulus@samba.org, chris@zankel.net, jcmvbkbc@gmail.com
Cc:     gregkh@linuxfoundation.org, sboyd@kernel.org, logang@deltatee.com,
        mcgrof@kernel.org, linux-um@lists.infradead.org,
        linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux-xtensa.org,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
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
index fb95fad81c79a..e7d5eb7249e7f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2183,6 +2183,14 @@
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
2.27.0.212.ge8ba1cc988-goog

