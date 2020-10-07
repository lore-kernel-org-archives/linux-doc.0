Return-Path: <SRS0=+dB3=DO=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20698C4363C
	for <linux-doc@archiver.kernel.org>; Wed,  7 Oct 2020 11:56:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C15DF20789
	for <linux-doc@archiver.kernel.org>; Wed,  7 Oct 2020 11:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602071793;
	bh=80L2fgcL216D9D4sxx++q20VDrx0nqDDHD+L8nmS20g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=LmwTjc0Vz9vOF9Qr7CoHe9nqdP5slhdzxVYunMBFE2jlxNc4MaSwRmoFLf7our7sE
	 CHCUXwCGr4hC7xQHlvfrhwSZR7hVd6Cu5L7MeeSpVj0Q6SaJKm2IEm9q1hn3ZbtJNl
	 aVVgNMI/mVX+1OXFuhRRNhx3xnzyt13W3nyHcjck=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbgJGL4d (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Oct 2020 07:56:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:35972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726219AbgJGL4d (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Oct 2020 07:56:33 -0400
Received: from coco.lan (ip5f5ad5a2.dynamic.kabel-deutschland.de [95.90.213.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6A42420782;
        Wed,  7 Oct 2020 11:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602071792;
        bh=80L2fgcL216D9D4sxx++q20VDrx0nqDDHD+L8nmS20g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hJ+tVMVYsM0GXEj7CR4meUbCqdbRRM1XBBR8WAFvVJe39HBLVzsBooByb7Lto98b0
         VtM8LReC2tZ27K9r/y2oN5TWcnaOIK4vVgFqVsJoS4qaqcJC1Rne4YDmDbY5fA11DL
         UQJwGxkFoXahP4NesrWBMNiupPZsFE9TZ+2vXYhw=
Date:   Wed, 7 Oct 2020 13:56:27 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2] script: add a script for checking doc problems with
 external functions
Message-ID: <20201007135627.176d64e4@coco.lan>
In-Reply-To: <aac55ad312d17bb12f905b544a4e485ad507735d.1602070137.git.mchehab+huawei@kernel.org>
References: <aac55ad312d17bb12f905b544a4e485ad507735d.1602070137.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Wed,  7 Oct 2020 13:29:04 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> While not all EXPORT_SYMBOL*() symbols should be documented,
> it seems useful to have a tool which would help to check what
> symbols aren't documented.
> 
> This is a first step on this direction. The tool has some
> limitations. Yet, it could be useful for maintainers to check
> about missing documents on their subsystems.
> 
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Please ignore this one. Just found some bugs. I'll send a v3
after fixing them.

Thanks,
Mauro
