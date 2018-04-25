Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8FA907E27E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 13:44:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753405AbeDYNoW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 09:44:22 -0400
Received: from mga06.intel.com ([134.134.136.31]:20331 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753282AbeDYNoV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 25 Apr 2018 09:44:21 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Apr 2018 06:44:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,326,1520924400"; 
   d="scan'208";a="49835824"
Received: from jnikula-mobl2.fi.intel.com (HELO localhost) ([10.237.72.62])
  by fmsmga001.fm.intel.com with ESMTP; 25 Apr 2018 06:44:18 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Masanari Iida <standby24x7@gmail.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Markus Heiser <markus.heiser@darmarit.de>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: typec.rst: Use literal-block element with ascii art
In-Reply-To: <20180406124122.70676-1-heikki.krogerus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20180406124122.70676-1-heikki.krogerus@linux.intel.com>
Date:   Wed, 25 Apr 2018 16:47:01 +0300
Message-ID: <87604fcsa2.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 06 Apr 2018, Heikki Krogerus <heikki.krogerus@linux.intel.com> wrote:
> Using reStructuredText literal-block element with ascii-art.
> That prevents the ascii art from being processed as
> reStructuredText.
>
> Reported-by: Masanari Iida <standby24x7@gmail.com>
> Fixes: bdecb33af34f ("usb: typec: API for controlling USB Type-C Multiplexers")
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Jon, this fixes a documentation build failure in v4.17-rc1. It's not
just a warning, it's a complete fail. Our docs builder at 01.org is
failing, apparently the same at kernel.org. Please pick it up soon.

Thanks,
Jani.

> ---
> Changed since v1:
> - Using literal-block element instead of comment
> - Subject in v1 was "Documentation: typec.rst: Mark ascii art as a comment"
> ---
>  Documentation/driver-api/usb/typec.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/driver-api/usb/typec.rst b/Documentation/driver-api/usb/typec.rst
> index feb31946490b..48ff58095f11 100644
> --- a/Documentation/driver-api/usb/typec.rst
> +++ b/Documentation/driver-api/usb/typec.rst
> @@ -210,7 +210,7 @@ If the connector is dual-role capable, there may also be a switch for the data
>  role. USB Type-C Connector Class does not supply separate API for them. The
>  port drivers can use USB Role Class API with those.
>  
> -Illustration of the muxes behind a connector that supports an alternate mode:
> +Illustration of the muxes behind a connector that supports an alternate mode::
>  
>                       ------------------------
>                       |       Connector      |

-- 
Jani Nikula, Intel Open Source Technology Center
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
