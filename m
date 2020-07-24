Return-Path: <SRS0=Lhqp=BD=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BE2C433E0
	for <linux-doc@archiver.kernel.org>; Fri, 24 Jul 2020 13:40:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34FE3206C1
	for <linux-doc@archiver.kernel.org>; Fri, 24 Jul 2020 13:40:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SAzspK5s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbgGXNkT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Jul 2020 09:40:19 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:42187 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726424AbgGXNkT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Jul 2020 09:40:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595598016;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4TfOxZcpaEa2H+algx6u2vPL7TAVv/QDV7dH3yia8F8=;
        b=SAzspK5sbDu9sQIBINCIILA15Gm5K+KJ37Y3ESzdtfu63M/HazSQ2ml6QUFhlJEXLnPFOT
        91G+5B6g3NG9kmjBRQz0pGZN0BwZP9cvAiEr6qanfhmsJJ38Zkfpt1QqfP7rWfemD5lcZf
        nYoq7GEI2xkMM2/svRAhrgBWCIp8gks=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-zgjX5L4TNeeRzsfi3Ek2gw-1; Fri, 24 Jul 2020 09:40:15 -0400
X-MC-Unique: zgjX5L4TNeeRzsfi3Ek2gw-1
Received: by mail-wr1-f69.google.com with SMTP id m7so2160563wrb.20
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2020 06:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4TfOxZcpaEa2H+algx6u2vPL7TAVv/QDV7dH3yia8F8=;
        b=OfC9CWpXUxinRDrnqxPGeslMbY4tigxiiuWSJmmTIb6wnnV0y2jLnqFO5shaa3CWIp
         OPH/Y3/5+SU53CwbUI9vDlIdFEOCnUKcFpHh8ukmT7VuDSgC7VyEsw7Srv8zbOcNLid/
         yF8P2jdFluc4k8bAaQiEVW3fuuc0uk5a/Oy8TRBizrDix/1w/X0Pl2a2l7kfPrlFtq65
         r/BwssFVldjJg8MLgZ5208keaSrlLrTJxNWMgV4dTbPequLFnD1OJ7E9oH6GoFTCBASQ
         JSJCicz4qPpO/77PHsSZZP8y0d9E622PYhraoPMg3t7Df5ScJ0Nx58u5VxphG573vDWG
         Wftg==
X-Gm-Message-State: AOAM532476DH4oCa6CnDeXqFOIWg+q/h5Xs2/NZ4plfv/P87D+g0AA0s
        IkwC5a9BoLkqWE4wXlK0lnqked4MZc4HQT5h1b/3kRadUFe5/NXgSyBmJE2ORG3M4p8HJw6K362
        /ugXQRb6fPZ1p4eQ0l/5T
X-Received: by 2002:a05:600c:2f17:: with SMTP id r23mr8284214wmn.167.1595598013737;
        Fri, 24 Jul 2020 06:40:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8VnPXgqsoyC3ar0bB0O+0jlqCGTVMV4CCiYSeCno416YIN+T+netDRLs95hc35Ar3veFxTA==
X-Received: by 2002:a05:600c:2f17:: with SMTP id r23mr8284184wmn.167.1595598013471;
        Fri, 24 Jul 2020 06:40:13 -0700 (PDT)
Received: from redhat.com (bzq-79-179-105-63.red.bezeqint.net. [79.179.105.63])
        by smtp.gmail.com with ESMTPSA id p14sm1473367wrx.90.2020.07.24.06.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 06:40:12 -0700 (PDT)
Date:   Fri, 24 Jul 2020 09:40:07 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Nick Kralevich <nnk@google.com>
Cc:     Lokesh Gidra <lokeshgidra@google.com>,
        Jeffrey Vander Stoep <jeffv@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Kees Cook <keescook@chromium.org>,
        Daniel Colascione <dancol@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Mel Gorman <mgorman@techsingularity.net>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Peter Xu <peterx@redhat.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Jerome Glisse <jglisse@redhat.com>, Shaohua Li <shli@fb.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        Tim Murray <timmurray@google.com>,
        Minchan Kim <minchan@google.com>,
        Sandeep Patil <sspatil@google.com>, kernel@android.com,
        Daniel Colascione <dancol@dancol.org>,
        Kalesh Singh <kaleshsingh@google.com>
Subject: Re: [PATCH 2/2] Add a new sysctl knob:
 unprivileged_userfaultfd_user_mode_only
