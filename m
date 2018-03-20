Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DB01C7D0F4
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Mar 2018 19:42:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751391AbeCTTmQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Mar 2018 15:42:16 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:55466 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751610AbeCTTmN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 20 Mar 2018 15:42:13 -0400
Received: from sf (trofi-1-pt.tunnel.tserv1.lon2.ipv6.he.net [IPv6:2001:470:1f1c:a0f::2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: slyfox)
        by smtp.gentoo.org (Postfix) with ESMTPSA id E4CEE335C04;
        Tue, 20 Mar 2018 19:42:07 +0000 (UTC)
Date:   Tue, 20 Mar 2018 19:42:03 +0000
From:   Sergei Trofimovich <slyfox@gentoo.org>
To:     Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     corbet@lwn.net, yamada.masahiro@socionext.com, tony.luck@intel.com,
        bjorn.forsman@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] modify one dead link
Message-ID: <20180320194203.205c6c60@sf>
In-Reply-To: <20180320145422.24331-1-mudongliangabcd@gmail.com>
References: <20180320145422.24331-1-mudongliangabcd@gmail.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 20 Mar 2018 10:54:22 -0400
Dongliang Mu <mudongliangabcd@gmail.com> wrote:

> -    # hg clone http://xenbits.xensource.com/ext/ia64/xen-unstable.hg
> +    # hg clone http://xenbits.xensource.com/ext/ia64/xen-unstable
>      # cd xen-unstable.hg
>      # hg clone http://xenbits.xensource.com/ext/ia64/linux-2.6.18-xen.hg

You will need to fix a 'cd' as well:
    cd xen-unstable
 
Otherwise looks good.

-- 

  Sergei
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
