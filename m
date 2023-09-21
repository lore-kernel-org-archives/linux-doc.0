Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC6FE7D0A0
	for <linux-doc@archiver.kernel.org>; Thu, 21 Sep 2023 17:27:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjIUR13 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Sep 2023 13:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbjIUR1F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Sep 2023 13:27:05 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A376430E1
        for <linux-doc@vger.kernel.org>; Thu, 21 Sep 2023 10:03:00 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3216ba1b01eso1195462f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 21 Sep 2023 10:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695315704; x=1695920504; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Drrb5cgIdX9bQlcJOAIQy6p22Hd1U/QgsuYhc+HIXtc=;
        b=z7gCiasB8HQnq9SQcH8ArrRMg3r2UxHWt++9byLXvUIzZODSNqzTmJ3KW5DTjMnudB
         aY1uU0UQfSX6eufrr4bb2tcyrtvgd6OTFMWTKs+Ym/o3JKXUeHd2EPOXc9MThn8oT1A8
         fKbXyV/sDzVZkCzjAWoJWkRuLpc/V5JINxsJqi46wZkR/I2oMf8wjvaz2oINjQutGynh
         eWDQLFlcHmtecyF+xFoITVJjnfwJqQSvK88Cefm3wwrXoiwPXnC7b0A6Kuk4k2Ia8J3J
         YFlh4M996eNAJaXMakMssQu0M6xk14ef2V02JUmjVYE5GH/u0vMb3w/IHFWyh95kmYQP
         JD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695315704; x=1695920504;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Drrb5cgIdX9bQlcJOAIQy6p22Hd1U/QgsuYhc+HIXtc=;
        b=D58NhJ1FC0sIKSr5FBEJh9c7ph6n/viSZ8meNNFkuWLGgkVmsXCIIrXfZ/KRmT3nsS
         lqKIjiWYPUvW1nvzPGnpEBaTh3xDRYotDS+now/uSbvtTzXOLMYunbo7vHRky5hfJSHs
         XzhhxXvaLVHK+srNYats/o4/nq0IqReaEBerOL7jd8qxIrMwjs42ERz5PIVp2ADmDdU9
         jNPCXVQEszIYtuhnmWXj1IHi6gdYGcsQLWyD1Oq7wVyxvQXU8wzjvYSWFjauWuGLkAY/
         BIYl9zo3X+ImfDg7hDlJcks/QJyfewlTjJR4Nk87tPctx/ZxGRbsaN/EfpLkL3BG0Pr7
         yFhA==
X-Gm-Message-State: AOJu0YzFryqnDYrVLK28fPavMWBmdYIo2/7rMkzvFbVrfyGu8AD7FiZt
        ENA4WiMKtY3p8vfn2f/WoeAMzLkWf5IlwPZZGsmqGUx8Oe9txiMCpZoh2g==
X-Google-Smtp-Source: AGHT+IHtAdCqWfyKxt1ELmKKg//qfdzKK9qhy8uM34Bqm0u8o8sOZrkwXfRLF0pU4lRrTWBBCH79wK6kC1VudFfOvFA=
X-Received: by 2002:a05:6402:3228:b0:533:f22:17b9 with SMTP id
 g40-20020a056402322800b005330f2217b9mr3895347eda.19.1695289023375; Thu, 21
 Sep 2023 02:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <ME3P282MB270323F98B97A1A98A50F8F7BBF1A@ME3P282MB2703.AUSP282.PROD.OUTLOOK.COM>
 <ZQF+PHTYDZRX1gql@nanopsycho>
In-Reply-To: <ZQF+PHTYDZRX1gql@nanopsycho>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 21 Sep 2023 11:36:26 +0200
Message-ID: <CAMZdPi-qZ3JjZmEAtEmJETNzKd+k6UcLnLkM0MZoSZ1hKaOXuA@mail.gmail.com>
Subject: Re: [net-next v4 0/5] net: wwan: t7xx: fw flashing & coredump support
To:     Jiri Pirko <jiri@resnulli.us>
Cc:     Jinjian Song <songjinjian@hotmail.com>, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        corbet@lwn.net, ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
        chandrashekar.devegowda@intel.com, linuxwwan@intel.com,
        chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com,
        m.chetan.kumar@linux.intel.com, ricardo.martinez@linux.intel.com,
        netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, nmarupaka@google.com,
        vsankar@lenovo.com, danielwinkler@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 13 Sept 2023 at 11:17, Jiri Pirko <jiri@resnulli.us> wrote:
>
> Tue, Sep 12, 2023 at 11:48:40AM CEST, songjinjian@hotmail.com wrote:
> >Adds support for t7xx wwan device firmware flashing & coredump collection
> >using devlink.
>
> I don't believe that use of devlink is correct here. It seems like a
> misfit. IIUC, what you need is to communicate with the modem. Basically
> a communication channel to modem. The other wwan drivers implement these
> channels in _ctrl.c files, using multiple protocols. Why can't you do
> something similar and let devlink out of this please?
>
> Until you put in arguments why you really need devlink and why is it a
> good fit, I'm against this. Please don't send any other versions of this
> patchset that use devlink.

The t7xx driver already has regular wwan data and control interfaces
registered with the wwan framework, making it functional. Here the
exposed low level resources are not really wwan/class specific as it
is for firmware upgrade and coredump, so I think that is why Jinjian
chose the 'feature agnostic' devlink framework. IMHO I think it makes
sense to rely on such a framework, or maybe on the devcoredump class.

That said, I see the protocol for flashing and doing the coreboot is
fastboot, which is already supported on the user side with the
fastboot tool, so I'm not sure abstracting it here makes sense. If the
protocol is really fasboot compliant, Wouldn't it be simpler to
directly expose it as a new device/channel? and rely on a userspace
tool for regular fastboot operations (flash, boot, dump). This may
require slightly modifying the fastboot tool to detect and support
that new transport (in addition to the existing usb and ethernet
support).

Regards,
Loic
