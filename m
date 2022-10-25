Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65306C04A95
	for <linux-doc@archiver.kernel.org>; Tue, 25 Oct 2022 11:33:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231982AbiJYLdW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Oct 2022 07:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231838AbiJYLdV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Oct 2022 07:33:21 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C239122BED;
        Tue, 25 Oct 2022 04:33:20 -0700 (PDT)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MxV7G5MD2zmVFx;
        Tue, 25 Oct 2022 19:28:26 +0800 (CST)
Received: from localhost.localdomain (10.67.164.66) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 25 Oct 2022 19:33:18 +0800
From:   Yicong Yang <yangyicong@huawei.com>
To:     Shaokun Zhang <zhangshaokun@hisilicon.com>, <liuqi6124@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        John Garry <john.garry@huawei.com>,
        <jonathan.cameron@huawei.com>
CC:     <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-doc@vger.kernel.org>, <linuxarm@huawei.com>,
        <f.fangjian@huawei.com>, <prime.zeng@huawei.com>
Subject: [PATCH 0/3] Add TLP filter support and some fixes for HiSilicon PCIe PMU
Date:   Tue, 25 Oct 2022 19:32:39 +0800
Message-ID: <20221025113242.58271-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.164.66]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yicong Yang <yangyicong@hisilicon.com>

HiSilicon PCIe PMU support count the bandwidth of TLP headers, TLP payloads
or both. Add support for it. User can set this through perf tool's
'len_mode' like:

  $# perf stat -e hisi_pcie0_core0/rx_mrd_flux,len_mode=0x1/ sleep 5

Also includes 2 fixes of both driver and documentation in this series.

Yicong Yang (3):
  drivers/perf: hisi: Fix some event id for hisi-pcie-pmu
  docs: perf: Fix PMU instance name of hisi-pcie-pmu
  drivers/perf: hisi: Add TLP filter support

 .../admin-guide/perf/hisi-pcie-pmu.rst        | 42 ++++++++++++++-----
 drivers/perf/hisilicon/hisi_pcie_pmu.c        | 22 +++++++---
 2 files changed, 48 insertions(+), 16 deletions(-)

-- 
2.24.0

