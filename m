Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 024F77D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Sep 2019 15:51:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728770AbfIKPvm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Sep 2019 11:51:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:50640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728298AbfIKPvm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 11 Sep 2019 11:51:42 -0400
Received: from localhost (unknown [62.28.240.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 75A322085B;
        Wed, 11 Sep 2019 15:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568217100;
        bh=Uczy1nWWXP1lJHSzhWk6sxFS/eif8Lw60mqF97ksP3M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SH65DPofMkz2oRMUW1teQt1DcLR/MLtCe/iriqPc6UgvRohdq5uNgw33jpXQ7EvQr
         PExhgtkYd1u/LIK2La6XBJGj2Tkx1gRcQ8ltIgUIGWDXmqE+T7EeqvMPPPxJtRBPYM
         wi0vLwXsKgZUJlND0mqhU4DlGxM3IWaPVXwtunEI=
Date:   Wed, 11 Sep 2019 16:51:37 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Dave Hansen <dave.hansen@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, corbet@lwn.net, sashal@kernel.org,
        ben@decadent.org.uk, tglx@linutronix.de, labbott@redhat.com,
        andrew.cooper3@citrix.com, tsoni@codeaurora.org,
        keescook@chromium.org, tony.luck@intel.com,
        linux-doc@vger.kernel.org, dan.j.williams@intel.com
Subject: Re: [PATCH 4/4] Documentation/process: add transparency promise to
 list subscription
Message-ID: <20190911155137.GC14152@kroah.com>
References: <20190910172644.4D2CDF0A@viggo.jf.intel.com>
 <20190910172652.4FFF6CA3@viggo.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190910172652.4FFF6CA3@viggo.jf.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 10, 2019 at 10:26:52AM -0700, Dave Hansen wrote:
> 
> From: Dave Hansen <dave.hansen@linux.intel.com>
> 
> Transparency is good.  It it essential for everyone working under an
> embargo to know who is involved and who else is a "knower".  Being
> transparent allows everyone to always make informed decisions about
> ongoing participating in a mitigation effort.
> 
> Add a step to the subscription process which will notify existing
> subscribers when a new one is added.

As I don't run the mailing list software here, I don't know how much of
a burden adding this support to it would be, so I'll defer to Thomas.

We could just have something like "All new people need to announce
themselves" rule like many other private mailing lists have at times.
That would put the burden on the new person once, instead of the list
manager for every time a new person is added.

thanks,

greg k-h
