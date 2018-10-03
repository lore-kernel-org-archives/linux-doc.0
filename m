Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 98C9D7D087
	for <lwn-linux-doc@archive.lwn.net>; Wed,  3 Oct 2018 16:53:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbeJCXmT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 3 Oct 2018 19:42:19 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42670 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726842AbeJCXmT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Oct 2018 19:42:19 -0400
Received: by mail-oi1-f195.google.com with SMTP id w81-v6so5087269oiw.9
        for <linux-doc@vger.kernel.org>; Wed, 03 Oct 2018 09:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nOMoFA3pt/QNOFKVsymAykXxw42vbOxgzwDRgQONvqg=;
        b=KwTNb3H7GJ22hmUX3//uimOh8uaXG4prsMS3Q1oIb/u8ig/iSyMkdORLercP6AudDx
         GypyylYCdQ8U6AS4mxmQZyqMqpjVOnaKZ5LMriU1RBuzrm9SX8SaUIHVYTpuuGVqUOAW
         QrNTYZSKZ3VQR6g+Z6G1h7U4XtLkU64BpJUhsNwbQSuWNlLA+iJhzozoBtiaqP9zp/g3
         iPWX/E1ehxsMuAwOpIfO9k70VOge5RkoCRjVdEYPUOtATM1lFv2oagfBdCmBbcVS1c3I
         AoGG3ywH5uziYCeHth3pZac/8sYfgwB/L9raS44ZDWXELXErApSGVy/X+mGSDs+HAzmm
         Offw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nOMoFA3pt/QNOFKVsymAykXxw42vbOxgzwDRgQONvqg=;
        b=l0ROPl9oGRRP5At81RVVrpPztRqgdE08bqjdoo2UYO0CqhaZHtkwgK+0iHiJvLXb2+
         3nTx5QNZwIUrt24chHKz+yH/jYodvi2mejvyyKK38iUVoX97JL9SbS18AbkRDVwJGTlJ
         ohu3UpONn8nhbXmfNFNLSX+Uf/PGtGQKeRWOvjYWT5bEsAFji3K0yhzTzBXpRFyElR2x
         0JYC9bAT97zRYfw6voPEYholZMlmNkwkBaxwhJVlB8WcoEje5sNw0Nq/ejWPbs5Si+4F
         JUD1/B9elOZ+weV/yOUvNznGriN+L41Uv0CQCgkcGPceLNASsTfYdrxc07YeW36QNgTG
         j93A==
X-Gm-Message-State: ABuFfojnIPhHptaOm2IXQzbf3L65SqBi/NXoiC2QuKmNUnwo8g1+jAyg
        Rxn3MHTOjB10Niofj7eXL25VLUwuSqoNZAaK6m1itw==
X-Google-Smtp-Source: ACcGV63JI8IiOqsmHcLUF1uEUpbHHkcIc7xNmypxFvwN+flAdjV/Q3n9pQxCYQbKPcpL0fku7RjAo1YAcXTY4PAPF3c=
X-Received: by 2002:aca:d513:: with SMTP id m19-v6mr1205223oig.82.1538585586555;
 Wed, 03 Oct 2018 09:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <20180921150351.20898-1-yu-cheng.yu@intel.com> <20180921150351.20898-25-yu-cheng.yu@intel.com>
 <20181003045611.GB22724@asgard.redhat.com> <CALCETrU-Ny-uC1NqRedQwNKe2MMhsFEqZ08TtHJwbLfCACMmLw@mail.gmail.com>
 <5ddb0ad33298d1858e530fce9c9ea2788b2fac81.camel@intel.com> <20181003163226.GC9449@asgard.redhat.com>
In-Reply-To: <20181003163226.GC9449@asgard.redhat.com>
From:   Jann Horn <jannh@google.com>
Date:   Wed, 3 Oct 2018 18:52:40 +0200
Message-ID: <CAG48ez0KZYv9BECMm0-BNypJ232jrdkFp6_4VYTA=WoB-8w89w@mail.gmail.com>
Subject: Re: [RFC PATCH v4 24/27] mm/mmap: Create a guard area between VMAs
To:     Eugene Syromiatnikov <esyr@redhat.com>
Cc:     yu-cheng.yu@intel.com, Andy Lutomirski <luto@amacapital.net>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Florian Weimer <fweimer@redhat.com>, hjl.tools@gmail.com,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>, rdunlap@infradead.org,
        ravi.v.shankar@intel.com, vedvyas.shanbhogue@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 3, 2018 at 6:32 PM Eugene Syromiatnikov <esyr@redhat.com> wrote:
> On Wed, Oct 03, 2018 at 09:00:04AM -0700, Yu-cheng Yu wrote:
> > On Tue, 2018-10-02 at 22:36 -0700, Andy Lutomirski wrote:
> > > On Tue, Oct 2, 2018 at 9:55 PM Eugene Syromiatnikov <esyr@redhat.com> wrote:
> > > >
> > > > On Fri, Sep 21, 2018 at 08:03:48AM -0700, Yu-cheng Yu wrote:
> > > > > Create a guard area between VMAs, to detect memory corruption.
> > > >
> > > > Do I understand correctly that with this patch a user space program
> > > > no longer be able to place two mappings back to back? If it is so,
> > > > it will likely break a lot of things; for example, it's a common ring
> > > > buffer implementations technique, to map buffer memory twice back
> > > > to back in order to avoid special handling of items wrapping its end.
> > >
> > > I haven't checked what the patch actually does, but it shouldn't have
> > > any affect on MAP_FIXED or the new no-replace MAP_FIXED variant.
> > >
> > > --Andy
> >
> > I did some mmap tests with/without MAP_FIXED, and it works as intended.
> > In addition to the ring buffer, are there other test cases?
>
> Right, after some more code reading I figured out that it indeed
> shouldn't affect MAP_FIXED, thank you for confirmation.
>
> I'm not sure, however, whether such a change that provides no ability
> to configure or affect it will go well with all the supported
> architectures.

Is there a concrete reason why you think an architecture might not
like this? As far as I can tell, the virtual address space overhead
should be insignificant even for 32-bit systems.
