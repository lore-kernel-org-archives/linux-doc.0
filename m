Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_MED,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 20F727D2EE
	for <lwn-linux-doc@archive.lwn.net>; Thu, 30 Aug 2018 21:47:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbeHaBv5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 30 Aug 2018 21:51:57 -0400
Received: from mail-oi0-f67.google.com ([209.85.218.67]:40816 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbeHaBv5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Aug 2018 21:51:57 -0400
Received: by mail-oi0-f67.google.com with SMTP id l202-v6so18176709oig.7
        for <linux-doc@vger.kernel.org>; Thu, 30 Aug 2018 14:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iaT0h/QgNT8sE8GySblfJoYXW8enXi0AAre2vg3buV0=;
        b=NBubt9wcw+/0s63cmiYLXoH9kAVRsfZt6IDpaCJpaLmDusgHk7Kw7ljeaRtbqrF5vS
         rBn/eZ16sCt+nIYjnjnPpmQ5OVfp1qCM94qOsSUbPwj+oBfsBdHoBypTaSTK2i8yvmQH
         ZmOvDWNQQvrP1Oox5HTX+ZZgbN/Mzb3AWKYH+Lc1GssGRS+R8Rr2K/XLZRHLRVoDKy5h
         KGzkEamEqwKQ08J9A35nvMTTM/MxeKYZ2Cb+VYAu9lx+2NoPJEOBFg5hzpQ9Al96YZZ2
         eMTmua7sBN2aaR4JGccyyxLxudwQGKX/gnL6Kh5oyI8d+h9qlgO8ImqZHeMKQSsLvs1S
         tf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iaT0h/QgNT8sE8GySblfJoYXW8enXi0AAre2vg3buV0=;
        b=fY6VV5Z/UuHdEK+lwo8ly04pphyolRE3EO8gZUm5cTuaClTS6cZtRlYARRv+wxw3RK
         Yewbboug8hjPOpKWhE/+O/aciLPDvz4Vbbmr8a7DN09KF4WZa+FE8MCmgkBzFUPTREy1
         5pLYfABV19RXyyUjHudV3aU7lrkdvLctFhgGLF8KvsQLPFK1lTjyDm9wCxnepBXFyUwF
         DDmXRU2J/OhnXV8a5v6N4MMIY/Onwc2hTwA95ND6z/Nh3qZnJ3CcnN1q549KwaZ954J6
         8guUNVTyEWUiOpDEdNQLMiOL49ePHjuAb4W0nJFEc/9YMZNWN/Kb0IU3kIN0BOXsM3OP
         UNiw==
X-Gm-Message-State: APzg51BjPZPUSDk/DbYjRUNrdlWF9/I5MqonAtZNhdi7In7dr9We6xdK
        DJ7j/s2J8W1fs2mNVp2BQRiAAEPZnj341C42GJJjRw==
X-Google-Smtp-Source: ANB0Vdan0PD6Y6DNOP+WgoyJfrpQDFTXJe4T+//HSR164qwrG892AVmPFwIIG150TTzv613A+WXr2oh4ujV48PjLMy0=
X-Received: by 2002:aca:c585:: with SMTP id v127-v6mr4610021oif.348.1535665663220;
 Thu, 30 Aug 2018 14:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <20180830143904.3168-1-yu-cheng.yu@intel.com> <20180830143904.3168-13-yu-cheng.yu@intel.com>
 <CAG48ez0Rca0XsdXJZ07c+iGPyep0Gpxw+sxQuACP5gyPaBgDKA@mail.gmail.com>
 <079a55f2-4654-4adf-a6ef-6e480b594a2f@linux.intel.com> <CAG48ez2gHOD9hH4+0wek5vUOv9upj79XWoug2SXjdwfXWoQqxw@mail.gmail.com>
 <ce051b5b-feef-376f-e085-11f65a5f2215@linux.intel.com> <1535649960.26689.15.camel@intel.com>
 <33d45a12-513c-eba2-a2de-3d6b630e928e@linux.intel.com> <1535651666.27823.6.camel@intel.com>
 <CAG48ez3ixWROuQc6WZze6qPL6q0e_gCnMU4XF11JUWziePsBJg@mail.gmail.com>
 <1535660494.28258.36.camel@intel.com> <CAG48ez0yOuDhqxB779aO3Kss3gQ3cZTJL1VphDXQm+_M9jFPvQ@mail.gmail.com>
 <1535662366.28781.6.camel@intel.com> <CAG48ez0mkr95_TbLQnDGuGUd6G+eJVLZ-fEjDkwA6dSrm+9tLw@mail.gmail.com>
In-Reply-To: <CAG48ez0mkr95_TbLQnDGuGUd6G+eJVLZ-fEjDkwA6dSrm+9tLw@mail.gmail.com>
From:   Jann Horn <jannh@google.com>
Date:   Thu, 30 Aug 2018 23:47:16 +0200
Message-ID: <CAG48ez3S3+DzAyo_SnoUW1GO0Cpd_x0A83MOx2p_MkogoAatLQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 12/24] x86/mm: Modify ptep_set_wrprotect and
 pmdp_set_wrprotect for _PAGE_DIRTY_SW
