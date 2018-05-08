Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 313167DE79
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 May 2018 18:37:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756268AbeEHSgs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 8 May 2018 14:36:48 -0400
Received: from mga02.intel.com ([134.134.136.20]:62098 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756059AbeEHSgq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 8 May 2018 14:36:46 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 May 2018 11:36:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,379,1520924400"; 
   d="scan'208";a="52606104"
Received: from spandruv-desk.jf.intel.com ([10.54.75.31])
  by fmsmga004.fm.intel.com with ESMTP; 08 May 2018 11:36:43 -0700
Message-ID: <1525804604.49308.15.camel@linux.intel.com>
Subject: Re: [PATCH] Documentation/admin-guide/pm/intel_pstate: fix Active
 Mode w/o HWP paragraph
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Juri Lelli <juri.lelli@redhat.com>, linux-kernel@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-doc@vger.kernel.org, linux-pm@vger.kernel.org
Date:   Tue, 08 May 2018 11:36:44 -0700
In-Reply-To: <20180508151209.9314-1-juri.lelli@redhat.com>
References: <20180508151209.9314-1-juri.lelli@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.6 (3.24.6-1.fc26) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 2018-05-08 at 17:12 +0200, Juri Lelli wrote:
> P-state selection algorithm (powersave or performance) is selected by
> echoing the desired choice to scaling_governor sysfs attribute and
> not
> to scaling_cur_freq (as currently stated).
> 
> Fix it.
Thanks for the fix.

> 
> Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>


> 
> ---
>  Documentation/admin-guide/pm/intel_pstate.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/pm/intel_pstate.rst
> b/Documentation/admin-guide/pm/intel_pstate.rst
> index d2b6fda3d67b..ab2fe0eda1d7 100644
> --- a/Documentation/admin-guide/pm/intel_pstate.rst
> +++ b/Documentation/admin-guide/pm/intel_pstate.rst
> @@ -145,7 +145,7 @@ feature enabled.]
>  
>  In this mode ``intel_pstate`` registers utilization update callbacks
> with the
>  CPU scheduler in order to run a P-state selection algorithm, either
> -``powersave`` or ``performance``, depending on the
> ``scaling_cur_freq`` policy
> +``powersave`` or ``performance``, depending on the
> ``scaling_governor`` policy
>  setting in ``sysfs``.  The current CPU frequency information to be
> made
>  available from the ``scaling_cur_freq`` policy attribute in
> ``sysfs`` is
>  periodically updated by those utilization update callbacks too.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
