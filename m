Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 146887D0D7
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Jan 2019 03:19:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbfAGDTm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 6 Jan 2019 22:19:42 -0500
Received: from merlin.infradead.org ([205.233.59.134]:60868 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfAGDTm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 6 Jan 2019 22:19:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=wIWra0gqXtdEeJj3klCZ/IQxNvXBPiHt5+l8HXHNqGM=; b=Q9SZmGHDa4YOqZg9qsTPZzCVCI
        rAto0Ay9XY7fcCeauBMJuoLpoRxxtNDweSA02CsxDMftVzgB/qPlOCIPdw8p/5paySdrPHfvq35U9
        qOKf1NBJAOGYUNQEcXIabjE4hsCrNhXmRiSvAtqegO28jw66ErkenjFNMt5tUQk5cUoB7Dgx1k+VW
        KVk98L1Y20fHXrRMXSOV/0FmJUBWMdUq5g0K0qHPGA1a/WLJDruX4AP+HQbZq2REfQLF3vDPPkFN5
        C8pPkR/Lbbx7YQnEn1fm12rLkPKWKL4epkmG6OeZDJDElG70NwOnC1QK3tYzlUI9iIvIUamUVKvjg
        Om+11pzg==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1ggLRw-0001bU-5V; Mon, 07 Jan 2019 03:19:36 +0000
To:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     NeilBrown <neilb@suse.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] Documentation/filesystems: fix title underline lengths in
 path-lookup.rst
Message-ID: <abe71918-29c1-ce47-57ad-e1908c7136e6@infradead.org>
Date:   Sun, 6 Jan 2019 19:19:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix Sphinx warnings in path-lookup.rst:

Documentation/filesystems/path-lookup.rst:347: WARNING: Title underline too short.
Documentation/filesystems/path-lookup.rst:358: WARNING: Title underline too short.
Documentation/filesystems/path-lookup.rst:369: WARNING: Title underline too short.
Documentation/filesystems/path-lookup.rst:375: WARNING: Title underline too short.
Documentation/filesystems/path-lookup.rst:384: WARNING: Title underline too short.
Documentation/filesystems/path-lookup.rst:513: WARNING: Title underline too short.
Documentation/filesystems/path-lookup.rst:532: WARNING: Title underline too short.
Documentation/filesystems/path-lookup.rst:545: WARNING: Title underline too short.
Documentation/filesystems/path-lookup.rst:701: WARNING: Title underline too short.
Documentation/filesystems/path-lookup.rst:730: WARNING: Title underline too short.
Documentation/filesystems/path-lookup.rst:777: WARNING: Title underline too short.
Documentation/filesystems/path-lookup.rst:799: WARNING: Title underline too short.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Neil, You didn't get these warnings when you built the docs?

 Documentation/filesystems/path-lookup.rst |   24 ++++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

--- lnx-50-rc1.orig/Documentation/filesystems/path-lookup.rst
+++ lnx-50-rc1/Documentation/filesystems/path-lookup.rst
@@ -344,7 +344,7 @@ In particular it is held while scanning
 table, and the mount point hash table.
 
 Bringing it together with ``struct nameidata``
---------------------------------------------
+----------------------------------------------
 
 .. _First edition Unix: http://minnie.tuhs.org/cgi-bin/utree.pl?file=V1/u2.s
 
@@ -355,7 +355,7 @@ converts a "name" to an "inode".  ``stru
 other fields):
 
 ``struct path path``
-~~~~~~~~~~~~~~~~~~
+~~~~~~~~~~~~~~~~~~~~
 
 A ``path`` contains a ``struct vfsmount`` (which is
 embedded in a ``struct mount``) and a ``struct dentry``.  Together these
@@ -366,13 +366,13 @@ step.  A reference through ``d_lockref``
 held.
 
 ``struct qstr last``
-~~~~~~~~~~~~~~~~~~
+~~~~~~~~~~~~~~~~~~~~
 
 This is a string together with a length (i.e. _not_ ``nul`` terminated)
 that is the "next" component in the pathname.
 
 ``int last_type``
-~~~~~~~~~~~~~~~
+~~~~~~~~~~~~~~~~~
 
 This is one of ``LAST_NORM``, ``LAST_ROOT``, ``LAST_DOT``, ``LAST_DOTDOT``, or
 ``LAST_BIND``.  The ``last`` field is only valid if the type is
@@ -381,7 +381,7 @@ components of the symlink have been proc
 fairly self-explanatory.
 
 ``struct path root``
-~~~~~~~~~~~~~~~~~~
+~~~~~~~~~~~~~~~~~~~~
 
 This is used to hold a reference to the effective root of the
 filesystem.  Often that reference won't be needed, so this field is
@@ -510,7 +510,7 @@ potentially interesting things about the
 to three different flags that might be set in ``dentry->d_flags``:
 
 ``DCACHE_MANAGE_TRANSIT``
-~~~~~~~~~~~~~~~~~~~~~~~
+~~~~~~~~~~~~~~~~~~~~~~~~~
 
 If this flag has been set, then the filesystem has requested that the
 ``d_manage()`` dentry operation be called before handling any possible
@@ -529,7 +529,7 @@ filesystem, which will then give it a sp
 ``d_manage()`` by returning ``-EISDIR``.
 
 ``DCACHE_MOUNTED``
-~~~~~~~~~~~~~~~~
+~~~~~~~~~~~~~~~~~~
 
 This flag is set on every dentry that is mounted on.  As Linux
 supports multiple filesystem namespaces, it is possible that the
@@ -542,7 +542,7 @@ If this flag is set, and ``d_manage()``
 and a new ``dentry`` (both with counted references).
 
 ``DCACHE_NEED_AUTOMOUNT``
-~~~~~~~~~~~~~~~~~~~~~~~
+~~~~~~~~~~~~~~~~~~~~~~~~~
 
 If ``d_manage()`` allowed us to get this far, and ``lookup_mnt()`` didn't
 find a mount point, then this flag causes the ``d_automount()`` dentry
@@ -698,7 +698,7 @@ With that little refresher on seqlocks o
 the bigger picture of how RCU-walk uses seqlocks.
 
 ``mount_lock`` and ``nd->m_seq``
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 We already met the ``mount_lock`` seqlock when REF-walk used it to
 ensure that crossing a mount point is performed safely.  RCU-walk uses
@@ -727,7 +727,7 @@ results would have been the same.  This
 at least for vfsmount structures.
 
 ``dentry->d_seq`` and ``nd->seq``
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 In place of taking a count or lock on ``d_reflock``, RCU-walk samples
 the per-dentry ``d_seq`` seqlock, and stores the sequence number in the
@@ -774,7 +774,7 @@ getting a counted reference to the new d
 the old dentry which we saw in REF-walk.
 
 No ``inode->i_rwsem`` or even ``rename_lock``
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 A semaphore is a fairly heavyweight lock that can only be taken when it is
 permissible to sleep.  As ``rcu_read_lock()`` forbids sleeping,
@@ -796,7 +796,7 @@ locking.  This neatly handles all cases,
 rename_lock would bring no significant value.
 
 ``unlazy walk()`` and ``complete_walk()``
--------------------------------------
+-----------------------------------------
 
 That "dropping down to REF-walk" typically involves a call to
 ``unlazy_walk()``, so named because "RCU-walk" is also sometimes
