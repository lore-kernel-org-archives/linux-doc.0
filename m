Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE6DC433F5
	for <linux-doc@archiver.kernel.org>; Sat, 11 Dec 2021 10:55:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhLKKzO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 11 Dec 2021 05:55:14 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:29182 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbhLKKzO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 11 Dec 2021 05:55:14 -0500
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JB4PC26ltz8vjY;
        Sat, 11 Dec 2021 18:53:03 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 11 Dec 2021 18:55:12 +0800
Received: from huawei.com (10.175.100.227) by dggpeml500006.china.huawei.com
 (7.185.36.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Sat, 11 Dec
 2021 18:55:11 +0800
From:   Tang Yizhou <tangyizhou@huawei.com>
To:     <siyanteng@loongson.cn>, <siyanteng01@gmail.com>,
        <alexs@kernel.org>, <seakeel@gmail.com>
CC:     <linux-doc@vger.kernel.org>, <corbet@lwn.net>,
        <zhengbin13@huawei.com>, <tangyeechou@gmail.com>,
        Tang Yizhou <tangyizhou@huawei.com>
Subject: [PATCH v3 0/1] Add sched-capacity Chinese translation
Date:   Sat, 11 Dec 2021 19:22:51 +0800
Message-ID: <20211211112252.5675-1-tangyizhou@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate scheduler/sched-capacity.rst.

v3:
Bring the document into alignment with max 50 Chinese chars.

v2:
Take Alex's advice and add him as proofreader.

Tang Yizhou (1):
  docs/zh-CN: Add sched-capacity Chinese translation

 .../translations/zh_CN/scheduler/index.rst    |   2 +-
 .../zh_CN/scheduler/sched-capacity.rst        | 390 ++++++++++++++++++
 2 files changed, 391 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/scheduler/sched-capacity.rst

-- 
2.17.1

