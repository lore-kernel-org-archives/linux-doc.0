Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BA2FD7D082
	for <lwn-linux-doc@archive.lwn.net>; Mon,  8 Oct 2018 14:25:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbeJHVhq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 8 Oct 2018 17:37:46 -0400
Received: from mga04.intel.com ([192.55.52.120]:20382 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726078AbeJHVhq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 8 Oct 2018 17:37:46 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Oct 2018 07:25:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,357,1534834800"; 
   d="scan'208";a="77120820"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
  by fmsmga008.fm.intel.com with ESMTP; 08 Oct 2018 07:25:45 -0700
Received: from andy by smile with local (Exim 4.91)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1g9WTg-0007hF-OG; Mon, 08 Oct 2018 17:25:44 +0300
Date:   Mon, 8 Oct 2018 17:25:44 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Petr Mladek <pmladek@suse.com>, "Tobin C . Harding" <me@tobin.cc>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] lib/vsprintf: Prepare for more general use of
 ptr_to_id()
Message-ID: <20181008142544.GB15943@smile.fi.intel.com>
References: <20181008110504.25449-1-geert+renesas@glider.be>
 <20181008110504.25449-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181008110504.25449-2-geert+renesas@glider.be>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 08, 2018 at 01:05:02PM +0200, Geert Uytterhoeven wrote:
>   - Make the ptr argument const, to avoid adding casts in future
>     callers,


>   - Add a forward declaration, to avoid moving large blocks of code.

How big it would be? ptr_to_id() itself plus...

> +static char *ptr_to_id(char *buf, char *end, const void *ptr,
> +		       struct printf_spec spec);

-- 
With Best Regards,
Andy Shevchenko


