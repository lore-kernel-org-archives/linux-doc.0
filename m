Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C67C433ED
	for <linux-doc@archiver.kernel.org>; Fri, 14 May 2021 08:35:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23A6D61451
	for <linux-doc@archiver.kernel.org>; Fri, 14 May 2021 08:35:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233626AbhENIgO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 May 2021 04:36:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:50024 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233615AbhENIgN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 14 May 2021 04:36:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED09861458;
        Fri, 14 May 2021 08:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1620981302;
        bh=7yTjkhKbow1AdmlKzv5oAHooV40fOTH61AScihEp7B0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Vm+eqqzyh2x6512Ywx0mQGLgRBFGDFsPb5KnsBaPe3sfACJLA5+M/DKL1vEWKiC3i
         EIvjllOBtoMMJ0ICdFn4GBkbT3oyFqH3r9f2G4dFcsHJkLFe7y2l+Utnk5GcDHxoF7
         HCWXNT21R8/wkPguFzcZLbNZOmiQH80LJmEHbUZY=
Date:   Fri, 14 May 2021 10:34:56 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 00/14] Driver of Intel(R) Gaussian & Neural Accelerator
Message-ID: <YJ42MEgwDZrAEQLl@kroah.com>
References: <20210513110040.2268-1-maciej.kwapulinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513110040.2268-1-maciej.kwapulinski@linux.intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 13, 2021 at 01:00:26PM +0200, Maciej Kwapulinski wrote:
> Dear kernel maintainers,
> 
> This submission is a kernel driver to support Intel(R) Gaussian & Neural
> Accelerator (Intel(R) GNA). Intel(R) GNA is a PCI-based neural co-processor
> available on multiple Intel platforms. AI developers and users can offload
> continuous inference workloads to an Intel(R) GNA device in order to free
> processor resources and save power. Noise reduction and speech recognition
> are the examples of the workloads Intel(R) GNA deals with while its usage
> is not limited to the two.

How does this compare with the "nnpi" driver being proposed here:
	https://lore.kernel.org/r/20210513085725.45528-1-guy.zadicario@intel.com

Please work with those developers to share code and userspace api and
tools.  Having the community review two totally different apis and
drivers for the same type of functionality from the same company is
totally wasteful of our time and energy.

thanks,

greg k-h
