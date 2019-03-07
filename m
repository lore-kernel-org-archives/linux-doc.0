Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 583B97D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Mar 2019 20:31:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726172AbfCGUbV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Mar 2019 15:31:21 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:33211 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726166AbfCGUbV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Mar 2019 15:31:21 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 3CF022D97;
        Thu,  7 Mar 2019 15:31:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 07 Mar 2019 15:31:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=date
        :from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=o9kMLp9UuOuq4QzYt/6iJaS+304
        xFmQEcAqJ+jxgZr4=; b=Eet4PHJsKWyU9DCQUL/2bOxZVdSvpZbqqAdB+Bs228d
        ql1V3Z0/AyUvEsNpU2fN5VN+raxiOPumdFZGsS06cW6w2UMJY5ehndBXKnbcOGXq
        MYNACvWeGUnsc77NH82qPIDBxNNdmFhynA5jI836BGqVy2BlUO0eaJOZCb8e8gy6
        hqKqH9D+cdmRIkzdX+dLwS9arrhvBnVu/Htp7sEqFCoVcNzjgaWqBwte4HH3KmOf
        c/3teEt0sMXqXTvDO2cDJu7un0qtOP6AAC9dH47qrlBkGk9DuO3IiBdw9hXqQt6k
        Ui+/OMybqlRi05gg8DfIzFTi1I80wypz9xjB1LdajXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=o9kMLp
        9UuOuq4QzYt/6iJaS+304xFmQEcAqJ+jxgZr4=; b=TR6dSgaHQJnnLpa9MU1lHc
        P78/i7MZLzVdG6PaqQ2xPZzx9wtlwalPsCSgLyE3rSPRP5Gy1mcDu71jXq9OwN0L
        pFN1i8HfyrnlTvxWAE/pEZafk7keSWM1nVFzu9tRGVWPQKvM7pjNv3AK7/uTqMGL
        aVpf1DShZL0wZTscthSuUrwbvVOFqTigHLb62lyPz/TEYE5/QCeB90V3kcOsMcES
        U7lsFM0hnpG1uoAC4oh2tuudto8DWLMNLB/nak8906hVFlH1X6MZcPLRV5Wa4XdI
        rDVqxKvyBM3V8iHpacobhqAdDpBHRYjykwCiZ1U1sEb9DnmAXwjJPWx/CtHBn1wA
        ==
X-ME-Sender: <xms:lX-BXAxMRVTwQv_KnPh6RQnYewuG94eKddlaBk-zRvzIEO8nLmQWZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrfeekgddugedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludehmdenucfjughrpeffhffvuffkfhggtggujgfofgesthdtredt
    ofervdenucfhrhhomhepfdfvohgsihhnucevrdcujfgrrhguihhnghdfuceomhgvsehtoh
    gsihhnrdgttgeqnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvgedr
    udeiledrhedrudehkeenucfrrghrrghmpehmrghilhhfrhhomhepmhgvsehtohgsihhnrd
    gttgenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:lX-BXPq_bL_KjorRuQdMW1Yj7gSSeUQr8Vpw2gK1N2Ylxn4opcmWug>
    <xmx:lX-BXAPeVVSutQ9lTMl77wXHPshGfEixTka2zi_JxCXN7pY8PMFa_Q>
    <xmx:lX-BXJrC5vkSZS4wheYqvPHtvVmlh8Rs-bpYIjL37_uG7Xa5AulSqA>
    <xmx:lX-BXO8YrBf21vraUl1fG9nx8Gmji1Nx61yc2eIlyFlcFAhpBmIYiA>
Received: from localhost (124-169-5-158.dyn.iinet.net.au [124.169.5.158])
        by mail.messagingengine.com (Postfix) with ESMTPA id 78334E4360;
        Thu,  7 Mar 2019 15:31:16 -0500 (EST)
Date:   Fri, 8 Mar 2019 07:30:41 +1100
From:   "Tobin C. Harding" <me@tobin.cc>
To:     Markus Heiser <markus.heiser@darmarit.de>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: undefined label
Message-ID: <20190307203041.GC21937@eros.localdomain>
References: <20190307091734.GB9152@eros.localdomain>
 <c24a75bf-5bd5-aca8-7764-e05a03495e01@darmarit.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c24a75bf-5bd5-aca8-7764-e05a03495e01@darmarit.de>
X-Mailer: Mutt 1.11.3 (2019-02-01)
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 07, 2019 at 10:58:07AM +0100, Markus Heiser wrote:
> Am 07.03.19 um 10:17 schrieb Tobin C. Harding:
> > Hi Jon,
> > 
> > I hit that undefined label warning again today.  Then just now I was
> > sitting enjoying a quite scotch and the reason came to me.  It is caused
> > by building part of the docs instead of the whole tree i.e. using
> > 
> > 	make SPHINXDIRS=admin-guide htmldocs
> > 
> > Gives the warning
> > 
> > 	WARNING: undefined label: numa (if the link has no caption the label must precede a section header)
> 
> The label 'numa' is not a part of the admin-guide (book), it is set in
> the vm (book): Documentation/vm/numa.rst:1
> 
> If compiling only a book like admin-guide, those links are broken.  Its not only
> 'numa' which is broken and its not only the admin-guide which has cross-books
> links in.
> 
> To close such cross-books links we can use intersphinx [1] and map to e.g.
> 
>   intersphinx_mapping = {
>       'kernel': ('https://www.kernel.org/doc/html/latest/', None)}
> 
> If there is any interest in, I can implement a RFC for this.

Cool!  I think this would be super useful, I for one like using
SPHINXDIRS when developing docs incrementally so removing false warnings
would be nice.  I doubt I'm the only one to be baffled about Sphinx
references.  I'd be happy to review and test your RFC if you CC me.

thanks,
Tobin.
