Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2FEC433EF
	for <linux-doc@archiver.kernel.org>; Sat, 29 Jan 2022 09:05:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbiA2JFV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 29 Jan 2022 04:05:21 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:32132 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbiA2JFV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 29 Jan 2022 04:05:21 -0500
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.54])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Jm7cq1Gy5z8wYX;
        Sat, 29 Jan 2022 17:02:19 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 29 Jan 2022 17:05:19 +0800
Received: from [10.174.177.232] (10.174.177.232) by
 dggpeml500006.china.huawei.com (7.185.36.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 29 Jan 2022 17:05:19 +0800
Subject: Re: [PATCH] docs/zh_CN: Add rbtree Chinese translation
To:     Alex Shi <seakeel@gmail.com>
CC:     Yanteng Si <siyanteng@loongson.cn>,
        yanteng si <siyanteng01@gmail.com>,
        Alex Shi <alexs@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, <zhengbin13@huawei.com>,
        Yeechou Tang <tangyeechou@gmail.com>
References: <20211225015146.1535-1-tangyizhou@huawei.com>
 <CAJy-Am=aL4EqgHfWbDpCRXdgd2zO-yvfRDwVxodS42NJq+hPJA@mail.gmail.com>
From:   Tang Yizhou <tangyizhou@huawei.com>
Message-ID: <8591749f-119b-b3c1-ca7a-fcc2ba7deada@huawei.com>
Date:   Sat, 29 Jan 2022 17:05:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <CAJy-Am=aL4EqgHfWbDpCRXdgd2zO-yvfRDwVxodS42NJq+hPJA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.232]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2021/12/26 11:41, Alex Shi wrote:
> On Sat, Dec 25, 2021 at 9:24 AM Tang Yizhou <tangyizhou@huawei.com> wrote:
>>
>> Translate core-api/rbtree.rst into Chinese.
>>
>> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
> 
> Reviewed-by: Alex Shi <alexs@kernel.org>
> 
>> ---
>>  .../translations/zh_CN/core-api/index.rst     |   2 +-
>>  .../translations/zh_CN/core-api/rbtree.rst    | 391 ++++++++++++++++++
>>  2 files changed, 392 insertions(+), 1 deletion(-)
>>  create mode 100644 Documentation/translations/zh_CN/core-api/rbtree.rst

Hi, jon. Could you please apply this patch? 

Thanks,
Tang
