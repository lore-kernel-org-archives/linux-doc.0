Return-Path: <SRS0=87kO=6F=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 250B6C54FD0
	for <linux-doc@archiver.kernel.org>; Tue, 21 Apr 2020 14:31:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04BB6206D9
	for <linux-doc@archiver.kernel.org>; Tue, 21 Apr 2020 14:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587479494;
	bh=54uiv8HvGiefwFGF8O1bh0la64TVnoBMhV0VYuxsv8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=mXb4YTGrHTJBrdhFx2xm3J4zH6eTn995zEIurVTvWQGR2eWP4MLcO5GuLxXPRp01G
	 flNMr6V3rKZhZHl+4rBrHBcidx95jlVCTJ4IO+/VeUj7iJh1Eq/mGdYsdqqdy3z6d/
	 unAqxkwqGKh/iHLujYY6v7XdrjJVuKUoJ+RBfqgA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729206AbgDUOba (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Apr 2020 10:31:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:43684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728874AbgDUObN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 21 Apr 2020 10:31:13 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 60E632070B;
        Tue, 21 Apr 2020 14:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587479472;
        bh=54uiv8HvGiefwFGF8O1bh0la64TVnoBMhV0VYuxsv8M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m8Ry624qufMZup3aC4Na0dx0DyBBLRIKNgezfzhexpgj3jPIzDGZxVZlVk7wCT3Z4
         A6zqf7MpzjBa+IZDGnXRIu8luQYicFV5bi1TsnAbACsGy6I8joGufH3rlcgl1UK/fV
         EhawSZH/l/w9EZb0SQuW59maVYAWh/fj6LzshEZE=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jQtva-00Bkqa-K8; Tue, 21 Apr 2020 16:31:10 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 5/5] scripts: sphinx-pre-install: change the output order
Date:   Tue, 21 Apr 2020 16:31:09 +0200
Message-Id: <36cecf7fe19d165db8e93f8a0f6fc88ec705d131.1587478901.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587478901.git.mchehab+huawei@kernel.org>
References: <cover.1587478901.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When the script detects the need for an upgrade, it will
print either a warning or a note.

Let's change a little bit the order where messages will be
displayed, in order to make easier for the user to identify
the more important messages.

It should now be like this:

	Detected OS: Fedora release 31 (Thirty One).
	Sphinx version: 1.7.9

	Note: It is recommended at least Sphinx version 2.4.4 if you need PDF support.
	To upgrade Sphinx, use:

		/usr/bin/python3 -m venv sphinx_2.4.4
		. sphinx_2.4.4/bin/activate
		pip install -r ./Documentation/sphinx/requirements.txt

	If you want to exit the virtualenv, you can use:
		deactivate

All optional dependencies are met.
Needed package dependencies are met.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/sphinx-pre-install | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index 987aebf7e3a0..2c7a4f9594cd 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -321,14 +321,11 @@ sub check_sphinx()
 
 	if ($cur_version lt $rec_version) {
 		printf "Sphinx version %s\n", $cur_version;
-		print "Warning: It is recommended at least Sphinx version $rec_version.\n";
-		print "         If you want pdf, you need at least $min_pdf_version.\n";
 		$rec_sphinx_upgrade = 1;
 		return;
 	}
 	if ($cur_version lt $min_pdf_version) {
 		printf "Sphinx version %s\n", $cur_version;
-		print "Note: It is recommended at least Sphinx version $min_pdf_version if you need PDF support.\n";
 		$rec_sphinx_upgrade = 1;
 		return;
 	}
@@ -799,6 +796,13 @@ sub check_needs()
 		my $min_activate = "$ENV{'PWD'}/${virtenv_prefix}${min_version}/bin/activate";
 		my @activates = glob "$ENV{'PWD'}/${virtenv_prefix}*/bin/activate";
 
+		if ($cur_version lt $rec_version) {
+			print "Warning: It is recommended at least Sphinx version $rec_version.\n";
+			print "         If you want pdf, you need at least $min_pdf_version.\n";
+		}
+		if ($cur_version lt $min_pdf_version) {
+			print "Note: It is recommended at least Sphinx version $min_pdf_version if you need PDF support.\n";
+		}
 		@activates = sort {$b cmp $a} @activates;
 		my ($activate, $ver);
 		foreach my $f (@activates) {
-- 
2.25.2

