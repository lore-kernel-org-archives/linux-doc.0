Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1239FC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 20 Jan 2022 02:23:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbiATCXP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Jan 2022 21:23:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbiATCXP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Jan 2022 21:23:15 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31C5C061574
        for <linux-doc@vger.kernel.org>; Wed, 19 Jan 2022 18:23:14 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id d7so3923340plr.12
        for <linux-doc@vger.kernel.org>; Wed, 19 Jan 2022 18:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=41u6vHsH8pxi8IRzowPsWwS/QB2MO/MX4OpMuN1ZEYw=;
        b=FKYyhAI03qDfFdMOqmOhqWwq8UXf0KH1K+AevJX6RCHvZCAVWrpib2qvaW7oY+qkAk
         mTQRDXGuaw8rXM9LlUxkzVNrsRw/D5Foc/9joL/agm3e3XUN/VVx650PmFg8Mc6N8mn2
         P31pEOkGrXp3Ax3do9i7K7vRL1PEdvutdkAq+xKhhur7J87wJkbViaWxRo51VIJVGFzx
         COj43MubUnp1bZHF55hFzbqbI6EdolsFI8QafrC5jF2U6Gu/xipXVGbGNYT8iTR3JsA9
         Oa3sqGYC6e79sgpMIrgXP0DQKrBB10CJ5B27fzv8Pzj5RC9TNxMRoAIY474wdnwKmBQh
         0ccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=41u6vHsH8pxi8IRzowPsWwS/QB2MO/MX4OpMuN1ZEYw=;
        b=D4eS1KtEn7jMIYrwijCPorc13p9Kb2cgOrBKWoEFpdWu4DHrEfhwi0X4lrwFnSld8D
         +eZnNfgUT63koARJAcEJCBfsAVG1b7/n6tIJpLY774ZL1MkR05twmSPZWwh3rSAt17ZQ
         rCVoguEBaNFdzB0Q1JWf8NR5hvPzEM1+N4ro7WF4nohaCB0jbP03YxxlNg5QV7FYd5FH
         SujZvEXuF+mL79LHxV3OB2N94apFZBfAuyLlg34E4vnlHdjsLKOra+8N8B8uNvKjDgrP
         iJGoowycqfaPf1JFZ43D/i29ZDJsaJKY27jVdUxW7JQptocATjJT9gnqpwhmhhOfTod3
         dNmQ==
X-Gm-Message-State: AOAM530kldEiLwiYlqK7eqkn0kM8uiSIEi47gCWuSbB+zmEhfbcWAi/m
        zTC/gm3EC3KbJA7tge7euTGGOLAWtSlZXYEqLetqzpenbU8EK+Ef
X-Google-Smtp-Source: ABdhPJzkeJqjgmIgK6RV5tpyzyQavq4V0j28JvyFYhcE9Mr+G3nhG0VLsUKTbyn8MZwoEdrSDOm54ii80noCq9qjcoI=
X-Received: by 2002:a17:902:f687:b0:14a:67ae:3e08 with SMTP id
 l7-20020a170902f68700b0014a67ae3e08mr35145767plg.126.1642645394551; Wed, 19
 Jan 2022 18:23:14 -0800 (PST)
MIME-Version: 1.0
References: <20220117043455.861550-1-xu.xin16@zte.com.cn> <20220117043839.861719-1-xu.xin16@zte.com.cn>
In-Reply-To: <20220117043839.861719-1-xu.xin16@zte.com.cn>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Thu, 20 Jan 2022 10:23:06 +0800
Message-ID: <CAMU9jJpujNzzSr-RnFoaOyN7unGqHVjsx6tS3eRYsTRn3mR=qw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] zh_CN: Add translations for admin-guide/mm/ksm.rst
To:     CGEL <cgel.zte@gmail.com>
Cc:     Alex Shi <seakeel@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
        Yanteng Si <siyanteng01@gmail.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        xu.xin16@zte.com.cn, Yang Yang <yang.yang29@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

<cgel.zte@gmail.com> =E4=BA=8E2022=E5=B9=B41=E6=9C=8817=E6=97=A5=E5=91=A8=
=E4=B8=80 12:38=E5=86=99=E9=81=93=EF=BC=9A
>
> From: xu xin <xu.xin16@zte.com.cn>
>
> Translate Documentation/admin-guide/mm/ksm.rst into Chinese.
>
> Reviewed-by: Yang Yang <yang.yang29@zte.com.cn>
> Signed-off-by: xu xin <xu.xin16@zte.com.cn>
Reviewed-by: Yanteng Si <siyanteng@loongson.cn>

Thanks,
Yanteng
