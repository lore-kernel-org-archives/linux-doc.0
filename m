Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3AB3B7DE78
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 13:44:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751232AbeDRNoC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 09:44:02 -0400
Received: from ms.lwn.net ([45.79.88.28]:41750 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752698AbeDRNn6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Apr 2018 09:43:58 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7C8B3ACC;
        Wed, 18 Apr 2018 13:43:57 +0000 (UTC)
Date:   Wed, 18 Apr 2018 07:43:56 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Olivier Gayot <olivier.gayot@sigexec.com>
Cc:     linux-doc@vger.kernel.org,
        Trivial Patch Monkey <trivial@kernel.org>
Subject: Re: [PATCH] docs: ip-sysctl.txt: fix name of some ipv6 variables
Message-ID: <20180418074356.01d61108@lwn.net>
In-Reply-To: <1524047494-32679-1-git-send-email-olivier.gayot@sigexec.com>
References: <1524047494-32679-1-git-send-email-olivier.gayot@sigexec.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 18 Apr 2018 12:31:34 +0200
Olivier Gayot <olivier.gayot@sigexec.com> wrote:

> The name of the following proc/sysctl entries were incorrectly
> documented:
> 
>     /proc/sys/net/ipv6/conf/<interface>/max_dst_opts_number
>     /proc/sys/net/ipv6/conf/<interface>/max_hbt_opts_number
>     /proc/sys/net/ipv6/conf/<interface>/max_dst_opts_length
>     /proc/sys/net/ipv6/conf/<interface>/max_hbt_length
> 
> Their name was set to the name of the symbol in the .data field of the
> control table instead of their .proc name.

The patch seems good, but can I suggest resending it to netdev?  Davem
likes to handle networking docs patches himself.

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
