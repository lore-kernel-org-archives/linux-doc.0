Return-Path: <SRS0=7zml=4H=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A062C34055
	for <linux-doc@archiver.kernel.org>; Wed, 19 Feb 2020 16:38:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E6AE924654
	for <linux-doc@archiver.kernel.org>; Wed, 19 Feb 2020 16:38:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dAASRU+x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbgBSQis (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Feb 2020 11:38:48 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:34472 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727462AbgBSQis (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Feb 2020 11:38:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=/y0dfHUKkn2pEHD6NzAJOH8vA3ZEkwg+tfU0h/oFEkw=; b=dAASRU+x/T70zF/Y5yxA9eJ+ro
        JOf5A6dHh7B7NhNxq4MULZqbKlDaYmCVBp/L60BmNTJwS+n8ugS/qkMjOMfiZioybk4WMAZu0nmXF
        ZMJHr+el0SOFCSZdvczL/ALBZ5a3KEH8rHPCrZwg84+CnlHCC9SGbDT3qoT/xLMrduNkJC+Ll1kU3
        G+CoEUcD/BBHnzw1+Hbn4BNupxlmmWiVTYgisBCNvNjwDjueGu4gW7iyixhgUyQ9279qyWQ65Rrdp
        lX3/ZPy9u+OBsSBLukf+P+ji9unmvbj0lI+wpVfFQwAkG/Dqh9rsnn6zlkuDxamf+Md80TMPrGEar
        w5x9aVmg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j4SN5-0007KO-Kj; Wed, 19 Feb 2020 16:38:47 +0000
Subject: Re: [PATCH v2 1/2] Documentation: Converted the `kobject.txt` to rst
 format
To:     lxsameer@gnu.org, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org
References: <20200219150207.2811054-1-lxsameer@gnu.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e768e92b-8144-bcb9-de57-8ecd48339071@infradead.org>
Date:   Wed, 19 Feb 2020 08:38:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200219150207.2811054-1-lxsameer@gnu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/19/20 7:02 AM, lxsameer@gnu.org wrote:
> From: Sameer Rahmani <lxsameer@gnu.org>
> 
> Reviewed and converted the `kobject.txt` format to rst in place.
> 
> Signed-off-by: Sameer Rahmani <lxsameer@gnu.org>
> ---
>  Documentation/kobject.txt | 80 +++++++++++++++++++--------------------
>  1 file changed, 40 insertions(+), 40 deletions(-)
> 
> diff --git a/Documentation/kobject.txt b/Documentation/kobject.txt
> index ff4c25098119..e12c2a309fd3 100644
> --- a/Documentation/kobject.txt
> +++ b/Documentation/kobject.txt
> @@ -3,7 +3,7 @@ Everything you never wanted to know about kobjects, ksets, and ktypes
>  =====================================================================
>  
>  :Author: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Maybe Cc: gregkh?

> -:Last updated: December 19, 2007
> +:Last updated: Feb 18, 2020
>  
>  Based on an original article by Jon Corbet for lwn.net written October 1,
>  2003 and located at http://lwn.net/Articles/51437/

> @@ -78,30 +78,30 @@ just a matter of using the kobj member.  Code that works with kobjects will
>  often have the opposite problem, however: given a struct kobject pointer,
>  what is the pointer to the containing structure?  You must avoid tricks
>  (such as assuming that the kobject is at the beginning of the structure)
> -and, instead, use the container_of() macro, found in <linux/kernel.h>::
> +and, instead, use the container_of() macro, found in ``<linux/kernel.h>``::
>  
>      container_of(pointer, type, member)
>  
>  where:
>  
> -  * "pointer" is the pointer to the embedded kobject,
> -  * "type" is the type of the containing structure, and
> -  * "member" is the name of the structure field to which "pointer" points.
> +  * ``pointer`` is the pointer to the embedded kobject,
> +  * ``type`` is the type of the containing structure, and
> +  * ``member`` is the name of the structure field to which ``pointer`` points.
>  
>  The return value from container_of() is a pointer to the corresponding
> -container type. So, for example, a pointer "kp" to a struct kobject
> -embedded *within* a struct uio_map could be converted to a pointer to the
> +container type. So, for example, a pointer ``kp`` to a struct kobject
> +embedded **within** a struct uio_map could be converted to a pointer to the
>  *containing* uio_map structure with::

Does "*containing*" need to be modified also?

> @@ -228,7 +228,7 @@ This function will create a kobject and place it in sysfs in the location
>  underneath the specified parent kobject.  To create simple attributes
>  associated with this kobject, use::
>  
> -    int sysfs_create_file(struct kobject *kobj, struct attribute *attr);
> +    static inline int sysfs_create_files(struct kobject *kobj, const struct attribute * const *attr);

That function is only inline when CONFIG_SYSFS is not set/enabled,
so this is not a good change IMO.

>  
>  or::
>  


Thanks.
-- 
~Randy

