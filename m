Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 36F9D7DBD4
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 Oct 2019 21:48:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730483AbfJOVsO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 15 Oct 2019 17:48:14 -0400
Received: from ms.lwn.net ([45.79.88.28]:37064 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731203AbfJOVsN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 15 Oct 2019 17:48:13 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 052C8316;
        Tue, 15 Oct 2019 21:48:12 +0000 (UTC)
Date:   Tue, 15 Oct 2019 15:48:11 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Adam Zerella <adam.zerella@gmail.com>, gor@linux.ibm.com,
        akpm@linux-foundation.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: admin-guide: Extend short title underline in
 sysctl
Message-ID: <20191015154811.1c90d25e@lwn.net>
In-Reply-To: <67b31b20-baca-57f4-909d-76483a5a753c@infradead.org>
References: <20191014110008.GA3814@gmail.com>
        <20191015123222.46527701@lwn.net>
        <67b31b20-baca-57f4-909d-76483a5a753c@infradead.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 15 Oct 2019 14:28:56 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> > So this is a good fix, but it's not an actual patch that I can apply.
> > Randy meanwhile says he fixed it, but the patch wasn't sent to me.  I
> > guess this warning will live a little longer...:(  
> 
> AFAIK, it's a patch to linux-next, not mainline.
> Can you take such a patch?

Ah, I see the problem, sorry I was dense before.  The patch is fixing a
change that went into linux-next via somebody else's tree.  So yeah, I
can't really apply that, it should go to whoever merged the original
(which is 0fab3ac21880 "hung_task: allow printing warnings every check
interval" BTW).  A Fixes: tag and a copy to the original author would also
be good.

Sorry for the confusion,

jon
