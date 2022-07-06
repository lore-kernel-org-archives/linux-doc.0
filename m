Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B435C43334
	for <linux-doc@archiver.kernel.org>; Wed,  6 Jul 2022 22:28:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbiGFW2j (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Jul 2022 18:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233304AbiGFW2i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jul 2022 18:28:38 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1073D14D0B
        for <linux-doc@vger.kernel.org>; Wed,  6 Jul 2022 15:28:37 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id r18so20959869edb.9
        for <linux-doc@vger.kernel.org>; Wed, 06 Jul 2022 15:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v6UMrGFGd+3jW4lsadRWla2m8cG6yTz5WAsTra2PXuU=;
        b=gom+xiKnhLx2V9+NutrQ27WvUu30kzt/WRtEci/KVZHghTMjZdQKOha10RnzjyE69z
         T6a6DX3K3x40X0jbOaVV0IaKghdz4EoOau9je+/VmdUhxpU69U1EKh4xL42Zus7FjJGh
         M7EHvSi+BkypTVio+/vlN6/JAdFjQD0mbHT5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v6UMrGFGd+3jW4lsadRWla2m8cG6yTz5WAsTra2PXuU=;
        b=z88wDZ1bJju38WSSiMIK8xvg0JcPom6kul0/rtoS6ThDzVwVZBtAe77v955JNdee+r
         nlevBc5fAa2PU0O1hvjNpW5Pf93fcu1g7AMTe12OseKM54RQGky6Q83LnzghI7nNeLW5
         g/V+Bq7+FBj9InkjeUPS/srCSfqX6XczFkkgRqVjl6CzDaRswJc/eSyRngVcESkpR4h8
         wQ/jtP/TTuAbZ1bUHqto+0jHoPqzL5Cq8Uxd3Pb2jwiiLOCdtVDqvwAgtM2dbxuxIByw
         e1zUMj4yrftHvUTroZJ1ryJfyWAK5+Mfvt5Qysjy5HwKRpY7GN9ThvOUd47Ef2lzbUnu
         +wew==
X-Gm-Message-State: AJIora+yIiftsHBaAGcvm+SCH9p65BZsHRUUCP3/Kq+Z0HZ27CVzhdRX
        UBCRJsBBSSAjbLFuzmDuqSf7ZAmlEIJs4s0F
X-Google-Smtp-Source: AGRyM1vfaR4bEmQ6g1RZr9brr+eDe0s7H53Xh8jqbhmhvG/h5+tAK16hFTUB+68Ax8xeJFP50j4TrQ==
X-Received: by 2002:a50:fc98:0:b0:43a:506b:26f6 with SMTP id f24-20020a50fc98000000b0043a506b26f6mr17297056edq.42.1657146515250;
        Wed, 06 Jul 2022 15:28:35 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id kv4-20020a17090778c400b0072a4bb6bce8sm10218044ejc.168.2022.07.06.15.28.34
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 15:28:34 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id v16so12450666wrd.13
        for <linux-doc@vger.kernel.org>; Wed, 06 Jul 2022 15:28:34 -0700 (PDT)
X-Received: by 2002:adf:fb12:0:b0:20c:79b2:a200 with SMTP id
 c18-20020adffb12000000b0020c79b2a200mr40571378wrr.617.1657146513950; Wed, 06
 Jul 2022 15:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <202207070644.x48XOOvs-lkp@intel.com>
In-Reply-To: <202207070644.x48XOOvs-lkp@intel.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 6 Jul 2022 15:28:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xufx0idStkpCv=0wp_j2upRutyfaBrR5wTwHcGOjmt7A@mail.gmail.com>
Message-ID: <CAD=FV=Xufx0idStkpCv=0wp_j2upRutyfaBrR5wTwHcGOjmt7A@mail.gmail.com>
Subject: Re: [linux-next:master 4772/8197] htmldocs: Documentation/arm/google/chromebook-boot-flow.rst:
 WARNING: document isn't included in any toctree
To:     kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Wed, Jul 6, 2022 at 3:27 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   088b9c375534d905a4d337c78db3b3bfbb52c4a0
> commit: 59228d3b9060b0e5e6b37ceca078fd81a165cfc9 [4772/8197] dt-bindings: Document how Chromebooks with depthcharge boot
> reproduce: make htmldocs
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> Documentation/arm/google/chromebook-boot-flow.rst: WARNING: document isn't included in any toctree

A patch was sent for this a few days ago:

https://lore.kernel.org/r/0ae8251f97c642cfd618f2e32eb1e66339e5dfde.1656759989.git.mchehab@kernel.org

-Doug
