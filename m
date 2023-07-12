Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1436EB64D9
	for <linux-doc@archiver.kernel.org>; Wed, 12 Jul 2023 14:30:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233023AbjGLOad (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 Jul 2023 10:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233025AbjGLOa0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Jul 2023 10:30:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A430C2137
        for <linux-doc@vger.kernel.org>; Wed, 12 Jul 2023 07:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689172165;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=SmfB+i5ITyD8VcQT6H0n4jQbBtZaHz3osNrT9kioxiQ=;
        b=UuFg+m2Yvq/cYBpAgRMODwJ54BqHfYqmezUXh1VJIWgEP0vfhBG1M0pRo81QTilsuArSDw
        W8mdLhVObMlcS1VxSYDBJ10HohWfUJe/NMmNu1iW/HDvI1ejebyhz+z5LaQc6zKYXbXzu/
        HLk7qiwAh7we4NiMCwkxNA8KUHsO9n0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-ZvFoZD8XOOy3ihrMfmKmsg-1; Wed, 12 Jul 2023 10:29:24 -0400
X-MC-Unique: ZvFoZD8XOOy3ihrMfmKmsg-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-31596170243so2752611f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Jul 2023 07:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689172163; x=1691764163;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SmfB+i5ITyD8VcQT6H0n4jQbBtZaHz3osNrT9kioxiQ=;
        b=cH092LT6zqylb7UN8rUU7LjJLFncOheUz36WEHA0FKhlHpOsCTZ8hXLvCcu0CVuzmC
         OkdEw0ohoS7/0tAAvCdgv+i0+1Zbpxfh/ZNQs5cR0+n/jyRdnv2MaChFLwQ1WfX9uGPw
         Sx7L+EkIOB5lnz5fxZVykmLvG8jNTvkZKBWJHvP0EUzwGhjdwUyNFzoWl1HDcA8Q9njj
         zu1TTihtk3yx66yO3OHUSls5Cjz/rXFyaOmRDzZOQrUInhyZx30v583NCGMXau38F173
         xoWM42Nho4vUDcqlKwW6gbT+lgug4QtDpE/gTNpG5HnkEckaj9shybn/kpu7/gR4Lzgd
         P61Q==
X-Gm-Message-State: ABy/qLZE/mg5bqwA8FgJOik57usTfgbRRGC+Q8dp2FNjezYMTGbGOh6M
        hYfxxWqZz0HHyEl/CG5rMA7pFQwDmHhCg4uK43H6MEvOOfDzjhk8WwUoDm7uiCgj7BwAGbr3R/y
        3l1//rHfSDrca9TKpkI7mNJlhI6+uu06gXItt
X-Received: by 2002:adf:ec8e:0:b0:314:1ebc:6e19 with SMTP id z14-20020adfec8e000000b003141ebc6e19mr17387217wrn.64.1689172163291;
        Wed, 12 Jul 2023 07:29:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGrLy4XTfg4SYrDedL3LjN5ZHr+LA3Ut1XmsVNXLi1zBJheiu9Ajx5OzglpHTo4/1SshVrdO+NlkBUDSAisljg=
X-Received: by 2002:adf:ec8e:0:b0:314:1ebc:6e19 with SMTP id
 z14-20020adfec8e000000b003141ebc6e19mr17387145wrn.64.1689172162850; Wed, 12
 Jul 2023 07:29:22 -0700 (PDT)
MIME-Version: 1.0
From:   Vitaly Grinberg <vgrinber@redhat.com>
Date:   Wed, 12 Jul 2023 17:29:12 +0300
Message-ID: <CACLnSDhA1io1tU0rVvuz6KYx3-c_4zEniLEs3KFUqsvLWATYWw@mail.gmail.com>
Subject: Re: [RFC PATCH v9 08/10] ice: implement dpll interface to control cgu
To:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc:     David Airlie <airlied@redhat.com>, andy.ren@getcruise.com,
        anthony.l.nguyen@intel.com, arnd@arndb.de, axboe@kernel.dk,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        claudiajkang@gmail.com, corbet@lwn.net, davem@davemloft.net,
        edumazet@google.com, geert+renesas@glider.be,
        gregkh@linuxfoundation.org, hkallweit1@gmail.com,
        idosch@nvidia.com, intel-wired-lan@lists.osuosl.org,
        jacek.lawrynowicz@linux.intel.com,
        Javier Martinez Canillas <javierm@redhat.com>,
        jesse.brandeburg@intel.com, Jiri Pirko <jiri@resnulli.us>,
        jonathan.lemon@gmail.com, kuba@kernel.org, kuniyu@amazon.com,
        leon@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
        linux@zary.sk, liuhangbin@gmail.com, lucien.xin@gmail.com,
        masahiroy@kernel.org, michal.michalik@intel.com,
        milena.olech@intel.com, Michal Schmidt <mschmidt@redhat.com>,
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

