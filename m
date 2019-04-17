Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CE3B47D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Apr 2019 23:59:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730285AbfDQX7z (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 17 Apr 2019 19:59:55 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35824 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729331AbfDQX7z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Apr 2019 19:59:55 -0400
Received: by mail-lj1-f195.google.com with SMTP id t4so288227ljc.2
        for <linux-doc@vger.kernel.org>; Wed, 17 Apr 2019 16:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+kn5mtINPt4na060bar/tC0RHNfqAb7J/PmuZQ0Dyi8=;
        b=IBLCLtPuOlIJGx6ETpn93rimEqBz5Au/0GjooFZAo0KIJTxoTsJPz413yAtvfmWoXY
         BqvjzirjujDpTm8Z8RGtzbE47EZiPUSxIfegDrH1aTumTX5oM8C5bVyiexfx7ifgxxPB
         UMawmkwQ/X7ZweYBYxIOjMj+Jba1Zio7Xb4vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+kn5mtINPt4na060bar/tC0RHNfqAb7J/PmuZQ0Dyi8=;
        b=Nb+bH6zQgpm/qSlAKbqNXeakJxfIfeaQbiPaDg0uxeRb7S+AoS6hd+GJZt0NFDjzAj
         1Rn2/rh4VWtT4nk7UrknxNY6ebIWHXM/ao9zTBDn3cc5cUtPbjumG4D7/SllJdgSlxXT
         NhyeKy5KgS4hLpn9eKqjhTlCPBJa3xqX6EN0Xf1HyY+FmpzeUKtdyjwvsof2LsHwyGvK
         GyL0zaBiGDUdRZ19hZd2FaZN/sXF7fFnoEinb0lCwqH/+4nsgBjZUGUk4HzZsijpD66g
         JeJYm/XbVGSrgyAus57c8daOv58vzMu9VFkMh0D3J6DVePbvQWITxckKmPQjfUzDpVjf
         4tHw==
X-Gm-Message-State: APjAAAXf57OdTGcRoCpHJkA8xd38Ms9Olck4EIRAnLuPq9GTLKsnLx6+
        vijAS53R0ycwaoh+74z2eeAHNtavvH0=
X-Google-Smtp-Source: APXvYqyVjqXbcbxoxRD3ajxEOBWr0+m3Wmc1xB6wuL5/ZtObO9Mz7Nn01ORL9hQHDQXSNe1mv4YdKA==
X-Received: by 2002:a2e:84ce:: with SMTP id q14mr12029773ljh.80.1555545592628;
        Wed, 17 Apr 2019 16:59:52 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id r19sm58970lja.83.2019.04.17.16.59.52
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Apr 2019 16:59:52 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id f23so297789ljc.0
        for <linux-doc@vger.kernel.org>; Wed, 17 Apr 2019 16:59:52 -0700 (PDT)
X-Received: by 2002:a2e:5dd2:: with SMTP id v79mr48356924lje.22.1555545190479;
 Wed, 17 Apr 2019 16:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554248001.git.khalid.aziz@oracle.com> <f1ac3700970365fb979533294774af0b0dd84b3b.1554248002.git.khalid.aziz@oracle.com>
 <20190417161042.GA43453@gmail.com> <e16c1d73-d361-d9c7-5b8e-c495318c2509@oracle.com>
 <20190417170918.GA68678@gmail.com> <56A175F6-E5DA-4BBD-B244-53B786F27B7F@gmail.com>
 <20190417172632.GA95485@gmail.com> <063753CC-5D83-4789-B594-019048DE22D9@gmail.com>
 <alpine.DEB.2.21.1904172317460.3174@nanos.tec.linutronix.de>
 <CAHk-=wgBMg9P-nYQR2pS0XwVdikPCBqLsMFqR9nk=wSmAd4_5g@mail.gmail.com> <alpine.DEB.2.21.1904180129000.3174@nanos.tec.linutronix.de>
In-Reply-To: <alpine.DEB.2.21.1904180129000.3174@nanos.tec.linutronix.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 17 Apr 2019 16:52:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=whUwOjFW6RjHVM8kNOv1QVLJuHj2Dda0=mpLPdJ1UyatQ@mail.gmail.com>
Message-ID: <CAHk-=whUwOjFW6RjHVM8kNOv1QVLJuHj2Dda0=mpLPdJ1UyatQ@mail.gmail.com>
Subject: Re: [RFC PATCH v9 03/13] mm: Add support for eXclusive Page Frame
 Ownership (XPFO)
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Nadav Amit <nadav.amit@gmail.com>, Ingo Molnar <mingo@kernel.org>,
        Khalid Aziz <khalid.aziz@oracle.com>, juergh@gmail.com,
        Tycho Andersen <tycho@tycho.ws>, jsteckli@amazon.de,
        Kees Cook <keescook@google.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Juerg Haefliger <juerg.haefliger@canonical.com>,
        deepa.srinivasan@oracle.com, chris.hyser@oracle.com,
        Tyler Hicks <tyhicks@canonical.com>,
        David Woodhouse <dwmw@amazon.co.uk>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Jon Masters <jcm@redhat.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        iommu <iommu@lists.linux-foundation.org>,
        X86 ML <x86@kernel.org>,
        "linux-alpha@vger.kernel.org" <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        Khalid Aziz <khalid@gonehiking.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <a.p.zijlstra@chello.nl>,
        Dave Hansen <dave@sr71.net>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Arjan van de Ven <arjan@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 17, 2019 at 4:42 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Wed, 17 Apr 2019, Linus Torvalds wrote:
>
> > With SMEP, user space pages are always NX.
>
> We talk past each other. The user space page in the ring3 valid virtual
> address space (non negative) is of course protected by SMEP.
>
> The attack utilizes the kernel linear mapping of the physical
> memory. I.e. user space address 0x43210 has a kernel equivalent at
> 0xfxxxxxxxxxx. So if the attack manages to trick the kernel to that valid
> kernel address and that is mapped X --> game over. SMEP does not help
> there.

Oh, agreed.

But that would simply be a kernel bug. We should only map kernel pages
executable when we have kernel code in them, and we should certainly
not allow those pages to be mapped writably in user space.

That kind of "executable in kernel, writable in user" would be a
horrendous and major bug.

So i think it's a non-issue.

> From the top of my head I'd say this is a non issue as those kernel address
> space mappings _should_ be NX, but we got bitten by _should_ in the past:)

I do agree that bugs can happen, obviously, and we might have missed something.

But in the context of XPFO, I would argue (*very* strongly) that the
likelihood of the above kind of bug is absolutely *miniscule* compared
to the likelihood that we'd have something wrong in the software
implementation of XPFO.

So if the argument is "we might have bugs in software", then I think
that's an argument _against_ XPFO rather than for it.

                Linus
