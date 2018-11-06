Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1195E7D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Nov 2018 14:24:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388583AbeKFXto (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Nov 2018 18:49:44 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40449 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388477AbeKFXto (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Nov 2018 18:49:44 -0500
Received: by mail-wm1-f67.google.com with SMTP id b203-v6so12113748wme.5
        for <linux-doc@vger.kernel.org>; Tue, 06 Nov 2018 06:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1KByZh80S8VO4Fsc4REMZ/axZc7RcKl8IBjbEoWc78Q=;
        b=W5vaA9209PGLtwBkr+B6o8bl34tuXWynrInrxxJgWDlWBG3DBc+t6/hSxoaCLCMiGE
         +UnpXpOPNfC5zew682Shc3iGaJy4Fw4fvX6quJaZgnd9i1pV7OH//ewe0oXq6U7MYIGG
         4vLbJQ9GVtcmiWDcBBz9KrobnMQIZTjpj/iaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1KByZh80S8VO4Fsc4REMZ/axZc7RcKl8IBjbEoWc78Q=;
        b=Dfm4EhuBgtLsMmXkyo3PbHKUrjfdyMHhjkLbNShrMzmwDEa1uIdVDM9KEhpAr9FoF0
         +UfqAt8JoaJdGubdHJFQiG5LXnOalcQtMd+Mz2MzmJ+55CQbUUKjvf17mioG0S/7bduJ
         iFr8roycZlhy9vKDG+WbvbZd5kbX3yhgoxNgykoaCrEnATrXmjpv2/fOg0JTmXuX9hYc
         skLEK3qhX2Gom6ZCy/0LUmGBgCQG6nZw5JceaZeUwfOapppWpH3rGZ2kgiRFLaO9b3OA
         LaOC9Y+KAM9hcaD00cox3IAatEYr3S/Us9eKxMNz+aJFs6qZP0BUOdaQ6wU2lSDBRJOR
         AnIQ==
X-Gm-Message-State: AGRZ1gJxBcH1BnjX8jlpTj8wPDdwMkMbfdmUpKho+1N3rh4/d/BeOer8
        DHga8aLTw7fE8yFJ89hg850+TmvsI3sXxG5Lv+bTDA==
X-Google-Smtp-Source: AJdET5cigpTKg+K39Q4N2Q6Z6iCoARbpB79kh/S9uatU6qoEPHX3awVqtUMnoIy2jlVlwLNbUMhNZbovV0Sf+hpnpoQ=
X-Received: by 2002:a1c:98ce:: with SMTP id a197-v6mr2289527wme.135.1541514255024;
 Tue, 06 Nov 2018 06:24:15 -0800 (PST)
MIME-Version: 1.0
References: <20181103035341.16893-1-helen.koike@collabora.com> <3624012.MiIzIq7dko@blindfold>
In-Reply-To: <3624012.MiIzIq7dko@blindfold>
From:   Will Drewry <wad@chromium.org>
Date:   Tue, 6 Nov 2018 08:24:02 -0600
Message-ID: <CAAFS_9F62S_rm2uJDzXJzJyM82-o-xBAnx5Rkk-3iDD53YS72g@mail.gmail.com>
Subject: Re: [PATCH v10 0/2] dm: boot a mapped device without an initramfs
To:     richard@nod.at
Cc:     helen.koike@collabora.com, Kees Cook <keescook@chromium.org>,
        device-mapper development <dm-devel@redhat.com>,
        Alasdair G Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        enric.balletbo@collabora.com, linux-doc@vger.kernel.org,
        linux-lvm@redhat.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Richard, Helen,

On Sat, Nov 3, 2018 at 4:10 AM Richard Weinberger <richard@nod.at> wrote:
>
> Helen,
>
> Am Samstag, 3. November 2018, 04:53:39 CET schrieb Helen Koike:
> > As mentioned in the discussion from the previous version of this patch, Android
> > and Chrome OS do not use initramfs mostly due to boot time and size liability.
>
> Do you have numbers on that?

Originally, we saved ~200 ms, but I don't think we have recent
numbers.  (Unless Helen has some!) We first authored and posted this
patch in 2010:
- https://marc.info/?l=dm-devel&m=127429492521964&w=2
- https://marc.info/?l=dm-devel&m=127429499422096&w=2
- https://marc.info/?l=dm-devel&m=127429493922000&w=2

Every Chrome OS device uses a variant of this patch as well as
Android devices starting last year (if they use AVB 2.0).

Originally, the intent was the measured latency reduction.  We get a
linear speed
improvement when doing a cryptographic verification of the kernel and
initramfs.
Why? More data == more hashes (sha256 w/compute per block).  There's
additional overhead from bringing up early userspace, but those are the
numbers I don't have.

> I understand that using something like dracut with systemd inside is not what you
> want from a boot time point of view.
> But having an initramfs embedded into the kernel image which contains only a single
> static linked binary can be *very* small and fast.
> If you invest a little more time, you don't even need a libc, just fire up some
> syscalls to setup your dm. I use this technique regularly on deeply embedded systems
> to setup non-trivial UBIFS/crypto stuff.
>
> Want I'm trying to say, before adding ad-hoc a feature to the kernel, we should be
> very sure that there is no other way to solve this in a sane manner.
> We have initramfs support for reasons.

I very much appreciate the perspective, but after 8 years in shipping
devices after
integrating feedback from kernel maintainers over the subsequent years, this
doesn't feel like an "ad-hoc" feature.  It's been effective and fit in
well with the
existing kernel functionality, etc (imho :).  What level of
performance improvement or
other changes might be necessary to make the cut?

Thanks!
will
