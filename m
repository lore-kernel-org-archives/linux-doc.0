Return-Path: <SRS0=KUUv=ED=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99824C6369E
	for <linux-doc@archiver.kernel.org>; Wed, 28 Oct 2020 22:19:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 617FB206ED
	for <linux-doc@archiver.kernel.org>; Wed, 28 Oct 2020 22:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603923569;
	bh=ckgjUE69umuHevO02NuwWFEyr0AOCdfiFzSD8fGftck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=BMZuxXGhrlMmJK/qgaInikxtb74xUYTxB1YLdifm16Rhcc9bC9nIRWFr0HBLtA3cd
	 Tz+7vymVGGiQelL+fv5fkQmb8h9JzikQZ5iUIY7skNzXYaKjdyexmTx0j9reucX/BC
	 9LoFZbXnE79ZKJO3iFYWsIpjldAk3hDvUmjDJ8sE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731941AbgJ1WT2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:19:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:60510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731703AbgJ1WRm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:42 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8551F24767;
        Wed, 28 Oct 2020 14:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603895014;
        bh=ckgjUE69umuHevO02NuwWFEyr0AOCdfiFzSD8fGftck=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VDUyLDHD97OSgbMOJxFiz4hfYltl+R9Bzk4lsOBpfYxp9x3s2uzKPOSAb0/2EpVoU
         HxFp2pMhk/qb07di5NwfszF+LTuCLXFJ25b3wEt3Yfhs4i0GlTAIh7Fm0cMb5XSeP8
         iV5dr4qWXU3HCsHBHCHwFQZPk90XNgTqOIDU+X4A=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kXmMO-003hl4-Cv; Wed, 28 Oct 2020 15:23:32 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH 08/33] scripts: get_abi.pl: prevent duplicated file names
Date:   Wed, 28 Oct 2020 15:23:06 +0100
Message-Id: <ed42655e3d721df82e6f358f34cb66b7485b4f09.1603893146.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603893146.git.mchehab+huawei@kernel.org>
References: <cover.1603893146.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The same filename may exist on multiple directories within
ABI. Create separate entries at the internal database for
each of them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.pl | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/scripts/get_abi.pl b/scripts/get_abi.pl
index 97a1455789f2..f2c8a888148b 100755
--- a/scripts/get_abi.pl
+++ b/scripts/get_abi.pl
@@ -65,7 +65,10 @@ sub parse_abi {
 	my $name = $file;
 	$name =~ s,.*/,,;
 
-	my $nametag = "File $name";
+	my $fn = $file;
+	$fn =~ s,Documentation/ABI/,,;
+
+	my $nametag = "File $fn";
 	$data{$nametag}->{what} = "File $name";
 	$data{$nametag}->{type} = "File";
 	$data{$nametag}->{file} = $name;
@@ -320,16 +323,18 @@ sub output_rest {
 			my $fileref = "abi_file_".$path;
 
 			if ($type eq "File") {
-				my $bar = $w;
-				$bar =~ s/./-/g;
-
 				print ".. _$fileref:\n\n";
-				print "$w\n$bar\n\n";
 			} else {
 				print "Defined on file :ref:`$f <$fileref>`\n\n";
 			}
 		}
 
+		if ($type eq "File") {
+			my $bar = $w;
+			$bar =~ s/./-/g;
+			print "$w\n$bar\n\n";
+		}
+
 		my $desc = "";
 		$desc = $data{$what}->{description} if (defined($data{$what}->{description}));
 		$desc =~ s/\s+$/\n/;
-- 
2.26.2

