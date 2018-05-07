Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DB6F97E27D
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 09:39:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752008AbeEGJiy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 05:38:54 -0400
Received: from osg.samsung.com ([64.30.133.232]:60958 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752474AbeEGJgH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 May 2018 05:36:07 -0400
Received: from localhost (localhost [127.0.0.1])
        by osg.samsung.com (Postfix) with ESMTP id 54A3D23456;
        Mon,  7 May 2018 02:36:07 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at dev.s-opensource.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from osg.samsung.com ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id faDeM43qJ7Vx; Mon,  7 May 2018 02:36:06 -0700 (PDT)
Received: from smtp.s-opensource.com (177.41.109.86.dynamic.adsl.gvt.net.br [177.41.109.86])
        by osg.samsung.com (Postfix) with ESMTPSA id 5619D233E5;
        Mon,  7 May 2018 02:36:01 -0700 (PDT)
Received: from mchehab by smtp.s-opensource.com with local (Exim 4.90_1)
        (envelope-from <mchehab@smtp.s-opensource.com>)
        id 1fFcYo-00087I-P0; Mon, 07 May 2018 06:35:58 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vinod Koul <vinod.koul@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <treding@nvidia.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Ingo Molnar <mingo@kernel.org>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>, linux-crypto@vger.kernel.org
Subject: [PATCH 03/18] docs: */index.rst: Add newer documents to their respective index.rst
Date:   Mon,  7 May 2018 06:35:39 -0300
Message-Id: <e6852448ac11e827f86dab1e183b82af6a320559.1525684985.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525684985.git.mchehab+samsung@kernel.org>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
In-Reply-To: <cover.1525684985.git.mchehab+samsung@kernel.org>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A number of new docs were added, but they're currently not on
the index.rst from the session they're supposed to be, causing
Sphinx warnings.

Add them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/crypto/index.rst     | 1 +
 Documentation/driver-api/index.rst | 1 +
 Documentation/process/index.rst    | 1 +
 Documentation/security/index.rst   | 2 ++
 4 files changed, 5 insertions(+)

diff --git a/Documentation/crypto/index.rst b/Documentation/crypto/index.rst
index 94c4786f2573..c4ff5d791233 100644
--- a/Documentation/crypto/index.rst
+++ b/Documentation/crypto/index.rst
@@ -20,5 +20,6 @@ for cryptographic use cases, as well as programming examples.
    architecture
    devel-algos
    userspace-if
+   crypto_engine
    api
    api-samples
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 6d8352c0f354..3ac51c94f97b 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -18,6 +18,7 @@ available subsections can be seen below.
    infrastructure
    pm/index
    device-io
+   device_connection
    dma-buf
    device_link
    message-based
diff --git a/Documentation/process/index.rst b/Documentation/process/index.rst
index 1c9fe657ed01..37bd0628b6ee 100644
--- a/Documentation/process/index.rst
+++ b/Documentation/process/index.rst
@@ -52,6 +52,7 @@ lack of a better place.
    adding-syscalls
    magic-number
    volatile-considered-harmful
+   clang-format
 
 .. only::  subproject and html
 
diff --git a/Documentation/security/index.rst b/Documentation/security/index.rst
index 298a94a33f05..85492bfca530 100644
--- a/Documentation/security/index.rst
+++ b/Documentation/security/index.rst
@@ -9,5 +9,7 @@ Security Documentation
    IMA-templates
    keys/index
    LSM
+   LSM-sctp
+   SELinux-sctp
    self-protection
    tpm/index
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
