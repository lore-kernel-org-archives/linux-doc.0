Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AE4657D043
	for <lwn-linux-doc@archive.lwn.net>; Sat, 30 Jun 2018 15:33:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751109AbeF3PdC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 30 Jun 2018 11:33:02 -0400
Received: from ms.lwn.net ([45.79.88.28]:38234 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750802AbeF3PdB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 30 Jun 2018 11:33:01 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 5AFE44F00;
        Sat, 30 Jun 2018 15:33:01 +0000 (UTC)
Date:   Sat, 30 Jun 2018 09:33:00 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Jani Nikula <jani.nikula@intel.com>,
        linux-doc <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] Documentation/sphinx: allow "functions" with no
 parameters
Message-ID: <20180630093300.28cad3f5@lwn.net>
In-Reply-To: <20180630145927.GA18999@rapoport-lnx>
References: <1530306311-10510-1-git-send-email-rppt@linux.vnet.ibm.com>
        <1530306311-10510-2-git-send-email-rppt@linux.vnet.ibm.com>
        <20180630112156.GK7646@bombadil.infradead.org>
        <20180630145927.GA18999@rapoport-lnx>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 30 Jun 2018 17:59:27 +0300
Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:

> > 
> > Is this the right syntax?  Should we rather have:
> > 
> >     .. kernel-doc:: lib/idr.c
> >        :functions: *  
> 
> IMHO :functions: with no parameters is simpler.

What I would really like to have there, actually, is a regex match (or,
probably better, a shell-glob match).  It would be easy to add, I've just
never gotten around to it.  That would make the above syntax just work for
those who preferred it.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
