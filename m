Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A6E577DD32
	for <lwn-linux-doc@archive.lwn.net>; Fri,  6 Apr 2018 09:18:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751361AbeDFJSv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 6 Apr 2018 05:18:51 -0400
Received: from mga17.intel.com ([192.55.52.151]:33606 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751329AbeDFJSv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 6 Apr 2018 05:18:51 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Apr 2018 02:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,414,1517904000"; 
   d="scan'208";a="44593699"
Received: from jnikula-mobl2.fi.intel.com (HELO localhost) ([10.237.72.62])
  by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2018 02:18:47 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Masanari Iida <standby24x7@gmail.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] Documentation: typec.rst: Mark ascii art as a comment
In-Reply-To: <20180406082229.55375-1-heikki.krogerus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20180406082229.55375-1-heikki.krogerus@linux.intel.com>
Date:   Fri, 06 Apr 2018 12:19:37 +0300
Message-ID: <87fu48u1xy.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 06 Apr 2018, Heikki Krogerus <heikki.krogerus@linux.intel.com> wrote:
> To prevent processing of ascii art as reStructuredText
> elements, marking it as a comment.

Please don't. This hides the ascii art from the generated documentation.

The right fix is to use a reStructuredText literal block like this:

diff --git a/Documentation/driver-api/usb/typec.rst b/Documentation/driver-api/usb/typec.rst
index feb31946490b..48ff58095f11 100644
--- a/Documentation/driver-api/usb/typec.rst
+++ b/Documentation/driver-api/usb/typec.rst
@@ -210,7 +210,7 @@ If the connector is dual-role capable, there may also be a switch for the data
 role. USB Type-C Connector Class does not supply separate API for them. The
 port drivers can use USB Role Class API with those.
 
-Illustration of the muxes behind a connector that supports an alternate mode:
+Illustration of the muxes behind a connector that supports an alternate mode::
 
                      ------------------------
                      |       Connector      |


BR,
Jani.


>
> Reported-by: Masanari Iida <standby24x7@gmail.com>
> Fixes: bdecb33af34f ("usb: typec: API for controlling USB Type-C Multiplexers")
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  Documentation/driver-api/usb/typec.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/driver-api/usb/typec.rst b/Documentation/driver-api/usb/typec.rst
> index feb31946490b..972c11bf4141 100644
> --- a/Documentation/driver-api/usb/typec.rst
> +++ b/Documentation/driver-api/usb/typec.rst
> @@ -212,7 +212,7 @@ port drivers can use USB Role Class API with those.
>  
>  Illustration of the muxes behind a connector that supports an alternate mode:
>  
> -                     ------------------------
> +..                   ------------------------
>                       |       Connector      |
>                       ------------------------
>                              |         |

-- 
Jani Nikula, Intel Open Source Technology Center
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
