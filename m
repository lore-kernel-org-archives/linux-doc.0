Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E118AC0015E
	for <linux-doc@archiver.kernel.org>; Thu, 20 Jul 2023 17:42:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbjGTRmp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Jul 2023 13:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjGTRmo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Jul 2023 13:42:44 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB3ADE74
        for <linux-doc@vger.kernel.org>; Thu, 20 Jul 2023 10:42:42 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5774335bb2aso12290647b3.0
        for <linux-doc@vger.kernel.org>; Thu, 20 Jul 2023 10:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689874962; x=1690479762;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iw9BdfYVQgyQBoPjCHW6EH0Qre4wR7dPFluL4RxQ1xw=;
        b=2jVkEC5ZNZt3+ope3Zw+2+jPrU866WnQrAjV/TY8OZQje6pWl+saEYBKFNuccW8rnc
         r1/Yk6BLvlY9X38GX9Ui4/7Ip9tU7glLyYJNV//fOkmUQtXU/BfPzrDQSe1ygShGoKCT
         bj3KUBZq5I6PvIBd6Lbaq/dNEUq4uIFfAIKLUlb6GEijoqQWK+90wfDQ9D9bmgMa44bu
         qBXAg2LytvcKT75M6xVOcWs86NPY6FMtGs4KNnp9DZ0nmg2yfnrYE+0Jzi6Xm2Cuy1ra
         GrJXDTydOsaN0vK7UoAd/Ribhl+KIsW8U6dWgngiHtuPVlZdZOmPhEryVjywyuNYhO7j
         Q8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689874962; x=1690479762;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iw9BdfYVQgyQBoPjCHW6EH0Qre4wR7dPFluL4RxQ1xw=;
        b=PjCJQAno/Zu8cKN6mFD2tibNE1PJQYN/4DlMEeilCqPMs+9PRZyZwdEB2aiWNfrBOq
         p9EUYaTofryUIJn47CFNNhJoACwqjGuNjOORfErO/Cidi3DxRuhvf8QuVWDN56R9+u5O
         8SLp1IZzclGGdYx0XYAYJa7bC08END6Vdxxi4IxhLA11ePdAHoN9e/raJncGAD0WAIOZ
         81pAzCPlgkglVqR60tQ5griwqr28vmJVBnXPtgbOyzu76wRFrc8UfGl61ReqUluvOY/t
         EytP/ds0UuHI9eLeYNT5vl8Ap0MpvSZdNOL0TYltpxFuHUMfJsutiGv4a9qfyVtEa2zP
         Qxtg==
X-Gm-Message-State: ABy/qLaR+o0MGs1QSTJLdMpFQH078JnqHsyVk0mmmhpkNRTK42ukPHp3
        XFlsIb4aInmH8ATeaePgQWpoLcPzb4X66E8Q0IWrbg==
X-Google-Smtp-Source: APBJJlHLnaAjmEmO9ugYaut2lIUnqUML2b054gjF+qFo1fkVwZDIE15Oa8XWzPDep8MQf4t2wvwsmg==
X-Received: by 2002:a0d:ef07:0:b0:56d:2c60:2f84 with SMTP id y7-20020a0def07000000b0056d2c602f84mr20144883ywe.46.1689874961710;
        Thu, 20 Jul 2023 10:42:41 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id b7-20020a816707000000b0057a54615bf4sm340500ywc.55.2023.07.20.10.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 10:42:41 -0700 (PDT)
Date:   Thu, 20 Jul 2023 10:42:32 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To:     Oleksandr Tymoshenko <ovt@google.com>
cc:     Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Brauner <brauner@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH] shmem: add support for user extended attributes
In-Reply-To: <CACGj0CjD3NHumhRkDYiWh5YYbjcwh5sw_HqdoeafdsYxABUfZA@mail.gmail.com>
Message-ID: <cfb2c75c-fbf4-1eb6-bba9-c3c13735f60@google.com>
References: <20230720065430.2178136-1-ovt@google.com> <9b8d38f0-fd22-3f98-d070-16baf976ecb5@google.com> <CACGj0CjD3NHumhRkDYiWh5YYbjcwh5sw_HqdoeafdsYxABUfZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 20 Jul 2023, Oleksandr Tymoshenko wrote:

> Hi Hugh,
> 
> Could you share that patch?

When I'm ready to, of course.

Hugh
