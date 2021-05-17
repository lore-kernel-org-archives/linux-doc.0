Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4A8C43462
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 13:10:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E34461028
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 13:10:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237304AbhEQNL6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 May 2021 09:11:58 -0400
Received: from mx2.suse.de ([195.135.220.15]:36594 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237321AbhEQNLn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 17 May 2021 09:11:43 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 85D57B174;
        Mon, 17 May 2021 13:10:08 +0000 (UTC)
Date:   Mon, 17 May 2021 15:10:07 +0200
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Markus Heiser <markus.heiser@darmarit.de>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1' codec
 can't encode characters in position 18-20: ordinal not in range(256)
Message-ID: <20210517131007.GL8544@kitsune.suse.cz>
References: <20210506103913.GE6564@kitsune.suse.cz>
 <30f2117f-aa38-6d60-f020-ff5cf8f004b5@darmarit.de>
 <20210506184641.6348a621@coco.lan>
 <0fd5bb54-a8fc-84b2-2bd6-31ab12f12303@darmarit.de>
 <20210506174849.GH6564@kitsune.suse.cz>
 <20210512082238.682f6aea@coco.lan>
 <20210512070157.GQ12700@kitsune.suse.cz>
 <20210512095931.65ece006@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210512095931.65ece006@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 12, 2021 at 09:59:31AM +0200, Mauro Carvalho Chehab wrote:
> Em Wed, 12 May 2021 09:01:57 +0200
> Michal Suchánek <msuchanek@suse.de> escreveu:
> 
> > On Wed, May 12, 2021 at 08:22:38AM +0200, Mauro Carvalho Chehab wrote:
> > > Hi Michal,
> > > 
> > > Em Thu, 6 May 2021 19:48:49 +0200
> > > Michal Suchánek <msuchanek@suse.de> escreveu:
> > >   
> > > > [  127s] + :
> > > > [  127s] + locale
> > > > [  128s] LANG=en_US
> > > > [  128s] LC_CTYPE="en_US"
> > > > [  128s] LC_NUMERIC="en_US"
> > > > [  128s] LC_TIME="en_US"
> > > > [  128s] LC_COLLATE="en_US"
> > > > [  128s] LC_MONETARY="en_US"
> > > > [  128s] LC_MESSAGES="en_US"
> > > > [  128s] LC_PAPER="en_US"
> > > > [  128s] LC_NAME="en_US"
> > > > [  128s] LC_ADDRESS="en_US"
> > > > [  128s] LC_TELEPHONE="en_US"
> > > > [  128s] LC_MEASUREMENT="en_US"
> > > > [  128s] LC_IDENTIFICATION="en_US"
> > > > [  128s] LC_ALL=
> > > > [  128s] + echo LC_ALL=
> > > > [  128s] LC_ALL=
> > > > [  128s] + echo LANG=en_US
> > > > [  128s] LANG=en_US  
> > > 
> > > Where those the locale settings that you used when the build
> > > failed?
> > > 
> > > I tried to reproduce the bug here with, disabling the parallel run (as
> > > it masks the real error) with both:
> > > 
> > > 	$ for i in LANG LC_ALL LC_ADDRESS LC_IDENTIFICATION LC_MEASUREMENT LC_MONETARY LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE LC_TIME; do echo $i=en_US; done
> > > 	$ make cleandocs && make SPHINXOPTS=-j1 htmldocs
> > > 
> > > (this one caused lots of warnings on Debian, due to the
> > >  settings at /etc/locale.gen)
> > > 
> > > and:
> > > 
> > > 	$ for i in LANG LC_ALL LC_ADDRESS LC_IDENTIFICATION LC_MEASUREMENT LC_MONETARY LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE LC_TIME; do echo $i=en_US.ISO-8859-1; done
> > > 	$ make cleandocs && make SPHINXOPTS=-j1 htmldocs
> > > 
> > > Without any success.
> > > 
> > > Could you please provide more details about the build VM and the git 
> > > changeset that caused the issue?  
> > 
> > It depends on what character set your en_US locale implements.
> > 
> > ~> cat test.py   
> > print("↑ᛏ个")
> > ~> locale  
> > LANG=en_US.utf8
> > LC_CTYPE="en_US.utf8"
> > LC_NUMERIC="en_US.utf8"
> > LC_TIME="en_US.utf8"
> > LC_COLLATE="en_US.utf8"
> > LC_MONETARY="en_US.utf8"
> > LC_MESSAGES="en_US.utf8"
> > LC_PAPER="en_US.utf8"
> > LC_NAME="en_US.utf8"
> > LC_ADDRESS="en_US.utf8"
> > LC_TELEPHONE="en_US.utf8"
> > LC_MEASUREMENT="en_US.utf8"
> > LC_IDENTIFICATION="en_US.utf8"
> > LC_ALL=
> > ~> python3 test.py   
> > ↑ᛏ个
> > ~> LANG=en_US python3 test.py   
> > Traceback (most recent call last):
> >   File "test.py", line 1, in <module>
> >     print("\u2191\u16cf\u4e2a\uf8f9")
> > UnicodeEncodeError: 'latin-1' codec can't encode characters in position 0-3: ordinal not in range(256)
> > ~> LANG=C python3 test.py   
> > ↑ᛏ个
> > 
> 
> This is working as expected on my test machine:
> 
> 	$ LANG=en_US.utf8 python3 test.py
> 	↑ᛏ个
> 	$ LANG=en_US python3 test.py
> 	Traceback (most recent call last):
> 	  File "test.py", line 1, in <module>
> 	    print("\u2191\u16cf\u4e2a\uf8f9")
> 	UnicodeEncodeError: 'latin-1' codec can't encode characters in position 0-3: ordinal not in range(256)
> 
> Yet, running:
> 
> 	$ . /devel/v4l/docs/sphinx_3.3.1/bin/activate
> 	make cleandocs && LANG=en_US make SPHINXOPTS=-j1 htmldocs
> 
> Doesn't produce any UnicodeEncodeError errors.
> 
> See, here I'm testing it with Sphinx version 3.3.1, on Ubuntu 20.04,
> using changeset 9f4ad9e425a1 Linux 5.12. Also, both UTF8 and iso8859-1
> are on this machine's locale:
> 
> 	$ more /etc/locale.gen |grep -v ^#
> 	de_DE.UTF-8 UTF-8
> 	en_US ISO-8859-1
> 	en_US.UTF-8 UTF-8
> 
> (On Debian/Ubuntu, python and other tools complain a lot if the used 
>  locale is not at /etc/locale.gen)
> 
> Maybe you're using a different Sphinx version, or maybe the distro
> on your VM is using has different locales installed on it or some
> other different packages.

I am using these:

[   14s] [287/464] cumulate python38-sphinxcontrib-websupport-1.2.4-1.3
[   14s] [323/464] cumulate python38-Sphinx2-2.3.1-4.1
[   14s] [324/464] cumulate python38-sphinx_rtd_theme-0.5.2-1.1
[   14s] [325/464] cumulate python38-sphinxcontrib-applehelp-1.0.2-1.4
[   14s] [326/464] cumulate python38-sphinxcontrib-devhelp-1.0.2-1.4
[   14s] [327/464] cumulate python38-sphinxcontrib-htmlhelp-1.0.3-1.4
[   14s] [328/464] cumulate python38-sphinxcontrib-jsmath-1.0.1-2.5
[   14s] [329/464] cumulate python38-sphinxcontrib-qthelp-1.0.3-1.4
[   14s] [330/464] cumulate python38-sphinxcontrib-serializinghtml-1.1.4-1.4

[  455s] Sphinx parallel build error:
[  455s] UnicodeEncodeError: 'latin-1' codec can't encode characters in
position 18-20: ordinal not in range(256)
[  467s] make[2]: *** [../Documentation/Makefile:91: htmldocs] Error 2
[  467s] make[1]: ***
[/home/abuild/rpmbuild/BUILD/kernel-docs-5.13~rc1.next.20210514/linux-5.13-rc1-next-20210514/Makefile:1784:
htmldocs] Error 2
[  467s] make[1]: Leaving directory
'/home/abuild/rpmbuild/BUILD/kernel-docs-5.13~rc1.next.20210514/linux-5.13-rc1-next-20210514/html'
[  467s] make: *** [Makefile:222: __sub-make] Error 2

Thanks

Michal
