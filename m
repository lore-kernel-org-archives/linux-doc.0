Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BBAD37D089
	for <lwn-linux-doc@archive.lwn.net>; Thu,  1 Nov 2018 20:15:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727704AbeKBFTy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Nov 2018 01:19:54 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39089 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727429AbeKBFTy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Nov 2018 01:19:54 -0400
Received: by mail-lj1-f195.google.com with SMTP id a28-v6so16204589ljd.6;
        Thu, 01 Nov 2018 13:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CTINUrmBzbHTyPam0DmrjqrRz5ANVlygRopwnelY7F8=;
        b=gXsce175sVMjXtwsZW4+QdXAfGrLVYE0URhMKWRFsasEUh0vlPqBEk1MK5r5KCwFG0
         O0xiYCiXry8eF6nMsFNbuDKcT8eMN1dl1Uf/Gegg8Ejd14OlHYZZs/dtpv873Ll330iu
         C4iEnMHb59busxXzjSgHG23NpbqS7KXSl59aGPjcB/VUS3Mc/TtmzBUF6J7ngEpSI6+T
         ETF46cXhD3Sg7MzUCs3dwbxpkb/nlxX1aiYS8PuLkrRiH1rusQEcSdBC13HDZ68k66ie
         wvJDLBga0UwgYp2/+fh9B/XPNv228ue6HHqvXd8+w7NWZgtqSiLPFzZvuRDLL+tFTkyo
         E9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CTINUrmBzbHTyPam0DmrjqrRz5ANVlygRopwnelY7F8=;
        b=aSyYM7l0FDfUEQocUMQS2NI5A9ZxmO8CJal5507GkgpTkl2NdfcAZHcPyXzusAVY3j
         Cv95m88+EumPnv/d3vezx4NcfnSP5oXOwHqexpQewhArfLU3qrJFA1JQhVvG7ocBcDdl
         0ZmgWEdXqRYGLGY92DDJbpDx63O5qFAsvGFamflcrn407+ukbfRUHLFzqZTTafsKRux0
         LgpTxWjli5LIEN5XJxNlOf8X8EG+IAREbgFhHI/eTEZUxD87MpSikcy4JaBZuPVoz8V+
         4gr2iPyKCfQXrXSvAsAo1q8szRlLl5DrIDGLFHX/Hl8i1TCDlHRDRoAdiUKDbgxmbs75
         32gQ==
X-Gm-Message-State: AGRZ1gLn+2HxandxQSE1bX7P5/81KctVU7T0HaKdxvAMGqUyu2nf0o/O
        XQnE/FVIHuF7vbY/tXp27B9HH04q+1oSDhNB1y4=
X-Google-Smtp-Source: AJdET5eggE8PhqpTWPt1JrATz46zQbEoZai3PDZoGUcIBXbWULJ0Rdu349NXDpYYOYjKTWoOwcLW/yPpCyW6uzx3vhQ=
X-Received: by 2002:a2e:5054:: with SMTP id v20-v6mr5823527ljd.45.1541103323969;
 Thu, 01 Nov 2018 13:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20181022105944.GA1411@gmail.com> <CAHk-=whpBiV5sVTvPsWOVx5WYOouxbNG1fWeCdpK4oFiaH0Zqg@mail.gmail.com>
In-Reply-To: <CAHk-=whpBiV5sVTvPsWOVx5WYOouxbNG1fWeCdpK4oFiaH0Zqg@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 1 Nov 2018 21:15:12 +0100
Message-ID: <CANiq72=Cz8XiYc=FGMwrNBFq2uiO55JBmoNc+NSDXYr_awosKw@mail.gmail.com>
Subject: Re: [GIT PULL] Compiler Attributes for v4.20-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Dan <dan.carpenter@oracle.com>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Olof Johansson <olof@lxom.net>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        David Miller <davem@davemloft.net>,
        Kees Cook <keescook@chromium.org>,
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
        Jonathan Corbet <corbet@lwn.net>, "Ted Ts'o" <tytso@mit.edu>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@arndb.de>,
        Dominique Martinet <asmadeus@codewreck.org>,
        Stefan Agner <stefan@agner.ch>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Ext4 Developers List <linux-ext4@vger.kernel.org>,
        linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org,
        gor@linux.ibm.com, schwidefsky@de.ibm.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 1, 2018 at 6:06 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I'm not sure how much that matters (maybe the original check for 4.9.2
> was just a random pick by Andrey? Added to cc), but together with the
> movement to <linux/compiler_attributes.h> that looks like it also
> wouldn't want the CONFIG_KASAN tests, I wonder what the right merge
> resolution would be.

Good catch. I don't recall any special logic when I did that change,
so most likely I simply did like for the rest of the attributes and
took a look at when it was first supported (and documentation in gcc's
docs) in order to implement __has_attribute by hand.

But indeed, it *may* be that there is an (undocumented) problem
between 4.8 <= gcc < 4.9.2 with it. If so, we should document it down
and fix it. Andrey?

> Yes, I see the resolution in linux-next, and I think that one is odd
> and dubious, and now it *mixes* that old test of gcc-4.9.2 with the
> different test in compiler-attributes.

I missed that conflict completely, my bad (I did not miss all of them,
at least; one required fixing).

Hm.... at a quick look, why is it only on compiler-gcc.h? It should
either have a corresponding #define elsewhere or just be put directly
in another common header, no? (Adding Vasily & Martin to CC.)

> But I'm also unsure whether you meant for the "__has_attribute()" test
> to be usable outside the linux/compiler_attributes.h file, in which
> case I could just do
>
>   #if defined(CONFIG_KASAN) && __has_attribute(__no_sanitize_address__)
>
> instead.

I think that (using __has_attribute() outside) may be a good idea: I
wanted to keep compiler_attributes.h as simple as possible by avoiding
#ifdefs inside that header (except for __has_attribute itself), as an
attempt to avoid going back to the mess of #ifdefs we had previously.
Basically, keeping the attributes in compiler_attributes.h that do not
depend on complex logic. So using __has_attribute *outside* the header
actually goes well with that principle, because it helps keeping stuff
out of it if they depend on other config options; without having to
rely on GCC_VERSION either.

[By the way, in case it clarifies: note that "optional" in that file
actually is a bit of a misnomer. I meant to say "optional" as in "not
supported by all compilers, so conditionally defined" ("optionally"
defined); rather than "optional" in the sense of "code still works
without the attribute". It caught Rasmus in one of his patches sent a
few days ago on top of this tree, so I want to change it or explain it
to avoid confusion.]

Cheers,
Miguel
