Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6899E7DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 20:09:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752162AbeDRUJq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 16:09:46 -0400
Received: from merlin.infradead.org ([205.233.59.134]:58468 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750824AbeDRUJq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Apr 2018 16:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=mRDeErUQnVE+/WX2OLThDmzZHgrvzsOkm5aCLzVfhZk=; b=VH8rIVg4y9zmJjaOd64meiGbkC
        5NldZo4MoLh8ZqxkaKFH75qCaWgqK21gNMFtNALOwKWDq8LMw4Q34loc6P3thjB9Ds//nh0g6RrC1
        4c8NKwzC214l/ZBbTzMmFK53z+2jMR650enRv2vM+QoTA4UzkNq/6w3e3cRJ0S0JgT/NfL+HMIng+
        wata4psCZ8k2JtGe46uRYjnZBbDwLZkB4dnDsepmm9tTwwvoz/JDYX6CRGHkIxJ2UYIqAQBTSkXGC
        fXE0M3QOzQRezy8fnN2rC+7S1KtD06rWsLJJa3swJjsmSmSY58GJdTzLLtQUSgoeaN8HscJqGLxx6
        TbOr4E1A==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1f8tOj-0007IB-70; Wed, 18 Apr 2018 20:09:45 +0000
Subject: Re: [PATCH v3] docs: kernel-parameters.txt: Fix whitespace
To:     Thymo van Beers <thymovanbeers@gmail.com>, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20180418185136.GA27678@thinkpad>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d092a75f-2456-c077-28f2-cb83a73ca5f7@infradead.org>
Date:   Wed, 18 Apr 2018 13:09:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180418185136.GA27678@thinkpad>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/18/18 11:51, Thymo van Beers wrote:
> Some lines used spaces instead of tabs at line start.
> This can cause mangled lines in editors due to inconsistency.
> 
> Replace spaces for tabs where appropriate.
> 
> Signed-off-by: Thymo van Beers <thymovanbeers@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> Changes in v3:
>   - Change indentation in intel_pstate to reduce overrunning 80-column
>     mark
>   - Indent "nohrst, nosrst, norst:" like "rstonce"

intel_pstate, isolcpus, maxcpus, onenand.bdry, reboot (and a few others)
do still go beyond 80 columns.  Those could be fixed later (or not).

Thanks.


> Changes in v2:
>   - Rebase against docs-next
>   - Fix indentation modifications
> 
>  Documentation/admin-guide/kernel-parameters.txt | 136 ++++++++++++------------
>  1 file changed, 68 insertions(+), 68 deletions(-)


-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
