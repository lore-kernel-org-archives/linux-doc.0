Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5A87E7D584
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 18:08:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbeITXwr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 19:52:47 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41022 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727252AbeITXwq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Sep 2018 19:52:46 -0400
Received: by mail-pl1-f194.google.com with SMTP id b12-v6so4711572plr.8
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 11:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hhBbcYIjWMAfcE0bX5sqVlG5FUKTWnKEZWytPAJUITw=;
        b=A06jq5rAZLo59KK26eml9lAgrX1M/6L9+SFxKcecxH+0xsqikiEzHPDfedA4XjXKYn
         4Cjo6W7pfCeEoZT5iTLaqzH2ZFC3X/RCJ6fT+oy9DLMugWJXOjbknG7YsHUe1pSlKkLO
         OJZjJ3a4RGJ6hCJfQnmnk8wCeAXxCO0Q6mrxrTvUS7uaNkATCkRRkLuJo0rU4B5kMdtt
         spQV/177YWr9vjSV3T1CGbh969r0hjUhPoXPlPDkY+x2NX6eA1aQ/ARR1eg1EonE/tXt
         WbNaEBz1GKtBJ/UVM8sJPmCW8nieuXT5iSoNzq/DrYHs+3M0KeuRbfkDMVhVFfVHr7if
         YTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hhBbcYIjWMAfcE0bX5sqVlG5FUKTWnKEZWytPAJUITw=;
        b=Pv2ibqWnv1I2DyAHvL8vVLt3nKspCGQfrY8YY4w0GEBcPDVXgI7WcmOTxFHixb3Anq
         l850aH9XFcYLP5GbbiAc5HWg0GQorPSVJDnfytFL+k47gwgpxEhcWMjzo+wr0yJjj6ui
         RaoGlL7O4++Uv+qj33OKJANZnF+3n+S920mkVmMbVzEB6wynd4MjiqU5g+eGce+jCXZG
         6klj4p4RWaBftB3+y3Tzr8XNDkuR09SqVdgqk31VH2DgouMLiE0kJ41RzoQLrLI0iwlz
         z5qAD0rMTvOIzOGkuqrM86mX3ZA0FITr9x6VDwbQUFYy6dAjnE4sYbUC9kwOZaet3fyk
         G7ow==
X-Gm-Message-State: APzg51AHQhTP2vR/lwnhL1+y76/PcBRMqsPBsLS93JsQDCzWUr3KQl5D
        AhhfHWyYAesL9/3U9RfpyHPgK0KEmFG0t3wIm3o0nQ==
X-Google-Smtp-Source: ANB0VdaznTZy34HFm3rogaG8/cuxr2bVQ1QNYze5s6OL0TMb0Tfon2hhN5If2mES5Ue7ReCCj8Izo30zi19Uite0z6o=
X-Received: by 2002:a17:902:708a:: with SMTP id z10-v6mr41107122plk.229.1537466884304;
 Thu, 20 Sep 2018 11:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <20180920172301.21868-1-miguel.ojeda.sandonis@gmail.com> <20180920172301.21868-13-miguel.ojeda.sandonis@gmail.com>
In-Reply-To: <20180920172301.21868-13-miguel.ojeda.sandonis@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 20 Sep 2018 11:07:53 -0700
Message-ID: <CAKwvOd=0GZi5M3ZRxps+Y1Cvbk=h-VOMM4+cBzHx2-LGO1cLSg@mail.gmail.com>
Subject: Re: [PATCH v5 12/15] Compiler Attributes: add support for __nonstring
 (gcc >= 8)
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>, adilger.kernel@dilger.ca,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>, rostedt@goodmis.org,
        mchehab+samsung@kernel.org, olof@lxom.net,
        konstantin@linuxfoundation.org,
        "David S. Miller" <davem@davemloft.net>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Kees Cook <keescook@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>,
        Paul Lawrence <paullawrence@google.com>,
        sandipan@linux.vnet.ibm.com,
        Andrey Konovalov <andreyknvl@google.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Will Deacon <will.deacon@arm.com>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        paul.burton@mips.com, David Rientjes <rientjes@google.com>,
        w@1wt.eu, msebor@gmail.com, sparse@chrisli.org,
        Jonathan Corbet <corbet@lwn.net>, tytso@mit.edu,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>, joe@perches.com,
        Arnd Bergmann <arnd@arndb.de>, asmadeus@codewreck.org,
        Stefan Agner <stefan@agner.ch>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-doc@vger.kernel.org, linux-ext4@vger.kernel.org,
        linux-sparse@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 20, 2018 at 10:23 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> From the GCC manual:
>
>   nonstring
>
>     The nonstring variable attribute specifies that an object or member
>     declaration with type array of char, signed char, or unsigned char,
>     or pointer to such a type is intended to store character arrays that
>     do not necessarily contain a terminating NUL. This is useful in detecting
>     uses of such arrays or pointers with functions that expect NUL-terminated
>     strings, and to avoid warnings when such an array or pointer is used as
>     an argument to a bounded string manipulation function such as strncpy.
>
>   https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html
>
> This attribute can be used for documentation purposes (i.e. replacing
> comments), but it is most helpful when the following warnings are enabled:
>
>   -Wstringop-overflow
>
>     Warn for calls to string manipulation functions such as memcpy and
>     strcpy that are determined to overflow the destination buffer.
>
>     [...]
>
>   -Wstringop-truncation
>
>     Warn for calls to bounded string manipulation functions such as
>     strncat, strncpy, and stpncpy that may either truncate the copied
>     string or leave the destination unchanged.
>
>     [...]
>
>     In situations where a character array is intended to store a sequence
>     of bytes with no terminating NUL such an array may be annotated with
>     attribute nonstring to avoid this warning. Such arrays, however,
>     are not suitable arguments to functions that expect NUL-terminated
>     strings. To help detect accidental misuses of such arrays GCC issues
>     warnings unless it can prove that the use is safe.
>
>   https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html
>
> Signed-off-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> ---
>  include/linux/compiler_attributes.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
> index f0f9fc398440..6b28c1b7310c 100644
> --- a/include/linux/compiler_attributes.h
> +++ b/include/linux/compiler_attributes.h
> @@ -34,6 +34,7 @@
>  # define __GCC4_has_attribute___externally_visible__  1
>  # define __GCC4_has_attribute___noclone__             1
>  # define __GCC4_has_attribute___optimize__            1
> +# define __GCC4_has_attribute___nonstring__           0
>  # define __GCC4_has_attribute___no_sanitize_address__ (__GNUC_MINOR__ >= 8)
>  #endif
>
> @@ -181,6 +182,19 @@
>   */
>  #define   noinline                      __attribute__((__noinline__))
>
> +/*
> + * Optional: only supported since gcc >= 8
> + * Optional: not supported by clang
> + * Optional: not supported by icc
> + *
> + *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html#index-nonstring-variable-attribute
> + */
> +#if __has_attribute(__nonstring__)
> +# define __nonstring                    __attribute__((__nonstring__))
> +#else
> +# define __nonstring
> +#endif
> +
>  /*
>   *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-noreturn-function-attribute
>   * clang: https://clang.llvm.org/docs/AttributeReference.html#noreturn
> --
> 2.17.1
>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

-- 
Thanks,
~Nick Desaulniers
