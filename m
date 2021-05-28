Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FF9C4708C
	for <linux-doc@archiver.kernel.org>; Fri, 28 May 2021 10:41:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C76F16108E
	for <linux-doc@archiver.kernel.org>; Fri, 28 May 2021 10:41:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236452AbhE1KnK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 28 May 2021 06:43:10 -0400
Received: from mga14.intel.com ([192.55.52.115]:49704 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236344AbhE1KnK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 28 May 2021 06:43:10 -0400
IronPort-SDR: LLjabeyCzmW2GGyCQyz0V9wKqtlCbVV8HriSMkKKEyh0KPnTIRO+/ehuGwXXCZZCBwI+hF9Ux8
 Yg0Wv7tLp7+g==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="202705297"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="202705297"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 03:41:34 -0700
IronPort-SDR: tMSP/Wo7mClH93pOJnBWJEYk0AbI47yJX0wg8ZjGbEgTX5PZk/TOVKvCc4DCFL1Yy2/eMrewqX
 u+KNOhAa/VEQ==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="473045186"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 03:41:32 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lmZvl-00FIAH-D2; Fri, 28 May 2021 13:41:29 +0300
Date:   Fri, 28 May 2021 13:41:29 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, swboyd@chromium.org, rostedt@goodmis.org,
        linux-doc@vger.kernel.org, senozhatsky@chromium.org,
        linux@rasmusvillemoes.dk, siyanteng01@gmail.com
Subject: Re: [PATCH v2] docs: core-api: Documentation build warning fix
Message-ID: <YLDI2YcyxaiDYrcd@smile.fi.intel.com>
References: <20210528100016.3017663-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528100016.3017663-1-siyanteng@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 28, 2021 at 06:00:16PM +0800, Yanteng Si wrote:
> commit 821c734b5b07 ("module: add printk formats to add module build ID to stacktraces")
> Causes the following warning:

> Documentation/core-api/printk-formats.rst:137: WARNING: Unexpected indentation.
> Documentation/core-api/printk-formats.rst:138: WARNING: Block quote ends without a blank line; unexpected unindent.

The Documentation/core-api/ part can be dropped in both lines.
Anyway, makes sense to me, thanks for fixing it.

> So, add a blank line to the end of "::".

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
> v2:
> * use the canonical format for referring to other commits
> * pick Stephen's Reviewed-by tag
> 
>  Documentation/core-api/printk-formats.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> index a68730e7cfac..38ec2b05e54f 100644
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -131,6 +131,7 @@ printed after the symbol name with an extra ``b`` appended to the end of the
>  specifier.
>  
>  ::
> +
>  	%pS	versatile_init+0x0/0x110 [module_name]
>  	%pSb	versatile_init+0x0/0x110 [module_name ed5019fdf5e53be37cb1ba7899292d7e143b259e]
>  	%pSRb	versatile_init+0x9/0x110 [module_name ed5019fdf5e53be37cb1ba7899292d7e143b259e]
> -- 
> 2.27.0
> 

-- 
With Best Regards,
Andy Shevchenko


