Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72B3C43331
	for <linux-doc@archiver.kernel.org>; Tue, 16 Mar 2021 05:48:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0BD26506B
	for <linux-doc@archiver.kernel.org>; Tue, 16 Mar 2021 05:48:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235632AbhCPFs3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Mar 2021 01:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235544AbhCPFr6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Mar 2021 01:47:58 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C65C1C06174A;
        Mon, 15 Mar 2021 22:47:57 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id x29so21877196pgk.6;
        Mon, 15 Mar 2021 22:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f2VeuRc63BqPilJd7SRqgCMHjfYg7SClrLOZZGF3Ot0=;
        b=Dm+1ymPmEZG/jT3xTmcwbyNXfBECqHg95rf3TiDAOMP/qn/HdRxNwtLTIe+xMfS7Wp
         tQ41vpSkqxybg6YCzAf2sZ0/T0SRrizjBnge2dMFwr6CfzYLdZLsIUNK9ZmnV8K9EgZ0
         lbRykk7br8IXh6oTDbmMBHFurqmK8CPG/T9qEY7+zEcSE/HBy6ab2m1thFRs+Eigz1y6
         q6XkgmJsgvY9KFWfJsbo5qX1yhNJ0KLV0Z/NYOrGpYOCwTf4y82C1PhB6qVLyj7hPWMe
         oC8uZTYd9vZBybLoJWBB5WHu2HL2mWRAKpDsOs15aS+3u3oG+8kCBTw7KBdSydzEiBTN
         bR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f2VeuRc63BqPilJd7SRqgCMHjfYg7SClrLOZZGF3Ot0=;
        b=ESvc+rGfuZ0QdHIh75nz0m99/vXTAExpQ7D40MA/KAZOdMi9zMobfnaNZduIdKa0tx
         LTQZaGm3jIrSnmIG5GrnvSIbKzQr6UsmKCR3+8n1lgjTvdPL4VXoVekJTAPfHbLHhaGv
         Aakn2UX5MR4nF3JwnJLVkNoljfC5CmdbqAazN+PWzvtkO3O1+oDCmNm2V11mXdBbHxos
         V7/KoCdR9FUpENudxjupbpZkB0DDmImNnYCMzMLZRu0AMYd9egaF21jVj2trNyS1FaXZ
         0BR2mxVC36fEbjac600kROXSmn2S64hNPvmdV3sidy0sGm4LyLGEjvBsQALRxu1x9xxJ
         jUXQ==
X-Gm-Message-State: AOAM533MZSqqlmoqaPw4cq5GohYJpexlTzHzQmEp2NVJRq0eJckAhS/J
        aQCv8dXzN7yUdWvWvu+YCfs=
X-Google-Smtp-Source: ABdhPJxn13xjT0yI0FaMFIBS94YJEVjZcnWOJLVvOC1W/5bnay64Q5p0rJ7kugbB92uhuiihS7aTPg==
X-Received: by 2002:aa7:969d:0:b029:1f5:b02c:eed3 with SMTP id f29-20020aa7969d0000b02901f5b02ceed3mr13205992pfk.75.1615873677340;
        Mon, 15 Mar 2021 22:47:57 -0700 (PDT)
Received: from cl-arch-kdev.. (cl-arch-kdev.xen.prgmr.com. [2605:2700:0:2:a800:ff:fed6:fc0d])
        by smtp.gmail.com with ESMTPSA id l22sm15096513pfd.145.2021.03.15.22.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 22:47:56 -0700 (PDT)
From:   Fox Chen <foxhlchen@gmail.com>
To:     neilb@suse.de
Cc:     Fox Chen <foxhlchen@gmail.com>, corbet@lwn.net,
        vegard.nossum@oracle.com, viro@zeniv.linux.org.uk,
        rdunlap@infradead.org, grandmaster@al2klimov.de,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v2 08/12] docs: path-lookup: update i_op->put_link and cookie description
Date:   Tue, 16 Mar 2021 13:47:23 +0800
Message-Id: <20210316054727.25655-9-foxhlchen@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210316054727.25655-1-foxhlchen@gmail.com>
References: <20210316054727.25655-1-foxhlchen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

No inode->put_link operation anymore. We use delayed_call to
deal with link destruction. Cookie has been replaced with
struct delayed_call.

Related commit: commit fceef393a538 ("switch ->get_link() to
delayed_call, kill ->put_link()")

Signed-off-by: Fox Chen <foxhlchen@gmail.com>
---
 Documentation/filesystems/path-lookup.rst | 30 ++++++-----------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/Documentation/filesystems/path-lookup.rst b/Documentation/filesystems/path-lookup.rst
index e6b6c43ff0f6..8ab95dd9046e 100644
--- a/Documentation/filesystems/path-lookup.rst
+++ b/Documentation/filesystems/path-lookup.rst
@@ -1066,34 +1066,20 @@ method. This is called both in RCU-walk and REF-walk. In RCU-walk the
 RCU-walk.  Much like the ``i_op->permission()`` method we
 looked at previously, ``->get_link()`` would need to be careful that
 all the data structures it references are safe to be accessed while
-holding no counted reference, only the RCU lock.  Though getting a
-reference with ``->follow_link()`` is not yet done in RCU-walk mode, the
-code is ready to release the reference when that does happen.
-
-This need to drop the reference to a symlink adds significant
-complexity.  It requires a reference to the inode so that the
-``i_op->put_link()`` inode operation can be called.  In REF-walk, that
-reference is kept implicitly through a reference to the dentry, so
-keeping the ``struct path`` of the symlink is easiest.  For RCU-walk,
-the pointer to the inode is kept separately.  To allow switching from
-RCU-walk back to REF-walk in the middle of processing nested symlinks
-we also need the seq number for the dentry so we can confirm that
-switching back was safe.
-
-Finally, when providing a reference to a symlink, the filesystem also
-provides an opaque "cookie" that must be passed to ``->put_link()`` so that it
-knows what to free.  This might be the allocated memory area, or a
-pointer to the ``struct page`` in the page cache, or something else
-completely.  Only the filesystem knows what it is.
+holding no counted reference, only the RCU lock. A callback
+``struct delayed_called`` will be passed to get_link,
+file systems can set their own put_link function and argument through
+``set_delayed_call``. Later on, when vfs wants to put link, it will call
+``do_delayed_call`` to invoke that callback function with the argument.
 
 In order for the reference to each symlink to be dropped when the walk completes,
 whether in RCU-walk or REF-walk, the symlink stack needs to contain,
 along with the path remnants:
 
-- the ``struct path`` to provide a reference to the inode in REF-walk
-- the ``struct inode *`` to provide a reference to the inode in RCU-walk
+- the ``struct path`` to provide a reference to the previous path
+- the ``const char *`` to provide a reference to the to previous name
 - the ``seq`` to allow the path to be safely switched from RCU-walk to REF-walk
-- the ``cookie`` that tells ``->put_path()`` what to put.
+- the ``struct delayed_call`` for later invocation.
 
 This means that each entry in the symlink stack needs to hold five
 pointers and an integer instead of just one pointer (the path
-- 
2.30.2

