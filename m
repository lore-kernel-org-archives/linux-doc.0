Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13535C433ED
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 06:39:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E17F5613C8
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 06:39:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbhEGGk3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 May 2021 02:40:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:49674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233241AbhEGGk2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 May 2021 02:40:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7870613C2;
        Fri,  7 May 2021 06:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620369569;
        bh=V8Ee3g82js8dAokz3dJPVSnpVCcS23UfBH9Wd6Jlao8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=evD9KVIE95WqQpfcHwDNDKVFMFhZbFxBLtyHOa2kZNiXzCeDHSehqHXz8hnxsnSH1
         P4YIqjGNk8rMFopS0kKOsgXqRmZTegJB9jO6izZUKbNp76NDF+OhMGlC5DJMpx8Hg+
         z+yXf5bwv/wLeMqWaGekGEcjnHtLuFVP2NRJtVBdqKnyJ+UTZrw0BEmAruHe6smJIF
         J5+Shcvng6gmKTvvDSUEXMCtrW2hBusn1+Ls2Xm/2PJ1kpczNumYihEWy+tj7rDyyl
         DrcVELBlug7oHvdwULwW3NtZKFcQ+GefYPuUkVbRciO7MNuaBj9e578O0v89PRaL9a
         sxq6MbZb5iPCA==
Date:   Fri, 7 May 2021 08:39:24 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Markus Heiser <markus.heiser@darmarit.de>,
        Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1'
 codec can't encode characters in position 18-20: ordinal not in range(256)
Message-ID: <20210507083924.7b8ec1fe@coco.lan>
In-Reply-To: <be21de46-6655-152e-e431-144c2be6137c@infradead.org>
References: <20210506103913.GE6564@kitsune.suse.cz>
        <30f2117f-aa38-6d60-f020-ff5cf8f004b5@darmarit.de>
        <20210506184641.6348a621@coco.lan>
        <0fd5bb54-a8fc-84b2-2bd6-31ab12f12303@darmarit.de>
        <20210506192756.2a2cc273@coco.lan>
        <cecb28f8-dfaa-3584-c9f5-fe15145ef3cf@infradead.org>
        <20210506180842.GD388843@casper.infradead.org>
        <be21de46-6655-152e-e431-144c2be6137c@infradead.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Thu, 6 May 2021 14:21:01 -0700
Randy Dunlap <rdunlap@infradead.org> escreveu:

> On 5/6/21 11:08 AM, Matthew Wilcox wrote:
> > On Thu, May 06, 2021 at 10:57:53AM -0700, Randy Dunlap wrote:  
> >> I have been going thru some of the Documentation/ files...
> >>
> >> Why do several of the files begin with
> >> (hex) ef bb bf    followed by "=================="
> >> for a heading, instead of just "===================".
> >> See e.g. Documentation/timers/no_hz.rst.  

No idea! It seems that the text editor I used on that time added
it for whatever reason.

> > 
> > 00000000  ef bb bf 3d 3d 3d 3d 3d  3d 3d 3d 3d 3d 3d 3d 3d  |...=============|
> > 
> > ef bb bf is utf8 for 0b1111'111011'111111 = 0xFEFF which is the
> > https://en.wikipedia.org/wiki/Byte_order_mark
> > 
> > We should delete it.
> >   
> 
> OK, thanks, I have started on that.
> 
> 
> Just another question: ("inquiring minds want to know")
> 
> Why is/are some docs using U+2217 '*' instead of ASCII '*'?
> E.g., Documentation/block/cdrom-standard.rst.

The cdrom doc is a very special case: it was originally written in LaTeX.
I don't remember any other document in LaTeX inside the Kernel docs during
the conversions I made. See:
	e327cfcb2542 ("docs: cdrom-standard.tex: convert from LaTeX to ReST")

In order to convert it to .rst, I used some tool to first turn it
into plain text (probably LaTeX, but I don't remember anymore), and then
I manually reviewed the entire file, adding ReST tags where needed.

I didn't realize that utf-8 chars were used instead of normal ASCII chars,
as both appear the same when editing it[1].

[1] I use Fedora here. Fedora changed the default charset to utf-8 a long
    time ago.

Anyway, we should be able of get rid of weird UTF-8 chars from it with:

	$ iconv -f utf-8 -t ascii//TRANSLIT Documentation/cdrom/cdrom-standard.rst

I'll prepare a patch fixing it. Some care should be taken, however, as
it has two places where UTF-8 chars should be used[2].

[2] There are two German person names that use UTF-8 chars:
    - 'o' + umlat;
    - a LATIN SMALL LETTER SHARP S (Eszett)

Thanks,
Mauro
