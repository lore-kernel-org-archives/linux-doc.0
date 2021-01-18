Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E877C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 18 Jan 2021 20:06:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4883B22D49
	for <linux-doc@archiver.kernel.org>; Mon, 18 Jan 2021 20:06:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394131AbhARUF3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 18 Jan 2021 15:05:29 -0500
Received: from ms.lwn.net ([45.79.88.28]:39452 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437621AbhARUFV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 18 Jan 2021 15:05:21 -0500
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 11C892AE;
        Mon, 18 Jan 2021 20:04:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 11C892AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1611000263; bh=Y7rJwr2mM18zxjmzhrBMFAJSO0iyh4PFq6jV4mPl2GI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=b80i6IruC0XzdrlDSE5phBn0nrGb0xvZoGDtTYAHwsrmpk1Pnf68tmeBf7NsufNCn
         yjopiDZ3JyLYAkyh87hvu/Ocn3hThbl9WhKNZQ7ONHbuCPKkAJYiTlxTn05/ITeb6O
         Kl0+XRv9cG7WTGpeNtEuV/8dCWNfxVZnJbeeaEAVq6MpochLqUj5J+dDpgmNAN537v
         nWjnBCHOjgbswwSHMeRwVnBKjXzHpuCDrFVYTJq89yvnA5dzPXlkq5O5f+y1DPEDBr
         Hqn+4e75MUD2oNVYdCUTxBWP4SfnQ+Dhq5Yog/+r2jRNQUcM8/2IKHm81VcowH+3vB
         LWMCLgKPaNYVA==
Date:   Mon, 18 Jan 2021 13:04:22 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     SeongJae Park <sj38.park@gmail.com>
Cc:     SeongJae Park <sjpark@amazon.de>, paulmck@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] docs: Update Korean translation
Message-ID: <20210118130422.032fecf0@lwn.net>
In-Reply-To: <20210117100931.9347-1-sj38.park@gmail.com>
References: <20210117100931.9347-1-sj38.park@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 17 Jan 2021 11:09:28 +0100
SeongJae Park <sj38.park@gmail.com> wrote:

> This patchset updates Korean translation of 'howto.rst' and links
> the 'memory-barriers.txt' translation in the index rst file.
> 
> SeongJae Park (3):
>   Documentation/kokr/howto: Replace HTTP links with HTTPS ones:
>     Documentation/process
>   docs/kokr: make reporting-bugs.rst obsolete
>   docs/kokr: Link memory-barriers.txt to rst
> 
>  Documentation/translations/ko_KR/howto.rst |  4 ++--
>  Documentation/translations/ko_KR/index.rst | 15 +++++++++++++++
>  2 files changed, 17 insertions(+), 2 deletions(-)

Series applied, thanks.

jon
