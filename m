Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3EDC433F5
	for <linux-doc@archiver.kernel.org>; Mon,  4 Oct 2021 16:38:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC7DA61350
	for <linux-doc@archiver.kernel.org>; Mon,  4 Oct 2021 16:38:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234903AbhJDQkn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 4 Oct 2021 12:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237178AbhJDQkn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Oct 2021 12:40:43 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5656C061745
        for <linux-doc@vger.kernel.org>; Mon,  4 Oct 2021 09:38:53 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id j5so69130964lfg.8
        for <linux-doc@vger.kernel.org>; Mon, 04 Oct 2021 09:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4nD/CqNzR9E4HGpSddngZ7NQXINMID609Z0nuYAzxVQ=;
        b=EhHEBOBGv3jAdd0eEwTEevENTAb2AhyLvwesYd92iZLWqj7mTTdpBBgs4KL47AQ0oH
         ZwglecIE1krknfq1btMK26sMK70sIco+nuL8EtgDkDN9ePohB2tzfYyBZi//yhabNZMZ
         QP2aeujeABcZR46+NAT9doCWdbaRbYrX5zVHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4nD/CqNzR9E4HGpSddngZ7NQXINMID609Z0nuYAzxVQ=;
        b=WAFsqsZEWqr9Jzkr+vezyZtICptZa8X4PQcX5bOajL3qT2Zf5vbnpzS9YvhaYHaLu9
         bej8dQQ+BzlFULHYUh+VugGzk3Ww8A0LVF8uXYa0+Q6oQzVjYazF3RhhpXRmHexp8wTn
         oZkpYL5viahLHM5mzEOPI1zhdrvEzA9caQVZIBkRSDVqjhpPojWsBtQ9ZQP5M2ZVyx/Y
         wjOtOqHpNEn/gjoaiV5eco5Vo+44515s+jxJ3hDWuMJFYn+2l2NkPZTDkei3bywjSZ6a
         c1IsgkzSrq/G8dwy9ToE2pC52VykhlgtAzI2q0oidp0EEZY7IPnv1o/wBYxPVd6/Ktos
         I1ZQ==
X-Gm-Message-State: AOAM531EjFNoT5Su2ZfyBenX54CbdFTxtMT1vDSfqi8DJaWrhSy10W4g
        +r/yts618G9FEtz/vkCE96t+v8P8J9hKXdJU
X-Google-Smtp-Source: ABdhPJw13rImWIfUPhC+ET+6WLUPOw1+fpZqXymyUhLxTKzTZPGc1f140EQZzBKRLYZAL5/TpBfC3g==
X-Received: by 2002:a05:6512:118a:: with SMTP id g10mr15290609lfr.206.1633365530110;
        Mon, 04 Oct 2021 09:38:50 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 23sm1670095ljq.83.2021.10.04.09.38.49
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 09:38:49 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id i24so24865115lfj.13
        for <linux-doc@vger.kernel.org>; Mon, 04 Oct 2021 09:38:49 -0700 (PDT)
X-Received: by 2002:a2e:1510:: with SMTP id s16mr16602800ljd.56.1633365528411;
 Mon, 04 Oct 2021 09:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <270324.1633342386@warthog.procyon.org.uk>
In-Reply-To: <270324.1633342386@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 4 Oct 2021 09:38:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj-ANpwDnAJ0HAdbwyti7Z6aBBJT6JEbkta9VjaF30Tcw@mail.gmail.com>
Message-ID: <CAHk-=wj-ANpwDnAJ0HAdbwyti7Z6aBBJT6JEbkta9VjaF30Tcw@mail.gmail.com>
Subject: Re: Do you want warning quashing patches at this point in the cycle?
To:     David Howells <dhowells@redhat.com>
Cc:     Dominique Martinet <asmadeus@codewreck.org>,
        Jeff Layton <jlayton@kernel.org>,
        Marc Dionne <marc.dionne@auristor.com>,
        Trond Myklebust <trond.myklebust@hammerspace.com>,
        Anna Schumaker <anna.schumaker@netapp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        v9fs-developer@lists.sourceforge.net,
        linux-afs@lists.infradead.org,
        "open list:NFS, SUNRPC, AND..." <linux-nfs@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 4, 2021 at 3:13 AM David Howells <dhowells@redhat.com> wrote:
>
> Do you want patches that quash warnings from W=1

For W=1? No.

The kerneldoc ones might be ok, but actual code fixes have
historically been problematic because W=1 sometimes warns for
perfectly good code (and then people "fix" it to not warn, and
introduce actual bugs).

           Linus
