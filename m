Return-Path: <SRS0=tD+q=DG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C8AC4727C
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 23:10:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41F3B20897
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 23:10:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ov5uqTvY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728511AbgI2XKf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Sep 2020 19:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728291AbgI2XKf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 19:10:35 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83508C061755;
        Tue, 29 Sep 2020 16:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=R3SUK8wQa6bfxKA9v51XX6INKEvLY/XZhJdqmyDu9e0=; b=ov5uqTvYiA1c7+n4IWI/Ter9cJ
        lTDf4ZbTBpwFtwOZkYpxgjCGkoeRGI8JiuZ2y4rSaGjXb7v2knc5Q0XBZ2Jhj+pqQthSPdA+SQn5h
        kaVCD7igGibRwJEnb3Afs/FgWnieuQQthZKSGcN0TYLfL/yvA1it3xC1uXHE2T+i0U7QeHb5y3VOx
        cxNhAd3C1fLDrlq1jxrpEKvDAm1tvel28s2bggjAaU41CdqF3iKK560mSTz2HFX+3OXn743FsXZqi
        W+mL4DfPVAZR1kDaNyQYC+jqZMhQAGIbCWnR1oXJX0i5V3Nat6jV9iDQ3s2Q9mxgD75RPuzgg5mq8
        f/YSd2dQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kNOlT-0005Qj-VX; Tue, 29 Sep 2020 23:10:33 +0000
Subject: Re: [PATCH] docs: programming-languages: refresh blurb on clang
 support
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
References: <20200929211936.580805-1-ndesaulniers@google.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1925c4b7-2764-2b25-6aa4-a5001c8056f8@infradead.org>
Date:   Tue, 29 Sep 2020 16:10:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200929211936.580805-1-ndesaulniers@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/29/20 2:19 PM, Nick Desaulniers wrote:
> Building the kernel with Clang doesn't rely on third party patches, and
> has not for a few years now.
> 
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  Documentation/process/programming-language.rst | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/process/programming-language.rst b/Documentation/process/programming-language.rst
> index e5f5f065dc24..63af142d64ec 100644
> --- a/Documentation/process/programming-language.rst
> +++ b/Documentation/process/programming-language.rst
> @@ -6,14 +6,15 @@ Programming Language
>  The kernel is written in the C programming language [c-language]_.
>  More precisely, the kernel is typically compiled with ``gcc`` [gcc]_
>  under ``-std=gnu89`` [gcc-c-dialect-options]_: the GNU dialect of ISO C90
> -(including some C99 features).
> +(including some C99 features). ``clang`` [clang]_ is also supported, see docs

Drop duplicated "docs" before here or after here.

checkpatch should have caught that.

> +docs on :ref:`Building Linux with Clang/LLVM <kbuild_llvm>`.
>  
>  This dialect contains many extensions to the language [gnu-extensions]_,
>  and many of them are used within the kernel as a matter of course.
>  
> -There is some support for compiling the kernel with ``clang`` [clang]_
> -and ``icc`` [icc]_ for several of the architectures, although at the time
> -of writing it is not completed, requiring third-party patches.
> +There is some support for compiling the kernel with ``icc`` [icc]_ for several
> +of the architectures, although at the time of writing it is not completed,
> +requiring third-party patches.
>  
>  Attributes
>  ----------
> 

thanks.
-- 
~Randy

