Return-Path: <SRS0=E6DB=AO=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50917C433E0
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jul 2020 21:36:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26ECC20884
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jul 2020 21:36:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="u3ZH7sLG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbgGCVg5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Jul 2020 17:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbgGCVg5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jul 2020 17:36:57 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B527C061794;
        Fri,  3 Jul 2020 14:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=l5yjvTEpP+YsS16qaB8R2z6IbIaXW0kYk4dGPKzsvto=; b=u3ZH7sLGSwZN9kueVIOaqjvXe1
        vINkND6Jj+Ih61frfJ0i+mEjBpjJqwDCBPRbpYFoIV9/qnRWLbjx5hYUzAnutRGKYp1YZMVbupwVX
        Log1rcx8P+cLwzyj+5Whf//RDRo8+oiZF+xUvzvVMWe1RJRUl4Y5W70b3exGWAAscaM5G0HHegYnb
        FyK4WOU1owFyHc7t6uqyAoC5qZZTbUvaGzOj1ZGOrsBl+wRUDWP4V2DT256VVirLeYFgCX99ca4c5
        VIKfztjbRLg3ESh9Igkl3GkMKjtEvtGhgCe2lQaUKsHSsB8VW0Pa8NXPLHoI/bcbUFJty5Qtq6UED
        cXrfQxtA==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jrTMc-0006gs-RH; Fri, 03 Jul 2020 21:36:55 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>
Subject: [PATCH 0/2] Documentation: locking: eliminate duplicated words
Date:   Fri,  3 Jul 2020 14:36:47 -0700
Message-Id: <20200703213649.30948-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Drop doubled words in Documentation/locking/.


Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Will Deacon <will@kernel.org>

 Documentation/locking/mutex-design.rst    |    2 +-
 Documentation/locking/ww-mutex-design.rst |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
