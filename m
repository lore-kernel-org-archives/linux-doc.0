Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 748A77D581
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 20:14:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727232AbeIUB7O (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 21:59:14 -0400
Received: from mail-yb1-f196.google.com ([209.85.219.196]:40298 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbeIUB7O (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Sep 2018 21:59:14 -0400
Received: by mail-yb1-f196.google.com with SMTP id w7-v6so4478028ybm.7
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 13:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=YocOBZnb5FubGF2oF328ra0Xl0q6v8qLlmnhyCvaydE=;
        b=T1HKP7MtlJGRghrDPBWE4M5k0+mvCcZ5z/oqL1Cx0pE+ujAXmVl9+8FoQDMeJy2Bze
         vqUgBcn+Iy2JSY/E4BOE5H3dHg9Mjy/qfHE1J5AqthUXcFBnSal/K1qXHgECXsXAukrQ
         iC7FJY1WFa14Uc/bR0+ZhKER/WdQSKcDz5UOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=YocOBZnb5FubGF2oF328ra0Xl0q6v8qLlmnhyCvaydE=;
        b=mtYTY8/wwF4OwOdxa0wAOuM6HwGZQgktcUnnhiccQe6pJs5P7fJZGwNnu0P0yicZzd
         ifro+KIHjnOnAt7PgMW5fSS3TI3KuHitSHAlGQCRdtIkF4DQ+u1jXrOWRdiaccd8ia/b
         UKnNC5vne/PQLglKpzHmdHnXQJ/sN+a1q0fssB+0tANv0ZzXpYtX9J5Fs622yg9aP0J1
         B+YkSPy6fbWHLzcFX8+UCKdvwrwvQMU2JcTJvKjl1baI8A/ffe1dA2dsZQGseSE1fGUr
         Uec1xnnNbULQhVlSslkhjwfYIVtgjdJY3bI64IQM1kk7EhXG/GGSbDMk0TiACH7SdMJE
         8Q8A==
X-Gm-Message-State: APzg51ArpM3V8GJYD/gfshzKoejvrJmz3qaR1C1sdyw+OYBKhZCLoq4u
        +xpzvbojpRasjUJCNULMRlP5/8jdSco=
X-Google-Smtp-Source: ANB0VdaheYeU+AWS9KgyW9TN4/PrWF8L2uv2s4tiAVS+77GnXm1YU0IrVm2syvN4Mc7UpAuy+YVRnA==
X-Received: by 2002:a25:2748:: with SMTP id n69-v6mr9756352ybn.341.1537474442391;
        Thu, 20 Sep 2018 13:14:02 -0700 (PDT)
Received: from mail-yw1-f44.google.com (mail-yw1-f44.google.com. [209.85.161.44])
        by smtp.gmail.com with ESMTPSA id u191-v6sm3643961ywc.0.2018.09.20.13.14.02
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Sep 2018 13:14:02 -0700 (PDT)
Received: by mail-yw1-f44.google.com with SMTP id n21-v6so4290686ywh.5
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 13:14:02 -0700 (PDT)
X-Received: by 2002:a81:4418:: with SMTP id r24-v6mr18926266ywa.407.1537474121494;
 Thu, 20 Sep 2018 13:08:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:5f04:0:0:0:0:0 with HTTP; Thu, 20 Sep 2018 13:08:40
 -0700 (PDT)
In-Reply-To: <20180920172301.21868-13-miguel.ojeda.sandonis@gmail.com>
References: <20180920172301.21868-1-miguel.ojeda.sandonis@gmail.com> <20180920172301.21868-13-miguel.ojeda.sandonis@gmail.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Thu, 20 Sep 2018 13:08:40 -0700
X-Gmail-Original-Message-ID: <CAGXu5jJEXFXnOVZrjoUyyuQ-=L=Lou3iLsA2Jjzci_McSgn2XA@mail.gmail.com>
Message-ID: <CAGXu5jJEXFXnOVZrjoUyyuQ-=L=Lou3iLsA2Jjzci_McSgn2XA@mail.gmail.com>
Subject: Re: [PATCH v5 12/15] Compiler Attributes: add support for __nonstring
 (gcc >= 8)
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Olof Johansson <olof@lxom.net>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        "David S . Miller" <davem@davemloft.net>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>,
        Paul Lawrence <paullawrence@google.com>,
        Sandipan Das <sandipan@linux.vnet.ibm.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Will Deacon <will.deacon@arm.com>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Paul Burton <paul.burton@mips.com>,
        David Rientjes <rientjes@google.com>, Willy Tarreau <w@1wt.eu>,
        Martin Sebor <msebor@gmail.com>,
        Christopher Li <sparse@chrisli.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Theodore Ts'o" <tytso@mit.edu>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@arndb.de>,
        Dominique Martinet <asmadeus@codewreck.org>,
        Stefan Agner <stefan@agner.ch>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Ext4 Developers List <linux-ext4@vger.kernel.org>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 20, 2018 at 10:22 AM, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
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

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
Pixel Security
