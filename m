Return-Path: <SRS0=BR+k=EI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B799BC4742C
	for <linux-doc@archiver.kernel.org>; Mon,  2 Nov 2020 17:47:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B7F92222B
	for <linux-doc@archiver.kernel.org>; Mon,  2 Nov 2020 17:47:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbgKBRrs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 2 Nov 2020 12:47:48 -0500
Received: from mga04.intel.com ([192.55.52.120]:57861 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726058AbgKBRrr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 2 Nov 2020 12:47:47 -0500
IronPort-SDR: laX+5MEu42o9NiQtv7Or8HmTSzY2U3+Mgm2uRlkO2YB6YpOgY4l8kDAp6X3Tsp/bqegCu1nwhd
 YLPvGU4SaN6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="166332396"
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="166332396"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 09:47:46 -0800
IronPort-SDR: aJ7Vd3F8hNyV6LSM/tSGT0eI1l2qs9rl8krYo143RjC8Qq6e2Wlw5Ox+yBA/xelNy6wp5D3K/N
 UJXBtHq8GqIw==
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="352888178"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 09:47:44 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kZdwk-003HTP-S8; Mon, 02 Nov 2020 19:48:46 +0200
Date:   Mon, 2 Nov 2020 19:48:46 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1] scripts: kernel-doc: Restore anonymous enum parsing
Message-ID: <20201102174846.GT4077@smile.fi.intel.com>
References: <20201102170637.36138-1-andriy.shevchenko@linux.intel.com>
 <20201102182743.77b4c8df@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201102182743.77b4c8df@coco.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 02, 2020 at 06:27:43PM +0100, Mauro Carvalho Chehab wrote:
> Em Mon,  2 Nov 2020 19:06:37 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> escreveu:
> 
> > The commit d38c8cfb0571 ("scripts: kernel-doc: add support for typedef enum")
> > broke anonymous enum parsing. Restore it by relying on members rather than
> > its name.
> > 
> > Fixes: d38c8cfb0571 ("scripts: kernel-doc: add support for typedef enum")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Patch looks ok to me. Do you have an example about using it for
> anonymous enum?

drivers/pinctrl/intel/pinctrl-intel.c

-- 
With Best Regards,
Andy Shevchenko


