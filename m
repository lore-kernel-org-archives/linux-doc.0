Return-Path: <SRS0=3O92=DN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D83AC41604
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 16:53:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6C492075A
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 16:53:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbgJFQxf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Oct 2020 12:53:35 -0400
Received: from smtprelay0108.hostedemail.com ([216.40.44.108]:40662 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725769AbgJFQxf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Oct 2020 12:53:35 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 6FF63180A7FCF;
        Tue,  6 Oct 2020 16:53:34 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: money83_04146bc271c8
X-Filterd-Recvd-Size: 1801
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf19.hostedemail.com (Postfix) with ESMTPA;
        Tue,  6 Oct 2020 16:53:33 +0000 (UTC)
Message-ID: <81ca9b814e3c7f9bac1198e8c6adb29537a5813a.camel@perches.com>
Subject: Re: [PATCH] scripts: kernel-doc: allow passing desired Sphinx C
 domain dialect
From:   Joe Perches <joe@perches.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Changbin Du <changbin.du@intel.com>,
        linux-kernel@vger.kernel.org,
        Markus Heiser <markus.heiser@darmarit.de>
Date:   Tue, 06 Oct 2020 09:53:32 -0700
In-Reply-To: <20201006080134.07d94d26@lwn.net>
References: <ee1f16453ad40eae2603adfde5f6dda3ab1befc7.1601798520.git.mchehab+huawei@kernel.org>
         <20201005101736.7adf4f46@lwn.net> <20201006084207.125c88d5@coco.lan>
         <20201006080134.07d94d26@lwn.net>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 2020-10-06 at 08:01 -0600, Jonathan Corbet wrote:
> On Tue, 6 Oct 2020 08:42:07 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > As right now we don't support Sphinx version 3.0[1], we're actually using just
> > $sphinx_major. So, I'm wonder if it would make sense to also make <minor>
> > optional.
> 
> Maybe...someday we may need it, knowing how the Sphinx folks approach
> compatibility, but I guess we can always add it then if so.
> 
> > The change would be trivial, although the regex will become even more
> > harder to read ;-)
> 
> 	^(\d+)(\.(\d+)){,2}
> 
> ?  (untested, of course)

This doesn't work as capture groups don't nest using {m, n}


