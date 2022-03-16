Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8369DC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 16 Mar 2022 01:15:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242484AbiCPBQn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Mar 2022 21:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239951AbiCPBQn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Mar 2022 21:16:43 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 475D63C494
        for <linux-doc@vger.kernel.org>; Tue, 15 Mar 2022 18:15:30 -0700 (PDT)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KJC3D6j8DzfZ34;
        Wed, 16 Mar 2022 09:14:00 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 16 Mar 2022 09:15:28 +0800
Received: from [10.174.177.232] (10.174.177.232) by
 dggpeml500006.china.huawei.com (7.185.36.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 16 Mar 2022 09:15:28 +0800
Subject: Re: [PATCH v3] docs/zh_CN: Fix typo in process/howto.rst
To:     Zhou Yuheng <woshoxxx@gmail.com>, <alexs@kernel.org>
CC:     <linux-doc@vger.kernel.org>
References: <20220315232428.4982-1-woshoxxx@gmail.com>
From:   Tang Yizhou <tangyizhou@huawei.com>
Message-ID: <6c103edc-5831-a4f9-dc33-a6f5962697c5@huawei.com>
Date:   Wed, 16 Mar 2022 09:15:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20220315232428.4982-1-woshoxxx@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.232]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/3/16 7:24, Zhou Yuheng wrote:
> Correct the url of linux-next
> 
> Signed-off-by: Zhou Yuheng <woshoxxx@gmail.com>
> ---
>  Documentation/translations/zh_CN/process/howto.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/translations/zh_CN/process/howto.rst b/Documentation/translations/zh_CN/process/howto.rst
> index 2903d7161..1334cdb32 100644
> --- a/Documentation/translations/zh_CN/process/howto.rst
> +++ b/Documentation/translations/zh_CN/process/howto.rst
> @@ -252,7 +252,7 @@ Linux-next 集成测试树
>  在将子系统树的更新合并到主线树之前，需要对它们进行集成测试。为此，存在一个
>  特殊的测试存储库，其中几乎每天都会提取所有子系统树：
>  
> -        https://git.kernel.org/？p=linux/kernel/git/next/linux-next.git
> +        https://git.kernel.org/?p=linux/kernel/git/next/linux-next.git
>  
>  通过这种方式，Linux-next 对下一个合并阶段将进入主线内核的内容给出了一个概要
>  展望。非常欢冒险的测试者运行测试Linux-next。
> 

Acked-by: Tang Yizhou <tangyizhou@huawei.com>

Thanks.
