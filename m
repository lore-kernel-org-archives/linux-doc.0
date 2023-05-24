Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D029C7EE31
	for <linux-doc@archiver.kernel.org>; Wed, 24 May 2023 16:10:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231258AbjEXQK3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 May 2023 12:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232785AbjEXQKY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 May 2023 12:10:24 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 342E4E41
        for <linux-doc@vger.kernel.org>; Wed, 24 May 2023 09:10:18 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f42d937d2eso9604475e9.2
        for <linux-doc@vger.kernel.org>; Wed, 24 May 2023 09:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684944617; x=1687536617;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sonO3GOYzGccW/51txZZdB4M9CGgorlp/b5UFoGyaco=;
        b=huJrIL8GrNYmxaL+91OktyHSNGC4Uj9H6LgChlHFde8wRuazQA2qKQx6gCLm5EeUL2
         ChyzSS3yZGt2x8Op/sPCRDNJ0ZBVe22BFbk5n7wqOh3LXQN3gNw2KahY5+Y4d7fAPypg
         guLngSIAs+OA9FpyZelrGBAx01iPnej6Pxh7AaBFHLpBkcLKz4zj5MECgG68A+pkFuSl
         W2tTk2kgJLFACbkK6DcSAREyG9sqVzJko7HCcFQROj/IKjqcPi5ksUUb75URizrZUeDH
         1pJkY+oznh25umOaeF2AuwhXQ6sJXhvqLrjKjkeTnLqslRGHojbcxLvb+wlSlazue9a9
         NfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684944617; x=1687536617;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sonO3GOYzGccW/51txZZdB4M9CGgorlp/b5UFoGyaco=;
        b=c4O9DwtTW3m0etHUsbAs6WDV/oGrvqh+dpOsWeaAye7WADS6556K6WPhdB4JBM1l7G
         BFTL54+nXLxHo+Ql6Gbq0Df3pjYibXlBw0N6LcgKkBvfXHOBeq0X74k/y5EcCGqWSCOO
         Oqaolw1N+/ucWi4ec0/GuczKcNk+FjzrYlUsHCwsUqIYZCzURoN4Je9tjwmnKLOAG7oz
         ft21D0zPfjJSe/2by9dm2AX0D197Okl0Pjqr1lpuzOIa6UtTuYH1h9vecm+gT0x8mzy4
         UILOrZ1QGBnRohHp0FM/JzK0ICl8k/eeqfNZHJzjnqLQzqf4A2/XE9TNxy4jD1QUWhk9
         I8wg==
X-Gm-Message-State: AC+VfDyE7dRl78ZTX3EQ+axPhZaN67ioLxyOYoYt4KG77F9gbNHsAKYt
        uHGGFGDrlEX9qtPdXOsKRwXalw==
X-Google-Smtp-Source: ACHHUZ6TpR8oaLW3NZ/tDgs34qpc3OAVHAqUENH6gjAtwJ10LJtGbVpmkQsfflTucQ7R54D29ZedZQ==
X-Received: by 2002:a7b:ce87:0:b0:3f4:2327:53c2 with SMTP id q7-20020a7bce87000000b003f4232753c2mr248128wmj.19.1684944616955;
        Wed, 24 May 2023 09:10:16 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id v7-20020a05600c214700b003f4f89bc48dsm2865399wml.15.2023.05.24.09.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 09:10:16 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
To:     dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
Cc:     freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Christopher Healy <healych@amazon.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robdclark@chromium.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org,
        Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Chia-I Wu <olvaffe@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Guchun Chen <guchun.chen@amd.com>,
        Jim Cromie <jim.cromie@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lijo Lazar <lijo.lazar@amd.com>, linux-arm-msm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mario Limonciello <mario.limonciello@amd.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        =?utf-8?q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
        Peter Maucher <bellosilicio@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Shashank Sharma <shashank.sharma@amd.com>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        YiPeng Chai <YiPeng.Chai@amd.com>
In-Reply-To: <20230515143023.801167-1-robdclark@gmail.com>
References: <20230515143023.801167-1-robdclark@gmail.com>
Subject: Re: (subset) [PATCH v4 0/9] drm: fdinfo memory stats
Message-Id: <168494461551.3403386.4095735722928777312.b4-ty@linaro.org>
Date:   Wed, 24 May 2023 18:10:15 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Mon, 15 May 2023 07:30:07 -0700, Rob Clark wrote:
> Similar motivation to other similar recent attempt[1].  But with an
> attempt to have some shared code for this.  As well as documentation.
> 
> It is probably a bit UMA-centric, I guess devices with VRAM might want
> some placement stats as well.  But this seems like a reasonable start.
> 
> Basic gputop support: https://patchwork.freedesktop.org/series/116236/
> And already nvtop support: https://github.com/Syllo/nvtop/pull/204
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/9] drm/docs: Fix usage stats typos
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0020582a8afe9a8570f80ec503c59bf049a616de
[2/9] drm: Add common fdinfo helper
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3f09a0cd4ea3b9d34495450d686227d48e7ec648
[3/9] drm/msm: Switch to fdinfo helper
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=51d86ee5e07ccef85af04ee9850b0baa107999b6
[4/9] drm/amdgpu: Switch to fdinfo helper
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=376c25f8ca47084c4f0aff0f14684780756ccef4
[5/9] drm: Add fdinfo memory stats
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=686b21b5f6ca2f8a716f9a4ade07246dbfb2713e
[6/9] drm/msm: Add memory stats to fdinfo
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3e9757f5ddb98238226ad68a1609aa313de35adb
[7/9] drm/doc: Relax fdinfo string constraints
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=90d63a150b85fd1debb9c01237fb78faee02746a

-- 
Neil

