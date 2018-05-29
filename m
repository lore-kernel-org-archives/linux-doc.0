Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 814157D043
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 May 2018 22:59:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S967945AbeE2W7C (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 May 2018 18:59:02 -0400
Received: from mail-pf0-f193.google.com ([209.85.192.193]:43195 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967857AbeE2W7A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 May 2018 18:59:00 -0400
Received: by mail-pf0-f193.google.com with SMTP id j20-v6so7986957pff.10;
        Tue, 29 May 2018 15:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8NRIKriKJnifkGevfGQJqAtodi3Lx+Jx0nPowNtFjYw=;
        b=oGAfFD2biPKRav7joA6i5Hwn2D1BnZAwwDHCixx+LWDm0a2daaIV5qnMf4h4fZ1w/z
         EYOHqMxTDc4pnsJSyYYZKkI1f25roEXfv+BNJjccGaJSABl5lJKGaC8SY2YY6zsh+9vQ
         7x2OaJUth4s2vvM+aD0xCnglyabnN0vEdM+WF+9D4ba3CMw5iAjhh15tUlBLhFY60wOu
         pLnJ6c1h7QA24JSZK0fXtb2vZyf14/IgRUR8XHlqiZurGBOI7eVqCzPCIKXY8CYnvnOW
         +RdhCgh1q3fPgJKH3USngpEmBtXyL/lUYtZ6gyPJoTnR1LRWYl+HGaLxyhDSgqdoR6yy
         l37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8NRIKriKJnifkGevfGQJqAtodi3Lx+Jx0nPowNtFjYw=;
        b=XvWDFc+dGzltKAv6Wwom2ZqrKHn2ROj6Ki2lFawdxosZflB1deSJh8lDNvFkODHLw4
         RZXdJss9XOB6GVns/ya9ZnWFltJEx+AxeRqOBWbqVYcERvvmaqAW7Vxzbi9AIBuPuS32
         fucuLuWqRstvZIziSzt1hbTkY5uQxCM4AeeDUxzd6KL5tbcTPfSEpZ5fMyzev6mDn/jz
         r3Ph7a320mHbK5irCOxe2mHQ7lAGIF5AI5bOKA2oka6Zo5L8TFuYfTjS3Kn0zz9fMzK3
         XaBLbr+djx5iSybZk1I/WIis//V+fVVydutxS3wUIswrSHhrXX3zNkHuuZcqQp8QdPTl
         fb/Q==
X-Gm-Message-State: ALKqPwcp53H4s0TE7XWQNAChr+VjhjfQ9zT/iE0pcMPcqgFXXhcNFe99
        O4gv3hSOi32h20v77GkPUb8=
X-Google-Smtp-Source: ADUXVKJT8H5bp3E0P6WkXNJWgSkeIvvAlsf4GAOYBUnn5lTsAWRyrl5ZLBCjgN45AiMT7pIoeH+cJw==
X-Received: by 2002:a63:a807:: with SMTP id o7-v6mr247208pgf.83.1527634739623;
        Tue, 29 May 2018 15:58:59 -0700 (PDT)
Received: from dtor-ws ([2620:0:1000:1511:8de6:27a8:ed13:2ef5])
        by smtp.gmail.com with ESMTPSA id a9-v6sm12530455pgt.57.2018.05.29.15.58.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 May 2018 15:58:58 -0700 (PDT)
Date:   Tue, 29 May 2018 15:58:56 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Martin Kepplinger <martink@posteo.de>
Cc:     corbet@lwn.net, gregkh@linuxfoundation.org, logang@deltatee.com,
        stefanha@redhat.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH 2/2] Documentation: devices.txt: remove the mk712
 touchscreen device from the list
Message-ID: <20180529225856.GE167092@dtor-ws>
References: <20180402125551.13641-1-martink@posteo.de>
 <20180402125551.13641-2-martink@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180402125551.13641-2-martink@posteo.de>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 02, 2018 at 02:55:51PM +0200, Martin Kepplinger wrote:
> The input/touchscreen/mk712.c driver has been rewritten for the common
> input event system. in 2005. There shouldn't a special device node be
> created anymore.
> 
> Signed-off-by: Martin Kepplinger <martink@posteo.de>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Jon, can you please pick it up?

> ---
> 
> Please review this by looking at the driver too. Thanks,
> 
>                     martin
> 
> 
> 
>  Documentation/admin-guide/devices.txt | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/devices.txt b/Documentation/admin-guide/devices.txt
> index 4ec843123cc3..fb39bbf0789a 100644
> --- a/Documentation/admin-guide/devices.txt
> +++ b/Documentation/admin-guide/devices.txt
> @@ -259,7 +259,6 @@
>  		 11 = /dev/vrtpanel	Vr41xx embedded touch panel
>  		 13 = /dev/vpcmouse	Connectix Virtual PC Mouse
>  		 14 = /dev/touchscreen/ucb1x00  UCB 1x00 touchscreen
> -		 15 = /dev/touchscreen/mk712	MK712 touchscreen
>  		128 = /dev/beep		Fancy beep device
>  		129 =
>  		130 = /dev/watchdog	Watchdog timer port
> -- 
> 2.16.2
> 

-- 
Dmitry
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
