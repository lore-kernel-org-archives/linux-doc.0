Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D01607D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  6 Feb 2019 04:37:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727207AbfBFEhc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Feb 2019 23:37:32 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:48215 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726610AbfBFEhc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Feb 2019 23:37:32 -0500
X-Greylist: delayed 568 seconds by postgrey-1.27 at vger.kernel.org; Tue, 05 Feb 2019 23:37:31 EST
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 480EC21EED;
        Tue,  5 Feb 2019 23:28:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 05 Feb 2019 23:28:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=date
        :from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=PcdF4DlHTAb9azla2eD6HH2sUCc
        a3MuU2Xk8VaU/Dq0=; b=UoNiwtIYE4h/iASzszjCPpGmOAs9us0OutSpHxC2I2S
        NHluX+MqOyjWXlrAfC3oSq4B3bVGofl8+2SzZQEdGexlneD8cdKIChDqXzBz+fYG
        eUeEZlh8X9iylTLCGnJkfVCcxe2BoRXo0BEBjCF4j7NtNM9HhKyswV/AySWJlKOx
        YNWmiB/B3Y6f42fGyu3KOtjgZBvVMbwNk1emhseZcDhmoaVPzaZdlvZ3ghtoEo9K
        zEDa1/AsAobaJFYJLujzvrRP1yWCbuXnYl1+/tekkKYSYRn4y1YAKIT7d3vYC0hf
        aHQFB1OZGrkurSPOoHjE6MimGaEXugw4pw61OzO+h0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PcdF4D
        lHTAb9azla2eD6HH2sUCca3MuU2Xk8VaU/Dq0=; b=HugcTrmaG6ptJLRMaYqRnV
        vVyyNQauy5ZTeCfHBi2LRaFxAz9XLsSCZQJVtk0bMae9zbwQtT1RZo5SdnpgFPVe
        XZqSqC1+HsnG4hCpus8tmDlJRg2vvoYL9HIt0WeEMYPyJo+NNmuUj+oIbBycMRmZ
        W9ZGcAH6LIfTh7TO/ta2Y9lUNs//KomTcKb5kbRnPPklTWChhRJpWAYnBwBTn6qk
        TBJG5ioQu5FoYF/5i4romkncsMn5XXIQohiwDmmnyXzPMrxzE9DIxuYmXcwir0m/
        6LdgzZ89BZbMGkjAbbVao7Sh2f3aoeJkDKUSm/2z+dDv46iijHkPhh6QgA2su9mg
        ==
X-ME-Sender: <xms:UmJaXEpSTVPeHoQys4C8aE3QQvMaNEyDCmoxbCFiKd1Wa_vPmiraeg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrkeejgdejudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
    tdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlfedtmd
    enucfjughrpeffhffvuffkfhggtggujgfofgesthdtredtofervdenucfhrhhomhepfdfv
    ohgsihhnucevrdcujfgrrhguihhnghdfuceomhgvsehtohgsihhnrdgttgeqnecukfhppe
    duvddurdeggedrvddukedrvddtudenucfrrghrrghmpehmrghilhhfrhhomhepmhgvseht
    ohgsihhnrdgttgenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:UmJaXNuGhyhwRdWHmCeNORFTsZ2dTeVfIIL0ZB3xulIT-PuvumXSkA>
    <xmx:UmJaXD0F35wJ5duzXTGWOf5YNbUuQXCdKoX8DopEhFvTDxhcvXR7Ng>
    <xmx:UmJaXIGA6LwH_Brc0u6lEDjL3p6iPuCIW7twl9Awc7DjkUjQjias2w>
    <xmx:U2JaXKG_Z8eXgIVJ4PgP0GaMXmZBAgy7fsS_E0Cjo3-y_RG1cHMztQ>
Received: from localhost (ppp121-44-218-201.bras1.syd2.internode.on.net [121.44.218.201])
        by mail.messagingengine.com (Postfix) with ESMTPA id B23B4E4078;
        Tue,  5 Feb 2019 23:28:00 -0500 (EST)
