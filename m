Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CA9A47D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Feb 2019 18:03:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbfBGSDP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Feb 2019 13:03:15 -0500
Received: from smtprelay0136.hostedemail.com ([216.40.44.136]:56365 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726171AbfBGSDP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Feb 2019 13:03:15 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id C23071F213;
        Thu,  7 Feb 2019 18:03:13 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: plane58_56436c94e7b2a
X-Filterd-Recvd-Size: 3852
Received: from XPS-9350.home (unknown [47.151.153.53])
        (Authenticated sender: joe@perches.com)
        by omf05.hostedemail.com (Postfix) with ESMTPA;
        Thu,  7 Feb 2019 18:03:12 +0000 (UTC)
Message-ID: <b6261331cb0c766ed213ab8986df1b30c4f7b719.camel@perches.com>
Subject: Re: Return: vs Returns:
From:   Joe Perches <joe@perches.com>
To:     Markus Heiser <markus.heiser@darmarit.de>,
        Matthew Wilcox <willy@infradead.org>
Cc:     Mike Rapoport <rppt@linux.ibm.com>, linux-doc@vger.kernel.org
Date:   Thu, 07 Feb 2019 10:03:11 -0800
In-Reply-To: <5ab01a70-edbc-71b4-8c38-8eee0859889d@darmarit.de>
References: <20190207135924.GV21860@bombadil.infradead.org>
         <20190207153056.GB9120@rapoport-lnx>
         <8cacba6c-32c1-f60b-dfb0-0c74ef09d53c@darmarit.de>
         <20190207161852.GC8040@rapoport-lnx>
         <596652fd8f0a3637649167b47805f1c6ac848f25.camel@perches.com>
         <20190207173448.GZ21860@bombadil.infradead.org>
         <77f029f635867f45e8c0192fc4db5928a00076ef.camel@perches.com>
         <5ab01a70-edbc-71b4-8c38-8eee0859889d@darmarit.de>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 2019-02-07 at 18:58 +0100, Markus Heiser wrote:
> Am 07.02.19 um 18:50 schrieb Joe Perches:
> > On Thu, 2019-02-07 at 09:34 -0800, Matthew Wilcox wrote:
> > > On Thu, Feb 07, 2019 at 09:31:20AM -0800, Joe Perches wrote:
> > > > It's not clear to me what you are asking checkpatch to do here.
> > > > 
> > > > It may be reasonable for checkpatch to invoke kernel-doc on some
> > > > portion of a patch, but I'm not sure how valuable it will be.
> > > 
> > > I was just hoping to match:
> > > 
> > >   * Returns:
> > > 
> > > Or to quote it properly for regexes ...
> > > 
> > > ^ +\* *Returns:
> > > 
> > > (I think ...)
> > > 
> > > I can't see that matching C or assembler.
> > 
> > checkpatch doesn't attempt to enforce any formatting standard
> > on kernel-doc comments.
> > 
> > There doesn't seem to be much standardization for kernel-doc
> > in the first place.
> > 
> > Just for the * return: case:
> > 
> > $ git grep -P -i '^\s*\*\s*returns?\s*:' -- '*.[ch]' | \
> >    grep -P -oh -i '\*\s*returns?\s*:' | \
> >    sort | uniq -c | sort -rn
> >     5153 * Return:
> >     2534 * Returns:
> >     1077 * RETURN:
> >      358 * RETURNS:
> >      173 *	RETURNS:
> >      171 * returns:
> >      153 * return:
> >      148 * Return :
> >       72 * Returns :
> >       61 *	Returns:
> >       37 *  Returns:
> >       30 *  returns:
> >       27 *  return:
> >       22 *	Return:
> >       20 * Returns  :
> >       19 *  Return:
> >       15 *  RETURNS:
> >       11 *           return:
> >        6 * return :
> >        6 *	return:
> >        5 * returns :
> >        3 *Returns:
> >        3 * Returns	:
> >        3 * 	returns:
> >        2 *RETURNS:
> >        2 *     Returns:
> >        2 *      Returns:
> >        2 *	returns:
> >        2 * RETURN :
> >        2 *      Return:
> >        2 * 	Return:
> >        2 *	return :
> >        2 *		return:
> >        1 *   RETURNS:
> >        1 * RETURNs:
> >        1 *   Returns:
> >        1 *    Returns:
> >        1 * 	Returns:
> >        1 *  RETURN:
> >        1 *   Return:
> >        1 *    Return:
> >        1 * return   :
> > 
> > I think standarization is more something that scripts/kernel-doc
> > could or should do.
> 
> BTW: kernel-doc parser accept 'return' and 'returns':
> 
>      } elsif ($newsection =~ m/^return?$/i) {
>          $newsection = $section_return;

That regex doesn't look like it does accept returns.
That looks like it accepts either retur or return.
I believe that would need to be

	$newsection =~ m/returns?$/i

> Is there really a need to be standardize this?

I generally doubt it.


