Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AB47CF13
	for <linux-doc@vger.kernel.org>; Thu,  8 Feb 2024 16:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707409050; cv=none; b=kLQ1Ji9yfKTmpxMFv4K7/yRchmGVWxSMfGJOVFjfMyjvwOwyp5DBmEQXu0vshSIYqEcfR3t3IgYfadXGuuRQbQFzVvudDx7NYj1OmJpIzyieFeWmLT7jWeN1w7ooeuAqWMNqTLcl00nMLmpLmR7kFQkD890SBjDVKpmo+OtClO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707409050; c=relaxed/simple;
	bh=YxSqrywNxGIDSDl/rdIPvvyJ29a8JxrEvK/my9eiOkE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H3tNa71GPJqwk9fUjJTAmxR2PCn8bMnx1EWwNdjVhnsxmf5G+OosW37fr4uMsYFj1nSCz6NuSti6hOlze598EWIMStItPbaO5fMDK0Frn7sEx2msxUiXv1eXzYBhClxKvZjwZUKaGWPJ/RtJ31KCo4y4IuWPDxpGwG+Ktc/Yhck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=W3YinJkh; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="W3YinJkh"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 418F6jpQ022114;
	Thu, 8 Feb 2024 16:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-11-20; bh=feXSExjo1f+9DOzY4GhP4Q7zeqT8yKcdv6fLTjGbPUU=;
 b=W3YinJkhZgedx9mYl2pQ93WF1YF6La0e1PyQP9rKuUUftAUalwPYSmy2yADWXqeQpN+2
 jMs0i5aKyZvvC3wjAFTL/TndiL1SvJzTD5SJSgSVrlEq+SEyzM/v20DBsXOOKrGyRZXn
 CrVsznVGSgvfd4ZZC+muzKSWodj+TTb8C1p/Hmq2ZPzf2ShSANOhpIKX26C53iuJR0Dn
 zIfWoQZre9Pm7dH0XXRexa+FfRfmMRoZ7ZCcBYDg5dynEY22zCIlGKfbhMlDuxXj094+
 glP15Y54+H6z5TQSHJTXSp50L6ruMfH9NSNkB9DYtEoaGS9F8iN3kWP4eIcMY90jOnAD gg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w1bwew1h5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Feb 2024 16:17:22 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 418GFtbZ007073;
	Thu, 8 Feb 2024 16:17:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3w1bxb95tx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Feb 2024 16:17:20 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 418GH3X8020034;
	Thu, 8 Feb 2024 16:17:19 GMT
Received: from localhost.localdomain (dhcp-10-175-57-183.vpn.oracle.com [10.175.57.183])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3w1bxb95q5-1;
	Thu, 08 Feb 2024 16:17:19 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH docs-next] scripts/kernel-doc: reindent
Date: Thu,  8 Feb 2024 17:17:05 +0100
Message-Id: <20240208161705.888385-1-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_06,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402080084
X-Proofpoint-ORIG-GUID: jvEgOfysxb3q1XCemfFJW90gazYiY9iD
X-Proofpoint-GUID: jvEgOfysxb3q1XCemfFJW90gazYiY9iD

This file is using an ungodly mixture of 4 spaces, 2-wide tabs, 4-wide
tabs, _and_ 8-wide tabs, making it really hard to find good editor
settings for working with this file.

Bite the bullet and reindent it by hand. I tried using both perltidy
and vim, but neither of them were up to the task without changing too
much or getting confused about what they were supposed to be doing.

I did change a few instances of

    }
    else

into

    } else

(and same for elsif); the file is again written using both styles, and
I left functions which already seemed self-consistent alone.

You can verify that this commit only changes whitespace using e.g.:

    git diff --ignore-all-space --word-diff

or to see (only) the instances where newlines were added/removed:

    git diff --ignore-all-space

You can also see the delta from what perltidy would have wanted to
do to this file (when asked to only indent it), which isn't that much
in the end:

    perltidy -io -fnl scripts/kernel-doc
    git diff --no-index scripts/kernel-doc{,.tdy}

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
I know that reindenting whole files is frowned upon and I apologize
in advance, but having this file be so completely out of whack is
not helping anybody. FWIW, I am working on other patches that would
benefit from the reindent in the sense of being easier to review.

Of the currently active stable releases, I only see a handful of
patches to this file that have ever been backported to stable:

5.10
9fd7bdaffe0e stddef: Introduce struct_group() helper macro
9cee26031015 scripts: kernel-doc: fix parsing function-like typedefs
5c0aa48d046d scripts: kernel-doc: Restore anonymous enum parsing

5.15
1d9bd723e7b4 stddef: Introduce DECLARE_FLEX_ARRAY() helper
d57ab893cdf8 stddef: Introduce struct_group() helper macro

This should hopefully alleviate concerns about backporting troubles
due to this reindent. I also volunteer to help with anything that
needs to be backported across this patch.

 scripts/kernel-doc | 2522 ++++++++++++++++++++++----------------------
 1 file changed, 1258 insertions(+), 1264 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 014ef55351be..a9947080ead3 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -81,49 +81,51 @@ my $type_member_func = $type_member . '\(\)';
 
 # these are pretty rough
 my @highlights_man = (
-                      [$type_constant, "\$1"],
-                      [$type_constant2, "\$1"],
-                      [$type_func, "\\\\fB\$1\\\\fP"],
-                      [$type_enum, "\\\\fI\$1\\\\fP"],
-                      [$type_struct, "\\\\fI\$1\\\\fP"],
-                      [$type_typedef, "\\\\fI\$1\\\\fP"],
-                      [$type_union, "\\\\fI\$1\\\\fP"],
-                      [$type_param, "\\\\fI\$1\\\\fP"],
-                      [$type_param_ref, "\\\\fI\$1\$2\\\\fP"],
-                      [$type_member, "\\\\fI\$1\$2\$3\\\\fP"],
-                      [$type_fallback, "\\\\fI\$1\\\\fP"]
-		     );
+    [$type_constant, "\$1"],
+    [$type_constant2, "\$1"],
+    [$type_func, "\\\\fB\$1\\\\fP"],
+    [$type_enum, "\\\\fI\$1\\\\fP"],
+    [$type_struct, "\\\\fI\$1\\\\fP"],
+    [$type_typedef, "\\\\fI\$1\\\\fP"],
+    [$type_union, "\\\\fI\$1\\\\fP"],
+    [$type_param, "\\\\fI\$1\\\\fP"],
+    [$type_param_ref, "\\\\fI\$1\$2\\\\fP"],
+    [$type_member, "\\\\fI\$1\$2\$3\\\\fP"],
+    [$type_fallback, "\\\\fI\$1\\\\fP"]
+  );
 my $blankline_man = "";
 
 # rst-mode
 my @highlights_rst = (
-                       [$type_constant, "``\$1``"],
-                       [$type_constant2, "``\$1``"],
-                       # Note: need to escape () to avoid func matching later
-                       [$type_member_func, "\\:c\\:type\\:`\$1\$2\$3\\\\(\\\\) <\$1>`"],
-                       [$type_member, "\\:c\\:type\\:`\$1\$2\$3 <\$1>`"],
-		       [$type_fp_param, "**\$1\\\\(\\\\)**"],
-		       [$type_fp_param2, "**\$1\\\\(\\\\)**"],
-                       [$type_func, "\$1()"],
-                       [$type_enum, "\\:c\\:type\\:`\$1 <\$2>`"],
-                       [$type_struct, "\\:c\\:type\\:`\$1 <\$2>`"],
-                       [$type_typedef, "\\:c\\:type\\:`\$1 <\$2>`"],
-                       [$type_union, "\\:c\\:type\\:`\$1 <\$2>`"],
-                       # in rst this can refer to any type
-                       [$type_fallback, "\\:c\\:type\\:`\$1`"],
-                       [$type_param_ref, "**\$1\$2**"]
-		      );
+    [$type_constant, "``\$1``"],
+    [$type_constant2, "``\$1``"],
+
+    # Note: need to escape () to avoid func matching later
+    [$type_member_func, "\\:c\\:type\\:`\$1\$2\$3\\\\(\\\\) <\$1>`"],
+    [$type_member, "\\:c\\:type\\:`\$1\$2\$3 <\$1>`"],
+    [$type_fp_param, "**\$1\\\\(\\\\)**"],
+    [$type_fp_param2, "**\$1\\\\(\\\\)**"],
+    [$type_func, "\$1()"],
+    [$type_enum, "\\:c\\:type\\:`\$1 <\$2>`"],
+    [$type_struct, "\\:c\\:type\\:`\$1 <\$2>`"],
+    [$type_typedef, "\\:c\\:type\\:`\$1 <\$2>`"],
+    [$type_union, "\\:c\\:type\\:`\$1 <\$2>`"],
+
+    # in rst this can refer to any type
+    [$type_fallback, "\\:c\\:type\\:`\$1`"],
+    [$type_param_ref, "**\$1\$2**"]
+  );
 my $blankline_rst = "\n";
 
 # read arguments
 if ($#ARGV == -1) {
-	pod2usage(
-		-message => "No arguments!\n",
-		-exitval => 1,
-		-verbose => 99,
-		-sections => 'SYNOPSIS',
-		-output => \*STDERR,
-	);
+    pod2usage(
+        -message => "No arguments!\n",
+        -exitval => 1,
+        -verbose => 99,
+        -sections => 'SYNOPSIS',
+        -output => \*STDERR,
+      );
 }
 
 my $kernelversion;
@@ -164,9 +166,9 @@ if (defined($ENV{'KBUILD_BUILD_TIMESTAMP'}) &&
 }
 
 my $man_date = ('January', 'February', 'March', 'April', 'May', 'June',
-		'July', 'August', 'September', 'October',
-		'November', 'December')[$build_time[4]] .
-  " " . ($build_time[5]+1900);
+                'July', 'August', 'September', 'October',
+                'November', 'December')[$build_time[4]] .
+    " " . ($build_time[5]+1900);
 
 # Essentially these are globals.
 # They probably want to be tidied up, made more localised or something.
@@ -179,22 +181,22 @@ my ($type, $declaration_name, $return_type);
 my ($newsection, $newcontents, $prototype, $brcount, %source_map);
 
 if (defined($ENV{'KBUILD_VERBOSE'}) && $ENV{'KBUILD_VERBOSE'} =~ '1') {
-	$verbose = 1;
+    $verbose = 1;
 }
 
 if (defined($ENV{'KCFLAGS'})) {
-	my $kcflags = "$ENV{'KCFLAGS'}";
+    my $kcflags = "$ENV{'KCFLAGS'}";
 
-	if ($kcflags =~ /(\s|^)-Werror(\s|$)/) {
-		$Werror = 1;
-	}
+    if ($kcflags =~ /(\s|^)-Werror(\s|$)/) {
+        $Werror = 1;
+    }
 }
 
 # reading this variable is for backwards compat just in case
 # someone was calling it with the variable from outside the
 # kernel's build system
 if (defined($ENV{'KDOC_WERROR'})) {
-	$Werror = "$ENV{'KDOC_WERROR'}";
+    $Werror = "$ENV{'KDOC_WERROR'}";
 }
 # other environment variables are converted to command-line
 # arguments in cmd_checkdoc in the build system
@@ -295,90 +297,90 @@ while ($ARGV[0] =~ m/^--?(.*)/) {
     my $cmd = $1;
     shift @ARGV;
     if ($cmd eq "man") {
-	$output_mode = "man";
-	@highlights = @highlights_man;
-	$blankline = $blankline_man;
+        $output_mode = "man";
+        @highlights = @highlights_man;
+        $blankline = $blankline_man;
     } elsif ($cmd eq "rst") {
-	$output_mode = "rst";
-	@highlights = @highlights_rst;
-	$blankline = $blankline_rst;
+        $output_mode = "rst";
+        @highlights = @highlights_rst;
+        $blankline = $blankline_rst;
     } elsif ($cmd eq "none") {
-	$output_mode = "none";
+        $output_mode = "none";
     } elsif ($cmd eq "module") { # not needed for XML, inherits from calling document
-	$modulename = shift @ARGV;
+        $modulename = shift @ARGV;
     } elsif ($cmd eq "function") { # to only output specific functions
-	$output_selection = OUTPUT_INCLUDE;
-	$function = shift @ARGV;
-	$function_table{$function} = 1;
+        $output_selection = OUTPUT_INCLUDE;
+        $function = shift @ARGV;
+        $function_table{$function} = 1;
     } elsif ($cmd eq "nosymbol") { # Exclude specific symbols
-	my $symbol = shift @ARGV;
-	$nosymbol_table{$symbol} = 1;
+        my $symbol = shift @ARGV;
+        $nosymbol_table{$symbol} = 1;
     } elsif ($cmd eq "export") { # only exported symbols
-	$output_selection = OUTPUT_EXPORTED;
-	%function_table = ();
+        $output_selection = OUTPUT_EXPORTED;
+        %function_table = ();
     } elsif ($cmd eq "internal") { # only non-exported symbols
-	$output_selection = OUTPUT_INTERNAL;
-	%function_table = ();
+        $output_selection = OUTPUT_INTERNAL;
+        %function_table = ();
     } elsif ($cmd eq "export-file") {
-	my $file = shift @ARGV;
-	push(@export_file_list, $file);
+        my $file = shift @ARGV;
+        push(@export_file_list, $file);
     } elsif ($cmd eq "v") {
-	$verbose = 1;
+        $verbose = 1;
     } elsif ($cmd eq "Werror") {
-	$Werror = 1;
+        $Werror = 1;
     } elsif ($cmd eq "Wreturn") {
-	$Wreturn = 1;
+        $Wreturn = 1;
     } elsif ($cmd eq "Wshort-desc" or $cmd eq "Wshort-description") {
-	$Wshort_desc = 1;
+        $Wshort_desc = 1;
     } elsif ($cmd eq "Wcontents-before-sections") {
-	$Wcontents_before_sections = 1;
+        $Wcontents_before_sections = 1;
     } elsif ($cmd eq "Wall") {
         $Wreturn = 1;
         $Wshort_desc = 1;
         $Wcontents_before_sections = 1;
     } elsif (($cmd eq "h") || ($cmd eq "help")) {
-		pod2usage(-exitval => 0, -verbose => 2);
+        pod2usage(-exitval => 0, -verbose => 2);
     } elsif ($cmd eq 'no-doc-sections') {
-	    $no_doc_sections = 1;
+        $no_doc_sections = 1;
     } elsif ($cmd eq 'enable-lineno') {
-	    $enable_lineno = 1;
+        $enable_lineno = 1;
     } elsif ($cmd eq 'show-not-found') {
-	$show_not_found = 1;  # A no-op but don't fail
+        $show_not_found = 1;  # A no-op but don't fail
     } elsif ($cmd eq "sphinx-version") {
-	my $ver_string = shift @ARGV;
-	if ($ver_string =~ m/^(\d+)(\.\d+)?(\.\d+)?/) {
-	    $sphinx_major = $1;
-	    if (defined($2)) {
-		$sphinx_minor = substr($2,1);
-	    } else {
-		$sphinx_minor = 0;
-	    }
-	    if (defined($3)) {
-		$sphinx_patch = substr($3,1)
-	    } else {
-		$sphinx_patch = 0;
-	    }
-	} else {
-	    die "Sphinx version should either major.minor or major.minor.patch format\n";
-	}
+        my $ver_string = shift @ARGV;
+        if ($ver_string =~ m/^(\d+)(\.\d+)?(\.\d+)?/) {
+            $sphinx_major = $1;
+            if (defined($2)) {
+                $sphinx_minor = substr($2,1);
+            } else {
+                $sphinx_minor = 0;
+            }
+            if (defined($3)) {
+                $sphinx_patch = substr($3,1)
+            } else {
+                $sphinx_patch = 0;
+            }
+        } else {
+            die "Sphinx version should either major.minor or major.minor.patch format\n";
+        }
     } else {
-	# Unknown argument
-	pod2usage(
-	    -message => "Argument unknown!\n",
-	    -exitval => 1,
-	    -verbose => 99,
-	    -sections => 'SYNOPSIS',
-	    -output => \*STDERR,
-	    );
+        # Unknown argument
+        pod2usage(
+            -message => "Argument unknown!\n",
+            -exitval => 1,
+            -verbose => 99,
+            -sections => 'SYNOPSIS',
+            -output => \*STDERR,
+            );
     }
     if ($#ARGV < 0){
-	pod2usage(
-	    -message => "FILE argument missing\n",
-	    -exitval => 1,
-	    -verbose => 99,
-	    -sections => 'SYNOPSIS',
-	    -output => \*STDERR,
-	    );
+        pod2usage(
+            -message => "FILE argument missing\n",
+            -exitval => 1,
+            -verbose => 99,
+            -sections => 'SYNOPSIS',
+            -output => \*STDERR,
+            );
     }
 }
 
