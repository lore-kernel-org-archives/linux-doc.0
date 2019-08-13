Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E96017D90F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Aug 2019 12:31:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbfHMMbb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Aug 2019 08:31:31 -0400
Received: from mga09.intel.com ([134.134.136.24]:14370 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727441AbfHMMbb (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Aug 2019 08:31:31 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Aug 2019 05:31:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; 
   d="scan'208";a="183857972"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Aug 2019 05:31:26 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hxVxV-0005tt-0M; Tue, 13 Aug 2019 15:31:25 +0300
Date:   Tue, 13 Aug 2019 15:31:24 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] kernel-doc: Allow anonymous enum
Message-ID: <20190813123124.GW30120@smile.fi.intel.com>
References: <20190812160631.32844-1-andriy.shevchenko@linux.intel.com>
 <20190812151317.746379b2@lwn.net>
 <20190813121912.GV30120@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813121912.GV30120@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 13, 2019 at 03:19:12PM +0300, Andy Shevchenko wrote:
> On Mon, Aug 12, 2019 at 03:13:17PM -0600, Jonathan Corbet wrote:
> > On Mon, 12 Aug 2019 19:06:31 +0300
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > 
> > > In C is a valid construction to have an anonymous enumerator.
> > > 
> > > Though we have now:
> > > 
> > >   drivers/pinctrl/intel/pinctrl-intel.c:240: error: Cannot parse enum!
> > > 
> > > Support it in the kernel-doc script.
> > 
> > So I don't get this error; I guess the only anonymous enum of interest has
> > yet to find its way into the mainline.
> 
> The other one is already in mainline (drivers/remoteproc/omap_remoteproc.h),
> but suddenly it misses the second * in the header of kernel-doc comment
> (perhaps to avoid above error, or for another reason).

Actually more without full description

drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:186:

Or with format which messes name with description

drivers/misc/mic/cosm/cosm_main.h:19:
include/linux/amba/pl022.h:166:

Or above variants together

drivers/pinctrl/pinctrl-rockchip.c:86:
drivers/pinctrl/pinctrl-rockchip.c:98:


Noticed also broken references like

drivers/scsi/isci/port.c:1193:
drivers/usb/host/ehci-timer.c:381:

where enum mentioned without leading &.

-- 
With Best Regards,
Andy Shevchenko


