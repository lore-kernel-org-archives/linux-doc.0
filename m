Return-Path: <SRS0=Ik1b=BG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5E1C433E1
	for <linux-doc@archiver.kernel.org>; Mon, 27 Jul 2020 22:14:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88E0F20809
	for <linux-doc@archiver.kernel.org>; Mon, 27 Jul 2020 22:14:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgG0WOo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Jul 2020 18:14:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgG0WOo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Jul 2020 18:14:44 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24422C061794
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2020 15:14:44 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0EFFE44A;
        Mon, 27 Jul 2020 22:14:42 +0000 (UTC)
Date:   Mon, 27 Jul 2020 16:14:41 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Vegard Nossum <vegard.nossum@oracle.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: path-lookup: fix HTML entity mojibake
Message-ID: <20200727161441.42b0e1c5@lwn.net>
In-Reply-To: <20200727114527.23944-1-vegard.nossum@oracle.com>
References: <20200727114527.23944-1-vegard.nossum@oracle.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 27 Jul 2020 13:45:27 +0200
Vegard Nossum <vegard.nossum@oracle.com> wrote:

> Two cases of "<" somehow turned into "&lt;". I noticed it on
> <https://www.kernel.org/doc/html/latest/filesystems/path-lookup.html>.
> 
> I've verified that the HTML output is correct with this patch.
> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  Documentation/filesystems/path-lookup.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/filesystems/path-lookup.rst b/Documentation/filesystems/path-lookup.rst
> index f46b05e9b96c8..1a8fae5036b34 100644
> --- a/Documentation/filesystems/path-lookup.rst
> +++ b/Documentation/filesystems/path-lookup.rst
> @@ -76,10 +76,10 @@ tempting to consider that to have an empty final component.  In many
>  ways that would lead to correct results, but not always.  In
>  particular, ``mkdir()`` and ``rmdir()`` each create or remove a directory named
>  by the final component, and they are required to work with pathnames
> -ending in "``/``".  According to POSIX_
> +ending in "``/``".  According to POSIX_:
>  
> -  A pathname that contains at least one non- &lt;slash> character and
> -  that ends with one or more trailing &lt;slash> characters shall not
> +  A pathname that contains at least one non-<slash> character and
> +  that ends with one or more trailing <slash> characters shall not

Strange, I wonder how that got through...applied thanks.  

I've applied the other two as well.

jon
