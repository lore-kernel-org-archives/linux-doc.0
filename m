Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8F23A7D90F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 14 Jun 2019 13:58:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728621AbfFNN6P (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 14 Jun 2019 09:58:15 -0400
Received: from casper.infradead.org ([85.118.1.10]:60906 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728182AbfFNN6P (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Jun 2019 09:58:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=vkbZzNw8rd/LdJBqWsFgMBaGUJFfrDVMrfDvklrEC58=; b=s2xJ+L6WknSXEkRXkSMA3qEhur
        0OpliQRNvUTBhxqWkhIbo9AEZfWY3GRhCFR6d0QWHMr9KO+qOxFKclxQEOTDOLxF6gQi7RGCpz9+A
        Cdhpp77ANmDIFa+WqkzdHYIBBHqJfUO9lBos8Jmro3C6gYbUBv6tZ4PI3++gvC9nZD9RM7xXb5lHp
        mNtSX+e9/r1oj+oSrqNHn/p3txCqvMtXMXNKo/6m2ZanAVywAUQ52P3Tu8cBB5kAU/IAmqnjL014A
        7za6/anVkhuGUgS5GfayC1ivqttfbLDLz2CMfgk3DX2wQ/XtGcPuPxuNQV1xeN4mAA7jc0taZfeLP
        M1vWtOow==;
Received: from 177.133.85.52.dynamic.adsl.gvt.net.br ([177.133.85.52] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hbmiY-0003Jd-T9; Fri, 14 Jun 2019 13:58:11 +0000
Date:   Fri, 14 Jun 2019 10:58:06 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@s-opensource.com>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 05/14] scripts: add an script to parse the ABI files
Message-ID: <20190614105806.367f26e9@coco.lan>
In-Reply-To: <20190614133933.GA1076@kroah.com>
References: <cover.1560477540.git.mchehab+samsung@kernel.org>
        <196fb3c497546f923bf5d156c3fddbe74a4913bc.1560477540.git.mchehab+samsung@kernel.org>
        <87r27wuwc3.fsf@intel.com>
        <20190614133933.GA1076@kroah.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Fri, 14 Jun 2019 15:39:33 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> escreveu:

> On Fri, Jun 14, 2019 at 04:31:56PM +0300, Jani Nikula wrote:
> > On Thu, 13 Jun 2019, Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:  
> > > From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
> > >
> > > Add a script to parse the Documentation/ABI files and produce
> > > an output with all entries inside an ABI (sub)directory.
> > >
> > > Right now, it outputs its contents on ReST format. It shouldn't
> > > be hard to make it produce other kind of outputs, since the ABI
> > > file parser is implemented in separate than the output generator.  
> > 
> > Hum, or just convert the ABI files to rst directly.  

Converting ABI files to rst could be easily done using a modified
version of my script (plus the produced files will likely need some
manual review).

There is a drawback though: we'll lose the capability of being able
to parse ABI files via an script, as people would be freed to use a
different syntax.

We could minimize it by using things like:

:What:
:Kernel Version:
...

> And what would that look like?

That's the big question :-)

If you prefer something like that, I can write the patches.

Thanks,
Mauro
