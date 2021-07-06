Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88360C07E9C
	for <linux-doc@archiver.kernel.org>; Tue,  6 Jul 2021 12:47:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E71861C94
	for <linux-doc@archiver.kernel.org>; Tue,  6 Jul 2021 12:47:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234583AbhGFMtr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Jul 2021 08:49:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238514AbhGFMtN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Jul 2021 08:49:13 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0BE5C061766
        for <linux-doc@vger.kernel.org>; Tue,  6 Jul 2021 05:45:59 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id t3so24393230oic.5
        for <linux-doc@vger.kernel.org>; Tue, 06 Jul 2021 05:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sKoYGhccpr3ha76Fc6eXRfMyV0be+WiivcV3bduHYaU=;
        b=MK1A8td6+sapXFecatt6iLVxGL5f3sd0YDtfjbfWFKg3Im1/nOJqWTZ7Er03cNaXBO
         BHRo7CTcyKtW8qK9LVrneM2QcUqfsKlMmR5mqkEJXBFXEmRdvxPo1MVvpkM9SRiice84
         jrZdqk6xulHNMaJnliWotsRpa4ApOh52veSPphMh13YK1z+amsHNHsXtISUdGVRDml2N
         SyISF3vxmHxcLpFtmnrD6EqR9eSxoF758Bi/7yW+XwkONx+oUjgemhJ7fU7wdNcLO/wc
         Wo0wWLXnMnCiAfPN9ISJFOATRFsEstVaeASVtE32W2iROFbFmxiXd25CQ2kP0/jTKXOu
         43/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sKoYGhccpr3ha76Fc6eXRfMyV0be+WiivcV3bduHYaU=;
        b=h2IKSkW3UuS6Q2+yIdwiwAE1QCVKkatbZVPW85GradBuvSSKsVoAyT3NMijWOksnPG
         gTxc7AVFz9LmICB8SWlMViocMUiB+taRmjYSrit4PyRD5cgfxlcYUk/p2+4Jq5FUUiYO
         jthbJLXKjjGqFbVtdGaklqUO76BrFx0Bw0pGGFWXHNMLAJSVqeHMlQekjvCl6PMRMNUx
         z1Wg8mZgdepo0qGznbjKP75clTTz95cyp3u7z1hjGZLVdEjf2wnODIDemn265N6BNH1Q
         NbZqrBeMZDamMTrdR6a2bu9gx39V/7F9X35EABwd6ZY6GweT4BDVv3YowYnK2b8+uC93
         sNdQ==
X-Gm-Message-State: AOAM531eUWoJ7/8DRyRnlZC6P2lOAjdBBE1Xhknx6mwMu1BnZ8T2I/Db
        B1aoMD9bxaot4y5afKibjw2A/YdFlW0dC2Kl5S4=
X-Google-Smtp-Source: ABdhPJyi5cvPzjQi5L0muQJj7TDTxKayiC0e1qQm4GjLyBo/vxsd8TNpy+h8HQTq8BffE3epQ5dPhO6RKwKghcpcGmQ=
X-Received: by 2002:aca:b3c3:: with SMTP id c186mr306203oif.37.1625575559120;
 Tue, 06 Jul 2021 05:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1625048200.git.siyanteng@loongson.cn> <a2cbbe2eb022b41943008825ebf18858c50636e9.1625048200.git.siyanteng@loongson.cn>
 <a148801f-4a2b-24ff-e6b3-ca2171127e83@gmail.com>
In-Reply-To: <a148801f-4a2b-24ff-e6b3-ca2171127e83@gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Tue, 6 Jul 2021 20:45:50 +0800
Message-ID: <CAEensMwVjvdgRBgOMjpuh8VR0+atrU1gfWBhdXiOWyyqKWk65Q@mail.gmail.com>
Subject: Re: [PATCH 2/6] docs/zh_CN: add core-api unaligned-memory-access translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Wu XiangCheng <bobwxc@email.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

QWxleCBTaGkgPHNlYWtlZWxAZ21haWwuY29tPiDkuo4yMDIx5bm0N+aciDXml6XlkajkuIAg5LiL
5Y2IOToxN+WGmemBk++8mg0KPg0KPg0KPg0KPiBPbiA2LzMwLzIxIDY6MjMgUE0sIFlhbnRlbmcg
U2kgd3JvdGU6DQo+ID4g5LiK5omA6L+w77yM5L2g5Y+v6IO96YGH5Yiw6Z2e5a+56b2Q6K6/6Zeu
6Zeu6aKY55qE5Lik56eN5Li76KaB5oOF5Ya15YyF5ousOg0KPiA+ICsNCj4gPiArIDEuIOWwhuWP
mOmHj+WumuS5ieS4jeWQjOmVv+W6pueahOexu+Weiw0KPiA+ICsgMi4g5oyH6ZKI566X5pyv5ZCO
5Y+v6K6/6Zeu6Iez5bCRMuS4quWtl+iKgueahOaVsOaNrg0KPg0KPiDmjIfpkojov5DnrpflkI7o
rr/pl67oh7PlsJEy5Liq5a2X6IqC55qE5pWw5o2uPw0KZ3JlYXQhDQoNClRoYW5rcywNCg0KWWFu
dGVuZw0K
