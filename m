Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 322B97D089
	for <lwn-linux-doc@archive.lwn.net>; Mon, 26 Nov 2018 16:51:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbeK0Dqi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 26 Nov 2018 22:46:38 -0500
Received: from foss.arm.com ([217.140.101.70]:42520 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726203AbeK0Dqi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 26 Nov 2018 22:46:38 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A2C015AD;
        Mon, 26 Nov 2018 08:51:58 -0800 (PST)
Received: from edgewater-inn.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0A68A3F59C;
        Mon, 26 Nov 2018 08:51:58 -0800 (PST)
Received: by edgewater-inn.cambridge.arm.com (Postfix, from userid 1000)
        id 83F711AE0839; Mon, 26 Nov 2018 16:52:15 +0000 (GMT)
From:   Will Deacon <will.deacon@arm.com>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Will Deacon <will.deacon@arm.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Laight <David.Laight@ACULAB.COM>,
        Alan Stern <stern@rowland.harvard.edu>,
        Peter Zijlstra <peterz@infradead.org>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: [PATCH] docs/memory-barriers.txt: Enforce heavy ordering for port I/O accesses
Date:   Mon, 26 Nov 2018 16:52:14 +0000
Message-Id: <1543251134-29867-1-git-send-email-will.deacon@arm.com>
X-Mailer: git-send-email 2.1.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

David Laight explains:

  | A long time ago there was a document from Intel that said that
  | inb/outb weren't necessarily synchronised wrt memory accesses.
  | (Might be P-pro era). However no processors actually behaved that
  | way and more recent docs say that inb/outb are fully ordered.

This also reflects the situation on other architectures, the the port
accessor macros tend to be implemented in terms of readX/writeX.

Update Documentation/memory-barriers.txt to reflect reality.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: David Laight <David.Laight@ACULAB.COM>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Signed-off-by: Will Deacon <will.deacon@arm.com>
---

Just remembered I had this patch kicking around in my tree...

 Documentation/memory-barriers.txt | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/memory-barriers.txt b/Documentation/memory-barriers.txt
index c1d913944ad8..0c34c5dac138 100644
--- a/Documentation/memory-barriers.txt
+++ b/Documentation/memory-barriers.txt
@@ -2619,10 +2619,8 @@ functions:
      intermediary bridges (such as the PCI host bridge) may not fully honour
      that.
 
-     They are guaranteed to be fully ordered with respect to each other.
-
-     They are not guaranteed to be fully ordered with respect to other types of
-     memory and I/O operation.
+     They are guaranteed to be fully ordered with respect to each other and
+     also with respect to other types of memory and I/O operation.
 
  (*) readX(), writeX():
 
-- 
2.1.4

