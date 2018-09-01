Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4069E7D2EE
	for <lwn-linux-doc@archive.lwn.net>; Sat,  1 Sep 2018 07:33:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbeIALoF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 1 Sep 2018 07:44:05 -0400
Received: from smtp3-1.goneo.de ([85.220.129.38]:40095 "EHLO smtp3-1.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725964AbeIALoF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 1 Sep 2018 07:44:05 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp3.goneo.de (Postfix) with ESMTP id 8C5DD23F9F9;
        Sat,  1 Sep 2018 09:33:01 +0200 (CEST)
X-Virus-Scanned: by goneo
Received: from smtp3.goneo.de ([127.0.0.1])
        by localhost (smtp3.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 6mg080PzcGMG; Sat,  1 Sep 2018 09:33:00 +0200 (CEST)
Received: from ryzen (dyndsl-037-138-238-035.ewe-ip-backbone.de [37.138.238.35])
        by smtp3.goneo.de (Postfix) with ESMTPSA id 47DA023F428;
        Sat,  1 Sep 2018 09:33:00 +0200 (CEST)
Message-ID: <5a40b453e9a419c24af1e368711d504a9086c882.camel@darmarit.de>
Subject: Re: [PATCH] docs: tidy up TOCs and refs to license-rules.rst
From:   Markus Heiser <markus.heiser@darmarit.de>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Jonas Oberg <jonas@fsfe.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Date:   Sat, 01 Sep 2018 09:32:59 +0200
In-Reply-To: <20180831165015.1461bdc7@lwn.net>
References: <20180814114312.23201-1-markus.heiser@darmarit.de>
         <20180831165015.1461bdc7@lwn.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am Freitag, den 31.08.2018, 16:50 -0600 schrieb Jonathan Corbet:
> On Tue, 14 Aug 2018 13:43:12 +0200
> Markus Heiser <markus.heiser@darmarit.de> wrote:
> 
> > The documentation and TOCs are organized in a manner of a tree. Adding a
> > TOC to
> > the root, which refers to a file which is located in a subfolder forms a
> > grid. Those TOCs are a bit confusing and thats why we get additional error
> > messages while building partial documentation::
> > 
> >   $ make SPHINXDIRS=process htmldocs
> >   ...
> >   checking consistency... Documentation/process/license-rules.rst: \
> >   WARNING: document isn't included in any toctree
> > 
> > To fix it, the *root-license-TOC* is replaced by a reference and the
> > 'license-roles.txt' is added to the Documentation/process/index.rst TOC.
> > 
> > BTW: there was an old licences remark in Documentation/process/howto.rst
> > which
> > is also updated, mentioning SPDX and pointing to the license-rules.rst
> 
> So those are two separate changes and should really have been in two
> different patches.  I guess we can let that slide just this
> once...applied.

Ah, OK .. thanks!

> I do have to wonder if the licensing rules are *really* the most
> important thing in our docs - the thing that readers should encounter
> first, before anything else.  I think I'll revisit that at another time...

OT: my patch was to fix the structural licensing mess. Feel free to change,
what you have been applied with commit #aa19a176df95

-- Markus --

