Return-Path: <SRS0=3O92=DN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC93C41604
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:07:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6DD5720782
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601993232;
	bh=F/igWQMYF60TqMCX77EDE30gK86DARBWqysFY8IO6a8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=AvMZDGD09c+24JoPs7RCjbR+j/yyWwjTVCqSj3XiFbW3aNe8RIUr8FtRP7RKDwBjn
	 cy9StGh/lgom75aUqNMSWw94C34SUk0uf75Fn/eAWZb1qshOP33N1UXDRZ4q3lxAdr
	 ExBEzYfOyybljNNG+68QMo6/dGrZMfgtFPU0g84Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgJFOHL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Oct 2020 10:07:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:33144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726386AbgJFODz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Oct 2020 10:03:55 -0400
Received: from mail.kernel.org (ip5f5ad5bd.dynamic.kabel-deutschland.de [95.90.213.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4075821974;
        Tue,  6 Oct 2020 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601993034;
        bh=F/igWQMYF60TqMCX77EDE30gK86DARBWqysFY8IO6a8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=keEzqcQknvLrceO3s2G2btbl/vPA2BY2g/E3SeZQDPBFkpnvwnNU+xc9JzFkEPMB/
         VhX7chkJRW51JPxZ/tmtX0bLeQ6joVdTv3AE1sE0AR47aoMerQSdh6DAZCxqcyt9Vh
         Cdf7diX0Sxy9XlPWa20KbgVH9QWUMKIIDZ7S9dS0=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kPnZI-0019Fp-CA; Tue, 06 Oct 2020 16:03:52 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 30/52] docs: scsi: target.rst: remove iSCSI transport class kernel-doc markup
Date:   Tue,  6 Oct 2020 16:03:27 +0200
Message-Id: <620534cacc8090a67c43a4998e7039e4030e8835.1601992016.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601992016.git.mchehab+huawei@kernel.org>
References: <cover.1601992016.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is already included at scsi.rst. So, remove the duplication,
in order to avoid Sphinx warnings.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/target.rst | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/driver-api/target.rst b/Documentation/driver-api/target.rst
index 620ec6173a93..c70ca25171c0 100644
--- a/Documentation/driver-api/target.rst
+++ b/Documentation/driver-api/target.rst
@@ -41,18 +41,6 @@ iSCSI boot information
 .. kernel-doc:: drivers/scsi/iscsi_boot_sysfs.c
    :export:
 
-
-iSCSI transport class
-=====================
-
-The file drivers/scsi/scsi_transport_iscsi.c defines transport
-attributes for the iSCSI class, which sends SCSI packets over TCP/IP
-connections.
-
-.. kernel-doc:: drivers/scsi/scsi_transport_iscsi.c
-   :export:
-
-
 iSCSI TCP interfaces
 ====================
 
-- 
2.26.2

