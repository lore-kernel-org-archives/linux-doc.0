Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F2CAA7D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Mar 2019 17:54:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727532AbfCDRyz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Mar 2019 12:54:55 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38406 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727488AbfCDRyy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Mar 2019 12:54:54 -0500
Received: by mail-pf1-f193.google.com with SMTP id n125so3549194pfn.5
        for <linux-doc@vger.kernel.org>; Mon, 04 Mar 2019 09:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qxv/m+4LR2PyZHhZt6In/iHeQCdivz15h+k6BiAjjiU=;
        b=ldTBQVznmHHnr0I2OhfuPsOMqgo9cHJafUiIZkKZ19i93S+J2V5aRui3cDkUr+ZRFy
         0CeIYgAgcmOq+iyRCClRLcr2vKdCZQLW+ZPTV7egwYU756ytKuJYy60PNKuXcICw9+tb
         kYeBn5b9YT4dFUVBo0BM0oQThCBYPC8BzLunmcyYjqRNskeJKzF+piNS2EU3nKsrmneQ
         XL0YYyEZelMZuIFugLalBTyJ7zkRD5K8Djiq1NtWvOAE5UOidum+wc4Gz2ITe9aWpAN7
         WN9ATeAYx8pwQRFM0k9/y61qIDLciqPBhAgWfcUFyCeqpzxgspS4Ai1www5CdSjln79M
         0/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qxv/m+4LR2PyZHhZt6In/iHeQCdivz15h+k6BiAjjiU=;
        b=V211shQoOMpjHJKYXGe7gF8LzodGSXdUsTMqmDTQB2MVwrq5XgEdx+YdCdyWtJWYfI
         5BwX66Za5JaBBIeEfUjUCHGyd23Y4W2QhtsuTkHeniaEAvHUfleEdd3rVwLg9cA6fTYW
         JBP2LpQDHLG4qXSRTWiN02tf2/5SPnSKiP1cn7h4A2HvGTAi86T7QEWYswVWZyknCe3c
         JtEKkTK2AeZjOpAHPVahF0xY6UOWPTNW92AsB1S9DOOtYW3utLnFcQjGroSnEqvpiWj1
         lvC+hDGGTksjUW1gTm9Djg0VmYajIWo4jaezhESxK1JLxKhXRbDEvpDT87t2YP/NCaEH
         73GA==
X-Gm-Message-State: APjAAAU6PYqxB2Vs6A4HwRXSiiH4kif9bpoQ56KImRwZRB1Zy0OLjzEM
        B/j8XmYkuOu8n+hzeEyVeJI0zPKCbRITtyU67TMB4w==
X-Google-Smtp-Source: APXvYqzXpgUxJrLEtjyvgF4VlnoPUsZLftvQcR7hlaMyStbEKf5mdMmRzmPLrE+HJ8dRWxdzp3akMdjdhMvZXaZNi0w=
X-Received: by 2002:a17:902:221:: with SMTP id 30mr1081059plc.320.1551722093384;
 Mon, 04 Mar 2019 09:54:53 -0800 (PST)
MIME-Version: 1.0
References: <20190303123647.22020-1-louis@kragniz.eu> <20190304154509.46azg4blwoieqs3c@pathway.suse.cz>
In-Reply-To: <20190304154509.46azg4blwoieqs3c@pathway.suse.cz>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 4 Mar 2019 09:54:42 -0800
Message-ID: <CAKwvOd=p3xUkSkhUpWsy0DeZU6H7g-J+-OarKETnsdALvf5oGA@mail.gmail.com>
Subject: Re: [PATCH] docs: add extra integer types to printk-formats
To:     Petr Mladek <pmladek@suse.com>
Cc:     Louis Taylor <louis@kragniz.eu>, Jonathan Corbet <corbet@lwn.net>,
        geert+renesas@glider.be, andriy.shevchenko@linux.intel.com,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux@googlegroups.com,
        Jon Flatley <jflat@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 4, 2019 at 7:45 AM Petr Mladek <pmladek@suse.com> wrote:
>
> On Sun 2019-03-03 12:36:47, Louis Taylor wrote:
> > A few commonly used integer types were absent from this table, so add
> > them.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/378
> > Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> > Signed-off-by: Louis Taylor <louis@kragniz.eu>
> > ---
> >  Documentation/core-api/printk-formats.rst | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> > index a7fae4538946..6f08b1b6240a 100644
> > --- a/Documentation/core-api/printk-formats.rst
> > +++ b/Documentation/core-api/printk-formats.rst
> > @@ -19,8 +19,16 @@ Integer types
> >               unsigned long           %lu or %lx
> >               long long               %lld or %llx
> >               unsigned long long      %llu or %llx
> > +             short int               %hd or %hx
> > +             unsigned short int      %hu or %hx
> > +             char                    %hhd or %hhx
> > +             unsigned char           %hhu or %hhx
>
> These should get moved to the beginning of the table to
> have all variants sorted by size.
>
> >               size_t                  %zu or %zx
> >               ssize_t                 %zd or %zx
> > +             s8                      %hhd or %hhx
> > +             u8                      %hhu or %hhx
> > +             s16                     %hd or %hx
> > +             u16                     %hu or %hx
> >               s32                     %d or %x
> >               u32                     %u or %x
> >               s64                     %lld or %llx
>
> Let's get it in when people are doing the clean up.
>
> I have fixed the sorting and committed into printk.git,
> branch for-5.1, see
> https://git.kernel.org/pub/scm/linux/kernel/git/pmladek/printk.git/commit/?h=for-5.1&id=943ca6ad81e5b37bd5d22cbab5ad06dc97fc001c

Sure that's fine.  Thanks for keeping Louis as the author, and for the clean up.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

-- 
Thanks,
~Nick Desaulniers
