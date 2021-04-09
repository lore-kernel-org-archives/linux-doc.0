Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C4BC43619
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 12:48:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BEADC6115C
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 12:48:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233898AbhDIMsV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Apr 2021 08:48:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:41874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233798AbhDIMsQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 9 Apr 2021 08:48:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6854061181;
        Fri,  9 Apr 2021 12:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617972481;
        bh=5W48diRQfjKI0foEpRt8wZBVTd4UNElSu7U71oXyuGg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=feNT5yuEfE7RD2acIneAvNKCu8XvzGN4Pmtz0J9Tm0JUzNljdRl7/QdQ+cP4Z2vGp
         ydvkR97cNnVxp5NN+DVD21bDb8CZ8XfW1V7H/3EkP7guSzgWfN53g/naxO6ZhyTXdK
         80KY8zH/hB9gXvLMvtya2GhMzw+psguzG4mm6kCzVp0S1YpfNnPF3iSqvb0l0nwU5D
         4fz1ZdMD8+NA6RHa59Mh+bj3Erm+k+GdGQTRIw1Ls3ghYsbCc70bRqSA/KdwKLesnz
         Tc7wdAmIVcALsavFLREYCg4Wa1LG5UXNAoWkS9JZDPef9ajy43PdDvv5PlW8aOnczK
         gwrO2NgcSeXxQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lUqYE-001SLm-8q; Fri, 09 Apr 2021 14:47:54 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/8] docs: update sysfs-platform_profile.rst reference
Date:   Fri,  9 Apr 2021 14:47:48 +0200
Message-Id: <b3df6893ff6b1eea433da89b3fc7c92d0cd9a932.1617972339.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1617972339.git.mchehab+huawei@kernel.org>
References: <cover.1617972339.git.mchehab+huawei@kernel.org>
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
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Mark Pearson <markpearson@lenovo.com>
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

