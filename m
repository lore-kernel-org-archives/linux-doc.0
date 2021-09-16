Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9922C4332F
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:00:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D651761209
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:00:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236069AbhIPJBh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Sep 2021 05:01:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:36424 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235493AbhIPJBX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 16 Sep 2021 05:01:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FC466135F;
        Thu, 16 Sep 2021 09:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631782803;
        bh=DBa6ZFMIA9te52fBlowrmL1vEcBXgwvULizWaYDAF9g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VHsJMvYIt7wrPQpkCkGD3zCvomuQM95586ojIpHvxdTe7pjga/2RumlYy+W7xadHb
         StJCqz0QoYLUqfIpmLdy0Wh4/pxQsBuThTtgkzC8+evVdrwh8PiwM06EB0EaysUoQA
         NwJCz1yvce03FXrXypP+2NSdtDO1Hy1wdCHXSgGGSmTEW68SBDt+MnHGtg9S321dvv
         wWcbs8lqYgzb4gNwi6S9PQo69MdodsUHdNU8tT80XocTWO4ARBr7vtXsY1bQ+saE5+
         M5uqcDplV5i77qTOnIAe6naL8Y2WkmXCjlhR7nE8TuJRMkfldlShbIQlI5YU4jW/DT
         yV8/CkURE/MMg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mQnFR-001qky-A3; Thu, 16 Sep 2021 11:00:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 22/30] ABI: sysfs-class-rc-nuvoton: use wildcards on What definitions
Date:   Thu, 16 Sep 2021 10:59:49 +0200
Message-Id: <8cfb786e625bfe8f1c73837cf76107af187c9d85.1631782432.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631782432.git.mchehab+huawei@kernel.org>
References: <cover.1631782432.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

An "N" upper letter is not a wildcard, nor can easily be identified
by script, specially since the USB sysfs define things like.
bNumInterfaces. Use, instead, <N>, in order to let script/get_abi.pl
to convert it into a Regex.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/testing/sysfs-class-rc-nuvoton | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-rc-nuvoton b/Documentation/ABI/testing/sysfs-class-rc-nuvoton
index d3abe45f8690..f7bad8ecd08f 100644
--- a/Documentation/ABI/testing/sysfs-class-rc-nuvoton
+++ b/Documentation/ABI/testing/sysfs-class-rc-nuvoton
@@ -1,4 +1,4 @@
-What:		/sys/class/rc/rcN/wakeup_data
+What:		/sys/class/rc/rc<N>/wakeup_data
 Date:		Mar 2016
 KernelVersion:	4.6
 Contact:	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
-- 
2.31.1

