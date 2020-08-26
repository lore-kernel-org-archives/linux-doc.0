Return-Path: <SRS0=H0Zm=CE=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB44C433E1
	for <linux-doc@archiver.kernel.org>; Wed, 26 Aug 2020 10:47:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE935206EB
	for <linux-doc@archiver.kernel.org>; Wed, 26 Aug 2020 10:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598438870;
	bh=hlDPMvHxCpSsrfha9G6lVN3vMoyc02reshHmPW66AD0=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=z+SYBo9KaN7DBrX6vJGYFgcWw6MtBOcNO1ancpSvFqJSUZmdUsJK6vNDz+8YKTh6h
	 9NXElArk+kDUprP62Lu0s/BstOWtyvU1L7ShU4yDP7P75BcjuV0qXE5l3gxcGFesVZ
	 JfOUZoScff+E8L3LnqJsExAT12kxpgRg+w9NRhbA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728684AbgHZKrs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Aug 2020 06:47:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:36254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728679AbgHZKrq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 26 Aug 2020 06:47:46 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 55F67206EB;
        Wed, 26 Aug 2020 10:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598438866;
        bh=hlDPMvHxCpSsrfha9G6lVN3vMoyc02reshHmPW66AD0=;
        h=From:To:Cc:Subject:Date:From;
        b=NGzEFJ4IRH2xPydCUWlTSGd6SWEoiIqNptcj7Hjg+CosC1pQGo8SD9pSczRwqPmRv
         HLpDX4kX/p4Yg2hnIq7obNVDqSweIqKYxPAKy6PwlsVQBQEU2ZeQ4hQ0GbFqvIfzfu
         ydrIL0tEL4UMtR1IfrgDMqHlHyKZp8zhmiByw6f8=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kAsy0-002EZC-8X; Wed, 26 Aug 2020 12:47:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] scripts: device_attr_show.cocci: update location of sysfs doc
Date:   Wed, 26 Aug 2020 12:47:43 +0200
Message-Id: <20200826104743.532611-1-mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

sysfs.txt was converted and renamed to sysfs.rst.

Update device_attr_show.cocci script accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/coccinelle/api/device_attr_show.cocci | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/coccinelle/api/device_attr_show.cocci b/scripts/coccinelle/api/device_attr_show.cocci
index d8ec4bb8ac41..a28dc061653a 100644
--- a/scripts/coccinelle/api/device_attr_show.cocci
+++ b/scripts/coccinelle/api/device_attr_show.cocci
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 ///
-/// From Documentation/filesystems/sysfs.txt:
+/// From Documentation/filesystems/sysfs.rst:
 ///  show() must not use snprintf() when formatting the value to be
 ///  returned to user space. If you can guarantee that an overflow
 ///  will never happen you can use sprintf() otherwise you must use
-- 
2.26.2

