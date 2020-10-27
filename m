Return-Path: <SRS0=C3TA=EC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F54C56201
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 09:52:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B399E22281
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 09:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603792338;
	bh=F38L5HcK+PWN6kp1gWIMXrEICgbpC/K+TO5DkjZ2XS4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=GjdfdnzvUVfREUjbV2ZBcrY9mnBGVRO2XIHoBOBkMd3L8ADEw+FvxW2LESNc4yeri
	 siqBJgEMgPJUKov6+ZQ8p09sXOUaxOGqqJLVnASCWO5YSUrZULEveX4XALfw7H4s/q
	 gAPf0yd+MY2O9vyhUH5V2rKNpOrAkoatmFl2Usbs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896198AbgJ0JwS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Oct 2020 05:52:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:42616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896072AbgJ0Jvo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 27 Oct 2020 05:51:44 -0400
Received: from mail.kernel.org (ip5f5ad5af.dynamic.kabel-deutschland.de [95.90.213.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 736DF2465D;
        Tue, 27 Oct 2020 09:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603792303;
        bh=F38L5HcK+PWN6kp1gWIMXrEICgbpC/K+TO5DkjZ2XS4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EX9l9vf3HbIZEEI37hdweaRJXcMeyEcYy2oHwoazWXhVWr0xazkdHoijeHKB/zp0M
         hTXt3zlPFmxW5rlzbXNLbjhhlKkJn6QknCrkq777KoMRXOuYm2oyVHKYH4Ikajjg/l
         rDcMXWiK6wmEAgRhzkgKGLLHcdUdOZqqmd2baKP0=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kXLdk-003FFt-19; Tue, 27 Oct 2020 10:51:40 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Micah Morton <mortonm@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 32/32] docs: SafeSetID: fix a warning
Date:   Tue, 27 Oct 2020 10:51:36 +0100
Message-Id: <4afa281c170daabd1ce522653d5d5d5078ebd92c.1603791716.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603791716.git.mchehab+huawei@kernel.org>
References: <cover.1603791716.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As reported by Sphinx 2.4.4:

	docs/Documentation/admin-guide/LSM/SafeSetID.rst:110: WARNING: Title underline too short.

	Note on GID policies and setgroups()
	==================

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/LSM/SafeSetID.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/LSM/SafeSetID.rst b/Documentation/admin-guide/LSM/SafeSetID.rst
index 17996c9070e2..0ec34863c674 100644
--- a/Documentation/admin-guide/LSM/SafeSetID.rst
+++ b/Documentation/admin-guide/LSM/SafeSetID.rst
@@ -107,7 +107,7 @@ for a UID/GID will prevent that UID/GID from obtaining auxiliary setid
 privileges, such as allowing a user to set up user namespace UID/GID mappings.
 
 Note on GID policies and setgroups()
-==================
+====================================
 In v5.9 we are adding support for limiting CAP_SETGID privileges as was done
 previously for CAP_SETUID. However, for compatibility with common sandboxing
 related code conventions in userspace, we currently allow arbitrary
-- 
2.26.2

