Return-Path: <SRS0=o7tk=4I=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC69C761A1
	for <linux-doc@archiver.kernel.org>; Thu, 20 Feb 2020 05:29:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 930FC20801
	for <linux-doc@archiver.kernel.org>; Thu, 20 Feb 2020 05:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582176581;
	bh=XDQHukBW5nB9NNO8yQ7uq4uTXt2JEPhHQbXyRzpE5jM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=z74M8Q20zD1FoL1FHWl6TqnAc1mqeyr10KsqS4qc22qUvtswW4gN2CPxTAiRWOPYX
	 wv5TFtukpQZ82Wl4jETYZ/jyIO39WpP5RWAeeFkRz99DW5CIb2ssTbyo/yFeK93NmS
	 u1yYHXIkHjMaDd+YcFb2TVb8xDpqObMTgztpPoW8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgBTF3l (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Feb 2020 00:29:41 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:55588 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgBTF3l (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Feb 2020 00:29:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=/bm+Fs2a8O6/9ml+tzca2FzGm/kxq8txZe3TAzg+tRk=; b=Mnm56xC/kYa+Kd6mVqwdC9NS/q
        IukXKtQ83/2x1+5fCtvi4bnMYIJUdlnNNVHhe0vvg1qJFAXhrF/yhfWYsyxvU2CB3SNM5M2AlDgJk
        +kJxC4ZIxmAKlCgtdjHr58JWkii+2zsQPKZPo7kycCe6cbRcyncTBRXo9/KdXgP5L0DBkLVfNc70E
        WR5KnAc6jN0teYdksakwO2jqjuk8eWcXMeWlRF/uk7+e2bM2jFv2cxRns1uHMgDKco5pmJLKQEhfi
        +wxJIt0css9/snr4IwgXlxw7J/NYh/pHmL7w54EWoj9LR7UnP9VzluO/UZjZzo0TdK+nZ5ghYcfBk
        89iQiZ0Q==;
Received: from [80.156.29.194] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j4eP3-0003E6-Fx; Thu, 20 Feb 2020 05:29:37 +0000
Date:   Thu, 20 Feb 2020 06:29:34 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: "staging" area for unsorted random files under
 Documentation/*.rst
Message-ID: <20200220062934.552d2941@kernel.org>
In-Reply-To: <20200219022951.6127e48b@lwn.net>
References: <20200218113219.7b7cc460@kernel.org>
        <87v9o4ulnd.fsf@intel.com>
        <20200219022951.6127e48b@lwn.net>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Wed, 19 Feb 2020 02:29:51 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> On Tue, 18 Feb 2020 14:26:14 +0200
> Jani Nikula <jani.nikula@linux.intel.com> wrote:
> 
> > On Tue, 18 Feb 2020, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:  
> > > Shifting those around is not easy (I tried a few times), as some discussions
> > > are required in order to get them at their rightful places.
> > >
> > > So, my current proposal is to just rename them to *.rst, keeping them
> > > where they are, and adding them into an "staging" area at the main
> > > index.rst. See the enclosed patch.    
> > 
> > The obligatory bikeshedding comment, how about adding an actual
> > "staging" directory under Documentation, perhaps with an index.rst of
> > its own?  
> 
> I kind of agree, actually.  If we absolutely must create a trashpile of
> random documents, the top-level directory seems like the worst place for
> it.  Let's hide our shame rather than rubbing everybody's nose in it.

Ok. I'll prepare a patch creating a Documentation/staging and move those
unsorted stuff into it.

I may try to do another attempt to move at least some of those unsorted
documents to a better place before the final one that will place the
remaining ones under staging/.

> > Personally I don't really mind having .txt files around either, just
> > *not* at the top level Documentation directory.  
> 
> In general, RST conversion is not my highest priority at this point.

Well, right now on my TODO list there are just ~20 files left to convert.

I'm excluding from my TODO a few exceptions like config files with .txt 
extensions and translations, plus a couple of text files whose previous
conversion attempts generated heated discussions.

> There is only so much value in creating a more nicely formatted version
> of an unorganized heap of obsolete documentation.  Hopefully we get get a
> bit more focus on quality once this is all behind us...

Yeah, there's little value nicely formatting outdated stuff. However, 
having them converted make those docs more visible, which in turn helps 
to attract devels to send patches updating them.

The more important is that, once we get past this step, we can have a
clearer view about what's left undocumented.

Cheers,
Mauro
