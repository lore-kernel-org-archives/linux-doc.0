Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294BAC433E0
	for <linux-doc@archiver.kernel.org>; Sat, 30 Jan 2021 18:54:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFE3A64E11
	for <linux-doc@archiver.kernel.org>; Sat, 30 Jan 2021 18:54:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231641AbhA3SyR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 30 Jan 2021 13:54:17 -0500
Received: from smtprelay0111.hostedemail.com ([216.40.44.111]:59720 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230045AbhA3SyQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 30 Jan 2021 13:54:16 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id 0527D1E03;
        Sat, 30 Jan 2021 18:53:35 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: point84_6108006275b3
X-Filterd-Recvd-Size: 2154
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf04.hostedemail.com (Postfix) with ESMTPA;
        Sat, 30 Jan 2021 18:53:34 +0000 (UTC)
Message-ID: <19fb55171ddc81293e149041c33fa6ce48daed7f.camel@perches.com>
Subject: Re: [PATCH 01/29] coding-style.rst: Avoid comma statements
From:   Joe Perches <joe@perches.com>
To:     Jiri Kosina <trivial@kernel.org>, linux-kernel@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Date:   Sat, 30 Jan 2021 10:53:32 -0800
In-Reply-To: <2a97b738bba335434461a5a918053a49c1fb6af4.1598331148.git.joe@perches.com>
References: <cover.1598331148.git.joe@perches.com>
         <2a97b738bba335434461a5a918053a49c1fb6af4.1598331148.git.joe@perches.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 2020-08-24 at 21:55 -0700, Joe Perches wrote:
> Commas are not how statements are terminated.
> Always use semicolons and braces if necessary.

ping?

> 
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  Documentation/process/coding-style.rst | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
> index 98227226c4e5..a1e061149e0d 100644
> --- a/Documentation/process/coding-style.rst
> +++ b/Documentation/process/coding-style.rst
> @@ -69,9 +69,26 @@ something to hide:
>  	if (condition) do_this;
>  	  do_something_everytime;
>  
> 
> +Don't use commas to avoid using braces:
> +
> +.. code-block:: c
> +
> +	if (condition)
> +		do_this(), do_that();
> +
> +Always uses braces for multiple statements:
> +
> +.. code-block:: c
> +
> +	if (condition) {
> +		do_this();
> +		do_that();
> +	}
> +
>  Don't put multiple assignments on a single line either.  Kernel coding style
>  is super simple.  Avoid tricky expressions.
>  
> 
> +
>  Outside of comments, documentation and except in Kconfig, spaces are never
>  used for indentation, and the above example is deliberately broken.
>  
> 


