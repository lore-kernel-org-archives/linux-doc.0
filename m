Return-Path: <SRS0=G1XG=75=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F73C433E0
	for <linux-doc@archiver.kernel.org>; Tue, 16 Jun 2020 16:40:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6898B20679
	for <linux-doc@archiver.kernel.org>; Tue, 16 Jun 2020 16:40:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UYpcHQH/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729566AbgFPQkQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Jun 2020 12:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728928AbgFPQkN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Jun 2020 12:40:13 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D29A2C061573
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2020 09:40:12 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id c71so3497950wmd.5
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2020 09:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aqErEkGc0G89wKtmIHGbgBfE4aZbj87KIVLTsmxB2XY=;
        b=UYpcHQH/yKkhdBn9ulPpq77f+Agl0AsbvPJ30d343fb0xZWL5dSqnT6bJyahJrFYTB
         ApDTcq1Yu8TzkiBQyOsPROiIFfnChdNzLKpFfQEZ83JDaFBgagzmzoDZ7a2gaQTz99rn
         KoKwEfttLLSQ+ZX5pFCuI0YNoy/H9Ii543Yesck5edN+BglTc5tA5MaCuPzcNTzQyL9P
         LuENtduUyj5liKDExdOG8So9DIfrWk3GZyLFfFahBgifxxElow1Id9M8tYXM0AhMTZX2
         jIw//r8x8ASflsOZmo2bWYH7LD/SygrpMb9ni+uOME/o3Tv444GpBCRZZvbg5UMitBsW
         ZxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aqErEkGc0G89wKtmIHGbgBfE4aZbj87KIVLTsmxB2XY=;
        b=gfjKb+1aj3NsZXJKD1uy+YEYue+BW+EvTG7jjLGv7JXIL07D5trxhLfYBLTtthilOV
         7h1X+ZFTWGE8mojtWHYiF6z43SMOM8fZjcWamO1heHD0SU+RR3ZNN+CqwzUkdP5dYA3p
         lVHhSsuPSiorN2Aqo5uNkGrJ7KFBIwCYf5HsVNQ6/Mn2pme9rlduL6rjE8p0QLnzquMk
         2GKYc1Fr4qtQefIbpM5QV3TAd05grO9QCQ048BGsfjhVmccBOjJSiNQpMGwToDMP+8mY
         Ay3FWshaAKzuRtWXiYMurzEVCpEVO7fD4Ezu+4KEkL/NS+ORz3bWVegx/ygrpXqtDWeg
         JCGg==
X-Gm-Message-State: AOAM531auOFfQwdqm/iCa3b8plpt8IGciPkUZzp4DhdBzcQkEEA+2UYz
        EgQZn4o0aq6bJ1LjzgrruYIr5ZidU+c=
X-Google-Smtp-Source: ABdhPJwdx3JS+7B8OiPrbMZzyeHAkleLtl8T1QaUpWQuvObRxe6fB4GLU5k0nnNG3CxPtBufYPAAqQ==
X-Received: by 2002:a1c:bbd6:: with SMTP id l205mr4253963wmf.147.1592325611191;
        Tue, 16 Jun 2020 09:40:11 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6801:1801:dc9e:c297:59e5:dbd9])
        by smtp.gmail.com with ESMTPSA id g82sm4843866wmf.1.2020.06.16.09.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 09:40:10 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        coresight@lists.linaro.org, mathieu.poirier@linaro.org
Cc:     suzuki.poulose@arm.com, corbet@lwn.net,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v5 2/5] coresight: tmc: Update sink types for default selection.
Date:   Tue, 16 Jun 2020 17:40:03 +0100
Message-Id: <20200616164006.15309-3-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616164006.15309-1-mike.leach@linaro.org>
References: <20200616164006.15309-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

An additional sink subtype is added to differentiate ETB/ETF buffer
sinks and ETR type system memory sinks.

This allows the prioritised selection of default sinks.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/hwtracing/coresight/coresight-tmc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc.c b/drivers/hwtracing/coresight/coresight-tmc.c
index 39fba1d16e6e..0d2eb7e0e1bb 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.c
+++ b/drivers/hwtracing/coresight/coresight-tmc.c
@@ -484,7 +484,7 @@ static int tmc_probe(struct amba_device *adev, const struct amba_id *id)
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.type = CORESIGHT_DEV_TYPE_SINK;
-		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
+		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_SYSMEM;
 		desc.ops = &tmc_etr_cs_ops;
 		ret = tmc_etr_setup_caps(dev, devid,
 					 coresight_get_uci_data(id));
@@ -496,6 +496,7 @@ static int tmc_probe(struct amba_device *adev, const struct amba_id *id)
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.type = CORESIGHT_DEV_TYPE_LINKSINK;
+		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = &etf_devs;
-- 
2.17.1

