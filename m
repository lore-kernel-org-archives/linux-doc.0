Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 087CBC433FE
	for <linux-doc@archiver.kernel.org>; Fri,  4 Dec 2020 09:27:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4700225AB
	for <linux-doc@archiver.kernel.org>; Fri,  4 Dec 2020 09:27:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387430AbgLDJ1S (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Dec 2020 04:27:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:46226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbgLDJ1R (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 4 Dec 2020 04:27:17 -0500
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     "Jonathan Corbet" <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] scripts: get_feat.pl: make complete table more coincise
Date:   Fri,  4 Dec 2020 10:26:31 +0100
Message-Id: <7c82a766867f2813a1e5c7b982b5e952e50b6c5e.1607073967.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <2fe5f94aa8e12279d36cfbf489b30d4482a9bebb.1607073431.git.mchehab+huawei@kernel.org>
References: <2fe5f94aa8e12279d36cfbf489b30d4482a9bebb.1607073431.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently, there are too many white spaces at the tables,
and the information is very sparsed on it.

Make the format a lot more compact.

Suggested-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_feat.pl | 119 ++++++++++++++++++++++++++++++--------------
 1 file changed, 83 insertions(+), 36 deletions(-)

diff --git a/scripts/get_feat.pl b/scripts/get_feat.pl
index 81d1b78d65c9..2860abfdcd91 100755
--- a/scripts/get_feat.pl
+++ b/scripts/get_feat.pl
@@ -325,10 +325,10 @@ sub output_feature {
 # Output all features for all architectures
 #
 
-sub matrix_lines($$) {
-	my $partial = shift;
+sub matrix_lines($$$) {
+	my $desc_size = shift;
+	my $status_size = shift;
 	my $header = shift;
-	my $split;
 	my $fill;
 	my $ln_marker;
 
@@ -338,24 +338,14 @@ sub matrix_lines($$) {
 		$ln_marker = "-";
 	}
 
-	if ($partial) {
-		$split = "|";
-		$fill = " ";
-	} else {
-		$split = "+";
-		$fill = $ln_marker;
-	}
+	$fill = $ln_marker;
 
-	print $split;
+	print "+";
 	print $fill x $max_size_name;
-	print $split;
-	print $fill x $max_size_kconfig;
-	print $split;
-	print $fill x $max_size_description;
 	print "+";
-	print $ln_marker x $max_size_arch;
+	print $fill x $desc_size;
 	print "+";
-	print $ln_marker x $max_size_status;
+	print $ln_marker x $status_size;
 	print "+\n";
 }
 
@@ -366,6 +356,14 @@ sub output_matrix {
 	print "$title\n";
 	print "=" x length($title) . "\n\n";
 
+	my $desc_title = "$h_kconfig / $h_description";
+
+	my $desc_size = $max_size_kconfig + 4;
+	$desc_size = $max_size_description if ($max_size_description > $desc_size);
+	$desc_size = length($desc_title) if (length($desc_title) > $desc_size);
+
+	my $status_size = 60;
+
 	my $cur_subsys = "";
 	foreach my $name (sort {
 				($data{$a}->{subsys} cmp $data{$b}->{subsys}) or
@@ -383,36 +381,85 @@ sub output_matrix {
 			print "$title\n";
 			print "=" x length($title) . "\n\n";
 
-			matrix_lines(0, 0);
+
+			matrix_lines($desc_size, $status_size, 0);
+
 			printf "|%-${max_size_name}s", $h_name;
-			printf "|%-${max_size_kconfig}s", $h_kconfig;
-			printf "|%-${max_size_description}s", $h_description;
+			printf "|%-${desc_size}s", $desc_title;
 
-			printf "|%-${max_size_arch}s", $h_arch;
-			printf "|%-${max_size_status}s|\n", $h_status;
-
-			matrix_lines(0, 1);
+			printf "|%-${status_size}s|\n", "Status per architecture";
+			matrix_lines($desc_size, $status_size, 1);
 		}
 
 		my %arch_table = %{$data{$name}->{table}};
-		my $first = 1;
-		foreach my $arch (sort keys %arch_table) {
-			if ($first) {
+		my $cur_status = "";
+
+		my @lines;
+		my $line = "";
+		foreach my $arch (sort {
+					($arch_table{$a} cmp $arch_table{$b}) or
+					("\L$a" cmp "\L$b")
+				       } keys %arch_table) {
+
+			my $status = $arch_table{$arch};
+
+			if ($status eq "---") {
+				$status = "Not compatible";
+			}
+
+			if ($status ne $cur_status) {
+				if ($line ne "") {
+					push @lines, $line;
+					$line = "";
+				}
+				$line = "- **" . $status . "**: " . $arch;
+			} elsif (length($line) + length ($arch) + 2 < $status_size) {
+				$line .= ", " . $arch;
+			} else {
+				push @lines, $line;
+				$line = "  " . $arch;
+			}
+			$cur_status = $status;
+		}
+		push @lines, $line if ($line ne "");
+
+		my $ln = 0;
+		for my $line(@lines) {
+			if (!$ln) {
 				printf "|%-${max_size_name}s", $name;
-				printf "|%-${max_size_kconfig}s", $data{$name}->{kconfig};
-				printf "|%-${max_size_description}s", $data{$name}->{description};
-				$first = 0;
+				printf "|%-${desc_size}s", "``" . $data{$name}->{kconfig} . "``";
+			} elsif ($ln == 2) {
+				printf "|%-${max_size_name}s", "";
+				printf "|%-${desc_size}s", $data{$name}->{description};
 			} else {
-				matrix_lines(1, 0);
+				printf "|%-${max_size_name}s", "";
+				printf "|%-${desc_size}s", "";
+			}
+
+			printf "|%-${status_size}s|\n", $line;
 
+			$ln++;
+		}
+
+		# Ensure that Kconfig and description will be printed
+		while ($ln < 2) {
+			if (!$ln) {
+				printf "|%-${max_size_name}s", $name;
+				printf "|%-${desc_size}s``", $data{$name}->{kconfig} . "``";
+			} elsif ($ln == 2) {
 				printf "|%-${max_size_name}s", "";
-				printf "|%-${max_size_kconfig}s", "";
-				printf "|%-${max_size_description}s", "";
+				printf "|%-${desc_size}s", $data{$name}->{description};
+			} else {
+				printf "|%-${max_size_name}s", "";
+				printf "|%-${desc_size}s", "";
 			}
-			printf "|%-${max_size_arch}s", $arch;
-			printf "|%-${max_size_status}s|\n", $arch_table{$arch};
+
+			printf "|%-${status_size}s|\n", "";
+
+			$ln++;
 		}
-		matrix_lines(0, 0);
+
+		matrix_lines($desc_size, $status_size, 0);
 	}
 }
 
-- 
2.28.0

