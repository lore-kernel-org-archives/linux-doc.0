Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04FBAC27C40
	for <linux-doc@archiver.kernel.org>; Wed, 23 Aug 2023 21:28:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232847AbjHWV2P (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Aug 2023 17:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234427AbjHWV1t (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Aug 2023 17:27:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A49FCEE;
        Wed, 23 Aug 2023 14:27:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CDC0666304;
        Wed, 23 Aug 2023 21:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44221C433C7;
        Wed, 23 Aug 2023 21:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692826066;
        bh=PadaEDKvbss1R09ksA7Vme1mVb0BrzW+7fddYJQYEaY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N7jfPp6Aj1qdjwNSgeYeMpl+cecQAz9UnceJeNiS3tXrK7yDAnqnYhhibDcKy3pEp
         oDLdou4O364SGzCx+99PH0uCw/VzOf6YWNvvkKhR6agof3eQZimKW3RC0tjjLSVpvP
         8ewDzRjTlM8nRykfj/930byab09ZdWYyefZxCkjqx3ND6TM8FTgsh9O3GzG/p04j6j
         ct9OtGmywDazNfzio0WSd8QIq5WZryPWlkvFAUmiPCKh60Ch18X89hmWS+Bd+BPwvX
         aFu+Mzw5p1A2pQhQU0fIk/il860LN2kampPKOtgmGvcGlS/kn+yHg8YdvR9k9suffP
         42OX8Fpcs0OSg==
Received: (nullmailer pid 2915007 invoked by uid 1000);
        Wed, 23 Aug 2023 21:27:44 -0000
Date:   Wed, 23 Aug 2023 16:27:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Fabio Estevam <festevam@denx.de>, giometti@enneenne.com,
        linux-doc@vger.kernel.org, kernel test robot <lkp@intel.com>,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH] MAINTAINERS: pps: Update pps-gpio bindings location
Message-ID: <169282605431.2914753.6885024870777628111.robh@kernel.org>
References: <20230822213317.60798-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822213317.60798-1-festevam@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On Tue, 22 Aug 2023 18:33:17 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The pps-gpio bindings have been converted to yaml.
> 
> Update the file path accordingly.
> 
> Fixes: 7ceb60ece856 ("dt-bindings: pps: pps-gpio: Convert to yaml")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202308230517.n0rrszYH-lkp@intel.com/
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

