Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF1DC5517A
	for <linux-doc@archiver.kernel.org>; Wed, 11 Nov 2020 17:12:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 657D8206CA
	for <linux-doc@archiver.kernel.org>; Wed, 11 Nov 2020 17:12:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgKKRMm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Nov 2020 12:12:42 -0500
Received: from mga17.intel.com ([192.55.52.151]:34854 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726915AbgKKRMm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 11 Nov 2020 12:12:42 -0500
IronPort-SDR: mkst2CQ0SbIi1Bxh+7cNqdumaY0b0Dwsb+b0MpOFScH0DODp0IkHJWMPZqZUz7Es5wnUrsRuRQ
 CtJVrXVfNB+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="150030056"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="150030056"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 09:12:41 -0800
IronPort-SDR: DK1knGE5qjMhExDPvLwz7Jov3xRyM/oAWSrleMhXdE2iSrvArfBGhJXZwkxQQG7N23T4OP2q39
 3bJNhd0F6mNQ==
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="531783743"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 09:12:39 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kctgk-005xpr-0V; Wed, 11 Nov 2020 19:13:42 +0200
Date:   Wed, 11 Nov 2020 19:13:42 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1] scripts: kernel-doc: Restore anonymous enum parsing
Message-ID: <20201111171342.GP4077@smile.fi.intel.com>
References: <20201102170637.36138-1-andriy.shevchenko@linux.intel.com>
 <20201102182743.77b4c8df@coco.lan>
 <20201102174846.GT4077@smile.fi.intel.com>
 <20201102191041.66179ad6@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201102191041.66179ad6@coco.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 02, 2020 at 07:10:41PM +0100, Mauro Carvalho Chehab wrote:
> Em Mon, 2 Nov 2020 19:48:46 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> escreveu:
> 
> > On Mon, Nov 02, 2020 at 06:27:43PM +0100, Mauro Carvalho Chehab wrote:
> > > Em Mon,  2 Nov 2020 19:06:37 +0200
> > > Andy Shevchenko <andriy.shevchenko@linux.intel.com> escreveu:
> > >   
> > > > The commit d38c8cfb0571 ("scripts: kernel-doc: add support for typedef enum")
> > > > broke anonymous enum parsing. Restore it by relying on members rather than
> > > > its name.
> > > > 
> > > > Fixes: d38c8cfb0571 ("scripts: kernel-doc: add support for typedef enum")
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>  
> > > 
> > > Patch looks ok to me. Do you have an example about using it for
> > > anonymous enum?  
> > 
> > drivers/pinctrl/intel/pinctrl-intel.c
> > 
> 
> Thanks! 
> 
> Both include/linux/phy.h and drivers/pinctrl/intel/pinctrl-intel.c
> are parsing fine after your patch.
> 
> So,
> 
> Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks!

Jonathan, can we have this applied?

-- 
With Best Regards,
Andy Shevchenko


