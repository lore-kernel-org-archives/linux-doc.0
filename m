Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988C1C433F5
	for <linux-doc@archiver.kernel.org>; Thu,  7 Oct 2021 04:01:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7159761215
	for <linux-doc@archiver.kernel.org>; Thu,  7 Oct 2021 04:01:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbhJGEDG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 7 Oct 2021 00:03:06 -0400
Received: from bee.birch.relay.mailchannels.net ([23.83.209.14]:62424 "EHLO
        bee.birch.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229379AbhJGEDD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Oct 2021 00:03:03 -0400
X-Sender-Id: instrampxe0y3a|x-authsender|calestyo@scientia.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id F04345424B1;
        Thu,  7 Oct 2021 04:01:08 +0000 (UTC)
Received: from mailgw-02.dd24.net (100-96-99-46.trex.outbound.svc.cluster.local [100.96.99.46])
        (Authenticated sender: instrampxe0y3a)
        by relay.mailchannels.net (Postfix) with ESMTPA id 3C3A9542440;
        Thu,  7 Oct 2021 04:01:07 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authsender|calestyo@scientia.net
Received: from mailgw-02.dd24.net (mailgw-02.dd24.net [193.46.215.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
        by 100.96.99.46 (trex/6.4.3);
        Thu, 07 Oct 2021 04:01:08 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: instrampxe0y3a|x-authsender|calestyo@scientia.net
X-MailChannels-Auth-Id: instrampxe0y3a
X-Cold-Society: 6ba00f51497a0721_1633579268786_183611697
X-MC-Loop-Signature: 1633579268786:4288346616
X-MC-Ingress-Time: 1633579268786
Received: from heisenberg.scientia.net (ppp-188-174-65-9.dynamic.mnet-online.de [188.174.65.9])
        (Authenticated sender: calestyo@scientia.net)
        by smtp.dd24.net (Postfix) with ESMTPA id 8654C5FC25;
        Thu,  7 Oct 2021 04:01:05 +0000 (UTC)
Received: by heisenberg.scientia.net (Postfix, from userid 1000)
        id 4E80F16FDBFB; Thu,  7 Oct 2021 06:01:05 +0200 (CEST)
From:   Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org,
        Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>
Subject: [PATCH 1/2] docs: proc.rst: mountinfo: improved field numbering
Date:   Thu,  7 Oct 2021 06:00:01 +0200
Message-Id: <20211007040001.103413-2-mail@christoph.anton.mitterer.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007040001.103413-1-mail@christoph.anton.mitterer.name>
References: <20211007040001.103413-1-mail@christoph.anton.mitterer.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Without reading thoroughly, one could easily oversee that there may be several
fields after #6.
Made it more clearly by changing the field numbering.

Signed-off-by: Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>
---
 Documentation/filesystems/proc.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index 042c418f4090..d2542f737a0a 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -1857,7 +1857,7 @@ For example::
 This file contains lines of the form::
 
     36 35 98:0 /mnt1 /mnt2 rw,noatime master:1 - ext3 /dev/root rw,errors=continue
-    (1)(2)(3)   (4)   (5)      (6)      (7)   (8) (9)   (10)         (11)
+    (1)(2)(3)   (4)   (5)      (6)     (n…m) (m+1)(m+2) (m+3)         (m+4)
 
     (1) mount ID:  unique identifier of the mount (may be reused after umount)
     (2) parent ID:  ID of parent (or of self for the top of the mount tree)
@@ -1865,11 +1865,11 @@ This file contains lines of the form::
     (4) root:  root of the mount within the filesystem
     (5) mount point:  mount point relative to the process's root
     (6) mount options:  per mount options
-    (7) optional fields:  zero or more fields of the form "tag[:value]"
-    (8) separator:  marks the end of the optional fields
-    (9) filesystem type:  name of filesystem of the form "type[.subtype]"
-    (10) mount source:  filesystem specific information or "none"
-    (11) super options:  per super block options
+    (n…m) optional fields:  zero or more fields of the form "tag[:value]"
+    (m+1) separator:  marks the end of the optional fields
+    (m+2) filesystem type:  name of filesystem of the form "type[.subtype]"
+    (m+3) mount source:  filesystem specific information or "none"
+    (m+4) super options:  per super block options
 
 Parsers should ignore all unrecognised optional fields.  Currently the
 possible optional fields are:
-- 
2.33.0

