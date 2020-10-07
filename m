Return-Path: <SRS0=+dB3=DO=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2463BC4363C
	for <linux-doc@archiver.kernel.org>; Wed,  7 Oct 2020 08:32:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E41CC2083B
	for <linux-doc@archiver.kernel.org>; Wed,  7 Oct 2020 08:32:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbgJGIcf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Oct 2020 04:32:35 -0400
Received: from smtprelay0083.hostedemail.com ([216.40.44.83]:59520 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726463AbgJGIcf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Oct 2020 04:32:35 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 29989180A7FC7;
        Wed,  7 Oct 2020 08:32:34 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: nut33_0905109271cd
X-Filterd-Recvd-Size: 1622
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf16.hostedemail.com (Postfix) with ESMTPA;
        Wed,  7 Oct 2020 08:32:32 +0000 (UTC)
Message-ID: <0b3f06aca033deb1fe3b1635ff3932e7b3f4127a.camel@perches.com>
Subject: Re: [PATCH RFC] script: add a script for checking doc problems with
 external functions
From:   Joe Perches <joe@perches.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org
Date:   Wed, 07 Oct 2020 01:32:31 -0700
In-Reply-To: <87tuv6igwg.fsf@intel.com>
References: <20201005125920.27a7768d@coco.lan>
         <e40a32900dba6b8e7a1f41838ee8caeb1ef1c1b3.1601985151.git.mchehab+huawei@kernel.org>
         <87tuv6igwg.fsf@intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 2020-10-07 at 11:23 +0300, Jani Nikula wrote:
> On Tue, 06 Oct 2020, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > While not all EXPORT_SYMBOL*() symbols should be documented,
> > it seems useful to have a tool which would help to check what
> > symbols aren't documented.
> > 
> > This is a first step on this direction. The tool has some
> > limitations. Yet, it could be useful for maintainers to check
> > about missing documents on their subsystems.
> 
> Seems like this should be part of checkpatch.pl somehow.

I don't see how.


