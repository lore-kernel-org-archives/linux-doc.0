Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 63FD37D918
	for <lwn-linux-doc@archive.lwn.net>; Mon, 28 Oct 2019 13:05:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730163AbfJ1NFV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 28 Oct 2019 09:05:21 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:46766 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726816AbfJ1NFU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Oct 2019 09:05:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1572267920;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R0Q7AIh4fXeUIo8N1ZgebBUMzEXLld5IiUHisAWSmb0=;
        b=QYzW9F0MmLKo95sNbErdzjSjYJi55DenhuTuGrQOStauFae9Vj3W/LVPPoYnawoGLQSA8f
        swdSV4+sqfyKzWCdzrxXYCwa9hkh+r5NTrFY92vngghWPohjRT4Gk2dLBlYB64qYquhIgk
        GvNAc1ffqW5LmlVD8EjVKMRWBr49d54=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-U7w4YiiiO-WRm13a9j7BBQ-1; Mon, 28 Oct 2019 09:05:18 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F14E7185A79B
        for <linux-doc@vger.kernel.org>; Mon, 28 Oct 2019 13:05:17 +0000 (UTC)
Received: from slave.localdomain.com (unknown [10.64.193.217])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3669921449AB;
        Mon, 28 Oct 2019 13:05:17 +0000 (UTC)
From:   Masatake YAMATO <yamato@redhat.com>
To:     linux-doc@vger.kernel.org
Cc:     yamato@redhat.com
Subject: [PATCH 2/2] docs: sysctl: delete the description about inode-max
Date:   Mon, 28 Oct 2019 22:05:02 +0900
Message-Id: <20191028130502.26262-2-yamato@redhat.com>
In-Reply-To: <20191028130502.26262-1-yamato@redhat.com>
References: <20191028130502.26262-1-yamato@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MC-Unique: U7w4YiiiO-WRm13a9j7BBQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The code for inode-max was deleted long time ago
(< Linux-2.6.12-rc2).

Signed-off-by: Masatake YAMATO <yamato@redhat.com>
---
 Documentation/admin-guide/sysctl/fs.rst | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/fs.rst b/Documentation/admin-=
guide/sysctl/fs.rst
index 596f84a1748d..5a99e37b5000 100644
--- a/Documentation/admin-guide/sysctl/fs.rst
+++ b/Documentation/admin-guide/sysctl/fs.rst
@@ -33,7 +33,6 @@ Currently, these files are in /proc/sys/fs:
 - dquot-nr
 - file-max
 - file-nr
-- inode-max
 - inode-nr
 - inode-state
 - nr_open
@@ -136,18 +135,12 @@ enough for most machines. Actual limit depends on RLI=
MIT_NOFILE
 resource limit.
=20
=20
-inode-max, inode-nr & inode-state
+inode-nr & inode-state
 ---------------------------------
=20
 As with file handles, the kernel allocates the inode structures
 dynamically, but can't free them yet.
=20
-The value in inode-max denotes the maximum number of inode
-handlers. This value should be 3-4 times larger than the value
-in file-max, since stdin, stdout and network sockets also
-need an inode struct to handle them. When you regularly run
-out of inodes, you need to increase this value.
-
 The file inode-nr contains the first two items from
 inode-state, so we'll skip to that file...
=20
@@ -156,8 +149,7 @@ The actual numbers are, in order of appearance, nr_inod=
es
 and nr_free_inodes.
=20
 Nr_inodes stands for the number of inodes the system has
-allocated, this can be slightly more than inode-max because
-Linux allocates them one pageful at a time.
+allocated.
=20
 Nr_free_inodes represents the number of free inodes.
=20
--=20
2.17.2

