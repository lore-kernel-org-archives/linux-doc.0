Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C600C6FA89
	for <linux-doc@archiver.kernel.org>; Thu, 15 Sep 2022 15:38:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbiIOPiL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Sep 2022 11:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbiIOPiI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Sep 2022 11:38:08 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79F5E7694C
        for <linux-doc@vger.kernel.org>; Thu, 15 Sep 2022 08:38:06 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id m3so7696100eda.12
        for <linux-doc@vger.kernel.org>; Thu, 15 Sep 2022 08:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=2ykyl6JCM5IsYWDZToFxUyvXfEUlAup/3nxKdIGIZy4=;
        b=KE1II2RBu4ZCqa5ZyQ9mFwz7v5qvt3svbEfod3J1sVQME+bfHP/pk87EzuE5tSE4XK
         QXGWD7inArfQT869dgDd/L3VDEk+NBw7+OuCppWX9VdxS2ERxUk6/lAOeazo+0/8qtyL
         CesGGGFcT+L7EI4dkxgqkw5FkawR7GT+g1kWzII9s8rSYJnMO7VZ56+K/3mytx1NAvSf
         BPIl/81ehx13D0+NW0vB+JKf+75EIhH/NW3Vx9blEZ5kEocgOj/MWkeizxQ9NG3bWY+5
         y8M+hSt+dMih4crnK4/WUzz+weqTXccDJyw1LMadoO2fUbYUBpdJcGoVNTh4AsPqvmtn
         TMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=2ykyl6JCM5IsYWDZToFxUyvXfEUlAup/3nxKdIGIZy4=;
        b=vO8mTeiR1tT5jhZwucgPEwaZlnau/iLwRDj4MULL7r3rGp3KKhQIqmTL3v/yJapzkd
         YDKzJrkStfnAL1T8wnN7FH8sCVKd5o0gi4kV5WAUv5QXTBe3iKkZcJVl+6KgdvOqEIyV
         5U4SAo0FWxfORZwlqgbASHzBaUSCpAxcML0LRzLcIhIF71K1Ef66urhYCUOQIE7AjIiu
         HBbMNSgpsURhJ1PMqk/lgr30bNo/7Y8J8JNcmKAzIlnqXidEabw3x4MSzEO6LEF1Pden
         4WIX7xUKaGUFTWNNX6nEwFWzbEyWNlw13+cmOUEBFqb4/rqcLM67X8ehLiSo0GUhoHlS
         TYNQ==
X-Gm-Message-State: ACrzQf0dBrZ647E43QoAPgoNYRA36tt5GaFzU3Qn7+Bzwd3PPHjruXe1
        QyylEhefb8x2uI6pVmPvZ/46a/H2tlkqxPSCwec4jgzXT3I=
X-Google-Smtp-Source: AMsMyM7sHTwr1DxveQM6nDMoyWRu+aVmUsJ+7d9NrlQ3yhZkK2wwjufn5pbD+kskfxzr6zwAXbWHLu1T/jmj2k/YU9E=
X-Received: by 2002:aa7:d341:0:b0:44e:67f1:5a2d with SMTP id
 m1-20020aa7d341000000b0044e67f15a2dmr387507edr.175.1663256284723; Thu, 15 Sep
 2022 08:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220822213732.2731429-1-yoann.congal@smile.fr>
 <CAMSfU+5Hg35RwXd1G+akXfbQ59Hbc5vdzQ5rDvuqBynfVdiH+g@mail.gmail.com> <b4b1610a-4ce8-dbff-4205-4478164dba31@gmail.com>
In-Reply-To: <b4b1610a-4ce8-dbff-4205-4478164dba31@gmail.com>
From:   Yoann CONGAL <yoann.congal@smile.fr>
Date:   Thu, 15 Sep 2022 17:37:38 +0200
Message-ID: <CAMSfU+4okQ8-tGUUKeKnMKHvJXjj4yA7THzXMwnBuzKJ1ioXSg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kprobetrace: Improve readability
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Le jeu. 15 sept. 2022 =C3=A0 03:42, Bagas Sanjaya <bagasdotme@gmail.com> a =
=C3=A9crit :
> On 9/12/22 15:35, Yoann CONGAL wrote:
> > A gentle ping for this patch (I'm afraid it has fallen through the crac=
ks)
> > I've checked, it still applies cleanly on v6.0-rc5.

Hi!

> You need to send to appropriate maintainers. See MAINTAINERS or run
> scripts/get_maintainer.pl.

I just resent my patch with the maintainer in recipients.

> Also, DON'T top-post your reply.

Noted, sorry!

Thanks for your help
