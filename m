Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AD7427D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 25 Apr 2019 21:17:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729147AbfDYVRm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 25 Apr 2019 17:17:42 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:50250 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbfDYVRm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Apr 2019 17:17:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=T8Ig2ZFPcz4x6x7b/gKayN8ay4uFZ6L4KXn32goDycE=; b=ZlYs5ibWcxk6J0BEhck7ND3su
        7JyGwvZrP26ZX55YcsSKvI2Z7qAambt3ZQAD7ueg5KIDQSoN0iXZFEY/dWPCKl/2BJQOQsNOIOiu5
        qch74kq3Z/4QCSvOyWyiUNmJqYlMNLzdythhF9aUUF8ZC0AcnkNaQtkXrHh0WEg27JFJa1B83y4m1
        rIVbw9aWPU2PucvNsGa4p2oyEP6vYysOxHyFtQEWWrXv5VxfwzC2WxUc8oYb+lzEXj683LJTOh2eW
        3lu/km/bGOJq3qHAwJ5KldkibjIhg+WgZqmAxcKNx9qC8uaTdbWlTcY6J0uIDY9BaJ23bWQRkBX3P
        czut3LJ4A==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hJlkQ-0003FQ-Rf; Thu, 25 Apr 2019 21:17:38 +0000
Subject: Re: [PATCH] docs/vm: Minor editorial changes in the THP and hugetlbfs
 documentation.
To:     rcampbell@nvidia.com, linux-mm@kvack.org
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Mike Kravetz <mike.kravetz@oracle.com>
References: <20190425190426.10051-1-rcampbell@nvidia.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f31fcabc-3942-4359-1da8-1349350e692f@infradead.org>
Date:   Thu, 25 Apr 2019 14:17:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190425190426.10051-1-rcampbell@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/25/19 12:04 PM, rcampbell@nvidia.com wrote:
> From: Ralph Campbell <rcampbell@nvidia.com>
> 
> Some minor wording changes and typo corrections.
> 
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> ---
>  Documentation/vm/hugetlbfs_reserv.rst | 17 +++---
>  Documentation/vm/transhuge.rst        | 77 ++++++++++++++-------------
>  2 files changed, 48 insertions(+), 46 deletions(-)
> 

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy
