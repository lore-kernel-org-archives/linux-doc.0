Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32BE7C433E0
	for <linux-doc@archiver.kernel.org>; Sat, 27 Feb 2021 06:34:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED74064EBC
	for <linux-doc@archiver.kernel.org>; Sat, 27 Feb 2021 06:34:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbhB0GeU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 27 Feb 2021 01:34:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:38982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229554AbhB0GeT (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 27 Feb 2021 01:34:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8BD8664E60;
        Sat, 27 Feb 2021 06:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614407618;
        bh=hPrMFC+Ygct040kW5JEcTSOS+HxpDkAB5GYpG8D3qDE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mo7zcR5toS4981MKiJ4tPNqwOPHUGD87cZxZJcKqWHb80Aa71GLlRLSrRkoKpTNGz
         lDwM53N2vzPxjN3ILDKxZRj+lj5x8Gz2avurBU9SSgiVzWGQcIIt8RIHLMDUlOqgRy
         V/M6J3WKJvWhXxjy86tTKUikPzFpgNOqOxxmJgpE=
Date:   Sat, 27 Feb 2021 07:33:34 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        Tomasz Jankowski <tomasz1.jankowski@intel.com>,
        Savo Novakovic <savox.novakovic@intel.com>,
        Jianxun Zhang <jianxun.zhang@linux.intel.com>
Subject: Re: [PATCH v1 01/12] gna: add driver module
Message-ID: <YDnnvl8OsWdf9sq9@kroah.com>
References: <20210216160525.5028-1-maciej.kwapulinski@linux.intel.com>
 <20210216160525.5028-2-maciej.kwapulinski@linux.intel.com>
 <CAHp75Vep0Fm1k_7gJcozk4t316QmUgt5Qe3PauwDg=py5VnHfQ@mail.gmail.com>
 <85tupysmwc.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85tupysmwc.fsf@linux.intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Feb 26, 2021 at 07:29:39PM +0100, Maciej Kwapulinski wrote:
> 
> Andy Shevchenko <andy.shevchenko@gmail.com> writes:
> 
> > On Tue, Feb 16, 2021 at 6:11 PM Maciej Kwapulinski
> > <maciej.kwapulinski@linux.intel.com> wrote:
> >>
> ....
> >> +#define GNA_DRV_VER    "1.2.0"
> >
> > Nowadays the version is the Git SHA sum.
> >
> 
> right, "version" is present in about 7% of all modules

And it should be removed from them.

> do You mean version should be skipped over (automatically generated)
> srcversion field? or maybe You suggest any (better) technique?

Drop it entirely from the driver code, it means nothing when the driver
is merged into the kernel tree.

thanks,

greg k-h
