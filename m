Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E3ED37D048
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Jul 2018 11:46:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752464AbeGJLq2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Jul 2018 07:46:28 -0400
Received: from mail.linuxfoundation.org ([140.211.169.12]:39710 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752029AbeGJLq1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Jul 2018 07:46:27 -0400
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr [90.92.61.202])
        by mail.linuxfoundation.org (Postfix) with ESMTPSA id 0B841EBC;
        Tue, 10 Jul 2018 11:46:26 +0000 (UTC)
Date:   Tue, 10 Jul 2018 13:46:24 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     David Rientjes <rientjes@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [patch] docs, debugfs: start explicit debugfs documentation
Message-ID: <20180710114624.GA14261@kroah.com>
References: <alpine.DEB.2.21.1807091459410.118937@chino.kir.corp.google.com>
 <20180710064506.GA2316@kroah.com>
 <20180710052835.581cdf28@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180710052835.581cdf28@lwn.net>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 10, 2018 at 05:28:35AM -0600, Jonathan Corbet wrote:
> On Tue, 10 Jul 2018 08:45:06 +0200
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > For the "this is what a specific debugfs file contains", those should go
> > into Documenation/ABI/ if you really want to document those types of
> > things.
> 
> Do we really want to start populating Documentation/ABI with stuff that's
> explicitly *not* ABI?  Keeping it separate might make more sense, IMO.
> I'd put extfrag_index with the MM docs, for example.

I personally don't think that debugfs files should be documented
anywhere, unless it makes sense from a "help debug the kernel" point of
view.  And yes, you are right, we don't want to document things in /ABI/
that are not ABI stuff, as debugfs files can, and do, change at random
times.

Putting the info in the subsystem specific documents makes sense.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
