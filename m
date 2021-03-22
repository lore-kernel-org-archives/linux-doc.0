Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B9DC433C1
	for <linux-doc@archiver.kernel.org>; Mon, 22 Mar 2021 03:46:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F13B061964
	for <linux-doc@archiver.kernel.org>; Mon, 22 Mar 2021 03:46:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbhCVDpx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 21 Mar 2021 23:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbhCVDpk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 21 Mar 2021 23:45:40 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47882C061574;
        Sun, 21 Mar 2021 20:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=GGkOGVhZgHqYkFP66Hj97U7dOqehk9nNJRdnojaxdPk=; b=FSS2t7zYpc7zLQX8LModz5Zdn3
        m9QHrb34dhzEVeiyBJlsdjWTjhNadcfmawyloZ+wmbRSE4eaKmyJ+zBWBe2imburjgAKKPYyLZ5cw
        o6xCfTo5GkU7YP/jQw8TtKpHffBg9UhFNwFy6hriA/dzLXMUIPu/X3AS+uLfHfstkuaH67r9BWqlT
        J+IjIxeF4+6HYLFWt74CzV0TocdEd20SBFHm504OkOrS9gELP1tN8K3zNtyrz4ot29sLQScJLfINV
        yOdExw9wOUS1I+R0QvziNqKKJSpHXjlWqI4KKZGh4h/o4cCRQjab4ZXldYanEcwSVBwIIckBduRPR
        PRiI0IIg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lOBUx-007wfZ-JD; Mon, 22 Mar 2021 03:45:02 +0000
Date:   Mon, 22 Mar 2021 03:44:59 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     corbet@lwn.net, sir@cmpwn.com, gregkh@linuxfoundation.org,
        lee.jones@linaro.org, bp@alien8.de, huawei@kernel.org,
        krzk@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, rdunlap@infradead.org
Subject: Re: [PATCH] docs: submitting-patches Fix a typo
Message-ID: <20210322034459.GE1719932@casper.infradead.org>
References: <20210322033000.2523887-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322033000.2523887-1-unixbhaskar@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 22, 2021 at 09:00:00AM +0530, Bhaskar Chowdhury wrote:
> 
> s/mesages/messages/

did you test the build afterwards?  you forgot to do something.

> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  Documentation/process/submitting-patches.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 91de63b201c1..8b2676527b7e 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -679,7 +679,7 @@ generates appropriate diffstats by default.)
>  See more details on the proper patch format in the following
>  references.
> 
> -Backtraces in commit mesages
> +Backtraces in commit messages
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
>  Backtraces help document the call chain leading to a problem. However,
> --
> 2.31.0
> 
