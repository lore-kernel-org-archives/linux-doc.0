Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 556B67D92A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 26 Jul 2019 12:51:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbfGZMvm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 26 Jul 2019 08:51:42 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39902 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbfGZMvm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jul 2019 08:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=tDoszg6bPovolEoXeoVOmAYx8gMo7pfWD3sVgBM2eG0=; b=l22GS2FbgofP9VK36ooXQYUcEb
        ZfRoVo/wLyMNl7NTFuMMPZvhDxFXzIDaXlH2p3/SpTwnErz5UPP9Karxq+bOchs0BFLmXbGNafL0l
        wCIgNG9uShvLrtO6feYycr4zOQ2npExHw4hCyTTH5mF9vlV2Mz68wMQb7sBqyvbwpLeWKxcAx3WhB
        3Lb9kzkg+rpSwHVIzHE3XXg6PFDZ17CpPpbjT/YHXJkHAEI555Ja5Hsjc+6oL/p06K2/CeBCpARzt
        Lzj0/GD66Ng1ZRz3VXw35yORsXEzrXFywjBzQbq//AAfehVSfByp0WQ0DAjIgjhImOyLX6itYsk2k
        T75Fzwsg==;
Received: from [179.95.31.157] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hqzhE-0006Ak-Na; Fri, 26 Jul 2019 12:51:41 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hqzhC-0005aK-0M; Fri, 26 Jul 2019 09:51:38 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 04/26] docs: ubifs-authentication.md: convert to ReST
Date:   Fri, 26 Jul 2019 09:51:14 -0300
Message-Id: <6eea21e992a1655626601ec7d6500f745f0e091f.1564145354.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1564145354.git.mchehab+samsung@kernel.org>
References: <cover.1564145354.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The documentation standard is ReST and not markdown.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 ...entication.md => ubifs-authentication.rst} | 70 ++++++++++++-------
 1 file changed, 44 insertions(+), 26 deletions(-)
 rename Documentation/filesystems/{ubifs-authentication.md => ubifs-authentication.rst} (95%)

diff --git a/Documentation/filesystems/ubifs-authentication.md b/Documentation/filesystems/ubifs-authentication.rst
similarity index 95%
rename from Documentation/filesystems/ubifs-authentication.md
rename to Documentation/filesystems/ubifs-authentication.rst
index 23e698167141..6a9584f6ff46 100644
--- a/Documentation/filesystems/ubifs-authentication.md
+++ b/Documentation/filesystems/ubifs-authentication.rst
@@ -1,8 +1,11 @@
-% UBIFS Authentication
-% sigma star gmbh
-% 2018
+:orphan:
 
-# Introduction
+.. UBIFS Authentication
+.. sigma star gmbh
+.. 2018
+
+Introduction
+============
 
 UBIFS utilizes the fscrypt framework to provide confidentiality for file
 contents and file names. This prevents attacks where an attacker is able to
@@ -33,7 +36,8 @@ existing features like key derivation can be utilized. It should however also
 be possible to use UBIFS authentication without using encryption.
 
 
-## MTD, UBI & UBIFS
+MTD, UBI & UBIFS
+----------------
 
 On Linux, the MTD (Memory Technology Devices) subsystem provides a uniform
 interface to access raw flash devices. One of the more prominent subsystems that
@@ -47,7 +51,7 @@ UBIFS is a filesystem for raw flash which operates on top of UBI. Thus, wear
 leveling and some flash specifics are left to UBI, while UBIFS focuses on
 scalability, performance and recoverability.
 
-
+::
 
 	+------------+ +*******+ +-----------+ +-----+
 	|            | * UBIFS * | UBI-BLOCK | | ... |
@@ -84,7 +88,8 @@ persisted onto the flash directly. More details on UBIFS can also be found in
 [UBIFS-WP].
 
 
-### UBIFS Index & Tree Node Cache
+UBIFS Index & Tree Node Cache
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 Basic on-flash UBIFS entities are called *nodes*. UBIFS knows different types
 of nodes. Eg. data nodes (`struct ubifs_data_node`) which store chunks of file
@@ -118,17 +123,18 @@ on-flash filesystem structures like the index. On every commit, the TNC nodes
 marked as dirty are written to the flash to update the persisted index.
 
 
-### Journal
+Journal
+~~~~~~~
 
 To avoid wearing out the flash, the index is only persisted (*commited*) when
-certain conditions are met (eg. `fsync(2)`). The journal is used to record
+certain conditions are met (eg. ``fsync(2)``). The journal is used to record
 any changes (in form of inode nodes, data nodes etc.) between commits
 of the index. During mount, the journal is read from the flash and replayed
 onto the TNC (which will be created on-demand from the on-flash index).
 
 UBIFS reserves a bunch of LEBs just for the journal called *log area*. The
 amount of log area LEBs is configured on filesystem creation (using
-`mkfs.ubifs`) and stored in the superblock node. The log area contains only
+``mkfs.ubifs``) and stored in the superblock node. The log area contains only
 two types of nodes: *reference nodes* and *commit start nodes*. A commit start
 node is written whenever an index commit is performed. Reference nodes are
 written on every journal update. Each reference node points to the position of
