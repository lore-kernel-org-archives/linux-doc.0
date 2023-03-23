Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B514C74A5B
	for <linux-doc@archiver.kernel.org>; Thu, 23 Mar 2023 08:39:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbjCWIj5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Mar 2023 04:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbjCWIj3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Mar 2023 04:39:29 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D23DE13DE0
        for <linux-doc@vger.kernel.org>; Thu, 23 Mar 2023 01:38:04 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id j7so23886255ybg.4
        for <linux-doc@vger.kernel.org>; Thu, 23 Mar 2023 01:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679560683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uq8iULvcx+/Gb+0OFAUtoLewabyi+bElNPlA9W28jjU=;
        b=QE23HGJQHnGAd09QtB+TQS3Q2R0AzQuCJycDS0LJ3CvnhtMzqkExBmjQuj/DUSULwW
         CdTUyRpJfr0BxLeiqJk77HGiEpcXePcfNRVwAuvI4fjDQMcfKVbD5YDefCwoepOjxwZs
         CRKobbEslFR4+47TabRND3zS6BWHhNJQPmXbEQsdpKGm0+ZIf0RjTtSzFo1V0GM4z8iO
         t8YpWg2zcFpkTKc8apwndzQ5TnHNOY/z+enoDLOK1JvEzONxhz0ECaTqBZ98ytvb76mU
         C7s7uOR2SKQANO394Ed6N34I7/1N8dPGan68/QCltgPt0qY65XouFSoJLketbqzkmIx8
         o4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679560683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uq8iULvcx+/Gb+0OFAUtoLewabyi+bElNPlA9W28jjU=;
        b=eN7+kCxAx/FQUXFmqHRr+i49KIdpo5h7KCg4q/5K1LiV4grnEkOYn7E7QRudEJhYGi
         hlpUI8qLiQTn4+Iot1CDJRLnyNKd5Np6lmuSbgsgYrdOJP6etCBHvDoz6r5xLCllm3Le
         G7Gtm4SVa0bOYVFIw5W+BReKW7c8onfnoZTzgZAxzff23rjlVWr6yy0HrVeO27YzBGLD
         z2OqQR9e4u9qhpYwqzRc2O6uM0sieuMICDqyQaUe7MSl0O3Mebt6OeSYiYajPluMcSCJ
         Wt6vnnfwirDwY+Drxe3PypAvnbQeoO1JwKXmAv//i+wtejv6DWppHTWXEAthzh4ovL5/
         LEnw==
X-Gm-Message-State: AAQBX9dy9Eqc92+jjwdnOgL/bRwcHuk0pauidrC2++rEwXNKZu9RJZ0I
        lm6Hd4W0XyviMOE9vOV6xhDv2V3fyRVmNMJEZXj/Ig==
X-Google-Smtp-Source: AKy350Y1PGIFybckLNdnrmn7B3+z+PO42zpuO3LlrftnXKkUHf5Mxe7g7DsahcR71Hcc5jkg0FrjjJg/mpuCBsLCn1U=
X-Received: by 2002:a05:6902:124a:b0:b74:77fa:581d with SMTP id
 t10-20020a056902124a00b00b7477fa581dmr1459338ybu.4.1679560683403; Thu, 23 Mar
 2023 01:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230323012929.10815-1-dipenp@nvidia.com> <20230323012929.10815-10-dipenp@nvidia.com>
In-Reply-To: <20230323012929.10815-10-dipenp@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Mar 2023 09:37:52 +0100
Message-ID: <CACRpkda9A-1qKqUPMC=9JKN5uotUmTt2CGQZv5Z91wgrSmwtHw@mail.gmail.com>
Subject: Re: [PATCH V4 09/10] hte: handle nvidia,gpio-controller property
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

> The dt binding adds nvidia,gpio-controller property from Tegra234 SoC
> onwards to simplify code handling gpio chip search. The gpio chip search
> is needed for the AON GPIO GTE instances to map the hardware timestamp
> GPIO request (coming from the GPIO framework) to the tegra HTE
> providers. The patch also adds new gpio chip match function to match
> from the fwnode instead of the gpio controller label. The addition
> of the property does not break ABI for the existing Tegra194 code.
>
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>

Yups just like this!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
