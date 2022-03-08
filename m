Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96CD1C433F5
	for <linux-doc@archiver.kernel.org>; Tue,  8 Mar 2022 04:57:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240254AbiCHE6c (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Mar 2022 23:58:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbiCHE6a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Mar 2022 23:58:30 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC73A3893
        for <linux-doc@vger.kernel.org>; Mon,  7 Mar 2022 20:57:34 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id f38so35471375ybi.3
        for <linux-doc@vger.kernel.org>; Mon, 07 Mar 2022 20:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VMalzZWLjKhYAY6S0sMp+MwEYz02mzHzL0nET0cV0sQ=;
        b=mK5j2WxvOjk5J2yeejcxQ3w2ArnhIQym+lpkyMuxSZOvKkZfYYW54H/7ox/ZRc5LPX
         i6F4MxIrev7ekLO1Zryazbkg30v+ntfdpMc2agpwFYo9+pIYULj2Nq6kTQJhaVwXg9+N
         o9mbKYx8FY9pfbew0FbzBMaj8wkqEI5XFA4H1ZzO8kNZHRXKFajYGQBf+KyYicc+nSlN
         Szx7zPmhv6f4WYaghJM5YK8Wp57Z3YDdbNzPFr5lEkXJvPPD/+A1MWap8zBCeXPWbzAQ
         9QHP36Sx+IdHn6ldOhmbtJ0XcEIk5ss+FdbZRGPHfch9gP3+Tk2YDVV1DynMGnneGeW+
         m9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VMalzZWLjKhYAY6S0sMp+MwEYz02mzHzL0nET0cV0sQ=;
        b=veRbQHhpcZ2Z2x3pTkfhCzcdi8v5Iv8MKv98IBEc+dy5QF2hqkpEQRIZzeY8fVmUHv
         9p+oNYAzVbmqv2SlKDHsBr5rTfPRXFpjIpOqoswfvlEm3NfAvt4Mn9g4wKrLjIes/oKP
         qUYb7ug3ZJ5QEJx5AYfc1yw+e/sXrGbw+cmg5q/2SP45S6AnZKYhWXhrNZI+ShzZE3rh
         +FBHuwQWKNMge11IPcQA/5PpzblQ3JjC+sKTpAr9o8wIgfsUsgkVdp5aHYLxL/1O6rCG
         ucbFxZrMCHuPq65muj6H5HFf/aEJWkcVmrFOAOxnlyfQUQTz4/AXQqdlHqwmxK8xliQ6
         luPg==
X-Gm-Message-State: AOAM533tVXneD00OXMWcfSiVArXb2JmV0bkxVhLSCPK6n+YMAkPcKKPl
        SUhV2IMNd72nBRh1bvr+uUi1vuNqS2JcmIKXSqw=
X-Google-Smtp-Source: ABdhPJxZnzIHcRbxz2hNcaZ984tUfqdxXKSeJ2ABrhcwDyhn+mVwqr49iKA81tTvzDMDTZsF10iwKA/5VrFTMYY4AXw=
X-Received: by 2002:a25:b908:0:b0:61d:75f8:6eff with SMTP id
 x8-20020a25b908000000b0061d75f86effmr10693486ybj.641.1646715454089; Mon, 07
 Mar 2022 20:57:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1646640696.git.siyanteng@loongson.cn>
In-Reply-To: <cover.1646640696.git.siyanteng@loongson.cn>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Tue, 8 Mar 2022 12:57:16 +0800
Message-ID: <CAEensMzTR15iM0i7h3KRP7GJzhJqGoSuzQbxCNv-absa684U_A@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] docs/zh_CN: add admin-guide damon translation
To:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <seakeel@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> =E4=BA=8E2022=E5=B9=B43=E6=9C=887=E6=97=
=A5=E5=91=A8=E4=B8=80 16:15=E5=86=99=E9=81=93=EF=BC=9A
>
>
> v3:
> *Build test in next-20220304.
>
> v2:
> * Pick Alexs Reviewed-by tag. [PATCH 1-3/5]
> * Fix a build warning.(introduce from usage.rst)
>
> v1:
> * Translate .../admin-guide/mm/damon/* into Chinese
> * note my patch thread is based on
> <https://lore.kernel.org/linux-doc/20220212080024.1684590-1-xu.xin16@zte.=
com.cn/T/#t>
>
> Chengming Zhou (1):
>   kselftest/vm: override TARGETS from arguments
>
> Stephen Rothwell (1):
>   Add linux-next specific files for 20220304
>
> xu xin (3):
>   Add Chinese translation for vm/ksm.rst
>   zh_CN: Add translations for admin-guide/mm/ksm.rst
>   zh_CN: Add translation for admin-guide/mm/index.rst

Hi all:

I am so sorry, I executed "git format-patch -5" without applying my 5
damon zh_CN patch; please ignore this thread, I will retest it later
and send v4.

I really feel bad about it. T_T

Thanks,
Yanteng
