Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288DCC00140
	for <linux-doc@archiver.kernel.org>; Fri, 12 Aug 2022 14:04:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232822AbiHLOE1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 12 Aug 2022 10:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238692AbiHLOE0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Aug 2022 10:04:26 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24A7DAA3CB
        for <linux-doc@vger.kernel.org>; Fri, 12 Aug 2022 07:04:25 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id y18so812132qtv.5
        for <linux-doc@vger.kernel.org>; Fri, 12 Aug 2022 07:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=VBAjU83tQT7VU7gsHM0nZ+8NS5zbtDUPFruhW9l2nrU=;
        b=Vo+fGxnAtvm+o7kBnhCF1vU5pNeELMwXIGr1JurH0ZSJY1mlSZTfg/VRD+P45uVRQU
         KNgxQwwRubeE+q7ExUpopFugNMMp4hl4RRATmb4M2tjjTQTPFjv1MULTA0QL+VpQ43Zo
         6UV1l6pDoDgQPFdmg/o+1ReKi+YBMTtCIQsG1eg5tsgdgCXT2IPyw9ajZw2AND/sFXud
         /yeHtjOCEJ4Sps+mnYX4XhzQSl+H5I3pXXkYAHZFRIUild/0zW3VwkaKBoWnvTxdNM00
         5h54J2ZxBbLx5NqALkzrgecb1Ds8xhf3zlZF4GIBWfQ3d08D4fryaUoIGBMnjWwsXi4s
         veoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=VBAjU83tQT7VU7gsHM0nZ+8NS5zbtDUPFruhW9l2nrU=;
        b=ZC5Sh++OSWuRLq+vCgIfmOaaoLHIEUY/fvicsFRPFfnpKLpNRda2L7YmRC4yzx4qQ/
         DbBbeMdMkcWikgcKZaUSBhfPKsy4qaRr3F8PnMswexPlcPnu7qT6GVJAZNwcaZwx9hjV
         ekwGAfWbEzplaSsVC/E8eFXgIxKxoyUJOewm1wha2uyGBIvnMwyM9QTq+nZVVu4FABD9
         1DTBOQcNUX/s5Tt7xPp+VugTKSRhGwLAh4O+RbGb5CaTG02xVCdzh0wUGrtKJo+ptVyW
         zP5QBo6TXKrpGDIoW8N5Ri0M2qjhR/QPBjGl8s8NuqosPIuz2duXuprbY0Lr5aNstAtC
         mAqQ==
X-Gm-Message-State: ACgBeo1z2Yci/EOMkLxigDgx7jc3GgGWOUdbh0pC0Osh4Pjo6Vw6ogiW
        VWhbeApevEXeTn+tqtj3T7Qmh66onssTI17+iO0=
X-Google-Smtp-Source: AA6agR76jKCYoQFkmAb0JhuSTZMGUaAx/l3mLN+HhuivFV5juJX0HYudjpk6tcIHPZsZSpycj4+yJg==
X-Received: by 2002:ac8:7e88:0:b0:31f:a54:c7c5 with SMTP id w8-20020ac87e88000000b0031f0a54c7c5mr3664024qtj.369.1660313064256;
        Fri, 12 Aug 2022 07:04:24 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id cr15-20020a05622a428f00b00342f7beccd0sm1695219qtb.45.2022.08.12.07.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 07:04:23 -0700 (PDT)
Date:   Fri, 12 Aug 2022 10:04:22 -0400
From:   Jon Mason <jdmason@kudzu.us>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/2] Documentation: PCI: Documentation fixes for vNTB
Message-ID: <YvZd5sqWSWSKkWiZ@kudzu.us>
References: <20220621200235.211b2e32@canb.auug.org.au>
 <20220622095345.27121-1-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622095345.27121-1-bagasdotme@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 22, 2022 at 04:53:43PM +0700, Bagas Sanjaya wrote:
> After merging ntb tree for linux-next integration testing, Stephen
> Rothwell reported following htmldocs warnings:
> 
> Documentation/PCI/endpoint/pci-vntb-function.rst:82: WARNING: Unexpected indentation.
> Documentation/PCI/endpoint/pci-vntb-howto.rst:131: WARNING: Title underline too short.
> 
> These warnings are introduced by commit 0c4b285d9636cc ("Documentation: PCI:
> Add specification for the PCI vNTB function device").
> 
> Fix these two warnings above by:
>   1. Using code block for scratchpad diagram ([1/2])
>   2. Extending "lspci output" subheading underline syntax ([2/2])
> 
> This patchset is based on next-20220622.
> 
> Bagas Sanjaya (2):
>   Documentation: PCI: Use code-block block for scratchpad registers
>     diagram
>   Documentation: PCI: extend subheading underline for "lspci output"
>     section
> 
>  Documentation/PCI/endpoint/pci-vntb-function.rst | 5 ++++-
>  Documentation/PCI/endpoint/pci-vntb-howto.rst    | 2 +-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> 
> base-commit: ac0ba5454ca85162c08dc429fef1999e077ca976
> -- 
> An old man doll... just what I always wanted! - Clara
> 

Sorry for the extremely long delay in response.  This series is in my
ntb branch and will be in my pull request for v5.20 which should be
going out later today.

Thanks,
Jon
