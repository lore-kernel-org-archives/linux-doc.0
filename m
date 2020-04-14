Return-Path: <SRS0=PpzG=56=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D6BDC3815B
	for <linux-doc@archiver.kernel.org>; Tue, 14 Apr 2020 08:51:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CA02206E9
	for <linux-doc@archiver.kernel.org>; Tue, 14 Apr 2020 08:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586854276;
	bh=bMOZXA29EltTzw5fa5244atNAkuSF+D28/hwfOaIvgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=tiS2QLcVWuVhMh+TvEF0JWzVk8K9P1g9eeNnqkm+fJoEZE+W22MUiP8BwAN4SF6nt
	 hKymoBvJNYCqXvPLyWygUSZNpb0jEO+9rUKYfHuWBGbjetz7wjxb94z0FCT9uG9ZuQ
	 K6TMR6V/UTctCZjjwO2KvXJAmCmJyyzlyE36dkS0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437100AbgDNIvM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Apr 2020 04:51:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:52034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437092AbgDNIvJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 14 Apr 2020 04:51:09 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B6AA02084D;
        Tue, 14 Apr 2020 08:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586854268;
        bh=bMOZXA29EltTzw5fa5244atNAkuSF+D28/hwfOaIvgY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qNJ1ntUONeAJ6DT3qZ9BWEhPCNO4YKE21hM7Yl+JWGDOPE0Kxrpjp5gQDo7qoGJYI
         U8doHHPGYx6giTc7QPOeMeHMSOrT1UtqqvfBBpCJ7IjRv12QwgEtAVJgJZbkQuFw7+
         I/qiC2eByz4OvyePAANoseXvQPaxNzaZjPdQgN38=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOHHe-002wz6-WF; Tue, 14 Apr 2020 10:51:07 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 05/19] media: docs: update avermedia.rst contents
Date:   Tue, 14 Apr 2020 10:50:51 +0200
Message-Id: <4f47d48ede7f6814959c99500726508dcfed6c31.1586854191.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586854191.git.mchehab+huawei@kernel.org>
References: <cover.1586854191.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

While this is old, now that we moved the intro part of it,
its contents seem to be valid, if we mention that we're
talking only about the BT878 support.

Update the document title accordingly and remove the obsolete
note from it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/avermedia.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/media/avermedia.rst b/Documentation/admin-guide/media/avermedia.rst
index 349f696f7f01..93ff74002d20 100644
--- a/Documentation/admin-guide/media/avermedia.rst
+++ b/Documentation/admin-guide/media/avermedia.rst
@@ -1,16 +1,16 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-HOWTO: Get An Avermedia DVB-T working under Linux
--------------------------------------------------
+======================================
+Avermedia DVB-T on BT878 Release Notes
+======================================
 
 February 14th 2006
 
 .. note::
 
-   This documentation is outdated. Please check at the DVB wiki
-   at https://linuxtv.org/wiki for more updated info.
+   Several other Avermedia devices are supported. For a more
+   broader and updated content about that, please check:
 
-   There's a section there specific for Avermedia boards at:
    https://linuxtv.org/wiki/index.php/AVerMedia
 
 The Avermedia DVB-T
-- 
2.25.2

