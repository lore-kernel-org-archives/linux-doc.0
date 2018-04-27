Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E72C97E278
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 11:30:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751792AbeD0Lag (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 07:30:36 -0400
Received: from mga05.intel.com ([192.55.52.43]:36965 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750863AbeD0Laf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Apr 2018 07:30:35 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Apr 2018 04:30:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,335,1520924400"; 
   d="scan'208";a="50427759"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 27 Apr 2018 04:30:32 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 27 Apr 2018 14:30:32 +0300
Date:   Fri, 27 Apr 2018 14:30:32 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] Documentation: driver-api: fix device_connection.rst
 kernel-doc error
Message-ID: <20180427113032.GB31265@kuha.fi.intel.com>
References: <4dcdb5c8-1365-9a0a-81be-893b0d1ea731@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4dcdb5c8-1365-9a0a-81be-893b0d1ea731@infradead.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 26, 2018 at 06:29:41PM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Using incorrect :functions: syntax (extra space) causes an odd kernel-doc
> warning, so fix that.
> 
> Documentation/driver-api/device_connection.rst:42: ERROR: Error in "kernel-doc" directive:
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>

FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  Documentation/driver-api/device_connection.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20180426.orig/Documentation/driver-api/device_connection.rst
> +++ linux-next-20180426/Documentation/driver-api/device_connection.rst
> @@ -40,4 +40,4 @@ API
>  ---
>  
>  .. kernel-doc:: drivers/base/devcon.c
> -   : functions: device_connection_find_match device_connection_find device_connection_add device_connection_remove
> +   :functions: device_connection_find_match device_connection_find device_connection_add device_connection_remove
> 

Thanks,

-- 
heikki
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
