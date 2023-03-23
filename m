Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3309CC74A5B
	for <linux-doc@archiver.kernel.org>; Thu, 23 Mar 2023 08:35:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbjCWIff (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Mar 2023 04:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231418AbjCWIfF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Mar 2023 04:35:05 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC8C113FA
        for <linux-doc@vger.kernel.org>; Thu, 23 Mar 2023 01:34:28 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5445009c26bso382768627b3.8
        for <linux-doc@vger.kernel.org>; Thu, 23 Mar 2023 01:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679560465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4RYoPJ1LErLnjfKLVajCu6GU5STQHSZ9DUFEBKc2Ss=;
        b=GrRWMTpR78EiK4AGRh+wmlmCJc3yCLkLpH/UHF4e9cGS6u0ubEfnOhxJ/TlOwky0s8
         WB6++T3F+9k6IZ4E6+AnMDkgBvTHjHkZssw2T5snvgHlVXVPzEJ6Lhy0yxo616B3KUTU
         7XXdpc6YcBqJoe2ZM6oL5xe8PYDGY+d8y/Xt5QMGsideAAPUH7yrMGJrZrmRx5+uzFon
         jgdS8g/ujPnYr53RqC/hbmGIU9ZTPYW4D9iIrTFbAxBWC/Tkxy1GXf52JO1bIRBLV35U
         wd0qCFxzRzWpV6lqBEIAUjokdAC1KQf8QK7ezjT3lAgU8GP3x/f/kbyhwAIVnwj0lwNL
         MzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679560465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4RYoPJ1LErLnjfKLVajCu6GU5STQHSZ9DUFEBKc2Ss=;
        b=Br32OJuELFuA/E1ImAoxVR2E+GYotnUwUcx+ZVqCIyBi2NSkyaauk8NozRDwN466rK
         c7Nejee+Efds5GQo9wMfVHwH+L6T3P2HqXiTp2U3CFR3ISe64dPeOD9sojhRxd0vEE55
         wrJ2M85mrAfZZFct/xGuPzUa2bFpZfPY4MtZb37WfWEMDfCLPkz0HckLIQDuzq/y8SDI
         42D2f8deHIbfV7ko8aVC9BtGHwwQqVkKDIg3jlFQPIkK5qKdv7ZKxOQTTh+ayrfhVw34
         +omkilKy93dO8unCVH5lGtLO9k9gCZeh/KnsF6QMc9QaOsl346jR9/AYeI+H3innAWBK
         eCbA==
X-Gm-Message-State: AAQBX9enc6unDR3CycAMAPOs438FmAYPXkYBxHPeEqhcqnkoqe9SjGL/
        EetNWQcxrX1LF19d1uhDo+gmhw2o4cjnAJ/64c+ybA==
X-Google-Smtp-Source: AKy350ZaGM1U6Ub4iMxUNlQn/D6/CcT7QXGB3nXKmuAYzeKKqb6dW4NRFfS7v1XCoePQnsn6MuXULcyXhrBnNby8wqc=
X-Received: by 2002:a81:bd11:0:b0:532:e887:2c23 with SMTP id
 b17-20020a81bd11000000b00532e8872c23mr1431390ywi.9.1679560465580; Thu, 23 Mar
 2023 01:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230323012929.10815-1-dipenp@nvidia.com> <20230323012929.10815-4-dipenp@nvidia.com>
In-Reply-To: <20230323012929.10815-4-dipenp@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Mar 2023 09:34:14 +0100
Message-ID: <CACRpkdbPSyQbe8pC8EzhyGoVor+piaKRCoXLfoW_n_9JyYLu1g@mail.gmail.com>
Subject: Re: [PATCH V4 03/10] dt-bindings: timestamp: Deprecate nvidia,slices property
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org,
        timestamp@lists.linux.dev, krzysztof.kozlowski+dt@linaro.org,
        brgl@bgdev.pl, corbet@lwn.net, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 23, 2023 at 2:29=E2=80=AFAM Dipen Patel <dipenp@nvidia.com> wro=
te:

> The property is not necessary as it is a constant value and can be
> hardcoded in the driver code.
>
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>

Looks completely reasonable to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
