Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 946D07D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 14 May 2019 05:44:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbfENFoO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 14 May 2019 01:44:14 -0400
Received: from mail-pf1-f201.google.com ([209.85.210.201]:36489 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727007AbfENFoO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 May 2019 01:44:14 -0400
Received: by mail-pf1-f201.google.com with SMTP id d21so11244156pfr.3
        for <linux-doc@vger.kernel.org>; Mon, 13 May 2019 22:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=hN9qf7+RrypIPHqUONQZmMGddOrdEANVDvigURbu6dA=;
        b=qpNcWD3Y0kl9+eBKEvbxHFNU7HSbifNewSYRx7Bf6o8l7Ke6/csSYyO5zv2WxAMwCw
         1clrx6usnqE/8tMeKdicTsHMdxaZhGE855zAfB2p5ktCxpqm1UvjHy6jbopoVHrKXTJu
         7XToK69m2OAEcktEp/sBKtsjQNLSLcqQn8GVwbQygY2DUZPUX/dOS5KbgqmQtNUtZYCp
         wrnJaamR7NoH4ePJwr456aJvpPNQSuIxVgAj7VigLO+2F4t6B5mXO5pvBmfaC8rN7V+L
         Ao7V5ERz7Y4bh1lVVQIOh9Hgtblw6vSKRA0X1/2C5pRc1A4nWNmmsMlR061f9/7kgHWi
         mU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=hN9qf7+RrypIPHqUONQZmMGddOrdEANVDvigURbu6dA=;
        b=uR+5be8aK8t9g8ce3OFtIgp1ZPd+A6uHXOFg3HfTLBVkLf/C1GjkQqNbxhc88OccdZ
         6THiEMYGotjjwviv3pUY5A24Od9EPWt+KVaIxbt/1mWRESdsOL39pveu4F9vLqlFkWnJ
         lKoOYu/rG0YxLe/+IL87/Ngf1u3zU+YjCxF368wI1CRFY7aId4Jjg6aBmBNIX43rWIHy
         qaeKnhQ7kBK4Ua4+Dv3Lys4Ucd1d2mxgWw46F9Lbu53HCId/eMfujCeesAXJK8tGvwkG
         EV2XEP+2++qdXPKIRAJZMMiimeeLLpH7qYKFuaTxINGjxOiIXFDWeI1f2FNBFTsS5e9P
         0CwQ==
X-Gm-Message-State: APjAAAXTMcFia5ib2NF43QMD8oOBVaFPng5hGOC3Gy8RcHGY1abvuZV0
        AwnYmrVcrhe42F98vTZI4FS1xu8BlxE7bCdA/Hk3aw==
X-Google-Smtp-Source: APXvYqypLujpnV/Vdl1pYHMXICHGFoX6Lv2fPwDbCH6fHgKJkPC2sx/Vc0HPXqG6cBw7dhDlnlPRD7bdIYYvS4bGxpiVHg==
X-Received: by 2002:a63:8741:: with SMTP id i62mr35837456pge.313.1557812653206;
 Mon, 13 May 2019 22:44:13 -0700 (PDT)
Date:   Mon, 13 May 2019 22:42:39 -0700
In-Reply-To: <20190514054251.186196-1-brendanhiggins@google.com>
Message-Id: <20190514054251.186196-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190514054251.186196-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v3 06/18] kbuild: enable building KUnit
From:   Brendan Higgins <brendanhiggins@google.com>
To:     frowand.list@gmail.com, gregkh@linuxfoundation.org,
        keescook@google.com, kieran.bingham@ideasonboard.com,
        mcgrof@kernel.org, robh@kernel.org, sboyd@kernel.org,
        shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com,
        dan.j.williams@intel.com, daniel@ffwll.ch, jdike@addtoit.com,
        joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com,
        knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au,
        pmladek@suse.com, rdunlap@infradead.org, richard@nod.at,
        rientjes@google.com, rostedt@goodmis.org, wfg@linux.intel.com,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add KUnit to root Kconfig and Makefile allowing it to actually be built.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
---
Changes Since Last Revision:
 - Masahiro reported a number of issues here on the previous revision;
   however, all of the changes actually needed to happen on earlier or
   later patches.
---
 Kconfig  | 2 ++
 Makefile | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Kconfig b/Kconfig
index 48a80beab6853..10428501edb78 100644
--- a/Kconfig
+++ b/Kconfig
@@ -30,3 +30,5 @@ source "crypto/Kconfig"
 source "lib/Kconfig"
 
 source "lib/Kconfig.debug"
+
+source "kunit/Kconfig"
diff --git a/Makefile b/Makefile
index 26c92f892d24b..2ea87a8fe770d 100644
--- a/Makefile
+++ b/Makefile
@@ -969,7 +969,7 @@ endif
 PHONY += prepare0
 
 ifeq ($(KBUILD_EXTMOD),)
-core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
+core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/ kunit/
 
 vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
-- 
2.21.0.1020.gf2820cf01a-goog

