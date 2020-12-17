Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE589C4361B
	for <linux-doc@archiver.kernel.org>; Thu, 17 Dec 2020 21:30:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7513923A51
	for <linux-doc@archiver.kernel.org>; Thu, 17 Dec 2020 21:30:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbgLQVaO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Dec 2020 16:30:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbgLQVaN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Dec 2020 16:30:13 -0500
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9166FC061794
        for <linux-doc@vger.kernel.org>; Thu, 17 Dec 2020 13:29:33 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id x26so271941vsq.1
        for <linux-doc@vger.kernel.org>; Thu, 17 Dec 2020 13:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=urAPcSZI0AoxV640vCzvFnC8SN1UrtzLHnxgpBxd1pM=;
        b=r9UT9t38JUuZdqamQnu/y5XIuGAOfcGFq0OYmGBBVEMkSphsxKepRxZRSQcmPmDZh+
         vvvfi+BmN0AFkHEgjRIQDXJdTjK4XHyPDC2zm0NtCfH8EkknSsOIUrlcaNzw8CbLCs4I
         8/2/+j9+vYK7q6kZiUAigTC4UObyW7dqO3Uj0jUMk+IdWuy6sDMaQrJO+l8ggxS+nVzY
         5luNtNIvzN7oFlhIM6l+Sey8mRuI6HUMSxRaGLcAsw2eU21Hcaz05ETKv1CcTAwSLUa0
         Qq1yR78NgmSuuc0ONk0PcxrO1+cpOIp6umMgPykCXA60vFgEA4O+CGPcTb5lAuVU8EdP
         4+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=urAPcSZI0AoxV640vCzvFnC8SN1UrtzLHnxgpBxd1pM=;
        b=YNjr+gGzjs4kKWZ/F9PtJJxojdEHZux8uTXFycr4Qc78KPXzGVC+RPDKx4loGBgVQE
         r/ro1CVlg0AxK8lbq6zyF1cmWGeDUiMhuRs2VFMMf7hirlSAFBI0A1JGbjDkeZn0yUEW
         1IoCsuzhFeplz180kIwwNMNSC6IB+Nbvm1DVLsRUIEYPe9vNlcyHMFTH9aHAXCacWCDT
         kOGyuK2RN+DDhsvvmH5GJDeE5R//boUnXGm5Jwx3rSuDvnJ31Wn6u7m8dZtoT7lr1UQ4
         ePBLYFB+0hBdwq3I/2bCyr8dzU21JACslPcUcqqNNt1SrjEs6zeV2lpdg9E85jhiFz+6
         mPAg==
X-Gm-Message-State: AOAM532ZCDHS7vElOBfumTICFoyRbwpZ4N10JO8pPyULgE4zhhN8+elS
        Sf3g0SEpaZZFyLVOMuQeHm494vUPy/g=
X-Google-Smtp-Source: ABdhPJz236KPqxm8SLuOl0srrFiOwnJFuvZdKOnanDHBm6WUPXQgcusFGwxxyS2Z69CHEjkTijrPkQ==
X-Received: by 2002:a67:f915:: with SMTP id t21mr1389584vsq.55.1608240572289;
        Thu, 17 Dec 2020 13:29:32 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id t127sm972520vka.3.2020.12.17.13.29.30
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Dec 2020 13:29:31 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id 73so125985uac.8
        for <linux-doc@vger.kernel.org>; Thu, 17 Dec 2020 13:29:30 -0800 (PST)
X-Received: by 2002:a9f:2356:: with SMTP id 80mr1166550uae.92.1608240570490;
 Thu, 17 Dec 2020 13:29:30 -0800 (PST)
MIME-Version: 1.0
References: <425a2567dbf8ece01fb54fbb43ceee7b2eab9d05.1608051077.git.baruch@tkos.co.il>
 <1fc59ef61e324a969071ea537ccc2856adee3c5b.1608051077.git.baruch@tkos.co.il> <20201217102037.6f5ceee9@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201217102037.6f5ceee9@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From:   Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date:   Thu, 17 Dec 2020 16:28:54 -0500
X-Gmail-Original-Message-ID: <CA+FuTScTEthUW=s+5_jnnHj4SQeFr0=HsgwVeNegNOaCNQ+C=Q@mail.gmail.com>
Message-ID: <CA+FuTScTEthUW=s+5_jnnHj4SQeFr0=HsgwVeNegNOaCNQ+C=Q@mail.gmail.com>
Subject: Re: [PATCH net 2/2] docs: networking: packet_mmap: don't mention PACKET_MMAP
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Baruch Siach <baruch@tkos.co.il>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Network Development <netdev@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        =?UTF-8?Q?Ulisses_Alonso_Camar=C3=B3?= <uaca@alumni.uv.es>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 17, 2020 at 2:48 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Tue, 15 Dec 2020 18:51:17 +0200 Baruch Siach wrote:
> > Before commit 889b8f964f2f ("packet: Kill CONFIG_PACKET_MMAP.") there
> > used to be a CONFIG_PACKET_MMAP config symbol that depended on
> > CONFIG_PACKET. The text still refers to PACKET_MMAP as the name of this
> > feature, implying that it can be disabled. Another naming variant is
> > "Packet MMAP".
> >
> > Use "PACKET mmap()" everywhere to unify the terminology. Rephrase the
> > text the implied mmap() feature disable option.
>
> Should we maybe say AF_PACKET mmap() ?

I don't think that the feature name PACKET_MMAP implies
CONFIG_PACKET_MMAP, or thus that the name is obsolete now that the
latter is.

If it needs a rename, the setsockopt is PACKET_[RT]X_RING. So, if this
needs updating, perhaps PACKET_RING would be suitable. Or TPACKET,
based on the version definitions.
