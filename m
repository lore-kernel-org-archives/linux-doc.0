Return-Path: <SRS0=7zml=4H=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A43FC34047
	for <linux-doc@archiver.kernel.org>; Wed, 19 Feb 2020 09:29:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 205392465D
	for <linux-doc@archiver.kernel.org>; Wed, 19 Feb 2020 09:29:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgBSJ36 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Feb 2020 04:29:58 -0500
Received: from ms.lwn.net ([45.79.88.28]:33288 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726195AbgBSJ36 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 19 Feb 2020 04:29:58 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 1D6092DC;
        Wed, 19 Feb 2020 09:29:56 +0000 (UTC)
Date:   Wed, 19 Feb 2020 02:29:51 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: "staging" area for unsorted random files under
 Documentation/*.rst
Message-ID: <20200219022951.6127e48b@lwn.net>
In-Reply-To: <87v9o4ulnd.fsf@intel.com>
References: <20200218113219.7b7cc460@kernel.org>
        <87v9o4ulnd.fsf@intel.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 18 Feb 2020 14:26:14 +0200
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Tue, 18 Feb 2020, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > Shifting those around is not easy (I tried a few times), as some discussions
> > are required in order to get them at their rightful places.
> >
> > So, my current proposal is to just rename them to *.rst, keeping them
> > where they are, and adding them into an "staging" area at the main
> > index.rst. See the enclosed patch.  
> 
> The obligatory bikeshedding comment, how about adding an actual
> "staging" directory under Documentation, perhaps with an index.rst of
> its own?

I kind of agree, actually.  If we absolutely must create a trashpile of
random documents, the top-level directory seems like the worst place for
it.  Let's hide our shame rather than rubbing everybody's nose in it.

> Personally I don't really mind having .txt files around either, just
> *not* at the top level Documentation directory.

In general, RST conversion is not my highest priority at this point.
There is only so much value in creating a more nicely formatted version
of an unorganized heap of obsolete documentation.  Hopefully we get get a
bit more focus on quality once this is all behind us...

Thanks,

jon
