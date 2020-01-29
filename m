Return-Path: <SRS0=sBCo=3S=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80946C33CB2
	for <linux-doc@archiver.kernel.org>; Wed, 29 Jan 2020 04:49:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5733820702
	for <linux-doc@archiver.kernel.org>; Wed, 29 Jan 2020 04:49:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkqZeoKE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgA2Eta (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Jan 2020 23:49:30 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:38372 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbgA2Et3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Jan 2020 23:49:29 -0500
Received: by mail-qt1-f195.google.com with SMTP id c24so12293482qtp.5
        for <linux-doc@vger.kernel.org>; Tue, 28 Jan 2020 20:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NS0imMlIHtOBY68fLajraY326Yan8R1w8uLyD62IG/A=;
        b=CkqZeoKE9Vdt4t6apsIR/ER6+s82z+bLVSQc5fgTf/n6pfxO0HUIdQm2Q8qL/R7Toe
         ja7y12isP0Q2H43oFGjXUuJDAjsLPdK8U3AwpmEZGJlno/p9IyHbPSmmVA1hKpQB0tvp
         5/6BBp+kmhBslVS9shU36Q/S3rXngcklJ4sGfObbhLO6DuEluQLRSIpDIlt/DfSa3/Au
         MyoagoDW3pg31fs4q7h473mNZAdk/zTsh7EUAL4XncL75s9K3DxuqeDzhl6sLux+kUO+
         R/6asJreemYLmePCOpICIqLrnNVwW0Kluki+cnWHcvBeRTnujOAYF77EEY5MrW+p8qXP
         Of4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NS0imMlIHtOBY68fLajraY326Yan8R1w8uLyD62IG/A=;
        b=mpysdI7EXyCYXaJZ+F9PGVSDjSu3rdRZK4pcq8brDtvTeQ2h+ZmLP8+Iy6TupPS2Bc
         vg6NN8BQNwBzfkjUsWvmV67q3kzOVkxjptGNy/rp8fyGog8/jbHPYH9SoVW/yrGtP1lm
         6ltIRexdFgZ+4rILU8g/OMtLERNOFNZZWlx2TgPZx+6f5ezDcHH98uGMoV4SoXaBtn3I
         /S92jOncVKmdCXnAS5CZ5ArvgeUN8zOood90Q7889e5hR1sd+UgXJWkGsW5+PDufnnL2
         MrYeLJcBFqQdfkSBAk8mfk+riXPMhYQiAAjvfqzmRPTD0B6K56pqHdbcU6P1exxE0Coq
         iCfQ==
X-Gm-Message-State: APjAAAU9TSMvOfQq6WG3fG7HpwB+Dqd7aDcU34qxpJWZNkEHXhXjI43j
        QogD/WkptArbWZ/WSt7upsc=
X-Google-Smtp-Source: APXvYqwmSIuAbl23bJ0koQipxwLR8KAvx7mptY/51QcyQjaMKudO3SlY6rrjnCBNCQlmHPobHcS0OQ==
X-Received: by 2002:ac8:5410:: with SMTP id b16mr24431730qtq.45.1580273368383;
        Tue, 28 Jan 2020 20:49:28 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id a22sm487320qtd.48.2020.01.28.20.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2020 20:49:28 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     corbet@lwn.net, mchehab+samsung@kernel.org
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-doc@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2 1/5] Documentation: nfs: convert pnfs.txt to ReST
Date:   Wed, 29 Jan 2020 01:49:13 -0300
Message-Id: <20200129044917.566906-2-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129044917.566906-1-dwlsalmeida@gmail.com>
References: <20200129044917.566906-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Convert pnfs.txt to ReST. Content remains mostly unchanged.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/filesystems/index.rst           |  1 +
 Documentation/filesystems/nfs/index.rst       |  9 +++++++
 .../filesystems/nfs/{pnfs.txt => pnfs.rst}    | 25 +++++++++++--------
 3 files changed, 25 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/filesystems/nfs/index.rst
 rename Documentation/filesystems/nfs/{pnfs.txt => pnfs.rst} (87%)

diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
index ad6315a48d14..801d773a44b9 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -48,3 +48,4 @@ Documentation for filesystem implementations.
 
    autofs
    virtiofs
+   nfs/index
diff --git a/Documentation/filesystems/nfs/index.rst b/Documentation/filesystems/nfs/index.rst
new file mode 100644
index 000000000000..d19ba592779a
--- /dev/null
+++ b/Documentation/filesystems/nfs/index.rst
@@ -0,0 +1,9 @@
+===============================
+NFS
+===============================
+
+
+.. toctree::
+   :maxdepth: 1
+
+   pnfs
diff --git a/Documentation/filesystems/nfs/pnfs.txt b/Documentation/filesystems/nfs/pnfs.rst
similarity index 87%
rename from Documentation/filesystems/nfs/pnfs.txt
rename to Documentation/filesystems/nfs/pnfs.rst
index 80dc0bdc302a..7c470ecdc3a9 100644
--- a/Documentation/filesystems/nfs/pnfs.txt
+++ b/Documentation/filesystems/nfs/pnfs.rst
@@ -1,15 +1,17 @@
-Reference counting in pnfs:
+==========================
+Reference counting in pnfs
 ==========================
 
 The are several inter-related caches.  We have layouts which can
 reference multiple devices, each of which can reference multiple data servers.
 Each data server can be referenced by multiple devices.  Each device
-can be referenced by multiple layouts.  To keep all of this straight,
+can be referenced by multiple layouts. To keep all of this straight,
 we need to reference count.
 
 
 struct pnfs_layout_hdr
-----------------------
+======================
+
 The on-the-wire command LAYOUTGET corresponds to struct
 pnfs_layout_segment, usually referred to by the variable name lseg.
 Each nfs_inode may hold a pointer to a cache of these layout
@@ -25,7 +27,8 @@ the reference count, as the layout is kept around by the lseg that
 keeps it in the list.
 
 deviceid_cache
---------------
+==============
+
 lsegs reference device ids, which are resolved per nfs_client and
 layout driver type.  The device ids are held in a RCU cache (struct
 nfs4_deviceid_cache).  The cache itself is referenced across each
@@ -38,24 +41,26 @@ justification, but seems reasonable given that we can have multiple
 deviceid's per filesystem, and multiple filesystems per nfs_client.
 
 The hash code is copied from the nfsd code base.  A discussion of
-hashing and variations of this algorithm can be found at:
-http://groups.google.com/group/comp.lang.c/browse_thread/thread/9522965e2b8d3809
+hashing and variations of this algorithm can be found `here.
+<http://groups.google.com/group/comp.lang.c/browse_thread/thread/9522965e2b8d3809>`_
 
 data server cache
------------------
+=================
+
 file driver devices refer to data servers, which are kept in a module
 level cache.  Its reference is held over the lifetime of the deviceid
 pointing to it.
 
 lseg
-----
+====
+
 lseg maintains an extra reference corresponding to the NFS_LSEG_VALID
 bit which holds it in the pnfs_layout_hdr's list.  When the final lseg
 is removed from the pnfs_layout_hdr's list, the NFS_LAYOUT_DESTROYED
 bit is set, preventing any new lsegs from being added.
 
 layout drivers
---------------
+==============
 
 PNFS utilizes what is called layout drivers. The STD defines 4 basic
 layout types: "files", "objects", "blocks", and "flexfiles". For each
@@ -68,6 +73,6 @@ Blocks-layout-driver code is in: fs/nfs/blocklayout/.. directory
 Flexfiles-layout-driver code is in: fs/nfs/flexfilelayout/.. directory
 
 blocks-layout setup
--------------------
+===================
 
 TODO: Document the setup needs of the blocks layout driver
-- 
2.25.0

