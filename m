Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 584E1C433DB
	for <linux-doc@archiver.kernel.org>; Fri,  5 Feb 2021 03:41:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B56D64E27
	for <linux-doc@archiver.kernel.org>; Fri,  5 Feb 2021 03:41:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbhBEDln (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Feb 2021 22:41:43 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:11679 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230180AbhBEDlm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Feb 2021 22:41:42 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DX1PL2fFxzlG6M;
        Fri,  5 Feb 2021 11:39:18 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 5 Feb 2021
 11:40:55 +0800
Subject: Re: [PATCH] Documentation: f2fs: fix typo s/automaic/automatic
To:     Ed Tsai <ed.tsai@mediatek.com>,
        <linux-f2fs-devel@lists.sourceforge.net>
CC:     <linux-doc@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20210204132556.14934-1-ed.tsai@mediatek.com>
From:   Chao Yu <yuchao0@huawei.com>
Message-ID: <860ac670-f832-c41d-f903-d24e24200292@huawei.com>
Date:   Fri, 5 Feb 2021 11:40:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210204132556.14934-1-ed.tsai@mediatek.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2021/2/4 21:25, Ed Tsai wrote:
> Fix typo in f2fs documentation.
> 
> Signed-off-by: Ed Tsai<ed.tsai@mediatek.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,
