Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A0DB97D09D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 May 2018 07:49:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935895AbeE3Hsr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 May 2018 03:48:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:60814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934903AbeE3Hsq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 May 2018 03:48:46 -0400
Received: from localhost (unknown [37.173.62.116])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 449A72087D;
        Wed, 30 May 2018 07:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1527666525;
        bh=fWQABMSDwJbrrPV/pBW/z7kDvjbNc7sBySBcwfb9OAg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KgGx205Y1iAAGnmQ8B6Wsdhtwk5fB1fMthkdzxA389L6xlbQ0XjqMsnIUmeWYvkFa
         sr6EpuDLbYotae/l5ietpiWfcY0cVsB1ksP0MG1DmWlNVH/YWnSQaP2SS+zHEf6Ger
         CEral6vABYf9ktXbu1Yy2wlA+yQ9SdppEHsHhTXA=
Date:   Wed, 30 May 2018 09:48:22 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     okaya@codeaurora.org
Cc:     Christoph Hellwig <hch@infradead.org>, linux-pci@vger.kernel.org,
        timur@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jonathan Corbet <corbet@lwn.net>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>,
        Christoffer Dall <cdall@linaro.org>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Thymo van Beers <thymovanbeers@gmail.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        David Rientjes <rientjes@google.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Keith Busch <keith.busch@intel.com>,
        Dongdong Liu <liudongdong3@huawei.com>,
        Frederick Lawler <fred@fredlawl.com>,
        Oza Pawandeep <poza@codeaurora.org>,
        Gabriele Paoloni <gabriele.paoloni@huawei.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] PCI: Add pci=safemode option
Message-ID: <20180530074822.GB30177@kroah.com>
References: <1527650389-31575-1-git-send-email-okaya@codeaurora.org>
 <20180530043103.GA19734@kroah.com>
 <6c317ed8-cca3-8862-5f3b-12cf14e4d53b@codeaurora.org>
 <20180530073735.GA28793@infradead.org>
 <6dfe2db8f974d94c9867f30ec83d9333@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6dfe2db8f974d94c9867f30ec83d9333@codeaurora.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 30, 2018 at 12:44:29AM -0700, okaya@codeaurora.org wrote:
> On 2018-05-30 00:37, Christoph Hellwig wrote:
> > On Tue, May 29, 2018 at 09:41:33PM -0700, Sinan Kaya wrote:
> > > Bjorn and I discussed the need for such a "safe" mode feature when you
> > > want to bring up PCI for a platform. You want to turn off everything
> > > as
> > > a starter and just stick to bare minimum.
> > 
> > Can we please make it a config option the instead of adding code
> > to every kernel?  Also maybe the bringup should be in the name
> > to make this more clear?
> 
> One other requirement was to have a runtime option rather than compile time
> option.
> 
> When someone reported a problem, we wanted to be able to say "use this
> option and see if system boots" without doing any bisects or recompilation.
> 
> This would be the first step in troubleshooting a system to see if
> fundamental features are working.

That makes sense, people can not rebuild their kernels for the most
part.  Putting it behind a config option would not make sense as it
would always have to be enabled.

> I don't mind changing the name Bjorn mentioned safe option. I made it
> safemode. I am looking at Bjorn for suggestions at this moment.

"minimal"?  "basic"?  "crippled"?
"my_hardware_is_so_borked_it_needs_this_option"?  :)

Naming is hard...

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
