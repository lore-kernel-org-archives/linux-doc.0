Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C1ADE7D8AB
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Jun 2019 16:02:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729477AbfFFQCA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 6 Jun 2019 12:02:00 -0400
Received: from ms.lwn.net ([45.79.88.28]:50248 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729306AbfFFQCA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 6 Jun 2019 12:02:00 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BCC84737;
        Thu,  6 Jun 2019 16:01:59 +0000 (UTC)
Date:   Thu, 6 Jun 2019 10:01:58 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-doc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: Re: [PATCH v1] docs/core-api: Add string helpers API to the list
Message-ID: <20190606100158.76df3cb5@lwn.net>
In-Reply-To: <20190605163944.50803-1-andriy.shevchenko@linux.intel.com>
References: <20190605163944.50803-1-andriy.shevchenko@linux.intel.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed,  5 Jun 2019 19:39:44 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> Some times string helpers are needed, but there is nothing about them
> in the generated documentation.
> 
> Fill the gap by adding a reference to string_helpers.c exported functions.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

So I've applied this (and the integer power functions one too), but let me
grumble for just a moment...

This patch adds a set of new warnings to the docs build:

> +./lib/string_helpers.c:236: WARNING: Unexpected indentation.
> +./lib/string_helpers.c:241: WARNING: Block quote ends without a blank line; unexpected unindent.
> +./lib/string_helpers.c:446: WARNING: Unexpected indentation.
> +./lib/string_helpers.c:451: WARNING: Block quote ends without a blank line; unexpected unindent.
> +./lib/string_helpers.c:474: WARNING: Unexpected indentation.

It would be *really* nice if folks would check for these things and fix
them when they arise.  The docs build is a horrific mess of warnings that
will never get better if we keep adding more.  This one is an easy fix;
I'll toss together a patch to do it.

Beyond that (and this is in no way your fault, I'm just whining)
kernel-api.rst has become a huge dumping ground.  Someday it would sure be
nice if we could create a bit more order there...

Thanks,

jon
