Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E957A7D926
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Apr 2019 22:12:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730724AbfDDWKU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 4 Apr 2019 18:10:20 -0400
Received: from mail-pl1-f202.google.com ([209.85.214.202]:50035 "EHLO
        mail-pl1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730702AbfDDWKR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Apr 2019 18:10:17 -0400
Received: by mail-pl1-f202.google.com with SMTP id q18so2647413pll.16
        for <linux-doc@vger.kernel.org>; Thu, 04 Apr 2019 15:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=U91xdzHZlZ3sGyz1Z20ZQCMaKP+1OzYt3YQwfxc8mqk=;
        b=crx3AgMX10zKqVbwSopuqy+wifGFV09vQT9j23Dao28NGYIhSmvtmECrOs2bWqONh/
         YJXQ7MRmwYjlHWRg4i7E4lKiCQh6WHQJIVRhSb4UAkuBeyfXD/BwTDd7/srp2cSoVnS/
         pQ1U6mMjcpdxjYoBuLD5USSu8WoCdRfaGUxmuVOl7DUMmGCAKJJQc54LTgo5TiyWm7yO
         rJn8BZ0qYXXofOhUKxArh5dw3es8T7zlO2K53jt14X1LjIOJRgJ/Kw9aIQ+JY+SbeZts
         slfCit8O8rudAy2x+d0vOtpxXAFJEdEAYW8P23CBeeyEIcUnk9BvPqpniVbgmkYcjGi/
         Lecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=U91xdzHZlZ3sGyz1Z20ZQCMaKP+1OzYt3YQwfxc8mqk=;
        b=F7/uDs00QgSqeAeSeqDigK0dPjm+QgyAEq1AXatSm9ha+tK7svw1Uf51JDu2NdMWoH
         n9rHabycfbNuoZZ4+yuwlAsQahG1rH9k85D1yl8JdY3ldAVm/o2PBJfbDJmiXeRQpwaM
         OAGM7x+22TnABluyg3P8VEXkatgidlMo+dCxL3+ukO1J7hmDm7swcD/nejHZgM1rSLL5
         f2erWdPu/vfmnQv4I1v6iwSM1F3SwfcguM/nuVX/2GEfb7KkkJ+cYxGP/mNaW8T581ZH
         RLmAm37ikF6xbyJ36w/QNZHe2ObSjXzDHKMq+HFlW9Y6dPNzjPyzyMYuKxG/Vwa2Jn9D
         2Cqg==
X-Gm-Message-State: APjAAAWdxEC3Y8/mmXKA4UcjHa1dDlUICibqPCkQ1l5qQIuOBzDJ6c21
        8EG07nW8fA5xPmZyhi83eXeDWZYEi87IBVSh22I1vg==
X-Google-Smtp-Source: APXvYqz8CTF4sg9bsjgsJs1swq83R9aL8nwhnmvMZAMP1KTVGzMLnWjJRpZ/Fa1EOU5wyjaHSQhkfma6QnwtWDzgg/7SXA==
X-Received: by 2002:a63:4544:: with SMTP id u4mr229417pgk.149.1554415816144;
 Thu, 04 Apr 2019 15:10:16 -0700 (PDT)
Date:   Thu,  4 Apr 2019 15:06:41 -0700
In-Reply-To: <20190404220652.19765-1-brendanhiggins@google.com>
Message-Id: <20190404220652.19765-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190404220652.19765-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
Subject: [PATCH v1 06/17] kbuild: enable building KUnit
From:   Brendan Higgins <brendanhiggins@google.com>
To:     corbet@lwn.net, frowand.list@gmail.com, keescook@google.com,
        kieran.bingham@ideasonboard.com, mcgrof@kernel.org,
        robh@kernel.org, shuah@kernel.org, yamada.masahiro@socionext.com
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com,
        dan.j.williams@intel.com, daniel@ffwll.ch,
        gregkh@linuxfoundation.org, jdike@addtoit.com, joel@jms.id.au,
        julia.lawall@lip6.fr, khilman@baylibre.com, knut.omang@oracle.com,
        mpe@ellerman.id.au, pmladek@suse.com, richard@nod.at,
        rostedt@goodmis.org, wfg@linux.intel.com,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add KUnit to root Kconfig and Makefile allowing it to actually be built.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
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
index c0a34064c5744..639d353f98ca9 100644
--- a/Makefile
+++ b/Makefile
@@ -964,7 +964,7 @@ endif
 PHONY += prepare0
 
 ifeq ($(KBUILD_EXTMOD),)
-core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
+core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/ kunit/
 
 vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
-- 
2.21.0.392.gf8f6787159e-goog

