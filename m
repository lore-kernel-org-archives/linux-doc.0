Return-Path: <SRS0=xqSd=4C=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A43C3B1BF
	for <linux-doc@archiver.kernel.org>; Fri, 14 Feb 2020 21:47:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D6D832168B
	for <linux-doc@archiver.kernel.org>; Fri, 14 Feb 2020 21:47:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UghfVcGD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730470AbgBNVrv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Feb 2020 16:47:51 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39488 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730413AbgBNVrv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Feb 2020 16:47:51 -0500
Received: by mail-lj1-f193.google.com with SMTP id o15so12302741ljg.6
        for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2020 13:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ULvgOcWtqQoiiZTQEcdkHo/hzvR0mDvJVo9JBCmHaro=;
        b=UghfVcGD99QDVJvEji3DwtzpIp/PGb7GJofQVdGg87wpeWgj5k1fmihFbyHJDkzhXm
         S1NEmhmLvIIspUxPsjqWYv+g8q0cgFqkqJsqk6YpKTd6xRAfC/+pRYqVa+LT/zHudhSe
         ezPpARw61nPYCHiuMSRuvAH2pkTlrESq7Y0NpQrB9ACMChfUqXxp93LrOIYT2VYUQCJo
         gmb8qcWUBCD71s/4fRxFDy4T3zhcDp/8yu4ZXGH549/K9U19OlbHknT8fxAAk5duXcIa
         zBQ+s0+fPCvaocHwCtDCGP4wFwcvFTeDl1IPB9yATUIb5hn70+tb0HH0Q6XBRHaUjClO
         2Vvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ULvgOcWtqQoiiZTQEcdkHo/hzvR0mDvJVo9JBCmHaro=;
        b=Zc3Zr3JZG7CaiuU/hgAA/q/GY9ZGle87Kbk/of9YnEnjDbyiBVGNyiAAdcHc15hPI8
         eRXYR9KZf27pbPVxyAXjKqlfxUZFpNYopEQgTQGWZfvDjEOtDvucUjX74ilUEUlSBZWq
         IbwouGuaADtD2zjnJcCQtijoZzdR6AyR1Sluw4ug6Tkqj5UCSle3+DLa0/5ltFsd4a2w
         dwFhKoj9/kJABX4ApIx95JOGUBYdnmEhSXj8n7sJ/armUH1aKBOZ6QG5WYnT/lVYHQxT
         3+hqfSJnhaQv7imDRiaKtpyyJjMLrSAEYy2BRdauZjxBZToyQkZYRgNmi8oQbKMAgfqg
         AdxA==
X-Gm-Message-State: APjAAAXyWPd41dIXEeWpAlkZuHmGrbnmJ9MhUpMS+787E97aj6WMhc0j
        7MwisgcfKVBiC/23A/M4OwBcYQHmo1xDTk6IaW+VsQ==
X-Google-Smtp-Source: APXvYqwOnenDJydesgZENHJdVpOerGyyRYO7zjT1GE3p1T0WHWXpqjZg+ov2CAwduAn/RxPssJiAJvJqDMAmNkptrfI=
X-Received: by 2002:a2e:85cd:: with SMTP id h13mr3415670ljj.191.1581716868386;
 Fri, 14 Feb 2020 13:47:48 -0800 (PST)
MIME-Version: 1.0
References: <20200208013552.241832-1-drosen@google.com> <20200208013552.241832-2-drosen@google.com>
 <20200212033800.GC870@sol.localdomain>
In-Reply-To: <20200212033800.GC870@sol.localdomain>
From:   Daniel Rosenberg <drosen@google.com>
Date:   Fri, 14 Feb 2020 13:47:37 -0800
Message-ID: <CA+PiJmT_8EzyFO283_E62+UC6vtCGOJXKHAFqnH3QM9LA+PHAw@mail.gmail.com>
Subject: Re: [PATCH v7 1/8] unicode: Add utf8_casefold_iter
To:     Eric Biggers <ebiggers@kernel.org>,
        Gabriel Krisman Bertazi <krisman@collabora.com>
Cc:     "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org,
        Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
        linux-f2fs-devel@lists.sourceforge.net,
        linux-fscrypt@vger.kernel.org,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Richard Weinberger <richard@nod.at>,
        linux-mtd@lists.infradead.org,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 11, 2020 at 7:38 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> Indirect function calls are expensive these days for various reasons, including
> Spectre mitigations and CFI.  Are you sure it's okay from a performance
> perspective to make an indirect call for every byte of the pathname?
>
> > +typedef int (*utf8_itr_actor_t)(struct utf8_itr_context *, int byte, int pos);
>
> The byte argument probably should be 'u8', to avoid confusion about whether it's
> a byte or a Unicode codepoint.
>
> - Eric

Gabriel, what do you think here? I could change it to either exposing
the things necessary to do the hashing in libfs, or instead of the
general purpose iterator, just have a hash function inside of unicode
that will compute the hash given a seed value.
-Daniel
