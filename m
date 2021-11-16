Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2169AC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 16 Nov 2021 12:11:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C1C2615E2
	for <linux-doc@archiver.kernel.org>; Tue, 16 Nov 2021 12:11:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235992AbhKPMOb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Nov 2021 07:14:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:50850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235929AbhKPMOX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 16 Nov 2021 07:14:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D262861B42;
        Tue, 16 Nov 2021 12:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637064686;
        bh=myXeOnyd4da501Tibvs5OXCnF22sUzCqcOKMDTWZx0c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o9uMjCNjRapejOpr/PH6v6o7cTCUit3ONn+m3VGdX5NFjgX50dMxEGV3iTXlfHdGw
         0Bozk6HrS6jxiNnvwbyKnJl0p2rOLFQ91JEorDyQqDCn00E0OpdbDR6TMsaCBGoOkh
         LN1rQRnZ2qUmXBkPHYoi9BYaaDktgWqmjxBNn4MpJmxXzZsisp43+JneXSbmFOfRPO
         lMDKnLKAAAkKa2QhoAFtSJU6yBu/ptRjhsldkMQKRZyaerCH15l5qSjE2WAWtIduTO
         DABVspj0Sal3NiMPSUsrnL6DoYw9u2LvGNyY7p9jfcEQOc9fjBf/E3JOT/e1ze+MKV
         0U8fNAeqE8+nw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mmxJ6-00A9LU-Bg; Tue, 16 Nov 2021 12:11:24 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Andrew Klychkov <andrew.a.klychkov@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Mel Gorman <mgorman@suse.de>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Stephen Kitt <steve@sk2.org>, Wang Qing <wangqing@vivo.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] docs: accounting: update delay-accounting.rst reference
Date:   Tue, 16 Nov 2021 12:11:21 +0000
Message-Id: <e12b9bad60dad153c901140fc7f79aafc21eed67.1637064577.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637064577.git.mchehab+huawei@kernel.org>
References: <cover.1637064577.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The file name: accounting/delay-accounting.rst
should be, instead: Documentation/accounting/delay-accounting.rst.

Also, there's no need to use doc:`foo`, as automarkup.py will
automatically handle plain text mentions to Documentation/
files.

So, update its cross-reference accordingly.

Fixes: fcb501704554 ("delayacct: Document task_delayacct sysctl")
Fixes: c3123552aad3 ("docs: accounting: convert to ReST")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/4] at: https://lore.kernel.org/all/cover.1637064577.git.mchehab+huawei@kernel.org/

 Documentation/admin-guide/sysctl/kernel.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 426162009ce9..0e486f41185e 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1099,7 +1099,7 @@ task_delayacct
 ===============
 
 Enables/disables task delay accounting (see
-:doc:`accounting/delay-accounting.rst`). Enabling this feature incurs
+Documentation/accounting/delay-accounting.rst. Enabling this feature incurs
 a small amount of overhead in the scheduler but is useful for debugging
 and performance tuning. It is required by some tools such as iotop.
 
-- 
2.33.1

