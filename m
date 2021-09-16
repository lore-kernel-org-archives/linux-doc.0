Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159F0C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:00:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2F546120D
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:00:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235804AbhIPJB3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Sep 2021 05:01:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:36284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235549AbhIPJBY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 16 Sep 2021 05:01:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 236696121F;
        Thu, 16 Sep 2021 09:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631782804;
        bh=5XeDG3kV6RmqRaQjGcuq1o3m7hwiaBG5N6FHY8Endq4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bXs1bbxZGLSVOiEehuC2OlwWf9/hzPejbBnoHBkjuqKZ0ApYC0NKs+sMzT5aVclnl
         2XRzOs2d9bgy5hOCDbMvVo0V+Fo43PhnXXDD/c1dCgY4b60S06PNUFPoBV1qHlCeaa
         2Bx8tGyMAkO568SS5rdE/7l0zRrobNzxuMOnN3zWB0uTW4Di2Z55YE8DBwhNSt9e0F
         EbXNgD4IoTH+OGpRryocLyDaYTO3WR4eqt6obl6D4nN2DW2i9JOg1AKa3kXrPQ6rwL
         k5jA73UUavriNMjMtJuSop0KDbjt2XnWnDmDcojNgWwg86NxroAnQP4DM5NLaV6zcg
         4xxQufCGm1zHA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mQnFR-001qlX-MO; Thu, 16 Sep 2021 11:00:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Oded Gabbay <oded.gabbay@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 30/30] ABI: sysfs-class-rapidio: use wildcards on What definitions
Date:   Thu, 16 Sep 2021 10:59:57 +0200
Message-Id: <aa073b85ab04b5b201d40f747ccdb6806f38eb66.1631782432.git.mchehab+huawei@kernel.org>
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
 Documentation/ABI/testing/sysfs-class-rapidio | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-rapidio b/Documentation/ABI/testing/sysfs-class-rapidio
index 19aefb21b639..81e09145525a 100644
--- a/Documentation/ABI/testing/sysfs-class-rapidio
+++ b/Documentation/ABI/testing/sysfs-class-rapidio
@@ -10,7 +10,7 @@ Description:
 		NOTE: An mport ID is not a RapidIO destination ID assigned to a
 		given local mport device.
 
-What:		/sys/class/rapidio_port/rapidioN/sys_size
+What:		/sys/class/rapidio_port/rapidio<N>/sys_size
 Date:		Apr, 2014
 KernelVersion:	v3.15
 Contact:	Matt Porter <mporter@kernel.crashing.org>,
@@ -22,7 +22,7 @@ Description:
 
 		1 = large (16-bit destination ID, max. 65536 devices).
 
-What:		/sys/class/rapidio_port/rapidioN/port_destid
+What:		/sys/class/rapidio_port/rapidio<N>/port_destid
 Date:		Apr, 2014
 KernelVersion:	v3.15
 Contact:	Matt Porter <mporter@kernel.crashing.org>,
-- 
2.31.1

