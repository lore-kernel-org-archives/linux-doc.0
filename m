Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A475B7D90D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 15 Nov 2019 13:32:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727527AbfKONcb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 15 Nov 2019 08:32:31 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38148 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727314AbfKONcb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Nov 2019 08:32:31 -0500
Received: by mail-lj1-f196.google.com with SMTP id v8so10719125ljh.5
        for <linux-doc@vger.kernel.org>; Fri, 15 Nov 2019 05:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iY4RkcWVuu121hVMn9CyIPjc341XN7bdK8dsOdXPx6s=;
        b=n6CC30E4kOfKRmH6xZYxfSZCAh/+gVRkYpdPWGt5gnTPKcI2U2lzwIgW2XVVot8GJt
         Tpe9/WuBNG06xrpHOIj3Q7Ml4eyWXbfFqnpQ5/2s0TbQQ/iNDXKcy06x4Guz8Y0c970f
         mxZq4gZCftIh5ycftiGmefxmDlHRr4XDsXKqQbf9BwC4oxNVDLmnQ540G4r1LfZvNLxi
         78Z502z7062KLqEDxaBIh1z5Y1g8QFeqNjzoVIozLg3XuLnBDnGsYiGyfIk/pwFkoe/U
         QZCVU0Q1CP77FWstZPxTbnVDzEY2cPz3taoPfHDfExbWZmqL8RncGp/ENVvrhXwcuBwc
         AbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iY4RkcWVuu121hVMn9CyIPjc341XN7bdK8dsOdXPx6s=;
        b=CkYZr1+jpswLqUwJQvoGPHi2p8v2LCUpujjdlgctkcP/nGmXVp41IUwu6pflr/s8Po
         9fFjncqerv+DVlG5yVShk0sf5OH/5Tk0sZdHBHNHlCQwkhUFkUk1AXQeE1Nt6QL1APlP
         TI3LM038TkWFhYzh2Vf5pYP5y8cHRAsdceShGeiGU+RTFSVFWXM+6K9RXrI4A7X3roLb
         Ojl96+j+0Iu4PaYKRoBKjOoRQpAPNqjIHCnEzJapvNZnfDOaCQrGFgEaYsHTnzVyR4vN
         MLeVVeAZfYq/TxOGpjmwNwH5pqjLBvC5HXP/h5tMPWUCvLZUVjRQFHDzmsVeCK/RJd3z
         7vww==
X-Gm-Message-State: APjAAAVoEa+V30/P4OJq2HTOuVjaSgSfNNnwbmevV4S4ynlJubNHGHoX
        fJ0Vxvy8PuOTK0W5huwBW4VcPg==
X-Google-Smtp-Source: APXvYqzQlZCNBIWssS9WflGIEvGBng7CIQasxGhWnPHWVH3Lg5u+SOFWTg7Ue8hGRi4p+OoYOkCiLQ==
X-Received: by 2002:a2e:a0ce:: with SMTP id f14mr11604522ljm.241.1573824749198;
        Fri, 15 Nov 2019 05:32:29 -0800 (PST)
Received: from localhost.localdomain (c-79c8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.200.121])
        by smtp.gmail.com with ESMTPSA id 21sm3999422lft.23.2019.11.15.05.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 05:32:27 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>
Subject: [PATCH] Documentation: Document how to get links with git am
Date:   Fri, 15 Nov 2019 14:30:21 +0100
Message-Id: <20191115133021.13165-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This adds Kees' clever apply hook to the kernel documentation so
it can be easily references when needed.

Cc: Kees Cook <keescook@chromium.org>
Link: https://lists.linuxfoundation.org/pipermail/ksummit-discuss/2019-July/006608.html
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../process/applying-patches-using-git.rst    | 43 +++++++++++++++++++
 Documentation/process/index.rst               |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 Documentation/process/applying-patches-using-git.rst

diff --git a/Documentation/process/applying-patches-using-git.rst b/Documentation/process/applying-patches-using-git.rst
new file mode 100644
index 000000000000..60955aa62d42
--- /dev/null
+++ b/Documentation/process/applying-patches-using-git.rst
@@ -0,0 +1,43 @@
+.. _applying_patches_using_git:
+
+Applying Patches to the Linux Kernel Using git
+++++++++++++++++++++++++++++++++++++++++++++++
+
+For the most part, using git to apply patches comes down to just following
+the established usage already documented in the git documentation. This is
+pretty intuitive since git was developed initially for Linux kernel
+development.
+
+In some cases the Linux kernel development has special quirks and usage
+patterns that are not an intrinsic part of git.
+
+This file documents some best practices.
+
+
+Creating commit links to lore.kernel.org
+========================================
+
+The web site http://lore.kernel.org is meant as a grand archive of all mail
+list traffic concerning or influencing the kernel development. Storing archives
+of patches here is a recommended practice, and when a maintainer applies a
+patch to a subsystem tree, it is a good idea to provide a Link: tag with a
+reference back to the lore archive so that people that browse the commit
+history can find related discussions and rationale behind a certain change.
+The link tag will look like this:
+
+    Link: https://lore.kernel.org/r/<message-id>
+
+This can be achieved by adding the following hook into your git:
+
+.. code-block:: none
+
+	$ git config am.messageid true
+	$ cat >.git/hooks/applypatch-msg <<'EOF'
+	#!/bin/sh
+	. git-sh-setup
+	perl -pi -e 's|^Message-Id:\s*<?([^>]+)>?$|Link: https://lore.kernel.org/r/$1|g;' "$1"
+	test -x "$GIT_DIR/hooks/commit-msg" &&
+		exec "$GIT_DIR/hooks/commit-msg" ${1+"$@"}
+	:
+	EOF
+	$ chmod a+x .git/hooks/applypatch-msg
diff --git a/Documentation/process/index.rst b/Documentation/process/index.rst
index e2c9ffc682c5..482b07402836 100644
--- a/Documentation/process/index.rst
+++ b/Documentation/process/index.rst
@@ -46,6 +46,7 @@ Other guides to the community that are of interest to most developers are:
    kernel-docs
    deprecated
    embargoed-hardware-issues
+   applying-patches-using-git
 
 These are some overall technical guides that have been put here for now for
 lack of a better place.
-- 
2.21.0

