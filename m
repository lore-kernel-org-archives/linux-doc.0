Return-Path: <SRS0=C3TA=EC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA1B3C55179
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 10:01:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5ED692225C
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 10:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603792908;
	bh=8mKeoT70W2C80dpgS/0uhSrxkN5L//sEcSOYWAnufuI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Ok4EiDNfK/jxh4F2J8Rf8RBK3nncsv3OS47mfnH69M5E3zEHry0prX1yo/LCvsuSL
	 UP1aUeQiBRJsmRXxBmubO0WzcC3FKD6h25XqfhnraWoX4vZdYXLMTWi087jvlPM+18
	 oS61yHLp2udYcvgK79EuU1LEIQLxGb54gq1qatdg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896832AbgJ0KBr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Oct 2020 06:01:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:42704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896047AbgJ0Jvn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 27 Oct 2020 05:51:43 -0400
Received: from mail.kernel.org (ip5f5ad5af.dynamic.kabel-deutschland.de [95.90.213.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A473024181;
        Tue, 27 Oct 2020 09:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603792301;
        bh=8mKeoT70W2C80dpgS/0uhSrxkN5L//sEcSOYWAnufuI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Dcj+iBLDefcsZCffQDyU6g6cxqytgEQrWkycRYBjFTWCqdB/FMkkbU3mMweCLPsQF
         N9u+dtnGjkheIafRCLhlzG67s122eo1WpCO57iTWYttcVLnkcrQWId/HxXTZ2yw/XA
         aLH1B0GN7fSFOALlAhNLsPzap3r36Ebaz9E8FJow=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kXLdj-003FFO-Lg; Tue, 27 Oct 2020 10:51:39 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        David Sterba <dsterba@suse.com>,
        Goldwyn Rodrigues <rgoldwyn@suse.com>,
        Johannes Thumshirn <jthumshirn@suse.de>,
        Josef Bacik <josef@toxicpanda.com>,
        Nikolay Borisov <nborisov@suse.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 21/32] docs: fs: api-summary.rst: get rid of kernel-doc include
Date:   Tue, 27 Oct 2020 10:51:25 +0100
Message-Id: <d0a9fffedca102633c168adaf157f34288a4ea67.1603791716.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603791716.git.mchehab+huawei@kernel.org>
References: <cover.1603791716.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The direct-io.c file used to have just two exported symbols:

	- dio_end_io()
	- __blockdev_direct_IO()

The first one was removed by changeset
c33fe275b530 ("fs: remove no longer used dio_end_io()")

And the last one is used on most places indirectly, via
the inline macro blockdev_direct_IO() provided by fs.h.
Yet, neither the macro or the function have kernel-doc
markups.

So, drop the inclusion of fs/direct-io.c at the docs.

Fixes: c33fe275b530 ("fs: remove no longer used dio_end_io()")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/filesystems/api-summary.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/filesystems/api-summary.rst b/Documentation/filesystems/api-summary.rst
index bbb0c1c0e5cf..a94f17d9b836 100644
--- a/Documentation/filesystems/api-summary.rst
+++ b/Documentation/filesystems/api-summary.rst
@@ -86,9 +86,6 @@ Other Functions
 .. kernel-doc:: fs/dax.c
    :export:
 
-.. kernel-doc:: fs/direct-io.c
-   :export:
-
 .. kernel-doc:: fs/libfs.c
    :export:
 
-- 
2.26.2

