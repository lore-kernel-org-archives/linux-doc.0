Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 846A97DE78
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 03:02:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751903AbeEGDC0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 6 May 2018 23:02:26 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:7230 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751852AbeEGDCZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 6 May 2018 23:02:25 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 27B83E1FD5493;
        Mon,  7 May 2018 11:02:12 +0800 (CST)
Received: from [127.0.0.1] (10.63.195.168) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.361.1; Mon, 7 May 2018
 11:02:12 +0800
To:     <alex.williamson@redhat.com>, <corbet@lwn.net>
CC:     <kvm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From:   "dongbo (E)" <dongbo4@huawei.com>
Subject: [PATCH] vfio: fix documentation
Message-ID: <eacddc78-279c-abe8-e663-9849973dd6a3@huawei.com>
Date:   Mon, 7 May 2018 11:02:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.63.195.168]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Dong Bo <dongbo4@huawei.com>

Update vfio_add_group_dev description to match the current API.

Signed-off-by: Dong Bo <dongbo4@huawei.com>
---
 Documentation/vfio.txt | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/vfio.txt b/Documentation/vfio.txt
index ef6a511..f1a4d3c 100644
--- a/Documentation/vfio.txt
+++ b/Documentation/vfio.txt
@@ -252,15 +252,14 @@ into VFIO core.  When devices are bound and unbound to the driver,
 the driver should call vfio_add_group_dev() and vfio_del_group_dev()
 respectively::

-	extern int vfio_add_group_dev(struct iommu_group *iommu_group,
-	                              struct device *dev,
+	extern int vfio_add_group_dev(struct device *dev,
 				      const struct vfio_device_ops *ops,
 				      void *device_data);

 	extern void *vfio_del_group_dev(struct device *dev);

 vfio_add_group_dev() indicates to the core to begin tracking the
-specified iommu_group and register the specified dev as owned by
+iommu_group of the specified dev and register the dev as owned by
 a VFIO bus driver.  The driver provides an ops structure for callbacks
 similar to a file operations structure::

-- 
1.9.1


.


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
