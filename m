Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79458C433E9
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 15:09:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BE5923131
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 15:09:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732730AbhALPJx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 12 Jan 2021 10:09:53 -0500
Received: from ms.lwn.net ([45.79.88.28]:55390 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728843AbhALPJx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 12 Jan 2021 10:09:53 -0500
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CE5461E60;
        Tue, 12 Jan 2021 15:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CE5461E60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1610464153; bh=WZljEY3f0KmIZITDeu9DUokdzKfb2qetZS/P3ru8Upg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hpwAfmc5/cY9ngwksBckfxzUHEd9FZvvRZZc7UPjTvRzglFJOfRee5fAyRYP+bcm1
         C3H/CbRKbjGAoBu+kHXwkUaRwyH12R1g1gWoG2Yk0sdWL3e945EGYFGucFds6qAJq/
         FU0Ks17vh4vVlvNgu158Ux9i7aMmo9DNQsGhgUXYZRwJVKNJoTNbQBPPan+rNW9zPy
         ivMO8CGa/Er5PujhbiOIaGxX7Ca/9k4wiKa842R95216YomcE+zD7zhTnbuNTIx9NR
         wp9+rDvWrP0hCzQXtj79gyQxG5YaMLMcZArc7YKx+/huedRE2/+VxexzwmqLgamFZF
         YYSRH7cebh//A==
Date:   Tue, 12 Jan 2021 08:09:11 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v6 1/4] doc/zh_CN: add mips index.rst translation
Message-ID: <20210112080911.253e7e41@lwn.net>
In-Reply-To: <20210112115259.217944-1-siyanteng@loongson.cn>
References: <20210112115259.217944-1-siyanteng@loongson.cn>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 12 Jan 2021 19:52:56 +0800
Yanteng Si <siyanteng@loongson.cn> wrote:

> This patch translates Documentation/mips/index.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>
> ---
>  .../translations/zh_CN/mips/index.rst         | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/mips/index.rst

OK, we're almost there.

As Jiaxun Yang noted, this should have been v7 and it is good to include a
cover letter with a patch series.

One other thing: this adds the translated index.rst - referring to the
other files - before those files exist.  That will break the docs build
between this patch and the end of the series.  Not a huge deal, since I
doubt many people spend much time bisecting docs builds, but it is still
better to have everything building properly after each patch.

None of these are big enough to require another round, so I have applied
this series, thanks.

jon
