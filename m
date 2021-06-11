Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D516C48BD1
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 03:02:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECB6B6139A
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 03:02:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbhFKDET (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Jun 2021 23:04:19 -0400
Received: from mail-pj1-f46.google.com ([209.85.216.46]:52083 "EHLO
        mail-pj1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbhFKDER (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Jun 2021 23:04:17 -0400
Received: by mail-pj1-f46.google.com with SMTP id k5so4867310pjj.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Jun 2021 20:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tE83joOLGGHG+6LYIjaFeBXyGSvmADIRz7I0QGk9qxY=;
        b=Fx6vtB1EnbC275SmndXkPiI6PwIyM6SUKGThGZ+la4Lbcq7ZMUJWyA1BCMIT/Ckl5y
         8Vdaqnmv0A9pneOD/qw38xz03J+oDGYYRkjOJfpwoDmGix05NAa199Gcrl/xKlW8+RuJ
         2biejSjK5GL/mN3JJs7cKFxmf0gSPBFO3k/CiYIvXtcH66ponyvK+gOZEM6C4im7WRn1
         VGQYE7jSfyN6qAKnep2xHxwXhalEYdPJ7tOoYWibMNlrQmoXJAGcsXNjQETMGWdSYJDt
         IHLOKtuNu/UuY73FUpqeDYl7j23WjKcX0Grh3Oyhu22GUoOELsOdhk7phV+vi3Z2kJsE
         98ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tE83joOLGGHG+6LYIjaFeBXyGSvmADIRz7I0QGk9qxY=;
        b=L0RfVtOkUn9DZhjKNDKnjcSBzi2CjE+ps6fekwJ0BU+wMGinkMbI76sOOGCDWehjfI
         BNf6yHP1WWowoQSyhPXBzq3GPYcnCM4qeMdGeizBqE38R6EttXL9dh0mNevwQLXeOHSk
         Sbvgi9LVQ4s9/1+i1ET1+4RVSUE5xWDLosAIIoLaatp8LPYGFo//W+cinLk2Vb9hPqpV
         w80gi8PklAdIL3htMghWeO20IFFmQDdXewUDCs37NHHuEs2hMG9Z9rWp4nJg6mAKqgll
         /CWJKOiQyEwv7QQecCVzfCLqSXZdEw3agk3BGGTIWmCQyxbwwq+ZrtnFiUMq7/O9arfp
         F92Q==
X-Gm-Message-State: AOAM532f7DHYymJulYAdEJCG/GDy/Tdwge2x87PY1CH5UCDXtdBD4VN2
        hK7r9DMTjR7q9Q15fqWQa2EFUBZBIBI=
X-Google-Smtp-Source: ABdhPJyBw647fEmvrrvXKp07HroSBH2Eh6eWtqRg1iF0vdg9xKEz5UW6lJrNcAppbwJTWD4XycJZlQ==
X-Received: by 2002:a17:903:228e:b029:101:af04:4e24 with SMTP id b14-20020a170903228eb0290101af044e24mr1844825plh.3.1623380468533;
        Thu, 10 Jun 2021 20:01:08 -0700 (PDT)
Received: from kir-rhat.redhat.com (c-76-104-243-248.hsd1.wa.comcast.net. [76.104.243.248])
        by smtp.gmail.com with ESMTPSA id ev11sm8856748pjb.36.2021.06.10.20.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 20:01:08 -0700 (PDT)
From:   Kir Kolyshkin <kolyshkin@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Kir Kolyshkin <kolyshkin@gmail.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 1/3] docs: fix bad cross-links in motorola-cpcap
Date:   Thu, 10 Jun 2021 20:00:42 -0700
Message-Id: <20210611030044.1982911-2-kolyshkin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210611030044.1982911-1-kolyshkin@gmail.com>
References: <20210611030044.1982911-1-kolyshkin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commits 3c5be0454 and ce49e4282 renamed the files being referenced,
but forgot to modify the document that references them.

This fixes the following warnings:

> Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
> references a file that doesn't exist:
> Documentation/devicetree/bindings/power/supply/cpcap-battery.txt

> Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
> references a file that doesn't exist:
> Documentation/devicetree/bindings/power/supply/cpcap-charger.txt

Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
---
 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt b/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
index b52e7a33f0f9..190230216de8 100644
--- a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
+++ b/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
@@ -16,8 +16,8 @@ Optional subnodes:
 The sub-functions of CPCAP get their own node with their own compatible values,
 which are described in the following files:
 
-- Documentation/devicetree/bindings/power/supply/cpcap-battery.txt
-- Documentation/devicetree/bindings/power/supply/cpcap-charger.txt
+- Documentation/devicetree/bindings/power/supply/cpcap-battery.yaml
+- Documentation/devicetree/bindings/power/supply/cpcap-charger.yaml
 - Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
 - Documentation/devicetree/bindings/phy/phy-cpcap-usb.txt
 - Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
-- 
2.31.1

