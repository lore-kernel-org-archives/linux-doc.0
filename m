Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B36C678D4
	for <linux-doc@archiver.kernel.org>; Mon,  6 Mar 2023 06:37:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjCFGhk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Mar 2023 01:37:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjCFGhk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Mar 2023 01:37:40 -0500
Received: from 1wt.eu (wtarreau.pck.nerim.net [62.212.114.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 86B9710258;
        Sun,  5 Mar 2023 22:37:36 -0800 (PST)
Received: (from willy@localhost)
        by mail.home.local (8.17.1/8.17.1/Submit) id 3266ZYuN005406;
        Mon, 6 Mar 2023 07:35:34 +0100
Date:   Mon, 6 Mar 2023 07:35:34 +0100
From:   Willy Tarreau <w@1wt.eu>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Vegard Nossum <vegard.nossum@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Jiri Kosina <jkosina@suse.cz>,
        Solar Designer <solar@openwall.com>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        Amit Shah <aams@amazon.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Woodhouse <dwmw@amazon.co.uk>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Laura Abbott <labbott@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Tyler Hicks <tyhicks@linux.microsoft.com>
Subject: Re: [PATCH v3 0/7] Documentation/security-bugs: overhaul
Message-ID: <ZAWJtvfnFWEjsIXd@1wt.eu>
References: <20230305220010.20895-1-vegard.nossum@oracle.com>
 <ZAWB5kwcG9IpWvE/@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAWB5kwcG9IpWvE/@kroah.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 06, 2023 at 07:02:14AM +0100, Greg Kroah-Hartman wrote:
> Secondly, and the bigger one, I think we should just drop all of the
> references to linux-distros and oss-security entirely, as those are
> groups that are outside of our control and interaction and have
> different rules that we might not agree with.  They also just a tiny
> subset of Linux users and companies and as such do not really reflect
> the majority of where Linux is used anymore.

I'm wondering if instead they shouldn't just be mentioned as a warning
about the risk of leak or forced disclosure. We know that reporters may
find the address from various places, including various sites that may
enumerate the long list of potential contacts, and not just this doc.
It can be useful to have just a paragraph warning about the fact that
oss-sec is public and that linux-distros has this strict disclosure
policy without consideration for the availability of a fix, in order
to warn them to only contact such lists once the fix is available and
tested if they want to, but never before. Anything we can do to help
serious reporters (i.e. those who are really embarrassed with a bug,
not those who seek a Curiculum Vitae Enhancer) should be done. It's
always a stressful moment to report a security issue on a project,
you always fear that you might be doing an irreversible mistake, so
whatever info we can pass about the risks (or lack of) should be
welcome I guess.

Willy
