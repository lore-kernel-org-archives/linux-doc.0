Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E2AC43457
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 12:14:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90E3A22370
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 12:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602591296;
	bh=F38L5HcK+PWN6kp1gWIMXrEICgbpC/K+TO5DkjZ2XS4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=q/0qwQ70J/V+Y2SWHN0IUgt+0Yc5GfKUmJBp3a00/bdDIkRe8UWaRpqRQHBBrfs2L
	 i1BMdk6UQqOf7vB+osfv7IlWtSyaRlnd8Oo1P8hK+SKHOR0ax0X5DcfN4GPLmTC/sJ
	 ensA7w0FCKwswoBcLqoaf1NB32y0OMoU6p0ohJIM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgJMMO4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 08:14:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:40990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726830AbgJMMOz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 08:14:55 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F005422247;
        Tue, 13 Oct 2020 12:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602591295;
        bh=F38L5HcK+PWN6kp1gWIMXrEICgbpC/K+TO5DkjZ2XS4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e+7IcnsOiCSH6skbsLpoiwjON2EKGZYBrKoJolNnDd1o1SsxZF34sSXL7t1PsmuS4
         ksJI7R9KCT0MDS2T4MeSyecZtgoa8QQJzf83+vZquCoXr9+tdyS5R51aU78gkbgLmN
         6pxIjP1ZdDyBJ86v0OVbWrP+odmedhHvPlqMMF7I=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSJCe-006Cnv-OS; Tue, 13 Oct 2020 14:14:52 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Micah Morton <mortonm@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/24] docs: SafeSetID: fix a warning
Date:   Tue, 13 Oct 2020 14:14:30 +0200
Message-Id: <af61abe125f590d56e3ecb701830b3b0fe7acc3b.1602590106.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602590106.git.mchehab+huawei@kernel.org>
References: <cover.1602590106.git.mchehab+huawei@kernel.org>
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

