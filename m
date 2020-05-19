Return-Path: <SRS0=Z/GS=7B=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E5CC433DF
	for <linux-doc@archiver.kernel.org>; Tue, 19 May 2020 13:16:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CBBB206D4
	for <linux-doc@archiver.kernel.org>; Tue, 19 May 2020 13:16:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbgESNQD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 May 2020 09:16:03 -0400
Received: from mx2.suse.de ([195.135.220.15]:50650 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727057AbgESNQC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 19 May 2020 09:16:02 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id C7913AA4F;
        Tue, 19 May 2020 13:16:03 +0000 (UTC)
Date:   Tue, 19 May 2020 15:15:59 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net, kernel@collabora.com,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] docs: printk-basics: update the pr_debug() kerneldoc
Message-ID: <20200519131558.GM7340@linux-b0ei>
References: <20200422140334.23595-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200422140334.23595-1-ricardo.canuelo@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed 2020-04-22 16:03:34, Ricardo Cañuelo wrote:
> This updates the kerneldoc comment for the pr_debug() macro to describe
> the new set of kernel config options it's affected by.
> 
> It also simplifies the description of the pr_debug() and pr_devel()
> macros in printk-basics.rst, forwarding the reader to the function
> reference.
> 
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> ---
> Some background:
> 
> The previous patch I sent to add kerneldocs to printk.h:
> https://lore.kernel.org/linux-doc/20200420171544.3c443e36@lwn.net/
> 
> conflicted with this other patch:
> https://lkml.org/lkml/2020/4/20/1320
> 
> during the manual linux-next merge. Stephen Rothwell fixed the conflict
> but the description of what pr_debug() does needed to be updated to
> reflect the changes introduced in the patch by Orson Zhai.
> 
> Tested on linux-next with make htmldocs and make pdfdocs.
> 
>  Documentation/core-api/printk-basics.rst | 4 ++--
>  include/linux/printk.h                   | 7 ++++---
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/core-api/printk-basics.rst b/Documentation/core-api/printk-basics.rst
> index 563a9ce5fe1d..84c853e17200 100644
> --- a/Documentation/core-api/printk-basics.rst
> +++ b/Documentation/core-api/printk-basics.rst
> @@ -100,8 +100,8 @@ would prefix every pr_*() message in that file with the module and function name
>  that originated the message.
>  
>  For debugging purposes there are also two conditionally-compiled macros:
> -pr_debug() and pr_devel(), which are compiled-out unless ``DEBUG`` (or
> -also ``CONFIG_DYNAMIC_DEBUG`` in the case of pr_debug()) is defined.
> +pr_debug() and pr_devel(), which are compiled-out depending on the kernel
> +configuration options (See the function reference below for more info).
>  
>  
>  Function reference
> diff --git a/include/linux/printk.h b/include/linux/printk.h
> index 768ac6bc637d..dab23bcbdeb0 100644
> --- a/include/linux/printk.h
> +++ b/include/linux/printk.h
> @@ -408,9 +408,10 @@ extern int kptr_restrict;
>   * @fmt: format string
>   * @...: arguments for the format string
>   *
> - * This macro expands to dynamic_pr_debug() if CONFIG_DYNAMIC_DEBUG is
> - * set. Otherwise, if DEBUG is defined, it's equivalent to a printk with
> - * KERN_DEBUG loglevel. If DEBUG is not defined it does nothing.
> + * This macro expands to dynamic_pr_debug() if CONFIG_DYNAMIC_DEBUG is set or if
> + * CONFIG_DYNAMIC_DEBUG_CORE and DYNAMIC_DEBUG_MODULE are both set.  Otherwise,
> + * if DEBUG is defined, it's equivalent to a printk with KERN_DEBUG loglevel.
> + * If none of the above is defined it does nothing.
>   *
>   * It uses pr_fmt() to generate the format string (dynamic_pr_debug() uses
>   * pr_fmt() internally).
> -- 
> 2.18.0

It is pity that you did not add other printk maintainers into CC for
the patches adding this documentation and comments. I was sick
last two months and was not able to check mails.

Adding them now. Note that the following patch is already in
linux-next, see
https://lore.kernel.org/r/20200403093617.18003-1-ricardo.canuelo@collabora.com

One note about printk-basics.rst. It should mention that pr_*()
variants are preferred over the generic printk(KERN_* ).

Otherwise, I do not see anything critical.


Well, I have mixed feelings about this type of documentation. It might explain
some things that are less obvious, for example, the meaning of
pr_fmt(). On the other hand:

  + It might be complicated to keep it in sync.

  + I wonder how many developers would actually read it.

  + The doc comments in include/linux/prinkt.h are really
    long and describe obvious things.

By other words. These comments make the headers and sources hard to
read. And at least in this particular case, the gain is questionable.

Best Regards,
Petr
