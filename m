Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF149C77B73
	for <linux-doc@archiver.kernel.org>; Tue,  2 May 2023 00:05:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbjEBAFz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 May 2023 20:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjEBAFz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 May 2023 20:05:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5425A10DC;
        Mon,  1 May 2023 17:05:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E67706205F;
        Tue,  2 May 2023 00:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA47C433EF;
        Tue,  2 May 2023 00:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682985953;
        bh=rqiQ2lkEwAj2A9GkkmpvvlrjBsU7lTH+NbR0qE5lu0Q=;
        h=From:To:Cc:Subject:Date:From;
        b=cBNZcAKfggXR58DvCm7p2AMBrhWUWzW2n7Ljef8A47QOPrxZIGSffHI6+MmO/O4D6
         JQr/s6DkuqMjJvKMr3vaJ4hjH6HRDCG29+BP2GQ5wehTTvqXMH2KFbsnXHg5KZYffm
         RBy6mYhBEvRFXaarI/Q45q9NloISO4bbzV9Tg/1HxLkrUUtALh3IrWGAEdg1UJY6oZ
         SOGJuKWsgRG4t6kmESsths1TW4ZtpPQdt15G4oyqgb7gTDIW4VWKDV4ws2qQCPn6/W
         10oSONEkyGGCDgNMxZTCgMaAba/LinENBQ6eGiqG2eX0d+bErRhWsVw2ALfgAgLInE
         IplOmTaUvtplA==
From:   Mat Martineau <martineau@kernel.org>
To:     corbet@lwn.net, linux-doc@vger.kernel.org
Cc:     Mat Martineau <martineau@kernel.org>, mat@martineau.name,
        linux-kernel@vger.kernel.org
Subject: [PATCH] CREDITS: Update email address for Mat Martineau
Date:   Mon,  1 May 2023 17:05:44 -0700
Message-Id: <20230502000545.2899055-1-martineau@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changing my email address in CREDITS to be consistent with what's in use
in MAINTAINERS and mailmap. Also removed extra date information from the
CREDITS entry since I'm a maintainer for MPTCP again.

Signed-off-by: Mat Martineau <martineau@kernel.org>
---
 CREDITS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/CREDITS b/CREDITS
index c05f4ea58ddc..2d9da9a7defa 100644
--- a/CREDITS
+++ b/CREDITS
@@ -2510,8 +2510,8 @@ D: XF86_8514
 D: cfdisk (curses based disk partitioning program)
 
 N: Mat Martineau
-E: mat@martineau.name
-D: MPTCP subsystem co-maintainer 2020-2023
+E: martineau@kernel.org
+D: MPTCP subsystem co-maintainer
 D: Keyctl restricted keyring and Diffie-Hellman UAPI
 D: Bluetooth L2CAP ERTM mode and AMP
 S: USA
-- 
2.40.1

