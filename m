Return-Path: <SRS0=2m1s=C2=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24763C43461
	for <linux-doc@archiver.kernel.org>; Thu, 17 Sep 2020 15:34:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF2F522247
	for <linux-doc@archiver.kernel.org>; Thu, 17 Sep 2020 15:34:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="r2V+1e1c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbgIQPeY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Sep 2020 11:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728172AbgIQPZG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Sep 2020 11:25:06 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C97EAC061788;
        Thu, 17 Sep 2020 08:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=+8Uahuv6B8JzyKr+68NNMng9KA/JRAa8Du+YW43o7PM=; b=r2V+1e1cC5J2I0YysafnwV8mdk
        v8buLS1F4VsC6NXj7s+0y5UkO8K1pwSbP091XCCQjbrbq8IQhe/jlX3JgXx+Gl4I+uAcTHISAmJvS
        whzRbgYPJ8tdC2nQfoVCKlXT4fWkL3kJGef5I1L+pvlW10BfPLQuPVUhMc2fu9LYKSfVRFJXwrGFw
        IP01eevM9gbWikpXh9pqobku9cRwpHUUQ9aW9xG4567VzBHReZmhuDSs5FRbCwr+2zkus0GBaDOml
        +rGX6EmkHCRMfOvKH4BeJCW7VHfC3iAnq0BAD08NOVC2xw45hDmRPH+7PKlcP3mvJy0LnfWbMgozm
        DJXBvvGA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kIvmP-0002PA-Ih; Thu, 17 Sep 2020 15:25:01 +0000
Subject: Re: [PATCH linux-next] docs:dev-tools: Fix typo in
 Documentation/dev-tools
To:     Masanari Iida <standby24x7@gmail.com>, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        aryabinin@virtuozzo.com, glider@google.com, dvyukov@google.com,
        catalin.marinas@arm.com, andreyknvl@google.com
References: <20200917134407.63487-1-standby24x7@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a8e79395-d281-d620-d9f8-1be53d8fa7e1@infradead.org>
Date:   Thu, 17 Sep 2020 08:24:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200917134407.63487-1-standby24x7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/17/20 6:44 AM, Masanari Iida wrote:
> This patch fixes some spelling typos found in
> Documentation/dev-tools.
> 
> Signed-off-by: Masanari Iida <standby24x7@gmail.com>
> ---
>  Documentation/dev-tools/kasan.rst    | 4 ++--
>  Documentation/dev-tools/kcov.rst     | 2 +-
>  Documentation/dev-tools/kmemleak.rst | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy
