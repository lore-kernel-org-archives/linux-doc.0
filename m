Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1BEDA7D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 23 Apr 2019 21:27:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727960AbfDWV1r (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 23 Apr 2019 17:27:47 -0400
Received: from mail-pf1-f202.google.com ([209.85.210.202]:35830 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727793AbfDWV1r (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Apr 2019 17:27:47 -0400
Received: by mail-pf1-f202.google.com with SMTP id g1so10451386pfo.2
        for <linux-doc@vger.kernel.org>; Tue, 23 Apr 2019 14:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=41aTYzy88TUD1CyveIip5i2BawgilNUUCUyijcx9oaA=;
        b=uR9fVOkRKS7Tscs+Ze0Tagavk/8dShLsyV9Xl2jtuL/vKkp0DuxgPCs8GUxx3nhzJL
         JS0/QboYft1EWQCEotbrAIfCgSwLSI1lwxv00p4VaEeu4NxQDjk2OPqzFJf0nfO+vDdt
         a0KQAkZx6xTNXFfMe9/SIz2c/9EBQOcowOk6aQNQEz9I0D9WksPeGT6HD+Vy7betuVJB
         A7m9ey7OSCaq05YaRw8vpne3+8n/Msr76b9nz2ikn8MAtVcHy06+rVBZKR0lJCq5nsAb
         yHTPMN612oofssR6+VKVdg9GWiwVL0cmCOqg5i2nvG6yrAK9Nf8yEiUxhBa6SbnN6DnZ
         x/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=41aTYzy88TUD1CyveIip5i2BawgilNUUCUyijcx9oaA=;
        b=dhwexV/Ju0ivvKiX/+bZeX5abpuKjBjnjhAe21gGlA1ewwvCBx1n03R7d7nzXdfhqu
         bstZiRFj5bVHGW3d2rCV6Z8ZZsq8SxdTTCN9GQ9X+vvgs4anEH/3oumP8mDo4v9eV5FQ
         K9IFjGWpk3qstyR243ZSfeo962NZRELniYLpzmQTneCNefzG1Gxz5C1hKld04/JkmMms
         FU3e57awmxMgELYeTb/HAz7a/PMqCZAQx8zPXy0MOGN31BTqRNXGYCxcAnBYRkB9Uwvf
         ETQ3ADKvzH822WeTgZxTLggPU4oR6LC64k5SMx/fiBJfjymImi5hFyoaQv6V01HUjEJV
         wyLg==
X-Gm-Message-State: APjAAAXdoKnzl4h7tlAzSaFs6TIwIDzfDCV+XLZaSMeXYYARzBGGbAwH
        muHDsjr5bBDN+NsCcBgw3K5GZU5e1UYMpxeNeFs=
X-Google-Smtp-Source: APXvYqyhG2vTC3jWAx/p08kp5ptoz96a2fY+KEPJvsAxWPyxEBF38D9nK/P44eHwWUCG6mBl9aGJfLaP27cml/TPvBI=
X-Received: by 2002:a65:4183:: with SMTP id a3mr26848110pgq.121.1556054866607;
 Tue, 23 Apr 2019 14:27:46 -0700 (PDT)
Date:   Tue, 23 Apr 2019 14:27:41 -0700
Message-Id: <20190423212741.12219-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH] kbuild: drop support for cc-ldoption
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        corbet@lwn.net
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If you want to see if your linker supports a certain flag, then ask the
linker directly with ld-option (not the compiler with cc-ldoption).
Checking for linker flag support is an antipattern that complicates the
usage of various linkers other than bfd via -fuse-ld={bfd|gold|lld}.

Cc: clang-built-linux@googlegroups.com
Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
This should probably wait until all of the call sites have been cleaned
up. Masahiro sent them for arm and arm64, while I sent cleanups for all
the rest.


 Documentation/kbuild/makefiles.txt | 14 --------------
 scripts/Kbuild.include             |  5 -----
 2 files changed, 19 deletions(-)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index 03c065855eaf..d65ad5746f94 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -437,20 +437,6 @@ more details, with real examples.
 	The second argument is optional, and if supplied will be used
 	if first argument is not supported.
 
-    cc-ldoption
-	cc-ldoption is used to check if $(CC) when used to link object files
-	supports the given option.  An optional second option may be
-	specified if first option are not supported.
-
-	Example:
-		#arch/x86/kernel/Makefile
-		vsyscall-flags += $(call cc-ldoption, -Wl$(comma)--hash-style=sysv)
-
-	In the above example, vsyscall-flags will be assigned the option
-	-Wl$(comma)--hash-style=sysv if it is supported by $(CC).
-	The second argument is optional, and if supplied will be used
-	if first argument is not supported.
-
     as-instr
 	as-instr checks if the assembler reports a specific instruction
 	and then outputs either option1 or option2
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 7484b9d8272f..fbfb37d1bcc8 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -138,11 +138,6 @@ cc-disable-warning = $(call try-run,\
 # Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
 cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || echo $(4))
 
-# cc-ldoption
-# Usage: ldflags += $(call cc-ldoption, -Wl$(comma)--hash-style=both)
-cc-ldoption = $(call try-run,\
-	$(CC) $(1) $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -nostdlib -x c /dev/null -o "$$TMP",$(1),$(2))
-
 # ld-option
 # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
 ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
-- 
2.21.0.593.g511ec345e18-goog

