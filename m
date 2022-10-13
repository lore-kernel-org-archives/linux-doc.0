Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C62EC4332F
	for <linux-doc@archiver.kernel.org>; Thu, 13 Oct 2022 06:00:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbiJMGAH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Oct 2022 02:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiJMGAH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Oct 2022 02:00:07 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0B996C94D
        for <linux-doc@vger.kernel.org>; Wed, 12 Oct 2022 23:00:05 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id m19so904345lfq.9
        for <linux-doc@vger.kernel.org>; Wed, 12 Oct 2022 23:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FD3NjdeSNo5/5F7Nbcmuo3Uoe8u5/BA6ysBOu+6VDuU=;
        b=i2/AzONJXMP3hK2QQFy+ykUWMtmXC4xM7P9bT1yRjG9kuxYYpY9oyK+9ZI4FLFWMQN
         PnT5pRRYOvBL3x/RW1vx92eYTfGoNbdnc5HYSxmGLZ1zVGdqPvswgGfRfDWugRXWpN7s
         XtmA3txAiLXdGXgmLofgFGw0TjJzkReCwB2/cU8Pr0iFW9aWWgJZBUw7vJJuSaT3cTi/
         lA4bWe2RVWsUJXf3A3LgkWzBLtEnNrgwrg22FIcPZOH8uAF8nFuDz/tk8ehx6CstouUD
         O5M12KmCUabrKjstssVU9h8crgivB3ZzALkhxv2fOW98E4CXr0d/mmJ63LF+ZQNOrkUx
         LlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FD3NjdeSNo5/5F7Nbcmuo3Uoe8u5/BA6ysBOu+6VDuU=;
        b=lw2PYRBwgDRadZoMM59LlMpokuBlMZdhplbrFxpbUsav9Wdi2bRT0xZ2mLIZgNQQAr
         5vXZDvzYJCZo4vR8TpiYK1K+bIjt623UdMuSWuP2mjjfxk1n8IQcn29Tl2827icmjTxb
         rQOqixEmQvu14J24/3wnfMdRKdjJCCypFJbyXLRvQKixmX79twGjbXLy4jd9tw2zGo38
         jAd28oAFc6Yd4coYNjiG9C6sQe8fVRYphsWp+YGDmce4whEIgNifa81h2sW9KKq7b8+b
         xkVKk48KY4J+mnO3RDaohbH+NtqEO1wP5nC5GpmbEXD6prBgxAKkN148JETBwVJ+inNB
         VNjg==
X-Gm-Message-State: ACrzQf01+lQT+K33CtW8GnIXMznYxqj3sJV+Y4nBEPKutzPdSRbTkv8u
        HGi504PyQaZY1yM4YY8rxIizuU9Hq8y3MtH332/fENyM
X-Google-Smtp-Source: AMsMyM78QQ0Ddjv3519Xn4AEnGVY5XpHEhF04oDrtRRaEGS1wRSGyKS8XPBLeIldoVAro1E3OTaFJZ4s6Il98BmC1eQ=
X-Received: by 2002:ac2:5ca7:0:b0:4a2:680d:4d8d with SMTP id
 e7-20020ac25ca7000000b004a2680d4d8dmr11108201lfq.387.1665640803675; Wed, 12
 Oct 2022 23:00:03 -0700 (PDT)
MIME-Version: 1.0
From:   shepherd Lazy <shepherd.lazy@gmail.com>
Date:   Thu, 13 Oct 2022 13:59:51 +0800
Message-ID: <CALtAjPVOvKj5RLkH53TM_SXHRv3c_sVa_46B_Tp8YLHCbvxm5A@mail.gmail.com>
Subject: ttt
To:     linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

te