Message-ID: <20200724093852-mutt-send-email-mst@kernel.org>
References: <20200508125314-mutt-send-email-mst@kernel.org>
 <20200520045938.GC26186@redhat.com>
 <202005200921.2BD5A0ADD@keescook>
 <20200520194804.GJ26186@redhat.com>
 <20200520195134.GK26186@redhat.com>
 <CA+EESO4wEQz3CMxNLh8mQmTpUHdO+zZbV10zUfYGKEwfRPK2nQ@mail.gmail.com>
 <20200520211634.GL26186@redhat.com>
 <CABXk95A-E4NYqA5qVrPgDF18YW-z4_udzLwa0cdo2OfqVsy=SQ@mail.gmail.com>
 <CA+EESO4kLaje0yTOyMSxHfSLC0n86zAF+M1DWB_XrwFDLOCawQ@mail.gmail.com>
 <CAFJ0LnGfrzvVgtyZQ+UqRM6F3M7iXOhTkUBTc+9sV+=RrFntyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFJ0LnGfrzvVgtyZQ+UqRM6F3M7iXOhTkUBTc+9sV+=RrFntyQ@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 23, 2020 at 05:13:28PM -0700, Nick Kralevich wrote:
> On Thu, Jul 23, 2020 at 10:30 AM Lokesh Gidra <lokeshgidra@google.com> wrote:
> > From the discussion so far it seems that there is a consensus that
> > patch 1/2 in this series should be upstreamed in any case. Is there
> > anything that is pending on that patch?
> 
> That's my reading of this thread too.
> 
> > > > Unless I'm mistaken that you can already enforce bit 1 of the second
> > > > parameter of the userfaultfd syscall to be set with seccomp-bpf, this
> > > > would be more a question to the Android userland team.
> > > >
> > > > The question would be: does it ever happen that a seccomp filter isn't
> > > > already applied to unprivileged software running without
> > > > SYS_CAP_PTRACE capability?
> > >
> > > Yes.
> > >
> > > Android uses selinux as our primary sandboxing mechanism. We do use
> > > seccomp on a few processes, but we have found that it has a
> > > surprisingly high performance cost [1] on arm64 devices so turning it
> > > on system wide is not a good option.
> > >
> > > [1] https://lore.kernel.org/linux-security-module/202006011116.3F7109A@keescook/T/#m82ace19539ac595682affabdf652c0ffa5d27dad
> 
> As Jeff mentioned, seccomp is used strategically on Android, but is
> not applied to all processes. It's too expensive and impractical when
> simpler implementations (such as this sysctl) can exist. It's also
> significantly simpler to test a sysctl value for correctness as
> opposed to a seccomp filter.

Given that selinux is already used system-wide on Android, what is wrong
with using selinux to control userfaultfd as opposed to seccomp?


> > > >
> > > >
> > > > If answer is "no" the behavior of the new sysctl in patch 2/2 (in
> > > > subject) should be enforceable with minor changes to the BPF
> > > > assembly. Otherwise it'd require more changes.
> 
> It would be good to understand what these changes are.
> 
> > > > Why exactly is it preferable to enlarge the surface of attack of the
> > > > kernel and take the risk there is a real bug in userfaultfd code (not
> > > > just a facilitation of exploiting some other kernel bug) that leads to
> > > > a privilege escalation, when you still break 99% of userfaultfd users,
> > > > if you set with option "2"?
> 
> I can see your point if you think about the feature as a whole.
> However, distributions (such as Android) have specialized knowledge of
> their security environments, and may not want to support the typical
> usages of userfaultfd. For such distributions, providing a mechanism
> to prevent userfaultfd from being useful as an exploit primitive,
> while still allowing the very limited use of userfaultfd for userspace
> faults only, is desirable. Distributions shouldn't be forced into
> supporting 100% of the use cases envisioned by userfaultfd when their
> needs may be more specialized, and this sysctl knob empowers
> distributions to make this choice for themselves.
> 
> > > > Is the system owner really going to purely run on his systems CRIU
> > > > postcopy live migration (which already runs with CAP_SYS_PTRACE) and
> > > > nothing else that could break?
> 
> This is a great example of a capability which a distribution may not
> want to support, due to distribution specific security policies.
> 
> > > >
> > > > Option "2" to me looks with a single possible user, and incidentally
> > > > this single user can already enforce model "2" by only tweaking its
> > > > seccomp-bpf filters without applying 2/2. It'd be a bug if android
> > > > apps runs unprotected by seccomp regardless of 2/2.
> 
> Can you elaborate on what bug is present by processes being
> unprotected by seccomp?
> 
> Seccomp cannot be universally applied on Android due to previously
> mentioned performance concerns. Seccomp is used in Android primarily
> as a tool to enforce the list of allowed syscalls, so that such
> syscalls can be audited before being included as part of the Android
> API.
> 
> -- Nick
> 
> -- 
> Nick Kralevich | nnk@google.com

