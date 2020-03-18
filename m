Return-Path: <SRS0=afVm=5D=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D37AC10DCE
	for <linux-doc@archiver.kernel.org>; Wed, 18 Mar 2020 19:53:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D506F2077E
	for <linux-doc@archiver.kernel.org>; Wed, 18 Mar 2020 19:53:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bzGHtNA2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbgCRTxB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Mar 2020 15:53:01 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:39651 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726704AbgCRTxB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Mar 2020 15:53:01 -0400
Received: by mail-oi1-f195.google.com with SMTP id d63so107606oig.6
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2020 12:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/O7ydZcGkEnjjR0DKfEZl8dzF7U8chbFAqM/QMwcPsg=;
        b=bzGHtNA2tGO9KKY0VBVcKXGej5Hl6Fvi3iAb97Ei+QJuQs5DgXJIGoSSh33cEvrT89
         jDfI2j9hBYEP2DFVT2bu8Ma/xTvnr1TvkkmDWuNjWz0QQcQcYcDGPxKgATGCybrDKkcO
         yeLO/j/P4tnAVMAVXZ8z35Ifth6PtGFOQtt8eqLen2JxNtuVI0Q1V4YAATUGlsKML0xC
         beVvRLkOWokeQiA0NWCyzDue30siSFbMShz0g1EgEG/+rBUh/GenyejbbQzUxIh+H6T0
         SLOdsi/iKplRCqLTp48HO8JJ4hedHC91oIKM3XpsH5FHgGoj/+62KkhKLTZeCOM1HlOq
         pKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/O7ydZcGkEnjjR0DKfEZl8dzF7U8chbFAqM/QMwcPsg=;
        b=B0/SqnfZdTsQIeQOLTn5OPEt/uH+M1YKc75vwpgqL+tVpEIzJdVwkcF7xSKIOiqsaP
         VITR3BA4vYGt2XqbpRAN1xs9Y/MYMAX5RAfM7Y8EqpT1ytzImJUXSfYzchGldZrGWnNN
         /GcGvp7rrP5dDGVeyjLSL+p7IqkiIo3IA7BukPDqVkKQ5LMFbxvQQnZmqdgNcs2o7Wsq
         S0YENEzB9ucTCEEZ1POGXaE7KNpKJECB9Q5Tk9PQph0LK3TN0MXVb6arr9etaZxsg9rB
         y13ulFK16X5vk7Qcl2A4e1tX09/DIFrMC7C5prCbiugstjsPzLq7490MFsmu923mWnVR
         uHlQ==
X-Gm-Message-State: ANhLgQ1gUL7vZ+7oNJtMU+ETGP/RMHizleYJS6OxhVIxGl3Q2dUI8OYa
        eCocSSYCkYJS7o7Wp5gcSuYSXZIIu2va1uveAbG6fQ==
X-Google-Smtp-Source: ADFU+vuOPpGMHPfZ/DDnCyvqaCHk4JwFerE7ZzmLuNMC4CG6jDBlIsZV59kQghivA5FHpMPqabGb6KMfq0nTMT39gMc=
X-Received: by 2002:aca:af93:: with SMTP id y141mr4368099oie.144.1584561180301;
 Wed, 18 Mar 2020 12:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200312100759.20502-1-sjpark@amazon.com> <20200312104345.10032-1-sjpark@amazon.com>
In-Reply-To: <20200312104345.10032-1-sjpark@amazon.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Wed, 18 Mar 2020 12:52:48 -0700
Message-ID: <CALvZod7JoOKZRGb6nnmA4ymsZCXdHetS_CPFbFeC1Rqmx4yYHw@mail.gmail.com>
Subject: Re: Re: Re: [PATCH v6 00/14] Introduce Data Access MONitor (DAMON)
To:     SeongJae Park <sjpark@amazon.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        SeongJae Park <sjpark@amazon.de>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Yang Shi <yang.shi@linux.alibaba.com>, acme@kernel.org,
        alexander.shishkin@linux.intel.com, amit@kernel.org,
        brendan.d.gregg@gmail.com,
        Brendan Higgins <brendanhiggins@google.com>,
        Qian Cai <cai@lca.pw>,
        Colin Ian King <colin.king@canonical.com>,
        Jonathan Corbet <corbet@lwn.net>, dwmw@amazon.com,
        jolsa@redhat.com, "Kirill A. Shutemov" <kirill@shutemov.name>,
        mark.rutland@arm.com, Mel Gorman <mgorman@suse.de>,
        Minchan Kim <minchan@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, namhyung@kernel.org,
        peterz@infradead.org, Randy Dunlap <rdunlap@infradead.org>,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>, shuah@kernel.org,
        sj38.park@gmail.com, Vlastimil Babka <vbabka@suse.cz>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Linux MM <linux-mm@kvack.org>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 12, 2020 at 3:44 AM SeongJae Park <sjpark@amazon.com> wrote:
>
> On Thu, 12 Mar 2020 11:07:59 +0100 SeongJae Park <sjpark@amazon.com> wrote:
>
> > On Tue, 10 Mar 2020 10:21:34 -0700 Shakeel Butt <shakeelb@google.com> wrote:
> >
> > > On Mon, Feb 24, 2020 at 4:31 AM SeongJae Park <sjpark@amazon.com> wrote:
> > > >
> > > > From: SeongJae Park <sjpark@amazon.de>
> > > >
> > > > Introduction
> > > > ============
> > > >
> [...]
> > >
> > > I do want to question the actual motivation of the design followed by this work.
> > >
> > > With the already present Page Idle Tracking feature in the kernel, I
> > > can envision that the region sampling and adaptive region adjustments
> > > can be done in the user space. Due to sampling, the additional
> > > overhead will be very small and configurable.
> > >
> > > Additionally the proposed mechanism has inherent assumption of the
> > > presence of spatial locality (for virtual memory) in the monitored
> > > processes which is very workload dependent.
> > >
> > > Given that the the same mechanism can be implemented in the user space
> > > within tolerable overhead and is workload dependent, why it should be
> > > done in the kernel? What exactly is the advantage of implementing this
> > > in kernel?
> >
> > First of all, DAMON is not for only user space processes, but also for kernel
> > space core mechanisms.  Many of the core mechanisms will be able to use DAMON
> > for access pattern based optimizations, with light overhead and reasonable
> > accuracy.

Which kernel space core mechanisms? I can see memory reclaim, do you
envision some other component as well.

Let's discuss how this can interact with memory reclaim and we can see
if there is any benefit to do this in kernel.

> >
> > Implementing DAMON in user space is of course possible, but it will be
> > inefficient.  Using it from kernel space would make no sense, and it would
> > incur unnecessarily frequent kernel-user context switches, which is very
> > expensive nowadays.
>
> Forgot mentioning about the spatial locality.  Yes, it is workload dependant,
> but still pervasive in many case.  Also, many core mechanisms in kernel such as
> read-ahead or LRU are already using some similar assumptions.
>

Not sure about the LRU but yes read-ahead in several places does
assume spatial locality. However most of those are configurable and
the userspace can enable/disable the read-ahead based on the workload.

>
> If it is so problematic, you could set the maximum number of regions to the
> number of pages in the system so that each region monitors each page.
>

How will this work in the process context? Number of regions equal to
the number of mapped pages?

Basically I am trying to envision the comparison of physical memory
based monitoring (using idle page tracking) vs pid+VA based
monitoring.

Anyways I am not against your proposal. I am trying to see how to make
it more general to be applicable to more use-cases and one such
use-case which I am interested in is monitoring all the user pages on
the system for proactive reclaim purpose.

Shakeel
