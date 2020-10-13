Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A96C433E7
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 12:15:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC81422247
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 12:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602591333;
	bh=rdpIjUCn8I2jWacOW9CCQKWVEkvFnGocny38ubnytOA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=BUoyLiMnihDqUF2kKA77B8wTZV1JZYjs0s9UPbWivNmjYbeQAuPV8Rm+/zi3LjMH+
	 IsnDaaWIfLw6VKYgWMSvcj1NH3aZb54HWfah88MlTh3MaCwIVcGTOLgo9Pux9mi5qL
	 Zg4WpaXJWH0EgaqxtbEtoo6rJz8DEtY1qSkAdVEs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbgJMMO6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 08:14:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:41272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726981AbgJMMO5 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 08:14:57 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2538222269;
        Tue, 13 Oct 2020 12:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602591295;
        bh=rdpIjUCn8I2jWacOW9CCQKWVEkvFnGocny38ubnytOA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PwjrD2tdqXVBrsMVG/CCCyp9wGbqEWHHqnpO2vU2tM7oCPO0RnjXgHuNjS46ytfBV
         YbpLDi+SSFl0gveei1tnhVTXN7cJOVOjAvoBwJ5HPwZEJbaSyOxsEcAGPPeJ2Nz0v1
         TKCB4c6G7LPGZsnLvZgsLhM2j73+L8ftouhr9+B8=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSJCf-006CoU-5d; Tue, 13 Oct 2020 14:14:53 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Eric Auger <eric.auger@redhat.com>,
        Jacob Pan <jacob.pan.linux@gmail.com>,
        Joerg Roedel <jroedel@suse.de>, Liu Yi L <yi.l.liu@intel.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 18/24] docs: userspace-api: add iommu.rst to the index file
Date:   Tue, 13 Oct 2020 14:14:45 +0200
Message-Id: <77dfc61e06fd00b3798623d80fa89fe558e06638.1602590106.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602590106.git.mchehab+huawei@kernel.org>
References: <cover.1602590106.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There's a new uAPI doc for IOMMU. Add it to the index file.
Should address this warning:

	.../Documentation/userspace-api/iommu.rst: WARNING: document isn't included in any toctree

Fixes: d0023e3ee28d ("docs: IOMMU user API")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/userspace-api/index.rst b/Documentation/userspace-api/index.rst
index 69fc5167e648..acd2cc2a538d 100644
--- a/Documentation/userspace-api/index.rst
+++ b/Documentation/userspace-api/index.rst
@@ -22,6 +22,7 @@ place where this information is gathered.
    spec_ctrl
    accelerators/ocxl
    ioctl/index
+   iommu
    media/index
 
 .. only::  subproject and html
-- 
2.26.2

