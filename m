Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCA8C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 13 Oct 2022 17:45:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbiJMRpX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Oct 2022 13:45:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiJMRpW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Oct 2022 13:45:22 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E7963363
        for <linux-doc@vger.kernel.org>; Thu, 13 Oct 2022 10:45:21 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id g8-20020a17090a128800b0020c79f987ceso5569218pja.5
        for <linux-doc@vger.kernel.org>; Thu, 13 Oct 2022 10:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZkeUyFWIjLvxMFg7brz1pr43wrdZfuQ/bNA+wt0kz0=;
        b=Oyl3aTOEOtogOBtfUuv1T7whUHgFt3/b5KjJ+KNujD3CVmO9CECkcsWeNZqm2l79Pj
         7c/GDjpcT7G8wiRhUBB7V0tkoB3v2eQ6bbAAcm3iRIBIivASknKeDN49CgJ1Cw2lmfdJ
         rLjngG7sy8WYzMgRqA1dphHW+q1jBqkQ1r67mZxIxu/0CZitoIpbTNM0nC/89yxK3S0a
         Ak+B7SszYIlKZFueImPugmAh1C3IuuKJuqWv/HpWMaQy3faF6gcaexP1r/s7u/xYm7ky
         VkVt57MuK1ONXSu/dh8cxswOhunxB1Yjz/u17N501OnLF71QurkyfGssa9XBijY5WUW+
         2FMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZkeUyFWIjLvxMFg7brz1pr43wrdZfuQ/bNA+wt0kz0=;
        b=rCurZx+0XRbil2irX7dP09dyVNIARBeaswvd15Zp/9s0IWlxtHBZs719QVkjSi2KFE
         /5jjSbpafwmn27ssdsknzfun7hQoMxflSWZUN7wCVjK2913n+7/THavHJTSaJ9m4zPFh
         1QBErF/zvHFAn9oiJYN61YCOkZHDcczZJwXSY7MPoeLMjMX49Ea46oGtLph4z2Y4tY59
         H4F0wac03uqM+4MRt+vD1/ICTcSv0dpxol5VGtKX4KNH6/HrQBqRRWsI+km2w91txgzm
         B8JYUqJTw6ZyFnMtlHD5USBed3PcgG+2ofFUh+ZpmahNzK5mEAJ3XDOR4pIXk2SkrAU1
         kSqA==
X-Gm-Message-State: ACrzQf0R9BbUAWVNpe/+J9LZa8HvUMg+7FuEZOH4D99FpJiDHOhNiccH
        e3iznsk6k4sNkoTRREQBWtJYdYfZTJSG88mVfaKMcg==
X-Google-Smtp-Source: AMsMyM48uQktZ+YTsNROG9cNsn/6MzYVYWhM8oCuC4mWFtmHh5UhmPWtU9OkeE0rTLc4j03w7LrjDZpeEoLncjJHAKc=
X-Received: by 2002:a17:90b:3a88:b0:209:f35d:ad53 with SMTP id
 om8-20020a17090b3a8800b00209f35dad53mr12593187pjb.102.1665683120401; Thu, 13
 Oct 2022 10:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221012181841.333325-1-masahiroy@kernel.org>
In-Reply-To: <20221012181841.333325-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 13 Oct 2022 10:45:09 -0700
Message-ID: <CAKwvOdn-0rp6NCVOrQM9Xe0zcTshKbyorpkx5WzQSTu1o45AcA@mail.gmail.com>
Subject: Re: [PATCH] Documentation: raise minimum supported version of
 binutils to 2.25
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 12, 2022 at 11:19 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Binutils 2.23 was released in 2012. Almost 10 years old.
>
> We already require GCC 5.1, released in 2015.
>
> Bump the binutils version to 2.25, which was released one year before
> GCC 5.1.
>
> With this applied, some subsystems can start to clean up code.
> Examples:
>   arch/arm/Kconfig.assembler
>   arch/mips/vdso/Kconfig
>   arch/powerpc/Makefile
>   arch/x86/Kconfig.assembler

Thanks for the patch! Indeed, it looks like 2.25 is from 2014.
https://ftp.gnu.org/gnu/binutils/
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  Documentation/process/changes.rst | 4 ++--
>  scripts/min-tool-version.sh       | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> index 9844ca3a71a6..ef540865ad22 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -35,7 +35,7 @@ Rust (optional)        1.62.0           rustc --version
>  bindgen (optional)     0.56.0           bindgen --version
>  GNU make               3.82             make --version
>  bash                   4.2              bash --version
> -binutils               2.23             ld -v
> +binutils               2.25             ld -v
>  flex                   2.5.35           flex --version
>  bison                  2.0              bison --version
>  pahole                 1.16             pahole --version
> @@ -119,7 +119,7 @@ Bash 4.2 or newer is needed.
>  Binutils
>  --------
>
> -Binutils 2.23 or newer is needed to build the kernel.
> +Binutils 2.25 or newer is needed to build the kernel.
>
>  pkg-config
>  ----------
> diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
> index 8766e248ffbb..4e5b45d9b526 100755
> --- a/scripts/min-tool-version.sh
> +++ b/scripts/min-tool-version.sh
> @@ -14,7 +14,7 @@ fi
>
>  case "$1" in
>  binutils)
> -       echo 2.23.0
> +       echo 2.25.0
>         ;;
>  gcc)
>         echo 5.1.0
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers
