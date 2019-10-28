Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 004DC7D910
	for <lwn-linux-doc@archive.lwn.net>; Mon, 28 Oct 2019 13:05:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730040AbfJ1NFT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 28 Oct 2019 09:05:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23286 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726816AbfJ1NFT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Oct 2019 09:05:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1572267918;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=UoJnlVL6iUFYAedpqgcBRuvzbcqQJ5OMnOvE+mu68sc=;
        b=bpOuMUELjQWZ+rTlmzsEeoHQMnRiZ8cWGZfqYAjDlZ9AQPDOzG8EhOtEteK6RTT8Z4KuKJ
        /L9mtl1ejuTqXV++0ClrKZu0PBmnHld2lo+/cJ2kkMmyA7s1Hd9KdX4478YXGfxCscMTuU
        JyrMm9/9R/u8FRHPRJODKlg2Hx2ENXU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-NQrmsAeePoqjlgjrrF4I4A-1; Mon, 28 Oct 2019 09:05:16 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE1E2867455
        for <linux-doc@vger.kernel.org>; Mon, 28 Oct 2019 13:05:15 +0000 (UTC)
Received: from slave.localdomain.com (unknown [10.64.193.217])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 116DB21449AB;
        Mon, 28 Oct 2019 13:05:14 +0000 (UTC)
From:   Masatake YAMATO <yamato@redhat.com>
To:     linux-doc@vger.kernel.org
Cc:     yamato@redhat.com
Subject: [PATCH 1/2] docs: sysctl: update description for inode-state
Date:   Mon, 28 Oct 2019 22:05:01 +0900
Message-Id: <20191028130502.26262-1-yamato@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MC-Unique: NQrmsAeePoqjlgjrrF4I4A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The third field of inode-state is dummy (=3D=3D 0).
Update the description about the actual fields and
dummies.

Signed-off-by: Masatake YAMATO <yamato@redhat.com>
---
 Documentation/admin-guide/sysctl/fs.rst | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/fs.rst b/Documentation/admin-=
guide/sysctl/fs.rst
index 2a45119e3331..596f84a1748d 100644
--- a/Documentation/admin-guide/sysctl/fs.rst
+++ b/Documentation/admin-guide/sysctl/fs.rst
@@ -151,18 +151,15 @@ out of inodes, you need to increase this value.
 The file inode-nr contains the first two items from
 inode-state, so we'll skip to that file...
=20
-Inode-state contains three actual numbers and four dummies.
-The actual numbers are, in order of appearance, nr_inodes,
-nr_free_inodes and preshrink.
+Inode-state contains two actual numbers and five dummies.
+The actual numbers are, in order of appearance, nr_inodes
+and nr_free_inodes.
=20
 Nr_inodes stands for the number of inodes the system has
 allocated, this can be slightly more than inode-max because
 Linux allocates them one pageful at a time.
=20
-Nr_free_inodes represents the number of free inodes (?) and
-preshrink is nonzero when the nr_inodes > inode-max and the
-system needs to prune the inode list instead of allocating
-more.
+Nr_free_inodes represents the number of free inodes.
=20
=20
 overflowgid & overflowuid
--=20
2.17.2

