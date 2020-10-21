Return-Path: <SRS0=tqpN=D4=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977A0C388F9
	for <linux-doc@archiver.kernel.org>; Wed, 21 Oct 2020 12:02:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E78720874
	for <linux-doc@archiver.kernel.org>; Wed, 21 Oct 2020 12:02:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rqYanW08"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411157AbgJUMCk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Oct 2020 08:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2411156AbgJUMCk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Oct 2020 08:02:40 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2851C0613CE;
        Wed, 21 Oct 2020 05:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=NWtB/2rZv3ZLVy+M9+idncF6YWB13ldWYzfvjHxmPSg=; b=rqYanW08u+ySeMuVVxYpFQaO16
        XvtfcqHu7uVtUlPHzy/AXGEdOaZlM6BF1CyehisV6eVBj4vG1f+7Em41TkKqz4uFM0f8OLfFMx5Xl
        BMA6sD0b0UjbWf1XEDToVDrY6I5xSash6Nk/vkG7tmhyNILDY0aqpMeQo9jJ6l3RA0QOz7M1gb4ra
        pXqnTIMKtq6BK1C8iCC9NsgrjpKEThTuSumDqtZ18r+bNaA4HAl9MnlkVY7kGstC1ymeXhLWDXt86
        gvTMBuPA/B8T60kOwAjTr7Q/ELNqljkMbBsM98u1A7Ur28aCsBPCjBdJQ+8PWCPFv0nyT6+54gPEu
        82GLD0jA==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kVCpA-000436-QY; Wed, 21 Oct 2020 12:02:36 +0000
Date:   Wed, 21 Oct 2020 13:02:36 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andreas Gruenbacher <agruenba@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Guoqing Jiang <guoqing.jiang@cloud.ionos.com>,
        Jens Axboe <axboe@kernel.dk>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        William Kucharski <william.kucharski@oracle.com>,
        Yang Shi <yang.shi@linux.alibaba.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/24] mm: pagemap.h: fix two kernel-doc markups
Message-ID: <20201021120236.GL20115@casper.infradead.org>
References: <cover.1602590106.git.mchehab+huawei@kernel.org>
 <54ea6dd0fc37c48aef3fc3ae454c54a80db313dc.1602590106.git.mchehab+huawei@kernel.org>
 <20201013122654.GE20115@casper.infradead.org>
 <20201021115557.24c83c35@coco.lan>
 <20201021112819.GJ20115@casper.infradead.org>
 <20201021135903.719e1f30@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201021135903.719e1f30@coco.lan>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 21, 2020 at 01:59:03PM +0200, Mauro Carvalho Chehab wrote:
> [PATCH] mm: pagemap.h: fix two kernel-doc markups
> 
> Changeset a8cf7f272b5a ("mm: add find_lock_head") renamed the
> index parameter, but forgot to update the kernel-doc markups
> accordingly.
> 
> Fixes: a8cf7f272b5a ("mm: add find_lock_head")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
