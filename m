Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CCA937D2F0
	for <lwn-linux-doc@archive.lwn.net>; Mon, 17 Jun 2019 08:28:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbfFQI2h (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 17 Jun 2019 04:28:37 -0400
Received: from mail-vs1-f73.google.com ([209.85.217.73]:50324 "EHLO
        mail-vs1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727771AbfFQI1D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Jun 2019 04:27:03 -0400
Received: by mail-vs1-f73.google.com with SMTP id u17so2031865vsq.17
        for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2019 01:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=x00LgSmLKToDFMVzGBRd3p5tkepZRYMdj+2oyEasIr8=;
        b=QRuUpR7fe5b6KQBbrm5CJpf+ld0Qdmum4wKPR1jUB+VQRr9GS6e7oJ5ulOSoALkGRP
         ovpTcXb4G9btECrBBzgf45fxCMM2GXv30izjPgnZKuYLFrpwe3HXhZDQB73XVrAejJxD
         IgfII4Z9jaY8fPVzbtqxbOwVsCvGiB0RF4Mffv1td7BVKS1Kx0JJZAXyrkGkivyiYA63
         hsgbC0KTmy8G9zVu3WhXcfLq7dYt6rebWJmZYOhXohOw40uDx9fx1rlyjCam74q3M300
         OpJon9kmObZYZt7VkAjWX8Hir7yRWcNZaLM02mxdF6GX3sH1HnSt2LSrmWpaGI1AehdZ
         m5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=x00LgSmLKToDFMVzGBRd3p5tkepZRYMdj+2oyEasIr8=;
        b=Kpmfq8BU6YcUrehjmkEW5vjFpSfSfAJXtP97yV1jKECFbYtLkuuN5NolLTNRcW+1g6
         10Ru847w7btRDGUhOKZ3KHaEhH7zbEFu8nTKjp0kSiUpV8E7wWKbcDVnNDv0ahU+Q4Ns
         l1ZdMKmnYjPFWGY55HAQLEuPS3lf6jQ/zLvaGTiMytp6H5WBDoX+NxTdKIrMavmtA/yg
         uYvs2qx23tsFEx0sG1PrqxHfEfWtXw7sSigA4JBv6E7m65Ba/UyuZEOT0nOraal2UNT+
         x9a4FfYwvw3mJ+sp4eaGD8Iy6TrVWeN/QVPfRzVEb1mQ16m2PPyvUGpNoAiMBHAZYf/3
         AayA==
X-Gm-Message-State: APjAAAUuDt2VXKk1twodczmX5JL+EO6VFO/hZS2Jzmg8x9UtFCbZMoX+
        ce9mkzGUiJ7xVDffak0nWcOSJSrBNuHsSUPIkEf0+A==
X-Google-Smtp-Source: APXvYqw0AQqNp/70EN0nmAb/HcpHOuljd/qoLNtxJ0Hn2/jd1Zqa5j+kjBpA0VFAeCRj9jxoqQZAwaaDKLUcJqXCrNqWPg==
X-Received: by 2002:a67:6d44:: with SMTP id i65mr58904024vsc.106.1560760022147;
 Mon, 17 Jun 2019 01:27:02 -0700 (PDT)
Date:   Mon, 17 Jun 2019 01:26:01 -0700
In-Reply-To: <20190617082613.109131-1-brendanhiggins@google.com>
Message-Id: <20190617082613.109131-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190617082613.109131-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v5 06/18] kbuild: enable building KUnit
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
        wfg@linux.intel.com, Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

KUnit is a new unit testing framework for the kernel and when used is
built into the kernel as a part of it. Add KUnit to the root Kconfig and
Makefile to allow it to be actually built.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
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
index b81e172612507..4b544a8eebee4 100644
--- a/Makefile
+++ b/Makefile
@@ -991,7 +991,7 @@ endif
 PHONY += prepare0
 
 ifeq ($(KBUILD_EXTMOD),)
-core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
+core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/ kunit/
 
 vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
-- 
2.22.0.410.gd8fdbe21b5-goog

