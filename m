Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C72A1E732E0
	for <linux-doc@archiver.kernel.org>; Thu, 28 Sep 2023 14:36:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231255AbjI1OgN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Sep 2023 10:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbjI1OgM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Sep 2023 10:36:12 -0400
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5DCFCC0;
        Thu, 28 Sep 2023 07:36:07 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R861e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0Vt1uLaf_1695911763;
Received: from 30.27.96.237(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0Vt1uLaf_1695911763)
          by smtp.aliyun-inc.com;
          Thu, 28 Sep 2023 22:36:05 +0800
Message-ID: <a9f381bc-f2f1-d94c-8f4b-579f0bdd1506@linux.alibaba.com>
Date:   Thu, 28 Sep 2023 22:36:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v2] erofs: update documentation
To:     Jingbo Xu <jefflexu@linux.alibaba.com>, xiang@kernel.org,
        chao@kernel.org, linux-erofs@lists.ozlabs.org
Cc:     huyue2@coolpad.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230928134852.31118-1-jefflexu@linux.alibaba.com>
From:   Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20230928134852.31118-1-jefflexu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2023/9/28 21:48, Jingbo Xu wrote:
>   - update new features like bloom filter and DEFLATE.
> 
>   - add documentation for the long xattr name prefixes, which was
>     landed upstream since v6.4.
> 
> Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>

Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang
