Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9D9F97DD31
	for <lwn-linux-doc@archive.lwn.net>; Fri, 30 Mar 2018 15:35:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753303AbeC3PfW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 30 Mar 2018 11:35:22 -0400
Received: from ms.lwn.net ([45.79.88.28]:59900 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752502AbeC3PfU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 30 Mar 2018 11:35:20 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 2A750AAB;
        Fri, 30 Mar 2018 15:35:19 +0000 (UTC)
Date:   Fri, 30 Mar 2018 09:35:18 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Dominik Brodowski <linux@dominikbrodowski.net>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        viro@zeniv.linux.org.uk, x86@kernel.org,
        torvalds@linux-foundation.org, mingo@kernel.org,
        tglx@linutronix.de, luto@amacapital.net
Subject: Re: [PATCH] syscalls: define and explain goal to not call syscalls
 in the kernel
Message-ID: <20180330093518.3d8a92f3@lwn.net>
In-Reply-To: <20180325162527.GA17492@light.dominikbrodowski.net>
References: <20180325162527.GA17492@light.dominikbrodowski.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 25 Mar 2018 18:25:27 +0200
Dominik Brodowski <linux@dominikbrodowski.net> wrote:

> As there have been multiple inquiries on the rationale of my patchsets
> removing in-kernel calls to sys_xyzzy(), here is an updated patch 01/NN
> which I will push upstream for v4.17-rc1. I will also include a reference
> to this mail (and therefore to the explanation below) in all related
> patches of the series. Any improvements, hints, suggestions, spelling
> fixes, and/or objections?

I have no objections to the text, but I do wonder about the placement.
The "adding syscalls" document isn't about *invoking* them; I suspect that
few people will see it there.  The coding-style document isn't quite right
either, but I wonder if it might not be a better place in the short term?

What we may really need is an "assorted rules" document that sits near
coding style; we can put stuff like this text, "volatile considered
harmful", and so on there.

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
