Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 16F697DBEB
	for <lwn-linux-doc@archive.lwn.net>; Wed, 10 Jul 2019 07:17:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727439AbfGJHRF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 10 Jul 2019 03:17:05 -0400
Received: from mail-pf1-f201.google.com ([209.85.210.201]:36443 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727435AbfGJHRE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Jul 2019 03:17:04 -0400
Received: by mail-pf1-f201.google.com with SMTP id e20so848417pfd.3
        for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2019 00:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=LDQmGV1sXKMjUeOhPKTnD5bP1+GpH11oHwNBh3L4XLs=;
        b=SWzxZhZeLl9B3ZN7KUpRnolnKVc0OJkXJr8qwulUb9s67eZjf6r3kc2Ogx/J6NFBmy
         uqmVFD7ak9Qf8Uo8aXEIMGv7YGtgPRuHX+xSuxQCpHpu8vO6QWhPhnFk65OLmSU98Mo+
         abndx4F4lNunK2LAN8X5bdTYvCw0G/l5uts0dKuU3ZLpu8KxF7vnPevzWZqEjMu7PyE6
         VfeMLPMw4Y1TpnuCapjefj7vkaiOpHNz5UIbiIVdL+S7PfmVCxTs5cgeeOlAwMRo0y8X
         qh0rs5Mg9wZHPZxBzOCF9AroydvmP+xOktJ7l+4j5selLe+O3LHZFGlyYirSiQEquBlu
         n+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=LDQmGV1sXKMjUeOhPKTnD5bP1+GpH11oHwNBh3L4XLs=;
        b=PfbZihQ6bVTUlG3Jm+hA5rzjd9tvfLMMqi1a0KLGoBIrXMOqakD4mLiy8NC768PrdR
         6PdmTqnEYRngog3XE98Ng0eGIMDav83xrMTy0PERpenvSFm9CEie9bcD8NyZPLbvd+B6
         eN73+m1FRQW1JpekW4z8qDW1fvBMZm2RlUv0IPjHXtdfTg35fkaDmm4KmKk0waepBYIF
         V346EY/JZnntAlkwhSVmbmj2fp+92KiuJPnbwrJI7RQ0gQ7pPE5MZRdqdnz7Q86BFzt5
         ASbSwILHL/jiLLZtcS9bb32kATV6KfdZdZeFszSQEnsBz7xjgWSBo7rqEqP1o9BcqCoL
         kQYA==
X-Gm-Message-State: APjAAAVttzNxDL2dRCHn/dslpvdZYlYMeYP/QEgoQ6xfZ+ernUXFp4OC
        BepaZ8TJr6tTWyqrTXKyPuhk+ZE90Ufn5fYCu+5QOA==
X-Google-Smtp-Source: APXvYqwlEXuLFBHdrrK58SUL+5pvcKzBeJ5OszOrbsQfgRsSasvNDQkhx5yemg7ePksEVTpnjPnL52tUKDt89i4lgsAB3w==
X-Received: by 2002:a63:ad07:: with SMTP id g7mr33234528pgf.405.1562743023620;
 Wed, 10 Jul 2019 00:17:03 -0700 (PDT)
Date:   Wed, 10 Jul 2019 00:15:08 -0700
In-Reply-To: <20190710071508.173491-1-brendanhiggins@google.com>
Message-Id: <20190710071508.173491-19-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190710071508.173491-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v8 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
 SYSCTL section
From:   Brendan Higgins <brendanhiggins@google.com>
To:     frowand.list@gmail.com, gregkh@linuxfoundation.org,
        jpoimboe@redhat.com, keescook@google.com,
        kieran.bingham@ideasonboard.com, mcgrof@kernel.org,
        peterz@infradead.org, robh@kernel.org, sboyd@kernel.org,
        shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch,
        jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr,
        khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com,
        mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org,
        richard@nod.at, rientjes@google.com, rostedt@goodmis.org,
        wfg@linux.intel.com, Brendan Higgins <brendanhiggins@google.com>,
        Iurii Zaikin <yzaikin@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add entry for the new proc sysctl KUnit test to the PROC SYSCTL section,
and add Iurii as a maintainer.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Cc: Iurii Zaikin <yzaikin@google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Acked-by: Luis Chamberlain <mcgrof@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 48d04d180a988..f8204c75114da 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12721,12 +12721,14 @@ F:	Documentation/filesystems/proc.txt
 PROC SYSCTL
 M:	Luis Chamberlain <mcgrof@kernel.org>
 M:	Kees Cook <keescook@chromium.org>
+M:	Iurii Zaikin <yzaikin@google.com>
 L:	linux-kernel@vger.kernel.org
 L:	linux-fsdevel@vger.kernel.org
 S:	Maintained
 F:	fs/proc/proc_sysctl.c
 F:	include/linux/sysctl.h
 F:	kernel/sysctl.c
+F:	kernel/sysctl-test.c
 F:	tools/testing/selftests/sysctl/
 
 PS3 NETWORK SUPPORT
-- 
2.22.0.410.gd8fdbe21b5-goog

