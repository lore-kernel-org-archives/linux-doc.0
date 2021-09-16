Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE625C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:18:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF86261185
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:18:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235130AbhIPJUR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Sep 2021 05:20:17 -0400
Received: from foss.arm.com ([217.140.110.172]:35242 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234268AbhIPJUQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 16 Sep 2021 05:20:16 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 312506D;
        Thu, 16 Sep 2021 02:18:56 -0700 (PDT)
Received: from bogus (unknown [10.57.23.241])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E41B53F5A1;
        Thu, 16 Sep 2021 02:18:54 -0700 (PDT)
Date:   Thu, 16 Sep 2021 10:18:36 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/24] MAINTAINERS: update arm,vic.yaml reference
Message-ID: <20210916091836.oevsk4eui6wa7xkt@bogus>
References: <cover.1631783482.git.mchehab+huawei@kernel.org>
 <61989ac6bc0bece7078c32320049c74443bbb5ba.1631783482.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61989ac6bc0bece7078c32320049c74443bbb5ba.1631783482.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 16, 2021 at 11:14:05AM +0200, Mauro Carvalho Chehab wrote:
> Changeset b7705ba6d0c4 ("dt-bindings: interrupt-controller: Convert ARM VIC to json-schema")
> renamed: Documentation/devicetree/bindings/interrupt-controller/arm,vic.txt
> to: Documentation/devicetree/bindings/interrupt-controller/arm,vic.yaml.
> 
> Update its cross-reference accordingly.
> 
> Fixes: b7705ba6d0c4 ("dt-bindings: interrupt-controller: Convert ARM VIC to json-schema")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0ea4cd772a0c..f02d1c94a219 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1550,7 +1550,7 @@ ARM PRIMECELL VIC PL190/PL192 DRIVER
>  M:	Linus Walleij <linus.walleij@linaro.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/interrupt-controller/arm,vic.txt
> +F:	Documentation/devicetree/bindings/interrupt-controller/arm,vic.yaml
>  F:	drivers/irqchip/irq-vic.c

You seem to have dropped the tags already provided here [1]

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/7dbff9673e8703cd60e78f8b2110349d86d60a87.1626947923.git.mchehab+huawei@kernel.org
