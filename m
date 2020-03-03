Return-Path: <SRS0=Succ=4U=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C829C3F2D7
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 15:50:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 596E22146E
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 15:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583250646;
	bh=/mTbJ9Pkh8E+/Cr7Wl/+yLQlst53njV0iwYs7+NIFi0=;
	h=From:Cc:Subject:Date:In-Reply-To:References:To:List-ID:From;
	b=Si1WtbZ8iaQeUcwt2jS2bTe2v1A/pcNfUbZUwYRq36CO1AIYRXQzdRMiuyFOuNVFA
	 5Fii4eXDWco0Wco89xPZEg08PM9SSv2EZ8jLn4MvDlICAQGju/QFg5Fh9yZJDIOEAd
	 IDIEwCKswrLG5wT8Qhu3GqKUbVIR23JRlIXTjLSE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730241AbgCCPup (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Mar 2020 10:50:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:59894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729172AbgCCPup (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 3 Mar 2020 10:50:45 -0500
Received: from mail.kernel.org (tmo-101-56.customers.d1-online.com [80.187.101.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D7E1A2086A;
        Tue,  3 Mar 2020 15:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583250645;
        bh=/mTbJ9Pkh8E+/Cr7Wl/+yLQlst53njV0iwYs7+NIFi0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O9ow7TSDXfqNFNlvhMfhEPU0BpNaqnbIoRnw3/oa2ulcZGBf9jBLCfHjpdQWkF2a2
         MwREZb7jbUb0thdo/3jMWbRcVYNBdETWpyIqt1uohDVCm1EdeyU8jdjdrksMbZiMZc
         KSHsMKF0E1COGz7rTqXPGpGTa2UrMxcFiD22muxI=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1j99og-001ZP6-JH; Tue, 03 Mar 2020 16:50:42 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Jonathan Corbet <corbet@lwn.net>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH 7/9] docs: filesystems: fuse.rst: supress a Sphinx warning
Date:   Tue,  3 Mar 2020 16:50:37 +0100
Message-Id: <cad541ec7d8d220d57bd5d097d60c62da64054ac.1583250595.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org>
References: <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Get rid of this warning:

    Documentation/filesystems/fuse.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent.

Fixes: 8ab13bca428b ("Documentation: filesystems: convert fuse to RST")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/filesystems/fuse.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/fuse.rst b/Documentation/filesystems/fuse.rst
index 8e455065ce9e..cd717f9bf940 100644
--- a/Documentation/filesystems/fuse.rst
+++ b/Documentation/filesystems/fuse.rst
@@ -1,7 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0
-==============
+
+====
 FUSE
-==============
+====
 
 Definitions
 ===========
-- 
2.24.1

