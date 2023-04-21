Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C35C77B7D
	for <linux-doc@archiver.kernel.org>; Fri, 21 Apr 2023 15:27:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbjDUP1v (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Apr 2023 11:27:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232862AbjDUP1u (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Apr 2023 11:27:50 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFCADBBB2
        for <linux-doc@vger.kernel.org>; Fri, 21 Apr 2023 08:27:46 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50506ac462bso2646536a12.3
        for <linux-doc@vger.kernel.org>; Fri, 21 Apr 2023 08:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dectris.com; s=google; t=1682090865; x=1684682865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gx5GxGtrrjOAGUdwY+1Co2nSlcyUyAY3EIxCkRgyP34=;
        b=PxSombqCkAsg664VeNNmDxvmdjYf4dVj/5vyCqT9TwatG1st3eDRZnY9a5R4md+08R
         Wlj29tQkP0zchjP27MtI4tzvWqid3espmDxOLkS0u8O6ChXIbmPMFUBTkEXVXwV9/2rO
         G2km4+cC+4xjckG50ka0axJFD8eDMEfWiG8fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682090865; x=1684682865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gx5GxGtrrjOAGUdwY+1Co2nSlcyUyAY3EIxCkRgyP34=;
        b=PULAw4x/Q1YU+rGKT6LTCdtrmKL1jiV9vemVW8ztl9thy6JbX7fosk3M2MCoQigkyu
         UgkLJb2bbPJbXg28sfgccr4Efz5iAi/rkBVNjQ31Q8nkAtDNyKBQRMDrcOjPYpH3A0uZ
         9fi1N9FgXBgRbM9GmFMyE7qGQXSYvSUUkFrMVSpDr3Eu3ZMVXMzmI6mUj7wRxarNZ00f
         HmlzW7AbjnG5MpsmsKY9mZtzpF3x9jBfWUQNZ3vmGHDtzRJD1wRWaopLqtIxk0hP2c4S
         Pazwypo+G29HlWfWCBFEyMnxqPBGQJ0El4e+hLmCZ83IAad39komKTcl6qSrR3JgNu++
         OPAw==
X-Gm-Message-State: AAQBX9cAZE6cINKNJMOPW9sfQlmJ4S0ewTKkDUhneVTodMZIXhhR2ZBa
        wuOsEgyLnldJdOs4LyHWR/1FKbGdISoVQG+W3ak2jw==
X-Google-Smtp-Source: AKy350Y68zZjWdPdSC6TpDMd7z4/NcQ7/qcne2yDz4AxGzEmekWkM42mEM6MlU1Eb30cHq26JDtT+nSbORqAIO55DgA=
X-Received: by 2002:aa7:d81a:0:b0:504:98f1:464c with SMTP id
 v26-20020aa7d81a000000b0050498f1464cmr5176775edq.23.1682090865240; Fri, 21
 Apr 2023 08:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230406130205.49996-2-kal.conley@dectris.com>
 <87sfdckgaa.fsf@toke.dk> <ZDBEng1KEEG5lOA6@boxer> <CAHApi-nuD7iSY7fGPeMYiNf8YX3dG27tJx1=n8b_i=ZQdZGZbw@mail.gmail.com>
 <875ya12phx.fsf@toke.dk> <CAHApi-=rMHt7uR8Sw1Vw+MHDrtkyt=jSvTvwz8XKV7SEb01CmQ@mail.gmail.com>
 <87ile011kz.fsf@toke.dk> <CAHApi-=ODe-WtJ=m6bycQhKoQxb+kk2Yk9Fx5SgBsWUuWT_u-A@mail.gmail.com>
 <874jpdwl45.fsf@toke.dk> <CAHApi-kcaMRPj4mEPs87_4Z6iO5qEpzOOcbVza7vxURqCtpz=Q@mail.gmail.com>
 <ZEJZYa8WT6A9VpOJ@boxer>
In-Reply-To: <ZEJZYa8WT6A9VpOJ@boxer>
From:   Kal Cutter Conley <kal.conley@dectris.com>
Date:   Fri, 21 Apr 2023 17:27:33 +0200
Message-ID: <CAHApi-ngO=hYTL449hUuV_b4mAa4NVS6eE5Uya1dZM6fEE7rPA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/3] xsk: Support UMEM chunk_size > PAGE_SIZE
To:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
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

> Here is the comparison between multi-buffer and jumbo frames that I did
> for ZC ice driver. Configured MTU was 8192 as this is the frame size for
> aligned mode when working with huge pages. I am presenting plain numbers
> over here from xdpsock.
>
> Mbuf, packet size = 8192 - XDP_PACKET_HEADROOM
> 885,705pps - rxdrop frame_size=4096
> 806,307pps - l2fwd frame_size=4096
> 877,989pps - rxdrop frame_size=2048
> 773,331pps - l2fwd frame_size=2048
>
> Jumbo, packet size = 8192 - XDP_PACKET_HEADROOM
> 893,530pps - rxdrop frame_size=8192
> 841,860pps - l2fwd frame_size=8192

Thanks so much for sharing these initial results! Do you have similar
measurements for ~9000 byte packets in unaligned mode? We typically
receive packets larger than 8192 bytes.

>
> Kal might say that multi-buffer numbers are imaginary as these patches
> were never shown to the public ;) but now that we have extensive test
> suite I am fixing some last issues that stand out, so we are asking for
> some more patience over here... overall i was expecting that they will be
> much worse when compared to jumbo frames, but then again i believe this
> implementation is not ideal and can be improved. Nevertheless, jumbo
> frames support has its value.

You made me chuckle ;-) Any measurements people can provide are
helpful, even if they must be taken with a grain of salt. ;-). How
much of your test suite can be upstreamed in the future? My assumption
was the difference should be measurable, at least you have confirmed
that. :-)
