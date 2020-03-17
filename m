Return-Path: <SRS0=98ua=5C=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1597C10F29
	for <linux-doc@archiver.kernel.org>; Tue, 17 Mar 2020 14:55:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D94120735
	for <linux-doc@archiver.kernel.org>; Tue, 17 Mar 2020 14:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584456902;
	bh=pYqp3V8om86FL58tAYcy6HsVElUzQYABiLF0qnOWlC4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=pNKiraja4YpJrhvj25wsBQpgxUon2Wp+X16z/H/5UDF11bBrMNR8vUVgvTjQdKCgN
	 9CglWW5jBHhilSQ/Xj66+0YF2WEfcHZbzgtsul5ebNM7k5+X85+sykXDHHcalnkpzD
	 4gO4GnyHF1JWNajPmPq0kKk05NJK03e81hovZX0A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbgCQOyz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Mar 2020 10:54:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:43674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726962AbgCQOyc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 17 Mar 2020 10:54:32 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D129F20776;
        Tue, 17 Mar 2020 14:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584456871;
        bh=pYqp3V8om86FL58tAYcy6HsVElUzQYABiLF0qnOWlC4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=07qH0UhQsX0hroFfzEaKuj11efC4g1D2sIfqA+D3VgoiszOAc9F2VaRSSGeV49sBT
         /bQxjNI2Mkyd2jbJuP3cEGCH95uVXUVL2fa+rltoMwaWUzQgzkg03Pq5IaSDViWj5U
         A0ks+hEZqxq1IH6zJQZkP2+/8Jlcac5rKtxrchlQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jEDbw-000ANN-VB; Tue, 17 Mar 2020 15:54:28 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        linux-fsdevel@vger.kernel.org
Subject: [PATCH 16/17] fs: inode.c: get rid of docs warnings
Date:   Tue, 17 Mar 2020 15:54:25 +0100
Message-Id: <11e32eed47d0c6604ae0d9d3f56d6ee0a2af786a.1584456635.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1584456635.git.mchehab+huawei@kernel.org>
References: <cover.1584456635.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Use *foo makes the toolchain to think that this is an emphasis, causing
those warnings:

	./fs/inode.c:1609: WARNING: Inline emphasis start-string without end-string.
	./fs/inode.c:1609: WARNING: Inline emphasis start-string without end-string.
	./fs/inode.c:1615: WARNING: Inline emphasis start-string without end-string.

So, use, instead, ``*foo``, in order to mark it as a literal block.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 fs/inode.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index 93d9252a00ab..37226a9cfa4f 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1606,14 +1606,14 @@ EXPORT_SYMBOL(iput);
  *	@inode:  inode owning the block number being requested
  *	@block: pointer containing the block to find
  *
- *	Replaces the value in *block with the block number on the device holding
+ *	Replaces the value in ``*block`` with the block number on the device holding
  *	corresponding to the requested block number in the file.
  *	That is, asked for block 4 of inode 1 the function will replace the
- *	4 in *block, with disk block relative to the disk start that holds that
+ *	4 in ``*block``, with disk block relative to the disk start that holds that
  *	block of the file.
  *
  *	Returns -EINVAL in case of error, 0 otherwise. If mapping falls into a
- *	hole, returns 0 and *block is also set to 0.
+ *	hole, returns 0 and ``*block`` is also set to 0.
  */
 int bmap(struct inode *inode, sector_t *block)
 {
-- 
2.24.1

