Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 563157D089
	for <lwn-linux-doc@archive.lwn.net>; Mon, 31 Dec 2018 08:32:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbeLaIcB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 31 Dec 2018 03:32:01 -0500
Received: from mga07.intel.com ([134.134.136.100]:8646 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726033AbeLaIcB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 31 Dec 2018 03:32:01 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 Dec 2018 00:32:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,421,1539673200"; 
   d="scan'208";a="134178085"
Received: from jsvenneb-mobl.ger.corp.intel.com (HELO localhost) ([10.252.57.114])
  by fmsmga001.fm.intel.com with ESMTP; 31 Dec 2018 00:31:58 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Ramunas Geciauskas <kernel@geciauskas.com>, corbet@lwn.net,
        linux-doc@vger.kernel.org
Cc:     Ramunas Geciauskas <kernel@geciauskas.com>
Subject: Re: [PATCH] Documentation/admin-guide: update URL of LKML information link
In-Reply-To: <20181229210000.1132-1-kernel@geciauskas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20181229210000.1132-1-kernel@geciauskas.com>
Date:   Mon, 31 Dec 2018 10:31:56 +0200
Message-ID: <87a7kmumf7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 29 Dec 2018, Ramunas Geciauskas <kernel@geciauskas.com> wrote:
> Information regarding linux-kernel mailing list is no longer hosted on tux.org
> Update the link to point to the one available at kernel.org

Arguably there's no useful current information wrt reporting bugs at the
updated URL either.

BR,
Jani.

>
> Signed-off-by: Ramunas Geciauskas <kernel@geciauskas.com>
> ---
>  Documentation/admin-guide/reporting-bugs.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/reporting-bugs.rst b/Documentation/admin-guide/reporting-bugs.rst
> index 4650edb8840a..49ac8dc3594d 100644
> --- a/Documentation/admin-guide/reporting-bugs.rst
> +++ b/Documentation/admin-guide/reporting-bugs.rst
> @@ -67,7 +67,7 @@ If you can't figure out which subsystem caused the issue, you should file
>  a bug in kernel.org bugzilla and send email to
>  linux-kernel@vger.kernel.org, referencing the bugzilla URL.  (For more
>  information on the linux-kernel mailing list see
> -http://www.tux.org/lkml/).
> +http://vger.kernel.org/lkml/).
>  
>  
>  Tips for reporting bugs

-- 
Jani Nikula, Intel Open Source Graphics Center
