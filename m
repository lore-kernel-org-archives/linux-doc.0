Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1F3ED7D048
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Jul 2018 11:28:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752029AbeGJL2i (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Jul 2018 07:28:38 -0400
Received: from ms.lwn.net ([45.79.88.28]:33208 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751527AbeGJL2i (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 10 Jul 2018 07:28:38 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E77657DA;
        Tue, 10 Jul 2018 11:28:36 +0000 (UTC)
Date:   Tue, 10 Jul 2018 05:28:35 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     David Rientjes <rientjes@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [patch] docs, debugfs: start explicit debugfs documentation
Message-ID: <20180710052835.581cdf28@lwn.net>
In-Reply-To: <20180710064506.GA2316@kroah.com>
References: <alpine.DEB.2.21.1807091459410.118937@chino.kir.corp.google.com>
        <20180710064506.GA2316@kroah.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 10 Jul 2018 08:45:06 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> For the "this is what a specific debugfs file contains", those should go
> into Documenation/ABI/ if you really want to document those types of
> things.

Do we really want to start populating Documentation/ABI with stuff that's
explicitly *not* ABI?  Keeping it separate might make more sense, IMO.
I'd put extfrag_index with the MM docs, for example.

> But as it is, this single patch does too many different things all at
> once.

...and yet not enough :)  This stuff is almost in RST already, it would
be nice to go all the way and integrate it into the rest of our docs.

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
