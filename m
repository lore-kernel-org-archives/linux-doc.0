Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E11ACC64E69
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 07:43:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EFDF20719
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 07:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604043828;
	bh=YbNTAPiaXXKyHJeFc67okR1K95cmQVu6lTPqie6j+g0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=wceagbsz/VtKObDpDYi5QZkjTaY/YqTN/4bGbJrSmk1huNpM6UkJI69uMGVzPfGmx
	 sxxxCpiymU3r+oScU738HA395p5cI6uW+OiVvkMKs137BQqy+22+2VJ2faPMU9Joxd
	 qIunygtUIb1F9/DKiblQOMk/aaygBVaN9qMEj038=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbgJ3HlD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Oct 2020 03:41:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:51412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725355AbgJ3HlD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 30 Oct 2020 03:41:03 -0400
Received: from mail.kernel.org (ip5f5ad5bb.dynamic.kabel-deutschland.de [95.90.213.187])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 794E7221F8;
        Fri, 30 Oct 2020 07:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604043662;
        bh=YbNTAPiaXXKyHJeFc67okR1K95cmQVu6lTPqie6j+g0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IpsWRw+mIjQmCKTalMZjTMKwjbrRJppme8wm9Fi95mIAQK/YPw+mhhyOr/13CyVJN
         nF1Z7OZp7QjWXlqVqH4M2hJVka53fJRyQHA502pEOPOpGXl6s6F7QwzL7zjKuvX2HE
         DHSBGD2zGVoYM8BcO5MIeqyiknEQ9EvKpUEOIU0c=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kYP1w-004OfZ-Gy; Fri, 30 Oct 2020 08:41:00 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Oded Gabbay <oded.gabbay@gmail.com>, Tom Rix <trix@redhat.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/39] scripts: get_abi.pl: use bold font for ABI definitions
Date:   Fri, 30 Oct 2020 08:40:28 +0100
Message-Id: <9ed645c2519169817379c1df5b8cf03828e92520.1604042072.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1604042072.git.mchehab+huawei@kernel.org>
References: <cover.1604042072.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As we're using tables, let's distinguish the ones used by ABI
by using a bold font.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.pl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/get_abi.pl b/scripts/get_abi.pl
index 5612f019fae0..12a23f9a2f86 100755
--- a/scripts/get_abi.pl
+++ b/scripts/get_abi.pl
@@ -300,6 +300,7 @@ sub output_rest {
 			my $len = 0;
 
 			foreach my $name (@names) {
+				$name = "**$name**";
 				$len = length($name) if (length($name) > $len);
 			}
 
-- 
2.26.2

