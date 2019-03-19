Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7B6B17D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 19 Mar 2019 10:09:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbfCSKJt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 19 Mar 2019 06:09:49 -0400
Received: from outbound-smtp02.blacknight.com ([81.17.249.8]:35235 "EHLO
        outbound-smtp02.blacknight.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725862AbfCSKJt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Mar 2019 06:09:49 -0400
X-Greylist: delayed 336 seconds by postgrey-1.27 at vger.kernel.org; Tue, 19 Mar 2019 06:09:48 EDT
Received: from mail.blacknight.com (pemlinmail04.blacknight.ie [81.17.254.17])
        by outbound-smtp02.blacknight.com (Postfix) with ESMTPS id 58B3F98AC8
        for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2019 10:04:11 +0000 (UTC)
Received: (qmail 4595 invoked from network); 19 Mar 2019 10:04:11 -0000
Received: from unknown (HELO techsingularity.net) (mgorman@techsingularity.net@[213.151.95.130])
  by 81.17.254.9 with ESMTPSA (DHE-RSA-AES256-SHA encrypted, authenticated); 19 Mar 2019 10:04:11 -0000
Date:   Tue, 19 Mar 2019 10:04:10 +0000
From:   Mel Gorman <mgorman@techsingularity.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux MM <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] list.h: fix list_is_first() kernel-doc
Message-ID: <20190319100410.gtscz4no3dfsbjng@techsingularity.net>
References: <ddce8b80-9a8a-d52d-3546-87b2211c089a@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <ddce8b80-9a8a-d52d-3546-87b2211c089a@infradead.org>
User-Agent: NeoMutt/20170912 (1.9.0)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Mar 17, 2019 at 05:16:26PM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix typo of kernel-doc parameter notation (there should be
> no space between '@' and the parameter name).
> 
> Also fixes bogus kernel-doc notation output formatting.
> 
> Fixes: 70b44595eafe9 ("mm, compaction: use free lists to quickly locate a migration source")
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Mel Gorman <mgorman@techsingularity.net>

Thanks

Acked-by: Mel Gorman <mgorman@techsingularity.net>
