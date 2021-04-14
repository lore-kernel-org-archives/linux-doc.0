Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9662DC433ED
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 22:36:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70DD561019
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 22:36:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231978AbhDNWg5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Apr 2021 18:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233987AbhDNWgz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Apr 2021 18:36:55 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA21C061574
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 15:36:28 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id r128so8853283lff.4
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 15:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s+VGRBuPdmKutKxIYYlr7lTmNrQCLCweQw9SWmlzyUo=;
        b=N+uEViMICnndvL0isdw49RiQ0qEN5p8Dv4opi+pSvIFgeYBfXbb7yPNqvgdpjmHJPE
         3B1g0ufMGZ/Fro7POD4HcoJ5csMnob/rnMCHoH0j9RtLtkAV1Z4a8riYA8GnNcV1O2dT
         jL/0dwOwHy1WCk9GxlYEUpglJyQNV/q9boJTKDSiSVftls6y8d1e7RJKsX+tleJiiJo4
         tGMZzAPZnMiXQ5fbq7FLdWS7LTsdL2OqOGcEFLNeR4kXmxBCBhzyt9n5P7P42dFIZc7a
         pYTyoPc/48JTDs+u0Y77aOTEkIdXaP8oQQziJe0qeRU4WHsygOyJ/BJ1OS5TlxYdkZgs
         WTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s+VGRBuPdmKutKxIYYlr7lTmNrQCLCweQw9SWmlzyUo=;
        b=qQhepDWPNAJyXuT5yB/i+KT4C4PQWS+aKKA4txjvjao4z1Dgu8tAyGpKAb4xBNQk8L
         bwtg/re0AFeV6EWDWoL+xO1yK0Riaq1bpal8L9BoguPD7zHf3fyHJzK3k3tFT6tFVzMi
         b6FfhpRoT89Kv+M8lGYsDQ0iaD5StJVF/wp47aJh7zOOb7oa85CrhqqJEBcApUdDkdba
         GG7U76xS3YzwIFLblkRN8QToxbH3CywimDTxN1tJLczFR0lGrr3FxXPpYi13XMi01Xhr
         LDWvmilf1MiWsAnDVRktwUV/90DlQR9C3/aJeHoik61Hv7MV5u/dcl63uQ+m60OmRV47
         a6+g==
X-Gm-Message-State: AOAM531XrtFYOqXGeSCW3uKhtB3v2pZurBzLvRpx5LL1DNuQg5Bxv90h
        jf2C6QGpn/n+/mblavuwriV8IG8Na8Q0P1Rw/OfJYg==
X-Google-Smtp-Source: ABdhPJwWtbuJsvcv11qI8BqaFhOcOpRWm/UUOom7nk9emsiunf9lpKoCxjINZOypiABigrAkPa04FX0s9f4ScB2p+RU=
X-Received: by 2002:a05:6512:94d:: with SMTP id u13mr270494lft.368.1618439787310;
 Wed, 14 Apr 2021 15:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-12-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-12-ojeda@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 14 Apr 2021 15:36:15 -0700
Message-ID: <CAKwvOdkn9e59wizhbAFLGbCKn3JbsVxMHOLds6V7HE7C9Yoaig@mail.gmail.com>
Subject: Re: [PATCH 11/13] MAINTAINERS: Rust
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 14, 2021 at 11:50 AM <ojeda@kernel.org> wrote:
>
> From: Miguel Ojeda <ojeda@kernel.org>
>
> Miguel, Alex and Wedson will be maintaining the Rust support.
>
> Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
> Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  MAINTAINERS | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9e876927c60d..de32aaa5cabd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15547,6 +15547,20 @@ L:     linux-rdma@vger.kernel.org
...
> +F:     rust/
> +F:     samples/rust/
> +F:     Documentation/rust/

Probably some other files, too? Like the target.json files under
arch/{arch}/rust/ ?

-- 
Thanks,
~Nick Desaulniers
