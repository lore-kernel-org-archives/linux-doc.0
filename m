Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B0ADB7E22F
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Mar 2018 15:17:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934881AbeCBPRu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Mar 2018 10:17:50 -0500
Received: from ms.lwn.net ([45.79.88.28]:33092 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S936165AbeCBPRu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 2 Mar 2018 10:17:50 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C94F82C7;
        Fri,  2 Mar 2018 15:17:49 +0000 (UTC)
Date:   Fri, 2 Mar 2018 08:17:48 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Jani Nikula <jani.nikula@intel.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/sphinx: Fix Directive import error
Message-ID: <20180302081748.2ccc93b9@lwn.net>
In-Reply-To: <s5hr2p2frxx.wl-tiwai@suse.de>
References: <s5hbmg6hf4g.wl-tiwai@suse.de>
        <20180302145055.GA18137@bombadil.infradead.org>
        <s5hr2p2frxx.wl-tiwai@suse.de>
Organization: LWN.net
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 02 Mar 2018 15:55:06 +0100
Takashi Iwai <tiwai@suse.de> wrote:

> Jon, would you like me resending the patch?  Or it's trivial enough as
> you can fix in place.

If you can resend that would be great - one less thing for me to have to
squeeze in :)

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
