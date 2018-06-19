Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AEE987D072
	for <lwn-linux-doc@archive.lwn.net>; Tue, 19 Jun 2018 17:22:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S966551AbeFSRWe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 19 Jun 2018 13:22:34 -0400
Received: from hurricane.elijah.cs.cmu.edu ([128.2.209.191]:55466 "EHLO
        hurricane.elijah.cs.cmu.edu" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S966502AbeFSRWe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jun 2018 13:22:34 -0400
X-Greylist: delayed 1549 seconds by postgrey-1.27 at vger.kernel.org; Tue, 19 Jun 2018 13:22:33 EDT
Received: from [127.0.0.1] (helo=cs.cmu.edu)
        by hurricane.elijah.cs.cmu.edu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.91)
        (envelope-from <jaharkes@cs.cmu.edu>)
        id 1fVJvt-0004HT-3S; Tue, 19 Jun 2018 12:56:41 -0400
Date:   Tue, 19 Jun 2018 12:56:33 -0400
From:   Jan Harkes <jaharkes@cs.cmu.edu>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     y2038@lists.linaro.org, Jonathan Corbet <corbet@lwn.net>,
        Deepa Dinamani <deepa.kernel@gmail.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coda: stop using 'struct timespec' in user API
Message-ID: <20180619165633.acyxrweiedyhvre7@cs.cmu.edu>
Mail-Followup-To: Arnd Bergmann <arnd@arndb.de>, y2038@lists.linaro.org,
        Jonathan Corbet <corbet@lwn.net>,
        Deepa Dinamani <deepa.kernel@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20180619153822.3638475-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180619153822.3638475-1-arnd@arndb.de>
User-Agent: NeoMutt/20180512
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 19, 2018 at 05:37:35PM +0200, Arnd Bergmann wrote:
> Unfortunately, this breaks the layout of the coda_vattr structure, so
> we need to redefine that in terms of something that does not change.
> I'm introducing a new 'struct vtimespec' structure here that keeps
> the existing layout, and the same change has to be done in the coda
> user space copy of linux/coda.h before anyone can use that on a 32-bit
> architecture with 64-bit time_t.

This looks good to me.

> An open question is what should happen to actual times past y2038,
> as they are now truncated to the last valid date when sent to user

That is definitely quite a hard problem because this propagates all the
way back to the Coda file servers and how they store metadata.
In fact the existing client-server protocol only uses 32-bit time in
seconds, so we already lose the nanosecond resolution and 64-bit systems
don't actually benefit from having the extra bits in their struct timespec.

Not exposing an internal kernel datatype is definitely an improvement,
so this is an ACK for me.

Jan

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
