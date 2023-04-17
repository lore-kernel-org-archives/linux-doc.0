Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED2FDC77B70
	for <linux-doc@archiver.kernel.org>; Mon, 17 Apr 2023 13:42:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbjDQNmJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Apr 2023 09:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230361AbjDQNmI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Apr 2023 09:42:08 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40AE726B8
        for <linux-doc@vger.kernel.org>; Mon, 17 Apr 2023 06:42:06 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-94f0dd117dcso125098166b.3
        for <linux-doc@vger.kernel.org>; Mon, 17 Apr 2023 06:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dectris.com; s=google; t=1681738925; x=1684330925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t7q804lvwVfzVDb04S7d3arCFTMYVaFz/3CbX2I4M+g=;
        b=rnbVBStC6EyvqwwVd3MmrDih9bmXFs4k+lMdQS7lR4igC+A5ijrj2HVBPN34yuqa5S
         59bgEV2LQzlAyX9kBzXaTAiYihWxteNxFDD/2vpo63SwOmI8JhBwiHhvi7+9SnnQU7vf
         ZZer9zNrWaFGjejMy6QJaT7rwWfWzwa/W1Xhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681738925; x=1684330925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7q804lvwVfzVDb04S7d3arCFTMYVaFz/3CbX2I4M+g=;
        b=T40QVzhHFJ2QajREKfsIjkjLRE1j2v7T4fGWIXj9uKEH8pinsAyP5mg5Ib5iucfrod
         Az3lUr3TO5LvMf4BaFgShTCJ7S/rpmhBDzDzIkBhP0NifqLVTP/+meTxOzbEOCovjjvs
         zGYDB5pLbaMR1G8BW8QHV4PtSIU24XurXbjAs2HZDSaCg3Csyo3K69vb/Pvcqc6hjBoB
         2aQ4xfA6ZMGp2ZnC5qFiCm5W/szO3921vCaSa6cJQrg0/zWIAuKoPr+b/Rm7uXjgoI+I
         Kv2PmL44AtGuLJHoSoLRev/QDiKK/MPX6ZZfx4xTxaMM5t7Vr52cC+HXZRj0TkpG/Gk9
         JF+w==
X-Gm-Message-State: AAQBX9fdjqf2VazUlsc6gcdzvJltWWie20im+boZwCS0MDgkrctgdIT7
        DK5V+C3usJTt0AT4cQGPXlPQjHbNq2bNCDoClAR/Ig==
X-Google-Smtp-Source: AKy350Zg3QLHvnw/95Q6vTliZqLHidyDkByatnyFjttjBqUdRRoocqimA7oznXx8BAS5QIBs7O/4aw1cWeaH5bWr/TA=
X-Received: by 2002:a50:9f88:0:b0:4fb:7e7a:ebf1 with SMTP id
 c8-20020a509f88000000b004fb7e7aebf1mr7231823edf.6.1681738922075; Mon, 17 Apr
 2023 06:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230406130205.49996-1-kal.conley@dectris.com>
 <20230406130205.49996-2-kal.conley@dectris.com> <87sfdckgaa.fsf@toke.dk>
 <ZDBEng1KEEG5lOA6@boxer> <CAHApi-nuD7iSY7fGPeMYiNf8YX3dG27tJx1=n8b_i=ZQdZGZbw@mail.gmail.com>
 <875ya12phx.fsf@toke.dk> <CAHApi-=rMHt7uR8Sw1Vw+MHDrtkyt=jSvTvwz8XKV7SEb01CmQ@mail.gmail.com>
 <87ile011kz.fsf@toke.dk> <CAHApi-m4gu8SX_1rBtUwrw+1-Q3ERFEX-HPMcwcCK1OceirwuA@mail.gmail.com>
 <87o7nrzeww.fsf@toke.dk> <CAJ8uoz3Rts2Xfhqq+0cm3GES=dMb2hTqPzGm515oG_nmt=-Nbg@mail.gmail.com>
 <87o7nmwul7.fsf@toke.dk>
In-Reply-To: <87o7nmwul7.fsf@toke.dk>
From:   Kal Cutter Conley <kal.conley@dectris.com>
Date:   Mon, 17 Apr 2023 15:46:46 +0200
Message-ID: <CAHApi-nSpUSVjeAX=UQEYGd2=H+DJ+xQYPvP8yQMuosGq22-Vg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/3] xsk: Support UMEM chunk_size > PAGE_SIZE
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     Magnus Karlsson <magnus.karlsson@gmail.com>,
        Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
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

> > We will measure it and get back to you. Would be good with some
> > numbers.
>
> Sounds good, thanks! :)
>
> -Toke
>

+1. Thanks a lot for doing this! :-)
