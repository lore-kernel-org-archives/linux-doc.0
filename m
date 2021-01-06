Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD47DC433DB
	for <linux-doc@archiver.kernel.org>; Wed,  6 Jan 2021 05:46:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EB4F22CE3
	for <linux-doc@archiver.kernel.org>; Wed,  6 Jan 2021 05:46:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725789AbhAFFqW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Jan 2021 00:46:22 -0500
Received: from mga07.intel.com ([134.134.136.100]:64079 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725562AbhAFFqW (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 6 Jan 2021 00:46:22 -0500
IronPort-SDR: u90VQLtF0Oh64b8NjT8YUbhE5gjh+LLdytZOfMubw0C857IDSqyhipwKvsYtd+mrJfTRqh5/Wx
 z/kSG/+t17cg==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="241311437"
X-IronPort-AV: E=Sophos;i="5.78,479,1599548400"; 
   d="scan'208";a="241311437"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 21:45:40 -0800
IronPort-SDR: rgoReUgBBvCvxYUE8vN1aDRaoWCHJmtfXAc4NHgmtgqwTytax4xNeBGxb3/E7R/mZSGEnkDyzt
 Hh9YH81PQLxw==
X-IronPort-AV: E=Sophos;i="5.78,479,1599548400"; 
   d="scan'208";a="379160484"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 21:45:41 -0800
Date:   Tue, 5 Jan 2021 21:45:41 -0800
From:   Ira Weiny <ira.weiny@intel.com>
To:     Hao Li <lihao2018.fnst@cn.fujitsu.com>
Cc:     corbet@lwn.net, davem@davemloft.net, gregkh@linuxfoundation.org,
        alexander.deucher@amd.com, mchehab+huawei@kernel.org,
        lee.jones@linaro.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation/dax: Update description of DAX policy
 changing
Message-ID: <20210106054541.GR3097896@iweiny-DESK2.sc.intel.com>
References: <20210106015000.5263-1-lihao2018.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106015000.5263-1-lihao2018.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 06, 2021 at 09:50:00AM +0800, Hao Li wrote:
> After commit 77573fa310d9 ("fs: Kill DCACHE_DONTCACHE dentry even if
> DCACHE_REFERENCED is set"), changes to DAX policy will take effect
> as soon as all references to this file are gone.
> 
> Update the documentation accordingly.
> 
> Signed-off-by: Hao Li <lihao2018.fnst@cn.fujitsu.com>

LGTM

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> ---
> Changes in v2:
>   * simplify sentences and fix style problems.
> 
>  Documentation/filesystems/dax.txt | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/filesystems/dax.txt b/Documentation/filesystems/dax.txt
> index 8fdb78f3c6c9..e03c20564f3a 100644
> --- a/Documentation/filesystems/dax.txt
> +++ b/Documentation/filesystems/dax.txt
> @@ -83,20 +83,9 @@ Summary
>         directories.  This has runtime constraints and limitations that are
>         described in 6) below.
>  
> - 6. When changing the S_DAX policy via toggling the persistent FS_XFLAG_DAX flag,
> -    the change in behaviour for existing regular files may not occur
> -    immediately.  If the change must take effect immediately, the administrator
> -    needs to:
> -
> -    a) stop the application so there are no active references to the data set
> -       the policy change will affect
> -
> -    b) evict the data set from kernel caches so it will be re-instantiated when
> -       the application is restarted. This can be achieved by:
> -
> -       i. drop-caches
> -       ii. a filesystem unmount and mount cycle
> -       iii. a system reboot
> + 6. When changing the S_DAX policy via toggling the persistent FS_XFLAG_DAX
> +    flag, the change to existing regular files won't take effect until the
> +    files are closed by all processes.
>  
>  
>  Details
> -- 
> 2.29.2
> 
> 
> 
