Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5AC557D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  6 Feb 2019 20:40:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbfBFUkz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 6 Feb 2019 15:40:55 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44389 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbfBFUky (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Feb 2019 15:40:54 -0500
Received: by mail-ed1-f68.google.com with SMTP id y56so7077426edd.11
        for <linux-doc@vger.kernel.org>; Wed, 06 Feb 2019 12:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=TcFr+rQH0odkIUor3u2H3BNmJOToPZn9FCa6jQJ2Gnw=;
        b=fJY0sOQoftTHwboF3Q7SoO7K6oWcafFIgPZk1Yr5XfGnGIfXTCZ/0jgOHU5jCG1efZ
         fKgl4KDa3tRavFi8d6rg90k2oBTQ0aKGfUXoYYNE2GC8IGH8xBJF9mVhYnTbuD8k1JRL
         EVO6YJrzbc/FNT+B/xtYcpTa4Vz5Zt9/bl61c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=TcFr+rQH0odkIUor3u2H3BNmJOToPZn9FCa6jQJ2Gnw=;
        b=ulVfIAhWygbxgEOm7FwQiyJVvT7SUHONnRhGAPWFOZf+GiC/2RTWfHmdFD9CocKCMf
         TLGmpgQb0r65WSKG2ZvcMOXrt6z4yd+2vb65Yo0MsU8nZ8dPsgtLtpXOA42N7HQNjhDN
         teKTtCcpQFRVOoJ2qq0cOz5c54aRMIye3la/Aqjuhdx6TPk4htEV9tVntd7QGEaFL/oR
         8TvHoGZbe4YXsdDnwRjxRbCyg6TxlFKfLF6Z944XBOU/aPYBkigG93GtKkH1qcXDwnAh
         MdYOOXgOWs12vXOboM+tT8LF23Il9pR6i0XihPWpMHvYiJUHLcU9KlkZJ+h3l+kPkuiZ
         yMvA==
X-Gm-Message-State: AHQUAua0mfhwkzJ2rTrwO259iDrdO1KxYV9r0bPC68fyCPisuwunJ8r9
        kRxB1oKFpiTy2r0fAOEpAk34qg==
X-Google-Smtp-Source: AHgI3IasITbSYX/F3S9Wr7E8dQsgQCY9Ndyo3yqCL88fyvxG0rfEOGdjwd4PnqOjIKWsQECuipjSzQ==
X-Received: by 2002:a50:9724:: with SMTP id c33mr9712260edb.288.1549485652408;
        Wed, 06 Feb 2019 12:40:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id a27sm6289951eda.65.2019.02.06.12.40.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Feb 2019 12:40:51 -0800 (PST)
Date:   Wed, 6 Feb 2019 21:40:49 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Shayenne Moura <shayenneluzmoura@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/doc: Remove solved "VBlank issues"
Message-ID: <20190206204049.GM3271@phenom.ffwll.local>
Mail-Followup-To: Shayenne Moura <shayenneluzmoura@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190206193157.3b53ipdxtcqc4hv4@smtp.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190206193157.3b53ipdxtcqc4hv4@smtp.gmail.com>
X-Operating-System: Linux phenom 4.19.0-1-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 06, 2019 at 05:31:57PM -0200, Shayenne Moura wrote:
> Remove the list of broken tests on VKMS solved by patchset
> https://patchwork.freedesktop.org/series/55994/
> 
> Signed-off-by: Shayenne Moura <shayenneluzmoura@gmail.com>

Excellent work from you!

> ---
>  Documentation/gpu/vkms.rst | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 7dfc349a4508..61586fc861bb 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -23,17 +23,6 @@ CRC API Improvements
>  - Add igt test to check extreme alpha values i.e. fully opaque and fully
>    transparent (intermediate values are affected by hw-specific rounding modes).
>  
> -Vblank issues
> --------------
> -
> -Some IGT test cases are failing. Need to analyze why and fix the issues:
> -
> -- plain-flip-fb-recreate
> -- plain-flip-ts-check
> -- flip-vs-blocking-wf-vblank
> -- plain-flip-fb-recreate-interruptible
> -- flip-vs-wf_vblank-interruptible

Patch applied to drm-misc-next, thanks for your patch.
-Daniel

> -
>  Runtime Configuration
>  ---------------------
>  
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
