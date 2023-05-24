Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7033DC7EE2C
	for <linux-doc@archiver.kernel.org>; Wed, 24 May 2023 14:59:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236340AbjEXO7b (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 May 2023 10:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236358AbjEXO73 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 May 2023 10:59:29 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94EE7E5A
        for <linux-doc@vger.kernel.org>; Wed, 24 May 2023 07:59:05 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f606a89795so11660485e9.2
        for <linux-doc@vger.kernel.org>; Wed, 24 May 2023 07:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684940335; x=1687532335;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPTeVaA5yO30H5vPCNeErOYkc0AROqP1l6DiC6Tyn6I=;
        b=vfpIgsnyUzdnKc4dwE+/96PjgIZvHt4dvbZ9oFQJRuK0CVK6zB1ExZEmqyOyDUEaMH
         BPpbUfdQjZ0taYzA1AsrlvN1tRHUAtaLiRwO/ppPt3tSnmEbi/0JPy5s7QiEBux76KU1
         +T0ASZwW7J5toOpu/nsp3pq2NfGxQd59XQfjtn70XB6B7U0d/h+ElY2TO2EwqmTVgQFV
         4Bnu2oFUhNfw46W86ylzigop/8xarM12LGwz50nrnW2lI8914SzNVvR466awvrLz/Th8
         2RTJ3NEnKOtlLRdaAzbNop6jsJMZCo+OvHfi+l+HAw/OtwY51swRPmgc8oYcxbSkPLMv
         Jkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684940335; x=1687532335;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dPTeVaA5yO30H5vPCNeErOYkc0AROqP1l6DiC6Tyn6I=;
        b=jPtQS6DWHoB+3kuRuAmhF9QA0UAh596s/78xqft2K5FSutkryEv4YSKf/KGPtpITGo
         YCqWh9ekbpd58SL/x8/7/F0QeD9Ebk3Z3qiHWunDU8+shjBYcIqyZvp/fgLvSFk4UB1z
         iLKe0QMv0lwhtLDiawaT82u86EqNqdL6C+CyDyV0F4+tlnWrjsiphBZnIXrkrBVWZ3sQ
         Zd8E20JqHMN5o2WCWTqJ0nsP6ytKjfAepv/3Q/1T+72hDkJzRycGwYeWTRvE/O1lQ+WC
         gnYTLepWunq1WUrNwe38MdCcZgLhyX262+JYRJbT7uH8C60KqfvT7e4c0LMfTUHGAIJO
         A9QQ==
X-Gm-Message-State: AC+VfDx5mO/emDareuWofI8vMN5aZ8/s/85HOUgMmxltR8IYeJiTYDyR
        ZafT5Io1j/77pTVQCjkAVbFsag==
X-Google-Smtp-Source: ACHHUZ6dUa6XUsPGDzubnTbiGkJc+yNunVFb4E6K7ba0Jf0QKNNJpz+ZBmF7UznoBG5dbpFM0aZNKQ==
X-Received: by 2002:a1c:7907:0:b0:3f4:2e13:ccdc with SMTP id l7-20020a1c7907000000b003f42e13ccdcmr126352wme.0.1684940335257;
        Wed, 24 May 2023 07:58:55 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id l14-20020a7bc44e000000b003f60514bdd7sm2724611wmi.4.2023.05.24.07.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 07:58:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
        by zen.linaroharston (Postfix) with ESMTP id 5C26E1FFBB;
        Wed, 24 May 2023 15:58:54 +0100 (BST)
References: <20230424231558.70911-1-quic_eberman@quicinc.com>
User-agent: mu4e 1.11.6; emacs 29.0.91
From:   Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To:     Elliot Berman <quic_eberman@quicinc.com>
Cc:     Alex Elder <elder@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v12 00/25] Drivers for Gunyah hypervisor
Date:   Wed, 24 May 2023 15:57:42 +0100
In-reply-to: <20230424231558.70911-1-quic_eberman@quicinc.com>
Message-ID: <87fs7lwzbl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Elliot Berman <quic_eberman@quicinc.com> writes:

> Gunyah is a Type-1 hypervisor independent of any
> high-level OS kernel, and runs in a higher CPU privilege level. It does
> not depend on any lower-privileged OS kernel/code for its core
> functionality. This increases its security and can support a much smaller
> trusted computing base than a Type-2 hypervisor.
>
<snip>
>
> The series relies on two other patches posted separately:
>  - https://lore.kernel.org/all/20230213181832.3489174-1-quic_eberman@quic=
inc.com/
>  -
> https://lore.kernel.org/all/20230213232537.2040976-2-quic_eberman@quicinc=
.com/

I was able to apply the first patch but the second patch gives a 404:

  b4 am -S -t 20230213232537.2040976-2-quic_eberman@quicinc.com
  Grabbing thread from lore.kernel.org/all/20230213232537.2040976-2-quic_eb=
erman%40quicinc.com/t.mbox.gz
  That message-id is not known.

was there a transcription error?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
