Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 91F597D099
	for <lwn-linux-doc@archive.lwn.net>; Wed, 31 Oct 2018 22:57:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbeKAH5c (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 1 Nov 2018 03:57:32 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36424 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbeKAH5c (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Nov 2018 03:57:32 -0400
Received: by mail-pg1-f195.google.com with SMTP id z17-v6so8077547pgv.3
        for <linux-doc@vger.kernel.org>; Wed, 31 Oct 2018 15:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=n0Ec4UIkmIFaXdLaKx8d10v+kEQ/S8QwTFP4Ju9+XIM=;
        b=YOA5bkN4RBQmzFnIYByHkp6ApHC29nw5jt7DSYyz2rmzovtX6LoYVVrBsAyhm250g6
         g25SGJ1WbLfFylxWP7IR8TvL48zvGlJx1YdejaY7RJvXS0J+p93K7VDdpyk7LZJ9Zi9f
         idY2BvWApYnVDGfRqS28tEEIZioehsCcZ80zKqN2pEqvmh+BYk2xaSy6YrodA5fhB/Gs
         s1yQbfe99H99aEHvkgzeDpP7bhoLLdcAAuZ8sP7oW0CI8eDNaY6BTBPsQi+AShz61zd1
         fUTJGJcAUGVHvpEPNMO3LhoeD+VYbuNuQ+Z6+rPs19wRHJBCpb671D309/zvYe1C4Ylq
         DD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=n0Ec4UIkmIFaXdLaKx8d10v+kEQ/S8QwTFP4Ju9+XIM=;
        b=fnwP71spqaC0g8kB+u+9qb1h9q/0rFTCLshqUyE15NEf1aGj80kDSNS6wric6VStlF
         F8LKqVTSMlIQcuraKFrrWB+tpLluOh28GazT+Re+XyJs9ZUf0t9l6uH/Qlj1XORo+M+Z
         RpbTXQM/hNlglvoeaZF4mrmBASMlH5c0m58TVWUfRagvhFIdzUqL+Ljr2T3hxrZoRdfE
         wmC+hdBl57SM2tSerZdYKdiQsmeGkDJwtLKz11jaPx+zrND6A2AyJfcUwAD0OWElwGJA
         yNFJZkK6u9Og6t5JlyRNzHGx5pxTQmnwcI8GV+viMte5qlKq9S8hAmb9OTiScJXh2/Zl
         zaPw==
X-Gm-Message-State: AGRZ1gKcx0W/KWYH77OdG7VsUTXOJUF5oBfDOYXnYJZo1eR8kJj09GRk
        4tQqYHArEYnRoK5yUmyd3z4fxA==
X-Google-Smtp-Source: AJdET5dWTy0pFnmr36sgi8cH9jkzz159M9xJRRtFv0PrhiMDAJml9j8FBUi/1aEY1PP6YuCYTjcW+w==
X-Received: by 2002:a62:4784:: with SMTP id p4-v6mr5136341pfi.257.1541026643529;
        Wed, 31 Oct 2018 15:57:23 -0700 (PDT)
Received: from ?IPv6:2601:646:c200:7429:3d1b:ef7:2c4c:5b1? ([2601:646:c200:7429:3d1b:ef7:2c4c:5b1])
        by smtp.gmail.com with ESMTPSA id m19-v6sm27298910pgv.93.2018.10.31.15.57.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Oct 2018 15:57:22 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 10/17] prmem: documentation
From:   Andy Lutomirski <luto@amacapital.net>
X-Mailer: iPhone Mail (16A404)
In-Reply-To: <20181031210032.GA3159@hirez.programming.kicks-ass.net>
Date:   Wed, 31 Oct 2018 15:57:21 -0700
Cc:     Matthew Wilcox <willy@infradead.org>,
        Igor Stoppa <igor.stoppa@gmail.com>,
        Tycho Andersen <tycho@tycho.ws>,
        Kees Cook <keescook@chromium.org>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Dave Chinner <david@fromorbit.com>,
        James Morris <jmorris@namei.org>,
        Michal Hocko <mhocko@kernel.org>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-integrity <linux-integrity@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        Igor Stoppa <igor.stoppa@huawei.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Laura Abbott <labbott@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2E29C35B-3F98-473D-A874-0D9B9B15B399@amacapital.net>
References: <CAGXu5jJftJ+Hq+jrZGHX5CTDLWOog7kGsd_Ne=yMvrRs__skSg@mail.gmail.com> <0A7AFB50-9ADE-4E12-B541-EC7839223B65@amacapital.net> <20181030175814.GB10491@bombadil.infradead.org> <20181030182841.GE7343@cisco> <20181030192021.GC10491@bombadil.infradead.org> <9edbdf8b-b5fb-5a82-43b4-b639f5ec8484@gmail.com> <20181030213557.GE10491@bombadil.infradead.org> <CALCETrW1FcT88u0QY9k_PMOeZj0G8H6KNb5Bnreo-12NvmmCEQ@mail.gmail.com> <20181031100237.GN744@hirez.programming.kicks-ass.net> <659CFC78-22BF-492B-B2E4-B8E89AA08446@amacapital.net> <20181031210032.GA3159@hirez.programming.kicks-ass.net>
To:     Peter Zijlstra <peterz@infradead.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



> On Oct 31, 2018, at 2:00 PM, Peter Zijlstra <peterz@infradead.org> wrote:
>=20
>> On Wed, Oct 31, 2018 at 01:36:48PM -0700, Andy Lutomirski wrote:
>>=20
>>>> On Oct 31, 2018, at 3:02 AM, Peter Zijlstra <peterz@infradead.org> wrot=
e:
>>>>=20
>>>> On Tue, Oct 30, 2018 at 09:41:13PM -0700, Andy Lutomirski wrote:
>>>> To clarify some of this thread, I think that the fact that rare_write
>>>> uses an mm_struct and alias mappings under the hood should be
>>>> completely invisible to users of the API.  No one should ever be
>>>> handed a writable pointer to rare_write memory (except perhaps during
>>>> bootup or when initializing a large complex data structure that will
>>>> be rare_write but isn't yet, e.g. the policy db).
>>>=20
>>> Being able to use pointers would make it far easier to do atomics and
>>> other things though.
>>=20
>> This stuff is called *rare* write for a reason. Do we really want to
>> allow atomics beyond just store-release?  Taking a big lock and then
>> writing in the right order should cover everything, no?
>=20
> Ah, so no. That naming is very misleading.
>=20
> We modify page-tables a _lot_. The point is that only a few sanctioned
> sites are allowed writing to it, not everybody.
>=20
> I _think_ the use-case for atomics is updating the reference counts of
> objects that are in this write-rare domain. But I'm not entirely clear
> on that myself either. I just really want to avoid duplicating that
> stuff.

Sounds nuts. Doing a rare-write is many hundreds of cycles at best. Using th=
at for a reference count sounds wacky.

Can we see a *real* use case before we over complicate the API?=