To:     yu-cheng.yu@intel.com
Cc:     Dave Hansen <dave.hansen@linux.intel.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@amacapital.net>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Florian Weimer <fweimer@redhat.com>, hjl.tools@gmail.com,
        Jonathan Corbet <corbet@lwn.net>, keescook@chromiun.org,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        ravi.v.shankar@intel.com, vedvyas.shanbhogue@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 30, 2018 at 11:01 PM Jann Horn <jannh@google.com> wrote:
>
> On Thu, Aug 30, 2018 at 10:57 PM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
> >
> > On Thu, 2018-08-30 at 22:44 +0200, Jann Horn wrote:
> > > On Thu, Aug 30, 2018 at 10:25 PM Yu-cheng Yu <yu-cheng.yu@intel.com>
> > > wrote:
> > ...
> > > > In the flow you described, if C writes to the overflow page before
> > > > B
> > > > gets in with a 'call', the return address is still correct for
> > > > B.  To
> > > > make an attack, C needs to write again before the TLB flush.  I
> > > > agree
> > > > that is possible.
> > > >
> > > > Assume we have a guard page, can someone in the short window do
> > > > recursive calls in B, move ssp to the end of the guard page, and
> > > > trigger the same again?  He can simply take the incssp route.
> > > I don't understand what you're saying. If the shadow stack is
> > > between
> > > guard pages, you should never be able to move SSP past that area's
> > > guard pages without an appropriate shadow stack token (not even with
> > > INCSSP, since that has a maximum range of PAGE_SIZE/2), and
> > > therefore,
> > > it shouldn't matter whether memory outside that range is incorrectly
> > > marked as shadow stack. Am I missing something?
> >
> > INCSSP has a range of 256, but we can do multiple of that.
> > But I realize the key is not to have the transient SHSTK page at all.
> > The guard page is !pte_write() and even we have flaws in
> > ptep_set_wrprotect(), there will not be any transient SHSTK pages. I
> > will add guard pages to both ends.
> >
> > Still thinking how to fix ptep_set_wrprotect().
>
> cmpxchg loop? Or is that slow?

Something like this:

static inline void ptep_set_wrprotect(struct mm_struct *mm,
                                      unsigned long addr, pte_t *ptep)
{
        pte_t pte = READ_ONCE(*ptep), new_pte;

        /* ... your comment about not needing a TLB shootdown here ... */
        do {
                pte = pte_wrprotect(pte);
                /* note: relies on _PAGE_DIRTY_HW < _PAGE_DIRTY_SW */
                /* dirty direct bit-twiddling; you can probably write
this in a nicer way */
                pte.pte |= (pte.pte & _PAGE_DIRTY_HW) >>
_PAGE_BIT_DIRTY_HW << _PAGE_BIT_DIRTY_SW;
                pte.pte &= ~_PAGE_DIRTY_HW;
                pte = cmpxchg(ptep, pte, new_pte);
        } while (pte != new_pte);
}

I think this has the advantage of not generating weird spurious pagefaults.
It's not compatible with Xen PV, but I'm guessing that this whole
feature isn't going to support Xen PV anyway? So you could switch
between two implementations of ptep_set_wrprotect using the pvop
mechanism or so - one for environments that support shadow stacks, one
for all other environments.
Or is there some arcane reason why cmpxchg doesn't work here the way I
think it should?
