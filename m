Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 415EEC433EF
	for <linux-doc@archiver.kernel.org>; Sun,  5 Dec 2021 13:45:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234245AbhLENsy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 5 Dec 2021 08:48:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232715AbhLENsy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 5 Dec 2021 08:48:54 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 638F7C061714
        for <linux-doc@vger.kernel.org>; Sun,  5 Dec 2021 05:45:27 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id iq11so5776643pjb.3
        for <linux-doc@vger.kernel.org>; Sun, 05 Dec 2021 05:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y1i7LpK8WhxAkB5zd3j0igzSexooghSAj8AzjSg84fI=;
        b=MCL7GdeCboysKWrq501N0eSEGDZ7Y6/LOgwf89ubKQqqT2+AFJYPl+ZzUEwny0DbX6
         kaO6Ch6zRAUOMCY6Hu2Esgse4BKDHXW7B5O1XMzpyhRJTlEZ2LAABcu3OGah2knDrOCl
         IadWg52gUzidnGyVhcJf0yXWlB9e+F3xTjb+cijMrVHen1TCxkMGJuG4LrCEJ+ZaNcrt
         QhIH7sug+gU8J+7S8D6HxLFvqVsQkO35MVEKOcZhSwSlGkZTLtNpb4xtDaa4HvPq9XzR
         6aqeEqjK2U7o0okTgbWlC56vhnFCsnWKL1WiSjiz72w5h/779Q8/W1v5+rbYipesFckC
         YNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y1i7LpK8WhxAkB5zd3j0igzSexooghSAj8AzjSg84fI=;
        b=4uy43mxHCtPU8U/EM7Y+LxsWymwKTmIFxo9C7rfYJk9tQEq9hkdF15yhkuDOeb7BtN
         2Hqnz5Va4QMGu+ezbh9I6doIY3lNjK+bj2P42kmJY9Eb4l2025XH9bXibvTEYmY340CD
         vIqbpyv7JixirLPIyKz829N5OQnbMgbXsrC+doS5ekhcDb/CsYRjMmsLqqLYuR5mS4gW
         8/7+zda0a3xQfvxzNSAy2VkeYyfZD6sV+0G+D3RoGxyNkvdUQPhQhh5zmuCXsKglIOrV
         Upn+C4Kc4N4fVNMDXmnqhaxQYU/nX6Fzh5mvypous0Co76pC4lIbyVxHyzAVvbN6wtCW
         bfcg==
X-Gm-Message-State: AOAM531KFIHa6oyu3JDkqZuQNnddYrE4hY3MX+uE6kuVhaLD5naP0mWj
        1JnSNPfCye38W9elJyzUIwLDPFOIeoDIzg==
X-Google-Smtp-Source: ABdhPJwmG2PyowQhOK1+Mx+X3RmGSIEDlNJmcECezxPp7l0tlI2tmk7QMxHpErHyYn099g1elGcRmA==
X-Received: by 2002:a17:903:249:b0:143:c077:59d3 with SMTP id j9-20020a170903024900b00143c07759d3mr36114764plh.26.1638711926878;
        Sun, 05 Dec 2021 05:45:26 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id g19sm4265114pfc.145.2021.12.05.05.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 05:45:26 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 02/11] docs/admin-guide: Add the necessary blank lines to the writecache
Date:   Sun,  5 Dec 2021 21:43:51 +0800
Message-Id: <798c0b13c70fba58e2dd81d859de33abf536c827.1638706875.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1638706875.git.siyanteng@loongson.cn>
References: <cover.1638706875.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix warning as:

  /home/siyanteng/linux-next/Documentation/admin-guide/device-mapper/writecache.rst:23: WARNING: Unexpected indentation.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/admin-guide/device-mapper/writecache.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/admin-guide/device-mapper/writecache.rst b/Documentation/admin-guide/device-mapper/writecache.rst
index 10429779a91a..6bf78b0446ac 100644
--- a/Documentation/admin-guide/device-mapper/writecache.rst
+++ b/Documentation/admin-guide/device-mapper/writecache.rst
@@ -20,6 +20,7 @@ Constructor parameters:
    size)
 5. the number of optional parameters (the parameters with an argument
    count as two)
+
 	start_sector n		(default: 0)
 		offset from the start of cache device in 512-byte sectors
 	high_watermark n	(default: 50)
-- 
2.27.0

