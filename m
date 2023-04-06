Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC69C77B6C
	for <linux-doc@archiver.kernel.org>; Thu,  6 Apr 2023 18:39:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240254AbjDFSi6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Apr 2023 14:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240244AbjDFSi5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Apr 2023 14:38:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6589A61A8
        for <linux-doc@vger.kernel.org>; Thu,  6 Apr 2023 11:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680806290;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cL0xEv36os7K6igc2mQAflPTjWsCcGWjiQ4JpavLjnU=;
        b=Cr8tLDK55u7GUqpdvXiBhkvjbDO5OMjA5SMh3GQmkiH1pvjQ9WCa6xg0edmV6AeFgjDZXU
        Kbp2bC55KQ9Qd7QSUhasUlCVFCe2VCFmOEIhAQ+6b9umkctQo9OzqjYzCrUEbi07yrMkSM
        kc2irYiN8DCIWYvXs68yqoCBJ90Hpfc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-8KL0sLuXOq2UUUzys_1utw-1; Thu, 06 Apr 2023 14:38:08 -0400
X-MC-Unique: 8KL0sLuXOq2UUUzys_1utw-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-50270e74786so759593a12.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Apr 2023 11:38:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680806287;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cL0xEv36os7K6igc2mQAflPTjWsCcGWjiQ4JpavLjnU=;
        b=nWvaaCAfnqaTyaSrSLkhAb5Fr4HqTfCKVcV5kSfF3TZTRP/akVcXPxybi89IPbQD7X
         ov0tYaGljleZ3b/GqQZdStSIcc5UO1j5ZzNCm/sV7kw6w2MQef7fgkqYCsDhcTDUo0cQ
         nQ2fEK3Dw2JYHxVha1XNoIMEJBWnFztgQ7ZZxeh4TaCC3ZoX1oOT9MtlMgjcQx0arItw
         X3fFEzJIkn+1JALiXQF8WHv45Iywvunl19+UJncfoMVNjHrsHhv1a/7Ft0yvyfqhco/b
         HNNHItpeQaEeJRP5EC10NTpMIpuQ2qSa2u1u0G17q7BTuWvL2QnkklQAb/7oij9I+63l
         5rdg==
X-Gm-Message-State: AAQBX9dlRVVlRlbe6KTpIlxaClE+O8zXh66h9A+aSnQlGYBqRTf7T9Em
        WxpMcjNTEBat5/f2AmGVVG8B7HNzhhaadZV8j/UZ2zRBCkoPjNofdDohr0FJR2JK9FznxcLcVBS
        SJQWG1/eo/MFAT69zlcrA
X-Received: by 2002:a05:6402:70e:b0:4fc:535c:3aa1 with SMTP id w14-20020a056402070e00b004fc535c3aa1mr475750edx.10.1680806287233;
        Thu, 06 Apr 2023 11:38:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350bn8KXU73iNBODtP7YbUGAxE1utUCnkQ8ktBabX2iMDmsXj0FzDJn95e86pszBxnyLCKIdpYQ==
X-Received: by 2002:a05:6402:70e:b0:4fc:535c:3aa1 with SMTP id w14-20020a056402070e00b004fc535c3aa1mr475715edx.10.1680806286873;
        Thu, 06 Apr 2023 11:38:06 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id x102-20020a50baef000000b004af73333d6esm1047561ede.53.2023.04.06.11.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 11:38:06 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 3FD93A746CA; Thu,  6 Apr 2023 20:38:05 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Kal Conley <kal.conley@dectris.com>,
        =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Magnus Karlsson <magnus.karlsson@intel.com>,
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
Cc:     Kal Conley <kal.conley@dectris.com>, netdev@vger.kernel.org,
        bpf@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v3 1/3] xsk: Support UMEM chunk_size > PAGE_SIZE
In-Reply-To: <20230406130205.49996-2-kal.conley@dectris.com>
References: <20230406130205.49996-1-kal.conley@dectris.com>
 <20230406130205.49996-2-kal.conley@dectris.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Thu, 06 Apr 2023 20:38:05 +0200
Message-ID: <87sfdckgaa.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Kal Conley <kal.conley@dectris.com> writes:

> Add core AF_XDP support for chunk sizes larger than PAGE_SIZE. This
> enables sending/receiving jumbo ethernet frames up to the theoretical
> maxiumum of 64 KiB. For chunk sizes > PAGE_SIZE, the UMEM is required
> to consist of HugeTLB VMAs (and be hugepage aligned). Initially, only
> SKB mode is usable pending future driver work.

Hmm, interesting. So how does this interact with XDP multibuf?

-Toke

