Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C9AC433F5
	for <linux-doc@archiver.kernel.org>; Wed, 22 Sep 2021 23:35:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12F3C611C6
	for <linux-doc@archiver.kernel.org>; Wed, 22 Sep 2021 23:35:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238501AbhIVXh2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Sep 2021 19:37:28 -0400
Received: from zeniv-ca.linux.org.uk ([142.44.231.140]:56190 "EHLO
        zeniv-ca.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238464AbhIVXh0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Sep 2021 19:37:26 -0400
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mTBmI-006Y8s-Sm; Wed, 22 Sep 2021 23:35:50 +0000
Date:   Wed, 22 Sep 2021 23:35:50 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     David Disseldorp <ddiss@suse.de>
Cc:     linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        willy@infradead.org
Subject: Re: [PATCH 1/5] initramfs: move unnecessary memcmp from hot path
Message-ID: <YUu91kH8kOcVHxyb@zeniv-ca.linux.org.uk>
References: <20210922115222.8987-1-ddiss@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922115222.8987-1-ddiss@suse.de>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 22, 2021 at 01:52:18PM +0200, David Disseldorp wrote:
> do_header() is called for each cpio entry and first checks for "newc"
> magic before parsing further. The magic check includes a special case
> error message if POSIX.1 ASCII (cpio -H odc) magic is detected. This
> special case POSIX.1 check needn't be done in the hot path, so move it
> under the non-newc-magic error path.

You keep refering to hot paths; do you have any data to support that
assertion?

How much does that series buy you on average, and what kind of dispersion
do you get before and after it?

I'm not saying I hate the patches themselves, but those references in commit
messages ping my BS detectors every time I see them ;-/
