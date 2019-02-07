Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1E7CF7D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Feb 2019 17:31:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbfBGRbY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Feb 2019 12:31:24 -0500
Received: from smtprelay0112.hostedemail.com ([216.40.44.112]:41167 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726319AbfBGRbY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Feb 2019 12:31:24 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id 0E326180CCF7B;
        Thu,  7 Feb 2019 17:31:23 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: snail66_6342d95d3143d
X-Filterd-Recvd-Size: 2438
Received: from XPS-9350.home (unknown [47.151.153.53])
        (Authenticated sender: joe@perches.com)
        by omf19.hostedemail.com (Postfix) with ESMTPA;
        Thu,  7 Feb 2019 17:31:21 +0000 (UTC)
Message-ID: <596652fd8f0a3637649167b47805f1c6ac848f25.camel@perches.com>
Subject: Re: Return: vs Returns:
From:   Joe Perches <joe@perches.com>
To:     Mike Rapoport <rppt@linux.ibm.com>,
        Markus Heiser <markus.heiser@darmarit.de>
Cc:     Matthew Wilcox <willy@infradead.org>, linux-doc@vger.kernel.org
Date:   Thu, 07 Feb 2019 09:31:20 -0800
In-Reply-To: <20190207161852.GC8040@rapoport-lnx>
References: <20190207135924.GV21860@bombadil.infradead.org>
         <20190207153056.GB9120@rapoport-lnx>
         <8cacba6c-32c1-f60b-dfb0-0c74ef09d53c@darmarit.de>
         <20190207161852.GC8040@rapoport-lnx>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 2019-02-07 at 18:18 +0200, Mike Rapoport wrote:
> Hi Markus,
> 
> On Thu, Feb 07, 2019 at 04:58:17PM +0100, Markus Heiser wrote:
> > Am 07.02.19 um 16:30 schrieb Mike Rapoport:
> > > On Thu, Feb 07, 2019 at 05:59:24AM -0800, Matthew Wilcox wrote:
> > > > This seems to be an extremely common mistake to make (indeed, almost
> > > > 3000 occurrences of 'Returns:' vs 5300 occurrences of 'Return:').
> > > Add to that ~1000 '@return:'.
[]
> > > > Could we have a checkpatch warning for it?
> > > 
> > > Does checkpatch checks the kernel-doc parts at all?
> > 
> > No.  I guess there are to many places to fail / to hard to put someone in
> > charge.  E.g. if you do include a single kernel-doc comment from a source all
> > kernel-docs in the source will be parsed and may produce (error/warning)
> > essages.  What we have, are some targets:
> > 
> > -linkcheckdocs
> >  check for broken external links (will connect to external hosts)
> > 
> > - refcheckdocs
> >   check for references to non-existing files under Documentation
> 
> Right, but these should be checked explicitly and I doubt many people do it
> before submitting patches. OTOH, checkpatch is something that's widely used
> and if it had verified the kernel-doc parts, more comments would be
> following the convention.

It's not clear to me what you are asking checkpatch to do here.

It may be reasonable for checkpatch to invoke kernel-doc on some
portion of a patch, but I'm not sure how valuable it will be.


