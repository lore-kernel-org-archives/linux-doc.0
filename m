Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD784C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 28 Jun 2022 03:05:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243219AbiF1DFR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Jun 2022 23:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243274AbiF1DFQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Jun 2022 23:05:16 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F13CA13DE2
        for <linux-doc@vger.kernel.org>; Mon, 27 Jun 2022 20:05:06 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id t24so19940981lfr.4
        for <linux-doc@vger.kernel.org>; Mon, 27 Jun 2022 20:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wiQvY2+MRJjf07oEWrnMPw4K6AU3iPSGHB0BJ01UAyQ=;
        b=EMNE362eQq8TSTHofuRyVdwlXnqUSH2n7+A06bttU9BJPvRWONwPWGYOZRE79ZpBNx
         Ps2/tDN0gEFZ2kZJc3dJTav0VqgkCru7vQDIgRpAUlgvcNmSc4xeodfZGDR2f3YQGkgy
         Yo0/CoMACikSi8/82byD/SETOGNbelWIcQsWxcLlKP5Z79rDBpOC0OWhqXTuzk++GS6B
         bjQ2jJxc5ZemBc5zcyceCTtu4nGC46nZ7l0VeWCmxVih8oi1/M0rXbBOnWmXgPMKHVMs
         h6bNJdWrr+GfgnizALK014f+lHfOkPQQurH7BoMqQ0pSp3qAm7b45kaDScXz0Kg6/lUG
         +ZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wiQvY2+MRJjf07oEWrnMPw4K6AU3iPSGHB0BJ01UAyQ=;
        b=A562CCXnir+nzg27TiDkwF/tce1pVCR4N+yu7ZBhosU95EI73rKPGGwM/T5k8YpQRR
         /NXqOBLFqgVQf+a2mSUZHe5kddKHheMP6icIckhunynmwFLXjBoO8xGRT+9sSU0wcBm3
         cL86U41xO6UWfsTylVacibuhZjErKlO9VM+0qip03LW9NOLsA5pmZqOAsJsbc24elFYL
         5IDNLrblkluu5RZxT4l0OFFry0EDsYbPzg9POv0IHDkCYu9Ukxb80f6IiYajxuyPVvll
         qKJktAvC1rYX9PXwPLMGqkKvM0fR0ofXBQDFPb+X8jV7jcZNhshoCxApf9HNsAREXdpt
         vA7A==
X-Gm-Message-State: AJIora+NojlW/VacAY0PbkYQMvVIh9twizdOop0rko7jkPdcH09Gg+Ml
        oNJR5WbufuOA5Vgsg9TX0/E241iuWEVrI4e+lcE=
X-Google-Smtp-Source: AGRyM1sFUz0Lh1eb3kLYCNfD+ZxegrfikVAA+iTU5fcoXU4CVtmJcEqFssZl+jcMSnQIxFQ+cin+NZe8G7myNOduqdo=
X-Received: by 2002:a05:6512:3c83:b0:481:1a25:1458 with SMTP id
 h3-20020a0565123c8300b004811a251458mr5517516lfv.606.1656385504773; Mon, 27
 Jun 2022 20:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220626122210.56704-1-yizhou.tang@shopee.com>
 <20220626122210.56704-3-yizhou.tang@shopee.com> <f3ba720a-cc26-09f5-5f24-d0746eed1b64@loongson.cn>
 <CAJy-Amn1D0Q97xfCQwr9Og9e4PSSkCwNAdXejVNVWX_TrqwCaA@mail.gmail.com> <85b29345-c2a8-6a92-f03f-94cad0017f68@loongson.cn>
In-Reply-To: <85b29345-c2a8-6a92-f03f-94cad0017f68@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Tue, 28 Jun 2022 11:04:28 +0800
Message-ID: <CAJy-AmkA7u1Lc76V8R-7L1cW-gpM-8fAaYU+kMk9p-7tHjW_Hw@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs/zh_CN: Add mutex-design Chinese translation
To:     YanTeng Si <siyanteng@loongson.cn>
Cc:     yizhou.tang@shopee.com, Alex Shi <alexs@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        robin.lubin@shopee.com, huangh@sea.com, "Wu X.C." <bobwxc@email.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

PiA+PiDlr7zoh7TnmoTnvJPlrZjooYzot7Pot4PvvIhjYWNoZWxpbmUgYm91bmNpbmfvvInov5nn
p43mmILotLXnmoTlvIDplIDvvJ8NCj4gPiBCb3RoIGxvb2sgZmluZS4gYW5kIG1heSB3ZSBkb24n
dCBoYXZlIGEgYmV0dGVyIHdheSB0byByZWZsZWN0IHRoZSBmYWN0DQo+ID4gY2FjaGUgYm91bmNp
bmcgYmV0d2VlbiBjcHVzPw0KPg0KPiBob3cgYWJvdXQgY3B15qC46Ze057yT5a2Y6KGM5by56Lez
Pw0KDQpVaCwgaXMgdGhlIGZvbGxvd2luZyBiZXR0ZXI/DQrlr7zoh7TnmoQoQ1BV5qC46Ze0Kee8
k+WtmOihjOWbnuW8ue+8iGNhY2hlbGluZSBib3VuY2luZ++8iei/meenjeaYgui0teeahOW8gOmU
gA0KDQpUaGFua3MNCkFsZXgNCg==
