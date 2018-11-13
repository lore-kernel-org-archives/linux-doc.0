Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D12E77D8E7
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Nov 2018 11:57:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732835AbeKMVzT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Nov 2018 16:55:19 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38927 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732800AbeKMVzS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Nov 2018 16:55:18 -0500
Received: by mail-ot1-f67.google.com with SMTP id g27so11031527oth.6
        for <linux-doc@vger.kernel.org>; Tue, 13 Nov 2018 03:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synesis-ru.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RTpv4y3ps9AwvH0hQZfskeWcNSFNgvE5UaeYh5e40Tw=;
        b=aOPCIktWafRPgjEnmLSsFJDzHpY4Y1R3c336ROWrQzqZR3D2IPNT5tnpO4HfYtgrOT
         EBxM1FusAWeGRkexwU1xA5YF863SxImAaQAIbaIIUurCWARFliEcTHcRyp8ZJgr3SWnY
         k2AWaodjLu8EzPqmVHgUHVYB99xN+aTKCnFZyej3EEIn9BHdB23CIBq97zObV3U/xJKD
         a9hutWeu3ttb7O/PdWhws2Gs47TcJEqZjE26p6347owllY0g75QKPiTuJftJKsAb6zyq
         zOotThEv3Bw60tqvfJYHpIkbqCqGDhzCEfPKtZwbK4/77r4lU7BdmexnO98Ic0OXVtpD
         NPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RTpv4y3ps9AwvH0hQZfskeWcNSFNgvE5UaeYh5e40Tw=;
        b=l65TZzIu+dohvcvWOtZdSfz033JZ7s5wYWQDB+yFp6dwj/xeXNfsYjVTonvyuOqhfm
         o4A051VFmB8HfXInyJ4L66pPQ3p98ZpTTdJSa9EpSQHRWGae4UkPw4GzU0vmKZdLCPdi
         ELJXQybnxiVGEEWYqMmRg4rp1BW+0zVm9oftxbersUIyLiIqkhRTcnGwSyYTcgEXaMjp
         9JsaqBz1Qi2Dmtjui2aVD/6TCjh3hhE9u4L421RzY5cmfW9hCfaWFI1od16otX8dslVE
         ikpFr3+xFgsSfpesZ6lEzUk+dpadDAHi0bn5e11+PUcoOL5vpbcNyRaTIuiuUPPUrR0O
         LMtA==
X-Gm-Message-State: AGRZ1gI5xf4HyhH5si2NlXlo5xNX6XUK5lVZadBEGhC8vgHQq/9sB+wr
        VdDSJJkVmQdFIVRBFNcC7CnbXEfZHEaCcX5W
X-Google-Smtp-Source: AJdET5fH0Ka8WRlywFR1j5E+RffK9mR/RYo9rWzsIrcJAGRGUGWa6keFPUsTQRLZVZEok9fR/T0fQQ==
X-Received: by 2002:a9d:4687:: with SMTP id z7mr3052861ote.350.1542110249472;
        Tue, 13 Nov 2018 03:57:29 -0800 (PST)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id y204-v6sm9260461oiy.40.2018.11.13.03.57.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Nov 2018 03:57:28 -0800 (PST)
Received: by mail-oi1-f173.google.com with SMTP id v198-v6so10052079oif.2;
        Tue, 13 Nov 2018 03:57:28 -0800 (PST)
X-Received: by 2002:aca:dcd7:: with SMTP id t206-v6mr2902456oig.59.1542110247851;
 Tue, 13 Nov 2018 03:57:27 -0800 (PST)
MIME-Version: 1.0
References: <b4c41073d763dc5798562233de8eaa6d@natalenko.name>
In-Reply-To: <b4c41073d763dc5798562233de8eaa6d@natalenko.name>
From:   Timofey Titovets <timofey.titovets@synesis.ru>
Date:   Tue, 13 Nov 2018 14:56:51 +0300
X-Gmail-Original-Message-ID: <CAGqmi742UNjRLTT-XuKFBfQc14mjHJPNQ6bbpRojniz6-At9Rg@mail.gmail.com>
Message-ID: <CAGqmi742UNjRLTT-XuKFBfQc14mjHJPNQ6bbpRojniz6-At9Rg@mail.gmail.com>
Subject: Re: [PATCH V3] KSM: allow dedup all tasks memory
To:     oleksandr@natalenko.name
Cc:     linux-doc@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

