Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A7FC17D90F
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 Oct 2019 16:57:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfJBQ51 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 Oct 2019 12:57:27 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45739 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbfJBQ51 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Oct 2019 12:57:27 -0400
Received: by mail-pg1-f193.google.com with SMTP id q7so12142451pgi.12
        for <linux-doc@vger.kernel.org>; Wed, 02 Oct 2019 09:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xBf6Iq87Am+uWXkoyURVokzI/jkiPMoVeX7zXuRQ8TI=;
        b=nLwdpyl1l3rlvnQC80RK8nEl8xUUzFG8Kro30rravmhtLa3MnX6fGD3PjF8gvhGsYi
         pUoZqy1PD2XKy4x2LehNmKT4IwJcqLDIG+jU9QhTuyXuSGy3KZnWiu1eyDBzxGn5Kez9
         kSNNiU8jEJNU3edorx3VAq6NZORWoqhONlLbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xBf6Iq87Am+uWXkoyURVokzI/jkiPMoVeX7zXuRQ8TI=;
        b=XiPsj+RaiJpvyjL8VRy6uQXVP8c5y96FjAQgPPyeISkoNxvNE/THngGibqSQUeAT+f
         4Yn0Sdof+GDLMXLvDIMtn31Oa0Jyy2jBYVjG8tRTOavi/g6GU+aj9eYQrJ0la7vOUDJp
         KLG9RocjcBiFELrp6+Bx1LKbPiPIsDlNDDQ4u3KoArfoW8+3NTKhXP8Zk8NzU1NrtXCd
         3HzUIggCq73UUNjD9im4OS/uD1Azt+t3m3W0Gjl7Vz8gzhnZ9bFM8Jxvf4wMbnbGbG0i
         R7wlYGjh51PAJ3ZbcY0aKZ2PvKCOY9J05U//+Sz5Ygx4ZluvASIonsx9sLqTkuIqsNAx
         Y8Tg==
X-Gm-Message-State: APjAAAU7z4qSnN6Lf84TquZJ62gvQH2hoBAnhUFmLaAiURRxVcxLqrlY
        M37HxDSAI02VPbqAioSwx1+bRUEtjSI=
X-Google-Smtp-Source: APXvYqx8i5vePZozwlwDq9XNQpE70Mof93lVkm7F+g3T2LLix1rWF8zCmnjClmWJXsr4J6jownV73g==
X-Received: by 2002:a17:90a:28a5:: with SMTP id f34mr5265840pjd.93.1570035446512;
        Wed, 02 Oct 2019 09:57:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d6sm22984568pgj.22.2019.10.02.09.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 09:57:25 -0700 (PDT)
Date:   Wed, 2 Oct 2019 09:57:24 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] docs: Programmatically render MAINTAINERS into
 ReST
Message-ID: <201910020953.BEECE58B@keescook>
References: <20191001182532.21538-1-keescook@chromium.org>
 <20191002102535.1e518877@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002102535.1e518877@lwn.net>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 02, 2019 at 10:25:35AM -0600, Jonathan Corbet wrote:
> On Tue,  1 Oct 2019 11:25:30 -0700
> Kees Cook <keescook@chromium.org> wrote:
> 
> > v1: https://lore.kernel.org/lkml/20190924230208.12414-1-keescook@chromium.org
> > 
> > v2: fix python2 utf-8 issue thanks to Jonathan Corbet
> > 
> > 
> > Commit log from Patch 2 repeated here for cover letter:
> > 
> > In order to have the MAINTAINERS file visible in the rendered ReST
> > output, this makes some small changes to the existing MAINTAINERS file
> > to allow for better machine processing, and adds a new Sphinx directive
> > "maintainers-include" to perform the rendering.
> 
> OK, I've applied this.  Some notes, none of which really require any
> action...
> 
> It adds a new warning:
> 
>   /stuff/k/git/kernel/MAINTAINERS:40416: WARNING: unknown document: ../misc-devices/xilinx_sdfec           
> 
> I wonder if it's worth checking to be sure that documents referenced in
> MAINTAINERS actually exist.  OTOH, things as they are generate a warning,
> which is what we want anyway.

Yup, I saw this when I was doing the work and already sent an email
last week about it but got no response:
https://lore.kernel.org/lkml/201909231450.4C6CF32@keescook/

I suppose I could literally just send the missing file instead?

> I did various experiments corrupting the MAINTAINERS file and got some
> fairly unphotogenic results.  Again, though, I'm not sure that adding a
> bunch of code to generate warnings is really worth the trouble.
> 
> The resulting HTML file is 3.4MB and definitely makes my browser sweat when
> loading it :)

Yes -- I think a big part of this is the amplification of the subsystem
links (they're in the navigation right-hand side too), but I think that
making them reachable externally was important so a maintainer can have
a stable URL to point to their MAINTAINTERS file entry.

> It adds about 20 seconds to a full "make htmldocs" build, which takes just
> over 3 minutes on the system in question.  So a 10% overhead, essentially.

Yup, it's a lot to parse, but it *seems* to be caching it correctly.

> All told, it does what it's expected to do.  Thanks for doing this.

Cool! Thanks for the help on it. :)

-- 
Kees Cook
