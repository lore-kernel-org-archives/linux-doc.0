Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6C74B7D90D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 11 Oct 2019 16:23:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbfJKQXx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 11 Oct 2019 12:23:53 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:35015 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbfJKQXw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Oct 2019 12:23:52 -0400
Received: by mail-io1-f66.google.com with SMTP id q10so22828650iop.2
        for <linux-doc@vger.kernel.org>; Fri, 11 Oct 2019 09:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AYuysNNB34vzaF6MUbQvV/mVL9SXPUEqaT1Ho11Jg/o=;
        b=bXLzmGiSuLTMLfidfkYS1vUnwNdxVd+km70RJnz+dqfAgjauBU0zjA5JdvIEMyewI7
         wqlyR1rTaqbMzOsgbo6n0JE7XkxMcewbuecc6rc508ooaF55A1YWHILeasK8Kaa20ifS
         sT0Hu+s1h7+SCghDzdc7Kob+ust+/WzCJ8Ylk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AYuysNNB34vzaF6MUbQvV/mVL9SXPUEqaT1Ho11Jg/o=;
        b=fp3Jhgxb2yPK85GXpOQsNzs73mNms3lod9v6AfZLX4spmaBUTlQSSPhBb4QLgSkuLw
         /Txobmq+Px6SP7MvlebpgEa6rbZRDVMloR+dZenW/CWsWd1ysbtr8uny+kEStEwKUKzQ
         axhrIONi024PgwB8+3f1ZL21GrAlUYsx0HNxrC3P6OsOzTFMGXVjQUWCMb2f3zhst+ca
         FnaywpMwRNCooh2T2J0PqVyc1jUF4BwCoZJOcGa2+hg855HB6MtPUoT9gzg7jF86iTJM
         MhLBOF0HDWLzVGRPFI6EuhNCkb3mChBZoOejEkJAPJj4dUU0hFlOJvffeQUNfthnfKi1
         yz/g==
X-Gm-Message-State: APjAAAUP+Nrip7pW5FmhjPfTO+Ify2eqQS9Q8OY0y4OR4WIIFusG6mQS
        O2lTeqUcj8ViwFAGal5NelrHuWhNFNrdBllZLQ75ow==
X-Google-Smtp-Source: APXvYqwfcGD54cIT9+Q2+eIt3no1gPcfadM8IUYxCwOoMfEbn2W16jOyYXGVfRaoYHemabxkQdGpwocdLQxC6tsx0l8=
X-Received: by 2002:a6b:8f8d:: with SMTP id r135mr18457775iod.263.1570811031794;
 Fri, 11 Oct 2019 09:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.99999.352.1910102033050.30236@trent.utfs.org> <20191011100018.0e9fff37@lwn.net>
In-Reply-To: <20191011100018.0e9fff37@lwn.net>
From:   Micah Morton <mortonm@chromium.org>
Date:   Fri, 11 Oct 2019 09:23:40 -0700
Message-ID: <CAJ-EccOz+DeC=y1ToBhq2F-sos0g+_6iWK8vjXgxuENGsn7Few@mail.gmail.com>
Subject: Re: [TYPO] SafeSetID.rst: Remove spurious '???' characters
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Christian Kujau <lists@nerdbynature.de>, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Ah, thanks for this. We had this fixed in
http://kernsec.org/pipermail/linux-security-module-archive/2019-May/013525.html,
but looks like it got forgotten somehow.

On Fri, Oct 11, 2019 at 9:00 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Thu, 10 Oct 2019 20:36:16 -0700 (PDT)
> Christian Kujau <lists@nerdbynature.de> wrote:
>
> > While reading SafeSetID.rst I stumbled across those things. This patch
> > removes these spurious '???' characters.
> >
> > Signed-off-by: Christian Kujau <lists@nerdbynature.de>
>
> I've applied this, thanks.  I did take the liberty of rewriting the
> changelog to adhere to normal standards:
>
> Author: Christian Kujau <lists@nerdbynature.de>
> Date:   Thu Oct 10 20:36:16 2019 -0700
>
>     docs: SafeSetID.rst: Remove spurious '???' characters
>
>     It appears that some smart quotes were changed to "???" by even smarter
>     software; change them to the dumb but legible variety.
>
>     Signed-off-by: Christian Kujau <lists@nerdbynature.de>
>     Signed-off-by: Jonathan Corbet <corbet@lwn.net>
>
> Thanks,
>
> jon
