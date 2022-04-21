Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 449F4C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 21 Apr 2022 19:24:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232117AbiDUT1c (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Apr 2022 15:27:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241766AbiDUT1b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Apr 2022 15:27:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 784A24CD7F
        for <linux-doc@vger.kernel.org>; Thu, 21 Apr 2022 12:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650569079;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BdBZV+ngSVw/y0jQuJ/Y/qv5uxEaI2SxYjUeyCoWPW4=;
        b=FxiLloACVjLEMreE+jNM+rd0VMEDwY/vhOAiDm76EdH17FvT8lvTGFkDIYTWFouUMv6AVS
        ippjMH53YSjAOYXk9xdoq+S5PrPAS+FJ7BfE572CfjcU99qnv9Qitefee/bvgIYPxYthsR
        Ty8K8fZJJzqabqo4t8tnH0DVb9aNfMQ=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-y3NYPH_7Nd-KfuUS_NB99Q-1; Thu, 21 Apr 2022 15:24:38 -0400
X-MC-Unique: y3NYPH_7Nd-KfuUS_NB99Q-1
Received: by mail-yb1-f198.google.com with SMTP id q142-20020a25d994000000b00641d23dbeb9so5224379ybg.9
        for <linux-doc@vger.kernel.org>; Thu, 21 Apr 2022 12:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BdBZV+ngSVw/y0jQuJ/Y/qv5uxEaI2SxYjUeyCoWPW4=;
        b=gOSwQr+j1Fon0cqrZPard7AefgUY3PBR6Qevgj5lLdsxh4cgOIfMR3/E9x1eEiycXW
         8tfXBQHvU/4ObNDAyFgOlVyxocA9D5ub5Avkm10D9FucEsCiRfrU01nvXRy7/dsfArsx
         9epYKobWrrfKlv7HMihW/RzCzfeJQKO4n06x2k3KwaxnMDec6+/7ll5vP+LIFP/ZKEZj
         cQJ6+HeKxmGYfe3GCYwKJKDzlYslmRvVRQIkVZAIrJZvzyzfIwJhTp0QUaJgY9QtlUGL
         QohcV1C8IBVaEI3v6QvfsnuBpZRNX/rNdEJPoAlvIHd9fRkVfJCi+RlXd4iRjzCJrgVB
         Du6A==
X-Gm-Message-State: AOAM532cNu9lzf8zW/qx/MVEDhh+cHPpblONyr7YJmSvBIn6h7pFptVQ
        S/Hz75i107TP7V74psMKaNtkRhMsS1oBYiUoHUzHE2Yf2yDrQNK+PaxfylYYI6zadwDYpDmpdAO
        iWYTAtWIAizXB3GLN+xFSDCf1gYOngGaLs6jv
X-Received: by 2002:a05:6902:10c1:b0:63c:d3bf:59d2 with SMTP id w1-20020a05690210c100b0063cd3bf59d2mr1250372ybu.99.1650569077605;
        Thu, 21 Apr 2022 12:24:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOsExuDCha1wbBqR4cfCN2HW1n3Uup6J8yH1jGtZyFHiw4Lnn9caIjuT68hgRMCPfGln/VBTV3TSV70BukNCw=
X-Received: by 2002:a05:6902:10c1:b0:63c:d3bf:59d2 with SMTP id
 w1-20020a05690210c100b0063cd3bf59d2mr1250353ybu.99.1650569077406; Thu, 21 Apr
 2022 12:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220324221156.44813-1-jsavitz@redhat.com>
In-Reply-To: <20220324221156.44813-1-jsavitz@redhat.com>
From:   Joel Savitz <jsavitz@redhat.com>
Date:   Thu, 21 Apr 2022 15:24:21 -0400
Message-ID: <CAL1p7m4drKAz4yocoT7ovhmFC_cGBbAC+jPvsg+exYkwJ72POw@mail.gmail.com>
Subject: Re: [PATCH] Documentation/sysctl: document max_rcu_stall_to_panic
To:     linux-kernel <linux-kernel@vger.kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Huang Ying <ying.huang@intel.com>,
        Eric Biggers <ebiggers@google.com>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Rob Herring <robh@kernel.org>, Wang Qing <wangqing@vivo.com>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Friendly ping.

Joel

