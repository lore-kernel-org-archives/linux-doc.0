Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE22C433EF
	for <linux-doc@archiver.kernel.org>; Tue,  1 Feb 2022 23:25:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242853AbiBAXZL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Feb 2022 18:25:11 -0500
Received: from ms.lwn.net ([45.79.88.28]:52018 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229798AbiBAXZK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 1 Feb 2022 18:25:10 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 8EF1B6110;
        Tue,  1 Feb 2022 23:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8EF1B6110
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1643757910; bh=g+he6FIjVsLq4abR8M1huIjtidE2n0sKQZhxsGD9CVA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=nr4xTwjM+ND0DsPt9OPNXuS5kxA0dCdpO5qZeXC7Xn3vmzpfEGUgENFIg68/9laQy
         w3Kt/U5ZISdb2h9rxDeDMLblcCSn1jZ81YAwlun3MO3e0foIWL1NfiLObME7mnlK1a
         5YhT6HucUSw16axG/CK4OBr65YCuYgYsQW7ms7Ly9l2BgG/tbYTLP7VfzPyMPE06D9
         8Qa+WDUdUnIQdRRLKSJ4tVn73jS7YJvrz712ygQ5a/fgxPptwIoEA1DO5gn5IE+1Bn
         d6DENMrWQe1yuEQgY8b3ufqNpeFi6bQ5Og+tb+t6ZXm0bGeN5FCcZMBwbEMBB5oe8x
         0rumzdFoI2xbA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tang Yizhou <tangyizhou@huawei.com>, Alex Shi <seakeel@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        yanteng si <siyanteng01@gmail.com>,
        Alex Shi <alexs@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        zhengbin13@huawei.com, Yeechou Tang <tangyeechou@gmail.com>
Subject: Re: [PATCH] docs/zh_CN: Add rbtree Chinese translation
In-Reply-To: <8591749f-119b-b3c1-ca7a-fcc2ba7deada@huawei.com>
References: <20211225015146.1535-1-tangyizhou@huawei.com>
 <CAJy-Am=aL4EqgHfWbDpCRXdgd2zO-yvfRDwVxodS42NJq+hPJA@mail.gmail.com>
 <8591749f-119b-b3c1-ca7a-fcc2ba7deada@huawei.com>
Date:   Tue, 01 Feb 2022 16:25:43 -0700
Message-ID: <877dae5fuw.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tang Yizhou <tangyizhou@huawei.com> writes:

> On 2021/12/26 11:41, Alex Shi wrote:
>> On Sat, Dec 25, 2021 at 9:24 AM Tang Yizhou <tangyizhou@huawei.com> wrote:
>>>
>>> Translate core-api/rbtree.rst into Chinese.
>>>
>>> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
>> 
>> Reviewed-by: Alex Shi <alexs@kernel.org>
>> 
>>> ---
>>>  .../translations/zh_CN/core-api/index.rst     |   2 +-
>>>  .../translations/zh_CN/core-api/rbtree.rst    | 391 ++++++++++++++++++
>>>  2 files changed, 392 insertions(+), 1 deletion(-)
>>>  create mode 100644 Documentation/translations/zh_CN/core-api/rbtree.rst
>
> Hi, jon. Could you please apply this patch? 

Done.  Not sure how that one fell through the cracks, sorry.

jon
