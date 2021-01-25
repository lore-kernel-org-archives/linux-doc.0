Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE590C433DB
	for <linux-doc@archiver.kernel.org>; Tue, 26 Jan 2021 05:55:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62ED7207B1
	for <linux-doc@archiver.kernel.org>; Tue, 26 Jan 2021 05:55:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728027AbhAZFy0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Jan 2021 00:54:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:38082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725823AbhAYJPo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 25 Jan 2021 04:15:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21CFB22C9C;
        Mon, 25 Jan 2021 08:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611562756;
        bh=PK/CPNfEVE3sgimFMYY6HtmJMEKnK5VbqgWqrbzhSwY=;
        h=From:To:Cc:Subject:Date:From;
        b=KY26vNuBWID6epO1g7qRWGgYroKtAFrWsA1RoHzCbRaB35YHEhnmL6u9CR9Ze+7FA
         Icnh+zEjHPKScZC/RwLW8v8+1FzruybuqKgJ32mYI9cs+QcostyFzN2+Dd4dy+tmaS
         8+0aL32pFPDgsjKt3ATqSIcICoLLECBfZUxoffs/8LW+2i1j8LJtUrealh9j+IcVyA
         rduljQUlbYDtHrgsp47URr8iHdsY8uEAbBEhcaQX3H9D5XW20Ix745oQMziPieUIO3
         ScvokFEv8x6/onJsLns8hoqdCqjS/QzIiJz7JXDaG1kf9Dm6zhfPMVsz+RYlGKlz3S
         oOWn1u+4Cy6Vg==
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     corbet@lwn.net
Cc:     Jarkko Sakkinen <jarkko@kernel.org>,
        =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@protonmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ben Widawsky <ben.widawsky@intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kernel-doc: Make the description of return value readable
Date:   Mon, 25 Jan 2021 10:19:04 +0200
Message-Id: <20210125081905.145569-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The description on how to describe return values is over-complicated, and
hard to follow. For alien reason, the body of the section is a note, and
the first paragraph speaks about 'Return', albeit the section name is
actually 'Return:'.

To give a better help when both implementing and reviewing patches, provide
a straight-forward guideline, how to decribe return values, instead of
providing a note that starts by "blacklisting" one of the infinite possible
options of doing it wrong.

This decreases the cumulative amount of time, which is probably
substantial, on this otherwise somewhat trivial topic.

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 Documentation/doc-guide/kernel-doc.rst | 34 +++++++-------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
index 79aaa55d6bcf..dc5e1722c150 100644
--- a/Documentation/doc-guide/kernel-doc.rst
+++ b/Documentation/doc-guide/kernel-doc.rst
@@ -136,34 +136,18 @@ Examples::
 Return values
 ~~~~~~~~~~~~~
 
-The return value, if any, should be described in a dedicated section
-named ``Return``.
+The return value, if any, should be described in a dedicated section named
+``Return:``.
 
-.. note::
-
-  #) The multi-line descriptive text you provide does *not* recognize
-     line breaks, so if you try to format some text nicely, as in::
-
-	* Return:
-	* 0 - OK
-	* -EINVAL - invalid argument
-	* -ENOMEM - out of memory
-
-     this will all run together and produce::
-
-	Return: 0 - OK -EINVAL - invalid argument -ENOMEM - out of memory
-
-     So, in order to produce the desired line breaks, you need to use a
-     ReST list, e. g.::
+In order to describe multiple return values, a ReST list should be used. That
+way Sphinx knows how to line-up them properly::
 
-      * Return:
-      * * 0		- OK to runtime suspend the device
-      * * -EBUSY	- Device should not be runtime suspended
+  * Return:
+  * - 0:	The run-time is allowed to suspend the device.
+  * - -EBUSY:	Device should not be suspended.
 
-  #) If the descriptive text you provide has lines that begin with
-     some phrase followed by a colon, each of those phrases will be taken
-     as a new section heading, which probably won't produce the desired
-     effect.
+Using a dash rather than asterisk an is probably a better idea, because it does
+not meddle as much with the C-comments.
 
 Structure, union, and enumeration documentation
 -----------------------------------------------
-- 
2.30.0

