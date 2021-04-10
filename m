Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 534D8C433ED
	for <linux-doc@archiver.kernel.org>; Sat, 10 Apr 2021 08:39:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11B1861185
	for <linux-doc@archiver.kernel.org>; Sat, 10 Apr 2021 08:39:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbhDJIjR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 10 Apr 2021 04:39:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:58836 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229494AbhDJIjR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 10 Apr 2021 04:39:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2466461056;
        Sat, 10 Apr 2021 08:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1618043941;
        bh=UyHmHG+Po/OG+i/Mf0u537ik73dkRF3yWtqnkvaP+cE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RnaiOVW7ea64DoA41HeGR4t9g8HumiK+Fo6sNxsxOM9lIT2qMqGEldgU7FxYC48Sn
         U33hq+doThdhscIt1CsqnmsGFyMckYAStDodhCfSs+VciOq8l4Ea3EcF5wFNFmHg6K
         SfTpwrZjIYpVHMxRcKivb8BWhTE+shUJeoi5iC+w=
Date:   Sat, 10 Apr 2021 10:38:59 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Luiz Sampaio <sampaio.ime@gmail.com>
Cc:     zbr@ioremap.net, corbet@lwn.net, rikard.falkeborn@gmail.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 3/6] w1: ds2438: fixed a coding style issue
Message-ID: <YHFkI2h6ArKoJsq7@kroah.com>
References: <20210409030942.441830-1-sampaio.ime@gmail.com>
 <20210409031533.442123-1-sampaio.ime@gmail.com>
 <20210409031533.442123-4-sampaio.ime@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409031533.442123-4-sampaio.ime@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 09, 2021 at 12:15:30AM -0300, Luiz Sampaio wrote:
> Changed the permissions to preferred octal style.
> 
> Signed-off-by: Luiz Sampaio <sampaio.ime@gmail.com>
> ---
>  drivers/w1/slaves/w1_ds2438.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/w1/slaves/w1_ds2438.c b/drivers/w1/slaves/w1_ds2438.c
> index 56e53a748059..ccb06b8c2d78 100644
> --- a/drivers/w1/slaves/w1_ds2438.c
> +++ b/drivers/w1/slaves/w1_ds2438.c
> @@ -388,7 +388,7 @@ static ssize_t vdd_read(struct file *filp, struct kobject *kobj,
>  	return ret;
>  }
>  
> -static BIN_ATTR(iad, S_IRUGO | S_IWUSR | S_IWGRP, iad_read, iad_write, 0);
> +static BIN_ATTR_RW(iad, 0664, iad_write, 0);

You obviously did not build this commit :(

And you did more than just fix a "coding style issue".

thanks,

greg k-h
