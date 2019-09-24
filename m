Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 109237D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 24 Sep 2019 23:02:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410820AbfIXXCM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Sep 2019 19:02:12 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45800 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410730AbfIXXCM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Sep 2019 19:02:12 -0400
Received: by mail-pl1-f193.google.com with SMTP id u12so1561827pls.12
        for <linux-doc@vger.kernel.org>; Tue, 24 Sep 2019 16:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=z78DOvz8kzmGfG9Z2xiQ3oJZKxQKLVG8/acy4oN8Dcw=;
        b=UVGLhPIlLPwA2fzJ+wVaUhS6pEHgDSU5sIJC63sH0BLpe69DNRtNuiIJyYrzelDeaf
         MgKwl9/FlXbtX52BrZDiA+IeCY/vKSzDzLpECw+WDUR8vBprkRjxxGJizDk3GJ1ZGKKl
         fXYopgvY3t4DldwNzk/tA27LccP149dyOs3YQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=z78DOvz8kzmGfG9Z2xiQ3oJZKxQKLVG8/acy4oN8Dcw=;
        b=NkqlJsdSg/p/ciw8oePo024l0rAZK1vVRT6pz+53vSFMYWiTROkNdoJOP2NCcnxUg1
         BvLw+SEvzFLNLIy/WYxk3ESdjoOAopuQURNQ+9HWiBeMP6SL0Kq3FGzmiPU1VRFfQbUR
         mzZvKA9gi/f1poWpCinWtRl16Ax8L3na4BTaOE8GfouZt+Xay6WUslg2v1Otk49C0GuO
         vZ++NgqNyDvXR1d6RA2yJXUWiNaqbuM0HZnGL+LiIEh4Eox1hdWdcz0F8CYKcM2ok8ZV
         K7FZGHz3YgLmRWMfeXEde49eXV6dSNhZHUtUG8wmr3EkeivVNtjsaG2gs1tM7+l/KGtS
         DVdg==
X-Gm-Message-State: APjAAAU4PC+JmpKoSzwPbxJS5SCkFnLi2ls1bb/jfcek0t/MwfwVWFk1
        ihKYD277C+QHlYlKMS/qNOd0IynGbGc=
X-Google-Smtp-Source: APXvYqysxzEuZoZvT3DDEQl8xU4WetYZVs/nuAbLjO6TaN9J4WjH9sF+m69lffaPTukZqV9jJJHfuQ==
X-Received: by 2002:a17:902:b482:: with SMTP id y2mr5454384plr.334.1569366131597;
        Tue, 24 Sep 2019 16:02:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n9sm843745pjq.30.2019.09.24.16.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 16:02:10 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Kees Cook <keescook@chromium.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] doc-rst: Reduce CSS padding around Field
Date:   Tue, 24 Sep 2019 16:02:07 -0700
Message-Id: <20190924230208.12414-2-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190924230208.12414-1-keescook@chromium.org>
References: <20190924230208.12414-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Right now any ":Field Name: Field Contents" lines end up with significant
padding due to CSS from the "table" CSS which rightly needs padding to
make tables readable. However, field lists don't need this as they tend
to be stacked together. The future heavy use of fields in the parsed
MAINTAINERS file needs this cleaned up, and existing users look better
too. Note the needless white space (and misalignment of name/contents)
between "Date" and "Author":

https://www.kernel.org/doc/html/latest/accounting/psi.html

This patch fixes this by lowering the padding with a more specific CSS.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Documentation/sphinx-static/theme_overrides.css | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/sphinx-static/theme_overrides.css b/Documentation/sphinx-static/theme_overrides.css
index e21e36cd6761..459ec5b29d68 100644
--- a/Documentation/sphinx-static/theme_overrides.css
+++ b/Documentation/sphinx-static/theme_overrides.css
@@ -53,6 +53,16 @@ div[class^="highlight"] pre {
     line-height: normal;
 }
 
+/* Keep fields from being strangely far apart due to inheirited table CSS. */
+.rst-content table.field-list th.field-name {
+    padding-top: 1px;
+    padding-bottom: 1px;
+}
+.rst-content table.field-list td.field-body {
+    padding-top: 1px;
+    padding-bottom: 1px;
+}
+
 @media screen {
 
     /* content column
-- 
2.17.1

