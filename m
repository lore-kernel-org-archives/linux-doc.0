Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 31E1F7D917
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Nov 2019 22:32:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbfKRWc1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Nov 2019 17:32:27 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40932 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfKRWc1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Nov 2019 17:32:27 -0500
Received: by mail-lj1-f194.google.com with SMTP id q2so20922409ljg.7
        for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2019 14:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WJhUfpuuirp/sd/RAPLx9plgAg3FJx8uqtM/2Mg1YyY=;
        b=i0rSRrkYBvhmtOM9PtJnf5SMpjEzYaOFK+PFRSmfmeLqSd/wJa9JF1p/Rl/UAhsBSe
         SmN/I8hbRhXuG3zRnG1rao19M8vcPaXuwvd8V7x6fVC5uHxb5WOHqMVAp3viQb8nzN7X
         hLLwzcapMT4Q45BQTn9pEwMuL9I3GlWyA2TGmlO/GesDMECvLp+7K7gxNoZASAPuGXgk
         3Eaq9Fqp0fXQtqLwL4xqQg34BGXv8578C8egNqeCBui28TAexcPiAMwYYxgR5hZZINIk
         m2urDHzTskDOIXPDIuYMyhKRoEo/KBChl4zkIPFGvkWty+OeKHjTGGPrqNcbpn4eMOIL
         6GAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WJhUfpuuirp/sd/RAPLx9plgAg3FJx8uqtM/2Mg1YyY=;
        b=GDQKM4KGF5B1TpK+A/2QcOrlA25U5oDy2iGVRL64Ad/cqFiV1YEI8RAw30KyQYK8G3
         djdriRF72Nh5Ysy/+Ew4aua3WEvgitdfnE+Al6zC+Z+ZhgHa8vITLAonpOhXNWFyT6eX
         Iw9aW7CB4bfPZf8F4iIxmagGgYUSIZ3Wj8Sl4AUGiVr43Vi1hW6glqc3ss8aVYWILkD/
         zQniQirmXSbwU2240nU1to40MbUeN4cQbvKysRCUrMDHCO46Wq3Vadl9JJSA1lSw5K45
         LR2bAp2lrFcpE3g3K5YN9UCb0CFP2rUftXAbfcLExxPCIoP9wsGHXff7SHWUvYMgCtyl
         XpLQ==
X-Gm-Message-State: APjAAAVBp90tovbqlYHcJGolbT/xNarlctekstNQoh7/OHREsOkGzZLG
        vIz+PJULKprNBzbU6EUEaU4NZQ==
X-Google-Smtp-Source: APXvYqyEkIFcIqnt61ceiDjywPyojv1+Yux1fxm92GGEnBjYl1cDMkO+T08Rr6ePOH2urvNFsXp1BA==
X-Received: by 2002:a05:651c:1139:: with SMTP id e25mr1299271ljo.200.1574116344094;
        Mon, 18 Nov 2019 14:32:24 -0800 (PST)
Received: from localhost.localdomain (c-79c8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.200.121])
        by smtp.gmail.com with ESMTPSA id q11sm8839747ljm.107.2019.11.18.14.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 14:32:22 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>
Subject: [PATCH v2] Documentation: Document how to get links with git am
Date:   Mon, 18 Nov 2019 23:30:19 +0100
Message-Id: <20191118223019.81708-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
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
ChangeLog v1->v2:
- Make the document part of maintainer/configure-git.rst
- Did not try to separate out to a standalone script file, the thing
  needs to come with other command line interaction anyway
---
 Documentation/maintainer/configure-git.rst | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/maintainer/configure-git.rst b/Documentation/maintainer/configure-git.rst
index 78bbbb0d2c84..80ae5030a590 100644
--- a/Documentation/maintainer/configure-git.rst
+++ b/Documentation/maintainer/configure-git.rst
@@ -32,3 +32,33 @@ You may also like to tell ``gpg`` which ``tty`` to use (add to your shell rc fil
 ::
 
 	export GPG_TTY=$(tty)
+
+
+Creating commit links to lore.kernel.org
+----------------------------------------
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
+This can be configured to happen automatically any time you issue ``git am``
+by adding the following hook into your git:
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
-- 
2.23.0

