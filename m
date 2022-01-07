Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9DD7C433F5
	for <linux-doc@archiver.kernel.org>; Fri,  7 Jan 2022 08:04:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345188AbiAGIEB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 Jan 2022 03:04:01 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:31074 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235583AbiAGIEB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Jan 2022 03:04:01 -0500
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.53])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4JVbHf1rCmz1FCbx;
        Fri,  7 Jan 2022 16:00:30 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 7 Jan 2022 16:03:59 +0800
Received: from [10.174.177.232] (10.174.177.232) by
 dggpeml500006.china.huawei.com (7.185.36.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 7 Jan 2022 16:03:59 +0800
Subject: Re: [PATCH 1/3] docs/zh_CN: add vm/index translation
To:     Yanteng Si <siyanteng01@gmail.com>, <corbet@lwn.net>,
        <alexs@kernel.org>, <seakeel@gmail.com>
CC:     Yanteng Si <siyanteng@loongson.cn>, <chenhuacai@kernel.org>,
        <jiaxun.yang@flygoat.com>, <linux-doc@vger.kernel.org>
References: <cover.1641522956.git.siyanteng@loongson.cn>
 <f0ec6c767958c37f266edaca715d675c97a5a127.1641522956.git.siyanteng@loongson.cn>
From:   Tang Yizhou <tangyizhou@huawei.com>
Message-ID: <51092238-4664-b4be-ee85-7703e7f38381@huawei.com>
Date:   Fri, 7 Jan 2022 16:03:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <f0ec6c767958c37f266edaca715d675c97a5a127.1641522956.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.232]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/1/7 10:40, Yanteng Si wrote:
> Translate ../vm/index.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/translations/zh_CN/index.rst    |  2 +-
>  Documentation/translations/zh_CN/vm/index.rst | 52 +++++++++++++++++++
>  2 files changed, 53 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/vm/index.rst
> 

Reviewed-by: Tang Yizhou <tangyizhou@huawei.com>

Thanks,
Tang
