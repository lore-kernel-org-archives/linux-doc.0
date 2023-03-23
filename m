Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F37DAC6FD1C
	for <linux-doc@archiver.kernel.org>; Thu, 23 Mar 2023 08:40:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbjCWIkl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Mar 2023 04:40:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbjCWIkF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Mar 2023 04:40:05 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7FEB1B56D
        for <linux-doc@vger.kernel.org>; Thu, 23 Mar 2023 01:38:46 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5456249756bso87414787b3.5
        for <linux-doc@vger.kernel.org>; Thu, 23 Mar 2023 01:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679560725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1cIEqXClsIkjDNlYez3V926czPhumNF8sofNyJFFdA=;
        b=eUTIHwb9gHiKe80gCXINbKnZwZKRxQ9pCErWt8YiVhFdExfyg6azrWWNruAziA3WY5
         +Sm+oMyhOCxn4XhLzVHa3dDRskexRoUtiWfxEEZrpnGIHJdahOLjorgzYJtIhCAXoDdN
         +NUGr6PHcKZdNqaAvXc25OCDVatxFA5JYhPWjS3P6Hiul3AsWzClzjlJwLYndxcYiX9K
         JOjA0k+//SCJcc7whw5XEyvjpGrtLGzm+Vnno8YgalqgzgSqCfX7gIEd31dCMBrXfLnB
         APxTJDnIXHpIL6v1Yy8Fe5unGJAi3tg53SBJPVLM6/qGdCsdlUDz8GHex+iycfgzQdE1
         nSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679560725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1cIEqXClsIkjDNlYez3V926czPhumNF8sofNyJFFdA=;
        b=NnQdkxLG6cOMHxrrkg5Lsj1R514sHhp8KQHgKqFXMP6Whmp2xcsl41gvgHLt0DdJrm
         cqAlJs+JKCc9bnR9mbFftZ7OKJpxDEU/GVjwiVnJcVjT7Up4/zHjxvdGjVEmJCLJ1w8a
         PJBQJTYLufX9r3B1V9/HbU7rHDLOyjMLYyxyiXy75RspG/WdwzA2rZ4B3dGx3t8/H6mI
         y2xP2OB52udtfjtRuGx6FWCjF5eKo4FoQPNtQmQdy4Jo43wVMerRqlCR4sMDeXVqnPmQ
         dxkU6tfYoBHKXX8jSRMpH+xPZxNT3pW0QyLeBHpOiwOAM1fx7/hk5J1OEXeDBU0kC/OX
         Puwg==
X-Gm-Message-State: AAQBX9cvV4Jf60lZLpKbG2Butzl9dMxmT3L3h2Dm/soGhO0l5HCH2cBH
        FiPHbF4GtM/caylxRTjSfK+ycbzqgt0eSnc+i2C88Q==
X-Google-Smtp-Source: AKy350YpQG1QeS/JHf1yz/+Mbi9pos/zlzsSJzy4Cm1WDOD9XB83zWfD4msAOPcBGwB9h63MVlcOeGakOFuzLin2Osw=
X-Received: by 2002:a81:b603:0:b0:545:883a:544d with SMTP id
 u3-20020a81b603000000b00545883a544dmr730788ywh.9.1679560725079; Thu, 23 Mar
 2023 01:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230323012929.10815-1-dipenp@nvidia.com> <20230323012929.10815-11-dipenp@nvidia.com>
In-Reply-To: <20230323012929.10815-11-dipenp@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Mar 2023 09:38:33 +0100
Message-ID: <CACRpkdapq1cR5id3K3zASprmUbTmh+QixyUEZFjNqYZPjWw2qw@mail.gmail.com>
Subject: Re: [PATCH V4 10/10] gpio: tegra186: Add Tegra234 hte support
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org,
        timestamp@lists.linux.dev, krzysztof.kozlowski+dt@linaro.org,
        brgl@bgdev.pl, corbet@lwn.net, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 23, 2023 at 2:29=E2=80=AFAM Dipen Patel <dipenp@nvidia.com> wro=
te:

> To enable timestamp support for the Tegra234, has_gte variable needs
> to be set true.
>
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
