Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3618C433ED
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 17:48:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAD9761157
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 17:48:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236275AbhEFRtu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 May 2021 13:49:50 -0400
Received: from mx2.suse.de ([195.135.220.15]:52846 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236042AbhEFRtu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 6 May 2021 13:49:50 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 9EF2CAC1A;
        Thu,  6 May 2021 17:48:50 +0000 (UTC)
Date:   Thu, 6 May 2021 19:48:49 +0200
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     Markus Heiser <markus.heiser@darmarit.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1' codec
 can't encode characters in position 18-20: ordinal not in range(256)
Message-ID: <20210506174849.GH6564@kitsune.suse.cz>
References: <20210506103913.GE6564@kitsune.suse.cz>
 <30f2117f-aa38-6d60-f020-ff5cf8f004b5@darmarit.de>
 <20210506184641.6348a621@coco.lan>
 <0fd5bb54-a8fc-84b2-2bd6-31ab12f12303@darmarit.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fd5bb54-a8fc-84b2-2bd6-31ab12f12303@darmarit.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 06, 2021 at 07:04:44PM +0200, Markus Heiser wrote:
> Am 06.05.21 um 18:46 schrieb Mauro Carvalho Chehab:
> > Em Thu, 6 May 2021 17:57:15 +0200
> > Markus Heiser <markus.heiser@darmarit.de> escreveu:
> > 
> > > Am 06.05.21 um 12:39 schrieb Michal Suchánek:
> > > > When building HTML documentation I get this output:
> > > ...
> > > > [  412s] UnicodeEncodeError: 'latin-1' codec can't encode characters in position 18-20: ordinal not in range(256)
> > > ...
> > > > 
> > > > It does not say which input file contains the offending character so I can't tell which file is broken.
> > > > 
> > > > Any idea how to debug?
> > > 
> > > I guess the build host is a very simple container, what does
> > > 
> > >     echo $LC_ALL
> > >     echo $LANG
It's actually set to en_US just before the build.
> > > 
> > > prompt?  If it is latin, change it to something using utf-8 (I recommend
> > > 'en_US.utf8').
> > > 
> > > A UnicodeEncodeError can occour everywhere where characters are
> > > encoded from (internal) unicode to the encoding of the stream.
> > > 
> > > By example:
> > > 
> > > A print or log statement which streams to stdout needs to encode
> > > from unicode to stdout's encoding.  If there is one unicode symbol
> > > which can not encoded to stream's encoding a UnicodeEncodeError
> > > is raised.
> > 
> > Hi Markus,
> > 
> > It shouldn't matter the builder's locale when building the Kernel
> > documentation (or any other documents built from other git trees
> > on other open source projects), as the Kernel's *.rpm document charset
> > won't change, no matter on what part of the globe it was built.
> > 
> > I vaguely remember about a change we made a couple of years ago
> > in order to address this issue.
> 
> Hi Mauro :)
> 
> sure? .. what if the logger wants to log some symbols from the
> chines translated parts to stdout and the encoding of stdout is
> latin?

[  127s] + cd linux-5.12-next-20210506
[  127s] + export LANG=en_US
[  127s] + LANG=en_US
[  127s] + mkdir -p html
[  127s] + python3 -c 'print("↑ᛏ个")'
[  127s] ↑ᛏ个
[  127s] + echo 'print("↑ᛏ个")'
[  127s] + python3 test.py
[  127s] Traceback (most recent call last):
[  127s]   File "test.py", line 1, in <module>
[  127s]     print("\u2191\u16cf\u4e2a\uf8f9")
[  127s] UnicodeEncodeError: 'latin-1' codec can't encode characters in
position 0-3: ordinal not in range(256)

It certainly does not look like python can print unicode in this
environment. It tells me where the problem is, though.

Thanks

Michal

[  127s] + :
[  127s] + locale
[  128s] LANG=en_US
[  128s] LC_CTYPE="en_US"
[  128s] LC_NUMERIC="en_US"
[  128s] LC_TIME="en_US"
[  128s] LC_COLLATE="en_US"
[  128s] LC_MONETARY="en_US"
[  128s] LC_MESSAGES="en_US"
[  128s] LC_PAPER="en_US"
[  128s] LC_NAME="en_US"
[  128s] LC_ADDRESS="en_US"
[  128s] LC_TELEPHONE="en_US"
[  128s] LC_MEASUREMENT="en_US"
[  128s] LC_IDENTIFICATION="en_US"
[  128s] LC_ALL=
[  128s] + echo LC_ALL=
[  128s] LC_ALL=
[  128s] + echo LANG=en_US
[  128s] LANG=en_US
