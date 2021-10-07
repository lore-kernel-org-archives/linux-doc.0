Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C65C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  7 Oct 2021 04:01:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E466361215
	for <linux-doc@archiver.kernel.org>; Thu,  7 Oct 2021 04:01:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbhJGEDG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 7 Oct 2021 00:03:06 -0400
Received: from bee.birch.relay.mailchannels.net ([23.83.209.14]:40124 "EHLO
        bee.birch.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229497AbhJGEDE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Oct 2021 00:03:04 -0400
X-Sender-Id: instrampxe0y3a|x-authsender|calestyo@scientia.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id D123B680D27;
        Thu,  7 Oct 2021 04:01:09 +0000 (UTC)
Received: from mailgw-02.dd24.net (100-96-18-141.trex.outbound.svc.cluster.local [100.96.18.141])
        (Authenticated sender: instrampxe0y3a)
        by relay.mailchannels.net (Postfix) with ESMTPA id 0703668118D;
        Thu,  7 Oct 2021 04:01:07 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authsender|calestyo@scientia.net
Received: from mailgw-02.dd24.net (mailgw-02.dd24.net [193.46.215.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
        by 100.96.18.141 (trex/6.4.3);
        Thu, 07 Oct 2021 04:01:09 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: instrampxe0y3a|x-authsender|calestyo@scientia.net
X-MailChannels-Auth-Id: instrampxe0y3a
X-Oafish-Whispering: 6143d101539d0d16_1633579269390_3140959456
X-MC-Loop-Signature: 1633579269390:149111350
X-MC-Ingress-Time: 1633579269390
Received: from heisenberg.scientia.net (ppp-188-174-65-9.dynamic.mnet-online.de [188.174.65.9])
        (Authenticated sender: calestyo@scientia.net)
        by smtp.dd24.net (Postfix) with ESMTPA id 4E93B5FC4B;
        Thu,  7 Oct 2021 04:01:06 +0000 (UTC)
Received: by heisenberg.scientia.net (Postfix, from userid 1000)
        id 1634F16FDBFD; Thu,  7 Oct 2021 06:01:06 +0200 (CEST)
From:   Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org,
        Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>
Subject: [PATCH 2/2] docs: proc.rst: mountinfo: align columns
Date:   Thu,  7 Oct 2021 06:00:02 +0200
Message-Id: <20211007040001.103413-3-mail@christoph.anton.mitterer.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007040001.103413-1-mail@christoph.anton.mitterer.name>
References: <20211007040001.103413-1-mail@christoph.anton.mitterer.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>
---
 Documentation/filesystems/proc.rst | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index d2542f737a0a..8d7f141c6fc7 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -1859,17 +1859,17 @@ This file contains lines of the form::
     36 35 98:0 /mnt1 /mnt2 rw,noatime master:1 - ext3 /dev/root rw,errors=continue
     (1)(2)(3)   (4)   (5)      (6)     (n…m) (m+1)(m+2) (m+3)         (m+4)
 
-    (1) mount ID:  unique identifier of the mount (may be reused after umount)
-    (2) parent ID:  ID of parent (or of self for the top of the mount tree)
-    (3) major:minor:  value of st_dev for files on filesystem
-    (4) root:  root of the mount within the filesystem
-    (5) mount point:  mount point relative to the process's root
-    (6) mount options:  per mount options
-    (n…m) optional fields:  zero or more fields of the form "tag[:value]"
-    (m+1) separator:  marks the end of the optional fields
-    (m+2) filesystem type:  name of filesystem of the form "type[.subtype]"
-    (m+3) mount source:  filesystem specific information or "none"
-    (m+4) super options:  per super block options
+    (1)   mount ID:        unique identifier of the mount (may be reused after umount)
+    (2)   parent ID:       ID of parent (or of self for the top of the mount tree)
+    (3)   major:minor:     value of st_dev for files on filesystem
+    (4)   root:            root of the mount within the filesystem
+    (5)   mount point:     mount point relative to the process's root
+    (6)   mount options:   per mount options
+    (n…m) optional fields: zero or more fields of the form "tag[:value]"
+    (m+1) separator:       marks the end of the optional fields
+    (m+2) filesystem type: name of filesystem of the form "type[.subtype]"
+    (m+3) mount source:    filesystem specific information or "none"
+    (m+4) super options:   per super block options
 
 Parsers should ignore all unrecognised optional fields.  Currently the
 possible optional fields are:
-- 
2.33.0

