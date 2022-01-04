Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FDBC433EF
	for <linux-doc@archiver.kernel.org>; Tue,  4 Jan 2022 07:56:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233746AbiADH47 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 Jan 2022 02:56:59 -0500
Received: from verein.lst.de ([213.95.11.211]:48999 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233748AbiADH47 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 4 Jan 2022 02:56:59 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id AF6A968AFE; Tue,  4 Jan 2022 08:56:55 +0100 (CET)
Date:   Tue, 4 Jan 2022 08:56:55 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab@kernel.org
Subject: Re: make pdfdocs fails on Debian stable
Message-ID: <20220104075655.GA17315@lst.de>
References: <20220104064708.GA15446@lst.de> <8f21b702-abc2-c9aa-7593-9aff17e61ed1@gmail.com> <20220104073625.GA16910@lst.de> <df9183cc-aecb-6b8d-0580-92c2a678d69f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df9183cc-aecb-6b8d-0580-92c2a678d69f@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 04, 2022 at 04:53:15PM +0900, Akira Yokosawa wrote:
> Hmm, I can't reproduce this on docs-next.
> On which tree are you building RCU.pdf?

Current linux-next.  But I've also seen it with mainline from a few days
ago.
