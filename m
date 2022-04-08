Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A36C433F5
	for <linux-doc@archiver.kernel.org>; Fri,  8 Apr 2022 01:20:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233325AbiDHBW1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 7 Apr 2022 21:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233320AbiDHBW0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Apr 2022 21:22:26 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33F3710BBD5
        for <linux-doc@vger.kernel.org>; Thu,  7 Apr 2022 18:20:25 -0700 (PDT)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4KZL135lkdzBs6n;
        Fri,  8 Apr 2022 09:16:07 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 8 Apr 2022 09:20:20 +0800
Received: from [10.174.177.232] (10.174.177.232) by
 dggpeml500006.china.huawei.com (7.185.36.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 8 Apr 2022 09:20:19 +0800
Subject: Re: [PATCH v3] docs/zh_CN: Fix typo in process/howto.rst
To:     Jonathan Corbet <corbet@lwn.net>
CC:     Alex Shi <alexs@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Zhou Yuheng <woshoxxx@gmail.com>, Alex Shi <seakeel@gmail.com>
References: <20220315232428.4982-1-woshoxxx@gmail.com>
 <CAJy-AmkSuuUA5Wk52s3afq2B9c4HY9FfbLnkwDDB2giEBKPppg@mail.gmail.com>
From:   Tang Yizhou <tangyizhou@huawei.com>
Message-ID: <e915dae8-858a-01bf-e732-8b969c90ec78@huawei.com>
Date:   Fri, 8 Apr 2022 09:20:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <CAJy-AmkSuuUA5Wk52s3afq2B9c4HY9FfbLnkwDDB2giEBKPppg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.232]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/3/18 18:11, Alex Shi wrote:
> Reviewed-by: Alex Shi <alexs@kernel.org>
> 
> On Wed, Mar 16, 2022 at 7:26 AM Zhou Yuheng <woshoxxx@gmail.com> wrote:
>>
>> Correct the url of linux-next
>>
>> Signed-off-by: Zhou Yuheng <woshoxxx@gmail.com>

Hi,jon:

You may apply this patch, thanks.

Tang

