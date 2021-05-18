Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0165AC433B4
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 18:42:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFCA461261
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 18:42:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351635AbhERSn7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 May 2021 14:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351619AbhERSn6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 May 2021 14:43:58 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED89C061573;
        Tue, 18 May 2021 11:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=n5h0AHnFv6CsusKdJgwetJi0/rwHN4auVfNlmDw0qX0=; b=tydlG9naS033BuFxRI5ZRSyGJy
        iLUrAvBfCp/Ho1cjALlawZUXS9F29SKSS7dK+SafNjZJjg1rgiVyAjriQO/mkykpkSGR3dnMdf+N1
        gC7Q4HUbDdnFrQJnurQZYJeI5oeBdhLTh1MRyqCfeErzJzCkNW+jLM2JTK5lJo983rF+QzZ2Gtx2t
        92m+oYBudrBfU6gZeAHTUFGIzf3TGNHdr/h6NPq+jUnTLcAix4r5pjQW4f6GmNF6tOawq2Y9qb8F4
        vWShIF1Pm8tz8+z6COg3LV82+NRUJ5jjkx7bbSCScnm9fVn8sk5cf/eHhr5OF6CPQX4sf6bpbzOmK
        +yRp5kWA==;
Received: from [2601:1c0:6280:3f0::7376]
        by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lj4fw-00EtAE-Ac; Tue, 18 May 2021 18:42:40 +0000
Subject: Re: [PATCH] win_minmax: fix kernel-doc syntax in file header
To:     Aditya Srivastava <yashsri421@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     lukas.bulwahn@gmail.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org
References: <20210518180352.13154-1-yashsri421@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c584c237-4b70-818e-25b5-4f7c08c456c8@infradead.org>
Date:   Tue, 18 May 2021 11:42:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210518180352.13154-1-yashsri421@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/18/21 11:03 AM, Aditya Srivastava wrote:
> 
> Provide a simple fix by replacing this occurrence with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> * Applies perfectly on next-20210514
> 
>  include/linux/win_minmax.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy

