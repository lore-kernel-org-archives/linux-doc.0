Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9816C433F5
	for <linux-doc@archiver.kernel.org>; Thu,  7 Apr 2022 02:23:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238895AbiDGCZi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Apr 2022 22:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbiDGCZh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Apr 2022 22:25:37 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F9B113EFBC
        for <linux-doc@vger.kernel.org>; Wed,  6 Apr 2022 19:23:39 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id e8-20020a17090a118800b001cb13402ea2so312148pja.0
        for <linux-doc@vger.kernel.org>; Wed, 06 Apr 2022 19:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nqhcWBOl5mNRk3YBVwMTAKi6jNsaN54sRe+ut8u3YQQ=;
        b=kzAAj4fhRNiLd6rc/o1bIXwbJqdABdPv2MfnwS0w4Kd1V9ZuvmXBesTYfy9zzcHzl+
         kiDy6Nxg/zpmXfaqhqMP/+8l9NswWZ+iNoCx84+mhr7e8g5hgQcMVx6BP+isbXGNl3L6
         MYfAyTNuBcQpfdTO7lLsM2Yhnr8HZ+Z6P/8WKvjlTQMm9wmoAlbSUGMWHGGzSlzCdiOR
         3L9qj1Gs+wbwIunwo3+3Fv8ilbzuWi5+KSVYKPJEUAb6KygpuIplmkHFlpHFk+Bhr0us
         W9IaDSLYFtpo0hQ1CbXPE6Vah6/b8QZJrX1jwAOzCkl/x9RjSy4cWxy+nuJO7Scdk9ry
         o32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nqhcWBOl5mNRk3YBVwMTAKi6jNsaN54sRe+ut8u3YQQ=;
        b=FssF7dVaUeL1hrlLbSrhBSJ0dD9qcP69m9Em5vQgh8hgD1is2F11QMghshtezE4kLv
         uiI4UuujVLkAuX/UxRKoXxj1UNE7/IH62XRDbuzXbXe3dnR/sokr9ceKsPZjUd+zgfJb
         LaOgKOh9nXY4eAZc1aOXgbT03fzPWDoSPQ24uMC49YDtdtey7NbE6ASfEzafgFfGk3Fw
         ipWrJirz3X9I+Tx6etMG16Y17i90bohxPWjyUNgICe7K/FOFRySFp7klAycG692HhMeF
         /VREuz7CZU3Crurmutp9PsTDEsTX6bZjUIxKNLnHEC1JAUFSgrOKnFEd23scqkeH7iZO
         Yy1A==
X-Gm-Message-State: AOAM532JgE0Q2lU17HjY6byohxduvFwMP6sAv99E/vJkzSCYwhrvmsFq
        E0S6IEqQYRZr4+46lExr+UTQSY+g5iLKCjdsK81K/uQb
X-Google-Smtp-Source: ABdhPJyWt6SxQHTso32tcqXpZXLGIfvVAQy+MGCEdRq+zHPm35NP74kT0IxDXv+SXcfrwd1MYw3HnZjzak/VAhP+9v0=
X-Received: by 2002:a17:902:e546:b0:157:832:2c0a with SMTP id
 n6-20020a170902e54600b0015708322c0amr679421plf.37.1649298218951; Wed, 06 Apr
 2022 19:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220405095414.816060-1-dylany@fb.com>
In-Reply-To: <20220405095414.816060-1-dylany@fb.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Thu, 7 Apr 2022 11:23:27 +0900
Message-ID: <CAC5umyiBGqkO=G4diJwSMLxv_xFiO+dSkLjb9kLwBSoavB9F2A@mail.gmail.com>
Subject: Re: [PATCH v2] docs: fault-injection: fix defaults
To:     Dylan Yudaken <dylany@fb.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2022=E5=B9=B44=E6=9C=885=E6=97=A5(=E7=81=AB) 18:54 Dylan Yudaken <dylany@fb=
.com>:
>
> ignore-gfp-wait and ignore-gfp-highmem defaults are actually true (Y) in
> both failslab and fail_page_alloc, not false as the docs suggest. See
> page_alloc.c:3762 and failslab.c:13
>
> At the same time use 'Y' instead of '1' in the example scripts just for
> consistency. (though 1 would work)
>
> Signed-off-by: Dylan Yudaken <dylany@fb.com>

Looks good.

Reviewed-by: Akinobu Mita <akinobu.mita@gmail.com>
