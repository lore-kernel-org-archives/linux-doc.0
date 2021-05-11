Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C27C433B4
	for <linux-doc@archiver.kernel.org>; Tue, 11 May 2021 15:55:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7B3A61376
	for <linux-doc@archiver.kernel.org>; Tue, 11 May 2021 15:55:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231764AbhEKP40 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 May 2021 11:56:26 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:60479 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231561AbhEKP4Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 May 2021 11:56:25 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 975995C006E;
        Tue, 11 May 2021 11:55:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 11 May 2021 11:55:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=r6WLtHdZwihxqsEzJImmL1kbKZ
        vOkaLCou5DDgJ2SpI=; b=ANjNM09ZYCIOrwkmh62CNgjrr65m1uzH7ig8QFBOxw
        8joNXb8Vyp6tQLQ5Ajjo/R/vv53ZephaJhHaln/6U5kBUyqYN2s1cS0o2xYYfdcH
        IKGxuGP2pupwA8eSLH+2a8o/56/e5UjeRkPjDKs3BibXLxZPb1QPANAggilSNw80
        dUj4MVBDwi9FYz/TVwpwUkgh4HDaPKuo7tx5BnfvFxUdNP52cuLzm5fNrreUr72W
        Dg6GJeksIEE23a3NTz80fNZfdDskRnlvnZHFQxoLEv8tqFg22iKcgfARYsSlTFO9
        GgREZyFY5Tap2HPK3fVfiuDMDDBub29eP7vBQ/YWW11A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=r6WLtHdZwihxqsEzJ
        ImmL1kbKZvOkaLCou5DDgJ2SpI=; b=nDHNgIbLOHmGysLeylsy8fCO3pHW6YGXh
        AmkumIGw3ATkiEMg9a4g+NU/J/8ysnMV4JQWHESk5l8nzIVnN9Aa53WOemxZUg0u
        szm6ZHXMLc9zjMdX4V7Fx5I2yjXRQVubTOmJqj2b0ACJa1QP7y+kXWXqWM+JNxRR
        SyWbN83YYd5H2HHzBAUpszPDE1GDL+AZPDnEBqLiEjgNqA2J4WHtOoynlbm0ogjb
        tvxtCJIRvjy+5ITz2DiehNInwrF29k9VhCVieGN/Fbvlx9yvLPY5hDhKnEVxsHd5
        UxomN6rkmol9fIoVtRQeH+MlQtgcl9QB3QMg0nUdAGj9TNhkbO0Yw==
X-ME-Sender: <xms:46iaYO5fsK-8qHzIlmwqQHaOQdTHNZ6KWODP3GPrjBRsHd9GVOUZFQ>
    <xme:46iaYH7Ipl-SL3_IowSjg9Gvwyl2b2feLl94ug34KtnjWhQQ-uCNHo38N00GYN2Si
    fj2bJu8mO7o_H-lMCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehtddgleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
    tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
    hrnhepjeffheduvddvvdelhfegleelfffgieejvdehgfeijedtieeuteejteefueekjeeg
    necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:46iaYNfprKHLAvNWzwNPccPtdCX9Tf4v1-Hz1fC_EohoQ7SAtW1nFA>
    <xmx:46iaYLImznl65v0J5fTjmhcJujS84e9Zz1DR5E88U5rBluDVSAHwOw>
    <xmx:46iaYCIq5ldLAzIsUlzkc7Q-pwyb5nAp64xU12D19yI0sIzBWJNGXA>
    <xmx:5qiaYDpua6IzSCC1VaZaLktyJ9fZWCGGlo8ttfjF_BQjnD-rtnt82A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Tue, 11 May 2021 11:55:15 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: gpu: Mention the requirements for new properties
Date:   Tue, 11 May 2021 17:55:12 +0200
Message-Id: <20210511155512.582798-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

New KMS properties come with a bunch of requirements to avoid each
driver from running their own, inconsistent, set of properties,
eventually leading to issues like property conflicts, inconsistencies
between drivers and semantics, etc.

Let's document what we expect.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/gpu/drm-kms.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 87e5023e3f55..30f4c376f419 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -463,6 +463,24 @@ KMS Properties
 This section of the documentation is primarily aimed at user-space developers.
 For the driver APIs, see the other sections.
 
+Requirements
+------------
+
+KMS drivers might need to add extra properties to support new features.
+Each new property introduced in a driver need to meet a few
+requirements, in addition to the one mentioned above.:
+
+- It must be standardized, with some documentation to describe the
+  property can be used.
+
+- It must provide a generic helper in the core code to register that
+  property on the object it attaches to.
+
+- Its content must be decoded by the core and provided in the object
+  associated state structure.
+
+- An IGT test must be submitted.
+
 Property Types and Blob Property Support
 ----------------------------------------
 
-- 
2.31.1

