Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 20FB47D57F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 27 Sep 2018 14:23:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727335AbeI0UmH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 27 Sep 2018 16:42:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52876 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727289AbeI0UmH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 27 Sep 2018 16:42:07 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 5C7D530015C7;
        Thu, 27 Sep 2018 14:23:37 +0000 (UTC)
Received: from localhost (unknown [10.18.25.149])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 068C9600C7;
        Thu, 27 Sep 2018 14:23:30 +0000 (UTC)
Date:   Thu, 27 Sep 2018 10:23:29 -0400
From:   Mike Snitzer <snitzer@redhat.com>
To:     Richard Weinberger <richard.weinberger@gmail.com>
Cc:     helen.koike@collabora.com,
        device-mapper development <dm-devel@redhat.com>,
        agk@redhat.com, LKML <linux-kernel@vger.kernel.org>,
        enric.balletbo@collabora.com, Will Drewry <wad@chromium.org>,
        linux-doc@vger.kernel.org, linux-lvm@redhat.com,
        kernel@collabora.com
Subject: Re: [PATCH 0/2] boot to a mapped device
Message-ID: <20180927142328.GA4074@redhat.com>
References: <cover.1537936397.git.helen.koike@collabora.com>
 <CAFLxGvzCDOTR4stPmp1TTLkQ39x3e8MQuL=AR754abKc5skhpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLxGvzCDOTR4stPmp1TTLkQ39x3e8MQuL=AR754abKc5skhpA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Thu, 27 Sep 2018 14:23:37 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 26 2018 at  3:16am -0400,
Richard Weinberger <richard.weinberger@gmail.com> wrote:

> Helen,
> 
> On Wed, Sep 26, 2018 at 7:01 AM Helen Koike <helen.koike@collabora.com> wrote:
> >
> > This series is reviving an old patchwork.
> > Booting from a mapped device requires an initramfs. This series is
> > allows for device-mapper targets to be configured at boot time for
> > use early in the boot process (as the root device or otherwise).
> 
> What is the reason for this patch series?
> Setting up non-trivial root filesystems/storage always requires an
> initramfs, there is nothing
> wrong about this.

Exactly.  If phones or whatever would benefit from this patchset then
say as much.

I will not accept this patchset at this time.

> > Example, the following could be added in the boot parameters.
> > dm="lroot,,,rw, 0 4096 linear 98:16 0, 4096 4096 linear 98:32 0" root=/dev/dm-0
> 
> Hmmm, the new dm= parameter is anything but easy to get right.

No, it isn't.. exposes way too much potential for users hanging
themselves.
