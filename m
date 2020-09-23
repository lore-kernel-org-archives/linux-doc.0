Return-Path: <SRS0=6mJA=DA=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C788C2D0A8
	for <linux-doc@archiver.kernel.org>; Wed, 23 Sep 2020 09:01:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDB1320756
	for <linux-doc@archiver.kernel.org>; Wed, 23 Sep 2020 09:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600851672;
	bh=NDOWUAuy2Qw+1wuXe+l/q5zPNdatk8pGlZn4ZWukEus=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=wjh10fuB5uohZdqgGKBb8KGU/5uJFQavOFFoFOQvZlXxf8lMhRc02g9wS8tqFQUxL
	 IDosPv6ZhmaWhUX3ZgzblHIovgr/Unh0Z5102JXVf2DgVmzErLMbmdeqpPByeCCHwY
	 WgQtajfabQyC8rFhOl8aoQE1jyJu5wmqQQyPbkgE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbgIWJBL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Sep 2020 05:01:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:58180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726178AbgIWJBL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 23 Sep 2020 05:01:11 -0400
Received: from coco.lan (ip5f5ad5c8.dynamic.kabel-deutschland.de [95.90.213.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A316920719;
        Wed, 23 Sep 2020 09:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600851670;
        bh=NDOWUAuy2Qw+1wuXe+l/q5zPNdatk8pGlZn4ZWukEus=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oxRnhbdMYKv3h35L71artw6AiD/AnUULTS9mECdZsyQCpq493Bx+CX9v5sE+sePuV
         O+aYeaLIRThiSBf3HvGtL1W5VotFb0N74/VLFIIIALK5iMcBuEFJdhMYCjjgF9WIjO
         mWRg0pjYltl1bBY5py3pw1tuaVFil3QebKoO6nn8=
Date:   Wed, 23 Sep 2020 11:01:06 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        linux-doc@vger.kernel.org,
        Markus Heiser <markus.heiser@darmarit.de>
Subject: Re: [PATCH RFC] Make the docs build "work" with Sphinx 3.x
Message-ID: <20200923110106.192e313f@coco.lan>
In-Reply-To: <20200922105656.11043bd9@lwn.net>
References: <20200904102925.52fcd2a1@lwn.net>
        <20200921222639.GY32101@casper.infradead.org>
        <87sgbaqnp9.fsf@intel.com>
        <20200922105656.11043bd9@lwn.net>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Tue, 22 Sep 2020 10:56:56 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> On Tue, 22 Sep 2020 10:23:46 +0300
> Jani Nikula <jani.nikula@linux.intel.com> wrote:
> 
> > > Should we be converting the kernel-doc script to output 3.0-style markup
> > > for structs?  
> > 
> > IIUC it's not backwards compatible with Sphinx pre-3.0, so you'd either
> > have to require Sphinx 3.0 or have kernel-doc emit both, depending on
> > the Sphinx version.
> 
> Certainly before requiring 3.0 we should, like, actually make it work with
> 3.0...  People with time to do that appear to be rather scarce at the
> moment, though.  I'll get to it eventually but I have a few other things
> on my plate as well.

Tried to build now with Sphinx 3.2.1. There are thousands of warnings:

	build succeeded, 3423 warnings.

Like those:

	Documentation/driver-api/basics.rst: WARNING: Duplicate C declaration, also defined in 'core-api/workqueue'.
	Declaration is 'unsigned long delay'.

And those:

	./include/uapi/linux/firewire-cdev.h:38: WARNING: Type must be either just a name or a typedef-like declaration.
	If just a name:
	  Error in declarator or parameters
	  Invalid C declaration: Expected identifier in nested name, got keyword: struct [error at 6]
	    struct fw_cdev_event_iso_interrupt
	    ------^
	If typedef-like declaration:
	  Error in declarator or parameters
	  Invalid C declaration: Expected identifier in nested name. [error at 34]
	    struct fw_cdev_event_iso_interrupt
	    ----------------------------------^

If I'm not mistaken, one of the reasons why cdomain was added is
due to the duplicate C declaration.

-

I guess changing kernel-doc to produce Sphinx 3.x syntax and
raise the bar requiring 3.0 to be the minimal version would be
one alternative, but this won't solve the duplicated C declarations. 

Does Sphinx 3.x have some way to enable "local" C references?

Another one could be to make cdomain compatible with 3.x and
make it handle the differences. Not sure how easy/hard would be
to do that.

Thanks,
Mauro
