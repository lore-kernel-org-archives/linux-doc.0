Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2105D7D082
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Oct 2018 14:17:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727416AbeJVWgc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Oct 2018 18:36:32 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:43176 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727146AbeJVWgb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Oct 2018 18:36:31 -0400
Received: by mail-yw1-f67.google.com with SMTP id j75-v6so16045727ywj.10
        for <linux-doc@vger.kernel.org>; Mon, 22 Oct 2018 07:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=rMjiCR2LQUA6DC1gYbbouQ4QtRy0545yzfC08/V1Ckk=;
        b=PkvlheYtk9WK9dMUL5wyOotYB3lJIhQ7VTqthtSDMMzKPykf2U9mNv7oIougm60cZT
         jxhcVBuDPinHXotRzH8cgzLpFX8ClfClRYmrtsD0FtyOGjWpEgeI1pC5qF33Me4J2vuO
         n1Khg7j/74hMgGmcS+VZnm5aPckOrskHsbsb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=rMjiCR2LQUA6DC1gYbbouQ4QtRy0545yzfC08/V1Ckk=;
        b=MPfAnffMzDjasxAny91HFWFrA88/99497jrU/UIo4ZHWeXYrAiaMTdPj5P0JA/o4mV
         KIba9njFKxu2qKigTWDih1Hvi7z7emzaoXSKn4M3jyBi/zolb4z/IKmU5nlQZrWIYw6y
         n/M+I0+1uoB4i5R+2DWRxIg5kzNQ2MhsdvA1sp2cBpyOFMUJOUU95CVzedk8AQbBbczH
         2/2kRK1m+lLhIx9ohEMCWyyqH2QT6hA/TYHkB2kIuOkJkkDCZm323iUYbYfhjoKrs+hN
         +qeV3KtQZJGy6zGsjo8bpzWU9ZsLhCa+pLddaQN/l03p+sLqxDkvGY1m85ChPNHi74+Z
         DO2Q==
X-Gm-Message-State: ABuFfohWE30oyQiVR+M+4JS/ERhoUEdgKnwS3hCg4NfK9rpBloXSFXAc
        IkB6i2byg3sWuUhX0tjs6sLj4oceEBI=
X-Google-Smtp-Source: ACcGV60ixLBPcjV7UtUlzKY5Hs30cQ0tw/eqBvBNnXLxEVM4et1+UmwAMSsN8Qs9dIszufgLjFx/2A==
X-Received: by 2002:a81:3b53:: with SMTP id i80-v6mr32982425ywa.166.1540217864761;
        Mon, 22 Oct 2018 07:17:44 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id f7-v6sm4887230ywf.108.2018.10.22.07.17.44
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Oct 2018 07:17:44 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id m184-v6so5130888ybm.0
        for <linux-doc@vger.kernel.org>; Mon, 22 Oct 2018 07:17:44 -0700 (PDT)
X-Received: by 2002:a25:8091:: with SMTP id n17-v6mr32679974ybk.209.1540217403211;
 Mon, 22 Oct 2018 07:10:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:3990:0:0:0:0:0 with HTTP; Mon, 22 Oct 2018 07:10:02
 -0700 (PDT)
In-Reply-To: <20181021171414.22674-3-miguel.ojeda.sandonis@gmail.com>
References: <20181021171414.22674-1-miguel.ojeda.sandonis@gmail.com> <20181021171414.22674-3-miguel.ojeda.sandonis@gmail.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Mon, 22 Oct 2018 07:10:02 -0700
X-Gmail-Original-Message-ID: <CAGXu5j+3pR2mfcdbURv7MrPxUVjmjQEDRHH8BLpTNGiasJs1pg@mail.gmail.com>
Message-ID: <CAGXu5j+3pR2mfcdbURv7MrPxUVjmjQEDRHH8BLpTNGiasJs1pg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Compiler Attributes: auxdisplay: panel: use __fallthrough
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
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

On Sun, Oct 21, 2018 at 10:14 AM, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> Let gcc know these cases are meant to fall through to the next label
> by annotating them with the new __fallthrough statement attribute;
> and remove the comment since it conveys the same information
> (which was also parsed by gcc to suppress the warning).
>
> Signed-off-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> ---
>  drivers/auxdisplay/panel.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/auxdisplay/panel.c b/drivers/auxdisplay/panel.c
> index 21b9b2f2470a..0755034e49ba 100644
> --- a/drivers/auxdisplay/panel.c
> +++ b/drivers/auxdisplay/panel.c
> @@ -1367,7 +1367,7 @@ static void panel_process_inputs(void)
>                                 break;
>                         input->rise_timer = 0;
>                         input->state = INPUT_ST_RISING;
> -                       /* fall through */
> +                       __fallthrough;
>                 case INPUT_ST_RISING:
>                         if ((phys_curr & input->mask) != input->value) {
>                                 input->state = INPUT_ST_LOW;
> @@ -1380,11 +1380,11 @@ static void panel_process_inputs(void)
>                         }
>                         input->high_timer = 0;
>                         input->state = INPUT_ST_HIGH;
> -                       /* fall through */
> +                       __fallthrough;
>                 case INPUT_ST_HIGH:
>                         if (input_state_high(input))
>                                 break;
> -                       /* fall through */
> +                       __fallthrough;
>                 case INPUT_ST_FALLING:
>                         input_state_falling(input);
>                 }
> --
> 2.17.1
>

I would prefer we continue to use the comment style until we've got
confirmed support for (at least) Clang, Coverity, CPPcheck, smatch,
and eclipse.

-Kees

-- 
Kees Cook
Pixel Security
