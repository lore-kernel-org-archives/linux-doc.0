Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C224DC77B7A
	for <linux-doc@archiver.kernel.org>; Thu, 25 May 2023 13:41:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233263AbjEYNlr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 May 2023 09:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233656AbjEYNlp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 May 2023 09:41:45 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC84186;
        Thu, 25 May 2023 06:41:44 -0700 (PDT)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4QRpxz3kQjzqSQ5;
        Thu, 25 May 2023 21:37:11 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 21:41:42 +0800
Subject: Re: [PATCH 3/3] docs: perf: Add new description for HiSilicon UC PMU
To:     Junhao He <hejunhao3@huawei.com>, <will@kernel.org>,
        <jonathan.cameron@huawei.com>, <linux-kernel@vger.kernel.org>,
        <mark.rutland@arm.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-doc@vger.kernel.org>, <yangyicong@huawei.com>,
        <shenyang39@huawei.com>, <prime.zeng@hisilicon.com>,
        <yangyicong@hisilicon.com>
References: <20230523131825.6102-1-hejunhao3@huawei.com>
 <20230523131825.6102-4-hejunhao3@huawei.com>
From:   Yicong Yang <yangyicong@huawei.com>
Message-ID: <5785e3a3-0a4d-3a75-88cf-f29f43feb6bc@huawei.com>
Date:   Thu, 25 May 2023 21:41:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20230523131825.6102-4-hejunhao3@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2023/5/23 21:18, Junhao He wrote:
> A new function is added on HiSilicon uncore UC PMU.
> 
> The UC PMU support to filter statistical information based on
> the specified tx request uring channel. Make user configuration
> through "uring_channel" parameter.
> Document them to provide guidance on how to use them.
> 

Since it's not a new document. Just merge this into previous patch will be better for
review.

Thanks.

> Signed-off-by: Junhao He <hejunhao3@huawei.com>
> ---
>  Documentation/admin-guide/perf/hisi-pmu.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/admin-guide/perf/hisi-pmu.rst b/Documentation/admin-guide/perf/hisi-pmu.rst
> index 546979360513..939a524fa1d6 100644
> --- a/Documentation/admin-guide/perf/hisi-pmu.rst
> +++ b/Documentation/admin-guide/perf/hisi-pmu.rst
> @@ -98,6 +98,14 @@ CCL/ICL-ID. For I/O die, the ICL-ID is followed by:
>  5'b00011: HAC_ICL;
>  5'b10000: PCIe_ICL;
>  
> +(e) uring_channel: UC PMU events 0x47~0x59 supports filtering by tx request
> +uring channel. It is 2 bits. Some important codes are as follows:
> +2'b11: count the events which sent to the uring_ext (MATA) channel;
> +2'b01: is the same as 2'b11;
> +2'b10: count the events which sent to the uring (non-MATA) channel;
> +2'b00: default value, count the events which sent to the both uring and
> +       uring_ext channel;
> +
>  Users could configure IDs to count data come from specific CCL/ICL, by setting
>  srcid_cmd & srcid_msk, and data desitined for specific CCL/ICL by setting
>  tgtid_cmd & tgtid_msk. A set bit in srcid_msk/tgtid_msk means the PMU will not
> 
