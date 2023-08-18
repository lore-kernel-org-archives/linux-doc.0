Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10EE8C678DC
	for <linux-doc@archiver.kernel.org>; Fri, 18 Aug 2023 10:23:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242038AbjHRKW7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Aug 2023 06:22:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358913AbjHRKWm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Aug 2023 06:22:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F7D73592
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 03:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692354113;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MMCs5YxFvVB+fiLSaL+VMY2Wpe2VaOEHRXiYp6vzx4M=;
        b=PWviVAYMSjmglLBYghajp03zLc2Ttfnref8xJV04Ci/4IW7pqeIDftFlCi2UG8nFKREMQ3
        S/qJlwO6qJRjZ18jpxUTtuuD3FY7dCOimeuxzoniSqjkZrXQKwDcsEfacmEuXj5AZmfFk6
        WwpHtPFoFEpv5DIgNPvIyQtznl91oWk=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-WXjdiqbINSO1JkBmizoIZw-1; Fri, 18 Aug 2023 06:21:52 -0400
X-MC-Unique: WXjdiqbINSO1JkBmizoIZw-1
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-56c877bb4a9so899458eaf.2
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 03:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692354111; x=1692958911;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MMCs5YxFvVB+fiLSaL+VMY2Wpe2VaOEHRXiYp6vzx4M=;
        b=B5WGInYVz2tphL8VBO6eSsPnFSvOr06IVoLbzFLB3d45JMKpRo0dG+amQKYUj/L7p/
         0FAEwIvU1AuKWP0bZUxwdlWkC1pszQLiz9YgfIpCCqLq6TCw9y+qHNjwLNaobUK3E6fc
         IBgexjoZF78r2KFaOH9kp16O7xGEgE5VLqWTRdn/ujHEjE9Hf0si96XbbijqcZTO7vdv
         fTezvKzt1zrlDmCTsZoeOICqPEtK07SXU8SSQfga5o5Btv3xNjt2GMPj9q616fngC1B9
         BgUSYE6xtJDjgb+RMFB6K3sp8IA8wwuRY4d5pnU4BDvAT4tYuYDyYUeL1r8AIhskSNln
         4TOA==
X-Gm-Message-State: AOJu0Yx9LAC34fPdTnbTKQxROrOehoMQvoDDK2XEIY0FPoT/+zc7xPxC
        Hf2y5q2P7eS3KCCPQprDvAisTv/N9+MaCLhkxfBhN/rAQvtBvJihLtfwUfMzOsILb7DlCPE0GE1
        sgM5/qt7QfhsrOij693lRw+HnnA2DS7fIvYwQ
X-Received: by 2002:a05:6358:27a4:b0:139:c7cb:77d4 with SMTP id l36-20020a05635827a400b00139c7cb77d4mr2316831rwb.24.1692354111671;
        Fri, 18 Aug 2023 03:21:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVl7u3okw/rSA7AwHYEXaUXprn/MNPwiAA8hA7Tw09iDT4nRzegrWi2GlgLqVnNfTt3BzQBxpRCirLH8dFvMw=
X-Received: by 2002:a05:6358:27a4:b0:139:c7cb:77d4 with SMTP id
 l36-20020a05635827a400b00139c7cb77d4mr2316801rwb.24.1692354111375; Fri, 18
 Aug 2023 03:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230815194254.89570-1-donald.hunter@gmail.com>
 <20230815194254.89570-6-donald.hunter@gmail.com> <20230816082030.5c716f37@kernel.org>
 <CAAf2yc=C4N=QT6hpxmLi-uywc+MhuLdAsbfPRORv5ms9k1JAfQ@mail.gmail.com> <20230817183751.194d547a@kernel.org>
In-Reply-To: <20230817183751.194d547a@kernel.org>
From:   Donald Hunter <donald.hunter@redhat.com>
Date:   Fri, 18 Aug 2023 11:21:40 +0100
Message-ID: <CAAf2yckUjoKOqxF1uMB+3jo9gQomSfva72WKZmpKjKUdFpQqCQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 05/10] tools/net/ynl: Refactor
 decode_fixed_header into NlMsg
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Donald Hunter <donald.hunter@gmail.com>, netdev@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 18 Aug 2023 at 02:37, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Thu, 17 Aug 2023 16:14:35 +0100 Donald Hunter wrote:
> > > It's a bit of a layering violation that we are futzing with the raw
> > > member of NlMsg inside GenlMsg, no?
> > >
> > > Should we add "fixed hdrs len" argument to NlMsg? Either directly or
> > > pass ynl and let get the expected len from ynl? That way NlMsg can
> > > split itself into hdr, userhdrs and attrs without GenlMsg "fixing it
> > > up"?
> >
> > I agree, it breaks the layering. The issue is that GenlMsg gets created at
> > some point after NlMsg, only when we know the nl_msg is suitable for
> > decoding. The fixed header bit is quite well encapsulated in NlMsg,
> > it's the genl header that needs pulled out and NlMsg shouldn't know
> > anything about it. How about I add a take_bytes(length) method or a
> > generic decode_subheader(format, length) method to NlMsg?
>
> Why do we need to fix up the .raw of NlMsg underlying the GenlMsg
> in the first place? GenlMsg by itself didn't need to do that until now.

Fair point. I will refactor to leave nl_msg.raw untouched.

> Another option to consider which would make things more symmetric
> between raw and genetlink would be to add a wrapper class for old
> families, too. ClassicMsg? CnlMsg? That way we could retain the
> separation of NlMsg is just a raw message which could be a NLM_DONE or
> some other control thing, and higher level class being used to pull
> fixed headers and separate out attrs. Just a thought, not sure it helps.

I _think_ I can avoid doing this. There's an asymmetry to the way
the NlAttrs get created that I need to fix. When I do that, the rest
should be a bit cleaner.

