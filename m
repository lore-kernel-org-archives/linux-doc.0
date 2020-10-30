Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC8A7C63777
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 07:42:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 510C620665
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 07:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604043753;
	bh=iTx4N77ky+PTMeyrzxFh6FYB/xUDlKrlBEyFHdAnAVI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=1UIe50wtVizn7I/2L9bAhxxuu4QY3nFshx5oSPaK+kNlNy3oIKE14EKGWw8s9Wy72
	 cZ04eQzIwjwvWc/YupeG0h+dVgMC1cnX9udi71n/SE30ufKs4I6k9se7elldbloVyA
	 KratZYOkimXItKwmN/Mr24zNLWvlRxz15ibW3ZdQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbgJ3Hmc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Oct 2020 03:42:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:52120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726103AbgJ3HlF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 30 Oct 2020 03:41:05 -0400
Received: from mail.kernel.org (ip5f5ad5bb.dynamic.kabel-deutschland.de [95.90.213.187])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 27A6824178;
        Fri, 30 Oct 2020 07:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604043664;
        bh=iTx4N77ky+PTMeyrzxFh6FYB/xUDlKrlBEyFHdAnAVI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZxLPiIH178FP8E0iSyM7FQCerU1y3i/fYXCMX5GfhTDantkOODLXq0N3fM03+0m0p
         kLi6wZWXkyYSvc9v4s2v+vAfCMWNxldkEB5qVkglXMdpLJVW/Npw1uYgvj/ZZgIm7+
         xcZVzvkW7I1yD/4e/xOVPq0Ap5eUVWQmePBrBTLY=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kYP1y-004Ogz-2g; Fri, 30 Oct 2020 08:41:02 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Oded Gabbay <oded.gabbay@gmail.com>, Tom Rix <trix@redhat.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 39/39] scripts: get_abi.pl: assume ReST format by default
Date:   Fri, 30 Oct 2020 08:40:58 +0100
Message-Id: <4b0af257010570e0e917d82498e42992bec5e173.1604042072.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1604042072.git.mchehab+huawei@kernel.org>
References: <cover.1604042072.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

All ABI files are now compatible with ReST format. So, change
the script default to assume that the ABI source files
are compatible with ReST.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/get_abi.pl b/scripts/get_abi.pl
index d09bb37dd236..2cb592f8eba4 100755
--- a/scripts/get_abi.pl
+++ b/scripts/get_abi.pl
@@ -18,7 +18,7 @@ my $prefix="Documentation/ABI";
 #
 # If true, assumes that the description is formatted with ReST
 #
-my $description_is_rst = 0;
+my $description_is_rst = 1;
 
 GetOptions(
 	"debug|d+" => \$debug,
-- 
2.26.2

