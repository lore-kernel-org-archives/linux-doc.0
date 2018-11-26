Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 825887D08A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 26 Nov 2018 20:28:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbeK0HXw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 27 Nov 2018 02:23:52 -0500
Received: from ms.lwn.net ([45.79.88.28]:36066 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726985AbeK0HXw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 27 Nov 2018 02:23:52 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E02F22E2;
        Mon, 26 Nov 2018 20:28:34 +0000 (UTC)
Date:   Mon, 26 Nov 2018 13:28:33 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Alexey Budankov <alexey.budankov@linux.intel.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Kees Cook <keescook@chromium.org>,
        Jann Horn <jannh@google.com>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Andi Kleen <ak@linux.intel.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "kernel-hardening@lists.openwall.com" 
        <kernel-hardening@lists.openwall.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] Documentation/admin-guide: introduce
 perf-security.rst file
Message-ID: <20181126132833.5302688b@lwn.net>
In-Reply-To: <02dbd6dc-86b5-2307-4122-b716c51b9eaa@linux.intel.com>
References: <259a9cd2-5c56-4f8d-57c4-cabaeaa774bc@linux.intel.com>
        <4d95341d-d1f4-fc48-f173-a6fedfc70d33@linux.intel.com>
        <20181125124732.6c1807de@lwn.net>
        <02dbd6dc-86b5-2307-4122-b716c51b9eaa@linux.intel.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 26 Nov 2018 11:57:21 +0300
Alexey Budankov <alexey.budankov@linux.intel.com> wrote:

> >> +For the purpose of performing security checks Linux implementation splits
> >> +processes into two categories [6]_ : a) privileged processes (whose effective
> >> +user ID is 0, referred to as superuser or root), and b) unprivileged processes
> >> +(whose effective UID is nonzero).  
> > 
> > Is that really what's going on here?  If I understand things correctly,
> > it's looking for CAP_SYS_PTRACE rather than a specific UID; am I missing
> > something here?  
> 
> You are right regarding CAP_SYS_PTRACE but this capability is not the only 
> one which is used by perf_events for security checks, so the capabilities 
> clarification is kept aside of these patches, because patches initial intention 
> is to clarify security specifics of sysctl_perf_even_paranoid settings.
> 
> I agree that the document can be extended with details clarifying capabilities 
> used by perf_events for security checks.

I don't really like the idea of adding a document that we know doesn't
really describe how the security decision is made.  Even a one-line
parenthetical saying that things are more complicated and giving a pointer
to a place to look for details would help, IMO.

Either way, I can merge this, but I'd like to have an ack from the perf
folks first.

Thanks,

jon
