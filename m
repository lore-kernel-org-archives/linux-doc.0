Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBF0C433ED
	for <linux-doc@archiver.kernel.org>; Thu, 29 Apr 2021 07:03:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAD2361453
	for <linux-doc@archiver.kernel.org>; Thu, 29 Apr 2021 07:03:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbhD2HE0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Apr 2021 03:04:26 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:16168 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237569AbhD2HEZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Apr 2021 03:04:25 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FW5x86xk9zpcPr;
        Thu, 29 Apr 2021 15:00:28 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Thu, 29 Apr 2021 15:03:28 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <corbet@lwn.net>, <gregkh@linuxfoundation.org>,
        <song.bao.hua@hisilicon.com>
CC:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Tian Tao <tiantao6@hisilicon.com>
Subject: [PATCH 0/2] clarify and cleanup CPU and NUMA topology ABIs
Date:   Thu, 29 Apr 2021 15:03:37 +0800
Message-ID: <1619679819-45256-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

patch #1: clarify the overflow issue of sysfs pagebuf, and Move the
presence of BUILD_BUG_ON to more sensible place.

patch #2: move the interface that exists under
/sys/devices/system/cpu/cpuX/topology/ to the more logical
Documentation/ABI/ file that can be properly parsed and
displayed to the user space.

these two patches are a follow-up to Greg's comments in the below threads:
https://lore.kernel.org/lkml/YFRGIedW1fUlnmi+@kroah.com/
https://lore.kernel.org/lkml/YFR2kwakbcGiI37w@kroah.com/

Tian Tao (2):
  CPU, NUMA topology ABIs: clarify the overflow issue of sysfs pagebuf
  Documentation/ABI: Move the topology-related sysfs interface to the
    right place

 Documentation/ABI/stable/sysfs-devices-node       |   5 +-
 Documentation/ABI/stable/sysfs-devices-system-cpu | 142 ++++++++++++++++++++++
 Documentation/admin-guide/cputopology.rst         |  83 +------------
 drivers/base/node.c                               |   3 -
 include/linux/cpumask.h                           |   6 +
 5 files changed, 154 insertions(+), 85 deletions(-)

-- 
2.7.4