@@ -388,45 +390,45 @@ while ($ARGV[0] =~ m/^--?(.*)/) {
 # version in order to produce the right tags.
 sub findprog($)
 {
-	foreach(split(/:/, $ENV{PATH})) {
-		return "$_/$_[0]" if(-x "$_/$_[0]");
-	}
+    foreach(split(/:/, $ENV{PATH})) {
+        return "$_/$_[0]" if(-x "$_/$_[0]");
+    }
 }
 
 sub get_sphinx_version()
 {
-	my $ver;
-
-	my $cmd = "sphinx-build";
-	if (!findprog($cmd)) {
-		my $cmd = "sphinx-build3";
-		if (!findprog($cmd)) {
-			$sphinx_major = 1;
-			$sphinx_minor = 2;
-			$sphinx_patch = 0;
-			printf STDERR "Warning: Sphinx version not found. Using default (Sphinx version %d.%d.%d)\n",
-			       $sphinx_major, $sphinx_minor, $sphinx_patch;
-			return;
-		}
-	}
-
-	open IN, "$cmd --version 2>&1 |";
-	while (<IN>) {
-		if (m/^\s*sphinx-build\s+([\d]+)\.([\d\.]+)(\+\/[\da-f]+)?$/) {
-			$sphinx_major = $1;
-			$sphinx_minor = $2;
-			$sphinx_patch = $3;
-			last;
-		}
-		# Sphinx 1.2.x uses a different format
-		if (m/^\s*Sphinx.*\s+([\d]+)\.([\d\.]+)$/) {
-			$sphinx_major = $1;
-			$sphinx_minor = $2;
-			$sphinx_patch = $3;
-			last;
-		}
-	}
-	close IN;
+    my $ver;
+
+    my $cmd = "sphinx-build";
+    if (!findprog($cmd)) {
+        my $cmd = "sphinx-build3";
+        if (!findprog($cmd)) {
+            $sphinx_major = 1;
+            $sphinx_minor = 2;
+            $sphinx_patch = 0;
+            printf STDERR "Warning: Sphinx version not found. Using default (Sphinx version %d.%d.%d)\n",
+                   $sphinx_major, $sphinx_minor, $sphinx_patch;
+            return;
+        }
+    }
+
+    open IN, "$cmd --version 2>&1 |";
+    while (<IN>) {
+        if (m/^\s*sphinx-build\s+([\d]+)\.([\d\.]+)(\+\/[\da-f]+)?$/) {
+            $sphinx_major = $1;
+            $sphinx_minor = $2;
+            $sphinx_patch = $3;
+            last;
+        }
+        # Sphinx 1.2.x uses a different format
+        if (m/^\s*Sphinx.*\s+([\d]+)\.([\d\.]+)$/) {
+            $sphinx_major = $1;
+            $sphinx_minor = $2;
+            $sphinx_patch = $3;
+            last;
+        }
+    }
+    close IN;
 }
 
 # get kernel version from env
@@ -434,7 +436,7 @@ sub get_kernel_version() {
     my $version = 'unknown kernel version';
 
     if (defined($ENV{'KERNELVERSION'})) {
-	$version = $ENV{'KERNELVERSION'};
+        $version = $ENV{'KERNELVERSION'};
     }
     return $version;
 }
@@ -462,30 +464,30 @@ sub dump_section {
     my $contents = join "\n", @_;
 
     if ($name =~ m/$type_param/) {
-	$name = $1;
-	$parameterdescs{$name} = $contents;
-	$sectcheck = $sectcheck . $name . " ";
+        $name = $1;
+        $parameterdescs{$name} = $contents;
+        $sectcheck = $sectcheck . $name . " ";
         $parameterdesc_start_lines{$name} = $new_start_line;
         $new_start_line = 0;
     } elsif ($name eq "@\.\.\.") {
-	$name = "...";
-	$parameterdescs{$name} = $contents;
-	$sectcheck = $sectcheck . $name . " ";
+        $name = "...";
+        $parameterdescs{$name} = $contents;
+        $sectcheck = $sectcheck . $name . " ";
         $parameterdesc_start_lines{$name} = $new_start_line;
         $new_start_line = 0;
     } else {
-	if (defined($sections{$name}) && ($sections{$name} ne "")) {
-	    # Only warn on user specified duplicate section names.
-	    if ($name ne $section_default) {
-		emit_warning("${file}:$.", "duplicate section name '$name'\n");
-	    }
-	    $sections{$name} .= $contents;
-	} else {
-	    $sections{$name} = $contents;
-	    push @sectionlist, $name;
+        if (defined($sections{$name}) && ($sections{$name} ne "")) {
+            # Only warn on user specified duplicate section names.
+            if ($name ne $section_default) {
+                emit_warning("${file}:$.", "duplicate section name '$name'\n");
+            }
+            $sections{$name} .= $contents;
+        } else {
+            $sections{$name} = $contents;
+            push @sectionlist, $name;
             $section_start_lines{$name} = $new_start_line;
             $new_start_line = 0;
-	}
+        }
     }
 }
 
@@ -504,14 +506,14 @@ sub dump_doc_section {
     return if (defined($nosymbol_table{$name}));
 
     if (($output_selection == OUTPUT_ALL) ||
-	(($output_selection == OUTPUT_INCLUDE) &&
-	 defined($function_table{$name})))
+        (($output_selection == OUTPUT_INCLUDE) &&
+         defined($function_table{$name})))
     {
-	dump_section($file, $name, $contents);
-	output_blockhead({'sectionlist' => \@sectionlist,
-			  'sections' => \%sections,
-			  'module' => $modulename,
-			  'content-only' => ($output_selection != OUTPUT_ALL), });
+        dump_section($file, $name, $contents);
+        output_blockhead({'sectionlist' => \@sectionlist,
+                          'sections' => \%sections,
+                          'module' => $modulename,
+                          'content-only' => ($output_selection != OUTPUT_ALL), });
     }
 }
 
@@ -542,21 +544,21 @@ sub output_highlight {
 #   print STDERR "contents af:$contents\n";
 
     foreach $line (split "\n", $contents) {
-	if (! $output_preformatted) {
-	    $line =~ s/^\s*//;
-	}
-	if ($line eq ""){
-	    if (! $output_preformatted) {
-		print $lineprefix, $blankline;
-	    }
-	} else {
-	    if ($output_mode eq "man" && substr($line, 0, 1) eq ".") {
-		print "\\&$line";
-	    } else {
-		print $lineprefix, $line;
-	    }
-	}
-	print "\n";
+        if (! $output_preformatted) {
+            $line =~ s/^\s*//;
+        }
+        if ($line eq ""){
+            if (! $output_preformatted) {
+                print $lineprefix, $blankline;
+            }
+        } else {
+            if ($output_mode eq "man" && substr($line, 0, 1) eq ".") {
+                print "\\&$line";
+            } else {
+                print $lineprefix, $line;
+            }
+        }
+        print "\n";
     }
 }
 
