Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A725C433E6
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 20:55:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46FD0601FD
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 20:55:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237160AbhCAUyu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Mar 2021 15:54:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240935AbhCAUvi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Mar 2021 15:51:38 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02486C061756;
        Mon,  1 Mar 2021 12:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=xURFnUix2FFfW4f6RQeVLRRyViVR5/5x47j9vmw3lx0=; b=ds+ao72n5QJf3QU/wR6cABDFyf
        vaizD3MV7uzO+JQ+ynJ/uJtyuFmgzS/VuO24SYu9bY6s9n68Yj5Mq9Ui3WUz80NHCFaf+7XYG+qwe
        Ih9BWWHUBtQ/8jzhb9yR0eg6B9442oYxwGK//xPL6B84nBchIJGUenmC0Mn0W3V0VbBhB5XDQ1pwN
        Py6jRy7ceM9qPQZzUKRp/eYM58WbW/xbh2OcB06PVFiCp7WcRgzYX4iAzQvgnsyQZUIdviYb89J/+
        bGCFX8vbhB3fqB3Akwu7VAk4yKBP839Qnia71WYMN8sh7B0J97k37ZwR1KTV9P1uC1ORqgliyUqv4
        iHUsms/g==;
Received: from [2601:1c0:6280:3f0::3ba4]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1lGpVH-0001lf-Jg; Mon, 01 Mar 2021 20:50:55 +0000
Subject: Re: [PATCH V2] docs: sphinx: Fix couple of spellings in the file
 rstFlatTable.py
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210301201052.11067-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <fc8f9df1-e32a-94d7-fbd8-f4f803385e5a@infradead.org>
Date:   Mon, 1 Mar 2021 12:50:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301201052.11067-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 3/1/21 12:10 PM, Bhaskar Chowdhury wrote:
> s/automaticly/automatically/
> s/buidler/builder/
> 
> ..and a sentence construction fix.
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Changes from V1:
>  Incorporating Randy's observations ...i.e sentence construction
> 
>  Documentation/sphinx/rstFlatTable.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/sphinx/rstFlatTable.py b/Documentation/sphinx/rstFlatTable.py
> index a3eea0bbe6ba..16bea0632555 100755
> --- a/Documentation/sphinx/rstFlatTable.py
> +++ b/Documentation/sphinx/rstFlatTable.py
> @@ -22,7 +22,7 @@ u"""
> 
>      * *auto span* rightmost cell of a table row over the missing cells on the
>        right side of that table-row.  With Option ``:fill-cells:`` this behavior
> -      can changed from *auto span* to *auto fill*, which automaticly inserts
> +      can be changed from *auto span* to *auto fill*, which automatically inserts
>        (empty) cells instead of spanning the last cell.
> 
>      Options:
> @@ -161,7 +161,7 @@ class ListTableBuilder(object):
>          for colwidth in colwidths:
>              colspec = nodes.colspec(colwidth=colwidth)
>              # FIXME: It seems, that the stub method only works well in the
> -            # absence of rowspan (observed by the html buidler, the docutils-xml
> +            # absence of rowspan (observed by the html builder, the docutils-xml
>              # build seems OK).  This is not extraordinary, because there exists
>              # no table directive (except *this* flat-table) which allows to
>              # define coexistent of rowspan and stubs (there was no use-case
> --


-- 
~Randy

