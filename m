Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9CCED7D08E
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 Jan 2019 16:23:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730703AbfACQXs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 Jan 2019 11:23:48 -0500
Received: from ms.lwn.net ([45.79.88.28]:57120 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729598AbfACQXs (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 Jan 2019 11:23:48 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 76D6B97D;
        Thu,  3 Jan 2019 16:23:47 +0000 (UTC)
Date:   Thu, 3 Jan 2019 09:23:46 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Ramunas Geciauskas <kernel@geciauskas.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation/admin-guide: update URL of LKML
 information link
Message-ID: <20190103092346.0c900e7c@lwn.net>
In-Reply-To: <20181231100309.07b871f1@triton.namas.geciauskas.com>
References: <20181229210000.1132-1-kernel@geciauskas.com>
        <87a7kmumf7.fsf@intel.com>
        <20181231100309.07b871f1@triton.namas.geciauskas.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 31 Dec 2018 10:03:09 -0500
Ramunas Geciauskas <kernel@geciauskas.com> wrote:

> On Mon, 31 Dec 2018 10:31:56 +0200
> Jani Nikula <jani.nikula@linux.intel.com> wrote:
> 
> > On Sat, 29 Dec 2018, Ramunas Geciauskas <kernel@geciauskas.com> wrote:  
> > > Information regarding linux-kernel mailing list is no longer hosted on tux.org
> > > Update the link to point to the one available at kernel.org    
> > 
> > Arguably there's no useful current information wrt reporting bugs at the
> > updated URL either.  
> 
> A lot of information in there is rather outdated indeed,
> however it does contain explanation how to subscribe/unsubscribe
> to LKML (or rather "why you shouldn't").
> 
> Would you prefer to get rid of the link completely?
> The current one is dead since late 2016 (so it doesn't seem it will come back)

I'll go ahead and apply the patch for now; an old link is better than a
dead one, methinks.  All of this documentation needs a deeper cleaning and
redo, of course...

Thanks,

jon
