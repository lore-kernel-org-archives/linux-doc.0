Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B377C76196
	for <linux-doc@archiver.kernel.org>; Thu,  6 Apr 2023 08:13:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235523AbjDFINS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Apr 2023 04:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234704AbjDFINR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Apr 2023 04:13:17 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C2C85276
        for <linux-doc@vger.kernel.org>; Thu,  6 Apr 2023 01:13:16 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id r187so45312879ybr.6
        for <linux-doc@vger.kernel.org>; Thu, 06 Apr 2023 01:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680768795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s37AKX46druDkQMukFY2wjOtd4UDmaJrvLEgrvY9bU4=;
        b=nrSafKY0nVFK23NtqSDbq36ZroC2qJOvKZrGvQr2QkYsGlKAjzqDUxSK5MFpX+pIom
         zm1tokTzkYyxjOP1ZxjGw6rzdAIxm5xhWmPy0olG7nzGFJm3f3kw20jT7Ew1Asewhkbx
         TasrqL/9bXj7AGVSol29rvvYUk/37XyVnVWapWliLJJNv6jr5gDjZzwoChW1SAgF9+GC
         4UYPa37LhaCGR87mi5f1yVaQkjpm1l+5LCfn9IJPDPCKt/esnFUTB8gOdOHuVAaQs0S3
         Z+ZTHEWJAERRXGMF2nctXeHg5TQJPs343YSTVvNa07CtvJuIS4MxLK7I5ZCOY07ceeZC
         1Znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680768795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s37AKX46druDkQMukFY2wjOtd4UDmaJrvLEgrvY9bU4=;
        b=K6Bi2fLZJQP7TeDDwQOWaemfGXe1KDC11c7rm9Z/x/w8gBqrb1QsbKiPCBJbV/8Kzq
         l++W1iIOQofdBdoyG5XzND/c4i3VuIN4hO+usKBj4GOlzEYX98SBlNYGDl0PEg0xATUj
         qBaNaq0qxTxxAXR2OTK6QGpPP3MVuyNXgF2tbvb4J2EeIo4wYSiA96yaddrHSdMOJFZA
         h/59yc+P1eB/e1wOgFFaDUZo/phL37FhycnkJ6hazLwmGDABpCMSUUJeJjzmwCL1ca8X
         clz9QvmihL6SAdwuDY701hTHVuzuO+QKEaxOyKiglmLcQpkzCS6ea0vnPTG6VytFUWWV
         xYuw==
X-Gm-Message-State: AAQBX9ckZn8y27j12v+QpplyC9iTj1omITv0Ne28M2igXVUO7xJhy24x
        OJkGl1F90oOFbW05jyBdteF4Kc20FQaSyRcUd+2eRw==
X-Google-Smtp-Source: AKy350Zfk5N0s61DTsl9VnLEj+Ajk4UDuW7STcEJQQgs7kgMhWDYvSKMwIj3WKmJkboudvnSGA7KP7OZSeL2wh7bFyI=
X-Received: by 2002:a25:da46:0:b0:b09:6f3d:ea1f with SMTP id
 n67-20020a25da46000000b00b096f3dea1fmr1566211ybf.4.1680768795347; Thu, 06 Apr
 2023 01:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230406063450.19572-1-yuehaibing@huawei.com>
In-Reply-To: <20230406063450.19572-1-yuehaibing@huawei.com>
From:   Eric Dumazet <edumazet@google.com>
Date:   Thu, 6 Apr 2023 10:13:04 +0200
Message-ID: <CANn89iJTKBVcF4agyJfV-TbtH12Uky=vkDJ9eoxKML9N0K7gAw@mail.gmail.com>
Subject: Re: [PATCH net] tcp: restrict net.ipv4.tcp_app_win
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
        corbet@lwn.net, dsahern@kernel.org, kuniyu@amazon.com,
        netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 6, 2023 at 8:35=E2=80=AFAM YueHaibing <yuehaibing@huawei.com> w=
rote:
>

>
> 'maxwin' is int, shifting int for 32 or more bits is undefined behaviour.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---

SGTM, thanks.
Reviewed-by: Eric Dumazet <edumazet@google.com>
