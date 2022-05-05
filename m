Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C361DC433FE
	for <linux-doc@archiver.kernel.org>; Thu,  5 May 2022 19:18:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384956AbiEETV4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 May 2022 15:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384953AbiEETVz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 May 2022 15:21:55 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A87D5506CC
        for <linux-doc@vger.kernel.org>; Thu,  5 May 2022 12:18:14 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id m23so6804975ljb.8
        for <linux-doc@vger.kernel.org>; Thu, 05 May 2022 12:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=88e8YZNFZYblGW8T1vgvVrAcy4UJU9R/Uy+Mu/G/Bqs=;
        b=TO3jyCFIIWVak12/dNoncxn6wvPf/lF2QQMHoR/hglxIq6oe3bqG/dbiW4yCRojMI2
         UJUPqSoGDCbPqPO7zYcVzNDDmbh6XyBuJ2QFnVo5CMhpB3e9ygNVXSKKE8xfnn6WBlR1
         SD8cWkUr5oZMuRTeWsehuddfgXymLLGw29JRWkNpJYBQk7HhyF+PFsIumqMIyK+DEV00
         mAm5Nt8OJXcxjjAhhKoahg2nSrgXalRjyYdT4CfFx2kHXrQ8pC1kxcla6djH6LnN6N/2
         4lCMt3lPJqQN1LtGMWYnd7gWQhgmOmJRGinoMk8pNHQItkQFqe9KHoe3FJUXNooEW4Vi
         Gccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=88e8YZNFZYblGW8T1vgvVrAcy4UJU9R/Uy+Mu/G/Bqs=;
        b=15ajgZLYKlUFMCCJvGepoLz/Qm+h8P3ARAGlmM655s7Dq8IWEyZikU9rttWUX0433Z
         VNfMTHuhMKMAxwYwPuSWpMteNe+ARfz+JmJ2TTjqzoqcz/G8n0aq9EnLbHFqDYubCAb3
         HsDMWFWFKKakSMMDGJ4Fv7FZpfQ684G+4zmuOrqnMygX3+eRk9Jit0GcFCrMRxmApnUl
         dy7Jy9wShG641kf0+V8YzC8JedICjo0s3fR4gYP3le6rsSJA1RZ8VGWDN0zLDzIw9R1/
         cTK4U/uek0SnLb0Gkp7p1Nsizqu2XKCqWZJbb7lHVSAeIIf6ghVW5A/9mvMRPqV7liD6
         drAQ==
X-Gm-Message-State: AOAM531yWaXFtd46h4dN1cK4KCnGLrhowrtQ9P7eyDIXFENh6bimQjAi
        sSIz/UPZoFi7yDWiFC5d7TjvtntZb+FK0tYVwHx2KA==
X-Google-Smtp-Source: ABdhPJw8bFxetL9G7iKV3TXNBVJ9NKY7omc4nRH7Cv4Fu/gNPcy2p0+MKX+ThfcLhOVe88M0JGGhP4vzjrxX/Zwe9KY=
X-Received: by 2002:a2e:5cc1:0:b0:24b:112f:9b36 with SMTP id
 q184-20020a2e5cc1000000b0024b112f9b36mr17625108ljb.337.1651778292546; Thu, 05
 May 2022 12:18:12 -0700 (PDT)
MIME-Version: 1.0
References: <202205060209.NeOKC7Mb-lkp@intel.com>
In-Reply-To: <202205060209.NeOKC7Mb-lkp@intel.com>
From:   Oliver Upton <oupton@google.com>
Date:   Thu, 5 May 2022 12:18:01 -0700
Message-ID: <CAOQ_QshO4F-QymwcxB01rG8e5JqaWe=pads5A5vPmjSV+Fc3Rg@mail.gmail.com>
Subject: Re: [arm-platforms:kvm-arm64/psci-suspend 7/13] htmldocs:
 Documentation/virt/kvm/api.rst:6049: (SEVERE/4) Title level inconsistent:
To:     kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org,
        Marc Zyngier <maz@kernel.org>,
        Reiji Watanabe <reijiw@google.com>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 5, 2022 at 12:06 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/psci-suspend
> head:   582eb04e05ddd234ca32083c8457c6d409fd7b6a
> commit: bfbab44568779e1682bc6f63688bb9c965f0e74a [7/13] KVM: arm64: Implement PSCI SYSTEM_SUSPEND
> reproduce: make htmldocs
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> Note: the arm-platforms/kvm-arm64/psci-suspend HEAD 582eb04e05ddd234ca32083c8457c6d409fd7b6a builds fine.
>       It only hurts bisectability.
>
> All errors (new ones prefixed by >>):
>
> >> Documentation/virt/kvm/api.rst:6049: (SEVERE/4) Title level inconsistent:

Shame on me for reading my documentation in plaintext :) Same as what
Stephen reported, so the fix is:

https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?h=kvm-arm64/psci-suspend&id=582eb04e05ddd234ca32083c8457c6d409fd7b6a
