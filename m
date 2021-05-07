Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F69C433B4
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 08:35:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 722BC60FDC
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 08:35:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbhEGIgb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 May 2021 04:36:31 -0400
Received: from mx2.suse.de ([195.135.220.15]:36602 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230215AbhEGIga (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 May 2021 04:36:30 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 43366B15D;
        Fri,  7 May 2021 08:35:29 +0000 (UTC)
Date:   Fri, 7 May 2021 10:35:27 +0200
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Matthew Wilcox <willy@infradead.org>,
        Markus Heiser <markus.heiser@darmarit.de>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1' codec
 can't encode characters in position 18-20: ordinal not in range(256)
Message-ID: <20210507083527.GL6564@kitsune.suse.cz>
References: <20210506103913.GE6564@kitsune.suse.cz>
 <30f2117f-aa38-6d60-f020-ff5cf8f004b5@darmarit.de>
 <20210506184641.6348a621@coco.lan>
 <0fd5bb54-a8fc-84b2-2bd6-31ab12f12303@darmarit.de>
 <20210506192756.2a2cc273@coco.lan>
 <cecb28f8-dfaa-3584-c9f5-fe15145ef3cf@infradead.org>
 <20210506180842.GD388843@casper.infradead.org>
 <be21de46-6655-152e-e431-144c2be6137c@infradead.org>
 <20210507083924.7b8ec1fe@coco.lan>
 <20210507100435.3095f924@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210507100435.3095f924@coco.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 07, 2021 at 10:04:35AM +0200, Mauro Carvalho Chehab wrote:
> Em Fri, 7 May 2021 08:39:24 +0200
> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
> 
> > Em Thu, 6 May 2021 14:21:01 -0700
> > Randy Dunlap <rdunlap@infradead.org> escreveu:
> > 
> > > On 5/6/21 11:08 AM, Matthew Wilcox wrote:  
> > > > On Thu, May 06, 2021 at 10:57:53AM -0700, Randy Dunlap wrote:    
> > > >> I have been going thru some of the Documentation/ files...
> > > >>
> > > >> Why do several of the files begin with
> > > >> (hex) ef bb bf    followed by "=================="
> > > >> for a heading, instead of just "===================".
> > > >> See e.g. Documentation/timers/no_hz.rst.    
> > 
> > No idea! It seems that the text editor I used on that time added
> > it for whatever reason.
> > 
> > > > 
> > > > 00000000  ef bb bf 3d 3d 3d 3d 3d  3d 3d 3d 3d 3d 3d 3d 3d  |...=============|
> > > > 
> > > > ef bb bf is utf8 for 0b1111'111011'111111 = 0xFEFF which is the
> > > > https://en.wikipedia.org/wiki/Byte_order_mark
> > > > 
> > > > We should delete it.
> > > >     
> > > 
> > > OK, thanks, I have started on that.
> > > 
> > > 
> > > Just another question: ("inquiring minds want to know")
> > > 
> > > Why is/are some docs using U+2217 '*' instead of ASCII '*'?
> > > E.g., Documentation/block/cdrom-standard.rst.  
> > 
> > The cdrom doc is a very special case: it was originally written in LaTeX.
> > I don't remember any other document in LaTeX inside the Kernel docs during
> > the conversions I made. See:
> > 	e327cfcb2542 ("docs: cdrom-standard.tex: convert from LaTeX to ReST")
> > 
> > In order to convert it to .rst, I used some tool to first turn it
> > into plain text (probably LaTeX, but I don't remember anymore), and then
> > I manually reviewed the entire file, adding ReST tags where needed.
> > 
> > I didn't realize that utf-8 chars were used instead of normal ASCII chars,
> > as both appear the same when editing it[1].
> > 
> > [1] I use Fedora here. Fedora changed the default charset to utf-8 a long
> >     time ago.
> > 
> > Anyway, we should be able of get rid of weird UTF-8 chars from it with:
> > 
> > 	$ iconv -f utf-8 -t ascii//TRANSLIT Documentation/cdrom/cdrom-standard.rst
> > 
> > I'll prepare a patch fixing it. Some care should be taken, however, as
> > it has two places where UTF-8 chars should be used[2].
> > 
> > [2] There are two German person names that use UTF-8 chars:
> >     - 'o' + umlat;
> >     - a LATIN SMALL LETTER SHARP S (Eszett)
> 
> Btw, I did a quick check here: excluding translations, there are 182
> files with UTF-8 chars at next-20210429. It seems that most of them
> are on files that got converted from DocBook and html.
> 
> Several of them are valid ones: the ones used on names 
> (like Günther, Alcôve, ...). 

> 2. Some UTF-8 symbols, like:
> 
> 	- ® 
> 	- ™
> 	- ² - used mainly for I²C
> 	- …
> 	- ⬍ ↑ ↓   
> 	- µs - used for microsseconds

> 3. There are couple of places which uses UTF-8 graphic characters, like:
> 
>         /sys/devices/system/edac/
>         ├── mc
>         │   ├── mc0
>         │   │   ├── ce_count
>         │   │   ├── ce_noinfo_count

> I'm preparing a patchset to address the UTF-8 issues on the top of
> today's next, but before posting, it seems reasonable to discuss
> what to do with the above cases. Comments?

So the bottom line is that UTF-8 in the files will stay, and Sphinx
cannot handle UTF-8 when the locale is not UTF-8.

In the long run it might be nice to fix Sphinx to properly set the
encoding of the files it reads and writes. Or maybe there is some
parameter that specifies it?

For the short term I think it is reasonable to run a python test script
that prints fancy unicode characters before running Sphinx and bail if
the test script fails.

eg.
echo 'print("↑ᛏ个")' > test.py
python3 test.py

Thanks

Michal
