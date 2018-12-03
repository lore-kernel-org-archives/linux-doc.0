Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 09B7A7D089
	for <lwn-linux-doc@archive.lwn.net>; Mon,  3 Dec 2018 14:17:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725916AbeLCOS1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 3 Dec 2018 09:18:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:51616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725914AbeLCOS0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 3 Dec 2018 09:18:26 -0500
Received: from localhost (unknown [95.98.134.160])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B59362082F;
        Mon,  3 Dec 2018 14:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543846635;
        bh=fnTrF07Y1OKw3PyZdPmvNfDeuS93uBlVhRjKBHZw0is=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zTuDg2Jr6V41UwpGf8XYPFUrIrwadA0KGLt0LaLo7CusruyacHNIIBretZEW2XR9J
         YSGi+uZswTXQd83Ddoh9LtmIajofMmGy9Ph6V1BVpHg3xrO1u/YIbU+9Fr0twB6Ecu
         Fhh8S2GQ64FHfIdtiCZCyyZUmk8FCcdFlU3EJX18=
Date:   Mon, 3 Dec 2018 15:17:11 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Frank Rowand <frowand.list@gmail.com>, acme@kernel.org,
        Tomi Valkeinen <tomi.valkeinen@iki.fi>,
        Bart Van Assche <bvanassche@acm.org>,
        Pavel Machek <pavel@ucw.cz>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] code-of-conduct: Remove explicit list of
 discrimination factors
Message-ID: <20181203141711.GA19551@kroah.com>
References: <20181202093257.3918-1-geert@linux-m68k.org>
 <20181203110506.GA7485@kroah.com>
 <CAMuHMdUXwkA+Kv2MOOmT3mZK75ex=A=TBwwR=JXSxFp7Y3O0Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUXwkA+Kv2MOOmT3mZK75ex=A=TBwwR=JXSxFp7Y3O0Hg@mail.gmail.com>
User-Agent: Mutt/1.11.0 (2018-11-25)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 03, 2018 at 12:53:00PM +0100, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Mon, Dec 3, 2018 at 12:05 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Sun, Dec 02, 2018 at 10:32:57AM +0100, Geert Uytterhoeven wrote:
> > > Providing an explicit list of discrimination factors may give the false
> > > impression that discrimination based on other unlisted factors would be
> > > allowed.
> > >
> > > Furthermore, this list is already overly long, polarizing,
> > > politically-laden, and reinstating the concept of human races.
> > > None of these is related to the goals of the Linux kernel project.
> > >
> > > Avoid any ambiguity or political undertone by removing the list, to
> > > ensure "a harassment-free experience for everyone", period.
> >
> > I understand the reason you and others are proposing this change,
> > however for now, let us stick with the text that we have.  As Linus and
> > I said just over a month ago, let's sit with the text we have until
> > something comes up that requires a change to happen.
> >
> > Also, I recommend you work with the upstream developers of this text to
> > see if they agree with your changes here.  If they do, and update their
> > version, I will be glad to revisit this text at that time.
> 
> I did, cfr. https://github.com/ContributorCovenant/contributor_covenant/issues/610
> 
> The official response was:
> 
>    "I'm not going to make this change to the Contributor Covenant itself,
>     since I believe that explicitly listing examples of protected classes is
>     important. However, any adopting project is free to modify the document
>     according to the license."

I figured.  As I said, some people feel that the list is good to have,
if not essential.  So let's stick with it for now.

thanks,

greg k-h
