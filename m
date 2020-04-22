Return-Path: <SRS0=zh9o=6G=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6478CC5518A
	for <linux-doc@archiver.kernel.org>; Wed, 22 Apr 2020 10:57:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 427AC20784
	for <linux-doc@archiver.kernel.org>; Wed, 22 Apr 2020 10:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587553040;
	bh=YwkpKo5p45F5WCn3DKGhBp5mw9BKrjZ6di7vAeAJTjs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=0KwJhb81VlCk44deYJo7kVJMqFY98JnAi5ci5MVBZOHOHY3QfZDh1Ji0UKvuf//m0
	 Wh/eF+GD1Uur+M7K1LuC4sqc4eyseQoiWHoK+dPJ8afqT00KUymBEVvCPCf5mUW9k/
	 d624fhyaBh7OZ89QVyGkE2rP3+8Q9QL3+2oqbbC4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728182AbgDVKF0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Apr 2020 06:05:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:56552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728178AbgDVKFZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 22 Apr 2020 06:05:25 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CE26220781;
        Wed, 22 Apr 2020 10:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587549924;
        bh=YwkpKo5p45F5WCn3DKGhBp5mw9BKrjZ6di7vAeAJTjs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CgFf+uywYu3x0IHLe0whDAEAszS8g7CD6GJ++G+147mP1UZeheSGUlIIxnvm07FcS
         Nn0E0ktXt8aryhOz/FTZJEzIzKlZPn+YaZXyh6AB8LdTNPT30VV/y7ke0wJsMi/d0/
         yo+Dh/F7j2c6kwYGrpVMi2ocLTbROof2HkSFC4CA=
Date:   Wed, 22 Apr 2020 12:05:20 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Markus Heiser <markus.heiser@darmarit.de>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: Path troubles when using SPHINXDIRS option
Message-ID: <20200422120520.70054224@coco.lan>
In-Reply-To: <428db3a0-4762-5ff4-1d31-2d64d81e2f65@darmarit.de>
References: <20200421103814.4e0fa4c3@coco.lan>
        <dbc22720-79fe-e7a8-b88c-46108ba5ccf9@darmarit.de>
        <20200422105750.4fed3717@coco.lan>
        <428db3a0-4762-5ff4-1d31-2d64d81e2f65@darmarit.de>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Wed, 22 Apr 2020 11:27:50 +0200
Markus Heiser <markus.heiser@darmarit.de> escreveu:

> Hi Mauro,
> 
> about wording: I will use the term "book" for a SPHINXDIR and "bookshelf"
> for the whole kernel documentation .. 
> 
> Am 22.04.20 um 10:57 schrieb Mauro Carvalho Chehab:
> > Em Tue, 21 Apr 2020 12:52:42 +0200
> > Markus Heiser <markus.heiser@darmarit.de> escreveu:
> >   
> >> Hi Mauro,
> >>
> >> Am 21.04.20 um 10:38 schrieb Mauro Carvalho Chehab:  
> >>>
> >>> Hi,
> >>>
> >>> While building from v5.7-rc2 + media, I noticed that SPHINXDIRS option
> >>> stopped working.
> >>>
> >>> What happens is that, if we don't pass this option, Sphinx assumes that
> >>> the "absolute" path is "Documentation/". So, include options like this:
> >>>
> >>> 	.. include:: /ABI/stable/firewire-cdev
> >>> 	    :literal:
> >>>
> >>>
> >>> would be evaluated as Documentation/ABI/stable/firewire-cdev if built
> >>> without SPHINXDIRS. However, if we do SPHINXDIRS=driver-api, then
> >>> the "absolute" patch would be "Documentation/driver-api", causing this
> >>> error:
> >>>
> >>> 	Sphinx parallel build error:
> >>> 	docutils.utils.SystemMessage: /devel/v4l/patchwork/Documentation/driver-api/firewire.rst:22: (SEVERE/4) Problems with "include" directive path:
> >>>
> >>> This is specially bad for build jobs (like one we have on jenkins that
> >>> is meant to test media patches), as, due to some Sphinx bug, prevents
> >>> sphinx-build to stop, making the toolset to run forever.
> >>>
> >>> I suspect that some change at conf.py could address the path issue.
> >>>
> >>> I'll try to investigate further.
> >>>
> >>> Just to be 100% sure that this is not some version-specific bad
> >>> behavior, I tested (using the latest patch version) Sphinx from
> >>> version 1.7.9 up to 2.4.4. The same two errors happen on all
> >>> versions.
> >>>
> >>> Markus,
> >>>
> >>> Maybe you may have some idea about how to fix those issues.
> >>>
> >>> The parallel build error would likely require fixing something
> >>> inside Sphinx code, making it abort if it gets a "SEVERE" error.
> >>>
> >>> Regards,
> >>> Mauro
> >>>      
> >>
> >> I fixed it with the patch shown below.  Some words about: The use
> >> of the :doc: rule should be replaced by a :ref:.  The path names
> >> of include directives should always relative to the .rst file.  
> > 
> > There are lots of place already using :doc: directive, on both
> > relative and absolute ways:
> > 
> > 	$ git grep ':doc:'|wc -l
> > 	382  
> 
> Your grep is wrong (it also matches the :doc: from kernel-include), use:
> 
>     $ git grep ':doc:`'|wc -l
>     83