=D0=B2=D1=82, 13 =D0=BD=D0=BE=D1=8F=D0=B1. 2018 =D0=B3. =D0=B2 14:06, Oleks=
andr Natalenko <oleksandr@natalenko.name>:
>
> Hi.
>
> > ksm by default working only on memory that added by
> > madvise().
> >
> > And only way get that work on other applications:
> >   * Use LD_PRELOAD and libraries
> >   * Patch kernel
> >
> > Lets use kernel task list and add logic to import VMAs from tasks.
> >
> > That behaviour controlled by new attributes:
> >   * mode:
> >     I try mimic hugepages attribute, so mode have two states:
> >       * madvise      - old default behaviour
> >       * always [new] - allow ksm to get tasks vma and
> >                        try working on that.
> >   * seeker_sleep_millisecs:
> >     Add pauses between imports tasks VMA
> >
> > For rate limiting proporses and tasklist locking time,
> > ksm seeker thread only import VMAs from one task per loop.
> >
> > Some numbers from different not madvised workloads.
> > Formulas:
> >   Percentage ratio =3D (pages_sharing - pages_shared)/pages_unshared
> >   Memory saved =3D (pages_sharing - pages_shared)*4/1024 MiB
> >   Memory used =3D free -h
> >
> >   * Name: My working laptop
> >     Description: Many different chrome/electron apps + KDE
> >     Ratio: 5%
> >     Saved: ~100  MiB
> >     Used:  ~2000 MiB
> >
> >   * Name: K8s test VM
> >     Description: Some small random running docker images
> >     Ratio: 40%
> >     Saved: ~160 MiB
> >     Used:  ~920 MiB
> >
> >   * Name: Ceph test VM
> >     Description: Ceph Mon/OSD, some containers
> >     Ratio: 20%
> >     Saved: ~60 MiB
> >     Used:  ~600 MiB
> >
> >   * Name: BareMetal K8s backend server
> >     Description: Different server apps in containers C, Java, GO & etc
> >     Ratio: 72%
> >     Saved: ~5800 MiB
> >     Used:  ~35.7 GiB
> >
> >   * Name: BareMetal K8s processing server
> >     Description: Many instance of one CPU intensive application
> >     Ratio: 55%
> >     Saved: ~2600 MiB
> >     Used:  ~28.0 GiB
> >
> >   * Name: BareMetal Ceph node
> >     Description: Only OSD storage daemons running
> >     Raio: 2%
> >     Saved: ~190 MiB
> >     Used:  ~11.7 GiB
>
> Out of curiosity, have you compared these results with UKSM [1]?
>
> Thanks.
>
> --
>    Oleksandr Natalenko (post-factum)
>
> [1] https://github.com/dolohow/uksm

Long story short:
I try get UKSM code in kernel, and i mostly know how UKSM works.
Yep, UKSM implement logic in different way, but UKSM _always_ will have
same or worse numbers (saved pages) in compare to KSM.

Why?

Both scan VMA pages and filter VMA by some flags (same set of flags).
So they both will see same subset of pages, which can be deduped.
But UKSM also try not dedup VMA pages, if some of VMA pages changes
more frequently - trashing.
Because of that UKSM will skip some pages, but KSM will try dedup all
pages, not changed between scans.

I skip UKSM internal logic, which can work better of course in
resource usage terms
(different hash implementation, different page tree),
but that doesn't matter in that case (if we talk about saved memory).

Only thing what UKSM have, which KSM can't do:
UKSM can add VMA memory it self, by hooks in mm.

KSM currently need help by madvise() for that.
That the reason, why i write that patchset for KSM.
(I also wrote some info to Pavel Tatashin in above mail)

Thanks!
