Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00DF5C77B6E
	for <linux-doc@archiver.kernel.org>; Thu, 13 Apr 2023 20:49:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbjDMUtx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Apr 2023 16:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbjDMUtw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Apr 2023 16:49:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A4888697
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 13:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681418948;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iLaM67UvMzd8NeAnSp7Vx35R3ooH8nXVeMsYhQtDrpw=;
        b=FhldNv9+sLeZxMpBUeRb8burL1ajmiI6afmULVj1pKAj1aAu04/uvUOGAeZXxBGMF29Ug2
        Y9khWrheJBIcA2VN4PZgj19r66A6tJ4Me46jATo0lSVbz0priAL5fVGE9zAUMk0zwfEsr0
        UZFk/FTugbzh9HrVfEKl5zPfYYxZfVY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-T1BjWp0vNhy4cqVBdQvA5A-1; Thu, 13 Apr 2023 16:49:07 -0400
X-MC-Unique: T1BjWp0vNhy4cqVBdQvA5A-1
Received: by mail-ed1-f72.google.com with SMTP id u21-20020a509515000000b005067480c535so1392132eda.20
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 13:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681418946; x=1684010946;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iLaM67UvMzd8NeAnSp7Vx35R3ooH8nXVeMsYhQtDrpw=;
        b=fnjm2Jsf/Hz0NRxYX1527K1ZC40rSeK7xdI2gcCy0j1rliGfdWMqBa74yVYFU3ggSX
         9hSYsg9+EOs8GYOP8SOaySU71j40yfc8EatRt8CyvnZjUz29cBrn2LYcWwUuJ1B5Odi1
         r0y6i95Jt7Ck+LdQPnk84cOfyiy+LyQUJbAb9AKrIXHG+/0dmN5o7urUYW5zSbA5a44L
         nSGzb6puv/JZ0qlmDm+DA9PGWmNplDtJ6RlRtTAqX4VPfnFZs7xPMe4wFoPGvL9fNd16
         W97nAWjK1GwGNqN2zQH68O2lehFkz0p+zlCWp1oAtb15bKN8LsDC9/6Sk0i9M1YPwFhp
         yKxA==
X-Gm-Message-State: AAQBX9e3Xs2Oepu+eemWZ69aOLMC3ac05T32mP1eSy57te+Ons/3sZxI
        cZqmre3azqAEixCvBs1DeVR+SE3t9yXhEB9ewUc2pV99MRiEdi4c+hj9EijifrjOm7bENUB+qtc
        tPLMTKSb4VmBreeRA78Xt
X-Received: by 2002:a17:907:984c:b0:948:b988:8cc3 with SMTP id jj12-20020a170907984c00b00948b9888cc3mr4147787ejc.75.1681418945776;
        Thu, 13 Apr 2023 13:49:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350bPGSR3gQ4upooNybI4H3M/HmIOXfKfoJqvk974LBdVJoWBT91lmcIroESBjv99VoMziDvCCg==
X-Received: by 2002:a17:907:984c:b0:948:b988:8cc3 with SMTP id jj12-20020a170907984c00b00948b9888cc3mr4147755ejc.75.1681418945065;
        Thu, 13 Apr 2023 13:49:05 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id f21-20020a05640214d500b0050489201b81sm1255849edx.26.2023.04.13.13.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 13:49:04 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id E9ECEAA7BA3; Thu, 13 Apr 2023 22:49:03 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Kal Cutter Conley <kal.conley@dectris.com>
Cc:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        =?utf-8?B?QmrDtnJu?= =?utf-8?B?IFTDtnBlbA==?= <bjorn@kernel.org>,
        Magnus Karlsson <magnus.karlsson@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        netdev@vger.kernel.org, bpf@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v3 1/3] xsk: Support UMEM chunk_size > PAGE_SIZE
In-Reply-To: <CAHApi-m4gu8SX_1rBtUwrw+1-Q3ERFEX-HPMcwcCK1OceirwuA@mail.gmail.com>
References: <20230406130205.49996-1-kal.conley@dectris.com>
 <20230406130205.49996-2-kal.conley@dectris.com> <87sfdckgaa.fsf@toke.dk>
 <ZDBEng1KEEG5lOA6@boxer>
 <CAHApi-nuD7iSY7fGPeMYiNf8YX3dG27tJx1=n8b_i=ZQdZGZbw@mail.gmail.com>
 <875ya12phx.fsf@toke.dk>
 <CAHApi-=rMHt7uR8Sw1Vw+MHDrtkyt=jSvTvwz8XKV7SEb01CmQ@mail.gmail.com>
 <87ile011kz.fsf@toke.dk>
 <CAHApi-m4gu8SX_1rBtUwrw+1-Q3ERFEX-HPMcwcCK1OceirwuA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Thu, 13 Apr 2023 22:49:03 +0200
Message-ID: <87o7nrzeww.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Kal Cutter Conley <kal.conley@dectris.com> writes:

>> Well, you mentioned yourself that:
>>
>> > The disadvantage of this patchset is requiring the user to allocate
>> > HugeTLB pages which is an extra complication.
>
> It's a small extra complication *for the user*. However, users that
> need this feature are willing to allocate hugepages. We are one such
> user. For us, having to deal with packets split into disjoint buffers
> (from the XDP multi-buffer paradigm) is a significantly more annoying
> complication than allocating hugepages (particularly on the RX side).

"More annoying" is not a great argument, though. You're basically saying
"please complicate your code so I don't have to complicate mine". And
since kernel API is essentially frozen forever, adding more of them
carries a pretty high cost, which is why kernel developers tend not to
be easily swayed by convenience arguments (if all you want is a more
convenient API, just build one on top of the kernel primitives and wrap
it into a library).

So you'll need to come up with either (1) a use case that you *can't*
solve without this new API (with specifics as to why that is the case),
or (2) a compelling performance benchmark showing the complexity is
worth it. Magnus indicated he would be able to produce the latter, in
which case I'm happy to be persuaded by the numbers.

In any case, however, the behaviour needs to be consistent wrt the rest
of XDP, so it's not as simple as just increasing the limit (as I
mentioned in my previous email).

-Toke

