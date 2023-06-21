Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2EFEEB64D7
	for <linux-doc@archiver.kernel.org>; Wed, 21 Jun 2023 18:34:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbjFUSeU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Jun 2023 14:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbjFUSeT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Jun 2023 14:34:19 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B9A1997
        for <linux-doc@vger.kernel.org>; Wed, 21 Jun 2023 11:34:03 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9786fc23505so753898066b.2
        for <linux-doc@vger.kernel.org>; Wed, 21 Jun 2023 11:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687372441; x=1689964441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkTkg0yk5G+m/3RuQi582p9no07noJpOVWR1uVt2QJ8=;
        b=jhU2qXV7zgZAHlPuzJt9roWj9xYxOAu1wdHns/nRruICat6vZgD6g7WT66fmeD7eJC
         SYrdE5LfxQViiL6lSz4LSuSIoJr9/06WPjE8nkVTCvYQbI7uT6RcV3QmKgya8iN2QkVD
         ddp8ZNe0TBekwvv68uje4kaxI8i10czLrcDvDhsRwfiKW950/CS5k07O93fwZNlyieBo
         L4DAIRaspsoyTxggLGA5y651H1fMcenqDEg44Ab00oou5Iy3ni91xvXPrZiGTaVBfrad
         B/bhazmIbrfha7bOoi56i8PYPVUf2uMiHfQ17gYuCwaWR3Y1C64AIx92fJ6PXll7A4Ym
         gTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687372441; x=1689964441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MkTkg0yk5G+m/3RuQi582p9no07noJpOVWR1uVt2QJ8=;
        b=SodfdSS1TsU20+LVecZWrTGf6CsFwncN1gMOP6JMgkCMRwtbaIWHQMwNbec5dBRGyB
         mhvzCMf4ZU7LAHdip4afzQOmKpJjD7zqbi1GW7ctWGT6BSweUbJZesZzJWNYEwVWzQhF
         42AFWrFUzfPkDWd4VOthg2Bs8q/15UbH1iPapm7QEiwAeVM/O3csn6xFkgiAopmsw0ah
         KaJ+uBK5mqd6Zk1flanCoDPFfiRgJZfEb2A3iIfkC81Am5Jw54fBSOODW1L8E955HTeO
         8J/sFx6XcKXL+qiqmpGnj8obihBNN7eZwMdhNDLK6G7b9Dl8/lk/f+HxLZVQOT05PHjY
         ZYyw==
X-Gm-Message-State: AC+VfDycxCCeyZyEMCeXkfdd+tSwu3+NAD5iAN6T8L0rnaT1yp8eMRkx
        9TcPQI5/RkDXkkEWNG5Ret9knjb53mGVsAWvt4ruc41/8oVM2V2xlvw=
X-Google-Smtp-Source: ACHHUZ56mWPIZN9zRu60o7GkY+dtcQe/JAx8qk37vaGZg5yLb4G/foH80j+heYxIq88Od3vZR0/ZK5nlyTE1OnKvpwg=
X-Received: by 2002:a17:907:3e92:b0:988:7cdb:943a with SMTP id
 hs18-20020a1709073e9200b009887cdb943amr11674209ejc.30.1687372441404; Wed, 21
 Jun 2023 11:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230618000856.1714902-1-mizhang@google.com> <20230619120051.00001f0f.zhi.wang.linux@gmail.com>
In-Reply-To: <20230619120051.00001f0f.zhi.wang.linux@gmail.com>
From:   Mingwei Zhang <mizhang@google.com>
Date:   Wed, 21 Jun 2023 11:33:25 -0700
Message-ID: <CAL715WKF8Ws1E0UNvRNQ7ZqisrFD6srC3o24g8FU=f=f0YwUKw@mail.gmail.com>
Subject: Re: [PATCH 0/6] KVM: Documentation: Update document description for
 kvm_mmu_page and kvm_mmu_page_role
To:     Zhi Wang <zhi.wang.linux@gmail.com>
Cc:     Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jim Mattson <jmattson@google.com>,
        David Matlack <dmatlack@google.com>,
        Ben Gardon <bgardon@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 19, 2023 at 2:00=E2=80=AFAM Zhi Wang <zhi.wang.linux@gmail.com>=
 wrote:
>
> On Sun, 18 Jun 2023 00:08:50 +0000
> Mingwei Zhang <mizhang@google.com> wrote:
>
> > When reading the KVM MMU documentation for nested virtualization, I fee=
l
> > that the description of kvm_mmu_page (and kvm_mmu_page_role) has been
> > lagging for around 1-2 years. The descriptions for several fields in st=
ruct
> > kvm_mmu_page and struct kvm_mmu_page_role are missing. So I think it mi=
ght
> > be good to add them to make it consistent with the current code.
> >
>
> This is so nice. A trivial comment, maybe refining the tittle of PATCH 1-=
6 a
> bit: "Add the missing comment of xxxx into xxxx". It is a little bit conf=
using
> by just looking at the titles at the first glance, more like some members=
 are
> missing, not the comments. :)
>

Sure. Yeah, the shortlog looks slightly confusing as if I am changing
the actual data structures. I will update those in the next version.
Thanks for your comments.

-Mingwei
