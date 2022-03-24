Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1686C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 24 Mar 2022 23:13:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355662AbiCXXOz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Mar 2022 19:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355655AbiCXXOx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Mar 2022 19:14:53 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2D5E24BF6;
        Thu, 24 Mar 2022 16:13:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AD5D2B82485;
        Thu, 24 Mar 2022 23:13:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04AACC340EC;
        Thu, 24 Mar 2022 23:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648163597;
        bh=7DA9eVgXr7JdebMF0OqQLCnaWNjq95dePMXwJYu6rvA=;
        h=From:To:Cc:Subject:Date:From;
        b=uHIxHVnJxM5c0Pc5XkNPP+3dLuT1Gvu64SOp2GlV+N1ZkqPv4K2buKd2qTLWOUv0D
         L/5auMk+P/pYRWi8njyGulLrWJu0xwXQbjFkPmx5VpAhM86Vnw0rwQBSLjF9ceoE3T
         Mg2ZI1A2ovCSTcAzhYQ4qSRTpPgwvpibIuWp1xAyAcFXHQs54Cua3Vo1+YHYHimlri
         Y0iYt7wCtOoksomrTe04jO9NwOfV4FiRSJrrZ6TO+Ayz0yj5rk51jZ/MTAm4M+964T
         UTXnBPX0rlF1ISAlwo5yI00TYOf8LDWsozAiwLr43+pawwVQrINXdLvLP4h8uqBvCG
         y7NZnBUYcsviA==
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, pabeni@redhat.com, corbet@lwn.net,
        imagedong@tencent.com, edumazet@google.com, dsahern@kernel.org,
        talalahmad@google.com, linux-doc@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>
Subject: [RFC v2 0/3] docs: document some aspects of struct sk_buff
Date:   Thu, 24 Mar 2022 16:13:09 -0700
Message-Id: <20220324231312.2241166-1-kuba@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This small set creates a place to render sk_buff documentation,
documents one random thing (data-only skbs) and converts the big
checksum comment to kdoc.

v2:
 - fix type reference in patch 1
 - use "payload" and "data" more consistently
 - add snippet with calls

Jakub Kicinski (3):
  skbuff: add a basic intro doc
  skbuff: rewrite the doc for data-only skbs
  skbuff: render the checksum comment to documentation

 Documentation/networking/index.rst  |   1 +
 Documentation/networking/skbuff.rst |  37 ++++
 include/linux/skbuff.h              | 301 ++++++++++++++++++----------
 3 files changed, 232 insertions(+), 107 deletions(-)
 create mode 100644 Documentation/networking/skbuff.rst

-- 
2.34.1

