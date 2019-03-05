Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A3BDF7D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue,  5 Mar 2019 17:48:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730100AbfCERru (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Mar 2019 12:47:50 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33167 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730091AbfCERrt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Mar 2019 12:47:49 -0500
Received: by mail-pg1-f193.google.com with SMTP id h11so6134897pgl.0
        for <linux-doc@vger.kernel.org>; Tue, 05 Mar 2019 09:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gHJM1QM5EJjUOY2FDdaKsqaFOXK3eKenoExJbNcqN4g=;
        b=p2Y8hdNnqthiWdPWaqmFy7b/8k5R5/BmM19TtexhhrWTduZyd1hXY4SAlsKdKjdcPI
         sat72+hX+ZkqOFLb8LdG6frRV2OtpqnIvtHde17vUlUIvR5ceD/KeoyIS1GlzP+N5xK/
         u9EerRuH/goJiFrHsvZzQvnJBSrIj70uKlg5qfpjpHnK+3pQf5iWM67T1SrG4ybBTvVt
         nLxM02ayT0Y0fMLUulujQe30SOR0DSgftsFb1H6mDwY74OgZRJx4phYor6WZSVxbIsDK
         myhDVYqAdqOKhriLkvtPoMwKzAS1kM6d+LD+r4uhhuiNhJStX3Y7uIGJ0qshrYteS8OD
         MDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gHJM1QM5EJjUOY2FDdaKsqaFOXK3eKenoExJbNcqN4g=;
        b=KZ+BqeATVkBFa2hwJ2SJxbNWOQDFJEtiTtnq1RcLZ+r3hkYFeCeSWb6mIwUCVMxNjL
         7P1uLdBFmZIAXT+bxxNera39OHjOCY5T4qyhlViPwRtMdBLXm4L3/p/J1mKa83sW3XsL
         aGLvruWnQxQg3pDirzGiS93mhOTKYidTYBxzrMrZYqIqKFv/JLjzUGfB0n/7YAaoCq6W
         bzV3IXB+73deZEfN+jD2mDWGrIJqgK0DgrnPS4Wom9ORl7Saf9m7exiwXWRZlYUXfvbo
         q50v/VqBe09KlFlxPHWeSEjEGlnQ5t0/pPqcO+wwQCZ8226NgdKg29ztbovODFIN4g2j
         u/Ig==
X-Gm-Message-State: APjAAAUBBKy0HzRMwbpSnOHGmKUL5TgJ5QsHX10vNb/V1X5YGTaYbXQK
        qc5hwQ22sfflYOeW3/xdU8/CeazRZ8+KEACjluzNMg==
X-Google-Smtp-Source: APXvYqwDj3NnoGrQ2kCWYrAH9v9f6KsnKIVl5PHMyojxupslR+Vg36DkEhtUHfsEu9xerxBBdBjMih96qnmG5qP52o4=
X-Received: by 2002:a65:6651:: with SMTP id z17mr2299629pgv.95.1551808068440;
 Tue, 05 Mar 2019 09:47:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1550839937.git.andreyknvl@google.com> <8343cd77ca301df15839796f3b446b75ce5ffbbf.1550839937.git.andreyknvl@google.com>
 <73f2f3fe-9a66-22a1-5aae-c282779a75f5@intel.com> <CAAeHK+yQU8khtOoyDKqmHterCa16P7oWe9AMiPnrxE+Gyb_7aw@mail.gmail.com>
 <20190301165908.GA130541@arrakis.emea.arm.com> <fb721f0b-fad7-2310-4f17-8bf046413d40@intel.com>
In-Reply-To: <fb721f0b-fad7-2310-4f17-8bf046413d40@intel.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 5 Mar 2019 18:47:37 +0100
Message-ID: <CAAeHK+ydurtkoVtvyoQdfcXuR3ZnZ+=ixoZkXEFRTZARg+GtRQ@mail.gmail.com>
Subject: Re: [PATCH v10 07/12] fs, arm64: untag user pointers in fs/userfaultfd.c
To:     Dave Hansen <dave.hansen@intel.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 1, 2019 at 7:37 PM Dave Hansen <dave.hansen@intel.com> wrote:
>
> On 3/1/19 8:59 AM, Catalin Marinas wrote:
> >>> So, we have to patch all these sites before the tagged values get to the
> >>> point of hitting the vma lookup functions.  Dumb question: Why don't we
> >>> just patch the vma lookup functions themselves instead of all of these
> >>> callers?
> >> That might be a working approach as well. We'll still need to fix up
> >> places where the vma fields are accessed directly. Catalin, what do
> >> you think?
> > Most callers of find_vma*() always follow it by a check of
> > vma->vma_start against some tagged address ('end' in the
> > userfaultfd_(un)register()) case. So it's not sufficient to untag it in
> > find_vma().
>
> If that's truly the common case, sounds like we should have a find_vma()
> that does the vma_end checking as well.  Then at least the common case
> would not have to worry about tagging.

It seems that a lot of find_vma() callers indeed do different kinds of
checking/subtractions of vma->vma_start and a tagged address, which
look hardly unifiable. So untagging the addresses in find_vma()
callers looks like a more suitable solution.
