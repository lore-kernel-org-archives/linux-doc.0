Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0CC2C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 27 Jun 2022 20:03:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240836AbiF0UDX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Jun 2022 16:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240812AbiF0UDV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Jun 2022 16:03:21 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 186061A04E
        for <linux-doc@vger.kernel.org>; Mon, 27 Jun 2022 13:03:20 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id p8so14308460oip.8
        for <linux-doc@vger.kernel.org>; Mon, 27 Jun 2022 13:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TZ8+R3M0S1nQaMEUYxJlIWhu0Gas0lB13VSI9mi3gCo=;
        b=jE9NBHIDH149VkRLhIk0yOTrQtpNiFaKNTUGDK89EhVFqEKC4abCikb/nksZMiAEsT
         PDSAwpHsp5Yek0S95rRDahLASN3U+sDCAz6qZlTsANiRMVrBrcXqals463swf2TiOKr1
         5AZCZe8m3u+jGC/GNgVhHgbvChx5BbL18SFS2+7KCiO3NljI3o6g+/bOe87gggHJnCu/
         LG1Cn6RSFhOTyv/ycAqKp/ayCeCgMgILVHRHqVbGRezAdJ59yC93ziKTJzR6Xz8x/0uM
         7GH4mlpCHuFO9QN1fyfSt1ylMQXp1PwT5WHYHlnKDCp1grBgD2cvqDrFjwZscvqrBOnP
         1ggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TZ8+R3M0S1nQaMEUYxJlIWhu0Gas0lB13VSI9mi3gCo=;
        b=l5UrnvYF7cDXBEUMmhFwCqzEMgLTpGFsetmjacaNgp5oYTaXmJd+K3rCVFPQGvaDRK
         JnfoGwebaTpIyu6mlFLqfOo3qo9MwpR1K8TabGwBRfDw5P86nbivDpp4UphTzM2soEx0
         qTHmesvvGUiSuyyZ3rcCOh1GRaqi6Q+TaqrUxr2CkNSza/uJ8RMlHddC3PcZ+z3dU7n+
         NKFHRoYdEqLSW06HUPdyTYD9WKiv9glreEkveQAUeJqATWkOO8JTMXxhC+bduxrc6TRm
         xAWoMMLH3E3WhhXsw9B8oX/vlZj+M59Zc7+SHnKdAP1snoeF5X2Wl0kfxSC/jCDBZxvQ
         /w/A==
X-Gm-Message-State: AJIora9QwA1084xe7Q74b6qIo+7Op5/rmGBEN8PQzhE5wi0rz+WkyALg
        S6yx40qny2j57PhwV9jC4pEE0w==
X-Google-Smtp-Source: AGRyM1sirrNSgfMuD2r1cwuzZWm2Oqngu9wBvfSeMbPZ5IiVWM+Vhp6aZ5l2qx23ivcg184/EjcZ8A==
X-Received: by 2002:a05:6808:1648:b0:333:45ae:3777 with SMTP id az8-20020a056808164800b0033345ae3777mr12078448oib.4.1656360199747;
        Mon, 27 Jun 2022 13:03:19 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:19 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     linux-kernel@vger.kernel.org,
        "Joseph S . Barrera III" <joebar@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Alexandru M Stan <amstan@chromium.org>,
        devicetree@vger.kernel.org, Julius Werner <jwerner@chromium.org>,
        linux-doc@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        patches@lists.linux.dev, Matthias Kaehlcke <mka@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: Document how Chromebooks with depthcharge boot
Date:   Mon, 27 Jun 2022 15:02:40 -0500
Message-Id: <165636016348.3080661.58233739131121561.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220520143502.v4.1.I71e42c6174f1cec17da3024c9f73ba373263b9b6@changeid>
References: <20220520143502.v4.1.I71e42c6174f1cec17da3024c9f73ba373263b9b6@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 20 May 2022 14:38:41 -0700, Douglas Anderson wrote:
> This documents how many Chromebooks pick the device tree that will be
> passed to the OS and can help understand the revisions / SKUs listed
> as the top-level "compatible" in many Chromebooks.
> 
> 

Applied, thanks!

[1/5] dt-bindings: Document how Chromebooks with depthcharge boot
      commit: 59228d3b9060b0e5e6b37ceca078fd81a165cfc9
[2/5] dt-bindings: arm: qcom: Mention that Chromebooks use a different scheme
      commit: dbbccb3db122558b35ecb4c87a86bbad37c80862
[3/5] dt-bindings: arm: qcom: Add sc7180 Chromebook board bindings
      commit: 3b8bfe002c4ba633b48cc497238a69eb88346a60
[4/5] dt-bindings: arm: qcom: Add / fix sc7280 board bindings
      commit: 707b9b08789bf3312c9cf23c621ad942de9aa48c
[5/5] dt-bindings: arm: qcom: Add more sc7180 Chromebook board bindings
      commit: 5069fe941f76c9f37abc98636a7db33a5ac72840

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
