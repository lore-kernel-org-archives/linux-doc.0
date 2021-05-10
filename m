Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6487C43600
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 10:29:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8442E6162D
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 10:29:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231869AbhEJKaq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 May 2021 06:30:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:59904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231775AbhEJK3P (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 10 May 2021 06:29:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA569616E8;
        Mon, 10 May 2021 10:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620642443;
        bh=UWZMYtSKMFbs1V0JHIjejTjoLvcKPa1PWnVKyqdcyYA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LR6Yin2nsSJCwR9TcOh/EX0QEeAVnxTsIItbqG21yA95rZK8sd2H2UDrBx6JgxFWn
         8pJYSFxxRaeq+A3CKchXjgZJBWNjvD0CaUkAv6dq8W8BLfCdOgWzNRjzVAtWxUhmbD
         iZrkCmrFNqaMKmaKxTt5Wph4vQI9sDYDTNLDoEoviH4LkItme3vtxUNBrx5cThnu45
         laHDhtZ5O8AfE9ZPTAxeVdY8DzSfmET5/FS+HR6NTpygGG54x1iu6rMoZSVzXWOVIW
         +AIeUgmCUmicX5JiesRXVEkeA/R+2WjJfukE9SpCeOucFXXaR3xv2dLkjgG43V9IGm
         lFYHnQxmxusZQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lg38D-000UPU-6S; Mon, 10 May 2021 12:27:21 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH 18/53] docs: driver-api: nvdimm: btt.rst: avoid using UTF-8 chars
Date:   Mon, 10 May 2021 12:26:30 +0200
Message-Id: <8c5217f88323efea00a043009420f59484bde1f6.1620641727.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620641727.git.mchehab+huawei@kernel.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

While UTF-8 characters can be used at the Linux documentation,
the best is to use them only when ASCII doesn't offer a good replacement.
So, replace the occurences of the following UTF-8 characters:

	- U+2013 ('–'): EN DASH

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/nvdimm/btt.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/nvdimm/btt.rst b/Documentation/driver-api/nvdimm/btt.rst
index 107395c042ae..dd91a495e02e 100644
--- a/Documentation/driver-api/nvdimm/btt.rst
+++ b/Documentation/driver-api/nvdimm/btt.rst
@@ -91,7 +91,7 @@ Bit      Description
 	   0  0	  Initial state. Reads return zeroes; Premap = Postmap
 	   0  1	  Zero state: Reads return zeroes
 	   1  0	  Error state: Reads fail; Writes clear 'E' bit
-	   1  1	  Normal Block – has valid postmap
+	   1  1	  Normal Block - has valid postmap
 	   == ==  ====================================================
 
 29 - 0	 Mappings to internal 'postmap' blocks
-- 
2.30.2

