Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B92C77B61
	for <linux-doc@archiver.kernel.org>; Thu, 13 Apr 2023 11:09:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjDMLJa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Apr 2023 07:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjDMLJa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Apr 2023 07:09:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50E3B5FD4
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 04:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681384128;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ons+PEhg040VlXg4ZxDtxYCBN3ktVKjiFeoBkktxpTo=;
        b=PLvsX63EtfHdh6Uo0rQIaDMwV2Gd70q/9/nu7PKmHRRIZCPa4Ngyz+CRNw65jQJ1vvlciE
        0A7WBuIY7tAckkexyixR7i+nL7fmM3w+miCDjNi+CP3OFKwsMjyxKJAtkJkx61nemEmYEc
        wg+RXZ1lwTMEaN7u1YZLNO69a1fEnIM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-EcamgWn9PamKJI0a0TfRKQ-1; Thu, 13 Apr 2023 07:08:47 -0400
X-MC-Unique: EcamgWn9PamKJI0a0TfRKQ-1
Received: by mail-ej1-f71.google.com with SMTP id s14-20020a17090699ce00b0093994122eddso5281716ejn.17
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 04:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681384126; x=1683976126;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ons+PEhg040VlXg4ZxDtxYCBN3ktVKjiFeoBkktxpTo=;
        b=ihiugwSqbQHBZQIM1NKYIn4+mkyhu77oYmaugQw3qxbwUl8fzHPYC8miGrR5ifqAWT
         CHcjAHeLPTUXg3BYnC14Fp4kJdA1yUAP6anew5v63n23u9NMDKGaKtEPxhsaKqTerqbs
         WqUo1GzMoy+FY3Qc7sz55qxqIla1sbqQrvTe2Eb3aHg+Sel6DFdQDWVR8lAnltMxgOlZ
         MLWlj/Ar1JD6qlA/sueabB6XW+Fu8VV8alNjJbV2YsCuj1A4xDN1zUaIUFM6KNSmjvQM
         6peD7VcBGyZ20eAm71l5UldPcgTDDAHVK4XQK2ZJRYDaufFMJlno+GhXfOvk1noiswO7
         YuEw==
X-Gm-Message-State: AAQBX9dfMMHL/lVnQc+QWpexOIVlmcU5TSN6rrZOCOqLZ+o6X8uNzxXG
        1TPzG52jA9/mEqRmouo2yTd9hcWhSGNkkEfagCgF/GViFcEyypyf/5EUEK8CIW2c0WFFAPG1XYo
        fUh6HizElEmOcDMuqD8Mp
X-Received: by 2002:a17:906:3888:b0:94a:8a82:9cab with SMTP id q8-20020a170906388800b0094a8a829cabmr2301547ejd.42.1681384126109;
        Thu, 13 Apr 2023 04:08:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350YRUH859V0juwSOoolH8r33NhgxjjZn9BxXeqS19QTUiJdr16jkspnL6tc/NvqKxhfjEPQfuw==
X-Received: by 2002:a17:906:3888:b0:94a:8a82:9cab with SMTP id q8-20020a170906388800b0094a8a829cabmr2301525ejd.42.1681384125710;
        Thu, 13 Apr 2023 04:08:45 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id m5-20020a1709062ac500b0094a84462e5fsm827249eje.37.2023.04.13.04.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 04:08:45 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 95816AA7AF0; Thu, 13 Apr 2023 13:08:44 +0200 (CEST)
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
In-Reply-To: <CAHApi-=rMHt7uR8Sw1Vw+MHDrtkyt=jSvTvwz8XKV7SEb01CmQ@mail.gmail.com>
References: <20230406130205.49996-1-kal.conley@dectris.com>
 <20230406130205.49996-2-kal.conley@dectris.com> <87sfdckgaa.fsf@toke.dk>
 <ZDBEng1KEEG5lOA6@boxer>
 <CAHApi-nuD7iSY7fGPeMYiNf8YX3dG27tJx1=n8b_i=ZQdZGZbw@mail.gmail.com>
 <875ya12phx.fsf@toke.dk>
 <CAHApi-=rMHt7uR8Sw1Vw+MHDrtkyt=jSvTvwz8XKV7SEb01CmQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Thu, 13 Apr 2023 13:08:44 +0200
Message-ID: <87ile011kz.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Kal Cutter Conley <kal.conley@dectris.com> writes:

>>
>> Well, I'm mostly concerned with having two different operation and
>> configuration modes for the same thing. We'll probably need to support
>> multibuf for AF_XDP anyway for the non-ZC path, which means we'll need
>> to create a UAPI for that in any case. And having two APIs is just going
>> to be more complexity to handle at both the documentation and
>> maintenance level.
>
> I don't know if I would call this another "API". This patchset doesn't
> change the semantics of anything. It only lifts the chunk size
> restriction when hugepages are used. Furthermore, the changes here are
> quite small and easy to understand. The four sentences added to the
> documentation shouldn't be too concerning either. :-)

Well, you mentioned yourself that:

> The disadvantage of this patchset is requiring the user to allocate
> HugeTLB pages which is an extra complication.

In addition, presumably when using this mode, the other XDP actions
(XDP_PASS, XDP_REDIRECT to other targets) would stop working unless we
add special handling for that in the kernel? We'll definitely need to
handle that somehow...

> In 30 years when everyone finally migrates to page sizes >= 64K the
> maintenance burden will drop to zero. Knock wood. :-)

Haha, right, but let's make sure we have something that is consistent in
the intervening decades, shall we? ;)

>> It *might* be worth it to do this if the performance benefit is really
>> compelling, but, well, you'd need to implement both and compare directly
>> to know that for sure :)
>
> What about use-cases that require incoming packet data to be
> contiguous? Without larger chunk sizes, the user is forced to allocate
> extra space per packet and copy the data. This defeats the purpose of
> ZC.

What use cases would that be, exactly? Presumably this is also a
performance issue? Which goes back to me asking for benchmarks :)

-Toke

