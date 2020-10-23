Return-Path: <SRS0=PdnY=D6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9A8C55179
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 16:37:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D0FC208C3
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 16:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603471074;
	bh=smXO7tg/HPUrSgy1Z0++7ANOY+Q92oVSUkhCLjgR2y4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=l/wJLPz74qqk74ENgSDbwhGR7sK/gBxK5dfSzq4StkDWkYYlVdTPfj1iXbsAtDgo/
	 KfzF9RtibXq9ydQ1h4dkhUURZHFxW3KoPbvjLJKj3Q8JGS8i3TgHYO/E6qDxCRFJY6
	 XoamU2rlkDLpYLbngyKdhIUkE0N+4XDW4wTrz9Ts=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S465941AbgJWQdt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Oct 2020 12:33:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:32792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S465570AbgJWQdr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Oct 2020 12:33:47 -0400
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 042BA2464E;
        Fri, 23 Oct 2020 16:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603470827;
        bh=smXO7tg/HPUrSgy1Z0++7ANOY+Q92oVSUkhCLjgR2y4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EUJaR5jhGbcV+UpetekyaCly8XbU75RekMoDxhft9juGXIsv/yp5RLkYFdhWmJ8qW
         PkxI2WPS9eohr9XNOSZ/soArJXwmymB/Ap1UGZ7mPI/GQq+LNGaRzJOpuzlZuGvxo3
         3sgKCtY5u80y2kvwzGwyMaxousoIyyacWUKdt6is=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kW00e-002AvZ-Qn; Fri, 23 Oct 2020 18:33:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Jonathan Corbet" <corbet@lwn.net>, Borislav Petkov <bp@alien8.de>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [PATCH v3 06/56] x86: mtrr: fix a kernel-doc markup
Date:   Fri, 23 Oct 2020 18:32:53 +0200
Message-Id: <2217cd4ae9e561da2825485eb97de77c65741489.1603469755.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603469755.git.mchehab+huawei@kernel.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Kernel-doc markup should use this format:
	identifier - description

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 arch/x86/kernel/cpu/mtrr/mtrr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mtrr/mtrr.c b/arch/x86/kernel/cpu/mtrr/mtrr.c
index 6a80f36b5d59..08a30c8e9431 100644
--- a/arch/x86/kernel/cpu/mtrr/mtrr.c
+++ b/arch/x86/kernel/cpu/mtrr/mtrr.c
@@ -813,7 +813,8 @@ void mtrr_ap_init(void)
 }
 
 /**
- * Save current fixed-range MTRR state of the first cpu in cpu_online_mask.
+ * mtrr_save_state - Save current fixed-range MTRR state of the first
+ *	cpu in cpu_online_mask.
  */
 void mtrr_save_state(void)
 {
-- 
2.26.2

