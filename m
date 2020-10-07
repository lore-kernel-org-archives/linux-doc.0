Return-Path: <SRS0=+dB3=DO=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83521C41604
	for <linux-doc@archiver.kernel.org>; Wed,  7 Oct 2020 08:43:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32FDD20797
	for <linux-doc@archiver.kernel.org>; Wed,  7 Oct 2020 08:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602060194;
	bh=/sFCkq5oJImYNwq6dQNMQFugo7oIPmUBVxj2a8fU55M=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=fWoV8jrJV5j2S8mjUy8QLmjkx0Fpm19M359hIKH6b7WG/FO4yQK4RoAKSEEJfXzMJ
	 0krpnCHrf2mfSbmdV0D7RVBi0LXXHbxYL2yJydYXnFvqoBmmnZfdrdVlJBOvjgiKqP
	 AS6igNHDNg+AepSzNQIDR/+57SvbppfAXb8SLW4Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgJGInN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Oct 2020 04:43:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:36912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726181AbgJGInN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Oct 2020 04:43:13 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.194])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B7CEF20797;
        Wed,  7 Oct 2020 08:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602060193;
        bh=/sFCkq5oJImYNwq6dQNMQFugo7oIPmUBVxj2a8fU55M=;
        h=From:To:Cc:Subject:Date:From;
        b=W28yM5bIifjQ3xzPcY8ovt+B0pmQlytcYdWLJjSyfoYhoS45AcvBuRbWIo3zbnM+f
         grDw+zV1kPnoeCrtf1oPg9BgantQrZunfrywCiud/ow65oyme/iRX8iR69DvLW/9Nq
         Wv9rQVxK+7jy45Hqi03UtXhi25ijpqKIJvhjLUGE=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] docs: submitting-patches: describe preserving review/test tags
Date:   Wed,  7 Oct 2020 10:43:06 +0200
Message-Id: <20201007084306.12591-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From time to time, the novice kernel contributors do not add Reviewed-by
or Tested-by tags to the next versions of the patches.  Mostly because
they are unaware that responsibility of adding these tags in next
version is on submitter, not maintainer.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/process/submitting-patches.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 58586ffe2808..9752b6311674 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -527,6 +527,13 @@ done on the patch.  Reviewed-by: tags, when supplied by reviewers known to
 understand the subject area and to perform thorough reviews, will normally
 increase the likelihood of your patch getting into the kernel.
 
+Both Tested-by and Reviewed-by tags, once received on mailing list from tester
+or reviewer, should be added by author to the applicable patches when sending
+next versions.  However if the patch is changed in following version, these
+tags might not be applicable anymore and thus should be removed.  Usually
+removal of someone's Tested-by or Reviewed-by tags should be mentioned
+in the patch changelog (after '---' separator).
+
 A Suggested-by: tag indicates that the patch idea is suggested by the person
 named and ensures credit to the person for the idea. Please note that this
 tag should not be added without the reporter's permission, especially if the
-- 
2.17.1

