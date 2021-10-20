Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3F7C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 20 Oct 2021 19:11:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C35061354
	for <linux-doc@archiver.kernel.org>; Wed, 20 Oct 2021 19:11:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231523AbhJTTNp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Oct 2021 15:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231328AbhJTTNp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Oct 2021 15:13:45 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDBC1C06161C
        for <linux-doc@vger.kernel.org>; Wed, 20 Oct 2021 12:11:30 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id y4so16861828plb.0
        for <linux-doc@vger.kernel.org>; Wed, 20 Oct 2021 12:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VT1ZnTWZw0jMkeN3fDOrnC1r/jUp1V3OZwD2nwImWMk=;
        b=nre93T6MzHelf00EfakHYDHtu00QJEKItoSAkKHGP3gUTjHdigzheidpN0Cn+ghvKd
         LKWv2/OIotRWfXs/WCG7an5/vs5KygZtizL39PVLhD9YZOfqaFwrzigVA2RIjTye4bHE
         OWKNrjwp2iiSwr71nYKpU9JH0SPNhhNIbBfEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VT1ZnTWZw0jMkeN3fDOrnC1r/jUp1V3OZwD2nwImWMk=;
        b=i3PFyhs5t+G89X/1GMsuQ8GAAToVYqYOG2LVP0fIzhU4cqFtYri9KRe3wIhNQS+xwy
         iSJFCtf2rnG15pQCo2NVDAhn8Iwncc+2gXP0YwaTTy2KtKbiryrzspQzxOrPuGr7tpMQ
         ehDD+5f178JDA/GIBQAeM6bzTz/bmSf+i9BdVPmy0mxjT1jE2PLwJwQQbD3GqDEF3osr
         xAdSoKilmpA6WuS+sEpWED6lZTdCo2JpJzBFHEoltMZ9213givKBLYlywZY0KAgUMKcW
         ZueIs/veVQEQVqxpLwuXBbJS51EbG+3i6SnqUh7S1ViAIs6XoJJDSytY0rUQsfBdusdk
         9KiQ==
X-Gm-Message-State: AOAM533O3uUAvFRvlZZuR6Xlmrk6/wnQGGwtMcBadIk7BfPYNIMC98ZF
        ftJmyOubl0QWy5kzIWTvdzbqoQ==
X-Google-Smtp-Source: ABdhPJyVMN7MoPGQBIowKQmEG8vN3pK31aaAQUVHuBVZpxjnw8chkJkUkW744OD0Z5Ryu083zYUf6Q==
X-Received: by 2002:a17:90a:e54d:: with SMTP id ei13mr950751pjb.65.1634757090342;
        Wed, 20 Oct 2021 12:11:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x13sm2869108pge.37.2021.10.20.12.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 12:11:29 -0700 (PDT)
Date:   Wed, 20 Oct 2021 12:11:29 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Emese Revfy <re.emese@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Dan Li <ashimida@linux.alibaba.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] gcc-plugins: Remove cyc_complexity
Message-ID: <202110201210.1F70546@keescook>
References: <20211020173554.38122-1-keescook@chromium.org>
 <20211020173554.38122-3-keescook@chromium.org>
 <CANiq72kveT40jX8GWjs1dy0o3YjowUGtGTddPb+da114sb+4iA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72kveT40jX8GWjs1dy0o3YjowUGtGTddPb+da114sb+4iA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 20, 2021 at 07:48:55PM +0200, Miguel Ojeda wrote:
> On Wed, Oct 20, 2021 at 7:35 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > - * Copyright 2011-2016 by Emese Revfy <re.emese@gmail.com>
> 
> Perhaps we should Cc this address to give them notice.

Good point; I'm in the habit of that happening automatically as Emese
was a co-maintainer of the gcc-plugins. Sorry for the oversight here.

> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

-- 
Kees Cook
