Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8294C7D581
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Sep 2018 16:18:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbeIGVAM convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Sep 2018 17:00:12 -0400
Received: from prv1-mh.provo.novell.com ([137.65.248.33]:51994 "EHLO
        prv1-mh.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbeIGVAM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Sep 2018 17:00:12 -0400
X-Greylist: delayed 1214 seconds by postgrey-1.27 at vger.kernel.org; Fri, 07 Sep 2018 17:00:12 EDT
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
        with Novell_GroupWise; Fri, 07 Sep 2018 09:58:23 -0600
Message-Id: <5B92A01D02000078001E67CE@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.0.2 
Date:   Fri, 07 Sep 2018 09:58:21 -0600
From:   "Jan Beulich" <JBeulich@suse.com>
To:     "Marek Marczykowski" <marmarek@invisiblethingslab.com>
Cc:     "Kai-Heng Feng" <kai.heng.feng@canonical.com>,
        "Thymo van Beers" <thymovanbeers@gmail.com>,
        "Bjorn Helgaas" <bhelgaas@google.com>,
        "David Rientjes" <rientjes@google.com>,
        "Frederic Weisbecker" <frederic@kernel.org>,
        "Ingo Molnar" <mingo@kernel.org>, <tglx@linutronix.de>,
        <gregkh@linuxfoundation.org>,
        "xen-devel" <xen-devel@lists.xenproject.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
        "Konrad Rzeszutek Wilk" <konrad.wilk@oracle.com>,
        "Juergen Gross" <jgross@suse.com>, "Jiri Kosina" <jkosina@suse.cz>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [Xen-devel] [PATCH v2] xen/balloon: add runtime control
 for scrubbing ballooned out pages
References: <20180907153117.17258-1-marmarek@invisiblethingslab.com>
In-Reply-To: <20180907153117.17258-1-marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

>>> On 07.09.18 at 17:31, <marmarek@invisiblethingslab.com> wrote:
> --- a/drivers/xen/mem-reservation.c
> +++ b/drivers/xen/mem-reservation.c
> @@ -14,6 +14,14 @@
>  
>  #include <xen/interface/memory.h>
>  #include <xen/mem-reservation.h>
> +#include <linux/moduleparam.h>
> +
> +#ifdef CONFIG_XEN_SCRUB_PAGES_DEFAULT
> +bool __read_mostly xen_scrub_pages = true;
> +#else
> +bool __read_mostly xen_scrub_pages = false;
> +#endif

Use IS_ENABLED() here instead of the #ifdef?

Jan


