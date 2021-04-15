Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8AD5C433ED
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 01:58:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0639611B0
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 01:58:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbhDOB6r (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Apr 2021 21:58:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbhDOB6q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Apr 2021 21:58:46 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49DC2C061574
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 18:58:23 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id m9so8918093wrx.3
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 18:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qGp4HS6MFLyo7obrUsQoLI+ur/Yjjo7asltLzUbmbDU=;
        b=jsUSTtbPOz33tafFgw5WUAqz6ro3Fc+HpK+j1owCdtY/3NXOxtTHk+U6FLzsp3uMfT
         XX1dlcarvqqAo/P5fb4XnqSfJ8MMygbcmWt6TDBEe++Edi6WD9a2u0WqFjCtNH1jfwqH
         BnnPQyHijC8/aIQXI/OYYTOaqYAVlBjbmsqZNrZa493KQRYIKrNedws5b1wFLGQBCzbG
         PLqTnPShVtjO77Qv2G9sp5gVZ71ceClFDQ57kU5CP4vE/lOgOxO/wW9Q8OhgZGvGs6Wp
         ZQf7choBt5z63goT5M9C3sdwnSqigQtiSklmkKdXURQEp2eMszwDaiVbObSVcdwRnPGH
         m0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qGp4HS6MFLyo7obrUsQoLI+ur/Yjjo7asltLzUbmbDU=;
        b=Ko+eeXoeaRsjpcVYN7JTD+RRpn3KcMuBPgK61gjxy42Ih0tfM52qQJBTe5YlbfBhi7
         Ti4jlO0comz5EJNdNCVVmuWTlnQwQiMQwORQBKz/G8KUesrOBDFuGekUCIw5BoB+V5et
         tft1GMFCGT+DNxs1FI3dzwqo3Dx7ZhcqMQQO3J3l0TxTJgpEyNo4OTyrylR+3FRK+Fy5
         5GRypfryymC56VGmsjz6bX6nPameBMEwVJErKkAeoAKOR4pZ/t2F/PF3c91TZ8mq0p2p
         fBCD9eIlBj3AcqRbgttslJfG6GZ2WdEUCHRctz+NLxQhdTMZozkI2z2mtPLvpODF622K
         EhUw==
X-Gm-Message-State: AOAM533wv3VTiSI2DXsBw7eNueYeqAPJbwL5C/zQ7dPghpKCs84hw0WZ
        RfC/c4OB8vIEpPVcLKP5kt7+/Xj8kQoqXBeS24j1BtUlnzAtkits
X-Google-Smtp-Source: ABdhPJzOYQSdpMFjiD7KgmBeSUzeOoZ6EZZ8dT4qkbjwVnDQ6bx6OKUzrM9vlJTgYyRE8pcqaF8hVIBHjjwefih5M0U=
X-Received: by 2002:a5d:4707:: with SMTP id y7mr777556wrq.396.1618451902083;
 Wed, 14 Apr 2021 18:58:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210415013124.2256416-1-siyanteng@loongson.cn>
In-Reply-To: <20210415013124.2256416-1-siyanteng@loongson.cn>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Thu, 15 Apr 2021 09:58:11 +0800
Message-ID: <CAEensMysF7Cmq6Tzcu8n1Xw2ctdpaEpGhZ8jyvY4sEZtyToAPw@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] docs/zh_CN: add core api and openrisc translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>,
        Wu XiangCheng <bobwxc@email.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all,

I did a lot of tests with my mailbox last night and couldn't find the
reason. Now that I've found it, patch 7 and patch 11 names are
repeated; I should split into two series to send; and finally, I'm
really sorry for wasting mailing list resources to test. T_T

Thanks,

Yanteng

Yanteng Si <siyanteng@loongson.cn> =E4=BA=8E2021=E5=B9=B44=E6=9C=8815=E6=97=
=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=889:30=E5=86=99=E9=81=93=EF=BC=9A
>
> This series of patches translates core-api/irq/* and openrisc/* into
> Chinese
>
> v1 -> v2:
>
> Modify some words under Xiangcheng Wu's suggestion. Thanks for his rewiew=
!
>
> v2 -> v3:
>
> keep the signs number equal to the title char under Alex's suggestion.
> Thanks for his rewiew!
>
> v3 -> v4:
>
> Add Xiangcheng Wu's review sign to 0002=E3=80=810003 and 0008; Thanks for=
 his rewiew!
>
>
> Yanteng Si(11):
> docs/zh_CN: add core-api irq concepts.rst translation
> docs/zh_CN: add core-api irq irq-affinity.rst translation
> docs/zh_CN: add core-api irq irq-domain.rst translation
> docs/zh_CN: add core-api irq irqflags-tracing.rst
> docs/zh_CN: add core-api irq index.rst translation
> docs/zh_CN: add core-api index.rst translation
> docs/zh_CN: add translation to zh_CN index
> docs/zh_CN: add openrisc openrisc_port.rst translation
> docs/zh_CN: add openrisc todo.rst translation
> docs/zh_CN: add openrisc index.rst translation
> docs/zh_CN: add translation to zh_CN index
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
> Documentation/translations/zh_CN/core-api/index.rst                     |=
 126 ++++++++++++++
> Documentation/translations/zh_CN/core-api/irq/concepts.rst              |=
 24  ++++++++++++++
> Documentation/translations/zh_CN/core-api/irq/index.rst                 |=
 19  ++++++++++++++
> Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst          |=
 76  ++++++++++++++
> Documentation/translations/zh_CN/core-api/irq/irq-domain.rst            |=
 228 ++++++++++++++
> Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst      |=
 45  ++++++++++++++
> Documentation/translations/zh_CN/index.rst                              |=
 2   ++++++++++++++
> Documentation/translations/zh_CN/openrisc/index.rst                     |=
 27  ++++++++++++++
> Documentation/translations/zh_CN/openrisc/openrisc_port.rst             |=
 124 ++++++++++++++
> Documentation/translations/zh_CN/openrisc/todo.rst                      |=
 20  ++++++++++++++
> 10 files changed, 691 insertions(+)
>
