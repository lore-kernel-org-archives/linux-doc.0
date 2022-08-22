Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A3FBC28D13
	for <linux-doc@archiver.kernel.org>; Mon, 22 Aug 2022 16:02:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236528AbiHVQCK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Aug 2022 12:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236589AbiHVQCH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Aug 2022 12:02:07 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC59230F77
        for <linux-doc@vger.kernel.org>; Mon, 22 Aug 2022 09:02:05 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id y141so10756232pfb.7
        for <linux-doc@vger.kernel.org>; Mon, 22 Aug 2022 09:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=/t37Y/XRZJtMV+m9MWZM5nZfrYqA7SIqOEoInluHa74=;
        b=vn5frK8UBLnyvshTin6f/PIYv++RSvtQBbd4DJPuQ7AE4++orS/CaUpYAKU/Lsp9b7
         8gJQT7lpcBBScAGQnTpurRvuE6ZJDe/IbqpHNJ2HSu55kz5sbRaJABugUWPvP/EtbUyL
         6wWscbO7vzai66hmo4fUGLLMn0FGE7foNNsHjzgaSRzNgs4gWzuA9Ojr9WEN6TfTQusH
         aMsBYKPVeSYo2NcCo40NsWQSlgxH1ypnn4NjATTIPK2uYvaQoT3pFhUGPblX9AoDj5kY
         zWg5+OHFmyEyIB8gYf29XJkE/rZ0Roo4hH8TbbQXLynfuGyb3df/VwCoWzqE4Z7cTJLJ
         1W0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=/t37Y/XRZJtMV+m9MWZM5nZfrYqA7SIqOEoInluHa74=;
        b=gzlbC70qz9yPyvTqhMhhlSFKZ1JP5L77vs/q7WgfEJza7V6iPcTZ8S0T+OkwP6cPjO
         600xRcKVDCiMO3C3YGIHtj/Oadm2PRtkQM912sLgvY2pfQlBeAONOVDmKEClXNrfZcxr
         8ujPUsxTHgCiFgzy2TdfnH4y2/yeKzyN9aYi9iD6GwIO5OSR6rYtHVTIvPLFdknYoafN
         gnEAl2bc0GihQa6iNmMDNPBG/ck059wPzFAutsnjdNf34gYnza/NTZJjvslI+RIQAWvU
         MNpS9V7+4pDS2KIekiQ+qVGbU0dEJPXDyIQhLGQPDLRlrXxVTIYnikZkrJC8Pn+eCd3e
         q/sA==
X-Gm-Message-State: ACgBeo3m0zaK2rMV5U8u33N/ND9I/kkNHOjJQHQFTH/5uaNkwDZWt8rR
        cuSAVJcwckeUHEQC0W5X5f/+dw==
X-Google-Smtp-Source: AA6agR6jRUlV7R30+1RiGKXPv/OnKqwkmFkuRZ8RG9kwsxsXEfaH5hrD9w2dLOIRvYz/TpjFVeVmlg==
X-Received: by 2002:a63:131c:0:b0:427:7f15:470f with SMTP id i28-20020a63131c000000b004277f15470fmr18004165pgl.232.1661184125347;
        Mon, 22 Aug 2022 09:02:05 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902654500b00172bd7505e6sm7059021pln.12.2022.08.22.09.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 09:02:04 -0700 (PDT)
Date:   Mon, 22 Aug 2022 10:02:02 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Leo Yan <leo.yan@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] coresight: docs: Fix a broken reference
Message-ID: <20220822160202.GB1583519@p14s>
References: <c7f864854e9e03916017712017ff59132c51c338.1659251193.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7f864854e9e03916017712017ff59132c51c338.1659251193.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jul 31, 2022 at 09:06:48AM +0200, Christophe JAILLET wrote:
> Since the commit in Fixes: tag, "coresight-cpu-debug.txt" has been turned
> into "arm,coresight-cpu-debug.yaml".
> 
> Update the doc accordingly to avoid a 'make htmldocs' warning
> 
> Fixes: 66d052047ca8 ("dt-bindings: arm: Convert CoreSight CPU debug to DT schema")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  Documentation/trace/coresight/coresight-cpu-debug.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Applied.

Thanks,
Mathieu

> diff --git a/Documentation/trace/coresight/coresight-cpu-debug.rst b/Documentation/trace/coresight/coresight-cpu-debug.rst
> index 993dd294b81b..836b35532667 100644
> --- a/Documentation/trace/coresight/coresight-cpu-debug.rst
> +++ b/Documentation/trace/coresight/coresight-cpu-debug.rst
> @@ -117,7 +117,8 @@ divide into below cases:
>  Device Tree Bindings
>  --------------------
>  
> -See Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt for details.
> +See Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml for
> +details.
>  
>  
>  How to use the module
> -- 
> 2.34.1
> 
