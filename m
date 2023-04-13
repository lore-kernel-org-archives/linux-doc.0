Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64093C77B61
	for <linux-doc@archiver.kernel.org>; Thu, 13 Apr 2023 10:51:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbjDMKvs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Apr 2023 06:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbjDMKvq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Apr 2023 06:51:46 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC2731736
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 03:51:37 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-50672fbf83eso1532343a12.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 03:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dectris.com; s=google; t=1681383096; x=1683975096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RxeMOwbpGENb+weUS3Q3c1MqA2boB5pRuOKSrr+VKMA=;
        b=olAgFLXV5pQj078BxZmSCdSLqKQ8QJvL1YxmQNcD4ubNdFmVEZtp0Tj+74ZMtWMOcI
         DE+D3UQfYz/CR4E02hxL+0SMwxIGuIjRO1xaMbbjRWm4tXfmZNgoQWlWlrPAoPHccj6O
         VWdvaFir8HjPgBX+IRWFrxCNRDsXY7R42iz1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681383096; x=1683975096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RxeMOwbpGENb+weUS3Q3c1MqA2boB5pRuOKSrr+VKMA=;
        b=R+RwnOwVKrxQJQqlYgrfFyTFBgIAl/iS0eZeYBM4epyhmKUsYL4pqP4BGfpnMtXO2x
         dxiIJoUUlrT/4foySx/E7s3q7AXHq7hba4Uihse/1OP0o7CLU+mPdQKlBb2SCokFU8x7
         BYzBRh4A0KsfhUyq5L8toFrXade/fLF1Iv57u3B8Bw9daxJM0uktcq9RN+396PX7DlwA
         R6iKK1MpmOj18cDs5Ahr021MLdQivKmmako+62/WfLMJMygj4zgMhYUBQZM53FNjHXRm
         +kpZAEm5QpnVZha1JizWGC4t3j/I+OZ4YV3EqKAHulNuH97zW4+qLp1b2jaGj52PlDhC
         OE2w==
X-Gm-Message-State: AAQBX9dcYdHEdO5K52xCVbqGpS1/jBTk4k8lozEsf6Uc3gt8GYFqVfRd
        mLyJrfzjaZWNlFnGWVY1rPbVBCevEHi2Yi2OngOVNg==
X-Google-Smtp-Source: AKy350aJVHJsIM/7Cw5RRVLHjyYZYMjj/wfkGRiEzVOfWIvLI+ptJr0GOC68cQM7cPhDCwcJUYGEhLI0zZpYDF8aKKM=
X-Received: by 2002:a50:bb25:0:b0:502:7551:86c7 with SMTP id
 y34-20020a50bb25000000b00502755186c7mr738815ede.4.1681383096281; Thu, 13 Apr
 2023 03:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230406130205.49996-1-kal.conley@dectris.com>
 <20230406130205.49996-2-kal.conley@dectris.com> <87sfdckgaa.fsf@toke.dk>
 <ZDBEng1KEEG5lOA6@boxer> <CAHApi-nuD7iSY7fGPeMYiNf8YX3dG27tJx1=n8b_i=ZQdZGZbw@mail.gmail.com>
 <875ya12phx.fsf@toke.dk>
In-Reply-To: <875ya12phx.fsf@toke.dk>
From:   Kal Cutter Conley <kal.conley@dectris.com>
Date:   Thu, 13 Apr 2023 12:56:20 +0200
Message-ID: <CAHApi-=rMHt7uR8Sw1Vw+MHDrtkyt=jSvTvwz8XKV7SEb01CmQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/3] xsk: Support UMEM chunk_size > PAGE_SIZE
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

>
> Well, I'm mostly concerned with having two different operation and
> configuration modes for the same thing. We'll probably need to support
> multibuf for AF_XDP anyway for the non-ZC path, which means we'll need
> to create a UAPI for that in any case. And having two APIs is just going
> to be more complexity to handle at both the documentation and
> maintenance level.

I don't know if I would call this another "API". This patchset doesn't
change the semantics of anything. It only lifts the chunk size
restriction when hugepages are used. Furthermore, the changes here are
quite small and easy to understand. The four sentences added to the
documentation shouldn't be too concerning either. :-)

In 30 years when everyone finally migrates to page sizes >= 64K the
maintenance burden will drop to zero. Knock wood. :-)

>
> It *might* be worth it to do this if the performance benefit is really
> compelling, but, well, you'd need to implement both and compare directly
> to know that for sure :)

What about use-cases that require incoming packet data to be
contiguous? Without larger chunk sizes, the user is forced to allocate
extra space per packet and copy the data. This defeats the purpose of
ZC.
