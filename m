Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 184E8EB64D7
	for <linux-doc@archiver.kernel.org>; Tue, 20 Jun 2023 19:28:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbjFTT2s (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Jun 2023 15:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbjFTT2q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Jun 2023 15:28:46 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B53A1710
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 12:28:45 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-988883b0d8fso448241166b.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 12:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1687289324; x=1689881324;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XH1eTCKvssGWMBfvFrdgcklOsCxNlyt2GIpnc07LELQ=;
        b=BlynXctAWH1QRQ92/1liGst5sDK4J+VQcZkeHhN/JzMTNaMJ1YVs/a+8TpEn7V+e2z
         5rsT4otCl2HBLFcn3UZI9U8/bLdOsI5BJgt9hPBTvRlotni4E07NsF/Dwxb5rbyEmVrn
         Cp4ves6PTyv0l/TrGTJFH5VxYdufbQ6URbqso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687289324; x=1689881324;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XH1eTCKvssGWMBfvFrdgcklOsCxNlyt2GIpnc07LELQ=;
        b=dsUjo96h6fHvL6HR2o2EjzMUOCUjE8nbupYycEXNpHX70Xiz+N0iuNWE6RxT8Ll7Yc
         KROcdpUvYsSLcZFSX9/O4o9QwFDXvBbekQffekXUIdOTtG3BMBgh6o7rfbRakQtCSK9q
         iEfxDc4uIPJQuWy1LInnWENUQpNDnMWxMMzgMBMhAZ+cdjE+ULE9yo0dKw3cjkhDeD2h
         mhImXHNdVpZRaLIwr9KJmAa0C/U1MkXsO8HNV6ssBYM2b+jer76EkCmY9iIa6jeUqIjN
         jY7pdOeLMbmUOHScOL94EG83UjKIT833H3z6xem+ICNp0+ZWhAYXt0HqkWbB0ekF2zbp
         B8HQ==
X-Gm-Message-State: AC+VfDyZyi5YNNH4rOw41KZ/BOL2qVMHG7i/Gv7NBfLkDoieyDtzp9Gr
        r9sQoupkK7nYN1st+h1bpzo/1hTEokeZ4iRfTEH53g==
X-Google-Smtp-Source: ACHHUZ54HsxZXLKER+8ewm47xglhax+CzJ5iDEH3HsDCWTmmUgIaC+ahifuhHR5ouh2PxWWWI4v7558KxZAH1+RIWm0=
X-Received: by 2002:a17:906:6a0c:b0:988:bb33:53a8 with SMTP id
 qw12-20020a1709066a0c00b00988bb3353a8mr5382005ejc.9.1687289324011; Tue, 20
 Jun 2023 12:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230620151328.1637569-1-keiichiw@chromium.org> <20230620151328.1637569-3-keiichiw@chromium.org>
In-Reply-To: <20230620151328.1637569-3-keiichiw@chromium.org>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Tue, 20 Jun 2023 21:28:32 +0200
Message-ID: <CAJfpegton83boLEL7n-Tf6ON4Nq_g2=mTus7vhX2n0C+yuUC4w@mail.gmail.com>
Subject: Re: [PATCH 2/3] fuse: Add negative_dentry_timeout option
To:     Keiichi Watanabe <keiichiw@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, mhiramat@google.com,
        takayas@chromium.org, drosen@google.com, sarthakkukreti@google.com,
        uekawa@chromium.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 20 Jun 2023 at 17:14, Keiichi Watanabe <keiichiw@chromium.org> wrote:
>
> Add `negative_dentry_timeout` mount option for FUSE to cache negative
> dentries for the specified duration.

This is already possible, no kernel changes needed.  See e.g.
xmp_init() in libfuse/example/passthrough.c.

Thanks,
Miklos
