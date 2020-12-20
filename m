Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FA2C4361B
	for <linux-doc@archiver.kernel.org>; Sun, 20 Dec 2020 14:54:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F28C22B2E
	for <linux-doc@archiver.kernel.org>; Sun, 20 Dec 2020 14:54:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbgLTOyK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 20 Dec 2020 09:54:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726950AbgLTOyK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 20 Dec 2020 09:54:10 -0500
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5367C0617B0
        for <linux-doc@vger.kernel.org>; Sun, 20 Dec 2020 06:53:19 -0800 (PST)
Received: by mail-vs1-xe31.google.com with SMTP id x4so4034077vsp.7
        for <linux-doc@vger.kernel.org>; Sun, 20 Dec 2020 06:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ypizNTWjAttv3UN3LTBMjtSTaXLL1c1NPCf0bTj9C/E=;
        b=FRrI+DnbXg0n8ccUYU34AsTrMvSesgL/vgkr8cuECNOv+VuHvGKL3fvSOJUEwPUf9e
         OC265lDo+5yEYRSs9hfm6m69gYqn0qprcnjaBkFoz3Zx0wYe9+QwsR40WkySPe+Ks21t
         WqdZQEqYIyO3cqrxBE7sJNWoLtQkB9x7knKbcFpzNepI7LcDDiTh7qvh1c5gDtPDkI76
         RfNlOx6/Ei+OzwgfQFufuBoAhLV5yLV2zgweeh/N7UfSdOTER7DB5fGzLo2n71bc9rws
         bOTFt3ooGwpf+MnVvUersYWJCJHO3awVGxltfd0xyby5Mi9ezbW4YSgyxBHMd5k5SERs
         aq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ypizNTWjAttv3UN3LTBMjtSTaXLL1c1NPCf0bTj9C/E=;
        b=SWHbo/vDxgi6pmXv2kQvSA0ES25ghR5163STsLWr3kLdcMwmrE+ZKsctMCDshJW88p
         AaoEWYUg8baf2uT/2P4Nlylq2V1suRpQhoYTm+7myAKSezK0uGyMoZaTZa1ym7IJWVY9
         OV9ZRsv4O5A7h34iuV0upgsh3JYb91aviON362LDRz2yiDkxY6GNbcli7DAPD1cG1bvo
         FJ7b/Ytbw4lL/sKn8bB+DiMEwB7Z0zQCt/haU2Gm5bB5ifQj/HIFKVBf4s7KgHC+7Tkp
         u2glWjKo6u+GYHmgezZZFuNDlwQJI5mkg0I3IC/y3e8yFMs8AAikksfmL9ZCCkBfxf1e
         dOAg==
X-Gm-Message-State: AOAM531BOyTiZJqiL2quWULmpAbxt6jC/sCqt+aymqfk87TVx1idPZIt
        h2cb9HCUNVpGKRndvxh6JeyWpSzIBTc=
X-Google-Smtp-Source: ABdhPJwzLNwzoAo9w2a5vcekUEN1XM06SKPMh7tgZBsRyWL4wORTt9518MWMKyH5/HB6EnCGizCPiA==
X-Received: by 2002:a67:eacb:: with SMTP id s11mr10725670vso.10.1608475998455;
        Sun, 20 Dec 2020 06:53:18 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id t78sm2080777vkb.33.2020.12.20.06.53.17
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Dec 2020 06:53:17 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id x26so4056861vsq.1
        for <linux-doc@vger.kernel.org>; Sun, 20 Dec 2020 06:53:17 -0800 (PST)
X-Received: by 2002:a67:bd0a:: with SMTP id y10mr9966817vsq.28.1608475996519;
 Sun, 20 Dec 2020 06:53:16 -0800 (PST)
MIME-Version: 1.0
References: <425a2567dbf8ece01fb54fbb43ceee7b2eab9d05.1608051077.git.baruch@tkos.co.il>
 <1fc59ef61e324a969071ea537ccc2856adee3c5b.1608051077.git.baruch@tkos.co.il>
 <20201217102037.6f5ceee9@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CA+FuTScTEthUW=s+5_jnnHj4SQeFr0=HsgwVeNegNOaCNQ+C=Q@mail.gmail.com> <873600q577.fsf@tarshish>
In-Reply-To: <873600q577.fsf@tarshish>
From:   Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date:   Sun, 20 Dec 2020 09:52:40 -0500
X-Gmail-Original-Message-ID: <CA+FuTSfffAACpSisWgGAcHbvPWgBrQVRQe8ZJS8TmFUKdMdQ5w@mail.gmail.com>
Message-ID: <CA+FuTSfffAACpSisWgGAcHbvPWgBrQVRQe8ZJS8TmFUKdMdQ5w@mail.gmail.com>
Subject: Re: [PATCH net 2/2] docs: networking: packet_mmap: don't mention PACKET_MMAP
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Network Development <netdev@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        =?UTF-8?Q?Ulisses_Alonso_Camar=C3=B3?= <uaca@alumni.uv.es>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Dec 20, 2020 at 3:00 AM Baruch Siach <baruch@tkos.co.il> wrote:
>
> Hi Willem,
>
> On Thu, Dec 17 2020, Willem de Bruijn wrote:
> > On Thu, Dec 17, 2020 at 2:48 PM Jakub Kicinski <kuba@kernel.org> wrote:
> >>
> >> On Tue, 15 Dec 2020 18:51:17 +0200 Baruch Siach wrote:
> >> > Before commit 889b8f964f2f ("packet: Kill CONFIG_PACKET_MMAP.") there
> >> > used to be a CONFIG_PACKET_MMAP config symbol that depended on
> >> > CONFIG_PACKET. The text still refers to PACKET_MMAP as the name of this
> >> > feature, implying that it can be disabled. Another naming variant is
> >> > "Packet MMAP".
> >> >
> >> > Use "PACKET mmap()" everywhere to unify the terminology. Rephrase the
> >> > text the implied mmap() feature disable option.
> >>
> >> Should we maybe say AF_PACKET mmap() ?
> >
> > I don't think that the feature name PACKET_MMAP implies
> > CONFIG_PACKET_MMAP, or thus that the name is obsolete now that the
> > latter is.
>
> Current text says "if PACKET_MMAP is not enabled ...". This clearly
> implies a CONFIG_ symbol. Besides, the PACKET_MMAP term is mentioned
> nowhere else in the source tree. At the very least we need to clarify
> what it means.

At this point I don't think renaming will simplify anything. It is by
now referred to by that name outside the kernel, a google search
shows. It is also even the name of the documentation file
(packet_mmap.rst).

The file starts with

  PACKET_MMAP

  Abstract

  This file documents the mmap() facility available with the PACKET
  socket interface on 2.4/2.6/3.x kernels. This type of sockets is used for

That introduces the term well enough, I think.

Agreed that references to old kernel versions and the previous compile
time configurability of the feature are no longer relevant.

> > If it needs a rename, the setsockopt is PACKET_[RT]X_RING. So, if this
> > needs updating, perhaps PACKET_RING would be suitable. Or TPACKET,
> > based on the version definitions.
>
> So how would you rephrase text like "PACKET_MMAP provides a size
> configurable circular buffer ..."?

PACKET_RING provides a size configurable circular buffer would work,
but see previous comment.
