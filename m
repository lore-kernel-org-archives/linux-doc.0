Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 241CBC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 30 May 2022 15:28:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238234AbiE3P2W (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 May 2022 11:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236865AbiE3P2N (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 May 2022 11:28:13 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF17A5D1A0
        for <linux-doc@vger.kernel.org>; Mon, 30 May 2022 07:31:02 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id rs12so21097155ejb.13
        for <linux-doc@vger.kernel.org>; Mon, 30 May 2022 07:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gxb0twe+qIbAIHnrcybPBuiYup84dUfDETp1oytzCp0=;
        b=H4WS9mljziw5eyuIFXU3+6nhHdVRyKDmT3xsBen8MDl7r6NHRO278MIKQgBkQP8jgn
         HGi++TprvrWKFqHXlP009Tvw6QS1SIo/1glHgSrJhgCUzgiHcLeZOBxSdsLBAOHHwe/H
         NxtShcZg9NpDwIKZ3BECHnJ2elEPE1IMf62HGvY9JLO1Jh7kPzxk9odBuMvwvVHpge4t
         RUV1IZgwU0voxwULayP/Hip/gkVZUV1S0kyh6MaZmH0cbzaSWmgSCkNm9NZRZaPEwbAC
         jSpHn6DOqEYB5mfok8wL56qwISUe38ifMMvahXb9UCUU7mnRwYfDJpkkmf2CHU+58b8R
         cWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gxb0twe+qIbAIHnrcybPBuiYup84dUfDETp1oytzCp0=;
        b=4IHWEDSyQKyR0JIK+8Z/XK+B6YEJhV07MGUxjpJdTj/m0jU9zsG5Ae3UQhnt2WNqCD
         7eI0WLkMA8vba7VhyAfEi33yccKS7IeylCZePv/SX5rto+DJq+Vh6iChSymZnRO8VuTN
         ZNnWyRBV8gGtVSAbIiOez7MuG/8Pf9Ab7HOtTXUOSJvhMZ1Zblr7ZLhwwsTMh0Gzamg0
         vAEwjHSCEU7ms/he66XCGyG8HfZlpQwLhmWYZ4ncMI9mXj8avBFZGaGPLAxvgdqIw2Tv
         FI+fVShKO0GoZ+9XkazhYA6L9/Myk2fqOfRumumutpakChyR17wpIKGSMLsyrjD/uHGF
         E08w==
X-Gm-Message-State: AOAM531mNXCPjl/Ogjt7iKEVoA4MyQWYlBmjetaGDZdtEQ6P0VHUIH70
        n27z4oOGbzMBXl3CTToc4HnPOZ39YA0tSw==
X-Google-Smtp-Source: ABdhPJxCeQIChG6fpum4u+wt1QXIoQ2Da23oACmOb98ISRnbM4QYipYAizc1lBmrtSkQV1+bN74kgA==
X-Received: by 2002:a17:906:c10:b0:6f4:6c70:b00f with SMTP id s16-20020a1709060c1000b006f46c70b00fmr49415762ejf.660.1653921061110;
        Mon, 30 May 2022 07:31:01 -0700 (PDT)
Received: from baileys.at.linbit.com (62-99-137-214.static.upcbusiness.at. [62.99.137.214])
        by smtp.gmail.com with ESMTPSA id s26-20020a50ab1a000000b0042dd1d3d571sm1882262edc.26.2022.05.30.07.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 07:31:00 -0700 (PDT)
From:   Joel Colledge <joel.colledge@linbit.com>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Joel Colledge <joel.colledge@linbit.com>
Subject: [PATCH] docs: blockdev: change title to match section content
Date:   Mon, 30 May 2022 16:28:49 +0200
Message-Id: <20220530142849.717-1-joel.colledge@linbit.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This index.rst was added in commit
39443104c7d3 docs: blockdev: convert to ReST

It appears that the title from the RapidIO index page was copied. This
title does not match the content of this directory. Change it to match.

Signed-off-by: Joel Colledge <joel.colledge@linbit.com>
---
 Documentation/admin-guide/blockdev/index.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/blockdev/index.rst b/Documentation/admin-guide/blockdev/index.rst
index b903cf152091..957ccf617797 100644
--- a/Documentation/admin-guide/blockdev/index.rst
+++ b/Documentation/admin-guide/blockdev/index.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-===========================
-The Linux RapidIO Subsystem
-===========================
+=============
+Block Devices
+=============
 
 .. toctree::
    :maxdepth: 1
-- 
2.36.1

