Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF7DEB64D7
	for <linux-doc@archiver.kernel.org>; Fri, 16 Jun 2023 18:47:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232976AbjFPSrO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Jun 2023 14:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjFPSrN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Jun 2023 14:47:13 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 007CF30FB
        for <linux-doc@vger.kernel.org>; Fri, 16 Jun 2023 11:47:09 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-33b7f217dd0so25685ab.0
        for <linux-doc@vger.kernel.org>; Fri, 16 Jun 2023 11:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686941229; x=1689533229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p89jIZgCzbOnwHuA7sfuLhrqdvGB8exXX7N1OGRHHc8=;
        b=kVCCF5WNPluWzu8HBD+SS0ENvanutUA7LAgB0DDKZis0as6cvzPNG21eq4joxcMPOH
         p1uRVS10uMxxXuR14hePkC5wbtx72B5ayjFOU6jni+rZYmq8ZLOFw/spfV8zSQTmHfI2
         TFSzWi5ng88b2ne0OSNYQRRdWsng0PA2yNrfzBVucYuDMzAdOivAqYajj0IACLZGpgQT
         0hrFXJersIszLuhLo9l1poqSpyEozusaikRQU6eiXK+kif8E6FUh8+xfcdBlLRDqaicF
         UDrdH5RkS5BSSW4Um2SfkTe0s4Otg/lrSIUFLhQinrZk08pCeFKfW7wTNQKrWuuo0EQR
         oisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686941229; x=1689533229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p89jIZgCzbOnwHuA7sfuLhrqdvGB8exXX7N1OGRHHc8=;
        b=c/9O+FvB9VS1qAjLs5SM8YRLDQoDmGQXt2adgaIRfaEaIDaf/TUsG1XmKYYMmPXY+Y
         h0n1m5yb0G6C2AbWNspGSsZs9yymv+FvrLuTUDotMk+KaXe53z8h+D1eTsOBQQbg6iv2
         d051LcjlzyohNKkn+8m/FlwWpcEHCuimg7l//HkIp0/gPfcvYqiiAfFnVPAUTzmN5niG
         0wcM9oSWC8lzdPxgDx3cgyNPrVI+Wmdu/InGcpb9KLiQ2w3joFoJTeuVvJaBYJU7fTKo
         cRskcVlWp9MGSa51rnionoSn/8CuRa7jQCE2o4G6V0x36eUy0svxvEVVIFKtzZZThqPp
         0V5w==
X-Gm-Message-State: AC+VfDyqBWvNubRGHT3DcjWjdmjZh6F1Q3x4Lb/4KSjpFIeZrwPrdDCo
        VicNazg5Ke0j6lwbr5FCnRBwwelloT/5X7ZDBix6pr30wgNuCJoqur+1eA==
X-Google-Smtp-Source: ACHHUZ7sLu99m2m3o0HYgC6yYuSCh+NZktjsyUozVgqTM3QiVParr/gnxeNExLcHeRocM6Suy4WOZ/VBp3OUmDBZTj0=
X-Received: by 2002:a05:6e02:152b:b0:33d:79ea:9556 with SMTP id
 i11-20020a056e02152b00b0033d79ea9556mr77317ilu.18.1686941229293; Fri, 16 Jun
 2023 11:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230616133735.351479-1-jordyzomer@google.com>
 <20230616133735.351479-2-jordyzomer@google.com> <ZIykXq2U5XVZ4aB+@casper.infradead.org>
In-Reply-To: <ZIykXq2U5XVZ4aB+@casper.infradead.org>
From:   Jordy Zomer <jordyzomer@google.com>
Date:   Fri, 16 Jun 2023 20:46:58 +0200
Message-ID: <CABjM8Zc8H22YVJcHvPS0rROowYC_fhAikJ_dcevA6pr1G7=mDA@mail.gmail.com>
Subject: Re: [PATCH 1/1] nospec: Add documentation for array_index_nospec
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net, dave.hansen@linux.intel.com, daniel@iogearbox.net,
        tglx@linutronix.de, rdunlap@infradead.org,
        pawan.kumar.gupta@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks both, I was planning on doing some plumbing next week to fix the
already affected calls and then add a BUILD_BUG_ON() in combination with
__builtin_constant_p() to prevent misuse from happening in the future. In
addition I'll send a V2 next week to fix the spelling/wording issue.

Cheers,

Jordy

On Fri, Jun 16, 2023 at 8:05=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Fri, Jun 16, 2023 at 01:37:35PM +0000, Jordy Zomer wrote:
> > +Please note that this function should only be used if the upper
> > +boundary is a built-time constant, otherwise this could be
> > +speculated on as well. If this is not the case please refer to
> > +barrier_nospec().
>
> "build time", not "built time".  Also, "Please note that" doesn't
> really add any value.  You can just write:
>
> This function should only be used if the upper boundary is a build-time
> constant, otherwise this could be speculated on as well.  If it is not
> a constant, use barrier_nospec() instead.
>
