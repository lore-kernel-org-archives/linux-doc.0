Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3155EC77B60
	for <linux-doc@archiver.kernel.org>; Wed, 26 Apr 2023 10:48:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239869AbjDZKsJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Apr 2023 06:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239464AbjDZKrp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Apr 2023 06:47:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B6119A3
        for <linux-doc@vger.kernel.org>; Wed, 26 Apr 2023 03:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682506022;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q7eSG1klkAdyLEaNU1h7MS+MxhJ0DOqewp5Z8jQS+rk=;
        b=F1NAXP23RESFvqE515uSZfCqvlrPgo6WHQ+LKn1Vx/rnL7gR9IbT3buydMNvkKdBLW/qkN
        QrT/X5PpP0KK5j+IdmKII2hWNa6BhdlSgQAIjnv/e41DJjJrMFbfrbcWd8Sirrv2uggk4P
        K0ViDOY0f3sTZ1psLVSnbVEebn8CllE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-kIRAcrc9Plawk3GFE-w3QQ-1; Wed, 26 Apr 2023 06:47:01 -0400
X-MC-Unique: kIRAcrc9Plawk3GFE-w3QQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-94a34e35f57so620196166b.3
        for <linux-doc@vger.kernel.org>; Wed, 26 Apr 2023 03:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682506020; x=1685098020;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7eSG1klkAdyLEaNU1h7MS+MxhJ0DOqewp5Z8jQS+rk=;
        b=KDgeRhAnytuooPO0YcUyrRaosqlk7OPdKUgihQ3VtXmp9gWsN/P5sK/jB63BFBL2Wh
         H3NsUttlmZD5uaU6DKduaYAWwSM9ac/ArzJOq7cApupYpXBDibuDfwQfjG/3lwanIuRs
         C01ellNMdaAGQ+xZsC4MdVbuLTjV+h8t/wTWZVKDTymZ4lLXXxYOR3eiWCydK1pTU0JS
         tzqd91cbu8D/0fvzGWZm/K7cTpL0wixIy0c5NRf0fmDWAQToVarp6qnHVrlW2Wun8DkD
         IEJ28385yrx0M3yTRY2A6twCGnVM1NvNVaEtp92sP0zZQbeaXryvWd1c/frbuinE0ZK/
         LVIA==
X-Gm-Message-State: AAQBX9c3KX14Chxg0yzhPXOBl57824CVMjgcnb3YYXy+PDmGere7Mi+D
        8NvVm/A7b+d0aAEj9cTk5Vnzc5YlPtBBEYGnqgRojpFLkBC/BY6OAetSuuiatwAhugWSwL7DsDx
        LsDFKGZInQ0lFdacaJLqw
X-Received: by 2002:a17:906:a84c:b0:947:c8d5:fb2a with SMTP id dx12-20020a170906a84c00b00947c8d5fb2amr17287729ejb.48.1682506019820;
        Wed, 26 Apr 2023 03:46:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350bueCmxCjDSmFglv2TB/hZ+jA43sk3LCYfVFX9cQwRdfdOgUzEC5j8gS5n5MB/sN1wMbcmEvQ==
X-Received: by 2002:a17:906:a84c:b0:947:c8d5:fb2a with SMTP id dx12-20020a170906a84c00b00947c8d5fb2amr17287691ejb.48.1682506019416;
        Wed, 26 Apr 2023 03:46:59 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id lb16-20020a170907785000b0094ee700d8e4sm7946826ejc.44.2023.04.26.03.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 03:46:58 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 44A81AAA41C; Wed, 26 Apr 2023 12:46:58 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Kal Conley <kal.conley@dectris.com>,
        Magnus Karlsson <magnus.karlsson@intel.com>,
        =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>
Cc:     Kal Conley <kal.conley@dectris.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>, netdev@vger.kernel.org,
        bpf@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v6 2/4] xsk: Support UMEM chunk_size > PAGE_SIZE
In-Reply-To: <20230412162114.19389-3-kal.conley@dectris.com>
References: <20230412162114.19389-1-kal.conley@dectris.com>
 <20230412162114.19389-3-kal.conley@dectris.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 26 Apr 2023 12:46:58 +0200
Message-ID: <87v8hij4yl.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Kal Conley <kal.conley@dectris.com> writes:

> Add core AF_XDP support for chunk sizes larger than PAGE_SIZE. This
> enables sending/receiving jumbo ethernet frames up to the theoretical
> maximum of 64 KiB. For chunk sizes > PAGE_SIZE, the UMEM is required
> to consist of HugeTLB VMAs (and be hugepage aligned). Initially, only
> SKB mode is usable pending future driver work.

So I still really don't understand why this is useful without the driver
support, and I think it's premature to merge it before that is present.
It also seems you didn't address any of the issues we discussed back on
v3, but instead just reposted (and didn't even Cc me, so I missed that
until now).

So, FWIW, consider this my:

Nacked-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

