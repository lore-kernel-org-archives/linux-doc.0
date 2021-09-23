Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E81C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 15:45:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C48D60F0F
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 15:45:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242134AbhIWPnp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Sep 2021 11:43:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:38354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242080AbhIWPnF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 23 Sep 2021 11:43:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6CCA0610C8;
        Thu, 23 Sep 2021 15:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632411693;
        bh=msj1HjB4sc3NrsgvWpq1oIvIRROwT8HAcjlFieJYSPs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ju9ZPOK+HTHz2p8VJH2qUYGspJLGfP/AJ0AHGnsQZveVWvJHIAfAegwhN54LGNehX
         1sVi2iqIGgqHoiTjC/q8/vWuWQAtLWfqjQSL79om5Smhisb9H9hhPvSNZE0D595kzC
         eGhw63GsXcFa9I209BnLsMh+eY0sSIhvRfvj/JsV85b1a948hodMHn/BsjVQud5+qr
         KtvFTqIvm2WSTutdel4hI55O/hshgxZFMfo9hHZNfiFanNF5tlj/8IZlLkBnDblLJ2
         DS5VniqNJH669vS0Yl4n2QMbFzKHCAXO0JF+FE41TssvI5kgIZsylhfrfE/Mu3e1Ku
         QoWCOI/6vvNPA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mTQqp-000p6K-P5; Thu, 23 Sep 2021 17:41:31 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     #@kernel.org, YUyICHTRdfL8Ul7X@kroah.com,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] scripts: get_abi.pl: Better handle leaves with wildcards
Date:   Thu, 23 Sep 2021 17:41:15 +0200
Message-Id: <60bb97cf337333783f9f52e114b896439e9cc215.1632411447.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1632411447.git.mchehab+huawei@kernel.org>
References: <cover.1632411447.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When the the leaf of a regex ends with a wildcard, the speedup
algorithm to reduce the number of regexes to seek won't work.

So, when those are found, place at the "others" exception.

That slows down the search from 0.14s to 1 minute on my
machine, but the results are a lot more consistent.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/get_abi.pl b/scripts/get_abi.pl
index bb80303fea22..3c0063d0e05e 100755
--- a/scripts/get_abi.pl
+++ b/scripts/get_abi.pl
@@ -665,7 +665,7 @@ sub get_leave($)
 	# However, there are a few occurences where the leave is
 	# either a wildcard or a number. Just group such cases
 	# altogether.
-	if ($leave =~ m/^\.\*/ || $leave eq "" || $leave =~ /^\d+$/) {
+	if ($leave =~ m/\.\*/ || $leave eq "" || $leave =~ /\\d/) {
 		$leave = "others";
 	}
 
-- 
2.31.1

