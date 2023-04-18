Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DECFC77B78
	for <linux-doc@archiver.kernel.org>; Tue, 18 Apr 2023 10:18:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbjDRKSL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Apr 2023 06:18:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231205AbjDRKSF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Apr 2023 06:18:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9605C4C18
        for <linux-doc@vger.kernel.org>; Tue, 18 Apr 2023 03:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681813036;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ApoV6tQ/8bWNgsumqAtwyvPE2nYx/deLF6XAnhG6Ezo=;
        b=cVic9unN2TPZRQuhhQEIbhWhVOh//CdqCNGjlXp1W9IqLr3qfn2FBQZWhba6K4EjtjoJhe
        GKxuu20Y52VfOsobZL6EbGr1ALzdfPmTDuMdXYBC1UPPKLY/2PTmMVqDlpPM0XQ0zjh0I7
        obPhnU8itGgQk8WijFy92gaR1M74q3Y=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-QxlIySBaPNKG7kBt3TcMYg-1; Tue, 18 Apr 2023 06:17:01 -0400
X-MC-Unique: QxlIySBaPNKG7kBt3TcMYg-1
Received: by mail-ed1-f72.google.com with SMTP id u19-20020a50a413000000b0050670a8cb7dso8385425edb.13
        for <linux-doc@vger.kernel.org>; Tue, 18 Apr 2023 03:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681813020; x=1684405020;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ApoV6tQ/8bWNgsumqAtwyvPE2nYx/deLF6XAnhG6Ezo=;
        b=DR9mdOWqrRbHTcyFbEBvmx4Ou9p+SyBLTFKC20eqvOeiyLd/mHhtkB9NcglEMj4ofk
         t9sshMb3ytoQXbKpzssB8NBSmV7YlDKudOEzaaITJAUyUb0h2E00G62pwxzzoKDOJsDn
         aRier5FoOxjO98MtPlmPbeDDNZU4px+UWmzeY4VE/Ds1sAwxeG63U0A+wQVzqrNge4RY
         OzR0MfahrHIGiqyDiUS8cS5aBh8h2zkwup4paXHHCiLuygZeA1t6Fcr02FbvfSqBetra
         jYmIiN5ak77QTh3cD0qkvM7m7mgEVhWZIWSAA0ePlBRC2grzplxwTMkrMWMn0iA188QD
         NZ4w==
X-Gm-Message-State: AAQBX9c9seLh7fkwXDT3XcrKGIchjoQQDuNuQeoLjWPQ28iMIpKKRwSy
        XLPuqVZFy+T162qdbhmxLemYmwoxPlCy7czFtZeDDQHnEAfA/E4BMZjVALmY5mOHA/EgXSk3dh3
        5oW4Qhl7dTm156h3mW/Em
X-Received: by 2002:a17:907:838d:b0:947:4828:4399 with SMTP id mv13-20020a170907838d00b0094748284399mr7869354ejc.12.1681813020428;
        Tue, 18 Apr 2023 03:17:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350a+9FUztTLaTcXx8PE3l5G/TqPZEC561sVQryR4LTqFxkdQ1s67cLIsu1//A4fVbtZjLVD1Og==
X-Received: by 2002:a17:907:838d:b0:947:4828:4399 with SMTP id mv13-20020a170907838d00b0094748284399mr7869332ejc.12.1681813020026;
        Tue, 18 Apr 2023 03:17:00 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id z17-20020a170906715100b0093f822321fesm7835354ejj.137.2023.04.18.03.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 03:16:59 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 99F12AA85EB; Tue, 18 Apr 2023 12:16:58 +0200 (CEST)
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
In-Reply-To: <CAHApi-=ODe-WtJ=m6bycQhKoQxb+kk2Yk9Fx5SgBsWUuWT_u-A@mail.gmail.com>
References: <20230406130205.49996-1-kal.conley@dectris.com>
 <20230406130205.49996-2-kal.conley@dectris.com> <87sfdckgaa.fsf@toke.dk>
 <ZDBEng1KEEG5lOA6@boxer>
 <CAHApi-nuD7iSY7fGPeMYiNf8YX3dG27tJx1=n8b_i=ZQdZGZbw@mail.gmail.com>
 <875ya12phx.fsf@toke.dk>
 <CAHApi-=rMHt7uR8Sw1Vw+MHDrtkyt=jSvTvwz8XKV7SEb01CmQ@mail.gmail.com>
 <87ile011kz.fsf@toke.dk>
 <CAHApi-=ODe-WtJ=m6bycQhKoQxb+kk2Yk9Fx5SgBsWUuWT_u-A@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 18 Apr 2023 12:16:58 +0200
Message-ID: <874jpdwl45.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Kal Cutter Conley <kal.conley@dectris.com> writes:

>> In addition, presumably when using this mode, the other XDP actions
>> (XDP_PASS, XDP_REDIRECT to other targets) would stop working unless we
>> add special handling for that in the kernel? We'll definitely need to
>> handle that somehow...
>
> I am not familiar with all the details here. Do you know a reason why
> these cases would stop working / why special handling would be needed?
> For example, if I have a UMEM that uses hugepages and XDP_PASS is
> returned, then the data is just copied into an SKB right? SKBs can
> also be created directly from hugepages AFAIK. So I don't understand
> what the issue would be. Can someone explain this concern?

Well, I was asking :) It may well be that the SKB path just works; did
you test this? Pretty sure XDP_REDIRECT to another device won't, though?

-Toke

