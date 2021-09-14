Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F65C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 21:16:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 412A060FC1
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 21:16:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235085AbhINVRv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Sep 2021 17:17:51 -0400
Received: from ms.lwn.net ([45.79.88.28]:41628 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234971AbhINVR3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 14 Sep 2021 17:17:29 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BAA202C1;
        Tue, 14 Sep 2021 21:16:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BAA202C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1631654160; bh=a4m+4kMVVStlQpILsxYOg56lxqhaYiXtRb4lYmS46AM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=SCcTBBiHBe6ERIUulMDT2Wc1s3L/Wqzxg/2gI6BWAoDm53EHQvFzNPwMQc1HCUkyh
         ns3+crQXrMvnk7qXUwI5JYEfpX4YCAhSJSUuKHkT4eovQE06b7BIV/oj1XstDYubTj
         kV5O0c2qlsVcfnRM/Qm980CMQquA+THk0CXlX/OZjKgFSOMLRV09oodYmmwkRWwTrW
         aKXYIvVcTuLjo/YxKAzinKd8kJQJLFuDjVf2ZoYw794bEH8ln2hqeHuidL2kOXWy6R
         FP00qWtWJcp67gOnqtWO6utSO5kMZmSfQq6rKX/M7e0RT2Y34m49fLLfRSBCbRH/0/
         fU6RJUGtE97mg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Akira Yokosawa <akiyks@gmail.com>, Hu Haowen <src.res@email.cn>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] docs: zh_TW/index: Move arm64/index to arch-specific
 section
In-Reply-To: <53d86385-b4db-5d02-be6b-795900166f17@gmail.com>
References: <53d86385-b4db-5d02-be6b-795900166f17@gmail.com>
Date:   Tue, 14 Sep 2021 15:15:59 -0600
Message-ID: <875yv2dfjk.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Akira Yokosawa <akiyks@gmail.com> writes:

> arm64/index is architecture specific.
> Move it to the section "=E7=89=B9=E5=AE=9A=E9=AB=94=E7=B3=BB=E7=B5=90=E6=
=A7=8B=E6=96=87=E6=AA=94" or "Architecture-specific
> documentation".
>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Fixes: e5cb9494fe79 ("docs/zh_TW: add translations for zh_TW/arm64")
> Cc: Hu Haowen <src.res@email.cn>
> ---
> Hi,
>
> zh_CN/index.rst has arm64/index under the section "=E7=89=B9=E5=AE=9A=E4=
=BD=93=E7=B3=BB=E7=BB=93=E6=9E=84=E6=96=87=E6=A1=A3".
> zh_TW should be consistent with it.
>
>         Thanks, Akira
> --
>  Documentation/translations/zh_TW/index.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Applied, thanks.

jon
