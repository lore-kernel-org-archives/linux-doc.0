Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0682D7D082
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Oct 2018 09:41:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728242AbeJVR7X (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Oct 2018 13:59:23 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42060 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728448AbeJVR7X (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Oct 2018 13:59:23 -0400
Received: by mail-lj1-f193.google.com with SMTP id y71-v6so36316843lje.9;
        Mon, 22 Oct 2018 02:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rTWgU2Je0X4G9uOsT7HSt8L6t+Au4BJ4roV+lIlRI64=;
        b=V8/U1OjXHH3Mo2KsFcu/E447RFfjJ372hKTOTpbnsS1sPY0VUCXFJz7O0jlZ/pXr8F
         e1GDgmI+4BV1R1SISXWSQDAIj5SFS7qjKa0ItnPPpw1NC5/yOW/prFTN/cI2ii5D/Qjg
         Vh55gX4rgK38eg5aVW58MdacoLEDdFq2gkZX1MSzgsZ6+DY0ZMO+4PVqMP5HXKMc2iOs
         oFj3qo8kV8PDAYLPu3KYSfz0qp5vs5wBXQGpQj4nllhU2o8G0h62ArW93VERXCF7isSZ
         xZG04pZa0h3db1ot+0Ud+mwjkCdwXP94vsqCk2sPaLRMXnXGKlzRl3J591RkGAgAL8IU
         50Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rTWgU2Je0X4G9uOsT7HSt8L6t+Au4BJ4roV+lIlRI64=;
        b=g4RjUmH3CVa+KMMnCf6oqScvFGdw7ITUyEYYVJ92g4Ldsi1lr8F9hacN4JH8+j7kms
         icH8eI+sP5Tuaw/BJpjWwA5VsJJMR1NiETSu80kmufeeCyO/Pu7VkYuB5k2g/6INbf0+
         nHJcjPUHVFfdS8Bk/e0Ih5ydRHpYKy+e2EpAG+i46rKcNjxRvz4GFvpUwSRQY7Ng3EWS
         HL0bqxtTXrVL/Reu/1NJrcfuQSpkgH2u6TDco6WLd4TAX04hgi62Huk6rFqFKJw+shmu
         c7u54tjmHOy3GOlmrTUR/pjiHdt2ebJuey8EYsVYYoW/E201fl6uzFnCrYr0IWHAB9Xy
         9z1A==
X-Gm-Message-State: AGRZ1gKFZL6tVB351/Ynin37Uf4z6je5tEAAs168j4XJcTUDOpx2JOU8
        82FiI4Hg7aRIlUb1drp2NTu9fLkdZVwA/pEERCc=
X-Google-Smtp-Source: AJdET5djGcSrpPhuxgfSXdAboMSD0/rJIagYOEq7TnDfWpPq8PrjC7gGJ1D5fJOaLrov0TGb893GqSDXTksCXEtgZeU=
X-Received: by 2002:a2e:c52:: with SMTP id o18-v6mr4699438ljd.94.1540201294601;
 Mon, 22 Oct 2018 02:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20181021171414.22674-1-miguel.ojeda.sandonis@gmail.com>
 <20181021171414.22674-2-miguel.ojeda.sandonis@gmail.com> <20181021222712.GI1617@thunk.org>
 <CANiq72mXV6WTyHXNZJDTfFOpPrXD0zD6cB30bGOuKO44AvRiog@mail.gmail.com> <CAGXu5jKb-0H+smRAW6ngQKDZ-PbTThhMwhmu34iB8vjTa-4H8Q@mail.gmail.com>
In-Reply-To: <CAGXu5jKb-0H+smRAW6ngQKDZ-PbTThhMwhmu34iB8vjTa-4H8Q@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 22 Oct 2018 11:41:23 +0200
Message-ID: <CANiq72n4+HDXPqr7xySSGx49g8vEcXaxO7a-By9cSg7YSxOS_A@mail.gmail.com>
Subject: Re: [PATCH 1/2] Compiler Attributes: add support for __fallthrough
 (gcc >= 7.1)
To:     Kees Cook <keescook@chromium.org>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "Ted Ts'o" <tytso@mit.edu>, Greg KH <gregkh@linuxfoundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dan <dan.carpenter@oracle.com>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Olof Johansson <olof@lxom.net>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        David Miller <davem@davemloft.net>,
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
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@arndb.de>,
        Dominique Martinet <asmadeus@codewreck.org>,
        Stefan Agner <stefan@agner.ch>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Ext4 Developers List <linux-ext4@vger.kernel.org>,
        linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 22, 2018 at 11:36 AM Kees Cook <keescook@chromium.org> wrote:
>
> We need to make sure the static analyzers are happy with either
> method. Additionally, when was -Wimplicit-fallthrough added to GCC? If
> it was added _before_ the attribute, we need to continue using the
> comment style otherwise we lose coverage even with gcc itself.
> Additionally, does Clang support this attribute (it supports
> -Wimplicit-fallthrough).

Please take a look at the rationale (also more details at the linked thread):

  * gcc 7.1 added -Wimplicit-fallthrough at the same time as the
attribute and the comment parsing.
  * clang does *not* support the attribute in C.

Cheers,
Miguel
