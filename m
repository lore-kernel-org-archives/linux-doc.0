Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6CF917E22F
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Mar 2018 14:34:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1424781AbeCBOeL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Mar 2018 09:34:11 -0500
Received: from ms.lwn.net ([45.79.88.28]:32962 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1424443AbeCBOeL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 2 Mar 2018 09:34:11 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BD6552CA;
        Fri,  2 Mar 2018 14:34:10 +0000 (UTC)
Date:   Fri, 2 Mar 2018 07:34:09 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jiri Slaby <jslaby@suse.cz>
Cc:     Jani Nikula <jani.nikula@intel.com>, linux-doc@vger.kernel.org,
        Takashi Iwai <tiwai@suse.de>
Subject: Re: kernel-doc unbuildable with sphinx 1.7
Message-ID: <20180302073409.2cce15ff@lwn.net>
In-Reply-To: <1b24cf1c-941b-9f0d-21e5-b595f64c49b6@suse.cz>
References: <1b24cf1c-941b-9f0d-21e5-b595f64c49b6@suse.cz>
Organization: LWN.net
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2 Mar 2018 15:10:14 +0100
Jiri Slaby <jslaby@suse.cz> wrote:

> in openSUSE, sphinx was updated to 1.7.1 and kernel-doc cannot be built
> since that time:
> Running Sphinx v1.7.1
> 
> Extension error:
> Could not import extension kerneldoc (exception: cannot import name
> 'Directive')
> 
> It is because sphinx.util.compat.* was removed from sphinx in 1.7 since
> it was deprecated for a long time:
> "sphinx.util.compat.%s is deprecated and will be removed "
>                "in Sphinx 1.7, please use docutils' instead."
> 
> 
> Could you fix that up? python is not my favourite interpreter so fixing
> it myself is not feasible on my side.

I got a patch from Takashi this very morning for that problem; I guess
I'll have to fast-track it Linusward.

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
