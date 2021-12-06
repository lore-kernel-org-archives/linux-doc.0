Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1D6C433EF
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 19:36:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345766AbhLFTjc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 14:39:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240539AbhLFTjc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Dec 2021 14:39:32 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65994C061746
        for <linux-doc@vger.kernel.org>; Mon,  6 Dec 2021 11:36:03 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id t5so47436045edd.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Dec 2021 11:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1WZbGUI2jgxA10QTAICPwSg3f480L4ADSnktyOVLe2k=;
        b=GngTKpgvPeiX/nUFKS+/vZnjYQHy0JwjnyeBTrCSICMt+OObJuz/ZY47Ab5zOCNTZk
         UNj/aJtmFS+GluXZPxqGJ5qZbuC7A0P8k3vbJ11Oz2fUgr7DYKTirs+rbaAUrk8ZURxu
         zErFOsaHNkR15LzUr0E7qwxHEJNdkLaKcmwSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1WZbGUI2jgxA10QTAICPwSg3f480L4ADSnktyOVLe2k=;
        b=HO+Ha8XKOM3TaKFjf39FjMoWtPqHZ73N/K2eyDrsc4rycaLVD9XBFJTQyZxW+PaxCT
         FocYvcTrT6gDBv7AtSCbSgbmdXkZYlCDFXk2UWshsrMp0IGaule9v5NhKmOdQ1SGd2rx
         pkj74roYGwpGW2CtT6BJ89feABhvNcBYETVu6JoGIo+cVggx23TUEm5B7RogfEQCrEsh
         qFkU0qtMCI+iw7YPRnIsox6oB2nn5b/1LpilbYn/p9BKfzon9C+CqUa8ap6R1K2Bhdrz
         fpPVq6GdwNLnQ2d5IUVY5gvqXi9z10Jld96khHEZuMrKJMuatdxJMxjVxR+/ie1sp/xv
         SM1w==
X-Gm-Message-State: AOAM530YEbt85Jv5Qq+CmlHiEDGiEEMr+Y5hsMBRzETNI8GhrQdHz/ot
        B609rj8IwYn4pe0CmyG/7B8pUwAttxJk2CUD
X-Google-Smtp-Source: ABdhPJz30czbMYGH5xqSf/1JsIAMFXxzxYLz64qMr8BNBOcWltRO2Xf9aBfSBx144iQTp673oPvPsQ==
X-Received: by 2002:a17:906:2788:: with SMTP id j8mr46658360ejc.203.1638819361782;
        Mon, 06 Dec 2021 11:36:01 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id hs8sm7301133ejc.53.2021.12.06.11.36.01
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 11:36:01 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id t18so734004wrg.11
        for <linux-doc@vger.kernel.org>; Mon, 06 Dec 2021 11:36:01 -0800 (PST)
X-Received: by 2002:adf:9d88:: with SMTP id p8mr47263440wre.140.1638819360971;
 Mon, 06 Dec 2021 11:36:00 -0800 (PST)
MIME-Version: 1.0
References: <87y24x39wi.fsf@meer.lwn.net> <874k7l35t5.fsf@meer.lwn.net>
In-Reply-To: <874k7l35t5.fsf@meer.lwn.net>
From:   Linus Torvalds <torvalds@linuxfoundation.org>
Date:   Mon, 6 Dec 2021 11:35:45 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjPc=K6J39Gw7TasXd0QWthG7WFHxZPGofYteJYmyx+yg@mail.gmail.com>
Message-ID: <CAHk-=wjPc=K6J39Gw7TasXd0QWthG7WFHxZPGofYteJYmyx+yg@mail.gmail.com>
Subject: Re: [GIT PULL] Documentation fixes for 5.16
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 6, 2021 at 11:13 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
> Somehow I managed to not CC the usual lists on this one, so, for the
> record...

.. and now that it was sent quoted (instead of re-sending the original
email), pr-tracker-bot doesn't recognize it as a pull request any more
and doesn't react to it.

So no pr-tracker-bot replies for you.

Only this manual one.

             Linus
