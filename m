Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EB4C432BE
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 12:59:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62A6960F25
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 12:59:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237434AbhHDM7n (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 Aug 2021 08:59:43 -0400
Received: from zeniv-ca.linux.org.uk ([142.44.231.140]:45802 "EHLO
        zeniv-ca.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238188AbhHDM7k (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Aug 2021 08:59:40 -0400
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mBGSS-006xG1-Tr; Wed, 04 Aug 2021 12:57:17 +0000
Date:   Wed, 4 Aug 2021 12:57:16 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     David Disseldorp <ddiss@suse.de>
Cc:     linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH RESEND 1/3] initramfs: move unnecessary memcmp from hot
 path
Message-ID: <YQqOrCw29ff7zJHb@zeniv-ca.linux.org.uk>
References: <20210721115153.28620-1-ddiss@suse.de>
 <20210804113129.60848be6@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210804113129.60848be6@suse.de>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 04, 2021 at 11:31:29AM +0200, David Disseldorp wrote:
> Ping, any feedback on this change?
> 
> I think it's a no brainer, but for kicks I ran a few unrealistic micro
> benchmarks on my laptop. Extraction time for a cpio image with 1M+
> directories improved by 5ms (pre: 14.614s, post: 14.609s), when averaged
> across 20 runs of:
>   qemu-system-x86_64 -machine accel=kvm -smp cpus=1 -m 10240 \
>         -kernel ~/linux/arch/x86/boot/bzImage \
>         -initrd ./initrds/gen_cpio.out \
>         -append "initramfs_async=0 console=ttyS0 panic=0" -nographic \
>         | awk '/Trying to unpack rootfs/ {start_ts = $2};
>                /Freeing initrd memory/ {end_ts = $2}
>                END {printf "%f\n", end_ts - start_ts}'

What was the dispersion for those runs?
