Return-Path: <SRS0=Pvk/=3Z=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFB4C352A1
	for <linux-doc@archiver.kernel.org>; Wed,  5 Feb 2020 16:55:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 66502217BA
	for <linux-doc@archiver.kernel.org>; Wed,  5 Feb 2020 16:55:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="ZUyawLSS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbgBEQzw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 Feb 2020 11:55:52 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:33362 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727398AbgBEQzv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Feb 2020 11:55:51 -0500
Received: by mail-io1-f65.google.com with SMTP id z8so2931987ioh.0
        for <linux-doc@vger.kernel.org>; Wed, 05 Feb 2020 08:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c1mB8S8mfdhuwR/BwjXb5N4vKJpT74x0hbeAD2IdkgY=;
        b=ZUyawLSS6+asFKie9PrgKPK6O5WRvYEAXrUxR404qJAB3HHEyV8RJ3jrkZnz4D/dqK
         rMbjufgbNCLZOC5J0A8c7nK6nG2xfTq9/wtCLVyxVtQ2AiKenNIXCXChY5T5Q7AoW4U0
         S0HHVz1JpiFXQBVnNPP7C251gtl29Q/5pN2f94ytYosXea/F5dzX3fMTb1YoKRwykWuH
         nO4IJZEfOV6I7nq2p50vNb/P+FyFbFZDp3BczaO9h8N89VmwrJIdqFNmG4EzbHl5DBU8
         vN50dyMz+CRdFzMXWOpWqeiZRyofzz6Ra/I3GDugHmvvf8aI8wxxiF1ZqVhv+vbEadau
         VwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c1mB8S8mfdhuwR/BwjXb5N4vKJpT74x0hbeAD2IdkgY=;
        b=icVc81DnPVaj2vGHISw2I3VICnnSIU1iZT4pglUS9Wj1o5HUenEVc6BjXWbo8JF8GW
         2lUWlaXX84WlnKiFlrJWa1zoV6qMbTW9psJ936mXirekAIGfO7ZxqImMgjPlLGto5HLW
         klj5G5jorxSmEEJahBjrhcqXNdPRRJ3EXBUddg43bwoWnAVaJ4/acvjm+4WeVAK7ikTP
         T5cQnhu9ZYTeyft1xJQfEcAe3b3CU+k+E1WP4e8C/gc5K0ZC/8iGGCrc6zDV9hBrtUmq
         G7El7hKJnH9MdfMobO2kMChfzfpkXZvrOpxC2/xD6eHH1ufQYwVzAXhYhU0PAh8+6NBV
         wdtQ==
X-Gm-Message-State: APjAAAVSjZ2umC++hfv0RlDEU95j21zrKitY9ZjA0FdnPYd8CkJLejid
        lZ899ZLV2YfjVYeTG04F1xNqHER0Wte9L4UOE4DSuQ==
X-Google-Smtp-Source: APXvYqxBicEXiWmpJ+GkZ0ov4Qt2Zbhs4HGgmOX4NCUAs4G6CRH2d0U7bZ8/0zsgcVe0FYeSpeW8utuaQ0ZahPQSl3Q=
X-Received: by 2002:a02:ca10:: with SMTP id i16mr30514268jak.10.1580921750491;
 Wed, 05 Feb 2020 08:55:50 -0800 (PST)
MIME-Version: 1.0
References: <20200205154629.GA1257054@kroah.com> <20200205160250.GG142103@google.com>
In-Reply-To: <20200205160250.GG142103@google.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Wed, 5 Feb 2020 16:55:39 +0000
Message-ID: <CAOesGMj7Z9JoEYrnQaiHrHsjG7cv9ebEbyZM-QFWN2HJDa=UGA@mail.gmail.com>
Subject: Re: [PATCH] Revert kheaders feature
To:     Joel Fernandes <joel@joelfernandes.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tejun Heo <tj@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        David Howells <dhowells@redhat.com>,
        Patrick Bellasi <patrick.bellasi@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kbuild@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 5, 2020 at 4:02 PM Joel Fernandes <joel@joelfernandes.org> wrote:
>
> On Wed, Feb 05, 2020 at 03:46:29PM +0000, Greg Kroah-Hartman wrote:
> > Now that BPF does not need a copy of the kernel headers anymore in order
> > to build programs, there's no real need for putting the kernel headers
> > into a kernel module.  So drop the feature quick, before someone starts
> > using it :)
>
> Temporary Nack. Adding Alexei to the thread.
>
> I believe at the time of this going in, the BPF's BTF feature was not fully
> ready or able to support the usecases. Especially because BPF programs can
> call or use macros in kernel headers as well.
>
> Also, now BCC project does depend on this and so does bpftrace. Have both
> of these tools migrated to use BTF and don't need CONFIG_KHEADERS to be
> compiled? Sorry if I lost track.
>
> Just last week someone was using CONFIG_KHEADERS for BPF tracing purposes at
> Google and pinged me as well. There are several others. This would at least
> them some amount of pain.
>
> I'd suggest let us discuss more before ripping it out. thanks,


Greg, please use olof@lixom.net on the patch, I try to keep LKML out
of my non-upstream inbox. :-)


Alexei was part of the discussion, and from others in the same room it
sounded like there are no users of the upstream version of this
feature. Posting this patch is the obvious way to find out if that is
the case.

I.e. even if there was a version of bcc that required this, it sounds
like the BTF approach is significantly better and said users are
hopefully moving forward to it quickly, and if they can't move
forward, then they're likely also not going to move forward to newer
kernels either?


-Olof
