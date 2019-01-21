Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 520677D161
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 Jan 2019 08:14:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728398AbfAUIOH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 Jan 2019 03:14:07 -0500
Received: from mx.kolabnow.com ([95.128.36.41]:39698 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727980AbfAUIOG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 21 Jan 2019 03:14:06 -0500
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTP id 435E764D;
        Mon, 21 Jan 2019 09:14:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        content-type:content-type:content-transfer-encoding:mime-version
        :references:in-reply-to:message-id:date:date:subject:subject
        :from:from:received:received:received; s=dkim20160331; t=
        1548058442; x=1549872843; bh=ZcGqDyYnPIWY6Q/Fdn0PVIGnfxTQl+CA7Kf
        W7eaitSg=; b=S8OtVsCQtcRZy9QB6omo3emE8RFWZEVsuGaGJ2IqyNiabe8O9tA
        OWXnWYetJns5aHGH3v+n/SdA+21apnlFEdAdb6A5I2ZE2tXEX3sLJO+b1kTJCHKd
        py/q3UMEnvblxfxtor+zr+tU3fmxWkQN0mHYEX3knGD5EwLbR61hv/6EHgXNEnhe
        7juSMGwHA5yRZ8N3b0MikcIqPBaEstixsC58zHmwFDM9K12Iw7go4m0QdHzwSgjw
        grTbq5B4HEoPxVZJXfkh1VMy2ItDOlUwT6pf1Ekw9iwKzMULaTyIfwogsu9HrNMh
        5mVoltsntfbYlskQ2fElaHFnNCggJ+ButpHYxXcZmWCavI5Ryh6F0uNPO5325Jyn
        q2T4281ptnJ2OCx6FuiBpJ1PgYTwFMU1BQeO3KdAJtBzaE8s9qCZ+CRBpeSbEuV3
        jx19+/DiYjvjSjI5DeDUWKMOQ0qUiTXdoq3H25SK6NJf+1TFK/Sy3rDg15WO7HWJ
        DAcbX3b1aFQPhvuFHHN9G3hZfpgiYDD6KeLxpiIXhlFXdOw5oqAk5vZyiVocCBg4
        PCkP7cxUfRaR9kBFkwtOdgx/ha9zM/QNQdeZhgMOHJD9y4keabD7xLuNR5by/C3l
        osIletEBKAFDEfThCZ5sWE0dTG0waFaGc4g6706uC74ViMk9sBxGu4UE=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out002.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id NN53k5nGlcTT; Mon, 21 Jan 2019 09:14:02 +0100 (CET)
Received: from int-mx002.mykolab.com (unknown [10.9.13.2])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTPS id ED817625;
        Mon, 21 Jan 2019 09:14:02 +0100 (CET)
Received: from ext-subm002.mykolab.com (unknown [10.9.6.2])
        by int-mx002.mykolab.com (Postfix) with ESMTPS id 986361DA6;
        Mon, 21 Jan 2019 09:14:02 +0100 (CET)
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Greg KH <greg@kroah.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc:process: remove note from 'stable api nonsense'
Date:   Mon, 21 Jan 2019 09:14:00 +0100
Message-ID: <53383524.y9DmdCAcNX@pcbe13614>
In-Reply-To: <20190120184338.01cd4ef9@lwn.net>
References: <20190118215804.3340-1-federico.vaga@vaga.pv.it> <20190120184338.01cd4ef9@lwn.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Monday, January 21, 2019 2:43:38 AM CET Jonathan Corbet wrote:
> On Fri, 18 Jan 2019 22:58:04 +0100
> 
> Federico Vaga <federico.vaga@vaga.pv.it> wrote:
> > The link referred by the note can't be retrieved: this patch just
> > remove that old note.
> > 
> > Signed-off-by: Federico Vaga <federico.vaga@vaga.pv.it>
> > ---
> > 
> >  Documentation/process/stable-api-nonsense.rst | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/process/stable-api-nonsense.rst
> > b/Documentation/process/stable-api-nonsense.rst index
> > 24f5aeecee91..57d95a49c096 100644
> > --- a/Documentation/process/stable-api-nonsense.rst
> > +++ b/Documentation/process/stable-api-nonsense.rst
> > @@ -171,8 +171,7 @@ is also a rough job.
> > 
> >  Simple, get your kernel driver into the main kernel tree (remember we
> >  are talking about GPL released drivers here, if your code doesn't fall
> > 
> > -under this category, good luck, you are on your own here, you leech
> > -<insert link to leech comment from Andrew and Linus here>.)  If your
> > +under this category, good luck, you are on your own here, you leech).  If
> > your> 
> >  driver is in the tree, and a kernel interface changes, it will be fixed
> >  up by the person who did the kernel change in the first place.  This
> >  ensures that your driver is always buildable, and works over time, with
> 
> I've applied this.  I do wonder if the "you leech" should maybe come out
> too, though.  I don't think that parasitic worms are a protected class
> under the CoC, but they might still suffer emotionally from being
> compared to the purveyors of proprietary modules...

I agree, do you want me to change the patch?

> 
> jon


-- 
Federico Vaga
http://www.federicovaga.it/


