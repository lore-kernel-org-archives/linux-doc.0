Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE64C43460
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 10:29:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6576861460
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 10:29:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236863AbhEGKaJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 May 2021 06:30:09 -0400
Received: from mx2.suse.de ([195.135.220.15]:54920 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236901AbhEGKaH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 May 2021 06:30:07 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 3018CAEB6;
        Fri,  7 May 2021 10:29:07 +0000 (UTC)
Date:   Fri, 7 May 2021 12:29:05 +0200
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     Markus Heiser <markus.heiser@darmarit.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Matthew Wilcox <willy@infradead.org>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1' codec
 can't encode characters in position 18-20: ordinal not in range(256)
Message-ID: <20210507102905.GM6564@kitsune.suse.cz>
References: <20210506192756.2a2cc273@coco.lan>
 <cecb28f8-dfaa-3584-c9f5-fe15145ef3cf@infradead.org>
 <20210506180842.GD388843@casper.infradead.org>
 <be21de46-6655-152e-e431-144c2be6137c@infradead.org>
 <20210507083924.7b8ec1fe@coco.lan>
 <20210507100435.3095f924@coco.lan>
 <20210507083527.GL6564@kitsune.suse.cz>
 <85bebda3-df0b-8554-5f90-45aa097ce405@darmarit.de>
 <20210507111451.36f063bb@coco.lan>
 <43583d9c-bfc4-e3c2-96d9-7cffec9e2909@darmarit.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43583d9c-bfc4-e3c2-96d9-7cffec9e2909@darmarit.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 07, 2021 at 11:51:47AM +0200, Markus Heiser wrote:
> Am 07.05.21 um 11:14 schrieb Mauro Carvalho Chehab:
> > Em Fri, 7 May 2021 10:56:39 +0200
> > Markus Heiser <markus.heiser@darmarit.de> escreveu:
> > 
> > > Am 07.05.21 um 10:35 schrieb Michal Suchánek:
> > > > So the bottom line is that UTF-8 in the files will stay, and Sphinx
> > > > cannot handle UTF-8 when the locale is not UTF-8.
> > > > 
> > > > In the long run it might be nice to fix Sphinx to properly set the
> > > > encoding of the files it reads and writes. Or maybe there is some
> > > > parameter that specifies it?
> > > 
> > > Let's not mix things up. The Unicode-Error is not related or limited
> > > to log nor to sphinx, it is related to the fact that we (you) try to
> > > run a utf-8 application in an environment which is not full utf-8
> > > functional.
> > 
> > No. The application itself is not UTF-8. The application input files are.
> 
> May be we have a different view on this, for me an application which
> reads UTF-8 in and spids out UTF-8 is an UTF-8 application.
> 
> hint: HTML is just one Sphinx writer, there exist also other writers
> e.g. LaTeX.

And same as the browser can display HTML documents in pretty much any
character set independently of your system locale Sphinx should be able
to produce those for your browser to display independent of the system
locale. Same for LaTeX, PDF, or whatver else.

> > The big issue with the way python works with charsets is due to that:
> > it does a very poor job with regards to that.
> 
> This is your POV, the python developers have a different view on
> handling strings.  There are epic discussions around about.
> 
> But all this discussions won't help, since we can't change the
> principles of python.

It has nothing to do with python developer POV on handling strings or
principles of python.

The python support for handling strings is complete in the sense it does
not depend on the system locale and can handle strings in multiple
charcter sets. Sphinx as program written in python could handle
documents in any encoding supported by python independent of system
locale if Sphinx developers bothered to use the python encoding support
correctly. Apparently they did not.

> 
> Personally I think I can't ignore the principles of a language
> and I'm feeling well with setting up an UTF-8 environment.
> 
> > I remember that in the past I had to use this quite often
> > (before UTF-8 being default on the distros I was using on that time):
> > 
> > 	LANG=C <some_python_script>
> > 
> > Just to avoid them to crash.
> > 
> > If I'm not mistaken, older Fedora/Mandrake distros had some bugs with
> > python-written scripts that, if the machine's language were not
> > English, such scripts crash, as the i18n translated messages were
> > on a different charset than what the python script would be expecting.
> 
> For me "i18n translated message" is a good example that I'm not
> wrong with my opinions.  This is not true for all devices but
> on those device you won't run an applications like Sphinx.

Or it's a good example of people never testing the application for the
case where explicit handling is required, and possibly one of the
reasons more requirements for explicit handling of the encoding were
added. In the end it merely led to changing from universal ASCII
encoding to universal UTF-8 encoding with no support for running python
scripts in any locale that does not use the 'universal' encoding.

I think that the idea was to make scripts resilient to encoding errors
and prevent data corruption by raising an exception when mishandling of
encoding is detected but instead of handling the exceptions people just
punted to using the same encoding all the time.

Thanks

Michal
