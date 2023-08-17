Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE6FC5479A
	for <linux-doc@archiver.kernel.org>; Thu, 17 Aug 2023 21:12:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238609AbjHQVLz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Aug 2023 17:11:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355150AbjHQVLY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Aug 2023 17:11:24 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29E3F358D
        for <linux-doc@vger.kernel.org>; Thu, 17 Aug 2023 14:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=A0+YwF7cay4Tkic6bN8gmQ1qFVkf98wygDUByMcmAwc=; b=dfcjNlc+TEZlshJeDc+RoiPWrx
        lgskNcP1Okvi9ztwt+GQWq+XjD4jypUuRpRiwoiGH+gyMONASGnd9iXuSwxJ0D78xlqcYqFclqAkE
        3zvQGmaA7wWjcD7AeGErKjRD1N8I+xuzln9msSNHr6xIDt7X63xBtAl1inNXMpiDeXtxisoXCb5eE
        o8ot9hHYj0z274uNOO0sM5ymxq0P24m2jKhRy9g7kOZQmfE+YBOqDzXn0lLCQFDCOQu6Q8Wwx8BHn
        6HVKMAKafmDKO9De1AXX33YASB6MCPsJFiSbDNS+iULHWckTrVsBztZ+LzwVc1bFyAMLJxdHMWwId
        QqOYER0Q==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qWkH4-0079oK-0S;
        Thu, 17 Aug 2023 21:11:22 +0000
Message-ID: <b522a72a-2588-c9e1-adaa-55741155dd05@infradead.org>
Date:   Thu, 17 Aug 2023 14:11:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] DOCUMENTATION: Correct filename in Documentation
Content-Language: en-US
To:     mail@renenyffenegger.ch, linux-doc@vger.kernel.org
References: <20230817205940.7477-1-mail@renenyffenegger.ch>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230817205940.7477-1-mail@renenyffenegger.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 8/17/23 13:59, mail@renenyffenegger.ch wrote:
> Correct filename of renamed file in Documentation
> 
> The current documentation in Documentation/core-api/kobject.rst refers to a
> macro named `container_of`, supposedly defined in linux/kernel.h while in
> reality it is defined in linux/container_of.h
> 
> Signed-off-by: René Nyffenegger <mail@renenyffenegger.ch>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> --
> diff --git a/Documentation/core-api/kobject.rst b/Documentation/core-api/kobject.rst
> index 7310247310a0..5f6c61bc03bf 100644
> --- a/Documentation/core-api/kobject.rst
> +++ b/Documentation/core-api/kobject.rst
> @@ -78,7 +78,7 @@ just a matter of using the kobj member.  Code that works with kobjects will
>  often have the opposite problem, however: given a struct kobject pointer,
>  what is the pointer to the containing structure?  You must avoid tricks
>  (such as assuming that the kobject is at the beginning of the structure)
> -and, instead, use the container_of() macro, found in ``<linux/kernel.h>``::
> +and, instead, use the container_of() macro, found in ``<linux/container_of.h>``::
>  
>      container_of(ptr, type, member)
> 

-- 
~Randy
