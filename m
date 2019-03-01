Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1E05B7D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Mar 2019 14:13:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387523AbfCAONJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Mar 2019 09:13:09 -0500
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:36522 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387516AbfCAONJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 1 Mar 2019 09:13:09 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A4A4A78;
        Fri,  1 Mar 2019 06:13:09 -0800 (PST)
Received: from fuggles.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E76873F720;
        Fri,  1 Mar 2019 06:13:06 -0800 (PST)
Date:   Fri, 1 Mar 2019 14:13:04 +0000
From:   Will Deacon <will.deacon@arm.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        "Paul E . McKenney" <paulmck@linux.ibm.com>,
        Josh Triplett <josh@joshtriplett.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] Documentation/locking/lockdep: Drop last two chars of
 sample states
Message-ID: <20190301141304.GB23344@fuggles.cambridge.arm.com>
References: <20190301094052.11288-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190301094052.11288-1-geert+renesas@glider.be>
User-Agent: Mutt/1.11.1+86 (6f28e57d73f2) ()
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 01, 2019 at 10:40:52AM +0100, Geert Uytterhoeven wrote:
> Since the removal of FS_RECLAIM annotations, lockdep states contain four
> characters, not six.
> 
> Fixes: e5684bbfc3f03480 ("Documentation/locking/lockdep: Update info about states")
> Fixes: d92a8cfcb37ecd13 ("locking/lockdep: Rework FS_RECLAIM annotation")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Fix silly before/after inversion in patch description.
> ---
>  Documentation/RCU/lockdep-splat.txt      | 6 +++---
>  Documentation/locking/lockdep-design.txt | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

Looks sensible to me:

Acked-by: Will Deacon <will.deacon@arm.com>

Will
