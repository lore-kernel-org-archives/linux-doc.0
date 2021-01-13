Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24461C433DB
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 16:48:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC83A23444
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 16:48:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727533AbhAMQsw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Jan 2021 11:48:52 -0500
Received: from mga14.intel.com ([192.55.52.115]:22765 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727517AbhAMQsw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 13 Jan 2021 11:48:52 -0500
IronPort-SDR: 8FbAnB4pPF4fzJ/I4JHUCjYWaNFtEFuyA7H3GDzYeem7iFSzLUxo8vxSjrOaiYKZAnq+/+mDmN
 BsAnujnZWFtg==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="177456810"
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; 
   d="scan'208";a="177456810"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2021 08:48:11 -0800
IronPort-SDR: Th6CDM74jDvuyeWHESONbz6vbFGqakg8IK27aUAK4eko+QDPk9wdfpnYi6TCUwi3ORuKUWliwu
 ZPLs2FAR0SiA==
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; 
   d="scan'208";a="381922871"
Received: from iklein-mobl.ger.corp.intel.com (HELO localhost) ([10.249.40.83])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2021 08:48:08 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Lee Jones <lee.jones@linaro.org>, lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/1] docs: submitting-patches: Emphasise the requirement to Cc: stable when using Fixes: tag
In-Reply-To: <20210113163315.1331064-1-lee.jones@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210113163315.1331064-1-lee.jones@linaro.org>
Date:   Wed, 13 Jan 2021 18:48:05 +0200
Message-ID: <87bldssrzu.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 13 Jan 2021, Lee Jones <lee.jones@linaro.org> wrote:
> Clear-up any confusion surrounding the Fixes: tag with regards to the
> need to Cc: the stable mailing list when submitting stable patch
> candidates.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
> v2:
>  - Link to the 'stable-kernel-rules' document as per Greg's request
>
>  Documentation/process/submitting-patches.rst | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 7c97ad580e7d0..7f48cccc75cdf 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -556,6 +556,11 @@ which stable kernel versions should receive your fix. This is the preferred
>  method for indicating a bug fixed by the patch. See :ref:`describe_changes`
>  for more details.
>  
> +Note: Attaching a Fixes: tag does not subvert the stable kernel rules
> +process nor the requirement to Cc: stable@vger.kernel.org on all stable 
> +patch candidates. For more information, please read
> +:ref:`Documentation/process/stable-kernel-rules.rst <stable_kernel_rules>`

Has there been a process change, or should I take it that a Fixes: tag
without Cc: stable *may* still end up being backported to stable?

BR,
Jani.


> +     
>  .. _the_canonical_patch_format:
>  
>  The canonical patch format

-- 
Jani Nikula, Intel Open Source Graphics Center
