Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0BEC433DB
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 23:54:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B687F64FB0
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 23:54:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbhBDXyX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Feb 2021 18:54:23 -0500
Received: from ms.lwn.net ([45.79.88.28]:34804 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231239AbhBDXyW (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 4 Feb 2021 18:54:22 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C8E0B143F;
        Thu,  4 Feb 2021 23:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C8E0B143F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1612482817; bh=nMr8D304Ka27WicFpV/PWO4UaSqAubRw3wZFBR2f90E=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=iYXeC4KQZHLFBxYE2BTCKRJzzy9gg1jV/R57n6IsvoRxm5usiOR90XlqEi5Quc6Ae
         1fxZtcheFeWGbNOqKNYNZPaHyCGyAVuI/2MilQo6J5EKe3AqWUKezDxEeyjNBmhhDl
         M1W+Mm16sQIlfBYJzy1AnjfV8pcVvYBAjjowWVQvIpGTwaW4XVGE4BCksfj1hmeXDN
         Sog/G5kL84rFplKquTr77zbb/E4k6Bju8/fms/7ln4OBXzpi/Vhhc6cM4AVteeWzhA
         2IC/70wSVo8725kd7JOW7l3vRWqsnS06yujufCqh09ofRcFDpgxRLjwkIUnA574GJU
         d3NjxdcVidtEg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>,
        =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E?= =?utf-8?Q?_A=2E_Prado?= 
        <nfraprado@protonmail.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Andrew Klychkov <andrew.a.klychkov@gmail.com>,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
Subject: Re: [PATCH 0/2] docs: Add support for relative paths in automarkup
In-Reply-To: <10b0104e-7d89-fcad-a27d-6d1463bf325c@infradead.org>
References: <20210128010028.58541-1-nfraprado@protonmail.com>
 <87o8gzxvjl.fsf@meer.lwn.net>
 <10b0104e-7d89-fcad-a27d-6d1463bf325c@infradead.org>
Date:   Thu, 04 Feb 2021 16:53:37 -0700
Message-ID: <87im77xuda.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> writes:

> I just sent a patch for file name changes in
> Documentation/input/ff.rst
> (https://lore.kernel.org/linux-input/20210203050842.24190-1-rdunlap@infradead.org/T/#u).
>
> I sent it to the INPUT maintainer because I thought that he would
> want to review the changes.
>
> I could resend it to the DOCS maintainer.  :)

Things are probably fine as they are, but feel free to send it my way if
you don't get a response over there.

Thanks,

jon
