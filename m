Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 199C9E71094
	for <linux-doc@archiver.kernel.org>; Thu, 21 Sep 2023 17:01:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbjIURBJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Sep 2023 13:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjIURAs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Sep 2023 13:00:48 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 524E4AC
        for <linux-doc@vger.kernel.org>; Thu, 21 Sep 2023 09:59:40 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-34fcc39fae1so3475ab.0
        for <linux-doc@vger.kernel.org>; Thu, 21 Sep 2023 09:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695315571; x=1695920371; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2u6FN1SftgW++v8P+zRdQ8M7vk5MQi7XZAYI++8wbU=;
        b=c2H/NCs2TszdloVAB+vYTc+ev5QGA5naUxumUpOp7nWQZNw96PdJo6LmYSJGDpQ4XK
         W4HEK7yOyZ9lQ3g7Adfvz4EKisxrwqJRnO0yYr9pu+22zwC9mzObWAtt4zrLD+kqfNoO
         wHecHCql4LlHFPEv/IfbHmXTvPRTO4Kx9ljc3b/Yyi4klr6sGqhryB8KEANRpaim+Kgw
         AbzHFfdaBKAqBZSU+LFLKyOZBydakPAiclewhVASD0AEtbquueq6B8ALJbnvMJAfq4KT
         8/3VtUVwI0+xV3BDb8/w8nr3xTHl2FDXs3PWfK7GKHwk15emIY8JtxL6kfEo/1UYPUeR
         euhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695315571; x=1695920371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2u6FN1SftgW++v8P+zRdQ8M7vk5MQi7XZAYI++8wbU=;
        b=OZB1tot3q0GJDtlCUDUj55NNv4is9Ra11fApfpanOvAT4S0GW9AZAPVPaK50njsgvX
         Fh3/IssZ9L/X0t7NG30y+sBSbdQ+EPEOmpnILmiq/XDRHoq+13ZBUL0v0Ig3TGRo00LL
         pzFvNt0qM5oY5GDxyadG420gOKtdlF6LCZhDWc/amE5O7stNqW52NAc7chtJNgrEvCRH
         du5yug2n3CxbrYOzBO+O1GV3pq51qv3yY6G1YxBZG8p9+ysprIP1OhMmxMj6//Ut8muU
         W/+I9x8PVDRpEhjvoZfecJ6A+Oswz1hnJUxZ2aqEuEcHqu5n+RhbFwBSPUALTAOFPEQA
         ANcA==
X-Gm-Message-State: AOJu0YwVRRpTIpoA/o4bm0R4KaNV3OHjy4XfJfvpBP6VsedEe9TA0o9A
        h5fBO7xpJdxGdDQKkXbEBTs4jf6SASCjaMKR+gnvjpz5pozym1vzJzc=
X-Google-Smtp-Source: AGHT+IFV3vDWa7KdA0yQL7JHzFNdXvAQ2asrdok6dafCPy1rMKmY7RBvf74useO0LezTQyngHc30DzRXhMIB/7XbWKw=
X-Received: by 2002:a05:622a:290:b0:416:6784:bd60 with SMTP id
 z16-20020a05622a029000b004166784bd60mr271347qtw.21.1695314980488; Thu, 21 Sep
 2023 09:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230918190027.613430-1-dima@arista.com>
In-Reply-To: <20230918190027.613430-1-dima@arista.com>
From:   Eric Dumazet <edumazet@google.com>
Date:   Thu, 21 Sep 2023 18:49:29 +0200
Message-ID: <CANn89iKp4LnpQ6fpTYc==ixqTNQgndBmOzj7w-_GN0hOfZyppQ@mail.gmail.com>
Subject: Re: [PATCH v12 net-next 00/23] net/tcp: Add TCP-AO support
To:     Dmitry Safonov <dima@arista.com>
Cc:     David Ahern <dsahern@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-kernel@vger.kernel.org,
        Andy Lutomirski <luto@amacapital.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Bob Gilligan <gilligan@arista.com>,
        Dan Carpenter <error27@gmail.com>,
        David Laight <David.Laight@aculab.com>,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        Donald Cassidy <dcassidy@redhat.com>,
        Eric Biggers <ebiggers@kernel.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Francesco Ruggeri <fruggeri05@gmail.com>,
        "Gaillardetz, Dominik" <dgaillar@ciena.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        Ivan Delalande <colona@arista.com>,
        Leonard Crestez <cdleonard@gmail.com>,
        "Nassiri, Mohammad" <mnassiri@ciena.com>,
        Salam Noureddine <noureddine@arista.com>,
        Simon Horman <simon.horman@corigine.com>,
        "Tetreault, Francois" <ftetreau@ciena.com>, netdev@vger.kernel.org,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 18, 2023 at 9:00=E2=80=AFPM Dmitry Safonov <dima@arista.com> wr=
ote:
>
> Hi,
>
> This is version 12 of TCP-AO support. The changes from v11 address
> Eric's review comments. The biggest change was defining a common
> (struct tcp_key) that merges tcp_ao_key with tcp_md5sig_key on TCP
> fast-path, therefore in order to help reviewing I provide
> the ranged-diff between the versions here:
>
>    https://gist.github.com/0x7f454c46/fe546b9cf323ca21acc3d0eabbd41236
>
> There's one Sparse warning introduced by tcp_sigpool_start():
> __cond_acquires() seems to currently being broken. I've described
> the reasoning for it on v9 cover letter. Also, checkpatch.pl warnings
> were addressed, but yet I've left the ones that are more personal
> preferences (i.e. 80 columns limit). Please, ping me if you have
> a strong feeling about one of them.
>
> The following changes since commit a5ea26536e89d04485aa9e1c8f60ba11dfc546=
9e:
>
>   Merge branch 'stmmac-devvm_stmmac_probe_config_dt-conversion' (2023-09-=
18 12:44:36 +0100)

Sorry for the delay, but I was looking at a bug in TCP MD5.

I will ask you to fix it, before we change everything in the stack
related to MD5 :/

I am releasing a syzbot report right now, I will CC you on it.
