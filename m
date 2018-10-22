Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D83D87D08A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Oct 2018 17:26:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728770AbeJWBph (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Oct 2018 21:45:37 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44608 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728739AbeJWBpg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Oct 2018 21:45:36 -0400
Received: by mail-pf1-f193.google.com with SMTP id r9-v6so20240183pff.11
        for <linux-doc@vger.kernel.org>; Mon, 22 Oct 2018 10:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uc26wvlO9uSCh/ATf1Fj7RkrCzIc/n2/k3zGe3rfx9c=;
        b=rODn+uu0x8ErLKdAmBMax1j2cquvLGThv4G//Sn3m6CrzKGGbDmSZSnyJQPBZHhZC6
         ofPYu2wVC/3BSPrkFqhKkWhrS3YTVNfCVKzLWJhs1zTZnrmaXciKVAGs2iiQwkX4jinl
         JpcZe4sq74nYqFFCYE/BN7jlCDXkpjq3Qk9CqtHEiU9WPuTZ8BFDZltyDJdLXVuNefUg
         KRZ4YAq+8v1EA2pdUBB/mXFruR8CaJNJW7HHqQANxOkdDrmwUe7pMPN8QbmPbFkRMOjB
         J1QlTB52H4JKkSyOUd271vOOXTUhohpe1yuaMHN8GPF/LaDieY2UDQCICKtbYrjKtbdy
         ob/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uc26wvlO9uSCh/ATf1Fj7RkrCzIc/n2/k3zGe3rfx9c=;
        b=obqMSSCebwy2VZft202BtqNdbPVHXbDZjsdDtujpnSgoNPqSktVRV4BS0jLmty38H2
         4e9+DNdnAuCMu7poQ0vtFCFB00QXjy2tDsRopMtr3L56k5EkeuzpbYF8WKSWzoIOo6vJ
         glbQVCEYge8oUBlD8sQkPDPF1nrnWk9aQN02m3DrLkqpKtyJQOFpsp4YONjEH4/VBqrN
         +bwNQvK7BXXMTBMdGfCpVHdi0ylIbh5tjp/p5sByXcAUKZ4DOzSLonrcf2CE/dStQU7s
         G5LqEY/bbv3tf/9/UlewDaHVW5tyHyBN1bFHv0ERqq3i0jYPI4TEs+5ivwxX9ESJL5xD
         KJXQ==
X-Gm-Message-State: ABuFfoi1cc5PqJsqctW4i3gVe4HXFTCUSbLu46u0B/14ebk4oIr5MeBI
        BRloEyPpk892/UNokakFDQFYGRdUv1facEnFFOkCNg==
X-Google-Smtp-Source: ACcGV62lMMOculE+zgthQroeJnnOF0GSCCDi9qvyBZuSdAYwaVTPQdG7UBsZaKhJKo0OGF4HZM7uO/6Hv/b+QRctnMs=
X-Received: by 2002:aa7:88c2:: with SMTP id p2-v6mr38874608pfo.32.1540229172220;
 Mon, 22 Oct 2018 10:26:12 -0700 (PDT)
MIME-Version: 1.0
References: <20181021171414.22674-1-miguel.ojeda.sandonis@gmail.com>
 <20181021171414.22674-2-miguel.ojeda.sandonis@gmail.com> <20181021222712.GI1617@thunk.org>
 <8fb78062-b6d4-6f2d-d943-44bec6b95ff0@petrovitsch.priv.at>
 <20181022102743.nua5fgbscyeymzal@mwanda> <1474d995-1b5a-2efb-f077-33eb4a5d9e31@petrovitsch.priv.at>
 <20181022105314.j6djkrpwbnokhai5@mwanda>
In-Reply-To: <20181022105314.j6djkrpwbnokhai5@mwanda>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 22 Oct 2018 10:26:00 -0700
Message-ID: <CAKwvOd=SUTqfASs-_5--GYFx79bETMcjCzBacw5ujMsxGwU5SQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Compiler Attributes: add support for __fallthrough
 (gcc >= 7.1)
To:     dan.carpenter@oracle.com
Cc:     bernd@petrovitsch.priv.at, "Theodore Ts'o" <tytso@mit.edu>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>, adilger.kernel@dilger.ca,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>, rostedt@goodmis.org,
        mchehab+samsung@kernel.org, olof@lxom.net,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
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
        Willy Tarreau <w@1wt.eu>, msebor@gmail.com, sparse@chrisli.org,
        Jonathan Corbet <corbet@lwn.net>,
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

On Mon, Oct 22, 2018 at 3:54 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Mon, Oct 22, 2018 at 12:45:03PM +0200, Bernd Petrovitsch wrote:
> > It's more like
> > ----  snip  ----
> >       case 3:
> >               frob();
> >               __fall_through;
> >               /* no break - fall through */
> >       case 4:
> > ----  snip  ----
> > as "eclipse" doesn't accept anything else.
> >
> > And yes, it's far from "beautiful" but I hadn't time to dig into
> > eclipses innards to fix that.
> >
>
> Doing both is super ugly.  Let's just do comments until Eclipse gets
> updated.

Eclipse as in the IDE?
https://bugs.eclipse.org/bugs/

>
> I had wanted to move to the attribute because that would simplify things
> in Smatch but it's not a huge deal to delay for another year.
>
> regards,
> dan carpenter
>


-- 
Thanks,
~Nick Desaulniers
