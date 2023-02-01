Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD5DC38142
	for <linux-doc@archiver.kernel.org>; Wed,  1 Feb 2023 18:42:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231479AbjBASmE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Feb 2023 13:42:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231994AbjBASmA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Feb 2023 13:42:00 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B3F8693
        for <linux-doc@vger.kernel.org>; Wed,  1 Feb 2023 10:41:57 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id k4so7912165edo.12
        for <linux-doc@vger.kernel.org>; Wed, 01 Feb 2023 10:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6ehnntGKDa7eVQQXOOpPUsFKwUBTB8JqaOLp9/2yOYY=;
        b=DTd+/4e/1SnRBgPOnGHgrZt3/SmKSOx9lc9nMYZG2Fy3mp9d+TU+hhjX1wchEwAUzs
         b8hdk/wLEYHNSHU+DOvR0QoHimi9RTBefYQKs1Ee/1ZphQ++2Ek7w+LvPM1qaZo0tvQT
         EdtNGvlOUYPlLem7f0ZBLVHMuejFHNJRC5nQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ehnntGKDa7eVQQXOOpPUsFKwUBTB8JqaOLp9/2yOYY=;
        b=7jBPrVkgoLVoLZlTIwMR2Ih2sHvrJ5ESCmCJ5yNPg0f8kSfpesiM481HveXJDennpO
         FZV/J7ftKRjlUzdqO8k3IPr399ezFBewiE2VW/pJ0tirUc2fx4iyVUHaVUchYoEke0v3
         pXGQllvHWXo8jeZ7ZrS0wMt5uFExdePhRU61o4K9Amr+zPuBIq1IE1aAgg5WlK757Ait
         SrMXmwUXm+bNHeyqeSmvoTXwpTCd8rrfa4NZitHlTZaDNCQhZUJU1QklsAqRKATDb59T
         9L44MNikfUn+NadGOR0PMoMaDWBU9eymZo1+BTZci6o501fX3jJKDqI5KJNpZKjy7EUO
         XnnA==
X-Gm-Message-State: AO0yUKV182MtCv3r4HjuRapj11AGDoiVtcvxQeAq52ETWrW+kCebJpdo
        doTsMW+6e/BMCSaWOpwRK8yxvslMqteAS5c09nE=
X-Google-Smtp-Source: AK7set/oOcOH9Kl7yKUUkZ34LqEEmNwPX9uejEcDzNV8JWqjj1wt0kQg8o6mL1FrJXDdMWAJWQEY8A==
X-Received: by 2002:a50:d688:0:b0:49d:2a42:b8c8 with SMTP id r8-20020a50d688000000b0049d2a42b8c8mr3410928edi.26.1675276915920;
        Wed, 01 Feb 2023 10:41:55 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id j15-20020aa7c40f000000b0049f88f00f70sm8837431edq.7.2023.02.01.10.41.54
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 10:41:54 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so2107666wma.1
        for <linux-doc@vger.kernel.org>; Wed, 01 Feb 2023 10:41:54 -0800 (PST)
X-Received: by 2002:a05:600c:a03:b0:3dc:42e7:8d38 with SMTP id
 z3-20020a05600c0a0300b003dc42e78d38mr157425wmp.93.1675276914417; Wed, 01 Feb
 2023 10:41:54 -0800 (PST)
MIME-Version: 1.0
References: <20230201101112.1.Ia7bc164622c8bb2dd7720ecd456672ccfd70fc5b@changeid>
In-Reply-To: <20230201101112.1.Ia7bc164622c8bb2dd7720ecd456672ccfd70fc5b@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 1 Feb 2023 10:41:24 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UKDbnw7b_sVWBS2aS4dXqDeDCcQdgKHfU4zvGWa0+S8A@mail.gmail.com>
Message-ID: <CAD=FV=UKDbnw7b_sVWBS2aS4dXqDeDCcQdgKHfU4zvGWa0+S8A@mail.gmail.com>
Subject: Re: [PATCH] docs: cpufreq: Frequencies are in Hz, not kHz
To:     rafael@kernel.org, viresh.kumar@linaro.org, corbet@lwn.net
Cc:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Wed, Feb 1, 2023 at 10:11 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> Though the documentation for the cpufreq files has always specified
> that the frequencies are in kHz, they simply aren't. For as long as I
> can remember looking at these files they've always been in straight
> Hz. Fix the docs.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> NOTE: git blame shows that this has been wrong since before the kernel
> switched to git. I've tagged the first git commit as Fixes, but we
> could easily just drop the Fixes tag if that's a better way to go.
>
>  Documentation/admin-guide/pm/cpufreq.rst | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Ugh. Please ignore this patch. Somehow I read these numbers many times
and convinced myself that it was Hz enough to actually post a patch.
...but then someone corrected me and pointed out that I'm utterly and
completely wrong. Sorry for the noise.

-Doug
