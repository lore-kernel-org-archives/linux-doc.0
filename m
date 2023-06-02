Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2262C7EE2C
	for <linux-doc@archiver.kernel.org>; Fri,  2 Jun 2023 21:36:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236003AbjFBVgS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Jun 2023 17:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235681AbjFBVgR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Jun 2023 17:36:17 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B62E44
        for <linux-doc@vger.kernel.org>; Fri,  2 Jun 2023 14:36:16 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-3f6a6e9d90dso62671cf.0
        for <linux-doc@vger.kernel.org>; Fri, 02 Jun 2023 14:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685741775; x=1688333775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bXSdg68Nu6Ipeqx4DXmMogRTJ0wZKXtu+V3JAgD7Dw=;
        b=4BEcihJjrkOc1hpBnt/rQMSN2szZBaDAd6GF0MhsvMk+8MnwM9znQsqD6iIwJJmdZn
         SnbSmK5wDS4y+luDI9FyavyR8A2zz9Lv/Q79yoNpBYX1EFCDCVS3j/zC3/o5l3kYwiIS
         ijr5iDY/p7ngfxCwVCFu8AiOK0AFoP9g5/YuyrDB9AqUcG+M9oFbylTw2rJ90VEAXu4/
         PfE+TH6nzUsN8z/00c6+KYIs9Nb7XfcUmIFwhQOrP96I0G7IoUtlT7M/Mdojl5PxCHgR
         bEF/F3e1m7wx5btFqjIxE+dFfqfGPVOZ3xoBRF3IT0R1ax+qIWLnLPLdUOBmCyhHlNsS
         zhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685741775; x=1688333775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bXSdg68Nu6Ipeqx4DXmMogRTJ0wZKXtu+V3JAgD7Dw=;
        b=flP3D03VEfXEtaKOnt5oFKuppNZp4SjJui+gK6T2V6EWbBv7V/mFTCBc/DeAneiv+r
         lDoejqbNxnpC09+bkDnjOXM8z+GLwIcjQGztdkTT3j2liFJPtqkQxpEWw+4RNwNqH3vB
         QPOlmlevQS1Wgr7OSGQtqM8bzhBrqBrkhZG0qdOpcMsOBddGLTlkTdejGztnkHinABrW
         kancPabu/ANNlXLnLSbVDrABKWhxaEXP0C29ILEL+WoLw4+3P4uD9w5n96MXs2cTzJlX
         K1qSxHhV7VgzJth/CcF9qyDH9HeKLgQigUQWUwHqut0KxPTQYUBuikTYh7fTkZ4+8q2t
         lZAg==
X-Gm-Message-State: AC+VfDxjY1XgzOkQNNYy2cdczoGhs18zCloRnjV8sXlEaBDDL0+eH38H
        c8TyDP3KyNAF17AhXGmSEb1LFtMOf4mHyFJkihoGNg==
X-Google-Smtp-Source: ACHHUZ6R/RbK0lgZOsIGD8lNiNYKFwpx2gVJ++04EbFp+o/7g575Bcx1tNgZa4IJRgsldJedUvcqUFCmY0Pk0wzhV2Y=
X-Received: by 2002:a05:622a:11d3:b0:3f8:1f30:a1f2 with SMTP id
 n19-20020a05622a11d300b003f81f30a1f2mr341117qtk.26.1685741775555; Fri, 02 Jun
 2023 14:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230602035400.2333527-1-davidgow@google.com>
In-Reply-To: <20230602035400.2333527-1-davidgow@google.com>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Fri, 2 Jun 2023 14:36:04 -0700
Message-ID: <CAGS_qxqRStkLU9F-+P3TBUO29=CCXLuv=Ca0d-AXpVogYrOTpg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kunit: Rename references to kunit_abort()
To:     David Gow <davidgow@google.com>
Cc:     Brendan Higgins <brendan.higgins@linux.dev>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Rae Moar <rmoar@google.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 1, 2023 at 8:54=E2=80=AFPM David Gow <davidgow@google.com> wrot=
e:
>
> The kunit_abort() function has been renamed __kunit_abort(), update the
> references to it in the documentation.
>
> Suggested-by: Daniel Latypov <dlatypov@google.com>
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Daniel Latypov <dlatypov@google.com>

Thanks!
Double checked that this was the only remaining reference and that
this patch applied OK.
