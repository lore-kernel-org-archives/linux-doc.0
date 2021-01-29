Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B354EC433E0
	for <linux-doc@archiver.kernel.org>; Fri, 29 Jan 2021 05:13:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A02164E02
	for <linux-doc@archiver.kernel.org>; Fri, 29 Jan 2021 05:13:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbhA2FM7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Jan 2021 00:12:59 -0500
Received: from verein.lst.de ([213.95.11.211]:59979 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231907AbhA2FMz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 29 Jan 2021 00:12:55 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 4F4AB68AFE; Fri, 29 Jan 2021 06:12:12 +0100 (CET)
Date:   Fri, 29 Jan 2021 06:12:12 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] block: remove typo in kernel-doc of set_disk_ro()
Message-ID: <20210129051212.GB2053@lst.de>
References: <20210129045505.22743-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210129045505.22743-1-lukas.bulwahn@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
