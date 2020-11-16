Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D6FFC4742C
	for <linux-doc@archiver.kernel.org>; Mon, 16 Nov 2020 08:13:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5B8B222C4
	for <linux-doc@archiver.kernel.org>; Mon, 16 Nov 2020 08:13:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgKPH7c (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 Nov 2020 02:59:32 -0500
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:60048 "EHLO
        out30-42.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727794AbgKPH7c (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Nov 2020 02:59:32 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0UFUsQKt_1605513567;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UFUsQKt_1605513567)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 16 Nov 2020 15:59:28 +0800
Subject: Re: [PATCH doc] doc: zh_CN: add tmpfs to index tree
To:     Wang Qing <wangqing@vivo.com>, Harry Wei <harryxiyou@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Wang Wenhu <wenhu.wang@vivo.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Chucheng Luo <luochucheng@vivo.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1605509272-13770-1-git-send-email-wangqing@vivo.com>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <37199533-b975-bbfb-98d5-9e2052d2ff8e@linux.alibaba.com>
Date:   Mon, 16 Nov 2020 15:58:20 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1605509272-13770-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>

在 2020/11/16 下午2:47, Wang Qing 写道:
> Add temfs to the index tree while adding tempfs translation.
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  Documentation/translations/zh_CN/filesystems/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/translations/zh_CN/filesystems/index.rst b/Documentation/translations/zh_CN/filesystems/index.rst
> index 186501d..9f2a8b0
> --- a/Documentation/translations/zh_CN/filesystems/index.rst
> +++ b/Documentation/translations/zh_CN/filesystems/index.rst
> @@ -25,4 +25,5 @@ Linux Kernel中的文件系统
>  
>     virtiofs
>     debugfs
> +   tmpfs
>  
> 
