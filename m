Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 85E5B7DE78
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Mar 2018 14:26:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751218AbeC2O0g (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Mar 2018 10:26:36 -0400
Received: from s3.sipsolutions.net ([144.76.63.242]:39698 "EHLO
        sipsolutions.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750946AbeC2O0g (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Mar 2018 10:26:36 -0400
Received: by sipsolutions.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <johannes@sipsolutions.net>)
        id 1f1YVe-0000lS-RP; Thu, 29 Mar 2018 16:26:34 +0200
Message-ID: <1522333593.24162.12.camel@sipsolutions.net>
Subject: Re: nested structs parsing
From:   Johannes Berg <johannes@sipsolutions.net>
To:     Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc:     linux-doc@vger.kernel.org, linux-wireless@vger.kernel.org
Date:   Thu, 29 Mar 2018 16:26:33 +0200
In-Reply-To: <20180329112209.5c0e0320@vento.lan>
References: <1522316775.5932.10.camel@sipsolutions.net>
         <1522316827.5932.11.camel@sipsolutions.net>
         <20180329112209.5c0e0320@vento.lan>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 (3.26.6-1.fc27) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

> The original patchset for nested structs was supporting it only 
> when not inlined. This should be fixed on this patchset:
> 
> 	https://lkml.org/lkml/2018/2/19/387
> 
> Do you have those patches on your tree?

No, looks like I don't have those yet. I'll wait for those then.

> With regards to duplicated warnings, that use to happen if the same header
> is included several times (with is a common pratice at the net subsystem).

Yeah, doesn't really matter anyway. I think I have to, in a sense,
because I'm getting lots of functions separately from the headers.

> Could you please merge from docs-next and see if those problems
> get solved?

No, that doesn't seem to address it fully:

net/mac80211/sta_info.h:586: warning: Function parameter or member 'tx_stats.packets' not described in 'sta_info'
net/mac80211/sta_info.h:586: warning: Function parameter or member 'tx_stats.bytes' not described in 'sta_info'
net/mac80211/sta_info.h:586: warning: Function parameter or member 'tx_stats.last_rate' not described in 'sta_info'
net/mac80211/sta_info.h:586: warning: Function parameter or member 'msdu' not described in 'sta_info'

You can reproduce this in

  git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next.git master

(merging with docs-next) and running

  make SPHINXDIRS=driver-api/80211 htmldocs

johannes
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
