Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7C7C67D089
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Nov 2018 22:49:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390289AbeKVJZi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 22 Nov 2018 04:25:38 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46397 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390287AbeKVJZi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Nov 2018 04:25:38 -0500
Received: by mail-oi1-f193.google.com with SMTP id x202so5901409oif.13
        for <linux-doc@vger.kernel.org>; Wed, 21 Nov 2018 14:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P3FMEDsZInXhnswagiHhBthQ6heysrNaLGS/9ZfO7uw=;
        b=VzS47Rt66GFvNWfCDJ1DW/b0qFkwE7ib46Do+PS92hb5mTKPxFPj0KwoGl2+V/1nuP
         GojHCWtpSuW0JtcEnCk15qGvA/XiDmlNL6xQ9OD82Lc69vdfWTXsmvpUqWWU1fwGcQn0
         7iG6mmLB8nSSC8bpaxQMHMaYuROj9hML44D1ixk5fDbjXUNInYbnkm6fvKHqpkoUdnor
         PqywlqMs3oyKhdJSVL1CyfbBBwTqOLTpU3FZFOimqQxD6kvALu04ekmXu9pHpwHdQw3K
         gSMfDQqX+WhdmqjpvtsmFK/MWFvkvvj2N6U8uL9WHTDDEXSYEPcb1h2ucumFBHIBHXuc
         SHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P3FMEDsZInXhnswagiHhBthQ6heysrNaLGS/9ZfO7uw=;
        b=ex65GxIsZWWPUBPlzeciQAib+LwgnHpENFM4X3Z92izw+Ig9pZXUH4s5f2ouHFsSka
         yTsgmQ+1Pf2sY5y2Zj/LVO/UpYB06PKvbqbjTHycOHrWbxNMHBEfA7/mJ7oVLGxwrjj8
         /Lg1DtrBt72MNqBYLEyc5azptBDQRn53Nmicb16HosOuTUkEhwxlktWDiae94RYBhFrN
         0G9tc8tKun6+EYjuGEHftAIwEcgaiyB5Nvl6DUc66NgFEhRT28olA9Fv8s3ozAkd7LtM
         XxMzU3Y6C3O1i4wYZvNsN1+f4q1GzeCDQy4HZnu21rGJjkQN+b1HG1RQpp+9+M8usOfe
         lH8w==
X-Gm-Message-State: AGRZ1gL0Z2XxYGcNqDP+AjjQSO88D7PV29dcmup5vusSNGkHHUmQw1K9
        R47UvHo2FfBVl/W+2+VShpStOyqqIP7cAvwTP3EB4g==
X-Google-Smtp-Source: AJdET5dIuffKwcytEzOvewd47/n+DDj/gOQUkVaZ+6JH8NgrWwulKw66ocQJH2jBtvXYdgf4nlIMfBhpRMknD75ulwU=
X-Received: by 2002:aca:c413:: with SMTP id u19mr4484546oif.209.1542840551558;
 Wed, 21 Nov 2018 14:49:11 -0800 (PST)
MIME-Version: 1.0
References: <20181121201452.77173-1-dancol@google.com> <20181121205428.165205-1-dancol@google.com>
 <20181121141220.0e533c1dcb4792480efbf3ff@linux-foundation.org> <CAKOZuetW6WMNFdL5_2=UbrEf8mjxYTdz1+4BiRLSgdoKh8FsqQ@mail.gmail.com>
In-Reply-To: <CAKOZuetW6WMNFdL5_2=UbrEf8mjxYTdz1+4BiRLSgdoKh8FsqQ@mail.gmail.com>
From:   Jann Horn <jannh@google.com>
Date:   Wed, 21 Nov 2018 23:48:45 +0100
Message-ID: <CAG48ez3kgFC74jTmxqL5aPgmqcN-W4E9bR7Fz3V=Vt4qkpx2Pg@mail.gmail.com>
Subject: Re: [PATCH v2] Add /proc/pid_gen
To:     Daniel Colascione <dancol@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Tim Murray <timmurray@google.com>, primiano@google.com,
        Joel Fernandes <joelaf@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Vlastimil Babka <vbabka@suse.cz>, guro@fb.com,
        pdhamdhe@redhat.com, dennisszhou@gmail.com,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>, linux@dominikbrodowski.net,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Michal Hocko <mhocko@suse.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        ktsanaktsidis@zendesk.com, David Howells <dhowells@redhat.com>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Nov 21, 2018 at 11:40 PM Daniel Colascione <dancol@google.com> wrote:
> On Wed, Nov 21, 2018 at 2:12 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> > On Wed, 21 Nov 2018 12:54:20 -0800 Daniel Colascione <dancol@google.com> wrote:
> > > +u64 read_pid_generation(struct pid_namespace *ns)
> > > +{
> > > +     u64 generation;
> > > +
> > > +
> > > +     spin_lock_irq(&pidmap_lock);
> > > +     generation = ns->generation;
> > > +     spin_unlock_irq(&pidmap_lock);
> > > +     return generation;
> > > +}
> >
> > What is the spinlocking in here for?  afaict the only purpose it serves
> > is to make the 64-bit read atomic, so it isn't needed on 32-bit?
>
> ITYM the spinlock is necessary *only* on 32-bit, since 64-bit
> architectures have atomic 64-bit reads, and 64-bit reads on 32-bit
> architectures can tear. This function isn't a particularly hot path,
> so I thought consistency across architectures would be more valuable
> than avoiding the lock on some systems.

Linux has atomic64_t/atomic64_read()/atomic64_inc() for this, which
should automatically do the right thing - processor-supported atomic
ops when possible, spinlock otherwise.
