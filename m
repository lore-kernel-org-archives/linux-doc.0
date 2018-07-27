Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8956E7D071
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Jul 2018 21:29:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389633AbeG0WxS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Jul 2018 18:53:18 -0400
Received: from ms.lwn.net ([45.79.88.28]:40656 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389583AbeG0WxS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Jul 2018 18:53:18 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 601E630D;
        Fri, 27 Jul 2018 21:29:33 +0000 (UTC)
Date:   Fri, 27 Jul 2018 15:29:32 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Michal Hocko <mhocko@kernel.org>, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/7] docs/mm: make GFP flags descriptions usable as
 kernel-doc
Message-ID: <20180727152932.0ead76d1@lwn.net>
In-Reply-To: <20180727212720.GD17745@rapoport-lnx>
References: <1532626360-16650-1-git-send-email-rppt@linux.vnet.ibm.com>
        <1532626360-16650-7-git-send-email-rppt@linux.vnet.ibm.com>
        <20180726160825.0667af9f@lwn.net>
        <20180727212720.GD17745@rapoport-lnx>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 28 Jul 2018 00:27:21 +0300
Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:

> > I won't insist on this, but I would suggest that, in this particular case,
> > it might be better for that markup to come out.  
> 
> No problem with removing % signs, but the whitespace changes are necessary,
> otherwise the generated html gets weird.

The whitespace changes are fine - it's really just the % markup I was
commenting on.

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
