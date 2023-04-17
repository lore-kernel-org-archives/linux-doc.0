Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0150FC77B70
	for <linux-doc@archiver.kernel.org>; Mon, 17 Apr 2023 12:41:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbjDQMlG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Apr 2023 08:41:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231213AbjDQMkt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Apr 2023 08:40:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FAF3106
        for <linux-doc@vger.kernel.org>; Mon, 17 Apr 2023 05:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681735208;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=d8R/DyfPuxRJq8lFo64wBLNVpfrgX/DMbIH8EiFz9DI=;
        b=CNE3rGhMoPh0Sk0vr3J+KsLNBMrEO9lxjBwsymeTSG0vWgmton5xZKCcPnZHOo+FWD4Um1
        PeSZBk/4hHfI0Hr5867kQftDHmTTRLIGpjS6frGnTV9H2E8dJfT+aIk7klSp39TZpPurj9
        CT+0C0II7HK3hm89F3ogkL+vNOF6jeA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-kAkRDR9PM1GpLV5rqrttMg-1; Mon, 17 Apr 2023 08:40:07 -0400
X-MC-Unique: kAkRDR9PM1GpLV5rqrttMg-1
Received: by mail-ej1-f70.google.com with SMTP id hh16-20020a170906a95000b00948f41a40d3so10545633ejb.8
        for <linux-doc@vger.kernel.org>; Mon, 17 Apr 2023 05:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681735206; x=1684327206;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8R/DyfPuxRJq8lFo64wBLNVpfrgX/DMbIH8EiFz9DI=;
        b=ayQR5lvn3VH4kRcCYRa/RQ+8aszGPlO2TFKs/zUOYOroO/zFaSBmAEORK++dymaU7r
         AzbmjPYyUzr/NCnRaoZYyBtUSS9hzS8xm0O0LSYD4umi3Qx/UFjBCcBp/JlpbT9xfiul
         NA23O1mZe0IYDtMHpE5yJXHDTkIr7knCipXVEii7c0rWFOdZLdXXzPQXDruTO/7R+2Ss
         zmS6KqHWeekzLS+Nt03c0qBU0SXFf2JnDJvSD3zW021NuQ1/E/WOWx/UoCY9AdZ9jkEj
         KcK+h5uGR03lflpKcF9pPlwWj6LHzkM2gq2fNGoXnKa3vO7tVsJMsFtUHXHYx25SQ8Mz
         kD0Q==
X-Gm-Message-State: AAQBX9fCkxXdkzfGd0mUXgHrNCQm09XkSZbeoJc92nrh1jWCrcKj5dNx
        o43Y9ucWRCvH1OjfZmKRsuoPH0fP820WBcfHytoSiGqVfHk3mx87VeppfcRkqqpfDcjpkmglotO
        +sS47eknoKU2ZfeJVskBr
X-Received: by 2002:a17:906:ae56:b0:932:1af9:7386 with SMTP id lf22-20020a170906ae5600b009321af97386mr7169616ejb.27.1681735206437;
        Mon, 17 Apr 2023 05:40:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350aW/kxO/780wfJlvoA8/SxGVLczSeSpBXtQ9jUSEU7Eij2vduEeVE6+vnyBY1Qt/CkYdfKc2w==
X-Received: by 2002:a17:906:ae56:b0:932:1af9:7386 with SMTP id lf22-20020a170906ae5600b009321af97386mr7169594ejb.27.1681735206008;
        Mon, 17 Apr 2023 05:40:06 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id 14-20020a17090601ce00b0094a671c2298sm1119966ejj.62.2023.04.17.05.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 05:40:05 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id B7E40AA8452; Mon, 17 Apr 2023 14:40:04 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     Kal Cutter Conley <kal.conley@dectris.com>,
        Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
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
In-Reply-To: <CAJ8uoz3Rts2Xfhqq+0cm3GES=dMb2hTqPzGm515oG_nmt=-Nbg@mail.gmail.com>
References: <20230406130205.49996-1-kal.conley@dectris.com>
 <20230406130205.49996-2-kal.conley@dectris.com> <87sfdckgaa.fsf@toke.dk>
 <ZDBEng1KEEG5lOA6@boxer>
 <CAHApi-nuD7iSY7fGPeMYiNf8YX3dG27tJx1=n8b_i=ZQdZGZbw@mail.gmail.com>
 <875ya12phx.fsf@toke.dk>
 <CAHApi-=rMHt7uR8Sw1Vw+MHDrtkyt=jSvTvwz8XKV7SEb01CmQ@mail.gmail.com>
 <87ile011kz.fsf@toke.dk>
 <CAHApi-m4gu8SX_1rBtUwrw+1-Q3ERFEX-HPMcwcCK1OceirwuA@mail.gmail.com>
 <87o7nrzeww.fsf@toke.dk>
 <CAJ8uoz3Rts2Xfhqq+0cm3GES=dMb2hTqPzGm515oG_nmt=-Nbg@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 17 Apr 2023 14:40:04 +0200
Message-ID: <87o7nmwul7.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Magnus Karlsson <magnus.karlsson@gmail.com> writes:

> On Thu, 13 Apr 2023 at 22:52, Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com> wrote:
>>
>> Kal Cutter Conley <kal.conley@dectris.com> writes:
>>
>> >> Well, you mentioned yourself that:
>> >>
>> >> > The disadvantage of this patchset is requiring the user to allocate
>> >> > HugeTLB pages which is an extra complication.
>> >
>> > It's a small extra complication *for the user*. However, users that
>> > need this feature are willing to allocate hugepages. We are one such
>> > user. For us, having to deal with packets split into disjoint buffers
>> > (from the XDP multi-buffer paradigm) is a significantly more annoying
>> > complication than allocating hugepages (particularly on the RX side).
>>
>> "More annoying" is not a great argument, though. You're basically saying
>> "please complicate your code so I don't have to complicate mine". And
>> since kernel API is essentially frozen forever, adding more of them
>> carries a pretty high cost, which is why kernel developers tend not to
>> be easily swayed by convenience arguments (if all you want is a more
>> convenient API, just build one on top of the kernel primitives and wrap
>> it into a library).
>>
>> So you'll need to come up with either (1) a use case that you *can't*
>> solve without this new API (with specifics as to why that is the case),
>> or (2) a compelling performance benchmark showing the complexity is
>> worth it. Magnus indicated he would be able to produce the latter, in
>> which case I'm happy to be persuaded by the numbers.
>
> We will measure it and get back to you. Would be good with some
> numbers.

Sounds good, thanks! :)

-Toke

