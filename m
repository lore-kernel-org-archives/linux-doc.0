Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 237AC7E22E
	for <lwn-linux-doc@archive.lwn.net>; Sun, 29 Apr 2018 05:26:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751784AbeD2F0d (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 29 Apr 2018 01:26:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:34510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751745AbeD2F0c (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 29 Apr 2018 01:26:32 -0400
Received: from localhost (smbcdgpass.hotspot.hub-one.net [213.174.99.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0EA0F22582;
        Sun, 29 Apr 2018 05:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EA0F22582
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=fail smtp.mailfrom=gregkh@linuxfoundation.org
Date:   Sun, 29 Apr 2018 07:26:17 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        DOCUMENTATION <linux-doc@vger.kernel.org>,
        Linus Torvalds <torvalds@linuxfoundation.org>,
        Andrew Morton <akpm@linuxfoundation.org>,
        Kate Stewart <kate@linuxfoundation.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Christoph Hellwig <hch@lst.de>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Rob Herring <rob.herring@linaro.org>,
        Jonas Oberg <jonas@fsfe.org>, Joe Perches <joe@perches.com>,
        linux-xfs@vger.kernel.org,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: LICENSES: Missing ISC text & possibly a category ("Not
 recommended" vs. "Preferred licenses")
Message-ID: <20180429052617.GC24294@kroah.com>
References: <CACna6rz_Ms2Uv1P6E0gCGNsRwK4nm=PMAOaJ5Uk9aJxs2VSamQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACna6rz_Ms2Uv1P6E0gCGNsRwK4nm=PMAOaJ5Uk9aJxs2VSamQ@mail.gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Apr 28, 2018 at 11:25:17PM +0200, Rafał Miłecki wrote:
> Hi,
> 
> Due to some maintainers *preferring* BSD-compatible license for DTS
> files [0], I was writing mine using ISC. I had no very special reason
> for it: I was choosing between BSD-2-Clause, MIT and ISC. I've chosen
> ISC as I read about its "removal of language deemed unnecessary".
> 
> I took a moment to look at the new SPDX thing and noticed that:
> 1) File license-rules.rst provides "LICENSES/other/ISC" as an example

Yeah, bad example, we should fix that text up.  Care to send a patch? :)

> 2) License file LICENSES/other/ISC doesn't exist
> 3) ISC is listed as an *example* under the "Not recommended licenses"

Yes, please don't use it if at all possible.

> First of all, as ISC is used by some files in the Linux kernel, I
> think it's worth adding to the LICENSE/*/ISC.

I see it is only used in a very small number of dts files.  Why not just
use BSD-2-Clause instead?  What do you find in ISC that is not available
to you with just BSD?

> Secondly, it isn't 100% clear to me if ISC is preferred or not
> recommended. File license-rules.rst suggests the later by listing it
> as an example for "Not recommended". It's just an example though, so
> I'm not 100% sure without seeing it in either: "preferred" or "other"
> directories. Also if anyone finds it "Not recommended", can we get a
> short explanation why is it so, please?

The license is functionally equalivant to BSD-2, so why would you want
to add more complexity here and have two licenses that are the same be
"recommended"?

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
