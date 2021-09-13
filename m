Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD10DC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 13 Sep 2021 15:40:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4BE1610A6
	for <linux-doc@archiver.kernel.org>; Mon, 13 Sep 2021 15:40:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241524AbhIMPlP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Sep 2021 11:41:15 -0400
Received: from mail.skyhub.de ([5.9.137.197]:49740 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241053AbhIMPlM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 13 Sep 2021 11:41:12 -0400
Received: from zn.tnic (p200300ec2f097300886079c88d3e49d7.dip0.t-ipconnect.de [IPv6:2003:ec:2f09:7300:8860:79c8:8d3e:49d7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9C6161EC04E4;
        Mon, 13 Sep 2021 17:39:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1631547591;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:
         content-transfer-encoding:content-transfer-encoding:in-reply-to:
         references; bh=pnrt1EUjmKLmEf+gL8sd0mV3NQQlTbn2qPoOQ/HG2U8=;
        b=UjxHWCXs63MIBlOOIA6rXNiUq5p8kkBCLWQYOAJ8ulqtinq6aQA8K6PmDgz9Zd5xM2aomH
        0Q1VWFbxPEbgRufHcijTkxWLEk4YzZ8k17E/LDpuifVY1onvhTXSYdaDaVPrn1LyFdnHNO
        sAjLtJVEuBOwuiL1qav9Oqa2sGahjAc=
From:   Borislav Petkov <bp@alien8.de>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     X86 ML <x86@kernel.org>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] doc: Add tip maintainer's handbook
Date:   Mon, 13 Sep 2021 17:39:40 +0200
Message-Id: <20210913153942.15251-1-bp@alien8.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Borislav Petkov <bp@suse.de>

Hi Jon,

here is the rest of the tip maintainer handbook "preachings" which are
not generic enough to go into the main documentation but are tip-tree
specific and are collected in a separate handbook.

Please apply,
Thx.


Thomas Gleixner (2):
  Documentation/process: Add maintainer handbooks section
  Documentation/process: Add tip tree handbook

 Documentation/process/index.rst               |   1 +
 .../process/maintainer-handbooks.rst          |  18 +
 Documentation/process/maintainer-tip.rst      | 785 ++++++++++++++++++
 Documentation/process/submitting-patches.rst  |   7 +
 4 files changed, 811 insertions(+)
 create mode 100644 Documentation/process/maintainer-handbooks.rst
 create mode 100644 Documentation/process/maintainer-tip.rst

-- 
2.29.2

