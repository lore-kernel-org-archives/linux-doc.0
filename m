Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5933C433FE
	for <linux-doc@archiver.kernel.org>; Wed, 16 Nov 2022 16:45:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233630AbiKPQpC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Nov 2022 11:45:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239017AbiKPQop (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Nov 2022 11:44:45 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894156176F
        for <linux-doc@vger.kernel.org>; Wed, 16 Nov 2022 08:40:33 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id z6so11036140qtv.5
        for <linux-doc@vger.kernel.org>; Wed, 16 Nov 2022 08:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M2qYrLtwqGzXrSbVf5LHq+jwh48PxbNMRAjl++ZfGso=;
        b=oGCAGNV0X4x1HV4pZQkX/kzwivGgPs69v4qNbL5XyeXsR3+delXusCW+ErJ34RRSgl
         Kh1rtePT8H1ZX+U69kBnIt3iYJpn25smBicW6khHwNLGwEodZkJAKet/NtEHc3tZtw0V
         RD0WOsJVDKybnqOp0XizsB+OnsnN2JM9n6GeuX+xlFx4sdNjIOtUYDoPa0/YODJWjgJ3
         vPImRGgoUqBzH/afwnTHApxrHAA51Lx0UUBQcF/IPT0BHKZFnTdOb52b/a1FT9Fxx3gE
         57CddSZ0GQ3/g2cremv/OXHigK2183t9QoBVO005VrOQKx84O+MyPaVgTNWCvtyhzFAp
         6oYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M2qYrLtwqGzXrSbVf5LHq+jwh48PxbNMRAjl++ZfGso=;
        b=ky0AIHToxD+nwFCwm94zYASXy+7PrWVtrE8ZtxrY0BL5X+FwdDQqiVWDzGDzvKD3ux
         6PDAXuaK7wHAkXEBTbpP4vM2g3F9a5XlDYzvFfTOZ9SNRMl8J2T+Qzg0+0FeaAfToQhF
         NieZfpj3dM8lIn26sIlCst0OuzJXfpc1kKLYGs0e8dgnHWauB/7nFlaecu71cuG4sPUk
         WHKWfkRSQ3XyI301+7KAzUQs72XzT2w2zKz/AJPKlY6ggDsW7xS2zCfOb0rlQfJxpTMz
         H5YdV94zLjt5vLzORqueLBMiZmIHpmhcHNndaL8b/gwDypjnY7dj85M2G9c8ghkZJVDf
         qqyA==
X-Gm-Message-State: ANoB5pl/zFxO1X62dKdJDIicyRqLFjuDjlFTE23FFCqOUmfy9wSzMtLO
        2JBw1ctTPqTtYINf9PfqxxfOs8ewgZeMMg==
X-Google-Smtp-Source: AA0mqf76+C6UND/MiWnQg3SlJYZF+D9RgCXswsgCb2wzSOD+abOUyvlnxq5yy1rLkZR6XFbIGzMXWA==
X-Received: by 2002:a05:622a:5918:b0:3a5:2662:d6e0 with SMTP id ga24-20020a05622a591800b003a52662d6e0mr21539549qtb.689.1668616832327;
        Wed, 16 Nov 2022 08:40:32 -0800 (PST)
Received: from localhost.localdomain (dsl-10-133-21.b2b2c.ca. [72.10.133.21])
        by smtp.gmail.com with ESMTPSA id q204-20020a3743d5000000b006a6ebde4799sm10052389qka.90.2022.11.16.08.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 08:40:31 -0800 (PST)
From:   Maxim Cournoyer <maxim.cournoyer@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     corbet@lwn.net, Maxim Cournoyer <maxim.cournoyer@gmail.com>
Subject: [PATCH] doc: add texinfodocs and infodocs targets
Date:   Wed, 16 Nov 2022 11:40:26 -0500
Message-Id: <20221116164026.21064-1-maxim.cournoyer@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sphinx supports generating Texinfo sources and Info documentation,
which can be navigated easily and is convenient to search (via the
indexed nodes or anchors, for example).

This change also causes the html output to appear under its own output
sub-directory, which makes it easier to install, since it's clean from
.doctrees or other output formats.

Signed-off-by: Maxim Cournoyer <maxim.cournoyer@gmail.com>
---
 Documentation/Makefile                     | 13 ++++++++++++-
 Documentation/userspace-api/media/Makefile |  3 ++-
 Makefile                                   |  2 +-
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index 64d44c1ecad3..bd8dac560633 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -93,7 +93,16 @@ quiet_cmd_sphinx = SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
 
 htmldocs:
 	@$(srctree)/scripts/sphinx-pre-install --version-check
-	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),,$(var)))
+	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),html,$(var)))
+
+texinfodocs:
+	@$(srctree)/scripts/sphinx-pre-install --version-check
+	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,texinfo,$(var),texinfo,$(var)))
+
+# Note: the 'info' Make target is generated by sphinx itself when
+# running the texinfodocs target define above.
+infodocs: texinfodocs
+	$(MAKE) -C $(BUILDDIR)/texinfo info
 
 linkcheckdocs:
 	@$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,linkcheck,$(var),,$(var)))
@@ -143,6 +152,8 @@ cleandocs:
 dochelp:
 	@echo  ' Linux kernel internal documentation in different formats from ReST:'
 	@echo  '  htmldocs        - HTML'
+	@echo  '  texinfodocs     - Texinfo'
+	@echo  '  infodocs        - Info'
 	@echo  '  latexdocs       - LaTeX'
 	@echo  '  pdfdocs         - PDF'
 	@echo  '  epubdocs        - EPUB'
diff --git a/Documentation/userspace-api/media/Makefile b/Documentation/userspace-api/media/Makefile
index 00922aa7efde..3d8aaf5c253b 100644
--- a/Documentation/userspace-api/media/Makefile
+++ b/Documentation/userspace-api/media/Makefile
@@ -47,10 +47,11 @@ $(BUILDDIR)/lirc.h.rst: ${UAPI}/lirc.h ${PARSER} $(SRC_DIR)/lirc.h.rst.exception
 
 # Media build rules
 
-.PHONY: all html epub xml latex
+.PHONY: all html texinfo epub xml latex
 
 all: $(IMGDOT) $(BUILDDIR) ${TARGETS}
 html: all
+texinfo: all
 epub: all
 xml: all
 latex: $(IMGPDF) all
diff --git a/Makefile b/Makefile
index 58cd4f5e1c3a..b3266c408b6c 100644
--- a/Makefile
+++ b/Makefile
@@ -1785,7 +1785,7 @@ $(help-board-dirs): help-%:
 # Documentation targets
 # ---------------------------------------------------------------------------
 DOC_TARGETS := xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs \
-	       linkcheckdocs dochelp refcheckdocs
+	       linkcheckdocs dochelp refcheckdocs texinfodocs infodocs
 PHONY += $(DOC_TARGETS)
 $(DOC_TARGETS):
 	$(Q)$(MAKE) $(build)=Documentation $@

base-commit: 81e7cfa3a9eb4ba6993a9c71772fdab21bc5d870
-- 
2.38.1

