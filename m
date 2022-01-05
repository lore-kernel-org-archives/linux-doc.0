Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF35CC433EF
	for <linux-doc@archiver.kernel.org>; Wed,  5 Jan 2022 14:36:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236258AbiAEOgw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 Jan 2022 09:36:52 -0500
Received: from foss.arm.com ([217.140.110.172]:45008 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240950AbiAEOgv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 5 Jan 2022 09:36:51 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0338711D4;
        Wed,  5 Jan 2022 06:36:51 -0800 (PST)
Received: from e121896.arm.com (unknown [10.57.36.251])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B05833F5A1;
        Wed,  5 Jan 2022 06:36:49 -0800 (PST)
From:   James Clark <james.clark@arm.com>
To:     nfraprado@protonmail.com, n@nfraprado.net,
        linux-doc@vger.kernel.org
Cc:     mchehab+huawei@kernel.org, corbet@lwn.net,
        James Clark <james.clark@arm.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] docs: automarkup.py: Fix invalid HTML link output and broken URI fragments
Date:   Wed,  5 Jan 2022 14:36:38 +0000
Message-Id: <20220105143640.330602-1-james.clark@arm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changes since v1:
 * Re-ordered comments so that they align with the correct code
 * Add Nícolas's review tag

James Clark (1):
  docs: automarkup.py: Fix invalid HTML link output and broken URI
    fragments

 Documentation/sphinx/automarkup.py | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

-- 
2.28.0

