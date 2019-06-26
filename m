Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2440D7DE79
	for <lwn-linux-doc@archive.lwn.net>; Wed, 26 Jun 2019 03:48:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfFZDrp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 25 Jun 2019 23:47:45 -0400
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:39821 "EHLO
        out30-56.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727807AbfFZDpn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Jun 2019 23:45:43 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R891e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0TVDVZOt_1561520739;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0TVDVZOt_1561520739)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 26 Jun 2019 11:45:39 +0800
Subject: Re: [PATCH] docs: zh_CN: submitting-drivers.rst: Remove a duplicated
 Documentation/
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Harry Wei <harryxiyou@gmail.com>
References: <47f81418930438d1deab8da1307bcd89ba9afd91.1561225663.git.mchehab+samsung@kernel.org>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <4244437a-1209-9dde-a4d2-1c72d041492c@linux.alibaba.com>
Date:   Wed, 26 Jun 2019 11:45:37 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <47f81418930438d1deab8da1307bcd89ba9afd91.1561225663.git.mchehab+samsung@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks for catching.


Reviewed-by: Alex Shi

在 2019/6/23 上午1:47, Mauro Carvalho Chehab 写道:
> Somehow, this file ended with Documentation/ twice.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>   Documentation/translations/zh_CN/process/submitting-drivers.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_CN/process/submitting-drivers.rst b/Documentation/translations/zh_CN/process/submitting-drivers.rst
> index 72c6cd935821..72f4f45c98de 100644
> --- a/Documentation/translations/zh_CN/process/submitting-drivers.rst
> +++ b/Documentation/translations/zh_CN/process/submitting-drivers.rst
> @@ -22,7 +22,7 @@
>   兴趣的是显卡驱动程序，你也许应该访问 XFree86 项目(http://www.xfree86.org/)
>   和／或 X.org 项目 (http://x.org)。
>   
> -另请参阅 Documentation/Documentation/translations/zh_CN/process/submitting-patches.rst 文档。
> +另请参阅 Documentation/translations/zh_CN/process/submitting-patches.rst 文档。
>   
>   
>   分配设备号
