Return-Path: <SRS0=pZ1j=DC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A515DC4727F
	for <linux-doc@archiver.kernel.org>; Fri, 25 Sep 2020 06:30:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5438D21D7F
	for <linux-doc@archiver.kernel.org>; Fri, 25 Sep 2020 06:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601015455;
	bh=RceAvssuZMNeE6WnwOK7+ok41HJ8BlDB2eeFAcsvuNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=lejBZl7xlwwDthrehs1SVGOdpSRvyD2E1t7wc1nUiAjVRoU/4xAJA4cxiHvvjVCSz
	 3zsFidkiRUNKBPkwFjAAx7dwK8JYGqZJPFnmpPAWZOpCiHcHdPjGVoWDKwCbM3ARu/
	 eZpiWzHKDpfdr2HIdOLGW5z2OWHxqkcDqpGpKxFY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727184AbgIYGay (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Sep 2020 02:30:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:57572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727135AbgIYGax (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 25 Sep 2020 02:30:53 -0400
Received: from mail.kernel.org (ip5f5ad5bf.dynamic.kabel-deutschland.de [95.90.213.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1891A2389F;
        Fri, 25 Sep 2020 06:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601015452;
        bh=RceAvssuZMNeE6WnwOK7+ok41HJ8BlDB2eeFAcsvuNc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zLCaUsRLXp8CwZBu4iI5MIjLb4RxNoRINr5p6OYdczTaWN5cVnu/cX021CLmRVimC
         yQQtpoHgqrHSg5DeuRWMM5ZkIr0/PCbrKgNUGm3YAaCebmEt/V0UfJtCn5Tfok/64u
         hyylBiOtCDYIVvud46518kL945DjVTk2VLtcr9aI=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kLhFn-000R4g-On; Fri, 25 Sep 2020 08:30:47 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/8] scripts: kernel-doc: make it more compatible with Sphinx 3.x
Date:   Fri, 25 Sep 2020 08:30:41 +0200
Message-Id: <bf83ec55fb972b1f313e83bdd29bfdd29b70da96.1601014299.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601014299.git.mchehab+huawei@kernel.org>
References: <cover.1601014299.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

With Sphinx 3.x, the ".. c:type:" tag expects a typedef-like
format, and it accepts just one name afterward.

We actually need to use the new c:struct, c:enum, ...
types when dealing with Sphinx 3.x.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc | 69 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 7 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 724528f4b7d6..48301ff41ec5 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -271,6 +271,8 @@ if ($#ARGV == -1) {
 }
 
 my $kernelversion;
+my $sphinx_major;
+
 my $dohighlight = "";
 
 my $verbose = 0;
@@ -465,6 +467,43 @@ while ($ARGV[0] =~ m/^--?(.*)/) {
 
 # continue execution near EOF;
 
+# The C domain dialect changed on Sphinx 3. So, we need to check the
+# version in order to produce the right tags.
+sub findprog($)
+{
+	foreach(split(/:/, $ENV{PATH})) {
+		return "$_/$_[0]" if(-x "$_/$_[0]");
+	}
+}
+
+sub get_sphinx_version()
+{
+	my $ver;
+	my $major = 1;
+
+	my $cmd = "sphinx-build";
+	if (!findprog($cmd)) {
+		my $cmd = "sphinx-build3";
+		return $major if (!findprog($cmd));
+	}
+
+	open IN, "$cmd --version 2>&1 |";
+	while (<IN>) {
+		if (m/^\s*sphinx-build\s+([\d]+)\.([\d\.]+)(\+\/[\da-f]+)?$/) {
+			$major=$1;
+			last;
+		}
+		# Sphinx 1.2.x uses a different format
+		if (m/^\s*Sphinx.*\s+([\d]+)\.([\d\.]+)$/) {
+			$major=$1;
+			last;
+		}
+	}
+	close IN;
+
+	return $major;
+}
+
 # get kernel version from env
 sub get_kernel_version() {
     my $version = 'unknown kernel version';
@@ -848,7 +887,7 @@ sub output_function_rst(%) {
     my $start = "";
 
     if ($args{'typedef'}) {
-	print ".. c:type:: ". $args{'function'} . "\n\n";
+	print ".. c:function:: ". $args{'function'} . "\n\n";
 	print_lineno($declaration_start_line);
 	print "   **Typedef**: ";
 	$lineprefix = "";
@@ -938,9 +977,14 @@ sub output_enum_rst(%) {
     my ($parameter);
     my $oldprefix = $lineprefix;
     my $count;
-    my $name = "enum " . $args{'enum'};
 
-    print "\n\n.. c:type:: " . $name . "\n\n";
+    if ($sphinx_major < 3) {
+	my $name = "enum " . $args{'enum'};
+	print "\n\n.. c:type:: " . $name . "\n\n";
+    } else {
+	my $name = $args{'enum'};
+	print "\n\n.. c:enum:: " . $name . "\n\n";
+    }
     print_lineno($declaration_start_line);
     $lineprefix = "   ";
     output_highlight_rst($args{'purpose'});
@@ -966,9 +1010,14 @@ sub output_typedef_rst(%) {
     my %args = %{$_[0]};
     my ($parameter);
     my $oldprefix = $lineprefix;
-    my $name = "typedef " . $args{'typedef'};
 
-    print "\n\n.. c:type:: " . $name . "\n\n";
+    if ($sphinx_major < 3) {
+	my $name = "typedef " . $args{'typedef'};
+	print "\n\n.. c:type:: " . $name . "\n\n";
+    } else {
+	my $name = $args{'typedef'};
+	print "\n\n.. c:type:: " . $name . "\n\n";
+    }
     print_lineno($declaration_start_line);
     $lineprefix = "   ";
     output_highlight_rst($args{'purpose'});
@@ -982,9 +1031,14 @@ sub output_struct_rst(%) {
     my %args = %{$_[0]};
     my ($parameter);
     my $oldprefix = $lineprefix;
-    my $name = $args{'type'} . " " . $args{'struct'};
 
-    print "\n\n.. c:type:: " . $name . "\n\n";
+    if ($sphinx_major < 3) {
+	my $name = $args{'type'} . " " . $args{'struct'};
+	print "\n\n.. c:type:: " . $name . "\n\n";
+    } else {
+	my $name = $args{'struct'};
+	print "\n\n.. c:struct:: " . $name . "\n\n";
+    }
     print_lineno($declaration_start_line);
     $lineprefix = "   ";
     output_highlight_rst($args{'purpose'});
@@ -2235,6 +2289,7 @@ sub process_file($) {
 }
 
 
+$sphinx_major = get_sphinx_version();
 $kernelversion = get_kernel_version();
 
 # generate a sequence of code that will splice in highlighting information
-- 
2.26.2

