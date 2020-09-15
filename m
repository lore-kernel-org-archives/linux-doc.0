Return-Path: <SRS0=ug/q=CY=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D58D0C43461
	for <linux-doc@archiver.kernel.org>; Tue, 15 Sep 2020 17:49:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 829CD20936
	for <linux-doc@archiver.kernel.org>; Tue, 15 Sep 2020 17:49:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mFt7JwE/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728011AbgIORtI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Sep 2020 13:49:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727964AbgIORsy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Sep 2020 13:48:54 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 856CBC06178A;
        Tue, 15 Sep 2020 10:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Message-ID:From:CC:To:Subject:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
        Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=/Rg6cY/e/tZ4JpFULugLMdJVoy+DCc5wy/pCoVMw9yA=; b=mFt7JwE/fwN9x1ow+LoVe2Q0KA
        iAV2NGaXBd/2KCBLsZwnRrJ4CDY+pI067LFcEQvFJGNVUk+tbr8kmXU47resJdRqmBdUUyPwXBFXR
        DUsxcHUpAd5+UbTrcKRqnJs52YSeYdB+YBi0j8bWVuj95SbsCSUeZr1B6S/AfX7cxIJbXbtX8KFeI
        9aRpEPnZbfL0J0hgf8LhxGmgOwtxfPFkRiB8Y7OaY3NI4MsdBmA3NliRQAuIDoUbILcP6mOcdJg3V
        TXSC1Z2oo9L3q6hU1cuf9Jrg0sdegEn48EdKayH3s52r+xQP7THGDbdeSQaHZ4rGImv66nLxrrxKR
        +uxCPERQ==;
Received: from [2001:8b0:10b:1:8038:2d21:920d:9fa6]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kIF4C-0002OC-Py; Tue, 15 Sep 2020 17:48:33 +0000
Date:   Tue, 15 Sep 2020 18:48:31 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <20200915150855.24825-1-phil.chang@mediatek.com>
References: <20200915150855.24825-1-phil.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] [PATCH] ARM64: Setup DMA32 zone size by bootargs
To:     linux-mediatek@lists.infradead.org,
        Phil Chang <phil.chang@mediatek.com>,
        linux-arm-kernel@lists.infradead.org
CC:     Mark Rutland <mark.rutland@arm.com>,
        Alix Wu <alix.wu@mediatek.com>, linux-doc@vger.kernel.org,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        YJ Chiang <yj.chiang@mediatek.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        Will Deacon <will@kernel.org>, Mike Rapoport <rppt@kernel.org>
From:   David Woodhouse <dwmw2@infradead.org>
Message-ID: <7AD19C4D-CB80-48C5-8B12-62D52BFDBE63@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 15 September 2020 16:08:55 BST, Phil Chang <phil=2Echang@mediatek=2Ecom=
> wrote:
>Allowing the DMA32 zone be configurable in ARM64 but at most 4Gb=2E

I don't think 4,000,000 bits is a particularly sensible limit=2E

Perhaps you meant bytes, and perhaps you meant 4*1024*1024? That would be =
"4 GiB"=2E

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
