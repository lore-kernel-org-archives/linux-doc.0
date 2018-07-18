Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F04B57D085
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Jul 2018 15:50:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731379AbeGRQ2t (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Jul 2018 12:28:49 -0400
Received: from hurricane.elijah.cs.cmu.edu ([128.2.209.191]:45244 "EHLO
        hurricane.elijah.cs.cmu.edu" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731295AbeGRQ2s (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Jul 2018 12:28:48 -0400
Received: from [127.0.0.1] (helo=cs.cmu.edu)
        by hurricane.elijah.cs.cmu.edu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.91)
        (envelope-from <jaharkes@cs.cmu.edu>)
        id 1ffoiT-0003wA-Py; Wed, 18 Jul 2018 11:50:13 -0400
Date:   Wed, 18 Jul 2018 11:50:06 -0400
From:   Jan Harkes <jaharkes@cs.cmu.edu>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Deepa Dinamani <deepa.kernel@gmail.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [RESEND] coda: stop using 'struct timespec' in user API
Message-ID: <20180718155006.lkoktldllafrfqbf@cs.cmu.edu>
Mail-Followup-To: Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Deepa Dinamani <deepa.kernel@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20180718114645.591551-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180718114645.591551-1-arnd@arndb.de>
User-Agent: NeoMutt/20180512
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 18, 2018 at 01:46:25PM +0200, Arnd Bergmann wrote:
> Unfortunately, this breaks the layout of the coda_vattr structure, so
> we need to redefine that in terms of something that does not change.
> I'm introducing a new 'struct vtimespec' structure here that keeps
> the existing layout, and the same change has to be done in the coda
> user space copy of linux/coda.h before anyone can use that on a 32-bit
> architecture with 64-bit time_t.

I think the userbase is small enough that we can handle a much simpler
transition to 64-bit timespecs everywhere. In that case the
CODA_KERNEL_VERSION should be updated, which is currently defined in
include/uapi/linux/coda.h as 3. As moving to 64-bit timespecs only
breaks 32-bit systems this allows userspace to catch that case and
refuse to run userspace with a mismatched layout (or handle
translation).

It also would make how to handle questions about truncation moot, or at
least moves the problem out of the kernel into userspace.  We actually
were already using unsigned integers for timestamps in the client <->
server protocol, so as you noted, that does give us a little breather
until 2106.

> Originally sent on June 19, which lead to a short discussion
> and an Ack, but the patch did not get picked up for 4.19 yet.

I'm sorry, somehow I missed the follow up questions in that discussion.

> > If we only have one code base, it should be fairly straightforward to
> > make it deal with 'unsigned' timestamps consistently, which would
> > let the code work fine until 2106 rather than wrapping around from
> > 2038 to 1902.

At some point there was a webdav filesystem that used the Coda kernel
apis, but I think they may have moved to FUSE since then so I would not
be surprised if there is only a single code base at this point.

Jan

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
