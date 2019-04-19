Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A18617D923
	for <lwn-linux-doc@archive.lwn.net>; Fri, 19 Apr 2019 20:37:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbfDSUgA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 19 Apr 2019 16:36:00 -0400
Received: from mail.linuxfoundation.org ([140.211.169.12]:59524 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbfDSUf7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Apr 2019 16:35:59 -0400
Received: from localhost.localdomain (c-73-223-200-170.hsd1.ca.comcast.net [73.223.200.170])
        by mail.linuxfoundation.org (Postfix) with ESMTPSA id AEBE3283B;
        Fri, 19 Apr 2019 20:35:58 +0000 (UTC)
Date:   Fri, 19 Apr 2019 13:35:56 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Marcos Paulo de Souza <marcos.souza.org@gmail.com>
Subject: Re: [PATCH] docs: core-api: fix broken references for div64.c and
 gcd.c
Message-Id: <20190419133556.80a049d3fbc71f0f2d594702@linux-foundation.org>
In-Reply-To: <20190419125548.2cca263d@lwn.net>
References: <734f49bae5d4052b3c25691dfefad59bea2e5843.1555580999.git.mchehab+samsung@kernel.org>
        <20190419125548.2cca263d@lwn.net>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 19 Apr 2019 12:55:48 -0600 Jonathan Corbet <corbet@lwn.net> wrote:

> > -.. kernel-doc:: lib/div64.c
> > +.. kernel-doc:: lib/math/div64.c
> >     :functions: div_s64_rem div64_u64_rem div64_u64 div64_s64
> >  
> > -.. kernel-doc:: lib/gcd.c
> > +.. kernel-doc:: lib/math/gcd.c
> >     :export:
> 
> This, of course, creates a build error in docs-next...hopefully that
> situation won't last more than a couple of weeks or so.

I'll fold this into the base patch
lib-move-mathematic-helpers-to-separate-folder.patch so there won't be
such a situation.

> Applied, thanks.

Please unapply ;)
