Return-Path: <SRS0=z7gB=ZR=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E3EC432C0
	for <linux-doc@archiver.kernel.org>; Mon, 25 Nov 2019 10:42:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EF1C42075C
	for <linux-doc@archiver.kernel.org>; Mon, 25 Nov 2019 10:42:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="UoGRlg/a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727395AbfKYKmJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Nov 2019 05:42:09 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:43829 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727316AbfKYKmJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Nov 2019 05:42:09 -0500
Received: by mail-io1-f67.google.com with SMTP id p12so8286669iog.10
        for <linux-doc@vger.kernel.org>; Mon, 25 Nov 2019 02:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R+B/nVdafVBM5/dMhmn3bx+mejZS7Z1pG2S9hER1tbY=;
        b=UoGRlg/aCwPzEcnNH5oLQwU1wHejhiY4zlbMgpRVenqBQYvr0oU3s1HuYXUnBOpGaZ
         jSkG26bpnd7Z+2y621l1kUW4x2gy1WCbGVL34x+sDpMld724Yz/fQsNL/MwH4bIUORuH
         SV2LudJzIm7OVSUNO+c8CxfBRDsByThe02Ibo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R+B/nVdafVBM5/dMhmn3bx+mejZS7Z1pG2S9hER1tbY=;
        b=PWseHnQYahfqthN5HAGX1Hb9Iunlf7ixF0MpwXIheaBGvZjl3YrWb54S94JSOfd98R
         jjYdZKcvRLuNAqZEna6zcAdugN7Zz/4zWCMyZAKX2ZAxSJwsDI1OPjyAUCVLAQp5j3ub
         cKRq68RddXDdm2aYcIXvksJw1txt+HiIJps69BEx8ayZCHNfxAZ53R88dlIrMg2KKk7d
         CTTvBfvekCY48Sfhvj91lvKhVYJgRLdur7AnSalMHmSwih1bHv6mpbis1+Ptgq4rCb8D
         Jj4tMP3XCSzuw2TL1A0yI8XfivIl8FTEx49VNYC0xPKzeB6BspaGJvjP2CA2aJaegecc
         GMMA==
X-Gm-Message-State: APjAAAWZ9i9YG81Fd9dekYAWiUFbVuUmgEpX1GTzuf2S5h2Zn/m05r4b
        tJ6QHsMt2fhpImHuo7FQq8/sr7WE+uytm+9ct07rIg==
X-Google-Smtp-Source: APXvYqwCxLkdsT8rBQH9Cd/qrlw5KUr81ZdbOyC/YXzhlOlZ5vfdgNrOJPgX7JYFLYBy6AmC+NrP8lZ13cYy8QnYAh8=
X-Received: by 2002:a5d:91da:: with SMTP id k26mr25050284ior.252.1574678528733;
 Mon, 25 Nov 2019 02:42:08 -0800 (PST)
MIME-Version: 1.0
References: <20191120192655.33709-1-dwlsalmeida@gmail.com>
In-Reply-To: <20191120192655.33709-1-dwlsalmeida@gmail.com>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Mon, 25 Nov 2019 11:41:57 +0100
Message-ID: <CAJfpegsxXJN1Z5fGzcv=+sid6gSzyD=KtA2omF2Xsx8dy00tRw@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: filesystems: convert fuse to RST
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Nov 20, 2019 at 8:34 PM Daniel W. S. Almeida
<dwlsalmeida@gmail.com> wrote:
>
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
>
>
> Converts fuse.txt to reStructuredText format, improving the presentation
> without changing much of the underlying content.

Hmm, most of this document is *not* an admin-guide at all.  The only
sections that really belong in that category are "What is FUSE?" and
"Control filesystem" and maybe some of the definitions as well.   The
mount options for fuse filesystem are not generally usable for
actually performing a mount, most of those are actually internal
details of the filesystem implementation.

So I suggest leaving this file under Documentation/filesystems/ for
now and later work towards splitting out the admin-guide parts into a
separate document.

Thanks,
Miklos
