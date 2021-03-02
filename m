Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 674CAC433E6
	for <linux-doc@archiver.kernel.org>; Tue,  2 Mar 2021 18:12:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F12064F1D
	for <linux-doc@archiver.kernel.org>; Tue,  2 Mar 2021 18:12:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1580456AbhCBSDk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Mar 2021 13:03:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344094AbhCBRlc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Mar 2021 12:41:32 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298C2C0698D2
        for <linux-doc@vger.kernel.org>; Tue,  2 Mar 2021 09:20:49 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id 201so14264857pfw.5
        for <linux-doc@vger.kernel.org>; Tue, 02 Mar 2021 09:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cilium-io.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sdfyObE0E1JspOvROEYz/USdJ0MsLAvmGmtxjKiuziw=;
        b=hX1Bi349HGCRg4XxhEuiHPv8IhO8nCMLe1NF8WCH6A8WDN//ph/h8lvaH5r2lczDV1
         wrB0kZ8auZwVQ++e7AnrEtrDanbuws/DC5Namddhl3/vNLA8kGdngV51GGXhpZV1xade
         TZHIOt6Agm3XH6WZL1D2jgzJRHFQgj6lzRyCmk+k7+FRzXF2j1SyAnxREGC2vfgVjdwt
         /o6FcUOFQigEC9sLMr9LX8X3mUyiIJM0BhlCghAY1B24xST7eaMJ1m84cV3lH3les6Rf
         iaiokLMplzD2gO1jSgVAxEPR7CMzIv0B7+wYO2hZpo1g9G62jJjOdh0engpN8omOwBZu
         yS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sdfyObE0E1JspOvROEYz/USdJ0MsLAvmGmtxjKiuziw=;
        b=cicIsa6D5+JSTlVro92cWNPM6/Lvwkxupeoat+zWirqBuorqfiAi826ou6Qh75J2lc
         pQT5K45pxVj0UbWkox1U0QclxfID3AbDyVKKgIcniYjMrhBnl5NbYz1BDfunzWPhsFux
         eGAXhbgcahBZiS6iWj8NkDXCfzXYYSp0jnK1Zb12JP0QVUH0/SYSkDBSFd9qKRJRaZC2
         fIiitfuE+cGwuvsEEgUqxbxQRxKHJOpWnSDPPhZPbOElq4p5xTJiegnUleETHgCqRsUN
         raESi2c1XJFNNU8C79SagWR3BtOooE8OTzvdQmqwB0+Y/5HrXQoQkfazgszjSewu1RAs
         KiAg==
X-Gm-Message-State: AOAM531s/zxMI6bI4K1wNmzbArz0UyMXRLLqsLFCqj5TYv1WGzt1wCq3
        GlFUmc59iwMzVL4OyVwoQiBovSGGU1xr3qpy
X-Google-Smtp-Source: ABdhPJxu2ccLPZxQduQGZaDo7/+I565sDXZiuNJfYVTL+2FXqWypan6o8vAXbJYeQe0VhYMkd+Z72Q==
X-Received: by 2002:a62:6304:0:b029:1c0:d62d:d213 with SMTP id x4-20020a6263040000b02901c0d62dd213mr4045441pfb.79.1614705648725;
        Tue, 02 Mar 2021 09:20:48 -0800 (PST)
Received: from localhost.localdomain (c-73-93-5-123.hsd1.ca.comcast.net. [73.93.5.123])
        by smtp.gmail.com with ESMTPSA id b15sm20073923pgg.85.2021.03.02.09.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 09:20:48 -0800 (PST)
From:   Joe Stringer <joe@cilium.io>
To:     bpf@vger.kernel.org
Cc:     daniel@iogearbox.net, ast@kernel.org, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org,
        =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
        Quentin Monnet <quentin@isovalent.com>
Subject: [PATCHv2 bpf-next 13/15] selftests/bpf: Test syscall command parsing
Date:   Tue,  2 Mar 2021 09:19:45 -0800
Message-Id: <20210302171947.2268128-14-joe@cilium.io>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210302171947.2268128-1-joe@cilium.io>
References: <20210302171947.2268128-1-joe@cilium.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add building of the bpf(2) syscall commands documentation as part of the
docs building step in the build. This allows us to pick up on potential
parse errors from the docs generator script as part of selftests.

The generated manual pages here are not intended for distribution, they
are just a fragment that can be integrated into the other static text of
bpf(2) to form the full manual page.

Acked-by: Toke Høiland-Jørgensen <toke@redhat.com>
Reviewed-by: Quentin Monnet <quentin@isovalent.com>
Signed-off-by: Joe Stringer <joe@cilium.io>
---
 tools/testing/selftests/bpf/.gitignore    |  1 +
 tools/testing/selftests/bpf/Makefile.docs | 14 ++++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/.gitignore b/tools/testing/selftests/bpf/.gitignore
index a0d5ec3cfc24..4866f6a21901 100644
--- a/tools/testing/selftests/bpf/.gitignore
+++ b/tools/testing/selftests/bpf/.gitignore
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 bpf-helpers*
+bpf-syscall*
 test_verifier
 test_maps
 test_lru_map
diff --git a/tools/testing/selftests/bpf/Makefile.docs b/tools/testing/selftests/bpf/Makefile.docs
index f39ad19317c8..ccf260021e83 100644
--- a/tools/testing/selftests/bpf/Makefile.docs
+++ b/tools/testing/selftests/bpf/Makefile.docs
@@ -15,18 +15,27 @@ endif
 
 prefix ?= /usr/local
 mandir ?= $(prefix)/man
+man2dir = $(mandir)/man2
 man7dir = $(mandir)/man7
 
+SYSCALL_RST = bpf-syscall.rst
+MAN2_RST = $(SYSCALL_RST)
+
 HELPERS_RST = bpf-helpers.rst
 MAN7_RST = $(HELPERS_RST)
 
+_DOC_MAN2 = $(patsubst %.rst,%.2,$(MAN2_RST))
+DOC_MAN2 = $(addprefix $(OUTPUT),$(_DOC_MAN2))
+
 _DOC_MAN7 = $(patsubst %.rst,%.7,$(MAN7_RST))
 DOC_MAN7 = $(addprefix $(OUTPUT),$(_DOC_MAN7))
 
-DOCTARGETS := helpers
+DOCTARGETS := helpers syscall
 
 docs: $(DOCTARGETS)
+syscall: man2
 helpers: man7
+man2: $(DOC_MAN2)
 man7: $(DOC_MAN7)
 
 RST2MAN_DEP := $(shell command -v rst2man 2>/dev/null)
@@ -64,9 +73,10 @@ endef
 
 # Create the make targets to generate manual pages by name and section
 $(eval $(call DOCS_RULES,helpers,7))
+$(eval $(call DOCS_RULES,syscall,2))
 
 docs-clean: $(foreach doctarget,$(DOCTARGETS), docs-clean-$(doctarget))
 docs-install: $(foreach doctarget,$(DOCTARGETS), docs-install-$(doctarget))
 docs-uninstall: $(foreach doctarget,$(DOCTARGETS), docs-uninstall-$(doctarget))
 
-.PHONY: docs docs-clean docs-install docs-uninstall man7
+.PHONY: docs docs-clean docs-install docs-uninstall man2 man7
-- 
2.27.0

