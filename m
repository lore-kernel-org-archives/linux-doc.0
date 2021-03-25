Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5539CC433DB
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 10:39:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03E2A61A25
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 10:39:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhCYKis (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Mar 2021 06:38:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:53512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230156AbhCYKic (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 25 Mar 2021 06:38:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC83D619B8;
        Thu, 25 Mar 2021 10:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616668712;
        bh=IzAoCaIDnqs4WkY2d9+gWl+UVm60iWEc+pu/WlaQ3+E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NVWC8AVoQh7TUIZr6CoqE+VFRJDVr5aQTA38h5LJ/bApNKmz5Wz8+Qjq3uwG4CPn+
         nuarxA71PFSZRzALB214FBl62qjTtgUA23Gm/rleWRc3Wjc3PdxOO9cGfyqorvkbrC
         4Rz2Im+fy+SxetxvPh/m7jQJYmJp/I2MBxCIDnFffeBvHqFzDihTwN5iW8co0uZkKd
         UmMmzBIHdby5V0wUY6QVCU4oPCjYkPZvquOp4zPEIWD9Ki5U5ANPdFZPe+zLHTLdj1
         YAoYCtDCDzE+ex5/n7SkBNTcONViR7FaEc94ihuNRefEE899vBo+fE+1UvlK0Pk2V/
         rTtykqBbOP+IQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lPNNl-001AvY-91; Thu, 25 Mar 2021 11:38:29 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] scripts: get_abi.pl: extend xref match to other types
Date:   Thu, 25 Mar 2021 11:38:25 +0100
Message-Id: <a1c7e2b2c37ed6e111dfc8641deb37ed96375a63.1616668017.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616668017.git.mchehab+huawei@kernel.org>
References: <cover.1616668017.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently, there are "What:" symbols for more than just
/sys.

Extend the regex to also cover configfs, /proc /dev and /kvd
symbols.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/get_abi.pl b/scripts/get_abi.pl
index e87028257d1c..eb1a23103afa 100755
--- a/scripts/get_abi.pl
+++ b/scripts/get_abi.pl
@@ -285,7 +285,7 @@ sub create_labels {
 # Boundaries are punct characters, spaces and end-of-line
 my $start = qr {(^|\s|\() }x;
 my $bondary = qr { ([,.:;\)\s]|\z) }x;
-my $xref_match = qr { $start(\/sys\/[^,.:;\)\s]+)$bondary }x;
+my $xref_match = qr { $start(\/(sys|config|proc|dev|kvd)\/[^,.:;\)\s]+)$bondary }x;
 my $symbols = qr { ([\x01-\x08\x0e-\x1f\x21-\x2f\x3a-\x40\x7b-\xff]) }x;
 
 sub output_rest {
-- 
2.30.2

