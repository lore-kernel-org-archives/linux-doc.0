Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7D4467D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 31 Oct 2018 23:20:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730476AbeKAIU1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 1 Nov 2018 04:20:27 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33508 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731327AbeKAIU0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Nov 2018 04:20:26 -0400
Received: by mail-wm1-f67.google.com with SMTP id y140-v6so631751wmd.0
        for <linux-doc@vger.kernel.org>; Wed, 31 Oct 2018 16:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TT21JLJWskt2g1msOdcsqE48Bpu2vFvvh1THgqTNaLk=;
        b=Hm+tK84DOjoWRGUYFyb4UbI1bKiMKShx86X1Bc9gs/pD7Ec+J2XR+/e1q+GmMuV3/Z
         a+6xynZcyRqAhRGJMQjW3HJ6oCYcahrGfh9Q5lid44xbmndLew8FOZpSG0mdw8g1EocS
         wLV0PTpcLVoGhojbV4jGo0YLaMFENEZQBSRSwHhmJ/aRxeljkqSAkPArlmHGXuE+Zj6n
         UmSCEWBroNAjImrJK8FGEAwTTGHHvj3BydZrs/Nyee8XP2xV4qCWt82JPPL8Z5LhBg4w
         VVnQ9rZlpeNO6iibcMfV6xTggedC8VNzvwoTRa9Rcwtx6rrGT2Q5iBfhdk0gj2SyoSQh
         Omjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TT21JLJWskt2g1msOdcsqE48Bpu2vFvvh1THgqTNaLk=;
        b=WLa9P/7LimHB8G2icTqfMgm7NIRYsR35rBkCWyU2fS1XmfUIOuJa/X8cFpAw+yRetP
         oN/mVU6+vyUvtzO3w7pPqnekbssNa5c1kjxdKRNFyw11eC8vdqolcCO0lcIJuNyepmuY
         cpxLoTZ35wYrRUSLa47BFvE53eH9C0K315Id7XfZX0WGbRqoKbDOLTZdrQrcSH0JdfgV
         o47y5OyPUOf5Js7mDPoVzQXwhnPOiX+iIqOUBeXTWECYNJc56iLR2w9sKYO4QPA/vYeN
         BZMRkaIVBl3L006fTmGKY/E1NPJtywfaMSQySe4VP1QmGFA2eNkOYEADWQKx5ndo3GuV
         i5cw==
X-Gm-Message-State: AGRZ1gJMwZj1pWDOIvgVNIXRSvHURkFEUJzGJoD//CT7Sv77DS3hwxih
        yP6ncmcp42smcH6TNRchJJgVtfC+Pbs6IrRW6ACfcA==
X-Google-Smtp-Source: AJdET5cswhcW0zw1Us6QHlMtxL3CprdQtw+7uDz9uFv6Iqzb00eHjNGPMFZAGShwo2VCD4kwIJkFulljIuVotNUhcww=
X-Received: by 2002:a1c:4b1a:: with SMTP id y26-v6mr3933349wma.82.1541028010252;
 Wed, 31 Oct 2018 16:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAGXu5jJftJ+Hq+jrZGHX5CTDLWOog7kGsd_Ne=yMvrRs__skSg@mail.gmail.com>
 <0A7AFB50-9ADE-4E12-B541-EC7839223B65@amacapital.net> <20181030175814.GB10491@bombadil.infradead.org>
 <20181030182841.GE7343@cisco> <20181030192021.GC10491@bombadil.infradead.org>
 <9edbdf8b-b5fb-5a82-43b4-b639f5ec8484@gmail.com> <20181030213557.GE10491@bombadil.infradead.org>
 <CALCETrW1FcT88u0QY9k_PMOeZj0G8H6KNb5Bnreo-12NvmmCEQ@mail.gmail.com>
 <20181031100237.GN744@hirez.programming.kicks-ass.net> <659CFC78-22BF-492B-B2E4-B8E89AA08446@amacapital.net>
 <20181031210032.GA3159@hirez.programming.kicks-ass.net> <2E29C35B-3F98-473D-A874-0D9B9B15B399@amacapital.net>
 <4124995b-4363-9b37-19b1-1879bf04978b@gmail.com>
In-Reply-To: <4124995b-4363-9b37-19b1-1879bf04978b@gmail.com>
From:   Andy Lutomirski <luto@amacapital.net>
Date:   Wed, 31 Oct 2018 16:19:58 -0700
Message-ID: <CALCETrWCvAfyfBWgcmhy8TGByiX3ZXXSOkLtZFdM385fDqYJVw@mail.gmail.com>
Subject: Re: [PATCH 10/17] prmem: documentation
To:     Igor Stoppa <igor.stoppa@gmail.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Matthew Wilcox <willy@infradead.org>,
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 31, 2018 at 4:10 PM Igor Stoppa <igor.stoppa@gmail.com> wrote:
>
>
>
> On 01/11/2018 00:57, Andy Lutomirski wrote:
> >
> >
> >> On Oct 31, 2018, at 2:00 PM, Peter Zijlstra <peterz@infradead.org> wrote:
>
>
>
> >> I _think_ the use-case for atomics is updating the reference counts of
> >> objects that are in this write-rare domain. But I'm not entirely clear
> >> on that myself either. I just really want to avoid duplicating that
> >> stuff.
> >
> > Sounds nuts. Doing a rare-write is many hundreds of cycles at best. Using that for a reference count sounds wacky.
> >
> > Can we see a *real* use case before we over complicate the API?
> >
>
>
> Does patch #14 of this set not qualify? ima_htable.len ?
>
> https://www.openwall.com/lists/kernel-hardening/2018/10/23/20
>

Do you mean this (sorry for whitespace damage):

+ pratomic_long_inc(&ima_htable.len);

- atomic_long_inc(&ima_htable.len);
  if (update_htable) {
    key = ima_hash_key(entry->digest);
-   hlist_add_head_rcu(&qe->hnext, &ima_htable.queue[key]);
+   prhlist_add_head_rcu(&qe->hnext, &ima_htable.queue[key]);
  }

ISTM you don't need that atomic operation -- you could take a spinlock
and then just add one directly to the variable.

--Andy
