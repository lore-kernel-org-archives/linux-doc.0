Return-Path: <SRS0=gWHa=AH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0176EC433E1
	for <linux-doc@archiver.kernel.org>; Fri, 26 Jun 2020 21:09:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5C8020B80
	for <linux-doc@archiver.kernel.org>; Fri, 26 Jun 2020 21:09:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IYUk8Yqg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgFZVJ3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Jun 2020 17:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726206AbgFZVJ2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jun 2020 17:09:28 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 237EAC03E97E
        for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2020 14:09:28 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id gp8so7165293pjb.9
        for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2020 14:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=9cJ18y40uUPYFZL7TN4SHcIdjwmkZDveAIhoXIvPo38=;
        b=IYUk8YqgZgCYajUvAr7+TZpYM4MMks4ME5jJR4NVadGy4ZU8CwXELvDm9bauUFB3L6
         MUcT96gdSqW5+5z/avFny8BX08RC9p8Y5njsdOPASFhovoAmh4OpguPdJDLxPdDlL8wH
         sp8gBQ6KdTpddWyZpEu6zGrsSRpgYbXbK7x4cCxZRVANzDO3EjonaRvSwY1PXJroQJmj
         8ohKF8v+doy8LmpsmkdBSyq0EG3AEnmmfRs0Rb2q8rpSFPq3YC+AUHyHeWkgoGopcbJn
         nBDwB0rz8Ui93SdomCLrCW+Ku6Fjn0SFklLb+6i/vy36pSSNMv/TbI0f696FLOb/W9s8
         ZqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=9cJ18y40uUPYFZL7TN4SHcIdjwmkZDveAIhoXIvPo38=;
        b=dOweMEbpcfYBK10+dplG46RtPP+ttVx3OeF/hrwQpUgKkIL10qvcFsv7m8Lx11lcEs
         3Nyql8UPdtAMpyB5gRKbyfFUsDKos/2Ojpy7eqjbA/7u7HfaD08WLuVqbeTTdZRHLK1P
         y/I2YnQP79CpKUMt6+2eivUAnIDHPaucdRIImtDZBaVg0YgEVNEcNCP+wl0cWk+02kKq
         dVnThqyk2JLJ+EkrmEYSSf5pB7U5A6xsydk0Gsb4y9jXH1vDqfu22WqzAPIr9ZuFhHU2
         H66DI8Vi9a+PSZM+xGJIwFRZ8d7xePPTBscJsQXAYzI0fT9cCN5it3FiIl/9l2PLy0Rh
         Vrrw==
X-Gm-Message-State: AOAM533N4OVE9jGhpEE/YgQ+ZHYHholpOmJU+OEc1sC42wqQvhuT7ycR
        Gbe+LHoQWjdqAukrG1387u3DTYWzgYiLlDdLlMijkg==
X-Google-Smtp-Source: ABdhPJzjvOtIhOG1aOdqb6LPRxa8gBDRx7iYFD1jkF8voJyCoykf8S53mwqKxZn9IwZNUt+dngOweMijabbbSnkBKS6K4A==
X-Received: by 2002:a17:90a:70c6:: with SMTP id a6mr5043991pjm.16.1593205767469;
 Fri, 26 Jun 2020 14:09:27 -0700 (PDT)
Date:   Fri, 26 Jun 2020 14:09:07 -0700
In-Reply-To: <20200626210917.358969-1-brendanhiggins@google.com>
Message-Id: <20200626210917.358969-3-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200626210917.358969-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v5 02/12] arch: arm64: add linker section for KUnit test suites
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

Add a linker section to arm64 where KUnit can put references to its test
suites. This patch is an early step in transitioning to dispatching all
KUnit tests from a centralized executor rather than having each as its
own separate late_initcall.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 arch/arm64/kernel/vmlinux.lds.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 6827da7f3aa54..a1cae9cc655d7 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -181,6 +181,9 @@ SECTIONS
 		INIT_RAM_FS
 		*(.init.rodata.* .init.bss)	/* from the EFI stub */
 	}
+	.kunit_test_suites : {
+		KUNIT_TEST_SUITES
+	}
 	.exit.data : {
 		EXIT_DATA
 	}
-- 
2.27.0.212.ge8ba1cc988-goog

