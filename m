Return-Path: <SRS0=gWHa=AH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED2BBC433DF
	for <linux-doc@archiver.kernel.org>; Fri, 26 Jun 2020 21:10:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE33120B1F
	for <linux-doc@archiver.kernel.org>; Fri, 26 Jun 2020 21:10:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WgNUMXd3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbgFZVJ1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Jun 2020 17:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgFZVJ0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jun 2020 17:09:26 -0400
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03951C03E97E
        for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2020 14:09:26 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id z16so7444381pgh.21
        for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2020 14:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=J3ivtuBCWWA6WF3YNE0hm8BpVh0hgAMk0icQw8PVzV4=;
        b=WgNUMXd3dwHqJrIjWBq++Q/Kq0iip5LEa8AI7ViQMO4xCI++syC/ViOkIloaOcHBde
         m/Hql1FmK7XKs8F2kR0tHTAMFWHmTmRKIUuCQqkFM0JarAdI3BykpLTyJ7b8s6h2hLdD
         0qvYcqxCRm4XHMZnbIVv2mhVLC5jzqyzhDx1V5HzmG2WhGvdg13+1M0zkPlFZygPiX/x
         Mi+72a5chn6PjfdIaIcfOo8z0FUQPXMZUMwWWJyL4j+V4gSmYgMmBa99IuMRhURzFZkY
         CwNCkLlDhc4eW1rRjuEcrALlfILFa5AJqhQgkDoPV9GRFEpqNtzVD+KRztuFQ7mB+paG
         ULtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=J3ivtuBCWWA6WF3YNE0hm8BpVh0hgAMk0icQw8PVzV4=;
        b=GTvGi8M+2HfvCX+5goTgmwOMeId8UsmoSJF7F5iEuiet0rZt7czCcZut2hJ0ycl+77
         sEhGuRSketNk1Ex5BeQTVQmwTreBcSYgtdUFVqsIuzDaAydSF8S7EEoWD5GlVIEXOl5S
         PS05zLhoCU5bAsHKw3GaTH3e+NRZbhq6+VVaJDyjYditq9w1FBgrDDNsSoWuVFzR3jV+
         HAsoNF3SkBbTlX1JKh+5XdafEBYNdiqWju31q0Gi0XcAzzIXJhQmEZ9XzODuLJfunGRn
         meoNeI07X3eeFyeLAtvGzq8PKJQXpM02cUMPIGBXaJCKXMLsmISn02NRnjNhy3Ee87Wi
         9vhg==
X-Gm-Message-State: AOAM5307B6XjGeM+lPmUJix0wcU53zMq5CYaJCHO/vwcg6EXNQV7AZ/E
        Ux46LG3Jzuk6YQYFanZH010I++fcFPDg4xb8iohpMg==
X-Google-Smtp-Source: ABdhPJyRryMOngRXWyo7Nk/HIoliWNzQOxasqOnm+O4DR7qeWVrVfGv1DfbeY3UB3YlKBNPdNWdcLph4S1CMJBqyAX4wRA==
X-Received: by 2002:a17:90a:2a04:: with SMTP id i4mr5431363pjd.91.1593205765384;
 Fri, 26 Jun 2020 14:09:25 -0700 (PDT)
Date:   Fri, 26 Jun 2020 14:09:06 -0700
In-Reply-To: <20200626210917.358969-1-brendanhiggins@google.com>
Message-Id: <20200626210917.358969-2-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200626210917.358969-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v5 01/12] vmlinux.lds.h: add linker section for KUnit test suites
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

Add a linker section where KUnit can put references to its test suites.
This patch is the first step in transitioning to dispatching all KUnit
tests from a centralized executor rather than having each as its own
separate late_initcall.

Co-developed-by: Iurii Zaikin <yzaikin@google.com>
Signed-off-by: Iurii Zaikin <yzaikin@google.com>
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 include/asm-generic/vmlinux.lds.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index db600ef218d7d..4f9b036fc9616 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -881,6 +881,13 @@
 		KEEP(*(.con_initcall.init))				\
 		__con_initcall_end = .;
 
+/* Alignment must be consistent with (kunit_suite *) in include/kunit/test.h */
+#define KUNIT_TEST_SUITES						\
+		. = ALIGN(8);						\
+		__kunit_suites_start = .;				\
+		KEEP(*(.kunit_test_suites))				\
+		__kunit_suites_end = .;
+
 #ifdef CONFIG_BLK_DEV_INITRD
 #define INIT_RAM_FS							\
 	. = ALIGN(4);							\
@@ -1056,6 +1063,7 @@
 		INIT_CALLS						\
 		CON_INITCALL						\
 		INIT_RAM_FS						\
+		KUNIT_TEST_SUITES					\
 	}
 
 #define BSS_SECTION(sbss_align, bss_align, stop_align)			\
-- 
2.27.0.212.ge8ba1cc988-goog

