Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81842C433F5
	for <linux-doc@archiver.kernel.org>; Wed,  9 Mar 2022 12:48:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232873AbiCIMtZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Mar 2022 07:49:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232927AbiCIMtR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Mar 2022 07:49:17 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91AC44090D
        for <linux-doc@vger.kernel.org>; Wed,  9 Mar 2022 04:48:18 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id z7so2595766iom.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Mar 2022 04:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9Yny/Asouttihh9DpoV60/5IS5KO8S7b95jSVJPDarQ=;
        b=ABrDKUS666RrAwS56ixejEHnzAy3KO/HcYd9eukm7FEcQoAGNUDcKMW8q3rKmjBzk1
         Z58qEpGa1gh4+iUEusCV7EJG5DalH7x0502bGSmd2PsdulrG9m/2eq4iCpzowOFMUkmQ
         7zrylAo5rrDEX2YeD89Ucuw6kUQ+T4AWOcxFeytHvTqwN84x+dEHQ141T8GZvCyt8Ygu
         c2DH/GCjzqjFpp0pQlUcprv7cKjSKi0mpO/O8MNLcLqj6JAGxHflo8hZKR8t4eNDOnQa
         fmE4r/idYBFa1BCBAczcxO1z3h4oI/8FIgMDYVX0pPHkg2PbSf6+WLZT92QXQDQWntBe
         WqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9Yny/Asouttihh9DpoV60/5IS5KO8S7b95jSVJPDarQ=;
        b=ldDJ9jCoPEqGkHU4nh/rA35dOZqjag8AiR+m06ULA1BKsLsYeVuw91XbPsION8Q7QK
         EoJSsnmAx8kXf+cHamZJMDOOYiQ4LZsrT3ZYcvAIwsGIBCZiXmPISpU6MZyv8iJIk016
         GAsmH/EvwILfbOhBZQQJ5+T8aLXq0LElgAjwOsXmydlAwWrfJEAT/vAAvFzMcMsUj6tt
         FQTbolkoo9jYclIAHjcm9p+vDwse0sfOwDdkwA79UPnqMkD/jCgN43o1vT6jNWh1dX6U
         o3yFpn1esgG50aU3RqvqSisnKVE5RNP/iTGx+oqvpH60HIBxao913LjeQTH+TrCR7LkU
         cEyA==
X-Gm-Message-State: AOAM530y0yWlUCGMOSwIYe8Ll+Ak7QQ0S9LpjLw+UUNgQVHb8nV9AW1/
        6+1SSHxQ5cCHSXeGDlv2LXLIZgTr7gJXzOfiZQucepJLdisUqRan
X-Google-Smtp-Source: ABdhPJw7RvHRQBFTBKwQoX5YWaCRxE2fM1eZyLJ9vav66+Ap89aH9/MTI8zZpVhCRyf8Gw+nNmkSIY3Mfivfzs37e4k=
X-Received: by 2002:a02:928e:0:b0:317:c128:be69 with SMTP id
 b14-20020a02928e000000b00317c128be69mr13404749jah.2.1646830096581; Wed, 09
 Mar 2022 04:48:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1646723249.git.siyanteng@loongson.cn> <e3b3c0c011c0e4a719dd98dfe9cfc6e933ee2998.1646723250.git.siyanteng@loongson.cn>
 <CAJy-Amm19P9qPxqx7v-Yc+5Qwo9BkNZCecfepeD0VDiAxOfNRg@mail.gmail.com> <CAEensMxTCsiXmYgJ1B+_p=qjbZMhmSeLChUtJR+ROy1jN624Bw@mail.gmail.com>
In-Reply-To: <CAEensMxTCsiXmYgJ1B+_p=qjbZMhmSeLChUtJR+ROy1jN624Bw@mail.gmail.com>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 9 Mar 2022 20:47:40 +0800
Message-ID: <CAJy-AmmpEiP1MWCdJdzU_TXrkeZaDCSdasQ91PJr4rbESwQoSw@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] docs/zh_CN: add damon reclaim translation
To:     yanteng si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 9, 2022 at 5:11 PM yanteng si <siyanteng01@gmail.com> wrote:
> > > +=E5=90=AF=E7=94=A8
> >
> > as a parameter, better to use original word: enabled?
> OK=EF=BC=8CEnable.

Hi Yanteng,

The word in original doc is: 'enabled', not 'Enable'. :)

Thanks
