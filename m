Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 243DAC4338F
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 14:39:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF5DF60EB6
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 14:39:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235310AbhGWN60 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Jul 2021 09:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235380AbhGWN6V (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Jul 2021 09:58:21 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9255AC061760
        for <linux-doc@vger.kernel.org>; Fri, 23 Jul 2021 07:38:54 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id h9so1961450ljq.8
        for <linux-doc@vger.kernel.org>; Fri, 23 Jul 2021 07:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sBMlZo2NEl/gxSzw8IHzbfdpOczdi1Ixw5O5Fimdx2w=;
        b=yPxQzoAsDhSCds/T7hkjlevgxkcy89/Pzg7nGdpSquh5BI/L0e6OnIguLz0fXOdOWH
         ynHLOmqMAYw4CxOTdYRrMFLEDCk0qztAMfMxfytNscxr6JCfHXJ5PnffC+dfd5BBQlhM
         p7WcK/sK+DEVm/zeqZITFhMioToa0vVnNfxDdZkXj3n9fYnKyH4cZ1fG+PxxOkr+SaeY
         53jvdco8QfG73Dqhhg7817XCBE5hLwzvdhGjbrWES9P+KISsUdkcRrhByE0G4jKJaVFe
         pZYYkKI7/3/1Q1cSdNrbneLkaIDiltXmSFWMHUny3BVkf1OeyT3VSJzyzPh0yM9i9fhM
         dzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sBMlZo2NEl/gxSzw8IHzbfdpOczdi1Ixw5O5Fimdx2w=;
        b=cQfa2KnNYscOUnfiJYaJFlAskf/ikqaEt9OWPYEHBNVM6LPpSESuTwgpZnE1NXpZXu
         SNalQ6A014P2+U/KEzi101KsLv4GoSjpIYK0OQKgdPHu55fKlsz8HrxX8O9wZqIvFnHf
         w/Y0B2EAAnxa1zT2CxSHg7eXvQV4pxn+nNg6UhbCjLJMmkdUGID3Sx9UBiDxK93s2/uW
         4SPnz+RJgDBljq3rNM4XrRSPdOI+Z16yz9LDHMcFClEDW9/+M9mBeA1fGQCyxE27jNnK
         U6PHRIsXQwkTV91gBlAvGXK1MuXH7bFktJ6teA9JhzekEMt1rnd8rzmrpokW/4sjiX3B
         ILAw==
X-Gm-Message-State: AOAM5324iCYiVjtzi3RKBXNkTl6RfzIp50enmaRlQml4Ndl1L1IBR4/a
        fTDZ+6B0jYjfHk8er863ARpX1Hf9H7Npuatwf+WQqg==
X-Google-Smtp-Source: ABdhPJxVCvTxQBa9uUkgNRPwtGwCa67w4SJn7w+sIh0OhCpseqwOTHMZwKQSHTeXAO/HtWHKbMJyqx60H37P7zFsfWE=
X-Received: by 2002:a2e:950:: with SMTP id 77mr3504963ljj.438.1627051132515;
 Fri, 23 Jul 2021 07:38:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1626947923.git.mchehab+huawei@kernel.org> <a8e0e3227480fa8a5a045ec1ee06a08183a0a8b6.1626947923.git.mchehab+huawei@kernel.org>
In-Reply-To: <a8e0e3227480fa8a5a045ec1ee06a08183a0a8b6.1626947923.git.mchehab+huawei@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Jul 2021 16:38:41 +0200
Message-ID: <CACRpkdbh5Ef_oqC+i97UhhPzYPEZ3rdUskMf8yKZdiANjVZ-yw@mail.gmail.com>
Subject: Re: [PATCH 07/15] MAINTAINERS: update faraday,ftrtc010.yaml reference
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Corentin Labbe <clabbe@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 22, 2021 at 12:00 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:

> Changeset 8df65d4adca6 ("dt-bindings: convert rtc/faraday,ftrtc01 to yaml")
> renamed: Documentation/devicetree/bindings/rtc/faraday,ftrtc010.txt
> to: Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml.
>
> Update its cross-reference accordingly.
>
> Fixes: 8df65d4adca6 ("dt-bindings: convert rtc/faraday,ftrtc01 to yaml")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
