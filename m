Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E7EC433FE
	for <linux-doc@archiver.kernel.org>; Mon, 21 Nov 2022 21:28:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbiKUV2O (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Nov 2022 16:28:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbiKUV2M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Nov 2022 16:28:12 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B8721EAC0
        for <linux-doc@vger.kernel.org>; Mon, 21 Nov 2022 13:28:05 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 6C3E9377;
        Mon, 21 Nov 2022 21:28:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6C3E9377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1669066085; bh=/9gGADghPFozF+5W7dhf4efO2cbfc8YDZBomuTYNPdI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Ud07wHzN+wwDudgm0BBZ5agrffNjGSbP29NQkATKyamwKzh4kGjN/d46MoS8iNJSb
         9kz7vumEvyVcB5Z7wrGU9FLZ/nZTpXlVo+mTwm4hR2SM0r0YuwxzAOtyTxxLzGea1M
         u3pohZncL03rIkEe/NriNSsaDIplZgQ6yRujn2b1EKWRag9kPIdW2gE5eG3Fz83bg4
         hP8aiin07AUiRGZDBZgryrizj0OPc/N1oVbLMT8SF8T+Wc5SCaEtVL9zpfRz3sZCmk
         0hJ83PdwfhDnpevgNMGrIfKwiBaE597YeX5FRirRPREt0oBBSUCq0hFIim08R2ynDl
         V0VaSoE8k9zGg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Maxim Cournoyer <maxim.cournoyer@gmail.com>,
        linux-doc@vger.kernel.org
Cc:     Maxim Cournoyer <maxim.cournoyer@gmail.com>
Subject: Re: [PATCH v2 2/2] doc: specify an 'html' build sub-directory for
 the htmldocs target
In-Reply-To: <20221116190210.28407-3-maxim.cournoyer@gmail.com>
References: <20221116190210.28407-1-maxim.cournoyer@gmail.com>
 <20221116190210.28407-3-maxim.cournoyer@gmail.com>
Date:   Mon, 21 Nov 2022 14:28:04 -0700
Message-ID: <8735ac9evv.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Maxim Cournoyer <maxim.cournoyer@gmail.com> writes:

> Having the generated HTML documentation under its own output
> sub-directory makes it easier to install, since it's clean from
> .doctrees or other output formats.
>
> Signed-off-by: Maxim Cournoyer <maxim.cournoyer@gmail.com>
> ---
>  Documentation/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/Makefile b/Documentation/Makefile
> index bb73dcb5ed05..bd8dac560633 100644
> --- a/Documentation/Makefile
> +++ b/Documentation/Makefile
> @@ -93,7 +93,7 @@ quiet_cmd_sphinx = SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
>  
>  htmldocs:
>  	@$(srctree)/scripts/sphinx-pre-install --version-check
> -	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),,$(var)))
> +	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),html,$(var)))

I think I'm going to hold off on this one.  As I said before, it would
have made sense to do things this way when we made the transition.  At
this point, though, I think the potential for trouble outweighs the
benefits that would come from moving things around in this way.

Thanks,

jon
