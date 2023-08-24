Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685C5C27C40
	for <linux-doc@archiver.kernel.org>; Thu, 24 Aug 2023 21:40:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243699AbjHXVjy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Aug 2023 17:39:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240715AbjHXVjU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Aug 2023 17:39:20 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5828E19A0;
        Thu, 24 Aug 2023 14:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=e4yylWIIi/AmR/SExjZup/cyWRHP2YIPrAGavpbAXfw=; b=2qQf2Ol+CHT4K8HI/EGLBFLyDT
        NnW9BYOfxVaoZ5CvMkh7iTA7sPcpB1eZLWuuxBmtGvCiuMhM1RmCNlFwXK5B4anCvH6e2noGc0viZ
        uaUlLq5iPgFC/Z3rGGA/k4eYOY4/+xJI9o+Bg6X4CNyp3f6GcWwzeQJ/52uGVP4Ma1V6zdPAUG88y
        L/VtaOU3YoNCwc/ZhyUFheTlf2jgXVnw3/bv0n7nwEWVBN33vq5n1oNdPYKA97Dgy0NdmevcJ3QVn
        wVnhwU+01ZTZs9S/NsVBIXXgdZkWifadzPba8hJAn4oKr1UDjVgYSj3GzLCB4HaDyR/bbyRlQKwdm
        WtjaGhkw==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qZI2u-003rXV-26;
        Thu, 24 Aug 2023 21:39:16 +0000
Message-ID: <15b53029-2a5f-e251-c70b-e48187736afd@infradead.org>
Date:   Thu, 24 Aug 2023 14:39:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] fork: Fix kernel-doc
Content-Language: en-US
To:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
        linux-kernel@vger.kernel.org
References: <20230824193644.3029141-1-willy@infradead.org>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230824193644.3029141-1-willy@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 8/24/23 12:36, Matthew Wilcox (Oracle) wrote:
> Fix the various warnings from kernel-doc in kernel/fork.c
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  kernel/fork.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy
