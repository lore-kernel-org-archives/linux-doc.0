Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AACFC4741F
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 07:37:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1D60221F8
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 07:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604043473;
	bh=3pwBCqOCs6HGfNqWIttcUVOdrDb99M2s77s6BLXlI5A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=JoJ6/etPYTbl8QqIu+hoDNY1ut1mTMVJEtrF1PV+SPiK4KITxmmBIV7By/9YNnE83
	 kSSKekA87suJeit50tjP3YMS9ZI72bkty3hsdu0WWQ9+tifkhZsNvwzi93dptm/ATQ
	 1muaciB5/WEoaMgX+CJeUS+nli7k2dOQ0pR1OmSw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725960AbgJ3Hhx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Oct 2020 03:37:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:50488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725956AbgJ3Hhx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 30 Oct 2020 03:37:53 -0400
Received: from coco.lan (ip5f5ad5bb.dynamic.kabel-deutschland.de [95.90.213.187])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D8DF4221E2;
        Fri, 30 Oct 2020 07:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604043472;
        bh=3pwBCqOCs6HGfNqWIttcUVOdrDb99M2s77s6BLXlI5A=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MyudBg1/uFlwWp5/W/vDnZaHAYeldl/MLtxXYWPG5rf8GK2+a+cGmTUX5xCjWTYw0
         aB6eIStCUnTexzeNKm7CGPkJA9ys1MBUHNbst6P/RwAuAiAWxuXiasBjGHC4nP3VQg
         wKtQoGjPx2PMSoaSOq52hcaiJPzk+67t8m5binJI=
Date:   Fri, 30 Oct 2020 08:37:48 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: excess bolding in html
Message-ID: <20201030083748.4db9848b@coco.lan>
In-Reply-To: <31362b3b-469f-1f74-d929-b6faa7ae4e30@infradead.org>
References: <31362b3b-469f-1f74-d929-b6faa7ae4e30@infradead.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Randy,

Em Thu, 29 Oct 2020 20:17:34 -0700
Randy Dunlap <rdunlap@infradead.org> escreveu:

> Hi,
> 
> I have noticed a few cases of excess bolding in generated html (seen in both
> Firefox and Opera web browsers).
> 
> (1) https://www.kernel.org/doc/html/latest/kernel-hacking/locking.html#futex-api-reference
> 
> In the description of struct hrtimer_sleeper * futex_setup_timer:
> 
> Both the Return line and the next following line are all bold, while the third (final)
> line is not bold (as expected):
> 
> Return
> 
> Initialized hrtimer_sleeper structure or NULL if no timeout
>     value given 

The problem is related to the indentation of "value given".

With ReST, this causes the first line to be print in bold.

The reason for that is that a common practice to describe
arguments on texts is to use this:

	foo
		Does foo things
	bar
		Does bar things

Without this feature at ReST, the above would need to be:

	**foo**

	Does foo things

	**bar**

	Does bar things

Which is more polluted with symbols, on text mode.

-

Just changing the kernel-doc markup at kernel/futex.c:

	/**
	 * futex_setup_timer - set up the sleeping hrtimer.
	 * @time:	ptr to the given timeout value
	 * @timeout:	the hrtimer_sleeper structure to be set up
	 * @flags:	futex flags
	 * @range_ns:	optional range in ns
	 *
	 * Return: Initialized hrtimer_sleeper structure or NULL if no timeout
	 *	   value given
	 */

To:

...
	 * Return:
	 *
	 * Initialized hrtimer_sleeper structure or NULL if no timeout
	 * value given 
	 */

Should fix it.



> 
> (2) https://www.kernel.org/doc/html/latest/filesystems/api-summary.html
> 
> In the description of int seq_open():
> 
> Both the Note line and the following line are all bold, while the final line
> is not bold (as expected):
> 
> Note
> 
> seq_open() will allocate a struct seq_file and store its
>     pointer in file->private_data. This pointer should not be modified. 
> 
> 
> 
> I looked at scripts/kernel-doc briefly but did not see where this is
> happening, so if anyone out there wants a small project to fix,
> please go for it.

We can't make kernel-doc ignore alignments, as otherwise other
things will break, as several kernel-doc markups use indents
for some things (like supporting literal-blocks).

So, such kind of fixes need to be done at the kernel-doc markups.

In this very specific case, though, I guess, some regex could
be used to convert things like:

	* Foo: some multiline
	*      description

into something like:

	* Foo:
	*
	*      some multiline
	*      description

or:

	* Foo:
	*
	* some multiline
	* description

kernel-doc uses this regex to match "Return":

	my $doc_sect = $doc_com .
	    '\s*(\@[.\w]+|\@\.\.\.|description|context|returns?|notes?|examples?)\s*:(.*)';

I guess something could be added after this:

    if (/$doc_sect/i) { # case insensitive for supported section names
        $newsection = $1;
        $newcontents = $2;


in order do to the replacement. Maybe something like this (untested):

    if (/$doc_sect/i) { # case insensitive for supported section names
        $newsection = $1;
        $newcontents = $2;

	my $spaces = $newsection;
	$spaces =~ s/\S/ /;

	$newcontents = $spaces . $newcontents;

Would do the trick.

Thanks,
Mauro
