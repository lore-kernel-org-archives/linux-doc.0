Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93F7C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 22 Oct 2021 09:03:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3530611F2
	for <linux-doc@archiver.kernel.org>; Fri, 22 Oct 2021 09:03:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232357AbhJVJFd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 22 Oct 2021 05:05:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:36888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232462AbhJVJFc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 22 Oct 2021 05:05:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C4DA261108;
        Fri, 22 Oct 2021 09:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634893395;
        bh=DAhOYXRT2m/QKs9Tzugwqo+TXSHI1fi9rIOOeAzIDWE=;
        h=From:To:Cc:Subject:Date:From;
        b=gkIqtt282E4ZVkseV9MNsn1ehzF9MdeI3+7+z6ntUr3nI5PgWFkSPU9qRREwQR+K6
         u+kfvFFom+LtldgwkCv6KDMPRhtM6Cr7m9SblVy2ix3tHvZOr3IhCoNDRQj/ctsYi1
         E/fr7lMx3h50aGjtxdqx3mLUfoK84RFXkolm9eQxtMEHTuoWGvB6LAq7JvowX1IqKJ
         pGDsqCDt1hUOoRfZ1hmzPc+OuWWLFwhlP7Y/loR4KyTSyGw6qHe10xacueZBFh8iEt
         WgbTgc3+eAEw1D2fCMqjPFQ5Fthl3RryPMss5RTQB6eu7NzhmSYLRyymtlkwYn8v+T
         TfL3edjCd9gtw==
From:   SeongJae Park <sj@kernel.org>
To:     akpm@linux-foundation.org, corbet@lwn.net
Cc:     peterx@redhat.com, linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, SeongJae Park <sj@kernel.org>
Subject: [PATCH 0/4] Fix trivial nits in Documentation/admin-guide/mm
Date:   Fri, 22 Oct 2021 09:03:07 +0000
Message-Id: <20211022090311.3856-1-sj@kernel.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patchset fixes trivial nits in admin guide documents for DAMON and
pagemap.

SeongJae Park (4):
  Docs/admin-guide/mm/damon/start: Fix wrong example commands
  Docs/admin-guide/mm/damon/start: Fix a wrong link
  Docs/admin-guide/mm/damon/start: Simplify the content
  Docs/admin-guide/mm/pagemap: Wordsmith page flags descriptions

 Documentation/admin-guide/mm/damon/start.rst | 123 ++++++++++---------
 Documentation/admin-guide/mm/pagemap.rst     |  53 ++++----
 2 files changed, 93 insertions(+), 83 deletions(-)

-- 
2.17.1

