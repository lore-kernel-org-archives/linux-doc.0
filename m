Return-Path: <SRS0=XnAq=2G=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F99C43603
	for <linux-doc@archiver.kernel.org>; Mon, 16 Dec 2019 09:39:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 29AE2206D7
	for <linux-doc@archiver.kernel.org>; Mon, 16 Dec 2019 09:39:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F3TtV86F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbfLPJjG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 Dec 2019 04:39:06 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42154 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbfLPJjG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Dec 2019 04:39:06 -0500
Received: by mail-lj1-f193.google.com with SMTP id e28so6007115ljo.9
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2019 01:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i96BBv4xB0UOkb8CqXar2xCrFHaAhJCrLFpriAWqlj0=;
        b=F3TtV86F6pJKBHGK1s6xJUjBmW+DsKPZR55zhhpyAorohxg+6NMin8Q14MDXsH2ffm
         DxitXGOuI0a+Oeej915+uEAvWgkdRzvIiZPzyLXddovDG88j6lNjWGKIbHvibIV8n4iH
         wf0w43+HXW8VlzXEjKcHf7zCxJcamber6xkeLONSHZPNHh/wbuncv2m5PUsnTtRh1xtK
         dO+Dfc30v8EnkPZAB1qdFsSiMlsHa0CgDi4jVBIYWWj055t7myx/dBmxxuk78GQQhNpV
         0gtiojwB5CNvUErGc7/WqhiOepJnDjl3eKh5AFtXLAFQNZeQTIFrlZDLQpDWkSvX6DP0
         Hu1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i96BBv4xB0UOkb8CqXar2xCrFHaAhJCrLFpriAWqlj0=;
        b=A6fWnXZ0KmKE0SPiDhIN7wya6lpoICyiF06fPwpuAY2XMsEWRVZ4gzjPAJRYaVbeyv
         YsZAylXP3pahmhzAwyySr2pKbNNAiRcWbmVv9MdsYCy8O/vrCQJtcLszSVT9Wiii3m+f
         /Z3tyhFSL8dYTCv3FreddxvBZ/OZ6wrxqVVpPkAD/3whI1Qw8U447G649Q9X8UdBYMmn
         M3NrnUEac7a8gCq/kzlGI65TQC+T0o0vwxHdgjdGC9BoNNLmCwqWMbmKqQnBGb9SRGSM
         koUOYS/fOK+jcEiGqSvOJR1U6gLXoToffaNrg38+yXT8rCJ/F8DAw6ykOGnOA7B3n2x5
         HCtw==
X-Gm-Message-State: APjAAAUrCd36Vup/1Z6r+4eGcxXEh0Mmwk/oue5SKqj7plmH6UYbV5W+
        JY/M7yG8kysBKAYT8KGMbdqUKA==
X-Google-Smtp-Source: APXvYqzxNoSEFJBDSaL2oDJ+vGszGEHczrwG3jxMaEYeYuDpVya5AgP9XEr0MnPloISgVNunCWfQZg==
X-Received: by 2002:a2e:8045:: with SMTP id p5mr18656961ljg.251.1576489144844;
        Mon, 16 Dec 2019 01:39:04 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id z13sm10254443ljh.21.2019.12.16.01.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 01:39:04 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Russell King <linux@armlinux.org.uk>
Subject: [PATCH] docs: Document the Link: tag formally
Date:   Mon, 16 Dec 2019 10:38:59 +0100
Message-Id: <20191216093859.9196-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We have a lot of Link: tags in commits these days and they are
not formally defined in the kernel documentation. Let's put
a separate paragraph about it in submitting-patches.rst where
most other tags are defined.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Russell King <linux@armlinux.org.uk>
Reported-by: Russell King <linux@armlinux.org.uk>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/process/submitting-patches.rst | 21 ++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index ba5e944c7a63..20ef984aa743 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -643,9 +643,22 @@ which stable kernel versions should receive your fix. This is the preferred
 method for indicating a bug fixed by the patch. See :ref:`describe_changes`
 for more details.
 
+14) Link: tags
+--------------
+
+A Link: attribute can be used to provide a link back to a protocol of a
+discussion pertaining to the patch. A typical link looks like this:
+
+    Link: https://lore.kernel.org/r/<message-id>
+
+Any HTTP[S] links can be referenced. It is customary for maintainers to add
+Link: tags to reference discussions on mailing lists, and this can be done
+automatically with the git tool when applying patches in mailbox format, see
+:ref:`Documentation/maintainer/configure-git.rst <configure git>`.
+
 .. _the_canonical_patch_format:
 
-14) The canonical patch format
+15) The canonical patch format
 ------------------------------
 
 This section describes how the patch itself should be formatted.  Note
@@ -768,7 +781,7 @@ references.
 
 .. _explicit_in_reply_to:
 
-15) Explicit In-Reply-To headers
+16) Explicit In-Reply-To headers
 --------------------------------
 
 It can be helpful to manually add In-Reply-To: headers to a patch
@@ -782,7 +795,7 @@ helpful, you can use the https://lkml.kernel.org/ redirector (e.g., in
 the cover email text) to link to an earlier version of the patch series.
 
 
-16) Providing base tree information
+17) Providing base tree information
 -----------------------------------
 
 When other developers receive your patches and start the review process,
@@ -833,7 +846,7 @@ either below the ``---`` line or at the very bottom of all other
 content, right before your email signature.
 
 
-17) Sending ``git pull`` requests
+18) Sending ``git pull`` requests
 ---------------------------------
 
 If you have a series of patches, it may be most convenient to have the
-- 
2.23.0

