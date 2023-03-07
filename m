Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBA0C678D4
	for <linux-doc@archiver.kernel.org>; Tue,  7 Mar 2023 12:31:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbjCGMbX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Mar 2023 07:31:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbjCGMbW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Mar 2023 07:31:22 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C80FE769EC
        for <linux-doc@vger.kernel.org>; Tue,  7 Mar 2023 04:31:20 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id g3so11939856wri.6
        for <linux-doc@vger.kernel.org>; Tue, 07 Mar 2023 04:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20210112.gappssmtp.com; s=20210112; t=1678192279;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=BLN4UncZUSgoRCKUIm4eF2t2H/1MDhbeJ976lCdE5GA=;
        b=08E6zZ8ABAZEGeccsGotZ9ZWL0kfvCUtAvAvNJl07mtxkbgz/541DjYIs/InFQKg9+
         fuLPWU89TlX/x6VLupGJ3eUxcBzXKVo+/XXSxP6ipyPYLDXWe3D558CqSmDR29BNa8OG
         Ko3vC/EcuZqQ8zVVXq/UVKNIttyyNg9V+fQ1Yi5n4aj1faPxJogMSe6b629k53PLZfwp
         KqiMqeWEApNyR4t29rMNEUgMCfRydMhiKdKgIi8ZG4Hmtg+NJydam3IcZBvSJT1xYwjN
         gqORAVYSDVDOdqYopXt1Zgr1fmgHuh8tzKRGSYk3mMDjD879comzzEWESjj721C3GFqT
         y9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678192279;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLN4UncZUSgoRCKUIm4eF2t2H/1MDhbeJ976lCdE5GA=;
        b=NXczugU+hazmQGrnL5x2IzUgGuhyPdniKNbcH17xFcnOGD8ub3M5XLL8tHZBzbczMe
         2KiQ7uA40kyA8BxqDH9nluW8dxsGlD+fFfd2VfJPpmvlItR6xrQ3KQrIhStYilbfmt7T
         OyYJxoi7ghgRd+w98CeN8c0PN1meMe0rn79IR5oQftnZogAjiRUSxeIodUJBWDHu7J+w
         1Nawz57shoBHxfpr4Gnr+HUKiHxghcGIL7C4RbUPI6NNxFIY1mhJyIyks4D+kWXP6Tfl
         iElgQcmg4X4bIYtmgrZewMp/wlkSpqLkkOM+3hAEPwXskaoGWZgNQ9/IRs9kIzCdernu
         xW0Q==
X-Gm-Message-State: AO0yUKX/2nyo6XVAVFXONVTVRXZJJkle0YWUf5ixqozaIJOsnKKEBZ6i
        R1RXKvXNZ/ZZMyR+HC4Hx8G10A==
X-Google-Smtp-Source: AK7set+iDIpJXiSmE9vwoJaVBF7W/DlBhKqa+iqOiX3z9Vaq+qXlgewnIdG6jqHUBIct8A5xJj+qXw==
X-Received: by 2002:adf:e44c:0:b0:2c7:148c:b04f with SMTP id t12-20020adfe44c000000b002c7148cb04fmr9024090wrm.37.1678192279337;
        Tue, 07 Mar 2023 04:31:19 -0800 (PST)
Received: from localhost ([165.225.194.197])
        by smtp.gmail.com with ESMTPSA id z1-20020adff1c1000000b002c70c99db74sm12525038wro.86.2023.03.07.04.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 04:31:18 -0800 (PST)
References: <20230306220959.240235-1-ojeda@kernel.org>
User-agent: mu4e 1.9.18; emacs 28.2.50
From:   Andreas Hindborg <nmi@metaspace.dk>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH] docs: rust: point directly to the standalone installers
Date:   Tue, 07 Mar 2023 13:29:44 +0100
In-reply-to: <20230306220959.240235-1-ojeda@kernel.org>
Message-ID: <87ilfcivzf.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Miguel Ojeda <ojeda@kernel.org> writes:

> The Quick Start guide points to the Rust programming language front
> page when it mentions the possibility of using the standalone
> installers instead of `rustup`.
>
> This was done to have a hopefully stable link, but it is not too
> helpful: readers need to figure out how to reach the standalone
> installers from there.
>
> Thus point directly to the page (and anchor) with the table that
> contains the standalone installers (plus signing key etc.).
>
> If the link breaks in the future, we can always update it as
> needed. And anyway having the full link includes the domain and
> gives more information about where the old docs were in such
> a broken link case, which may help.
>
> Link: https://lore.kernel.org/linux-doc/CANiq72=gpzQyh1ExGbBWWNdgH-mTATdG5F600jKD1=NLLCn7wg@mail.gmail.com/
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  Documentation/rust/quick-start.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
> index 13b7744b1e27..253d47791f0f 100644
> --- a/Documentation/rust/quick-start.rst
> +++ b/Documentation/rust/quick-start.rst
> @@ -40,7 +40,7 @@ and run::
>  
>  Otherwise, fetch a standalone installer or install ``rustup`` from:

I guess we should remove "or install ``rustup``" from this sentence?

BR Andreas