Ah, true.

> > Replacing all of them to :ref: will be painful. Also, IMHO, :doc: fits
> > better on most needs, as it makes easier for people working with
> > just plain texts to find to what file a ref points.  
> 
> The opposite of pointing to a file is, that we can only point the
> file not a content in the file and we lost the flexibility of
> dynamical referencing by target's name: If the target is moved,
> the refs has to be changed also. 

True, but we have a script that tracks those problems and even
auto-correct most of such broken references.

Right now, there are *lots* of references to a /Documentation.*
file, without any sphinx tags:


	$ git grep Documentation/ Documentation/|grep -v ':doc:`'|grep -v ABI|grep -v binding|wc -l
	1515

An extension like Documentation/sphinx/automarkup.py could
easily replace them by :doc:`Documentation/foo`, creating
links on all those places at no cost.

Adding explicit :ref: would require manual work, and I bet some
maintainers will reject adding extra markups on some files.

> Not used right now, but we also
> lost the ability to link from one "book" to another "book" in
> the "bookshelf" or even into other books available in the WEB
> (this is what intersphinx can do).

As currently we don't use intersphinx, I'm not too much concerned
about what it could provide in the future.

In any case, maybe one day intersphinx will have support for :doc: 
types added there as well. 

Without looking into the dirty details, it doesn't sound too hard to add 
support for it: intersphinx could simply create a :ref: type of reference 
for all files (like, __doc_driver_api__media__drivers__tuners). Then,
any place with a :doc:`/driver-api/media/drivers/tuner` would be
dynamically replaced by a :ref:`__doc_driver_api__media__drivers__tuners`
at runtime.

>   Its a decission what counts more.
> 
> > Btw, not sure why, but, when doing some conversions I got broken
> > references when using :ref:. So, I ended using :doc: instead.  
> 
> Can't believe, there must have been other reasons.

Maybe. I tried several times on some documents, but it caused sphinx
warnings about unknown cross references. Not sure why, and didn't
investigated it further.

> >> To go further ... with patch below:
> >>
> >>      $ make SPHINXDIRS="driver-api" htmldocs
> >>
> >> shows some " WARNING: undefined label: ..." messages.  To close
> >> such links (addressing objects outside of the SPHINXDIR) we need
> >> to activate intersphinx [1].
> >>
> >> If we activate intersphinx we have to wait one release cycle to
> >> get a objects.inv file at:
> >>
> >>      https://www.kernel.org/doc/html/latest/
> >>
> >> When the objects.inv file is available, the warnings are
> >> disappear.  
> > 
> > Yeah, interphinx would help a lot to solve broken references.
> > 
> > Not sure, however, if it is worth using it (at least for html).  
> 
> Why should a http link does not work in a PDF file? .. I mean, its
> just inserting HTTP links.

The thing with PDF is that not many developers (I know) are using it.

Maybe now that we have a separate directory with just the PDF books,
without the other temporary files people may start using it more.

> > I mean, IMHO, the big reason why someone would use SPHINXDIRS is to
> > speedup the process of testing if a documentation patch did the right
> > thing.  
> 
> I can't speak for other, but I often prefer a book with links in over
> a complete bookshelf holding in my hands ;)

Well, I also often prefer reading a PDF book, when it provides a good
comprehensive documentation. On most places, we're not there yet: there 
are too many gaps inside the documentation for it to be used as a real
book. I hope someday this will change.

Thanks,
Mauro
