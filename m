Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF660ECAAD5
	for <linux-doc@archiver.kernel.org>; Mon,  5 Sep 2022 08:34:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236095AbiIEIeI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Sep 2022 04:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237791AbiIEIdT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Sep 2022 04:33:19 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A7C050180;
        Mon,  5 Sep 2022 01:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662366724; x=1693902724;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=NPV+Iryp0p0KjJxr1+rCy91TFkXF6Rdv2ie/zgRFU0Y=;
  b=iORZebpbGW+Zza/wsvYKdOEy4t+wlq3+DOM+S0HyoL522+UC8eTiDDKa
   USjswTqz3AaXzXx8ggKV0fQB9YqlJhmoKbaffAkufTVBuhsWmrOrVittk
   6mVP6pGoGgq8NPy6Z9DqEJ3kIPvqZvwEyNOmfuKZs8479uWiABXHEfVcJ
   5/4zZxJ0YC1/9f+RIbnegFifevWHrHKtP3SCFy2a3ADFZXnrzLdxi4lUQ
   59E10tjLtjfn/tMXD1y6nIQrQgf96uV46aoDMamhKrarxpCSoWw6Edse8
   L+kf9bOSwGR9YJxxdZhLDObZ9WSN36Li8Ez+cyPHCGXbarokfxlKgIFWX
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="283333255"
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="283333255"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 01:32:02 -0700
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="590834788"
Received: from smaciag-mobl2.ger.corp.intel.com (HELO localhost) ([10.252.57.57])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 01:31:59 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 3/4] docs: reconfigure the HTML left column
In-Reply-To: <20220901231632.518583-4-corbet@lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220901231632.518583-1-corbet@lwn.net>
 <20220901231632.518583-4-corbet@lwn.net>
Date:   Mon, 05 Sep 2022 11:31:43 +0300
Message-ID: <87zgfeb4sw.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 01 Sep 2022, Jonathan Corbet <corbet@lwn.net> wrote:
> Use the html_sidebars directive to get a more useful set of links in the
> left column.
>
> Unfortunately, this is a no-op with the default RTD theme, but others
> observe it.

I regret picking the RTD theme way back when, on more of a whim than
anything else, and claiming we could change it later on. :(

BR,
Jani.

>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/conf.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 78dd6d1e7b88..22c9d4df1967 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -370,7 +370,8 @@ html_static_path = ['sphinx-static']
>  html_use_smartypants = False
>  
>  # Custom sidebar templates, maps document names to template names.
> -#html_sidebars = {}
> +# Note that the RTD theme ignores this
> +html_sidebars = { '**': ['searchbox.html', 'localtoc.html', 'sourcelink.html']}
>  
>  # Additional templates that should be rendered to pages, maps page names to
>  # template names.

-- 
Jani Nikula, Intel Open Source Graphics Center
