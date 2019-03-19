Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5A9277D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 19 Mar 2019 18:30:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbfCSSaH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 19 Mar 2019 14:30:07 -0400
Received: from ms.lwn.net ([45.79.88.28]:57498 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726751AbfCSSaG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 19 Mar 2019 14:30:06 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7FC9E9AC;
        Tue, 19 Mar 2019 18:30:05 +0000 (UTC)
Date:   Tue, 19 Mar 2019 12:30:03 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Matteo Croce <mcroce@redhat.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH 01/12] documentation: fix typo
Message-ID: <20190319123003.6ca364bd@lwn.net>
In-Reply-To: <CAGnkfhzJUgRNrJ2zN9=9=5nvv9cdjofAXg1+-+t4tyRnw9bTpw@mail.gmail.com>
References: <20190104212856.28366-1-mcroce@redhat.com>
        <CAGnkfhwi=TA0m5gCku0OA_+hKR5hJkP5ruYbaHkKDWm7b3BUxQ@mail.gmail.com>
        <CAGnkfhzJUgRNrJ2zN9=9=5nvv9cdjofAXg1+-+t4tyRnw9bTpw@mail.gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 16 Mar 2019 01:32:05 +0100
Matteo Croce <mcroce@redhat.com> wrote:

> > On Fri, Jan 4, 2019 at 10:28 PM Matteo Croce <mcroce@redhat.com> wrote:  
> > >
> > > Fix spelling mistake: "lenght" -> "length"
> > >
> > > Signed-off-by: Matteo Croce <mcroce@redhat.com>
> > > ---
> > >  Documentation/devicetree/bindings/usb/s3c2410-usb.txt | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >  
> >
> > Hi,
> >
> > this patch was pulled from a 12 patches series and sent alone, please
> > discard the "01/12" in the subject
> >
> > --
> > Matteo Croce
> > per aspera ad upstream  
> 
> ping, someone can merge this?

This is a device-tree binding file, so linux-doc is the wrong place to
send it.  It should go to the device tree maintainers;
scripts/get_maintainer.pl is your friend here.

Thanks,

jon
