Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 129EB7DD32
	for <lwn-linux-doc@archive.lwn.net>; Fri,  6 Apr 2018 09:12:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751447AbeDFJMy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 6 Apr 2018 05:12:54 -0400
Received: from mga04.intel.com ([192.55.52.120]:1502 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751417AbeDFJMx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 6 Apr 2018 05:12:53 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Apr 2018 02:12:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,414,1517904000"; 
   d="scan'208";a="44592775"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 06 Apr 2018 02:12:50 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 06 Apr 2018 12:12:49 +0300
Date:   Fri, 6 Apr 2018 12:12:49 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Masanari Iida <standby24x7@gmail.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] Documentation: typec.rst: Mark ascii art as a comment
Message-ID: <20180406091249.GD21589@kuha.fi.intel.com>
References: <20180406082229.55375-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180406082229.55375-1-heikki.krogerus@linux.intel.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 06, 2018 at 11:22:29AM +0300, Heikki Krogerus wrote:
> To prevent processing of ascii art as reStructuredText
> elements, marking it as a comment.

I will change this, and use literal-block instead.

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

Thanks,

-- 
heikki
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
