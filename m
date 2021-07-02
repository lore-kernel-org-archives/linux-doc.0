Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2213C07E95
	for <linux-doc@archiver.kernel.org>; Fri,  2 Jul 2021 21:01:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87B7F613F5
	for <linux-doc@archiver.kernel.org>; Fri,  2 Jul 2021 21:01:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231935AbhGBVDy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Jul 2021 17:03:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231702AbhGBVDx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Jul 2021 17:03:53 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F00C061762
        for <linux-doc@vger.kernel.org>; Fri,  2 Jul 2021 14:01:20 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id cs1-20020a17090af501b0290170856e1a8aso10017276pjb.3
        for <linux-doc@vger.kernel.org>; Fri, 02 Jul 2021 14:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=YVc0vmr7jKGqyaQ1EO/OApXH28jA8mU20vTfFqqb1zQ=;
        b=uzNDJ+tjiYjMk1yGd3UQYZx44l2gzJi8h0im5WQbvz5iT0PccOTx/u+tawU716yqHm
         sCx6sDKcwX3hXNMgb5/NRBA0+vqj8vU15xrGUIR0diqY6Jb2JnMYzvncfxs92hqBNsuS
         QVz3j7e5ADRTGe8ZSArdhm6RDi/LQAa50PoYYIDWZ90kPeQcdZ+eo+tOdkXBX0ZWm+S/
         AXr3fCqGP82kSXPyNoJwVWeQDdIVI5UEMrcHqGjziDjVOhYhHxgJTm0u4Obzc07eFQr+
         tC72mrWC3M80QcO4lMJ7mlLpDjj4JX6zNiuUSJimvOxr4A80JAwJgKU1Hu8qhZi7/00c
         q5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=YVc0vmr7jKGqyaQ1EO/OApXH28jA8mU20vTfFqqb1zQ=;
        b=Bfx0wb9DBB+xNML/b8RNr5ahjFTkXJQB87gsGgWEq+2DuVGZiHucMtlU6qOF+a0+V5
         F7xAlSgSH0AK6ETSN11brGw+7sn/HN7Oj5vr/1t4OQNsV9pQJOYbKE49y4k/g7e2Eh7a
         VZnEKXUbBiWl1ODoR9s7vZCulaMhXRGjtgbVCbiFGHuDtp1RBw3PgmjVIkiAL8hiv9oY
         zR7Mr1FIZXt/IY/Y4ZoUXHKhfNK2C9ldAksg5ONDRmZGz2l1tOhe0cNVjBPGPSJmOdSy
         4CSpviHk1Aw8EUzIq84ACwzQ7spZbC38luPhE3zqAG3OZ6EEnWpWPNta5Kk5m9ylCJ4y
         tTnw==
X-Gm-Message-State: AOAM531mpn9zRJUiXonnHN7Azue02hpj64jd85wfLi7Xr4V16Fcg8pH2
        HRq62J16JLUhEndLqYvdNG3SGQE+QdN6YnGTidhm+tQs88A=
X-Google-Smtp-Source: ABdhPJyQrbYwCsBo7Ok+tejxo78wXYP7eF6nrsSZpsFXpwkSk/wnnOt1DOmeJ2QpntdQaEp3S1AC0FnHxn58Ug7YyJI=
X-Received: by 2002:a17:902:bd82:b029:129:2e87:9946 with SMTP id
 q2-20020a170902bd82b02901292e879946mr1351969pls.53.1625259679686; Fri, 02 Jul
 2021 14:01:19 -0700 (PDT)
MIME-Version: 1.0
From:   Shinwoo Lee <shinwoo.lee.us@gmail.com>
Date:   Fri, 2 Jul 2021 14:01:08 -0700
Message-ID: <CAJMZz3_M34cy4ZbKGLZniGeUPOoJ7DMXdDOQxy-T44_cQ1+Udw@mail.gmail.com>
Subject: I would like to contribute to Kernel documents (Korean translation)
To:     linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,
I would like to provide Korean translations to kernel documentations.
Could you guide me how?
Any type/segment would be good, though I prefer something related to
802.11 drivers (which I develop at work)

A little about me:
- I develop 802.11ah (HaLow) embedded firmware and device drivers in
extension to the Linux Kernel on Raspberry Pi
- I moved from Korea to the US for work. Figured I could help many
Korean developers who are extremely skilled but not so good at
English. I can lower those barriers
- I had run my own translation agency before, and am good at efficient
yet smooth technical writing

I believe it would be a mutual win for both of us. Will be looking
forward to hearing from you.



Regards,
Shinwoo
