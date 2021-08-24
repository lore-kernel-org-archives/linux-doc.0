Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D51FDC4338F
	for <linux-doc@archiver.kernel.org>; Tue, 24 Aug 2021 19:21:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC2CB61151
	for <linux-doc@archiver.kernel.org>; Tue, 24 Aug 2021 19:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232117AbhHXTWC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 Aug 2021 15:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234572AbhHXTWC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Aug 2021 15:22:02 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C81CEC061757
        for <linux-doc@vger.kernel.org>; Tue, 24 Aug 2021 12:21:17 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id AAA865EB3;
        Tue, 24 Aug 2021 19:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AAA865EB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1629832876; bh=13SPcx0DKum5rQ/JK9had64BUZwv3jyB2W+GvfkAMwU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Zue6MZeaAMUoN8dzFzMjeC0RGygArJEhQKKTBTo42d0IIWYqmuC02SSvUwbdqZqx+
         rvyQGMTyiwclCeSoPqLTJY6wm7+aZHYvwAueWOIEg06coKdz/cLggzuZvS6/Ce5Y0w
         RKMYuypTgiKOdkDIAAlI4padgiIqX0ELBUXyAp1NdAZI/Mv/6AH3B+dvE9nr3bvwt9
         R5/Yhx2+KE08t0+bJmWLxyB0ARtioylcyao1WSU+GKS62d80oqoaC8H6zK4FhSdbrn
         2jxrNsEABG7OVi8YMsYh0aWTJvovhNfJfjYoFR2X+858lCo3rebB+sG105gpkLEauN
         JCtsXTb4ktZeQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Alexander Aring <aahringo@redhat.com>
Cc:     linux-doc@vger.kernel.org, willy@infradead.org, aahringo@redhat.com
Subject: Re: [PATCHv2] Documentation: locking: fix references
In-Reply-To: <20210823183143.1691344-1-aahringo@redhat.com>
References: <20210823183143.1691344-1-aahringo@redhat.com>
Date:   Tue, 24 Aug 2021 13:21:16 -0600
Message-ID: <87lf4qmyxf.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Alexander Aring <aahringo@redhat.com> writes:

> This patch fixes file references from txt to rst file ending in
> ww-mutex-design.rst and futex-requeue-pi.rst. While on it fix a spelling
> issue "desgin" to "design" reported by Matthew Wilcox.
>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>

Applied, thanks.

jon
