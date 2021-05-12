Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4586EC433ED
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 12:51:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 154F561104
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 12:51:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231166AbhELMxB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 May 2021 08:53:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:52584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231310AbhELMwv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 12 May 2021 08:52:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F8C961417;
        Wed, 12 May 2021 12:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620823902;
        bh=NJ4jcd2S0MqqF1GQjKPHZyD2C+Se0R8Fi4ONAk1Od5M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UkIGVodtiNfZaIiqZpBbckPirT9lNAlpAdDow9Ib8GOoKK3n58dvKMwKxAaCrcAvu
         PDRYCxVJnHpD642pDLxMi6RVXhcfrPsYw7V2HdLaWaVtlDae8bVb3ENLSYCPGiVETP
         ehxJJ2ZJoFVUxQYZ2O9gTLJ46kCmKjEtCyQZ2htzN8rdvVQMfaBBcpillTfO+JjjBD
         4gigNapxnbh4QNePQASImJQlJ1TCjUggTLhGe4xax0QFOE3RqETFUUOIEuXMK/xYdg
         KoGYAANN9rlqT8/9jIfQDp4IXgKhtMn+r+YsdGudWEvsHOn1JFscu5eGr9JIfzbd5j
         J/3SDO6JPfAOw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lgoKy-0018hV-EM; Wed, 12 May 2021 14:51:40 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/40] docs: fault-injection: nvme-fault-injection.rst: Use ASCII subset instead of UTF-8 alternate symbols
Date:   Wed, 12 May 2021 14:50:15 +0200
Message-Id: <1c7520a02119fc356fa71732b9162f5892016f5d.1620823573.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620823573.git.mchehab+huawei@kernel.org>
References: <cover.1620823573.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The conversion tools used during DocBook/LaTeX/Markdown->ReST conversion
and some automatic rules which exists on certain text editors like
LibreOffice turned ASCII characters into some UTF-8 alternatives that
are better displayed on html and PDF.

While it is OK to use UTF-8 characters in Linux, it is better to
use the ASCII subset instead of using an UTF-8 equivalent character
as it makes life easier for tools like grep, and are easier to edit
with the some commonly used text/source code editors.

Also, Sphinx already do such conversion automatically outside literal blocks:
   https://docutils.sourceforge.io/docs/user/smartquotes.html

So, replace the occurences of the following UTF-8 characters:

	- U+2018 ('‘'): LEFT SINGLE QUOTATION MARK
	- U+2019 ('’'): RIGHT SINGLE QUOTATION MARK

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/fault-injection/nvme-fault-injection.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/fault-injection/nvme-fault-injection.rst b/Documentation/fault-injection/nvme-fault-injection.rst
index 1d4427890d75..d372ce66a244 100644
--- a/Documentation/fault-injection/nvme-fault-injection.rst
+++ b/Documentation/fault-injection/nvme-fault-injection.rst
@@ -25,7 +25,7 @@ Example 1: Inject default status code with no retry
 
 Expected Result::
 
-  cp: cannot stat ‘/mnt/a.file’: Input/output error
+  cp: cannot stat '/mnt/a.file': Input/output error
 
 Message from dmesg::
 
-- 
2.30.2

