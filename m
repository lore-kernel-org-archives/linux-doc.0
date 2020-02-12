Return-Path: <SRS0=JB9+=4A=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3DEC3B187
	for <linux-doc@archiver.kernel.org>; Wed, 12 Feb 2020 22:12:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2131821569
	for <linux-doc@archiver.kernel.org>; Wed, 12 Feb 2020 22:12:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VresCRs7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727692AbgBLWMd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 Feb 2020 17:12:33 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:39103 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727564AbgBLWMd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Feb 2020 17:12:33 -0500
Received: by mail-il1-f196.google.com with SMTP id f70so3170790ill.6
        for <linux-doc@vger.kernel.org>; Wed, 12 Feb 2020 14:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wdP0ovbmvDZYICvamxtqlMozHNpRomdhcvqsRnXUQX4=;
        b=VresCRs7yf8cbcowW6xFfScuoMordtYPvocPOGgkt/bPIgpHRVM/9mqFXzeGqUPm8B
         fzEbCFsUglJPKjsqx1S+BS2RbwUajDAmEnKKl9Ck+uVdICJs6q7yyT6ZJNI04OFcVZ6A
         af7oFXo7sM8ftd8b6CgpWgE4Gq2fNYTpdbWKf9KQMSBAatHRH4GED2NwxqIghtxCeo5E
         KuG9TSJldrgGFrWBi3KNzAdtka2zX09Z7JRzKzYLF4WCL9PJ5/GICJjfyTabuMD1LxbC
         /7HhEfbYYRx7CnvW1t5gusqLs2iuymJBqUw7d+wq2nfmY7QBae3V8YekmU3mdfyhR8+N
         yP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wdP0ovbmvDZYICvamxtqlMozHNpRomdhcvqsRnXUQX4=;
        b=jCVTJb2ETQmp7BO5nsrnqsMbSB+D45f9aQS6Pv2l/TaLkFw6Pg42joAIHnb0gqb0Kf
         zrcYA23UaxQEkDm6cvp9KTyfhTd1fEajvjDRCxRyBoiafU2zU8VHmuCKe9HpqYFRuIcl
         /HrmTy6/243WTDiWGav+nBfvM05IWoNoXb/9MwFZCvpJ1OHN1B+j856jwpv2ezaR6WJ+
         JeRwZMC43X8ToIcyQ0Hjd6FIREYExMprfWYqkFXVsOwG33j5+SwwVfnj+aBcI/A7HL15
         /Oip0cqxm0cbcXzsmpmQGoKveYxdozY7Pxhjb2Msn91FRcez7tRvlxEO57fcoZkFxXH4
         nbPQ==
X-Gm-Message-State: APjAAAWkRTuoG7MBcx7Prddryd7eiDiejV+RtQhk+3UZoMLvq4zlVB7n
        zrLCLvoFE1DTXznIzO7Vxk8/nq5un5MvQqU6VeRuZg==
X-Google-Smtp-Source: APXvYqypi6T4y7kMEvHg1Wp3t1NjZK6kQRjwYnUxOcPiraf/Rq4rl1Q7RmE+/7ISPHkiwPO2rJG+YhCvwacW4+TI/18=
X-Received: by 2002:a92:9f1a:: with SMTP id u26mr13534880ili.72.1581545552462;
 Wed, 12 Feb 2020 14:12:32 -0800 (PST)
MIME-Version: 1.0
References: <20200210213924.20037-1-mike.leach@linaro.org> <20200210213924.20037-12-mike.leach@linaro.org>
 <20200211115852.GA52147@bogus>
In-Reply-To: <20200211115852.GA52147@bogus>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 12 Feb 2020 15:12:21 -0700
Message-ID: <CANLsYkxOK+21JutM7ryz1ux0gHBTa51q5r-9i18kFLvMKouShA@mail.gmail.com>
Subject: Re: [PATCH v9 11/15] dt-bindings: arm: Juno platform - add CTI
 entries to device tree.
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Mike Leach <mike.leach@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>,
        Rob Herring <robh+dt@kernel.org>, maxime@cerno.tech,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andy Gross <agross@kernel.org>, Jon Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 11 Feb 2020 at 04:59, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Mon, Feb 10, 2020 at 09:39:20PM +0000, Mike Leach wrote:
> > Add in CTI entries for Juno r0, r1 and r2 to device tree entries.
> >
>
> I can take this patch alone unless you have plans to take all in go.

Please hang on to it for the moment.  I'll get back to you if/when we
decide to move forward with this set.

Thanks,
Mathieu

>
> --
> Regards,
> Sudeep
