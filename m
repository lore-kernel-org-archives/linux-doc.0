Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 597297E677
	for <lwn-linux-doc@archive.lwn.net>; Thu, 15 Mar 2018 10:25:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751527AbeCOKZQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 15 Mar 2018 06:25:16 -0400
Received: from mga14.intel.com ([192.55.52.115]:17455 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751405AbeCOKZP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Mar 2018 06:25:15 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Mar 2018 03:25:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,310,1517904000"; 
   d="scan'208";a="38196789"
Received: from jnikula-mobl2.fi.intel.com (HELO localhost) ([10.237.72.62])
  by fmsmga001.fm.intel.com with ESMTP; 15 Mar 2018 03:25:14 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Gary R Hook <gary.hook@amd.com>, linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, corbet@lwn.net
Subject: Re: [PATCH] Documentation/CodingStyle: Add an example for braces
In-Reply-To: <152106609844.18780.6843553697430932588.stgit@taos>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <152106609844.18780.6843553697430932588.stgit@taos>
Date:   Thu, 15 Mar 2018 12:26:09 +0200
Message-ID: <87zi39ljni.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 14 Mar 2018, Gary R Hook <gary.hook@amd.com> wrote:
> Add another example of required braces when using a compound statement in
> a loop.
>
> Signed-off-by: Gary R Hook <gary.hook@amd.com>
> ---
>  Documentation/process/coding-style.rst |    9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
> index a20b44a40ec4..d98deb62c400 100644
> --- a/Documentation/process/coding-style.rst
> +++ b/Documentation/process/coding-style.rst
> @@ -200,6 +200,15 @@ statement; in the latter case use braces in both branches:
>  		otherwise();
>  	}
>  
> +Also, use braces when a loop contains more than a single simple statement:

Personally, I'd not limit this to loops.

	if (condition) {
        	if (another_condition)
                	action();
        }

You could argue the existing rule already covers these cases by
excluding selection and iteration statements from the "single statement"
in "Do not unnecessarily use braces where a single statement will do."

BR,
Jani.

> +
> +.. code-block:: c
> +
> +	while (condition) {
> +		if (test)
> +			do_something();
> +	}
> +
>  3.1) Spaces
>  ***********
>  
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-doc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Jani Nikula, Intel Open Source Technology Center
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
