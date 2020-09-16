Return-Path: <SRS0=XgFW=CZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A03C43461
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 08:37:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07A8020872
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 08:37:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="I28rbjWw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbgIPIhK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Sep 2020 04:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgIPIhI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Sep 2020 04:37:08 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 752F9C06174A;
        Wed, 16 Sep 2020 01:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=mxxVoPAow/jDG54ecDzqGJb236Vv64phWowbqqoXZkk=; b=I28rbjWwEwIzJNZC1ubbx6Wr2Q
        K8TZVFXovRpbA3fV+NDfKBwnp4ZGMg54Q0ettaSvqJUt6iApkPM21Yq4AX4D1mZ1+snHKaCEK1Y6p
        qH888a+NPuj0VItwfLsStpg2iSWTerIXOQ17aaU/pslQxMRZ6+j+9LYJcYYECvU1/JI9oXyzl/Ukd
        BZfbeni4LMgkXtpw791xc1nyKGvpbqDdqykmUQkQualG6jxRtIpBjqkRzCiAVZX4L7/Abte44dL7d
        S4+taRlQeftuL05Q9QUfZkTaDzdK6YjtChiEC24bCS5FGvOxcOOlUYsxSaihnZqSiSASiUJRfo894
        qgw3qlXg==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kISw3-0007Zp-2S; Wed, 16 Sep 2020 08:37:03 +0000
Date:   Wed, 16 Sep 2020 09:37:03 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Phil Chang <phil.chang@mediatek.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        Alix Wu <alix.wu@mediatek.com>, linux-doc@vger.kernel.org,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        YJ Chiang <yj.chiang@mediatek.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, Will Deacon <will@kernel.org>,
        Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH] [PATCH] ARM64: Setup DMA32 zone size by bootargs
Message-ID: <20200916083703.GA26411@infradead.org>
References: <20200915150855.24825-1-phil.chang@mediatek.com>
 <20200916072206.27499-1-phil.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916072206.27499-1-phil.chang@mediatek.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 16, 2020 at 03:22:06PM +0800, Phil Chang wrote:
> this patch allowing the DMA32 zone be configurable in ARM64.

Hell no.  The point of the DMA32 zone is that it is exactly the first
4GiG, and not some random size someone decided without explaining why.
