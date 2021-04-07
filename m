Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99A4C41602
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 08:21:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92B89613EB
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 08:21:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347103AbhDGIVY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 04:21:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:48642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240606AbhDGIVQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Apr 2021 04:21:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4066613E6;
        Wed,  7 Apr 2021 08:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617783662;
        bh=HeEviqMcd07vaiDkDgrG8UUhzX6Vzf19XKOP3eUlLxk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Rxda+d+o+eIMKchl4XLVWx7Xdr9NztrWh6DiSPHvv0MrGIapcy9qfmRIMmKAvS1Pk
         XeitKIQmj2zq6qRgxxs19QDx6oT6HwO/GCyys1ekn+f6z8pU9QpkY0LAUeTS5xiii1
         srOct+EgvETo4GqFgAnZMf1yoj4g6fajFFzJzAAT2t8/AXlGGCJnJdK1CCSTYBcITm
         Cx7jTa7q12JvHXGnbpLOmULTtelV080BO4LVm5Hwcfu6nqclH6ETTcDDh0gSz6zjOv
         BVX7OxwMEX5hW5H8v2GS53VKKH8DQJYjnQQbv4A0F2vGTjgp/TBLylvaTOdrZXKcFi
         wo+SXOe4fBJPg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lU3Qq-005i2c-Oz; Wed, 07 Apr 2021 10:21:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/19] docs: update sysfs-platform_profile.rst reference
Date:   Wed,  7 Apr 2021 10:20:53 +0200
Message-Id: <86cc77105200a03e06bd28d3ba376217e5243324.1617783062.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1617783062.git.mchehab+huawei@kernel.org>
References: <cover.1617783062.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The file name: Documentation/ABI/testing/sysfs-platform_profile.rst
should be, instead: Documentation/userspace-api/sysfs-platform_profile.rst.

Update its cross-reference accordingly.

Fixes: a2ff95e018f1 ("ACPI: platform: Add platform profile support")
Fixes: 8e0cbf356377 ("Documentation: Add documentation for new platform_profile sysfs attribute")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/linux/platform_profile.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/platform_profile.h b/include/linux/platform_profile.h
index a6329003aee7..e5cbb6841f3a 100644
--- a/include/linux/platform_profile.h
+++ b/include/linux/platform_profile.h
@@ -2,7 +2,7 @@
 /*
  * Platform profile sysfs interface
  *
- * See Documentation/ABI/testing/sysfs-platform_profile.rst for more
+ * See Documentation/userspace-api/sysfs-platform_profile.rst for more
  * information.
  */
 
-- 
2.30.2