Date:   Wed, 6 Feb 2019 15:27:55 +1100
From:   "Tobin C. Harding" <me@tobin.cc>
To:     Markus Heiser <markus.heiser@darmarit.de>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Rapoport <rppt@linux.ibm.com>,
        "Tobin C. Harding" <tobin@kernel.org>,
        Christopher Lameter <cl@linux.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] docs: Use underscore not hyphen in label
Message-ID: <20190206042755.GC16761@eros.localdomain>
References: <20190131040623.15569-1-me@tobin.cc>
 <20190131040623.15569-4-me@tobin.cc>
 <20190131092757.GF28876@rapoport-lnx>
 <20190131205608.GB1329@eros.localdomain>
 <20190201160310.5b98eb69@lwn.net>
 <20190202143209.GA8620@rapoport-lnx>
 <20190204211220.GA8601@eros.localdomain>
 <20190204160336.12fe82f6@lwn.net>
 <c19a1a84-72cd-407a-f4f1-180c5b0d4bf0@darmarit.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c19a1a84-72cd-407a-f4f1-180c5b0d4bf0@darmarit.de>
X-Mailer: Mutt 1.11.3 (2019-02-01)
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 05, 2019 at 09:30:46AM +0100, Markus Heiser wrote:
> Am 05.02.19 um 00:03 schrieb Jonathan Corbet:
> > On Tue, 5 Feb 2019 08:12:20 +1100
> > "Tobin C. Harding" <me@tobin.cc> wrote:
> > 
> > > I tried to investigate this further and I am unable to reproduce the
> > > original warning.  I'm using python virtual environment as directed by
> > > the output of `make htmldocs` so the environment should not have
> > > changed.  The only other plausible explanation seems to be that I've
> > > gone mad and can't remember what I was doing three days ago.
> > 
> > You are not the first to have reported such issues, though; I've seen a
> > couple of things go by in the past.  Until we understand what is going on,
> > it's probably best to avoid hyphens in labels.

This statement is not sitting well with me Jon, we are using hyphens in
labels all over the place with *almost* no issue.  Seems we either
change them all or none of them.  (FTR I think we should not change any
of them.)

> Many errors are not reported again in rebuilds.

It's more than that.  Seems that no .o files means dependencies are not
the same in docs directories to *usual* source code directories, as in
this example, a file with an outdated label was not rebuilt since it
wasn't touched.

Note to self, always do clean build for docs patches.  Thanks.

> To reproduce this error run 'make cleandocs htmldocs' first.  Then you will see
> this error message (I'am on current docs-next from Jon using Sphinx v1.8.3 ):
> 
>   Documentation/core-api/mm-api.rst:22: WARNING: undefined label: \
>     memory-allocation (if the link has no caption ...)

Can confirm I also get this warning, sloppy work by me I missed one
label.  Second note to self, grep the whole tree not just /Documentation

Thanks for reporting this.

> In mm-api.rst you find this include:
> 
> .. kernel-doc:: include/linux/slab.h
>    :internal:
> 
> 
> And in slab.h you see a kmalloc DOC with a :ref:`..<memory-allocation>`
> 
> 
> /**
>  * kmalloc - allocate memory
>  * @size: how many bytes of memory are required.
>  * @flags: the type of memory to allocate.
>  *
>  * kmalloc is the normal method of allocating memory
>  * for objects smaller than page size in the kernel.
>  *
>  * The @flags argument may be one of the GFP flags defined at
>  * include/linux/gfp.h and described at
>  * :ref:`Documentation/core-api/mm-api.rst <mm-api-gfp-flags>`
>  *
>  * The recommended usage of the @flags is described at
>  * :ref:`Documentation/core-api/memory-allocation.rst <memory-allocation>`
> 
> 
> With Tobin's patch applied to Jon's docs-next (cd7198fc959), this error comes up
> the first time (for me).
> 
>   Can we please revert cd7198fc959 / Thanks

I agree with you Markus, I'd like to see this reverted.  Jon, your the
boss, if you want this patch to stay I can send in a patch to fix the
undefined label that this patch misses.

> @Tobin can you pleases test to revert cd7198fc959 and make a full build with
> 'cleandocs' first .. may this error comes up again for you and we can
> investigate any further .. if this depends to sphinx-Version or what ever.

With patch reverted, on docs-next, I've got 0 'undefined labels'
warnings.

Hope this adds more help than confusion :)


	Tobin
