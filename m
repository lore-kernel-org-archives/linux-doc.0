Return-Path: <SRS0=C3TA=EC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989F7C55179
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 10:20:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55FA222264
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 10:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603794049;
	bh=Mlbh5ddT5d2P2agZfKmc82bHjfW48ilA7SQg4nLVrXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=nzNwVpg8rDpJ4Mxl4SF2oYM15zMeE790eIaxussq3d4BkSOC1rNXEenDnDPU3LcBM
	 Lbr/VVDmoaflV3lxa8cD9q5pePv4MJXLh50jIJ4U7Msho2Ybq9u1pKDTGUwmec6qkx
	 2jD+noB1n7z1AiIlFyjMsfJtLeHo6DZPILGDoEPQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897962AbgJ0KUs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Oct 2020 06:20:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:55506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2897944AbgJ0KUm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 27 Oct 2020 06:20:42 -0400
Received: from mail.kernel.org (ip5f5ad5af.dynamic.kabel-deutschland.de [95.90.213.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EE0DE22281;
        Tue, 27 Oct 2020 10:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603794042;
        bh=Mlbh5ddT5d2P2agZfKmc82bHjfW48ilA7SQg4nLVrXE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SsLYl2/u8/+Zjb2smL+CSKjwz1EaTzYMhwsi7YI+kHXK28snUF9rSHiyiVbDPK8Bw
         m9yagCvKp7dVSA/MfNMlvDI0Emo6TOnfaeawv6DpCX9GBzR4DQz/WeOxq9ZTRKFEhr
         ZlapQnnr/L5orgqC9EVN6xCLlcWyFHvk03NgbQfQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kXM5n-003Fgg-GB; Tue, 27 Oct 2020 11:20:39 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] scripts: kernel-doc: fix typedef parsing
Date:   Tue, 27 Oct 2020 11:20:36 +0100
Message-Id: <328e8018041cc44f7a1684e57f8d111230761c4f.1603792384.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603792384.git.mchehab+huawei@kernel.org>
References: <cover.1603792384.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The include/linux/genalloc.h file defined this typedef:

	typedef unsigned long (*genpool_algo_t)(unsigned long *map,unsigned long size,unsigned long start,unsigned int nr,void *data, struct gen_pool *pool, unsigned long start_addr);

Because it has a type composite of two words (unsigned long),
the parser gets the typedef name wrong:

.. c:macro:: long

   **Typedef**: Allocation callback function type definition

Fix the regex in order to accept composite types when
defining a typedef for a function pointer.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 99cd8418ff8a..698835909ac1 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1438,13 +1438,14 @@ sub dump_typedef($$) {
     $x =~ s@/\*.*?\*/@@gos;	# strip comments.
 
     # Parse function prototypes
-    if ($x =~ /typedef\s+(\w+)\s*\(\*\s*(\w\S+)\s*\)\s*\((.*)\);/ ||
-	$x =~ /typedef\s+(\w+)\s*(\w\S+)\s*\s*\((.*)\);/) {
+    if ($x =~ /typedef((?:\s+[\w\*]+){1,8})\s*\(\*?\s*(\w\S+)\s*\)\s*\((.*)\);/ ||
+	$x =~ /typedef((?:\s+[\w\*]+\s+){1,8})\s*\*?(\w\S+)\s*\s*\((.*)\);/) {
 
 	# Function typedefs
 	$return_type = $1;
 	$declaration_name = $2;
 	my $args = $3;
+	$return_type =~ s/^\s+//;
 
 	create_parameterlist($args, ',', $file, $declaration_name);
 
-- 
2.26.2

