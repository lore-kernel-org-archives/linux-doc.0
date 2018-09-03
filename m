Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BAE397D581
	for <lwn-linux-doc@archive.lwn.net>; Mon,  3 Sep 2018 21:38:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbeIDCAJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 3 Sep 2018 22:00:09 -0400
Received: from ms.lwn.net ([45.79.88.28]:50394 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726135AbeIDCAJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 3 Sep 2018 22:00:09 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C276D72A;
        Mon,  3 Sep 2018 21:38:05 +0000 (UTC)
Date:   Mon, 3 Sep 2018 15:38:04 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] docs: kernel-doc: fix parsing of function pointers
Message-ID: <20180903153804.2b091448@lwn.net>
In-Reply-To: <b0bff870-c3c1-20e8-6609-f93f59da8624@gmx.de>
References: <20180903184153.9368-1-xypron.glpk@gmx.de>
        <20180903130043.059b2e82@lwn.net>
        <b0bff870-c3c1-20e8-6609-f93f59da8624@gmx.de>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 3 Sep 2018 22:29:00 +0200
Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:

> >>  	    # pointer-to-function
> >>  	    $arg =~ tr/#/,/;
> >> -	    $arg =~ m/[^\(]+\(\*?\s*([\w\.]*)\s*\)/;  
> 
> m/[^\(]+\(\*?\s*([\w\.]*)\s*\)/;
>            ^
> Here we allow for 0..1 asterixes.
> 
> If there is no asterix it is not a function pointer. Why should we care
> for this case?

GCC seems to allow that asterisk (asterix is an indomitable Gaul :) to be
missing; not sure if that's officially allowed by the language or not.  I
also don't know if any code in the kernel elides it, but *somebody* at
some point made it optional, presumably with some reason.  It would be
instructive to take out that "?" and see what changes happen in a docs
build; I'll try to find a moment to do that.

jon
