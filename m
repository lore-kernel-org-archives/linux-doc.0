Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B11AA7D043
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Jun 2018 00:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752743AbeFTAmu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 19 Jun 2018 20:42:50 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:39393 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751337AbeFTAms (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jun 2018 20:42:48 -0400
Received: by mail-wm0-f68.google.com with SMTP id p11-v6so3567057wmc.4;
        Tue, 19 Jun 2018 17:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=HRO9VpMe4KYsBumeKIDw9RFhRENymY0Bj7HlMwmnW+4=;
        b=oAr7hNfAn9slZUaQFOWWnF6SVcHO4Rl8bxWPyM6kUQCCjYY2/BcnhuLNRA+TZsXyBD
         ZOIv+AYuR6MgAcsFa8lqA6FEW6rpdor6uWJr1CEtQcCutn8X5iE1PXaxbkCToSjUg3+z
         B/RjEdng4Fka+is+BeZ/REGYVkIX1H4ITlF5f9920GH0Vne5Dv+0ddu92R2dMXU9CQ9g
         qqJ/Y6Wr1VEqPle/EGRuKySFygCQYfUlobGycvwC7vC4F/HecXk5Zk96Bha5XK5U3kgz
         AC7+h6WFBM09h6HQRSUmehX4CCuQZNY3EO8IF60+JzJJG187yNzuXQIzroXWwL7yixqN
         SsLg==
X-Gm-Message-State: APt69E1ex0J7kIvy82m1dIggS1Su7m27vl0bnXEGUDisHciPRXClM+ds
        JFGbM4yKEDlspg2Qp2qhwpOKy3hF
X-Google-Smtp-Source: ADUXVKKuDcCXGIUFIVn+Nb3Cw8uIj5J1FwEDrMjVnbfqUJFDR0x5wvB+Yxj+dOgHNqmoTyX+TdTcfA==
X-Received: by 2002:a50:93c5:: with SMTP id o63-v6mr16388780eda.311.1529455366465;
        Tue, 19 Jun 2018 17:42:46 -0700 (PDT)
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id b3-v6sm513695edi.60.2018.06.19.17.42.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jun 2018 17:42:45 -0700 (PDT)
Received: by mail-wr0-f174.google.com with SMTP id x4-v6so1399795wro.11;
        Tue, 19 Jun 2018 17:42:43 -0700 (PDT)
X-Received: by 2002:adf:e94e:: with SMTP id m14-v6mr15883622wrn.126.1529455363602;
 Tue, 19 Jun 2018 17:42:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:a158:0:0:0:0:0 with HTTP; Tue, 19 Jun 2018 17:42:23
 -0700 (PDT)
In-Reply-To: <bce1b59268ac2d659fd7cb37f89285ef2acc8316.1528990947.git.mchehab+samsung@kernel.org>
References: <cover.1528990947.git.mchehab+samsung@kernel.org> <bce1b59268ac2d659fd7cb37f89285ef2acc8316.1528990947.git.mchehab+samsung@kernel.org>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Wed, 20 Jun 2018 08:42:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v67s29mYa+hcYFWCokmzLwi7aYyeBwDnQiTJQYxT0GxPNA@mail.gmail.com>
Message-ID: <CAGb2v67s29mYa+hcYFWCokmzLwi7aYyeBwDnQiTJQYxT0GxPNA@mail.gmail.com>
Subject: Re: [PATCH v3 24/27] devicetree: fix a series of wrong file references
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Xiaowei Song <songxiaowei@hisilicon.com>,
        Binghui Wang <wangbinghui@hisilicon.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-input@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-pci@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 15, 2018 at 12:09 AM, Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
> As files got renamed, their references broke.
>
> Manually fix a series of broken refs at the DT bindings.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---

>  Documentation/devicetree/bindings/mfd/sun6i-prcm.txt |  2 +-

Acked-by: Chen-Yu Tsai <wens@csie.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
