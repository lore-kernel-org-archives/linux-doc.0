Return-Path: <SRS0=tUtt=7I=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBFCC433DF
	for <linux-doc@archiver.kernel.org>; Tue, 26 May 2020 18:09:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD15E20870
	for <linux-doc@archiver.kernel.org>; Tue, 26 May 2020 18:09:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="QV6eN1wz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728961AbgEZSJv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 May 2020 14:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728553AbgEZSJv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 May 2020 14:09:51 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E7A6C03E96D
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2020 11:09:51 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id cx22so124652pjb.1
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2020 11:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SwJVwRsf4JLRcqoa9J+40Z33dh8YZfs8m9tFvpvW4ww=;
        b=QV6eN1wz/6AFupUQIoxfvaiVQr3VOLFnMyRTzupBK2x5UnbAlfVQHIl6yfVjKSnMu5
         umzskbig4ieeQkFfLiBEUxyS/rwM3NDzxKtqi8fgYUz362ncGMXqwUf3DjNADPk94joc
         sQer+mGXxLQjq5r5/VevoRSQ49Ax1BoPA19/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SwJVwRsf4JLRcqoa9J+40Z33dh8YZfs8m9tFvpvW4ww=;
        b=iSOZQbL7A0zgR2kJhxFLXlxVuoKbq+F7vCaiTzr7YEjtnGMvVd/mAd43f1zwQ2DQEG
         7GzRMhb0DppsJp/vxQMGktf00gZvbBGaoC58iMG7yY+me1F3C5lkrOGzNqfb9Zkbz5FX
         SgPZsXDfe9klmTw0+koTMn+bEFbexhT7g2UR56XZD6kbrejr7fR5iAPnG9sSnaKRodc4
         ls8EKIWYec3l6iIfCfYSiJLquaqIdyqACJRYq1bDsdR+dSsnijIitQdVY7EZVkTWeJLx
         TrKBAr0xlJGUBTvi/mCLYEhodea2qPyaRHZt5sq3CIITqFlVnMWHC79P5jRCQ4V7mdyP
         sQ1A==
X-Gm-Message-State: AOAM533uzPnjn+Oa39zOkkZ7lWFc+xnidAyIDo51F3YRQqJzWFTvn3Og
        0jacgoiSKpaJZIeZJd4zxZV6h4s+nEB/W/SEpaJZgQ==
X-Google-Smtp-Source: ABdhPJw0zdtsZqR6XZR5M0EU2Em6fXtef9eG1yF+ia1DKSMmJ8d7PdM5no22jZaDVe0gm/zwiK1kl46oQKDlpGuKAiA=
X-Received: by 2002:a17:902:e903:: with SMTP id k3mr2106595pld.317.1590516590375;
 Tue, 26 May 2020 11:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200526145815.6415-1-mcgrof@kernel.org> <20200526145815.6415-7-mcgrof@kernel.org>
In-Reply-To: <20200526145815.6415-7-mcgrof@kernel.org>
From:   Michael Chan <michael.chan@broadcom.com>
Date:   Tue, 26 May 2020 11:09:38 -0700
Message-ID: <CACKFLikEm7r82jB=qB3YafPoHp+mK1joOtRKS67a2jyhJegtyA@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] bnxt_en: use new taint_firmware_crashed()
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     jeyu@kernel.org, David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, dchickles@marvell.com,
        sburla@marvell.com, fmanlunas@marvell.com, aelior@marvell.com,
        GR-everest-linux-l2@marvell.com, kvalo@codeaurora.org,
        johannes@sipsolutions.net, akpm@linux-foundation.org,
        Arnd Bergmann <arnd@arndb.de>, rostedt@goodmis.org,
        mingo@redhat.com, aquini@redhat.com, cai@lca.pw, dyoung@redhat.com,
        Baoquan He <bhe@redhat.com>, peterz@infradead.org,
        tglx@linutronix.de, gpiccoli@canonical.com, pmladek@suse.com,
        tiwai@suse.de, schlad@suse.de, andriy.shevchenko@linux.intel.com,
        derosier@gmail.com, keescook@chromium.org, daniel.vetter@ffwll.ch,
        will@kernel.org, mchehab+samsung@kernel.org, vkoul@kernel.org,
        mchehab+huawei@kernel.org, robh@kernel.org, mhiramat@kernel.org,
        sfr@canb.auug.org.au, linux@dominikbrodowski.net,
        glider@google.com, paulmck@kernel.org, elver@google.com,
        bauerman@linux.ibm.com, yamada.masahiro@socionext.com,
        samitolvanen@google.com, yzaikin@google.com, dvyukov@google.com,
        rdunlap@infradead.org, corbet@lwn.net, dianders@chromium.org,
        Netdev <netdev@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        Vasundhara Volam <vasundhara-v.volam@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 26, 2020 at 7:58 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> From: Vasundhara Volam <vasundhara-v.volam@broadcom.com>
>
> This makes use of the new module_firmware_crashed() to help
> annotate when firmware for device drivers crash. When firmware
> crashes devices can sometimes become unresponsive, and recovery
> sometimes requires a driver unload / reload and in the worst cases
> a reboot.
>
> Using a taint flag allows us to annotate when this happens clearly.
>
> Cc: Michael Chan <michael.chan@broadcom.com>
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Acked-by: Rafael Aquini <aquini@redhat.com>
> Signed-off-by: Vasundhara Volam <vasundhara-v.volam@broadcom.com>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

Reviewed-by: Michael Chan <michael.chan@broadcom.com>