@@ -574,40 +576,40 @@ sub output_function_man(%) {
 
     print ".SH SYNOPSIS\n";
     if ($args{'functiontype'} ne "") {
-	print ".B \"" . $args{'functiontype'} . "\" " . $args{'function'} . "\n";
+        print ".B \"" . $args{'functiontype'} . "\" " . $args{'function'} . "\n";
     } else {
-	print ".B \"" . $args{'function'} . "\n";
+        print ".B \"" . $args{'function'} . "\n";
     }
     $count = 0;
     my $parenth = "(";
     my $post = ",";
     foreach my $parameter (@{$args{'parameterlist'}}) {
-	if ($count == $#{$args{'parameterlist'}}) {
-	    $post = ");";
-	}
-	$type = $args{'parametertypes'}{$parameter};
-	if ($type =~ m/$function_pointer/) {
-	    # pointer-to-function
-	    print ".BI \"" . $parenth . $1 . "\" " . " \") (" . $2 . ")" . $post . "\"\n";
-	} else {
-	    $type =~ s/([^\*])$/$1 /;
-	    print ".BI \"" . $parenth . $type . "\" " . " \"" . $post . "\"\n";
-	}
-	$count++;
-	$parenth = "";
+        if ($count == $#{$args{'parameterlist'}}) {
+            $post = ");";
+        }
+        $type = $args{'parametertypes'}{$parameter};
+        if ($type =~ m/$function_pointer/) {
+            # pointer-to-function
+            print ".BI \"" . $parenth . $1 . "\" " . " \") (" . $2 . ")" . $post . "\"\n";
+        } else {
+            $type =~ s/([^\*])$/$1 /;
+            print ".BI \"" . $parenth . $type . "\" " . " \"" . $post . "\"\n";
+        }
+        $count++;
+        $parenth = "";
     }
 
     print ".SH ARGUMENTS\n";
     foreach $parameter (@{$args{'parameterlist'}}) {
-	my $parameter_name = $parameter;
-	$parameter_name =~ s/\[.*//;
+        my $parameter_name = $parameter;
+        $parameter_name =~ s/\[.*//;
 
-	print ".IP \"" . $parameter . "\" 12\n";
-	output_highlight($args{'parameterdescs'}{$parameter_name});
+        print ".IP \"" . $parameter . "\" 12\n";
+        output_highlight($args{'parameterdescs'}{$parameter_name});
     }
     foreach $section (@{$args{'sectionlist'}}) {
-	print ".SH \"", uc $section, "\"\n";
-	output_highlight($args{'sections'}{$section});
+        print ".SH \"", uc $section, "\"\n";
+        output_highlight($args{'sections'}{$section});
     }
 }
 
@@ -627,28 +629,27 @@ sub output_enum_man(%) {
     print "enum " . $args{'enum'} . " {\n";
     $count = 0;
     foreach my $parameter (@{$args{'parameterlist'}}) {
-	print ".br\n.BI \"    $parameter\"\n";
-	if ($count == $#{$args{'parameterlist'}}) {
-	    print "\n};\n";
-	    last;
-	}
-	else {
-	    print ", \n.br\n";
-	}
-	$count++;
+        print ".br\n.BI \"    $parameter\"\n";
+        if ($count == $#{$args{'parameterlist'}}) {
+            print "\n};\n";
+            last;
+        } else {
+            print ", \n.br\n";
+        }
+        $count++;
     }
 
     print ".SH Constants\n";
     foreach $parameter (@{$args{'parameterlist'}}) {
-	my $parameter_name = $parameter;
-	$parameter_name =~ s/\[.*//;
+        my $parameter_name = $parameter;
+        $parameter_name =~ s/\[.*//;
 
-	print ".IP \"" . $parameter . "\" 12\n";
-	output_highlight($args{'parameterdescs'}{$parameter_name});
+        print ".IP \"" . $parameter . "\" 12\n";
+        output_highlight($args{'parameterdescs'}{$parameter_name});
     }
     foreach $section (@{$args{'sectionlist'}}) {
-	print ".SH \"$section\"\n";
-	output_highlight($args{'sections'}{$section});
+        print ".SH \"$section\"\n";
+        output_highlight($args{'sections'}{$section});
     }
 }
 
@@ -672,18 +673,18 @@ sub output_struct_man(%) {
 
     print ".SH Members\n";
     foreach $parameter (@{$args{'parameterlist'}}) {
-	($parameter =~ /^#/) && next;
+        ($parameter =~ /^#/) && next;
 
-	my $parameter_name = $parameter;
-	$parameter_name =~ s/\[.*//;
+        my $parameter_name = $parameter;
+        $parameter_name =~ s/\[.*//;
 
-	($args{'parameterdescs'}{$parameter_name} ne $undescribed) || next;
-	print ".IP \"" . $parameter . "\" 12\n";
-	output_highlight($args{'parameterdescs'}{$parameter_name});
+        ($args{'parameterdescs'}{$parameter_name} ne $undescribed) || next;
+        print ".IP \"" . $parameter . "\" 12\n";
+        output_highlight($args{'parameterdescs'}{$parameter_name});
     }
     foreach $section (@{$args{'sectionlist'}}) {
-	print ".SH \"$section\"\n";
-	output_highlight($args{'sections'}{$section});
+        print ".SH \"$section\"\n";
+        output_highlight($args{'sections'}{$section});
     }
 }
 
@@ -699,8 +700,8 @@ sub output_typedef_man(%) {
     print "typedef " . $args{'typedef'} . " \\- " . $args{'purpose'} . "\n";
 
     foreach $section (@{$args{'sectionlist'}}) {
-	print ".SH \"$section\"\n";
-	output_highlight($args{'sections'}{$section});
+        print ".SH \"$section\"\n";
+        output_highlight($args{'sections'}{$section});
     }
 }
 
@@ -712,8 +713,8 @@ sub output_blockhead_man(%) {
     print ".TH \"$args{'module'}\" 9 \"$args{'module'}\" \"$man_date\" \"API Manual\" LINUX\n";
 
     foreach $section (@{$args{'sectionlist'}}) {
-	print ".SH \"$section\"\n";
-	output_highlight($args{'sections'}{$section});
+        print ".SH \"$section\"\n";
+        output_highlight($args{'sections'}{$section});
     }
 }
 
@@ -731,15 +732,15 @@ sub output_blockhead_rst(%) {
     my ($parameter, $section);
 
     foreach $section (@{$args{'sectionlist'}}) {
-	next if (defined($nosymbol_table{$section}));
+        next if (defined($nosymbol_table{$section}));
 
-	if ($output_selection != OUTPUT_INCLUDE) {
-	    print ".. _$section:\n\n";
-	    print "**$section**\n\n";
-	}
+        if ($output_selection != OUTPUT_INCLUDE) {
+            print ".. _$section:\n\n";
+            print "**$section**\n\n";
+        }
         print_lineno($section_start_lines{$section});
-	output_highlight_rst($args{'sections'}{$section});
-	print "\n";
+        output_highlight_rst($args{'sections'}{$section});
+        print "\n";
     }
 }
 
@@ -769,48 +770,48 @@ sub output_highlight_rst {
     my $block = "";
 
     foreach $line (split "\n",$input) {
-	#
-	# If we're in a literal block, see if we should drop out
-	# of it.  Otherwise pass the line straight through unmunged.
-	#
-	if ($in_literal) {
-	    if (! ($line =~ /^\s*$/)) {
-		#
-		# If this is the first non-blank line in a literal
-		# block we need to figure out what the proper indent is.
-		#
-		if ($litprefix eq "") {
-		    $line =~ /^(\s*)/;
-		    $litprefix = '^' . $1;
-		    $output .= $line . "\n";
-		} elsif (! ($line =~ /$litprefix/)) {
-		    $in_literal = 0;
-		} else {
-		    $output .= $line . "\n";
-		}
-	    } else {
-		$output .= $line . "\n";
-	    }
-	}
-	#
-	# Not in a literal block (or just dropped out)
-	#
-	if (! $in_literal) {
-	    $block .= $line . "\n";
-	    if (($line =~ /$sphinx_literal/) || ($line =~ /$sphinx_cblock/)) {
-		$in_literal = 1;
-		$litprefix = "";
-		$output .= highlight_block($block);
-		$block = ""
-	    }
-	}
+        #
+        # If we're in a literal block, see if we should drop out
+        # of it.  Otherwise pass the line straight through unmunged.
+        #
+        if ($in_literal) {
+            if (! ($line =~ /^\s*$/)) {
+                #
+                # If this is the first non-blank line in a literal
+                # block we need to figure out what the proper indent is.
+                #
+                if ($litprefix eq "") {
+                    $line =~ /^(\s*)/;
+                    $litprefix = '^' . $1;
+                    $output .= $line . "\n";
+                } elsif (! ($line =~ /$litprefix/)) {
+                    $in_literal = 0;
+                } else {
+                    $output .= $line . "\n";
+                }
+            } else {
+                $output .= $line . "\n";
+            }
+        }
+        #
+        # Not in a literal block (or just dropped out)
+        #
+        if (! $in_literal) {
+            $block .= $line . "\n";
+            if (($line =~ /$sphinx_literal/) || ($line =~ /$sphinx_cblock/)) {
+                $in_literal = 1;
+                $litprefix = "";
+                $output .= highlight_block($block);
+                $block = ""
+            }
+        }
     }
 
     if ($block) {
-	$output .= highlight_block($block);
+        $output .= highlight_block($block);
     }
     foreach $line (split "\n", $output) {
-	print $lineprefix . $line . "\n";
+        print $lineprefix . $line . "\n";
     }
 }
 
@@ -822,67 +823,67 @@ sub output_function_rst(%) {
     my $is_macro = 0;
 
     if ($sphinx_major < 3) {
-	if ($args{'typedef'}) {
-	    print ".. c:type:: ". $args{'function'} . "\n\n";
-	    print_lineno($declaration_start_line);
-	    print "   **Typedef**: ";
-	    $lineprefix = "";
-	    output_highlight_rst($args{'purpose'});
-	    $start = "\n\n**Syntax**\n\n  ``";
-	    $is_macro = 1;
-	} else {
-	    print ".. c:function:: ";
-	}
+        if ($args{'typedef'}) {
+            print ".. c:type:: ". $args{'function'} . "\n\n";
+            print_lineno($declaration_start_line);
+            print "   **Typedef**: ";
+            $lineprefix = "";
+            output_highlight_rst($args{'purpose'});
+            $start = "\n\n**Syntax**\n\n  ``";
+            $is_macro = 1;
+        } else {
+            print ".. c:function:: ";
+        }
     } else {
-	if ($args{'typedef'} || $args{'functiontype'} eq "") {
-	    $is_macro = 1;
-	    print ".. c:macro:: ". $args{'function'} . "\n\n";
-	} else {
-	    print ".. c:function:: ";
-	}
-
-	if ($args{'typedef'}) {
-	    print_lineno($declaration_start_line);
-	    print "   **Typedef**: ";
-	    $lineprefix = "";
-	    output_highlight_rst($args{'purpose'});
-	    $start = "\n\n**Syntax**\n\n  ``";
-	} else {
-	    print "``" if ($is_macro);
-	}
+        if ($args{'typedef'} || $args{'functiontype'} eq "") {
+            $is_macro = 1;
+            print ".. c:macro:: ". $args{'function'} . "\n\n";
+        } else {
+            print ".. c:function:: ";
+        }
+
+        if ($args{'typedef'}) {
+            print_lineno($declaration_start_line);
+            print "   **Typedef**: ";
+            $lineprefix = "";
+            output_highlight_rst($args{'purpose'});
+            $start = "\n\n**Syntax**\n\n  ``";
+        } else {
+            print "``" if ($is_macro);
+        }
     }
     if ($args{'functiontype'} ne "") {
-	$start .= $args{'functiontype'} . " " . $args{'function'} . " (";
+        $start .= $args{'functiontype'} . " " . $args{'function'} . " (";
     } else {
-	$start .= $args{'function'} . " (";
+        $start .= $args{'function'} . " (";
     }
     print $start;
 
     my $count = 0;
     foreach my $parameter (@{$args{'parameterlist'}}) {
-	if ($count ne 0) {
-	    print ", ";
-	}
-	$count++;
-	$type = $args{'parametertypes'}{$parameter};
-
-	if ($type =~ m/$function_pointer/) {
-	    # pointer-to-function
-	    print $1 . $parameter . ") (" . $2 . ")";
-	} else {
-	    print $type;
-	}
+        if ($count ne 0) {
+            print ", ";
+        }
+        $count++;
+        $type = $args{'parametertypes'}{$parameter};
+
+        if ($type =~ m/$function_pointer/) {
+            # pointer-to-function
+            print $1 . $parameter . ") (" . $2 . ")";
+        } else {
+            print $type;
+        }
     }
     if ($is_macro) {
-	print ")``\n\n";
+        print ")``\n\n";
     } else {
-	print ")\n\n";
+        print ")\n\n";
     }
     if (!$args{'typedef'}) {
-	print_lineno($declaration_start_line);
-	$lineprefix = "   ";
-	output_highlight_rst($args{'purpose'});
-	print "\n";
+        print_lineno($declaration_start_line);
+        $lineprefix = "   ";
+        output_highlight_rst($args{'purpose'});
+        print "\n";
     }
 
     #
@@ -893,27 +894,27 @@ sub output_function_rst(%) {
     $lineprefix = "  ";
     print $lineprefix . "**Parameters**\n\n";
     foreach $parameter (@{$args{'parameterlist'}}) {
-	my $parameter_name = $parameter;
-	$parameter_name =~ s/\[.*//;
-	$type = $args{'parametertypes'}{$parameter};
-
-	if ($type ne "") {
-	    print $lineprefix . "``$type``\n";
-	} else {
-	    print $lineprefix . "``$parameter``\n";
-	}
+        my $parameter_name = $parameter;
+        $parameter_name =~ s/\[.*//;
+        $type = $args{'parametertypes'}{$parameter};
+
+        if ($type ne "") {
+            print $lineprefix . "``$type``\n";
+        } else {
+            print $lineprefix . "``$parameter``\n";
+        }
 
         print_lineno($parameterdesc_start_lines{$parameter_name});
 
-	$lineprefix = "    ";
-	if (defined($args{'parameterdescs'}{$parameter_name}) &&
-	    $args{'parameterdescs'}{$parameter_name} ne $undescribed) {
-	    output_highlight_rst($args{'parameterdescs'}{$parameter_name});
-	} else {
-	    print $lineprefix . "*undescribed*\n";
-	}
-	$lineprefix = "  ";
-	print "\n";
+        $lineprefix = "    ";
+        if (defined($args{'parameterdescs'}{$parameter_name}) &&
+            $args{'parameterdescs'}{$parameter_name} ne $undescribed) {
+            output_highlight_rst($args{'parameterdescs'}{$parameter_name});
+        } else {
+            print $lineprefix . "*undescribed*\n";
+        }
+        $lineprefix = "  ";
+        print "\n";
     }
 
     output_section_rst(@_);
@@ -926,10 +927,10 @@ sub output_section_rst(%) {
     my $oldprefix = $lineprefix;
 
     foreach $section (@{$args{'sectionlist'}}) {
-	print $lineprefix . "**$section**\n\n";
+        print $lineprefix . "**$section**\n\n";
         print_lineno($section_start_lines{$section});
-	output_highlight_rst($args{'sections'}{$section});
-	print "\n";
+        output_highlight_rst($args{'sections'}{$section});
+        print "\n";
     }
     print "\n";
 }
@@ -942,11 +943,11 @@ sub output_enum_rst(%) {
     my $outer;
 
     if ($sphinx_major < 3) {
-	my $name = "enum " . $args{'enum'};
-	print "\n\n.. c:type:: " . $name . "\n\n";
+        my $name = "enum " . $args{'enum'};
+        print "\n\n.. c:type:: " . $name . "\n\n";
     } else {
-	my $name = $args{'enum'};
-	print "\n\n.. c:enum:: " . $name . "\n\n";
+        my $name = $args{'enum'};
+        print "\n\n.. c:enum:: " . $name . "\n\n";
     }
     print_lineno($declaration_start_line);
     $lineprefix = "  ";
@@ -958,14 +959,14 @@ sub output_enum_rst(%) {
     $lineprefix = $outer . "  ";
     print $outer . "**Constants**\n\n";
     foreach $parameter (@{$args{'parameterlist'}}) {
-	print $outer . "``$parameter``\n";
+        print $outer . "``$parameter``\n";
 
-	if ($args{'parameterdescs'}{$parameter} ne $undescribed) {
-	    output_highlight_rst($args{'parameterdescs'}{$parameter});
-	} else {
-	    print $lineprefix . "*undescribed*\n";
-	}
-	print "\n";
+        if ($args{'parameterdescs'}{$parameter} ne $undescribed) {
+            output_highlight_rst($args{'parameterdescs'}{$parameter});
+        } else {
+            print $lineprefix . "*undescribed*\n";
+        }
+        print "\n";
     }
     print "\n";
     $lineprefix = $oldprefix;
@@ -979,9 +980,9 @@ sub output_typedef_rst(%) {
     my $name;
 
     if ($sphinx_major < 3) {
-	$name = "typedef " . $args{'typedef'};
+        $name = "typedef " . $args{'typedef'};
     } else {
-	$name = $args{'typedef'};
+        $name = $args{'typedef'};
     }
     print "\n\n.. c:type:: " . $name . "\n\n";
     print_lineno($declaration_start_line);
@@ -999,15 +1000,15 @@ sub output_struct_rst(%) {
     my $oldprefix = $lineprefix;
 
     if ($sphinx_major < 3) {
-	my $name = $args{'type'} . " " . $args{'struct'};
-	print "\n\n.. c:type:: " . $name . "\n\n";
+        my $name = $args{'type'} . " " . $args{'struct'};
+        print "\n\n.. c:type:: " . $name . "\n\n";
     } else {
-	my $name = $args{'struct'};
-	if ($args{'type'} eq 'union') {
-	    print "\n\n.. c:union:: " . $name . "\n\n";
-	} else {
-	    print "\n\n.. c:struct:: " . $name . "\n\n";
-	}
+        my $name = $args{'struct'};
+        if ($args{'type'} eq 'union') {
+            print "\n\n.. c:union:: " . $name . "\n\n";
+        } else {
+            print "\n\n.. c:struct:: " . $name . "\n\n";
+        }
     }
     print_lineno($declaration_start_line);
     $lineprefix = "  ";
@@ -1024,19 +1025,19 @@ sub output_struct_rst(%) {
     $lineprefix = "  ";
     print $lineprefix . "**Members**\n\n";
     foreach $parameter (@{$args{'parameterlist'}}) {
-	($parameter =~ /^#/) && next;
+        ($parameter =~ /^#/) && next;
 
-	my $parameter_name = $parameter;
-	$parameter_name =~ s/\[.*//;
+        my $parameter_name = $parameter;
+        $parameter_name =~ s/\[.*//;
 
-	($args{'parameterdescs'}{$parameter_name} ne $undescribed) || next;
-	$type = $args{'parametertypes'}{$parameter};
+        ($args{'parameterdescs'}{$parameter_name} ne $undescribed) || next;
+        $type = $args{'parametertypes'}{$parameter};
         print_lineno($parameterdesc_start_lines{$parameter_name});
-	print $lineprefix . "``" . $parameter . "``\n";
-	$lineprefix = "    ";
-	output_highlight_rst($args{'parameterdescs'}{$parameter_name});
-	$lineprefix = "  ";
-	print "\n";
+        print $lineprefix . "``" . $parameter . "``\n";
+        $lineprefix = "    ";
+        output_highlight_rst($args{'parameterdescs'}{$parameter_name});
+        $lineprefix = "  ";
+        print "\n";
     }
     print "\n";
 
@@ -1074,14 +1075,14 @@ sub output_declaration {
     return if (defined($nosymbol_table{$name}));
 
     if (($output_selection == OUTPUT_ALL) ||
-	(($output_selection == OUTPUT_INCLUDE ||
-	  $output_selection == OUTPUT_EXPORTED) &&
-	 defined($function_table{$name})) ||
-	($output_selection == OUTPUT_INTERNAL &&
-	 !($functype eq "function" && defined($function_table{$name}))))
+        (($output_selection == OUTPUT_INCLUDE ||
+          $output_selection == OUTPUT_EXPORTED) &&
+         defined($function_table{$name})) ||
+        ($output_selection == OUTPUT_INTERNAL &&
+         !($functype eq "function" && defined($function_table{$name}))))
     {
-	&$func(@_);
-	$section_counter++;
+        &$func(@_);
+        $section_counter++;
     }
 }
 
@@ -1120,203 +1121,202 @@ sub dump_struct($$) {
     my $struct_members = qr{($type)([^\{\};]+)\{([^\{\}]*)\}([^\{\}\;]*)\;};
 
     if ($x =~ /($type)\s+(\w+)\s*$definition_body/) {
-	$decl_type = $1;
-	$declaration_name = $2;
-	$members = $3;
+        $decl_type = $1;
+        $declaration_name = $2;
+        $members = $3;
     } elsif ($x =~ /typedef\s+($type)\s*$definition_body\s*(\w+)\s*;/) {
-	$decl_type = $1;
-	$declaration_name = $3;
-	$members = $2;
+        $decl_type = $1;
+        $declaration_name = $3;
+        $members = $2;
     }
 
     if ($members) {
-	if ($identifier ne $declaration_name) {
-	    emit_warning("${file}:$.", "expecting prototype for $decl_type $identifier. Prototype was for $decl_type $declaration_name instead\n");
-	    return;
-	}
-
-	# ignore members marked private:
-	$members =~ s/\/\*\s*private:.*?\/\*\s*public:.*?\*\///gosi;
-	$members =~ s/\/\*\s*private:.*//gosi;
-	# strip comments:
-	$members =~ s/\/\*.*?\*\///gos;
-	# strip attributes
-	$members =~ s/\s*$attribute/ /gi;
-	$members =~ s/\s*__aligned\s*\([^;]*\)/ /gos;
-	$members =~ s/\s*__counted_by\s*\([^;]*\)/ /gos;
-	$members =~ s/\s*__packed\s*/ /gos;
-	$members =~ s/\s*CRYPTO_MINALIGN_ATTR/ /gos;
-	$members =~ s/\s*____cacheline_aligned_in_smp/ /gos;
-	$members =~ s/\s*____cacheline_aligned/ /gos;
-	# unwrap struct_group():
-	# - first eat non-declaration parameters and rewrite for final match
-	# - then remove macro, outer parens, and trailing semicolon
-	$members =~ s/\bstruct_group\s*\(([^,]*,)/STRUCT_GROUP(/gos;
-	$members =~ s/\bstruct_group_(attr|tagged)\s*\(([^,]*,){2}/STRUCT_GROUP(/gos;
-	$members =~ s/\b__struct_group\s*\(([^,]*,){3}/STRUCT_GROUP(/gos;
-	$members =~ s/\bSTRUCT_GROUP(\(((?:(?>[^)(]+)|(?1))*)\))[^;]*;/$2/gos;
-
-	my $args = qr{([^,)]+)};
-	# replace DECLARE_BITMAP
-	$members =~ s/__ETHTOOL_DECLARE_LINK_MODE_MASK\s*\(([^\)]+)\)/DECLARE_BITMAP($1, __ETHTOOL_LINK_MODE_MASK_NBITS)/gos;
-	$members =~ s/DECLARE_PHY_INTERFACE_MASK\s*\(([^\)]+)\)/DECLARE_BITMAP($1, PHY_INTERFACE_MODE_MAX)/gos;
-	$members =~ s/DECLARE_BITMAP\s*\($args,\s*$args\)/unsigned long $1\[BITS_TO_LONGS($2)\]/gos;
-	# replace DECLARE_HASHTABLE
-	$members =~ s/DECLARE_HASHTABLE\s*\($args,\s*$args\)/unsigned long $1\[1 << (($2) - 1)\]/gos;
-	# replace DECLARE_KFIFO
-	$members =~ s/DECLARE_KFIFO\s*\($args,\s*$args,\s*$args\)/$2 \*$1/gos;
-	# replace DECLARE_KFIFO_PTR
-	$members =~ s/DECLARE_KFIFO_PTR\s*\($args,\s*$args\)/$2 \*$1/gos;
-	# replace DECLARE_FLEX_ARRAY
-	$members =~ s/(?:__)?DECLARE_FLEX_ARRAY\s*\($args,\s*$args\)/$1 $2\[\]/gos;
-	#replace DEFINE_DMA_UNMAP_ADDR
-	$members =~ s/DEFINE_DMA_UNMAP_ADDR\s*\($args\)/dma_addr_t $1/gos;
-	#replace DEFINE_DMA_UNMAP_LEN
-	$members =~ s/DEFINE_DMA_UNMAP_LEN\s*\($args\)/__u32 $1/gos;
-	my $declaration = $members;
-
-	# Split nested struct/union elements as newer ones
-	while ($members =~ m/$struct_members/) {
-		my $newmember;
-		my $maintype = $1;
-		my $ids = $4;
-		my $content = $3;
-		foreach my $id(split /,/, $ids) {
-			$newmember .= "$maintype $id; ";
-
-			$id =~ s/[:\[].*//;
-			$id =~ s/^\s*\**(\S+)\s*/$1/;
-			foreach my $arg (split /;/, $content) {
-				next if ($arg =~ m/^\s*$/);
-				if ($arg =~ m/^([^\(]+\(\*?\s*)([\w\.]*)(\s*\).*)/) {
-					# pointer-to-function
-					my $type = $1;
-					my $name = $2;
-					my $extra = $3;
-					next if (!$name);
-					if ($id =~ m/^\s*$/) {
-						# anonymous struct/union
-						$newmember .= "$type$name$extra; ";
-					} else {
-						$newmember .= "$type$id.$name$extra; ";
-					}
-				} else {
-					my $type;
-					my $names;
-					$arg =~ s/^\s+//;
-					$arg =~ s/\s+$//;
-					# Handle bitmaps
-					$arg =~ s/:\s*\d+\s*//g;
-					# Handle arrays
-					$arg =~ s/\[.*\]//g;
-					# The type may have multiple words,
-					# and multiple IDs can be defined, like:
-					#	const struct foo, *bar, foobar
-					# So, we remove spaces when parsing the
-					# names, in order to match just names
-					# and commas for the names
-					$arg =~ s/\s*,\s*/,/g;
-					if ($arg =~ m/(.*)\s+([\S+,]+)/) {
-						$type = $1;
-						$names = $2;
-					} else {
-						$newmember .= "$arg; ";
-						next;
-					}
-					foreach my $name (split /,/, $names) {
-						$name =~ s/^\s*\**(\S+)\s*/$1/;
-						next if (($name =~ m/^\s*$/));
-						if ($id =~ m/^\s*$/) {
-							# anonymous struct/union
-							$newmember .= "$type $name; ";
-						} else {
-							$newmember .= "$type $id.$name; ";
-						}
-					}
-				}
-			}
-		}
-		$members =~ s/$struct_members/$newmember/;
-	}
-
-	# Ignore other nested elements, like enums
-	$members =~ s/(\{[^\{\}]*\})//g;
-
-	create_parameterlist($members, ';', $file, $declaration_name);
-	check_sections($file, $declaration_name, $decl_type, $sectcheck, $struct_actual);
-
-	# Adjust declaration for better display
-	$declaration =~ s/([\{;])/$1\n/g;
-	$declaration =~ s/\}\s+;/};/g;
-	# Better handle inlined enums
-	do {} while ($declaration =~ s/(enum\s+\{[^\}]+),([^\n])/$1,\n$2/);
-
-	my @def_args = split /\n/, $declaration;
-	my $level = 1;
-	$declaration = "";
-	foreach my $clause (@def_args) {
-		$clause =~ s/^\s+//;
-		$clause =~ s/\s+$//;
-		$clause =~ s/\s+/ /;
-		next if (!$clause);
-		$level-- if ($clause =~ m/(\})/ && $level > 1);
-		if (!($clause =~ m/^\s*#/)) {
-			$declaration .= "\t" x $level;
-		}
-		$declaration .= "\t" . $clause . "\n";
-		$level++ if ($clause =~ m/(\{)/ && !($clause =~m/\}/));
-	}
-	output_declaration($declaration_name,
-			   'struct',
-			   {'struct' => $declaration_name,
-			    'module' => $modulename,
-			    'definition' => $declaration,
-			    'parameterlist' => \@parameterlist,
-			    'parameterdescs' => \%parameterdescs,
-			    'parametertypes' => \%parametertypes,
-			    'sectionlist' => \@sectionlist,
-			    'sections' => \%sections,
-			    'purpose' => $declaration_purpose,
-			    'type' => $decl_type
-			   });
-    }
-    else {
-	print STDERR "${file}:$.: error: Cannot parse struct or union!\n";
-	++$errors;
+        if ($identifier ne $declaration_name) {
+            emit_warning("${file}:$.", "expecting prototype for $decl_type $identifier. Prototype was for $decl_type $declaration_name instead\n");
+            return;
+        }
+
+        # ignore members marked private:
+        $members =~ s/\/\*\s*private:.*?\/\*\s*public:.*?\*\///gosi;
+        $members =~ s/\/\*\s*private:.*//gosi;
+        # strip comments:
+        $members =~ s/\/\*.*?\*\///gos;
+        # strip attributes
+        $members =~ s/\s*$attribute/ /gi;
+        $members =~ s/\s*__aligned\s*\([^;]*\)/ /gos;
+        $members =~ s/\s*__counted_by\s*\([^;]*\)/ /gos;
+        $members =~ s/\s*__packed\s*/ /gos;
+        $members =~ s/\s*CRYPTO_MINALIGN_ATTR/ /gos;
+        $members =~ s/\s*____cacheline_aligned_in_smp/ /gos;
+        $members =~ s/\s*____cacheline_aligned/ /gos;
+        # unwrap struct_group():
+        # - first eat non-declaration parameters and rewrite for final match
+        # - then remove macro, outer parens, and trailing semicolon
+        $members =~ s/\bstruct_group\s*\(([^,]*,)/STRUCT_GROUP(/gos;
+        $members =~ s/\bstruct_group_(attr|tagged)\s*\(([^,]*,){2}/STRUCT_GROUP(/gos;
+        $members =~ s/\b__struct_group\s*\(([^,]*,){3}/STRUCT_GROUP(/gos;
+        $members =~ s/\bSTRUCT_GROUP(\(((?:(?>[^)(]+)|(?1))*)\))[^;]*;/$2/gos;
+
+        my $args = qr{([^,)]+)};
+        # replace DECLARE_BITMAP
+        $members =~ s/__ETHTOOL_DECLARE_LINK_MODE_MASK\s*\(([^\)]+)\)/DECLARE_BITMAP($1, __ETHTOOL_LINK_MODE_MASK_NBITS)/gos;
+        $members =~ s/DECLARE_PHY_INTERFACE_MASK\s*\(([^\)]+)\)/DECLARE_BITMAP($1, PHY_INTERFACE_MODE_MAX)/gos;
+        $members =~ s/DECLARE_BITMAP\s*\($args,\s*$args\)/unsigned long $1\[BITS_TO_LONGS($2)\]/gos;
+        # replace DECLARE_HASHTABLE
+        $members =~ s/DECLARE_HASHTABLE\s*\($args,\s*$args\)/unsigned long $1\[1 << (($2) - 1)\]/gos;
+        # replace DECLARE_KFIFO
+        $members =~ s/DECLARE_KFIFO\s*\($args,\s*$args,\s*$args\)/$2 \*$1/gos;
+        # replace DECLARE_KFIFO_PTR
+        $members =~ s/DECLARE_KFIFO_PTR\s*\($args,\s*$args\)/$2 \*$1/gos;
+        # replace DECLARE_FLEX_ARRAY
+        $members =~ s/(?:__)?DECLARE_FLEX_ARRAY\s*\($args,\s*$args\)/$1 $2\[\]/gos;
+        #replace DEFINE_DMA_UNMAP_ADDR
+        $members =~ s/DEFINE_DMA_UNMAP_ADDR\s*\($args\)/dma_addr_t $1/gos;
+        #replace DEFINE_DMA_UNMAP_LEN
+        $members =~ s/DEFINE_DMA_UNMAP_LEN\s*\($args\)/__u32 $1/gos;
+        my $declaration = $members;
+
+        # Split nested struct/union elements as newer ones
+        while ($members =~ m/$struct_members/) {
+            my $newmember;
+            my $maintype = $1;
+            my $ids = $4;
+            my $content = $3;
+            foreach my $id(split /,/, $ids) {
+                $newmember .= "$maintype $id; ";
+
+                $id =~ s/[:\[].*//;
+                $id =~ s/^\s*\**(\S+)\s*/$1/;
+                foreach my $arg (split /;/, $content) {
+                    next if ($arg =~ m/^\s*$/);
+                    if ($arg =~ m/^([^\(]+\(\*?\s*)([\w\.]*)(\s*\).*)/) {
+                        # pointer-to-function
+                        my $type = $1;
+                        my $name = $2;
+                        my $extra = $3;
+                        next if (!$name);
+                        if ($id =~ m/^\s*$/) {
+                            # anonymous struct/union
+                            $newmember .= "$type$name$extra; ";
+                        } else {
+                            $newmember .= "$type$id.$name$extra; ";
+                        }
+                    } else {
+                        my $type;
+                        my $names;
+                        $arg =~ s/^\s+//;
+                        $arg =~ s/\s+$//;
+                        # Handle bitmaps
+                        $arg =~ s/:\s*\d+\s*//g;
+                        # Handle arrays
+                        $arg =~ s/\[.*\]//g;
+                        # The type may have multiple words,
+                        # and multiple IDs can be defined, like:
+                        #    const struct foo, *bar, foobar
+                        # So, we remove spaces when parsing the
+                        # names, in order to match just names
+                        # and commas for the names
+                        $arg =~ s/\s*,\s*/,/g;
+                        if ($arg =~ m/(.*)\s+([\S+,]+)/) {
+                            $type = $1;
+                            $names = $2;
+                        } else {
+                            $newmember .= "$arg; ";
+                            next;
+                        }
+                        foreach my $name (split /,/, $names) {
+                            $name =~ s/^\s*\**(\S+)\s*/$1/;
+                            next if (($name =~ m/^\s*$/));
+                            if ($id =~ m/^\s*$/) {
+                                # anonymous struct/union
+                                $newmember .= "$type $name; ";
+                            } else {
+                                $newmember .= "$type $id.$name; ";
+                            }
+                        }
+                    }
+                }
+            }
+            $members =~ s/$struct_members/$newmember/;
+        }
+
+        # Ignore other nested elements, like enums
+        $members =~ s/(\{[^\{\}]*\})//g;
+
+        create_parameterlist($members, ';', $file, $declaration_name);
+        check_sections($file, $declaration_name, $decl_type, $sectcheck, $struct_actual);
+
+        # Adjust declaration for better display
+        $declaration =~ s/([\{;])/$1\n/g;
+        $declaration =~ s/\}\s+;/};/g;
+        # Better handle inlined enums
+        do {} while ($declaration =~ s/(enum\s+\{[^\}]+),([^\n])/$1,\n$2/);
+
+        my @def_args = split /\n/, $declaration;
+        my $level = 1;
+        $declaration = "";
+        foreach my $clause (@def_args) {
+            $clause =~ s/^\s+//;
+            $clause =~ s/\s+$//;
+            $clause =~ s/\s+/ /;
+            next if (!$clause);
+            $level-- if ($clause =~ m/(\})/ && $level > 1);
+            if (!($clause =~ m/^\s*#/)) {
+                $declaration .= "\t" x $level;
+            }
+            $declaration .= "\t" . $clause . "\n";
+            $level++ if ($clause =~ m/(\{)/ && !($clause =~m/\}/));
+        }
+        output_declaration($declaration_name,
+                   'struct',
+                   {'struct' => $declaration_name,
+                    'module' => $modulename,
+                    'definition' => $declaration,
+                    'parameterlist' => \@parameterlist,
+                    'parameterdescs' => \%parameterdescs,
+                    'parametertypes' => \%parametertypes,
+                    'sectionlist' => \@sectionlist,
+                    'sections' => \%sections,
+                    'purpose' => $declaration_purpose,
+                    'type' => $decl_type
+                   });
+    } else {
+        print STDERR "${file}:$.: error: Cannot parse struct or union!\n";
+        ++$errors;
     }
 }
 
 
 sub show_warnings($$) {
-	my $functype = shift;
-	my $name = shift;
-
-	return 0 if (defined($nosymbol_table{$name}));
-
-	return 1 if ($output_selection == OUTPUT_ALL);
-
-	if ($output_selection == OUTPUT_EXPORTED) {
-		if (defined($function_table{$name})) {
-			return 1;
-		} else {
-			return 0;
-		}
-	}
-        if ($output_selection == OUTPUT_INTERNAL) {
-		if (!($functype eq "function" && defined($function_table{$name}))) {
-			return 1;
-		} else {
-			return 0;
-		}
-	}
-	if ($output_selection == OUTPUT_INCLUDE) {
-		if (defined($function_table{$name})) {
-			return 1;
-		} else {
-			return 0;
-		}
-	}
-	die("Please add the new output type at show_warnings()");
+    my $functype = shift;
+    my $name = shift;
+
+    return 0 if (defined($nosymbol_table{$name}));
+
+    return 1 if ($output_selection == OUTPUT_ALL);
+
+    if ($output_selection == OUTPUT_EXPORTED) {
+        if (defined($function_table{$name})) {
+            return 1;
+        } else {
+            return 0;
+        }
+    }
+    if ($output_selection == OUTPUT_INTERNAL) {
+        if (!($functype eq "function" && defined($function_table{$name}))) {
+            return 1;
+        } else {
+            return 0;
+        }
+    }
+    if ($output_selection == OUTPUT_INCLUDE) {
+        if (defined($function_table{$name})) {
+            return 1;
+        } else {
+            return 0;
+        }
+    }
+    die("Please add the new output type at show_warnings()");
 }
 
 sub dump_enum($$) {
@@ -1333,62 +1333,62 @@ sub dump_enum($$) {
     $x =~ s@#\s*((define|ifdef)\s+|endif)[^;]*;@@gos;
 
     if ($x =~ /typedef\s+enum\s*\{(.*)\}\s*(\w*)\s*;/) {
-	$declaration_name = $2;
-	$members = $1;
+        $declaration_name = $2;
+        $members = $1;
     } elsif ($x =~ /enum\s+(\w*)\s*\{(.*)\}/) {
-	$declaration_name = $1;
-	$members = $2;
+        $declaration_name = $1;
+        $members = $2;
     }
 
     if ($members) {
-	if ($identifier ne $declaration_name) {
-	    if ($identifier eq "") {
-		emit_warning("${file}:$.", "wrong kernel-doc identifier on line:\n");
-	    } else {
-		emit_warning("${file}:$.", "expecting prototype for enum $identifier. Prototype was for enum $declaration_name instead\n");
-	    }
-	    return;
-	}
-	$declaration_name = "(anonymous)" if ($declaration_name eq "");
-
-	my %_members;
-
-	$members =~ s/\s+$//;
-	$members =~ s/\([^;]*?[\)]//g;
-
-	foreach my $arg (split ',', $members) {
-	    $arg =~ s/^\s*(\w+).*/$1/;
-	    push @parameterlist, $arg;
-	    if (!$parameterdescs{$arg}) {
-		$parameterdescs{$arg} = $undescribed;
-	        if (show_warnings("enum", $declaration_name)) {
-			emit_warning("${file}:$.", "Enum value '$arg' not described in enum '$declaration_name'\n");
-		}
-	    }
-	    $_members{$arg} = 1;
-	}
-
-	while (my ($k, $v) = each %parameterdescs) {
-	    if (!exists($_members{$k})) {
-	        if (show_warnings("enum", $declaration_name)) {
-		     emit_warning("${file}:$.", "Excess enum value '$k' description in '$declaration_name'\n");
-		}
-	    }
-        }
-
-	output_declaration($declaration_name,
-			   'enum',
-			   {'enum' => $declaration_name,
-			    'module' => $modulename,
-			    'parameterlist' => \@parameterlist,
-			    'parameterdescs' => \%parameterdescs,
-			    'sectionlist' => \@sectionlist,
-			    'sections' => \%sections,
-			    'purpose' => $declaration_purpose
-			   });
+        if ($identifier ne $declaration_name) {
+            if ($identifier eq "") {
+                emit_warning("${file}:$.", "wrong kernel-doc identifier on line:\n");
+            } else {
+                emit_warning("${file}:$.", "expecting prototype for enum $identifier. Prototype was for enum $declaration_name instead\n");
+            }
+            return;
+        }
+        $declaration_name = "(anonymous)" if ($declaration_name eq "");
+
+        my %_members;
+
+        $members =~ s/\s+$//;
+        $members =~ s/\([^;]*?[\)]//g;
+
+        foreach my $arg (split ',', $members) {
+            $arg =~ s/^\s*(\w+).*/$1/;
+            push @parameterlist, $arg;
+            if (!$parameterdescs{$arg}) {
+                $parameterdescs{$arg} = $undescribed;
+                if (show_warnings("enum", $declaration_name)) {
+                    emit_warning("${file}:$.", "Enum value '$arg' not described in enum '$declaration_name'\n");
+                }
+            }
+            $_members{$arg} = 1;
+        }
+
+        while (my ($k, $v) = each %parameterdescs) {
+            if (!exists($_members{$k})) {
+                if (show_warnings("enum", $declaration_name)) {
+                    emit_warning("${file}:$.", "Excess enum value '$k' description in '$declaration_name'\n");
+                }
+            }
+        }
+
+        output_declaration($declaration_name,
+                           'enum',
+                           {'enum' => $declaration_name,
+                            'module' => $modulename,
+                            'parameterlist' => \@parameterlist,
+                            'parameterdescs' => \%parameterdescs,
+                            'sectionlist' => \@sectionlist,
+                            'sections' => \%sections,
+                            'purpose' => $declaration_purpose
+                           });
     } else {
-	print STDERR "${file}:$.: error: Cannot parse enum!\n";
-	++$errors;
+        print STDERR "${file}:$.: error: Cannot parse enum!\n";
+        ++$errors;
     }
 }
 
@@ -1407,59 +1407,58 @@ sub dump_typedef($$) {
 
     # Parse function typedef prototypes
     if ($x =~ $typedef1 || $x =~ $typedef2) {
-	$return_type = $1;
-	$declaration_name = $2;
-	my $args = $3;
-	$return_type =~ s/^\s+//;
-
-	if ($identifier ne $declaration_name) {
-	    emit_warning("${file}:$.", "expecting prototype for typedef $identifier. Prototype was for typedef $declaration_name instead\n");
-	    return;
-	}
-
-	create_parameterlist($args, ',', $file, $declaration_name);
-
-	output_declaration($declaration_name,
-			   'function',
-			   {'function' => $declaration_name,
-			    'typedef' => 1,
-			    'module' => $modulename,
-			    'functiontype' => $return_type,
-			    'parameterlist' => \@parameterlist,
-			    'parameterdescs' => \%parameterdescs,
-			    'parametertypes' => \%parametertypes,
-			    'sectionlist' => \@sectionlist,
-			    'sections' => \%sections,
-			    'purpose' => $declaration_purpose
-			   });
-	return;
+        $return_type = $1;
+        $declaration_name = $2;
+        my $args = $3;
+        $return_type =~ s/^\s+//;
+
+        if ($identifier ne $declaration_name) {
+            emit_warning("${file}:$.", "expecting prototype for typedef $identifier. Prototype was for typedef $declaration_name instead\n");
+            return;
+        }
+
+        create_parameterlist($args, ',', $file, $declaration_name);
+
+        output_declaration($declaration_name,
+                           'function',
+                           {'function' => $declaration_name,
+                            'typedef' => 1,
+                            'module' => $modulename,
+                            'functiontype' => $return_type,
+                            'parameterlist' => \@parameterlist,
+                            'parameterdescs' => \%parameterdescs,
+                            'parametertypes' => \%parametertypes,
+                            'sectionlist' => \@sectionlist,
+                            'sections' => \%sections,
+                            'purpose' => $declaration_purpose
+                           });
+        return;
     }
 
     while (($x =~ /\(*.\)\s*;$/) || ($x =~ /\[*.\]\s*;$/)) {
-	$x =~ s/\(*.\)\s*;$/;/;
-	$x =~ s/\[*.\]\s*;$/;/;
+        $x =~ s/\(*.\)\s*;$/;/;
+        $x =~ s/\[*.\]\s*;$/;/;
     }
 
     if ($x =~ /typedef.*\s+(\w+)\s*;/) {
-	$declaration_name = $1;
+        $declaration_name = $1;
 
-	if ($identifier ne $declaration_name) {
-	    emit_warning("${file}:$.", "expecting prototype for typedef $identifier. Prototype was for typedef $declaration_name instead\n");
-	    return;
-	}
+        if ($identifier ne $declaration_name) {
+            emit_warning("${file}:$.", "expecting prototype for typedef $identifier. Prototype was for typedef $declaration_name instead\n");
+            return;
+        }
 
-	output_declaration($declaration_name,
-			   'typedef',
-			   {'typedef' => $declaration_name,
-			    'module' => $modulename,
-			    'sectionlist' => \@sectionlist,
-			    'sections' => \%sections,
-			    'purpose' => $declaration_purpose
-			   });
-    }
-    else {
-	print STDERR "${file}:$.: error: Cannot parse typedef!\n";
-	++$errors;
+        output_declaration($declaration_name,
+                           'typedef',
+                           {'typedef' => $declaration_name,
+                            'module' => $modulename,
+                            'sectionlist' => \@sectionlist,
+                            'sections' => \%sections,
+                            'purpose' => $declaration_purpose
+                           });
+    } else {
+        print STDERR "${file}:$.: error: Cannot parse typedef!\n";
+        ++$errors;
     }
 }
 
@@ -1482,223 +1481,220 @@ sub create_parameterlist($$$$) {
     # temporarily replace commas inside function pointer definition
     my $arg_expr = qr{\([^\),]+};
     while ($args =~ /$arg_expr,/) {
-	$args =~ s/($arg_expr),/$1#/g;
+        $args =~ s/($arg_expr),/$1#/g;
     }
 
     foreach my $arg (split($splitter, $args)) {
-	# strip comments
-	$arg =~ s/\/\*.*\*\///;
-	# ignore argument attributes
-	$arg =~ s/\sPOS0?\s/ /;
-	# strip leading/trailing spaces
-	$arg =~ s/^\s*//;
-	$arg =~ s/\s*$//;
-	$arg =~ s/\s+/ /;
-
-	if ($arg =~ /^#/) {
-	    # Treat preprocessor directive as a typeless variable just to fill
-	    # corresponding data structures "correctly". Catch it later in
-	    # output_* subs.
-	    push_parameter($arg, "", "", $file);
-	} elsif ($arg =~ m/\(.+\)\s*\(/) {
-	    # pointer-to-function
-	    $arg =~ tr/#/,/;
-	    $arg =~ m/[^\(]+\(\*?\s*([\w\[\]\.]*)\s*\)/;
-	    $param = $1;
-	    $type = $arg;
-	    $type =~ s/([^\(]+\(\*?)\s*$param/$1/;
-	    save_struct_actual($param);
-	    push_parameter($param, $type, $arg, $file, $declaration_name);
-	} elsif ($arg =~ m/\(.+\)\s*\[/) {
-	    # array-of-pointers
-	    $arg =~ tr/#/,/;
-	    $arg =~ m/[^\(]+\(\s*\*\s*([\w\[\]\.]*?)\s*(\s*\[\s*[\w]+\s*\]\s*)*\)/;
-	    $param = $1;
-	    $type = $arg;
-	    $type =~ s/([^\(]+\(\*?)\s*$param/$1/;
-	    save_struct_actual($param);
-	    push_parameter($param, $type, $arg, $file, $declaration_name);
-	} elsif ($arg) {
-	    $arg =~ s/\s*:\s*/:/g;
-	    $arg =~ s/\s*\[/\[/g;
-
-	    my @args = split('\s*,\s*', $arg);
-	    if ($args[0] =~ m/\*/) {
-		$args[0] =~ s/(\*+)\s*/ $1/;
-	    }
-
-	    my @first_arg;
-	    if ($args[0] =~ /^(.*\s+)(.*?\[.*\].*)$/) {
-		    shift @args;
-		    push(@first_arg, split('\s+', $1));
-		    push(@first_arg, $2);
-	    } else {
-		    @first_arg = split('\s+', shift @args);
-	    }
-
-	    unshift(@args, pop @first_arg);
-	    $type = join " ", @first_arg;
-
-	    foreach $param (@args) {
-		if ($param =~ m/^(\*+)\s*(.*)/) {
-		    save_struct_actual($2);
-
-		    push_parameter($2, "$type $1", $arg, $file, $declaration_name);
-		}
-		elsif ($param =~ m/(.*?):(\d+)/) {
-		    if ($type ne "") { # skip unnamed bit-fields
-			save_struct_actual($1);
-			push_parameter($1, "$type:$2", $arg, $file, $declaration_name)
-		    }
-		}
-		else {
-		    save_struct_actual($param);
-		    push_parameter($param, $type, $arg, $file, $declaration_name);
-		}
-	    }
-	}
+        # strip comments
+        $arg =~ s/\/\*.*\*\///;
+        # ignore argument attributes
+        $arg =~ s/\sPOS0?\s/ /;
+        # strip leading/trailing spaces
+        $arg =~ s/^\s*//;
+        $arg =~ s/\s*$//;
+        $arg =~ s/\s+/ /;
+
+        if ($arg =~ /^#/) {
+            # Treat preprocessor directive as a typeless variable just to fill
+            # corresponding data structures "correctly". Catch it later in
+            # output_* subs.
+            push_parameter($arg, "", "", $file);
+        } elsif ($arg =~ m/\(.+\)\s*\(/) {
+            # pointer-to-function
+            $arg =~ tr/#/,/;
+            $arg =~ m/[^\(]+\(\*?\s*([\w\[\]\.]*)\s*\)/;
+            $param = $1;
+            $type = $arg;
+            $type =~ s/([^\(]+\(\*?)\s*$param/$1/;
+            save_struct_actual($param);
+            push_parameter($param, $type, $arg, $file, $declaration_name);
+        } elsif ($arg =~ m/\(.+\)\s*\[/) {
+            # array-of-pointers
+            $arg =~ tr/#/,/;
+            $arg =~ m/[^\(]+\(\s*\*\s*([\w\[\]\.]*?)\s*(\s*\[\s*[\w]+\s*\]\s*)*\)/;
+            $param = $1;
+            $type = $arg;
+            $type =~ s/([^\(]+\(\*?)\s*$param/$1/;
+            save_struct_actual($param);
+            push_parameter($param, $type, $arg, $file, $declaration_name);
+        } elsif ($arg) {
+            $arg =~ s/\s*:\s*/:/g;
+            $arg =~ s/\s*\[/\[/g;
+
+            my @args = split('\s*,\s*', $arg);
+            if ($args[0] =~ m/\*/) {
+                $args[0] =~ s/(\*+)\s*/ $1/;
+            }
+
+            my @first_arg;
+            if ($args[0] =~ /^(.*\s+)(.*?\[.*\].*)$/) {
+                shift @args;
+                push(@first_arg, split('\s+', $1));
+                push(@first_arg, $2);
+            } else {
+                @first_arg = split('\s+', shift @args);
+            }
+
+            unshift(@args, pop @first_arg);
+            $type = join " ", @first_arg;
+
+            foreach $param (@args) {
+                if ($param =~ m/^(\*+)\s*(.*)/) {
+                    save_struct_actual($2);
+
+                    push_parameter($2, "$type $1", $arg, $file, $declaration_name);
+                } elsif ($param =~ m/(.*?):(\d+)/) {
+                    if ($type ne "") { # skip unnamed bit-fields
+                        save_struct_actual($1);
+                        push_parameter($1, "$type:$2", $arg, $file, $declaration_name)
+                    }
+                } else {
+                    save_struct_actual($param);
+                    push_parameter($param, $type, $arg, $file, $declaration_name);
+                }
+            }
+        }
     }
 }
 
 sub push_parameter($$$$$) {
-	my $param = shift;
-	my $type = shift;
-	my $org_arg = shift;
-	my $file = shift;
-	my $declaration_name = shift;
-
-	if (($anon_struct_union == 1) && ($type eq "") &&
-	    ($param eq "}")) {
-		return;		# ignore the ending }; from anon. struct/union
-	}
-
-	$anon_struct_union = 0;
-	$param =~ s/[\[\)].*//;
-
-	if ($type eq "" && $param =~ /\.\.\.$/)
-	{
-	    if (!$param =~ /\w\.\.\.$/) {
-	      # handles unnamed variable parameters
-	      $param = "...";
-	    }
-	    elsif ($param =~ /\w\.\.\.$/) {
-	      # for named variable parameters of the form `x...`, remove the dots
-	      $param =~ s/\.\.\.$//;
-	    }
-	    if (!defined $parameterdescs{$param} || $parameterdescs{$param} eq "") {
-		$parameterdescs{$param} = "variable arguments";
-	    }
-	}
-	elsif ($type eq "" && ($param eq "" or $param eq "void"))
-	{
-	    $param="void";
-	    $parameterdescs{void} = "no arguments";
-	}
-	elsif ($type eq "" && ($param eq "struct" or $param eq "union"))
-	# handle unnamed (anonymous) union or struct:
-	{
-		$type = $param;
-		$param = "{unnamed_" . $param . "}";
-		$parameterdescs{$param} = "anonymous\n";
-		$anon_struct_union = 1;
-	}
-	elsif ($param =~ "__cacheline_group" )
-	# handle cache group enforcing variables: they do not need be described in header files
-	{
-		return; # ignore __cacheline_group_begin and __cacheline_group_end
-	}
-
-	# warn if parameter has no description
-	# (but ignore ones starting with # as these are not parameters
-	# but inline preprocessor statements);
-	# Note: It will also ignore void params and unnamed structs/unions
-	if (!defined $parameterdescs{$param} && $param !~ /^#/) {
-		$parameterdescs{$param} = $undescribed;
-
-	        if (show_warnings($type, $declaration_name) && $param !~ /\./) {
-			emit_warning("${file}:$.", "Function parameter or struct member '$param' not described in '$declaration_name'\n");
-		}
-	}
-
-	# strip spaces from $param so that it is one continuous string
-	# on @parameterlist;
-	# this fixes a problem where check_sections() cannot find
-	# a parameter like "addr[6 + 2]" because it actually appears
-	# as "addr[6", "+", "2]" on the parameter list;
-	# but it's better to maintain the param string unchanged for output,
-	# so just weaken the string compare in check_sections() to ignore
-	# "[blah" in a parameter string;
-	###$param =~ s/\s*//g;
-	push @parameterlist, $param;
-	$org_arg =~ s/\s\s+/ /g;
-	$parametertypes{$param} = $org_arg;
+    my $param = shift;
+    my $type = shift;
+    my $org_arg = shift;
+    my $file = shift;
+    my $declaration_name = shift;
+
+    if (($anon_struct_union == 1) && ($type eq "") &&
+        ($param eq "}")) {
+        return;        # ignore the ending }; from anon. struct/union
+    }
+
+    $anon_struct_union = 0;
+    $param =~ s/[\[\)].*//;
+
+    if ($type eq "" && $param =~ /\.\.\.$/)
+    {
+        if (!$param =~ /\w\.\.\.$/) {
+            # handles unnamed variable parameters
+            $param = "...";
+        } elsif ($param =~ /\w\.\.\.$/) {
+            # for named variable parameters of the form `x...`, remove the dots
+            $param =~ s/\.\.\.$//;
+        }
+        if (!defined $parameterdescs{$param} || $parameterdescs{$param} eq "") {
+            $parameterdescs{$param} = "variable arguments";
+        }
+    }
+    elsif ($type eq "" && ($param eq "" or $param eq "void"))
+    {
+        $param="void";
+        $parameterdescs{void} = "no arguments";
+    }
+    elsif ($type eq "" && ($param eq "struct" or $param eq "union"))
+    # handle unnamed (anonymous) union or struct:
+    {
+        $type = $param;
+        $param = "{unnamed_" . $param . "}";
+        $parameterdescs{$param} = "anonymous\n";
+        $anon_struct_union = 1;
+    }
+    elsif ($param =~ "__cacheline_group" )
+    # handle cache group enforcing variables: they do not need be described in header files
+    {
+        return; # ignore __cacheline_group_begin and __cacheline_group_end
+    }
+
+    # warn if parameter has no description
+    # (but ignore ones starting with # as these are not parameters
+    # but inline preprocessor statements);
+    # Note: It will also ignore void params and unnamed structs/unions
+    if (!defined $parameterdescs{$param} && $param !~ /^#/) {
+        $parameterdescs{$param} = $undescribed;
+
+        if (show_warnings($type, $declaration_name) && $param !~ /\./) {
+            emit_warning("${file}:$.", "Function parameter or struct member '$param' not described in '$declaration_name'\n");
+        }
+    }
+
+    # strip spaces from $param so that it is one continuous string
+    # on @parameterlist;
+    # this fixes a problem where check_sections() cannot find
+    # a parameter like "addr[6 + 2]" because it actually appears
+    # as "addr[6", "+", "2]" on the parameter list;
+    # but it's better to maintain the param string unchanged for output,
+    # so just weaken the string compare in check_sections() to ignore
+    # "[blah" in a parameter string;
+    ###$param =~ s/\s*//g;
+    push @parameterlist, $param;
+    $org_arg =~ s/\s\s+/ /g;
+    $parametertypes{$param} = $org_arg;
 }
 
 sub check_sections($$$$$) {
-	my ($file, $decl_name, $decl_type, $sectcheck, $prmscheck) = @_;
-	my @sects = split ' ', $sectcheck;
-	my @prms = split ' ', $prmscheck;
-	my $err;
-	my ($px, $sx);
-	my $prm_clean;		# strip trailing "[array size]" and/or beginning "*"
-
-	foreach $sx (0 .. $#sects) {
-		$err = 1;
-		foreach $px (0 .. $#prms) {
-			$prm_clean = $prms[$px];
-			$prm_clean =~ s/\[.*\]//;
-			$prm_clean =~ s/$attribute//i;
-			# ignore array size in a parameter string;
-			# however, the original param string may contain
-			# spaces, e.g.:  addr[6 + 2]
-			# and this appears in @prms as "addr[6" since the
-			# parameter list is split at spaces;
-			# hence just ignore "[..." for the sections check;
-			$prm_clean =~ s/\[.*//;
-
-			##$prm_clean =~ s/^\**//;
-			if ($prm_clean eq $sects[$sx]) {
-				$err = 0;
-				last;
-			}
-		}
-		if ($err) {
-			if ($decl_type eq "function") {
-				emit_warning("${file}:$.",
-					"Excess function parameter " .
-					"'$sects[$sx]' " .
-					"description in '$decl_name'\n");
-			}
-			elsif (($decl_type eq "struct") or
-		       	       ($decl_type eq "union")) {
-				emit_warning("${file}:$.",
-					"Excess $decl_type member " .
-					"'$sects[$sx]' " .
-					"description in '$decl_name'\n");
-			}
-		}
-	}
+    my ($file, $decl_name, $decl_type, $sectcheck, $prmscheck) = @_;
+    my @sects = split ' ', $sectcheck;
+    my @prms = split ' ', $prmscheck;
+    my $err;
+    my ($px, $sx);
+    my $prm_clean;        # strip trailing "[array size]" and/or beginning "*"
+
+    foreach $sx (0 .. $#sects) {
+        $err = 1;
+        foreach $px (0 .. $#prms) {
+            $prm_clean = $prms[$px];
+            $prm_clean =~ s/\[.*\]//;
+            $prm_clean =~ s/$attribute//i;
+            # ignore array size in a parameter string;
+            # however, the original param string may contain
+            # spaces, e.g.:  addr[6 + 2]
+            # and this appears in @prms as "addr[6" since the
+            # parameter list is split at spaces;
+            # hence just ignore "[..." for the sections check;
+            $prm_clean =~ s/\[.*//;
+
+            ##$prm_clean =~ s/^\**//;
+            if ($prm_clean eq $sects[$sx]) {
+                $err = 0;
+                last;
+            }
+        }
+        if ($err) {
+            if ($decl_type eq "function") {
+                emit_warning("${file}:$.",
+                    "Excess function parameter " .
+                    "'$sects[$sx]' " .
+                    "description in '$decl_name'\n");
+            } elsif (($decl_type eq "struct") or
+                          ($decl_type eq "union")) {
+                emit_warning("${file}:$.",
+                    "Excess $decl_type member " .
+                    "'$sects[$sx]' " .
+                    "description in '$decl_name'\n");
+            }
+        }
+    }
 }
 
 ##
 # Checks the section describing the return value of a function.
 sub check_return_section {
-        my $file = shift;
-        my $declaration_name = shift;
-        my $return_type = shift;
+    my $file = shift;
+    my $declaration_name = shift;
+    my $return_type = shift;
 
-        # Ignore an empty return type (It's a macro)
-        # Ignore functions with a "void" return type. (But don't ignore "void *")
-        if (($return_type eq "") || ($return_type =~ /void\s*\w*\s*$/)) {
-                return;
-        }
+    # Ignore an empty return type (It's a macro)
+    # Ignore functions with a "void" return type. (But don't ignore "void *")
+    if (($return_type eq "") || ($return_type =~ /void\s*\w*\s*$/)) {
+        return;
+    }
 
-        if (!defined($sections{$section_return}) ||
-            $sections{$section_return} eq "") {
-                emit_warning("${file}:$.",
-                        "No description found for return value of " .
-                        "'$declaration_name'\n");
-        }
+    if (!defined($sections{$section_return}) ||
+        $sections{$section_return} eq "")
+    {
+        emit_warning("${file}:$.",
+                     "No description found for return value of " .
+                     "'$declaration_name'\n");
+    }
 }
 
 ##
@@ -1773,21 +1769,21 @@ sub dump_function($$) {
         $declaration_name = $2;
         $noret = 1;
     } elsif ($prototype =~ m/^()($name)\s*$prototype_end/ ||
-	$prototype =~ m/^($type1)\s+($name)\s*$prototype_end/ ||
-	$prototype =~ m/^($type2+)\s*($name)\s*$prototype_end/)  {
-	$return_type = $1;
-	$declaration_name = $2;
-	my $args = $3;
+        $prototype =~ m/^($type1)\s+($name)\s*$prototype_end/ ||
+        $prototype =~ m/^($type2+)\s*($name)\s*$prototype_end/)  {
+        $return_type = $1;
+        $declaration_name = $2;
+        my $args = $3;
 
-	create_parameterlist($args, ',', $file, $declaration_name);
+        create_parameterlist($args, ',', $file, $declaration_name);
     } else {
-	emit_warning("${file}:$.", "cannot understand function prototype: '$prototype'\n");
-	return;
+        emit_warning("${file}:$.", "cannot understand function prototype: '$prototype'\n");
+        return;
     }
 
     if ($identifier ne $declaration_name) {
-	emit_warning("${file}:$.", "expecting prototype for $identifier(). Prototype was for $declaration_name() instead\n");
-	return;
+        emit_warning("${file}:$.", "expecting prototype for $identifier(). Prototype was for $declaration_name() instead\n");
+        return;
     }
 
     my $prms = join " ", @parameterlist;
@@ -1799,38 +1795,38 @@ sub dump_function($$) {
     # -Wreturn mode.
     # TODO: always perform the check.
     if ($Wreturn && !$noret) {
-	    check_return_section($file, $declaration_name, $return_type);
+        check_return_section($file, $declaration_name, $return_type);
     }
 
     # The function parser can be called with a typedef parameter.
     # Handle it.
     if ($return_type =~ /typedef/) {
-	output_declaration($declaration_name,
-			   'function',
-			   {'function' => $declaration_name,
-			    'typedef' => 1,
-			    'module' => $modulename,
-			    'functiontype' => $return_type,
-			    'parameterlist' => \@parameterlist,
-			    'parameterdescs' => \%parameterdescs,
-			    'parametertypes' => \%parametertypes,
-			    'sectionlist' => \@sectionlist,
-			    'sections' => \%sections,
-			    'purpose' => $declaration_purpose
-			   });
+        output_declaration($declaration_name,
+                           'function',
+                           {'function' => $declaration_name,
+                            'typedef' => 1,
+                            'module' => $modulename,
+                            'functiontype' => $return_type,
+                            'parameterlist' => \@parameterlist,
+                            'parameterdescs' => \%parameterdescs,
+                            'parametertypes' => \%parametertypes,
+                            'sectionlist' => \@sectionlist,
+                            'sections' => \%sections,
+                            'purpose' => $declaration_purpose
+                           });
     } else {
-	output_declaration($declaration_name,
-			   'function',
-			   {'function' => $declaration_name,
-			    'module' => $modulename,
-			    'functiontype' => $return_type,
-			    'parameterlist' => \@parameterlist,
-			    'parameterdescs' => \%parameterdescs,
-			    'parametertypes' => \%parametertypes,
-			    'sectionlist' => \@sectionlist,
-			    'sections' => \%sections,
-			    'purpose' => $declaration_purpose
-			   });
+        output_declaration($declaration_name,
+                           'function',
+                           {'function' => $declaration_name,
+                            'module' => $modulename,
+                            'functiontype' => $return_type,
+                            'parameterlist' => \@parameterlist,
+                            'parameterdescs' => \%parameterdescs,
+                            'parametertypes' => \%parametertypes,
+                            'sectionlist' => \@sectionlist,
+                            'sections' => \%sections,
+                            'purpose' => $declaration_purpose
+                           });
     }
 }
 
@@ -1850,64 +1846,64 @@ sub reset_state {
 }
 
 sub tracepoint_munge($) {
-	my $file = shift;
-	my $tracepointname = 0;
-	my $tracepointargs = 0;
-
-	if ($prototype =~ m/TRACE_EVENT\((.*?),/) {
-		$tracepointname = $1;
-	}
-	if ($prototype =~ m/DEFINE_SINGLE_EVENT\((.*?),/) {
-		$tracepointname = $1;
-	}
-	if ($prototype =~ m/DEFINE_EVENT\((.*?),(.*?),/) {
-		$tracepointname = $2;
-	}
-	$tracepointname =~ s/^\s+//; #strip leading whitespace
-	if ($prototype =~ m/TP_PROTO\((.*?)\)/) {
-		$tracepointargs = $1;
-	}
-	if (($tracepointname eq 0) || ($tracepointargs eq 0)) {
-		emit_warning("${file}:$.", "Unrecognized tracepoint format: \n".
-			     "$prototype\n");
-	} else {
-		$prototype = "static inline void trace_$tracepointname($tracepointargs)";
-		$identifier = "trace_$identifier";
-	}
+    my $file = shift;
+    my $tracepointname = 0;
+    my $tracepointargs = 0;
+
+    if ($prototype =~ m/TRACE_EVENT\((.*?),/) {
+        $tracepointname = $1;
+    }
+    if ($prototype =~ m/DEFINE_SINGLE_EVENT\((.*?),/) {
+        $tracepointname = $1;
+    }
+    if ($prototype =~ m/DEFINE_EVENT\((.*?),(.*?),/) {
+        $tracepointname = $2;
+    }
+    $tracepointname =~ s/^\s+//; #strip leading whitespace
+    if ($prototype =~ m/TP_PROTO\((.*?)\)/) {
+        $tracepointargs = $1;
+    }
+    if (($tracepointname eq 0) || ($tracepointargs eq 0)) {
+        emit_warning("${file}:$.", "Unrecognized tracepoint format: \n".
+                 "$prototype\n");
+    } else {
+        $prototype = "static inline void trace_$tracepointname($tracepointargs)";
+        $identifier = "trace_$identifier";
+    }
 }
 
 sub syscall_munge() {
-	my $void = 0;
-
-	$prototype =~ s@[\r\n]+@ @gos; # strip newlines/CR's
-##	if ($prototype =~ m/SYSCALL_DEFINE0\s*\(\s*(a-zA-Z0-9_)*\s*\)/) {
-	if ($prototype =~ m/SYSCALL_DEFINE0/) {
-		$void = 1;
-##		$prototype = "long sys_$1(void)";
-	}
-
-	$prototype =~ s/SYSCALL_DEFINE.*\(/long sys_/; # fix return type & func name
-	if ($prototype =~ m/long (sys_.*?),/) {
-		$prototype =~ s/,/\(/;
-	} elsif ($void) {
-		$prototype =~ s/\)/\(void\)/;
-	}
-
-	# now delete all of the odd-number commas in $prototype
-	# so that arg types & arg names don't have a comma between them
-	my $count = 0;
-	my $len = length($prototype);
-	if ($void) {
-		$len = 0;	# skip the for-loop
-	}
-	for (my $ix = 0; $ix < $len; $ix++) {
-		if (substr($prototype, $ix, 1) eq ',') {
-			$count++;
-			if ($count % 2 == 1) {
-				substr($prototype, $ix, 1) = ' ';
-			}
-		}
-	}
+    my $void = 0;
+
+    $prototype =~ s@[\r\n]+@ @gos; # strip newlines/CR's
+##    if ($prototype =~ m/SYSCALL_DEFINE0\s*\(\s*(a-zA-Z0-9_)*\s*\)/) {
+    if ($prototype =~ m/SYSCALL_DEFINE0/) {
+        $void = 1;
+##        $prototype = "long sys_$1(void)";
+    }
+
+    $prototype =~ s/SYSCALL_DEFINE.*\(/long sys_/; # fix return type & func name
+    if ($prototype =~ m/long (sys_.*?),/) {
+        $prototype =~ s/,/\(/;
+    } elsif ($void) {
+        $prototype =~ s/\)/\(void\)/;
+    }
+
+    # now delete all of the odd-number commas in $prototype
+    # so that arg types & arg names don't have a comma between them
+    my $count = 0;
+    my $len = length($prototype);
+    if ($void) {
+        $len = 0;    # skip the for-loop
+    }
+    for (my $ix = 0; $ix < $len; $ix++) {
+        if (substr($prototype, $ix, 1) eq ',') {
+            $count++;
+            if ($count % 2 == 1) {
+                substr($prototype, $ix, 1) = ' ';
+            }
+        }
+    }
 }
 
 sub process_proto_function($$) {
@@ -1917,31 +1913,30 @@ sub process_proto_function($$) {
     $x =~ s@\/\/.*$@@gos; # strip C99-style comments to end of line
 
     if ($x =~ /^#/ && $x !~ /^#\s*define/) {
-	# do nothing
-    }
-    elsif ($x =~ /([^\{]*)/) {
-	$prototype .= $1;
+        # do nothing
+    } elsif ($x =~ /([^\{]*)/) {
+        $prototype .= $1;
     }
 
     if (($x =~ /\{/) || ($x =~ /\#\s*define/) || ($x =~ /;/)) {
-	$prototype =~ s@/\*.*?\*/@@gos;	# strip comments.
-	$prototype =~ s@[\r\n]+@ @gos; # strip newlines/cr's.
-	$prototype =~ s@^\s+@@gos; # strip leading spaces
+        $prototype =~ s@/\*.*?\*/@@gos;        # strip comments.
+        $prototype =~ s@[\r\n]+@ @gos; # strip newlines/cr's.
+        $prototype =~ s@^\s+@@gos; # strip leading spaces
 
-	 # Handle prototypes for function pointers like:
-	 # int (*pcs_config)(struct foo)
-	$prototype =~ s@^(\S+\s+)\(\s*\*(\S+)\)@$1$2@gos;
+        # Handle prototypes for function pointers like:
+        # int (*pcs_config)(struct foo)
+        $prototype =~ s@^(\S+\s+)\(\s*\*(\S+)\)@$1$2@gos;
 
-	if ($prototype =~ /SYSCALL_DEFINE/) {
-		syscall_munge();
-	}
-	if ($prototype =~ /TRACE_EVENT/ || $prototype =~ /DEFINE_EVENT/ ||
-	    $prototype =~ /DEFINE_SINGLE_EVENT/)
-	{
-		tracepoint_munge($file);
-	}
-	dump_function($prototype, $file);
-	reset_state();
+        if ($prototype =~ /SYSCALL_DEFINE/) {
+            syscall_munge();
+        }
+        if ($prototype =~ /TRACE_EVENT/ || $prototype =~ /DEFINE_EVENT/ ||
+            $prototype =~ /DEFINE_SINGLE_EVENT/)
+        {
+            tracepoint_munge($file);
+        }
+        dump_function($prototype, $file);
+        reset_state();
     }
 }
 
@@ -1955,28 +1950,28 @@ sub process_proto_type($$) {
     $x =~ s@\/\/.*$@@gos; # strip C99-style comments to end of line
 
     if ($x =~ /^#/) {
-	# To distinguish preprocessor directive from regular declaration later.
-	$x .= ";";
+        # To distinguish preprocessor directive from regular declaration later.
+        $x .= ";";
     }
 
     while (1) {
-	if ( $x =~ /([^\{\};]*)([\{\};])(.*)/ ) {
+        if ( $x =~ /([^\{\};]*)([\{\};])(.*)/ ) {
             if( length $prototype ) {
                 $prototype .= " "
             }
-	    $prototype .= $1 . $2;
-	    ($2 eq '{') && $brcount++;
-	    ($2 eq '}') && $brcount--;
-	    if (($2 eq ';') && ($brcount == 0)) {
-		dump_declaration($prototype, $file);
-		reset_state();
-		last;
-	    }
-	    $x = $3;
-	} else {
-	    $prototype .= $x;
-	    last;
-	}
+            $prototype .= $1 . $2;
+            ($2 eq '{') && $brcount++;
+            ($2 eq '}') && $brcount--;
+            if (($2 eq ';') && ($brcount == 0)) {
+                dump_declaration($prototype, $file);
+                reset_state();
+                last;
+            }
+            $x = $3;
+        } else {
+            $prototype .= $x;
+            last;
+        }
     }
 }
 
@@ -1986,13 +1981,13 @@ sub map_filename($) {
     my ($orig_file) = @_;
 
     if (defined($ENV{'SRCTREE'})) {
-	$file = "$ENV{'SRCTREE'}" . "/" . $orig_file;
+        $file = "$ENV{'SRCTREE'}" . "/" . $orig_file;
     } else {
-	$file = $orig_file;
+        $file = $orig_file;
     }
 
     if (defined($source_map{$file})) {
-	$file = $source_map{$file};
+        $file = $source_map{$file};
     }
 
     return $file;
@@ -2003,20 +1998,20 @@ sub process_export_file($) {
     my $file = map_filename($orig_file);
 
     if (!open(IN,"<$file")) {
-	print STDERR "Error: Cannot open file $file\n";
-	++$errors;
-	return;
+        print STDERR "Error: Cannot open file $file\n";
+        ++$errors;
+        return;
     }
 
     while (<IN>) {
-	if (/$export_symbol/) {
-	    next if (defined($nosymbol_table{$2}));
-	    $function_table{$2} = 1;
-	}
-	if (/$export_symbol_ns/) {
-	    next if (defined($nosymbol_table{$2}));
-	    $function_table{$2} = 1;
-	}
+        if (/$export_symbol/) {
+            next if (defined($nosymbol_table{$2}));
+            $function_table{$2} = 1;
+        }
+        if (/$export_symbol_ns/) {
+            next if (defined($nosymbol_table{$2}));
+            $function_table{$2} = 1;
+        }
     }
 
     close(IN);
@@ -2029,9 +2024,9 @@ sub process_export_file($) {
 #
 sub process_normal() {
     if (/$doc_start/o) {
-	$state = STATE_NAME;	# next line is always the function name
-	$in_doc_sect = 0;
-	$declaration_start_line = $. + 1;
+        $state = STATE_NAME;        # next line is always the function name
+        $in_doc_sect = 0;
+        $declaration_start_line = $. + 1;
     }
 }
 
@@ -2043,80 +2038,80 @@ sub process_name($$) {
     my $descr;
 
     if (/$doc_block/o) {
-	$state = STATE_DOCBLOCK;
-	$contents = "";
-	$new_start_line = $.;
-
-	if ( $1 eq "" ) {
-	    $section = $section_intro;
-	} else {
-	    $section = $1;
-	}
+        $state = STATE_DOCBLOCK;
+        $contents = "";
+        $new_start_line = $.;
+
+        if ( $1 eq "" ) {
+            $section = $section_intro;
+        } else {
+            $section = $1;
+        }
     } elsif (/$doc_decl/o) {
-	$identifier = $1;
-	my $is_kernel_comment = 0;
-	my $decl_start = qr{$doc_com};
-	# test for pointer declaration type, foo * bar() - desc
-	my $fn_type = qr{\w+\s*\*\s*}; 
-	my $parenthesis = qr{\(\w*\)};
-	my $decl_end = qr{[-:].*};
-	if (/^$decl_start([\w\s]+?)$parenthesis?\s*$decl_end?$/) {
-	    $identifier = $1;
-	}
-	if ($identifier =~ m/^(struct|union|enum|typedef)\b\s*(\S*)/) {
-	    $decl_type = $1;
-	    $identifier = $2;
-	    $is_kernel_comment = 1;
-	}
-	# Look for foo() or static void foo() - description; or misspelt
-	# identifier
-	elsif (/^$decl_start$fn_type?(\w+)\s*$parenthesis?\s*$decl_end?$/ ||
-	    /^$decl_start$fn_type?(\w+.*)$parenthesis?\s*$decl_end$/) {
-	    $identifier = $1;
-	    $decl_type = 'function';
-	    $identifier =~ s/^define\s+//;
-	    $is_kernel_comment = 1;
-	}
-	$identifier =~ s/\s+$//;
-
-	$state = STATE_BODY;
-	# if there's no @param blocks need to set up default section
-	# here
-	$contents = "";
-	$section = $section_default;
-	$new_start_line = $. + 1;
-	if (/[-:](.*)/) {
-	    # strip leading/trailing/multiple spaces
-	    $descr= $1;
-	    $descr =~ s/^\s*//;
-	    $descr =~ s/\s*$//;
-	    $descr =~ s/\s+/ /g;
-	    $declaration_purpose = $descr;
-	    $state = STATE_BODY_MAYBE;
-	} else {
-	    $declaration_purpose = "";
-	}
-
-	if (!$is_kernel_comment) {
-	    emit_warning("${file}:$.", "This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst\n$_");
-	    $state = STATE_NORMAL;
-	}
-
-	if (($declaration_purpose eq "") && $Wshort_desc) {
-	    emit_warning("${file}:$.", "missing initial short description on line:\n$_");
-	}
-
-	if ($identifier eq "" && $decl_type ne "enum") {
-	    emit_warning("${file}:$.", "wrong kernel-doc identifier on line:\n$_");
-	    $state = STATE_NORMAL;
-	}
-
-	if ($verbose) {
-	    print STDERR "${file}:$.: info: Scanning doc for $decl_type $identifier\n";
-	}
+        $identifier = $1;
+        my $is_kernel_comment = 0;
+        my $decl_start = qr{$doc_com};
+        # test for pointer declaration type, foo * bar() - desc
+        my $fn_type = qr{\w+\s*\*\s*};
+        my $parenthesis = qr{\(\w*\)};
+        my $decl_end = qr{[-:].*};
+        if (/^$decl_start([\w\s]+?)$parenthesis?\s*$decl_end?$/) {
+            $identifier = $1;
+        }
+        if ($identifier =~ m/^(struct|union|enum|typedef)\b\s*(\S*)/) {
+            $decl_type = $1;
+            $identifier = $2;
+            $is_kernel_comment = 1;
+        }
+        # Look for foo() or static void foo() - description; or misspelt
+        # identifier
+        elsif (/^$decl_start$fn_type?(\w+)\s*$parenthesis?\s*$decl_end?$/ ||
+            /^$decl_start$fn_type?(\w+.*)$parenthesis?\s*$decl_end$/) {
+            $identifier = $1;
+            $decl_type = 'function';
+            $identifier =~ s/^define\s+//;
+            $is_kernel_comment = 1;
+        }
+        $identifier =~ s/\s+$//;
+
+        $state = STATE_BODY;
+        # if there's no @param blocks need to set up default section
+        # here
+        $contents = "";
+        $section = $section_default;
+        $new_start_line = $. + 1;
+        if (/[-:](.*)/) {
+            # strip leading/trailing/multiple spaces
+            $descr= $1;
+            $descr =~ s/^\s*//;
+            $descr =~ s/\s*$//;
+            $descr =~ s/\s+/ /g;
+            $declaration_purpose = $descr;
+            $state = STATE_BODY_MAYBE;
+        } else {
+            $declaration_purpose = "";
+        }
+
+        if (!$is_kernel_comment) {
+            emit_warning("${file}:$.", "This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst\n$_");
+            $state = STATE_NORMAL;
+        }
+
+        if (($declaration_purpose eq "") && $Wshort_desc) {
+            emit_warning("${file}:$.", "missing initial short description on line:\n$_");
+        }
+
+        if ($identifier eq "" && $decl_type ne "enum") {
+            emit_warning("${file}:$.", "wrong kernel-doc identifier on line:\n$_");
+            $state = STATE_NORMAL;
+        }
+
+        if ($verbose) {
+            print STDERR "${file}:$.: info: Scanning doc for $decl_type $identifier\n";
+        }
     } else {
-	emit_warning("${file}:$.", "Cannot understand $_ on line $. - I thought it was a doc line\n");
-	$state = STATE_NORMAL;
+        emit_warning("${file}:$.", "Cannot understand $_ on line $. - I thought it was a doc line\n");
+        $state = STATE_NORMAL;
     }
 }
 
@@ -2128,102 +2123,102 @@ sub process_body($$) {
     my $file = shift;
 
     if ($state == STATE_BODY_WITH_BLANK_LINE && /^\s*\*\s?\S/) {
-	dump_section($file, $section, $contents);
-	$section = $section_default;
-	$new_start_line = $.;
-	$contents = "";
+        dump_section($file, $section, $contents);
+        $section = $section_default;
+        $new_start_line = $.;
+        $contents = "";
     }
 
     if (/$doc_sect/i) { # case insensitive for supported section names
-	$in_doc_sect = 1;
-	$newsection = $1;
-	$newcontents = $2;
-
-	# map the supported section names to the canonical names
-	if ($newsection =~ m/^description$/i) {
-	    $newsection = $section_default;
-	} elsif ($newsection =~ m/^context$/i) {
-	    $newsection = $section_context;
-	} elsif ($newsection =~ m/^returns?$/i) {
-	    $newsection = $section_return;
-	} elsif ($newsection =~ m/^\@return$/) {
-	    # special: @return is a section, not a param description
-	    $newsection = $section_return;
-	}
-
-	if (($contents ne "") && ($contents ne "\n")) {
-	    if (!$in_doc_sect && $Wcontents_before_sections) {
-		emit_warning("${file}:$.", "contents before sections\n");
-	    }
-	    dump_section($file, $section, $contents);
-	    $section = $section_default;
-	}
-
-	$in_doc_sect = 1;
-	$state = STATE_BODY;
-	$contents = $newcontents;
-	$new_start_line = $.;
-	while (substr($contents, 0, 1) eq " ") {
-	    $contents = substr($contents, 1);
-	}
-	if ($contents ne "") {
-	    $contents .= "\n";
-	}
-	$section = $newsection;
-	$leading_space = undef;
+        $in_doc_sect = 1;
+        $newsection = $1;
+        $newcontents = $2;
+
+        # map the supported section names to the canonical names
+        if ($newsection =~ m/^description$/i) {
+            $newsection = $section_default;
+        } elsif ($newsection =~ m/^context$/i) {
+            $newsection = $section_context;
+        } elsif ($newsection =~ m/^returns?$/i) {
+            $newsection = $section_return;
+        } elsif ($newsection =~ m/^\@return$/) {
+            # special: @return is a section, not a param description
+            $newsection = $section_return;
+        }
+
+        if (($contents ne "") && ($contents ne "\n")) {
+            if (!$in_doc_sect && $Wcontents_before_sections) {
+                emit_warning("${file}:$.", "contents before sections\n");
+            }
+            dump_section($file, $section, $contents);
+            $section = $section_default;
+        }
+
+        $in_doc_sect = 1;
+        $state = STATE_BODY;
+        $contents = $newcontents;
+        $new_start_line = $.;
+        while (substr($contents, 0, 1) eq " ") {
+            $contents = substr($contents, 1);
+        }
+        if ($contents ne "") {
+            $contents .= "\n";
+        }
+        $section = $newsection;
+        $leading_space = undef;
     } elsif (/$doc_end/) {
-	if (($contents ne "") && ($contents ne "\n")) {
-	    dump_section($file, $section, $contents);
-	    $section = $section_default;
-	    $contents = "";
-	}
-	# look for doc_com + <text> + doc_end:
-	if ($_ =~ m'\s*\*\s*[a-zA-Z_0-9:\.]+\*/') {
-	    emit_warning("${file}:$.", "suspicious ending line: $_");
-	}
-
-	$prototype = "";
-	$state = STATE_PROTO;
-	$brcount = 0;
+        if (($contents ne "") && ($contents ne "\n")) {
+            dump_section($file, $section, $contents);
+            $section = $section_default;
+            $contents = "";
+        }
+        # look for doc_com + <text> + doc_end:
+        if ($_ =~ m'\s*\*\s*[a-zA-Z_0-9:\.]+\*/') {
+            emit_warning("${file}:$.", "suspicious ending line: $_");
+        }
+
+        $prototype = "";
+        $state = STATE_PROTO;
+        $brcount = 0;
         $new_start_line = $. + 1;
     } elsif (/$doc_content/) {
-	if ($1 eq "") {
-	    if ($section eq $section_context) {
-		dump_section($file, $section, $contents);
-		$section = $section_default;
-		$contents = "";
-		$new_start_line = $.;
-		$state = STATE_BODY;
-	    } else {
-		if ($section ne $section_default) {
-		    $state = STATE_BODY_WITH_BLANK_LINE;
-		} else {
-		    $state = STATE_BODY;
-		}
-		$contents .= "\n";
-	    }
-	} elsif ($state == STATE_BODY_MAYBE) {
-	    # Continued declaration purpose
-	    chomp($declaration_purpose);
-	    $declaration_purpose .= " " . $1;
-	    $declaration_purpose =~ s/\s+/ /g;
-	} else {
-	    my $cont = $1;
-	    if ($section =~ m/^@/ || $section eq $section_context) {
-		if (!defined $leading_space) {
-		    if ($cont =~ m/^(\s+)/) {
-			$leading_space = $1;
-		    } else {
-			$leading_space = "";
-		    }
-		}
-		$cont =~ s/^$leading_space//;
-	    }
-	    $contents .= $cont . "\n";
-	}
+        if ($1 eq "") {
+            if ($section eq $section_context) {
+                dump_section($file, $section, $contents);
+                $section = $section_default;
+                $contents = "";
+                $new_start_line = $.;
+                $state = STATE_BODY;
+            } else {
+                if ($section ne $section_default) {
+                    $state = STATE_BODY_WITH_BLANK_LINE;
+                } else {
+                    $state = STATE_BODY;
+                }
+                $contents .= "\n";
+            }
+        } elsif ($state == STATE_BODY_MAYBE) {
+            # Continued declaration purpose
+            chomp($declaration_purpose);
+            $declaration_purpose .= " " . $1;
+            $declaration_purpose =~ s/\s+/ /g;
+        } else {
+            my $cont = $1;
+            if ($section =~ m/^@/ || $section eq $section_context) {
+                if (!defined $leading_space) {
+                    if ($cont =~ m/^(\s+)/) {
+                        $leading_space = $1;
+                    } else {
+                        $leading_space = "";
+                    }
+                }
+                $cont =~ s/^$leading_space//;
+            }
+            $contents .= $cont . "\n";
+        }
     } else {
-	# i dont know - bad line?  ignore.
-	emit_warning("${file}:$.", "bad line: $_");
+        # i dont know - bad line?  ignore.
+        emit_warning("${file}:$.", "bad line: $_");
     }
 }
 
@@ -2235,21 +2230,21 @@ sub process_proto($$) {
     my $file = shift;
 
     if (/$doc_inline_oneline/) {
-	$section = $1;
-	$contents = $2;
-	if ($contents ne "") {
-	    $contents .= "\n";
-	    dump_section($file, $section, $contents);
-	    $section = $section_default;
-	    $contents = "";
-	}
+        $section = $1;
+        $contents = $2;
+        if ($contents ne "") {
+            $contents .= "\n";
+            dump_section($file, $section, $contents);
+            $section = $section_default;
+            $contents = "";
+        }
     } elsif (/$doc_inline_start/) {
-	$state = STATE_INLINE;
-	$inline_doc_state = STATE_INLINE_NAME;
+        $state = STATE_INLINE;
+        $inline_doc_state = STATE_INLINE_NAME;
     } elsif ($decl_type eq 'function') {
-	process_proto_function($_, $file);
+        process_proto_function($_, $file);
     } else {
-	process_proto_type($_, $file);
+        process_proto_type($_, $file);
     }
 }
 
@@ -2260,23 +2255,23 @@ sub process_docblock($$) {
     my $file = shift;
 
     if (/$doc_end/) {
-	dump_doc_section($file, $section, $contents);
-	$section = $section_default;
-	$contents = "";
-	$function = "";
-	%parameterdescs = ();
-	%parametertypes = ();
-	@parameterlist = ();
-	%sections = ();
-	@sectionlist = ();
-	$prototype = "";
-	$state = STATE_NORMAL;
+        dump_doc_section($file, $section, $contents);
+        $section = $section_default;
+        $contents = "";
+        $function = "";
+        %parameterdescs = ();
+        %parametertypes = ();
+        @parameterlist = ();
+        %sections = ();
+        @sectionlist = ();
+        $prototype = "";
+        $state = STATE_NORMAL;
     } elsif (/$doc_content/) {
-	if ( $1 eq "" )	{
-	    $contents .= $blankline;
-	} else {
-	    $contents .= $1 . "\n";
-	}
+        if ( $1 eq "" )        {
+            $contents .= $blankline;
+        } else {
+            $contents .= $1 . "\n";
+        }
     }
 }
 
@@ -2288,37 +2283,37 @@ sub process_inline($$) {
 
     # First line (state 1) needs to be a @parameter
     if ($inline_doc_state == STATE_INLINE_NAME && /$doc_inline_sect/o) {
-	$section = $1;
-	$contents = $2;
-	$new_start_line = $.;
-	if ($contents ne "") {
-	    while (substr($contents, 0, 1) eq " ") {
-		$contents = substr($contents, 1);
-	    }
-	    $contents .= "\n";
-	}
-	$inline_doc_state = STATE_INLINE_TEXT;
-	# Documentation block end */
+        $section = $1;
+        $contents = $2;
+        $new_start_line = $.;
+        if ($contents ne "") {
+            while (substr($contents, 0, 1) eq " ") {
+                $contents = substr($contents, 1);
+            }
+            $contents .= "\n";
+        }
+        $inline_doc_state = STATE_INLINE_TEXT;
+        # Documentation block end */
     } elsif (/$doc_inline_end/) {
-	if (($contents ne "") && ($contents ne "\n")) {
-	    dump_section($file, $section, $contents);
-	    $section = $section_default;
-	    $contents = "";
-	}
-	$state = STATE_PROTO;
-	$inline_doc_state = STATE_INLINE_NA;
-	# Regular text
+        if (($contents ne "") && ($contents ne "\n")) {
+            dump_section($file, $section, $contents);
+            $section = $section_default;
+            $contents = "";
+        }
+        $state = STATE_PROTO;
+        $inline_doc_state = STATE_INLINE_NA;
+        # Regular text
     } elsif (/$doc_content/) {
-	if ($inline_doc_state == STATE_INLINE_TEXT) {
-	    $contents .= $1 . "\n";
-	    # nuke leading blank lines
-	    if ($contents =~ /^\s*$/) {
-		$contents = "";
-	    }
-	} elsif ($inline_doc_state == STATE_INLINE_NAME) {
-	    $inline_doc_state = STATE_INLINE_ERROR;
-	    emit_warning("${file}:$.", "Incorrect use of kernel-doc format: $_");
-	}
+        if ($inline_doc_state == STATE_INLINE_TEXT) {
+            $contents .= $1 . "\n";
+            # nuke leading blank lines
+            if ($contents =~ /^\s*$/) {
+                $contents = "";
+            }
+        } elsif ($inline_doc_state == STATE_INLINE_NAME) {
+            $inline_doc_state = STATE_INLINE_ERROR;
+            emit_warning("${file}:$.", "Incorrect use of kernel-doc format: $_");
+        }
     }
 }
 
@@ -2331,54 +2326,53 @@ sub process_file($) {
     $file = map_filename($orig_file);
 
     if (!open(IN_FILE,"<$file")) {
-	print STDERR "Error: Cannot open file $file\n";
-	++$errors;
-	return;
+        print STDERR "Error: Cannot open file $file\n";
+        ++$errors;
+        return;
     }
 
     $. = 1;
 
     $section_counter = 0;
     while (<IN_FILE>) {
-	while (!/^ \*/ && s/\\\s*$//) {
-	    $_ .= <IN_FILE>;
-	}
-	# Replace tabs by spaces
+        while (!/^ \*/ && s/\\\s*$//) {
+            $_ .= <IN_FILE>;
+        }
+        # Replace tabs by spaces
         while ($_ =~ s/\t+/' ' x (length($&) * 8 - length($`) % 8)/e) {};
-	# Hand this line to the appropriate state handler
-	if ($state == STATE_NORMAL) {
-	    process_normal();
-	} elsif ($state == STATE_NAME) {
-	    process_name($file, $_);
-	} elsif ($state == STATE_BODY || $state == STATE_BODY_MAYBE ||
-		 $state == STATE_BODY_WITH_BLANK_LINE) {
-	    process_body($file, $_);
-	} elsif ($state == STATE_INLINE) { # scanning for inline parameters
-	    process_inline($file, $_);
-	} elsif ($state == STATE_PROTO) {
-	    process_proto($file, $_);
-	} elsif ($state == STATE_DOCBLOCK) {
-	    process_docblock($file, $_);
-	}
+        # Hand this line to the appropriate state handler
+        if ($state == STATE_NORMAL) {
+            process_normal();
+        } elsif ($state == STATE_NAME) {
+            process_name($file, $_);
+        } elsif ($state == STATE_BODY || $state == STATE_BODY_MAYBE ||
+                 $state == STATE_BODY_WITH_BLANK_LINE) {
+            process_body($file, $_);
+        } elsif ($state == STATE_INLINE) { # scanning for inline parameters
+            process_inline($file, $_);
+        } elsif ($state == STATE_PROTO) {
+            process_proto($file, $_);
+        } elsif ($state == STATE_DOCBLOCK) {
+            process_docblock($file, $_);
+        }
     }
 
     # Make sure we got something interesting.
     if ($initial_section_counter == $section_counter && $
-	output_mode ne "none") {
-	if ($output_selection == OUTPUT_INCLUDE) {
-	    emit_warning("${file}:1", "'$_' not found\n")
-		for keys %function_table;
-	}
-	else {
-	    emit_warning("${file}:1", "no structured comments found\n");
-	}
+        output_mode ne "none") {
+        if ($output_selection == OUTPUT_INCLUDE) {
+            emit_warning("${file}:1", "'$_' not found\n")
+                for keys %function_table;
+        } else {
+            emit_warning("${file}:1", "no structured comments found\n");
+        }
     }
     close IN_FILE;
 }
 
 
 if ($output_mode eq "rst") {
-	get_sphinx_version() if (!$sphinx_major);
+    get_sphinx_version() if (!$sphinx_major);
 }
 
 $kernelversion = get_kernel_version();
@@ -2395,14 +2389,14 @@ for (my $k = 0; $k < @highlights; $k++) {
 # Read the file that maps relative names to absolute names for
 # separate source and object directories and for shadow trees.
 if (open(SOURCE_MAP, "<.tmp_filelist.txt")) {
-	my ($relname, $absname);
-	while(<SOURCE_MAP>) {
-		chop();
-		($relname, $absname) = (split())[0..1];
-		$relname =~ s:^/+::;
-		$source_map{$relname} = $absname;
-	}
-	close(SOURCE_MAP);
+    my ($relname, $absname);
+    while(<SOURCE_MAP>) {
+        chop();
+        ($relname, $absname) = (split())[0..1];
+        $relname =~ s:^/+::;
+        $source_map{$relname} = $absname;
+    }
+    close(SOURCE_MAP);
 }
 
 if ($output_selection == OUTPUT_EXPORTED ||
@@ -2411,8 +2405,8 @@ if ($output_selection == OUTPUT_EXPORTED ||
     push(@export_file_list, @ARGV);
 
     foreach (@export_file_list) {
-	chomp;
-	process_export_file($_);
+        chomp;
+        process_export_file($_);
     }
 }
 
@@ -2421,10 +2415,10 @@ foreach (@ARGV) {
     process_file($_);
 }
 if ($verbose && $errors) {
-  print STDERR "$errors errors\n";
+    print STDERR "$errors errors\n";
 }
 if ($verbose && $warnings) {
-  print STDERR "$warnings warnings\n";
+    print STDERR "$warnings warnings\n";
 }
 
 if ($Werror && $warnings) {
-- 
2.34.1

