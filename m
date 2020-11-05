Return-Path: <SRS0=kdU1=EL=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E84FC55178
	for <linux-doc@archiver.kernel.org>; Thu,  5 Nov 2020 19:06:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B99FB2078E
	for <linux-doc@archiver.kernel.org>; Thu,  5 Nov 2020 19:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604603167;
	bh=XIKVJv2k/2hdJ+mfqI3w3BUnDFksbMV8D25VF4rXnCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=DOuJjkIML3KKj6JQo0i8gQnah7TcBQh2dGw546mnWgAjJbtxZz4Olo1uzqzZJcvEN
	 2bzVHXR/X0bnB3YjxJyzZIhnFRvjwEyj+MMXenMXvDxWlg31545Zw/q6KFzzHMF6Xz
	 3yc6rrUGda8TWJMPkfWe3Ne7EzKVk4D4hrKIeJR4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731985AbgKETGD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Nov 2020 14:06:03 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41513 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbgKETGD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Nov 2020 14:06:03 -0500
Received: by mail-oi1-f195.google.com with SMTP id m13so2785282oih.8;
        Thu, 05 Nov 2020 11:06:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5TdTBo8+xhg1iEq7AD8ddCfAOVpH58Ab88MfiBQ3Rdo=;
        b=AwLcNw95Z9cdmMaXkiQ/nFdlwtLMPBIWeCGZwoCRnZtp75JW7PBOzieP9+gYlouxNM
         0CId0Ak3MlExpx6+yTjGif674vQhQFDFRvlPrDV8zCyh1MDoFoZ1xCJc0d2VwYcP9LpR
         KQNKazaHAeTch/FxHmeXTTwfgzMJOcoTlC2fZR4lU5W4reU5Ss6VlWvjJOywuOzwUgx2
         6UZpaZjDnGz+e/cjOpSA3WdjD29T07MPTgbnQXxnUcEJmhg0wB5XqfZTk1iuqcw5WF0n
         Rq4BxJvEKc3gWsY4racPx7O+Ak36yV1Xnxr1julQRxerVDfIkXiqUPxUHh9VxGsTZLgE
         Ah1Q==
X-Gm-Message-State: AOAM530WoeRYj7AEJvGbX9+CwuzOaPTBXeAa5KtXMa+jG3WH5MTlGksP
        l5v0Msgw6pgggOEqoYuLhAMKiFgA04FK
X-Google-Smtp-Source: ABdhPJzvEnno8CWZseyI+f28L7rppStqqjiyCy/Xq1WHbvbGfPOCft3nRAzqjzbuvTpHPXVpCAM3gg==
X-Received: by 2002:aca:4257:: with SMTP id p84mr556542oia.68.1604603161729;
        Thu, 05 Nov 2020 11:06:01 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h4sm537209oot.45.2020.11.05.11.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 11:06:01 -0800 (PST)
Received: (nullmailer pid 1643637 invoked by uid 1000);
        Thu, 05 Nov 2020 19:06:00 -0000
Date:   Thu, 5 Nov 2020 13:06:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc:     kuba@kernel.org, robh+dt@kernel.org, davem@davemloft.net,
        netdev@vger.kernel.org, leoyang.li@nxp.com,
        linuxppc-dev@lists.ozlabs.org, ioana.ciornei@nxp.com,
        linux-arm-kernel@lists.infradead.org, corbet@lwn.net,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ionut-robert Aron <ionut-robert.aron@nxp.com>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: misc: convert fsl, dpaa2-console from
 txt to YAML
Message-ID: <20201105190600.GA1643395@bogus>
References: <20201105141114.18161-1-laurentiu.tudor@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105141114.18161-1-laurentiu.tudor@nxp.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 05 Nov 2020 16:11:13 +0200, Laurentiu Tudor wrote:
> From: Ionut-robert Aron <ionut-robert.aron@nxp.com>
> 
> Convert fsl,dpaa2-console to YAML in order to automate the
> verification process of dts files.
> 
> Signed-off-by: Ionut-robert Aron <ionut-robert.aron@nxp.com>
> Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> ---
>  .../bindings/misc/fsl,dpaa2-console.txt       | 11 ---------
>  .../bindings/misc/fsl,dpaa2-console.yaml      | 23 +++++++++++++++++++
>  2 files changed, 23 insertions(+), 11 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/misc/fsl,dpaa2-console.txt
>  create mode 100644 Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml: 'additionalProperties' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml


See https://patchwork.ozlabs.org/patch/1395015

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

