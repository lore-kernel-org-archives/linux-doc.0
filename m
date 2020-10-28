Return-Path: <SRS0=jIxK=EE=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E92C388F7
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 00:57:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 881BA20790
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 00:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603933026;
	bh=rXkEXEwFhcs7bwUOVhZhpDJnLWbA8OeK8cYI5mIwo80=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=pGw36OaRhfMtjo6ByuQvw+zD5YE93cNkYotKx3S/iw+zK1iyThY5tJf3ZeFs3Krg8
	 C8i+Z94NmzwHueCzw2nzFr0L/l15x6ZD745D26RgIwoohOfGFn5REZeVvfVv+t2bQi
	 38rDrkaYMy3iF7jyu/fGQHCTFvUIRSHlfSqLMilE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbgJ2A4u (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Oct 2020 20:56:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:60512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731626AbgJ1WRg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:36 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7B69F24763;
        Wed, 28 Oct 2020 14:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603895014;
        bh=rXkEXEwFhcs7bwUOVhZhpDJnLWbA8OeK8cYI5mIwo80=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Wu+AVJiVsn0Z6IEyoyXDCpXWtu9YiM7OEeO3TA9DHueA+pjwaGfc3utvvtPFwA9v0
         b8rnrDCJILZJE7R6iLDwr3oSz0/IosRzdhaVQX2/WQbhN/IvU78UaWmGgkQJYjerXe
         HxDd/XFwXfZTV5SvqWSIT3zlk7nxlyxXIDmg5t5g=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kXmMO-003hl1-Ba; Wed, 28 Oct 2020 15:23:32 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH 07/33] scripts: get_abi.pl: output users in ReST format
Date:   Wed, 28 Oct 2020 15:23:05 +0100
Message-Id: <d76d10422c4f0dc83e81ce266dd38e6efec459c9.1603893146.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603893146.git.mchehab+huawei@kernel.org>
References: <cover.1603893146.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Right now, the script only outputs Users on search. Print it
also in ReST format.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.pl | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/get_abi.pl b/scripts/get_abi.pl
index c88cb8ee6bfd..97a1455789f2 100755
--- a/scripts/get_abi.pl
+++ b/scripts/get_abi.pl
@@ -371,6 +371,14 @@ sub output_rest {
 				print "- :ref:`$content <$label>`\n\n";
 			}
 		}
+
+		if (defined($data{$what}->{users})) {
+			my $users = $data{$what}->{users};
+
+			$users =~ s/\n/\n\t/g;
+			printf "Users:\n\t%s\n\n", $users if ($users ne "");
+		}
+
 	}
 }
 
-- 
2.26.2

