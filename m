Return-Path: <SRS0=C3TA=EC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 694A3C55179
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 10:02:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 125112071A
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 10:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603792955;
	bh=XWcvmaBJsNdx4pEkNGAT9OQ81e8rghcsnajzjBknoUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=2RpPN7SajQH+ZZ0iEWPec+vnfZsSjWDFni2iXZX2zz2zdBDHwC2UKxw8zw49tqK/3
	 8uMBuru1OJt8dGkvXZJC21JfBlwQ6SRkZLTqh1l2OfwiKPp7mnfB7mQ8jqcF1BEPxQ
	 Z8TQJ1wCI4nbFlb+3vE8OC2HhBTqK1z4/zg/BRxY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896033AbgJ0Jvm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Oct 2020 05:51:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:42144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896013AbgJ0Jvl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 27 Oct 2020 05:51:41 -0400
Received: from mail.kernel.org (ip5f5ad5af.dynamic.kabel-deutschland.de [95.90.213.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 004D221D24;
        Tue, 27 Oct 2020 09:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603792301;
        bh=XWcvmaBJsNdx4pEkNGAT9OQ81e8rghcsnajzjBknoUI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KJLT/uy1T94y3wg8bf3PjlgiAOayEMq/vGRI2I54lecUe5K+iXox81/oYj/RUxqTt
         7GOBIjBvUvl38vt6jG6/9y1CUrvF8atDoxx025hiOWIrr+7Ci8FmUN8Lo9R6u5v/Ig
         To1MLWKa7Bz2Yo4hn1uSK+rWjkYZ79au3DYDDsCg=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kXLdi-003FEV-Ta; Tue, 27 Oct 2020 10:51:38 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/32] scripts: kernel-doc: use :c:union when needed
Date:   Tue, 27 Oct 2020 10:51:05 +0100
Message-Id: <6e4ec3eec914df62389a299797a3880ae4490f35.1603791716.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603791716.git.mchehab+huawei@kernel.org>
References: <cover.1603791716.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sphinx C domain code after 3.2.1 will start complaning if :c:struct
would be used for an union type:

	.../Documentation/gpu/drm-kms-helpers:352: ../drivers/video/hdmi.c:851: WARNING: C 'identifier' cross-reference uses wrong tag: reference name is 'union hdmi_infoframe' but found name is 'struct hdmi_infoframe'. Full reference name is 'union hdmi_infoframe'. Full found name is 'struct hdmi_infoframe'.

So, let's address this issue too in advance, in order to
avoid future issues.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index c8f6b11d5da1..99cd8418ff8a 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1092,7 +1092,11 @@ sub output_struct_rst(%) {
 	print "\n\n.. c:type:: " . $name . "\n\n";
     } else {
 	my $name = $args{'struct'};
-	print "\n\n.. c:struct:: " . $name . "\n\n";
+	if ($args{'type'} eq 'union') {
+	    print "\n\n.. c:union:: " . $name . "\n\n";
+	} else {
+	    print "\n\n.. c:struct:: " . $name . "\n\n";
+	}
     }
     print_lineno($declaration_start_line);
     $lineprefix = "   ";
-- 
2.26.2

