Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D806C7D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 Oct 2019 21:40:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731995AbfJIVkw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 Oct 2019 17:40:52 -0400
Received: from ms.lwn.net ([45.79.88.28]:45888 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731979AbfJIVkw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 9 Oct 2019 17:40:52 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CBF982BD;
        Wed,  9 Oct 2019 21:40:51 +0000 (UTC)
Date:   Wed, 9 Oct 2019 15:40:50 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: Sphinx parallel build errors
Message-ID: <20191009154050.502061fa@lwn.net>
In-Reply-To: <dc19a670-7e8e-04e5-667d-578c2dd3754e@infradead.org>
References: <dc19a670-7e8e-04e5-667d-578c2dd3754e@infradead.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 9 Oct 2019 14:37:51 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> Sphinx parallel build error:
> OSError: [Errno 12] Cannot allocate memory
> 
> I have had this error 4 times in the last 3 days.
> 
> The first time it oom-killed Thunderbird.  No big deal.
> The second time it oom-killed gimp, which had 24 photos open.
> Still no big deal.  Just a nuisance.
> 
> My little laptop has only 8 GB of RAM.
> 
> Is there a way that I can limit the amount of parallelism?

Is this a change with current docs-next, or have you seen this for a
while?  The parallelism logic changed a bit in docs-next, but the default
behavior should be the same as it was before.

"make -j 1 htmldocs" (in current docs-next) should give you a nice, slow,
serial build.

jon
