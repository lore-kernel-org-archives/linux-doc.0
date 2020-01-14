Return-Path: <SRS0=14SN=3D=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B97C33CB3
	for <linux-doc@archiver.kernel.org>; Tue, 14 Jan 2020 22:21:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A00832187F
	for <linux-doc@archiver.kernel.org>; Tue, 14 Jan 2020 22:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579040504;
	bh=RNCkUDCwyLro5zJmU3mlVSOjQp7cTxat5/T5mKGVwXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=HpJejJDvJJ2dKDPfgAtCEmkj5erUQpNMf6usnUycjhz61w5z9qmOpFIDPM3igauh4
	 Gd23y++dD5SBSoAiPSZq2d7TYwRDj7r9aw+gOpSgf8n8NvWmNtm/3xC2dUd3EoHTTM
	 rDx08g48b1cKcMxNCEbTT6D0t4V/PLmrOHALYaeE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728808AbgANWVo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Jan 2020 17:21:44 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42977 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727102AbgANWVo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Jan 2020 17:21:44 -0500
Received: by mail-ot1-f68.google.com with SMTP id 66so14253243otd.9
        for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2020 14:21:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WS8NlkYRgt1yxklwHlCzn8AYd/wck8523N3nH8IJHG4=;
        b=CdR6WWzoN2XvPvcr2EeYb78IogNEwa+FQ2C38CGZrkknSteSNhQFxiR35JXO7WvTe7
         +3IsjkGeqeq548hsKmBTa83CHKQ61Si8eOgOmGD0TZnHLvqojHPhH71j+NyXsmPboZO4
         Hq35s4032BGrDESSPRGvZL5+qVY8tZHX50uzl6lpLlY5MaYUW+Zh/NaaSx/nB0b8rdXW
         m4vPH/ZZ5a6vRkw7sEsZSUGmWDe934P2V0m8ba3p/AtIFzccfthLLeq0X8zDYL9/sakD
         v0NE74xKeLYFWCfTKuRw84VZDrU9+RL5BEFkIThoWkSyXg0aUoi7mzZZXkzF31Rx9SAz
         layg==
X-Gm-Message-State: APjAAAVp63dMqdhqL4WyQHQricOUUofS5wgOuSub9GPln3ZPpEr6eG4k
        CNP3YVwfSrz3uvnVxNurMKh9JXA=
X-Google-Smtp-Source: APXvYqw53brXbCI7X1NAxqdpq4w4w+PUAEYtaAROfH1vH2NlnaGcIY2c6VQvCBO9b9zoJOkB9D+IBw==
X-Received: by 2002:a05:6830:11d2:: with SMTP id v18mr479490otq.151.1579040503020;
        Tue, 14 Jan 2020 14:21:43 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c10sm5799902otl.77.2020.01.14.14.21.40
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 14:21:41 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2209ae
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Tue, 14 Jan 2020 16:21:40 -0600
Date:   Tue, 14 Jan 2020 16:21:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     mike.leach@linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        robh+dt@kernel.org, maxime@cerno.tech, liviu.dudau@arm.com,
        sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, agross@kernel.org,
        corbet@lwn.net
Subject: Re: [PATCH v8 05/15] dt-bindings: arm: Adds CoreSight CTI hardware
 definitions.
Message-ID: <20200114222140.GA20488@bogus>
References: <20200113213149.25599-1-mike.leach@linaro.org>
 <20200113213149.25599-6-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113213149.25599-6-mike.leach@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 13 Jan 2020 21:31:39 +0000, Mike Leach wrote:
> Adds new coresight-cti.yaml file describing the bindings required to define
> CTI in the device trees.
> 
> Adds an include file to dt-bindings/arm to define constants describing
> common signal functionality used in CoreSight and generic usage.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  .../bindings/arm/coresight-cti.yaml           | 336 ++++++++++++++++++
>  .../devicetree/bindings/arm/coresight.txt     |   7 +
>  MAINTAINERS                                   |   2 +
>  include/dt-bindings/arm/coresight-cti-dt.h    |  37 ++
>  4 files changed, 382 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/coresight-cti.yaml
>  create mode 100644 include/dt-bindings/arm/coresight-cti-dt.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
