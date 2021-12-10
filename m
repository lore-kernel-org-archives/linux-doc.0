Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159B6C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 10 Dec 2021 09:35:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237958AbhLJJjS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 10 Dec 2021 04:39:18 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:29116 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238015AbhLJJjS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Dec 2021 04:39:18 -0500
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.54])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4J9Qg5119zz1DLdD;
        Fri, 10 Dec 2021 17:32:49 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 17:35:42 +0800
Received: from huawei.com (10.175.100.227) by dggpeml500006.china.huawei.com
 (7.185.36.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 10 Dec
 2021 17:35:41 +0800
From:   Tang Yizhou <tangyizhou@huawei.com>
To:     <siyanteng@loongson.cn>, <siyanteng01@gmail.com>,
        <alexs@kernel.org>, <seakeel@gmail.com>
CC:     <linux-doc@vger.kernel.org>, <corbet@lwn.net>,
        <zhengbin13@huawei.com>, <tangyeechou@gmail.com>,
        Tang Yizhou <tangyizhou@huawei.com>
Subject: [PATCH v2 0/2] Add sched-capacity Chinese translation
Date:   Fri, 10 Dec 2021 18:03:20 +0800
Message-ID: <20211210100322.1490-1-tangyizhou@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate scheduler/sched-capacity.rst.

v2:
Take Alex's advice and add him as proofreader.

Tang Yizhou (2):
  docs/zh-CN: Add sched-capacity Chinese translation
  docs/zh-CN: Update sched-capacity in scheduler/index.rst

 .../translations/zh_CN/scheduler/index.rst    |   2 +-
 .../zh_CN/scheduler/sched-capacity.rst        | 397 ++++++++++++++++++
 2 files changed, 398 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/scheduler/sched-capacity.rst

-- 
2.17.1

