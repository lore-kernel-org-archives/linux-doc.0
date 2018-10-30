Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3A78F7D08E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 30 Oct 2018 19:14:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbeJaEJk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 31 Oct 2018 00:09:40 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:41103 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbeJaEJj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Oct 2018 00:09:39 -0400
Received: by mail-yw1-f67.google.com with SMTP id c126-v6so5397436ywd.8
        for <linux-doc@vger.kernel.org>; Tue, 30 Oct 2018 12:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=snsTm8fAPGUfSdsnB6UIfUoFWMS1wWtbb4pqgSay4sA=;
        b=js+vjHyiVy7gKOcR4aV8aB6qbFEHm1tQBHbY/tnoGr1sJ0IsCxOkyAi588iqVgxxTD
         TmOGu3y1E6hYb+duMhWiN6w6UUykrHTIDJoGIUwZJUO/JjkT8puHgjty3vDuJLXFlBqB
         K/j7WHf8RIxqYMxXPYrBZLJd7iQ6TARKKl9ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=snsTm8fAPGUfSdsnB6UIfUoFWMS1wWtbb4pqgSay4sA=;
        b=ShlV8cEMgWrFXDlNptTOAlCLK8yhol7BUbCPM80zkOt257txKtMbCKUGj05ldILjlh
         rI/sgs+F8GSOPkCvkdWccEjV4dJkZVstehNqr+1uvYq+dVIc/3oLh9o2h3eehjnpaQDT
         Ue2Asz6aHkiYe+HOZ6VU+06DpxKMkPLiNzMQltv5THGTkHo28kGFLkm43aseq5JreODY
         mcP3zmep19iyPC2/feJZUIfktPNiZCPVB54davl8tPMPagdX1O0wB5l/3KZqRyX6VNW8
         fKIoe7s9JsoipCmBBhaRxt+GF+i4uL4S2X12Rdwj6u7kOnXAz3yvHP/LIDclyGjl/ASD
         n7CA==
X-Gm-Message-State: AGRZ1gLINwmtfYDzgmD6WvOJ4oZXUpvO9kkuQ5ts8ZbEfijc/CFX69fS
        DIlhVI4T3szGzAZ+dXECh4SCFwbgTLg=
X-Google-Smtp-Source: AJdET5dyaysGNh1DvR0OlyeUBbMHDDcoxPKDRXprv/9qrQvRmNceUpMc9M8q53m12pEcjlBxf42GuA==
X-Received: by 2002:a81:9e82:: with SMTP id v124-v6mr4010032ywg.258.1540926894778;
        Tue, 30 Oct 2018 12:14:54 -0700 (PDT)
Received: from mail-yw1-f48.google.com (mail-yw1-f48.google.com. [209.85.161.48])
        by smtp.gmail.com with ESMTPSA id e128-v6sm5915486ywd.77.2018.10.30.12.14.52
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 12:14:52 -0700 (PDT)
Received: by mail-yw1-f48.google.com with SMTP id c126-v6so5397336ywd.8
        for <linux-doc@vger.kernel.org>; Tue, 30 Oct 2018 12:14:52 -0700 (PDT)
X-Received: by 2002:a81:98cb:: with SMTP id p194-v6mr3973873ywg.353.1540926891605;
 Tue, 30 Oct 2018 12:14:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:3990:0:0:0:0:0 with HTTP; Tue, 30 Oct 2018 12:14:50
 -0700 (PDT)
In-Reply-To: <28C8CD2A-BDC0-49A5-854E-1E18968528B8@amacapital.net>
References: <20181023213504.28905-1-igor.stoppa@huawei.com>
 <20181023213504.28905-11-igor.stoppa@huawei.com> <20181026092609.GB3159@worktop.c.hoisthospitality.com>
 <CAGXu5jKCs01jvtvpEFS7R8qCR-5iRqK11kJxLJY99NicGWc4aQ@mail.gmail.com>
 <20181028183126.GB744@hirez.programming.kicks-ass.net> <40cd77ce-f234-3213-f3cb-0c3137c5e201@gmail.com>
 <20181030152641.GE8177@hirez.programming.kicks-ass.net> <CAGXu5jJftJ+Hq+jrZGHX5CTDLWOog7kGsd_Ne=yMvrRs__skSg@mail.gmail.com>
 <0A7AFB50-9ADE-4E12-B541-EC7839223B65@amacapital.net> <20181030175814.GB10491@bombadil.infradead.org>
 <28C8CD2A-BDC0-49A5-854E-1E18968528B8@amacapital.net>
From:   Kees Cook <keescook@chromium.org>
Date:   Tue, 30 Oct 2018 12:14:50 -0700
X-Gmail-Original-Message-ID: <CAGXu5jK583zi9NPP2hwm51z6FbF2kkr5Em61eSp3EnwYFnKZEw@mail.gmail.com>
Message-ID: <CAGXu5jK583zi9NPP2hwm51z6FbF2kkr5Em61eSp3EnwYFnKZEw@mail.gmail.com>
Subject: Re: [PATCH 10/17] prmem: documentation
To:     Andy Lutomirski <luto@amacapital.net>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Nadav Amit <nadav.amit@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Igor Stoppa <igor.stoppa@gmail.com>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Dave Chinner <david@fromorbit.com>,
        James Morris <jmorris@namei.org>,
        Michal Hocko <mhocko@kernel.org>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-integrity <linux-integrity@vger.kernel.org>,
        linux-security-module <linux-security-module@vger.kernel.org>,
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

On Tue, Oct 30, 2018 at 11:51 AM, Andy Lutomirski <luto@amacapital.net> wrote:
>
>
>> On Oct 30, 2018, at 10:58 AM, Matthew Wilcox <willy@infradead.org> wrote:
>>
>> On Tue, Oct 30, 2018 at 10:06:51AM -0700, Andy Lutomirski wrote:
>>>> On Oct 30, 2018, at 9:37 AM, Kees Cook <keescook@chromium.org> wrote:
>>> I support the addition of a rare-write mechanism to the upstream kernel.
>>> And I think that there is only one sane way to implement it: using an
>>> mm_struct. That mm_struct, just like any sane mm_struct, should only
>>> differ from init_mm in that it has extra mappings in the *user* region.
>>
>> I'd like to understand this approach a little better.  In a syscall path,
>> we run with the user task's mm.  What you're proposing is that when we
>> want to modify rare data, we switch to rare_mm which contains a
>> writable mapping to all the kernel data which is rare-write.
>>
>> So the API might look something like this:
>>
>>    void *p = rare_alloc(...);    /* writable pointer */
>>    p->a = x;
>>    q = rare_protect(p);        /* read-only pointer */
>>
>> To subsequently modify q,
>>
>>    p = rare_modify(q);
>>    q->a = y;
>>    rare_protect(p);
>
> How about:
>
> rare_write(&q->a, y);
>
> Or, for big writes:
>
> rare_write_copy(&q, local_q);
>
> This avoids a whole ton of issues.  In practice, actually running with a special mm requires preemption disabled as well as some other stuff, which Nadav carefully dealt with.

This is what I had before, yes:
https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=kspp/write-rarely&id=9ab0cb2618ebbc51f830ceaa06b7d2182fe1a52d

It just needs the switch_mm() backend.

-- 
Kees Cook
