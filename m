Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D185C001DD
	for <linux-doc@archiver.kernel.org>; Thu, 13 Jul 2023 05:35:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233983AbjGMFfE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Jul 2023 01:35:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233915AbjGMFfA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Jul 2023 01:35:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12DE810D2
        for <linux-doc@vger.kernel.org>; Wed, 12 Jul 2023 22:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689226453;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=SmfB+i5ITyD8VcQT6H0n4jQbBtZaHz3osNrT9kioxiQ=;
        b=NqdSY9QUqllBHTpPVoWI3R2S5L8Go75LijLMG8At1Ttr4M1bqFIPZnW+Bv+4dndT4DFynH
        cWLhSvcbJMqJbOrX0EVRk+ws1JDHFKQNMEQ8hIbhldrsSQ78WKlLW6r8vCS7m35sky4sXH
        8e43CBxa6HpJDr/6x7QvyyjZjB2ID6s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-i3hcd4wIP4KWTYXkATNlRQ-1; Thu, 13 Jul 2023 01:34:12 -0400
X-MC-Unique: i3hcd4wIP4KWTYXkATNlRQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-314134f403fso258078f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 12 Jul 2023 22:34:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689226451; x=1691818451;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SmfB+i5ITyD8VcQT6H0n4jQbBtZaHz3osNrT9kioxiQ=;
        b=fNYBQD3Bmb23vkbk075M1ak733+q4jT/6SFuTo8V/lrdjwizepqkmDRBbfrk73FTvs
         tw+Jm6mlFuaeCpIGiwT1YUKJIZx2CJjd4Fvrm2BtTSHUl4jVxGkInFCRfuyCbf+XFeZd
         n7/fTArtJalQzHue2XwZdEwr5zQSzs1aEhMJb5RV/nINbhgOpVywkkk0RxVeCeua/Kvm
         RIEgNOymZLVxod+Q+pJLfUzo+Rel//MJ9yEmmXbOFmGzjukqMsL2h6b3hH3rum7i7+2p
         0r6+W/DBHyOtgVMkCmEi/gH/JjRIXImq12TlIqppll7z5v0Xvj8s0CUIaRZfie5R3DVX
         xhBw==
X-Gm-Message-State: ABy/qLaH+D7qqBEWCzPG4LzxhlcX7nQtKiFFGMOibVnccX+MrPkE9pYa
        fAVFZRtA/7x3PI7rCl5GHxAlBhoO3v1Fd0KtMmCbWrAZ2PXuLgVuP8dGXsmKbeMmGRY5ASG2ASM
        oXnSPZDx3fMXlLJ6Ks7YwcD6Q5z4bIykrHHoI
X-Received: by 2002:a05:6000:92:b0:314:35c2:c4aa with SMTP id m18-20020a056000009200b0031435c2c4aamr467023wrx.8.1689226450845;
        Wed, 12 Jul 2023 22:34:10 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGOJnBSbefoa2jYNguz42ZsRuZYJIodpjHhXJuzkLT9wNSNcgOUvRAkGCM4TmbRTEw+GkFxz47vkJZ0YZi65gI=
X-Received: by 2002:a05:6000:92:b0:314:35c2:c4aa with SMTP id
 m18-20020a056000009200b0031435c2c4aamr466974wrx.8.1689226450472; Wed, 12 Jul
 2023 22:34:10 -0700 (PDT)
MIME-Version: 1.0
From:   Vitaly Grinberg <vgrinber@redhat.com>
Date:   Thu, 13 Jul 2023 08:33:59 +0300
Message-ID: <CACLnSDiMD+BH_BBHQUAhSvfqe6jhnm4MOB2N_hog4VMhvdTYVg@mail.gmail.com>
Subject: Re: [RFC PATCH v9 00/10] Create common DPLL configuration API
To:     Jiri Pirko <jiri@resnulli.us>
Cc:     David Airlie <airlied@redhat.com>, andy.ren@getcruise.com,
        anthony.l.nguyen@intel.com,
        "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
        arnd@arndb.de, axboe@kernel.dk,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        claudiajkang@gmail.com, corbet@lwn.net, davem@davemloft.net,
        edumazet@google.com, geert+renesas@glider.be,
        gregkh@linuxfoundation.org, hkallweit1@gmail.com,
        idosch@nvidia.com, intel-wired-lan@lists.osuosl.org,
        jacek.lawrynowicz@linux.intel.com,
        Javier Martinez Canillas <javierm@redhat.com>,
        jesse.brandeburg@intel.com, jonathan.lemon@gmail.com,
        kuba@kernel.org, kuniyu@amazon.com, leon@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rdma@vger.kernel.org, linux@zary.sk, liuhangbin@gmail.com,
        lucien.xin@gmail.com, masahiroy@kernel.org,
        michal.michalik@intel.com, milena.olech@intel.com,
        Michal Schmidt <mschmidt@redhat.com>,
        Michael Tsirkin <mst@redhat.com>, netdev@vger.kernel.org,
        nicolas.dichtel@6wind.com, nipun.gupta@amd.com, ogabbay@kernel.org,
        Paolo Abeni <pabeni@redhat.com>, phil@nwl.cc,
        Petr Oros <poros@redhat.com>, razor@blackwall.org,
        ricardo.canuelo@collabora.com, richardcochran@gmail.com,
        saeedm@nvidia.com, sj@kernel.org, tzimmermann@suse.de,
        vadfed@fb.com, vadfed@meta.com, vadim.fedorenko@linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,
I'd like to clarify about the DPLL phase offset requirement. We can
live without it during the initial submission. The addition of phase
offset can be an increment to patch v10.
Thanks,
Vitaly