@@ -152,6 +158,7 @@ done for the last referenced LEB of the journal. Only this can become corrupt
 because of a power cut. If the recovery fails, UBIFS will not mount. An error
 for every other LEB will directly cause UBIFS to fail the mount operation.
 
+::
 
        | ----    LOG AREA     ---- | ----------    MAIN AREA    ------------ |
 
@@ -172,10 +179,11 @@ for every other LEB will directly cause UBIFS to fail the mount operation.
                           containing their buds
 
 
-### LEB Property Tree/Table
+LEB Property Tree/Table
+~~~~~~~~~~~~~~~~~~~~~~~
 
 The LEB property tree is used to store per-LEB information. This includes the
-LEB type and amount of free and *dirty* (old, obsolete content) space [1] on
+LEB type and amount of free and *dirty* (old, obsolete content) space [1]_ on
 the LEB. The type is important, because UBIFS never mixes index nodes with data
 nodes on a single LEB and thus each LEB has a specific purpose. This again is
 useful for free space calculations. See [UBIFS-WP] for more details.
@@ -185,19 +193,21 @@ index. Due to its smaller size it is always written as one chunk on every
 commit. Thus, saving the LPT is an atomic operation.
 
 
-[1] Since LEBs can only be appended and never overwritten, there is a
-difference between free space ie. the remaining space left on the LEB to be
-written to without erasing it and previously written content that is obsolete
-but can't be overwritten without erasing the full LEB.
+.. [1] Since LEBs can only be appended and never overwritten, there is a
+   difference between free space ie. the remaining space left on the LEB to be
+   written to without erasing it and previously written content that is obsolete
+   but can't be overwritten without erasing the full LEB.
 
 
-# UBIFS Authentication
+UBIFS Authentication
+====================
 
 This chapter introduces UBIFS authentication which enables UBIFS to verify
 the authenticity and integrity of metadata and file contents stored on flash.
 
 
-## Threat Model
+Threat Model
+------------
 
 UBIFS authentication enables detection of offline data modification. While it
 does not prevent it, it enables (trusted) code to check the integrity and
@@ -224,7 +234,8 @@ Additional measures like secure boot and trusted boot have to be taken to
 ensure that only trusted code is executed on a device.
 
 
-## Authentication
+Authentication
+--------------
 
 To be able to fully trust data read from flash, all UBIFS data structures
 stored on flash are authenticated. That is:
@@ -236,7 +247,8 @@ stored on flash are authenticated. That is:
 - The LPT which stores UBI LEB metadata which UBIFS uses for free space accounting
 
 
-### Index Authentication
+Index Authentication
+~~~~~~~~~~~~~~~~~~~~
 
 Through UBIFS' concept of a wandering tree, it already takes care of only
 updating and persisting changed parts from leaf node up to the root node
@@ -260,6 +272,7 @@ include a hash. All other types of nodes will remain unchanged. This reduces
 the storage overhead which is precious for users of UBIFS (ie. embedded
 devices).
 
+::
 
                              +---------------+
                              |  Master Node  |
@@ -303,7 +316,8 @@ hashes to index nodes does not change this since each hash will be persisted
 atomically together with its respective node.
 
 
-### Journal Authentication
+Journal Authentication
+~~~~~~~~~~~~~~~~~~~~~~
 
 The journal is authenticated too. Since the journal is continuously written
 it is necessary to also add authentication information frequently to the
@@ -316,7 +330,7 @@ of the hash chain. That way a journal can be authenticated up to the last
 authentication node. The tail of the journal which may not have a authentication
 node cannot be authenticated and is skipped during journal replay.
 
-We get this picture for journal authentication:
+We get this picture for journal authentication::
 
     ,,,,,,,,
     ,......,...........................................
@@ -352,7 +366,8 @@ the superblock struct. The superblock node is stored in LEB 0 and is only
 modified on feature flag or similar changes, but never on file changes.
 
 
-### LPT Authentication
+LPT Authentication
+~~~~~~~~~~~~~~~~~~
 
 The location of the LPT root node on the flash is stored in the UBIFS master
 node. Since the LPT is written and read atomically on every commit, there is
@@ -363,7 +378,8 @@ be verified by verifying the authenticity of the master node and comparing the
 LTP hash stored there with the hash computed from the read on-flash LPT.
 
 
-## Key Management
+Key Management
+--------------
 
 For simplicity, UBIFS authentication uses a single key to compute the HMACs
 of superblock, master, commit start and reference nodes. This key has to be
@@ -399,7 +415,8 @@ approach is similar to the approach proposed for fscrypt encryption policy v2
 [FSCRYPT-POLICY2].
 
 
-# Future Extensions
+Future Extensions
+=================
 
 In certain cases where a vendor wants to provide an authenticated filesystem
 image to customers, it should be possible to do so without sharing the secret
@@ -411,7 +428,8 @@ to the way the IMA/EVM subsystem deals with such situations. The HMAC key
 will then have to be provided beforehand in the normal way.
 
 
-# References
+References
+==========
 
 [CRYPTSETUP2]        http://www.saout.de/pipermail/dm-crypt/2017-November/005745.html
 
-- 
2.21.0

