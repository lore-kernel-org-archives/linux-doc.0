Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5A34503C
	for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 05:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728882823; cv=none; b=svN3vUr7+599d0SQCjb5D/ZQWm/Agfjur2KsmasirimEVoyZfRSM5vg6WuSlRvJT0d7b1fNe19vOCqRnLponf9LofboeM1QnHe7MXcCzYDRS3pfRbdr05jIY49t8GXhRID8qrQs9CX8JHbE9fvNfuAKZdRH5MDu8EOb2AZ4Ngfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728882823; c=relaxed/simple;
	bh=3j7ERH+mwCvG0yixKOy8DfHPvu2DQBuJR/jf9JlU4FA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LDbCcwBjVWTVMVSOL+lHcbg0hVZB8wJt5or3YpBJvvVFiOtnk8oe/xSh7nAsLWA9ouhC9S3QJKCLJA52k6wSNL+5ICykYHycMQwtnPmrnx1X4ZpqlnfhR3c/QG4hU/EmRC0KzxUJVtZY39WwXoK9kNfy4h05/ubk3ZVb2kAL6i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lV4nuwKz; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lV4nuwKz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=KzR83XssF18MdAbOwrWkBJHis6/BApcXlB4bMG1wrmI=; b=lV4nuwKzfdGWmmmLWwSXrAETq0
	3gs/pCs6GjXPRMsRL3NEo3NX9+2nMu1fRVwCl/8qjGk0LxFakC4yDcNUNpxqpUzQO1z+9w21LMh+Z
	g2lyOiJmJTnZKXxKWM9MRpt8/+EpVzUQokqi/JpEVX3+zhruVa6m+CQruFJcMTFBxgYgiIHyayqCQ
	6h5d6meIutWK/1RnWF1JGOGJWB+C40jvtrVnwhin70tM71eqaE27TDb9VM9zOblnhgvgdyYkelOMM
	j+lHL4Rh/Hr1GXWI3SD+CKgR66G9OB5TIjzw/5Sl55lKtiyfVZSy2EraYKzd74Rn5q2t787MUguje
	pzyBZR4g==;
Received: from [50.53.2.24] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t0DOj-00000003lQP-0mXR;
	Mon, 14 Oct 2024 05:13:37 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Horia Geanta <horia.geanta@freescale.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: [RFC] kernel-doc: allow object-like macros in ReST output
Date: Sun, 13 Oct 2024 22:13:33 -0700
Message-ID: <20241014051333.462847-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

output_function_rst() does not handle object-like macros. It presents
a trailing "()" while output_function_man() handles these macros
correctly.

Update output_function_rst() to handle object-like macros.
Don't show the "Parameters" heading if there are no parameters.

For output_function_man(), do show the "ARGUMENTS" heading if there
are no parameters.

I have tested this quite a bit with my ad hoc test files for both ReST
and man format outputs. The generated output looks good.

However, I am seeing one problem that I don't have any idea about and
would appreciate some assistance, even just email commentary about it.
The output now includes around 100 warnings like these examples:

Documentation/core-api/mm-api:37: ../include/linux/slab.h:154: WARNING: Inline literal start-string without end-string. [docutils]
Documentation/core-api/mm-api:37: ../include/linux/slab.h:192: WARNING: Inline literal start-string without end-string. [docutils]

and
Documentation/driver-api/device-io.rst:: ERROR: Anonymous hyperlink mismatch: 16 references but 0 targets.
See "backrefs" attribute for IDs. [docutils]

Does this mean that I am now generated some garbage and feeding it to
docutils?

Fixes: cbb4d3e6510b ("scripts/kernel-doc: handle object-like macros")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Horia Geanta <horia.geanta@freescale.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Vlastimil Babka <vbabka@suse.cz>
---
Cc: linux-doc@vger.kernel.org

 scripts/kernel-doc |   35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

--- linux-next-20241009.orig/scripts/kernel-doc
+++ linux-next-20241009/scripts/kernel-doc
@@ -569,6 +569,8 @@ sub output_function_man(%) {
     my %args = %{$_[0]};
     my ($parameter, $section);
     my $count;
+    my $func_macro = $args{'func_macro'};
+    my $paramcount = $#{$args{'parameterlist'}}; # treat -1 as 0
 
     print ".TH \"$args{'function'}\" 9 \"$args{'function'}\" \"$man_date\" \"Kernel Hacker's Manual\" LINUX\n";
 
@@ -600,7 +602,9 @@ sub output_function_man(%) {
         $parenth = "";
     }
 
-    print ".SH ARGUMENTS\n";
+    if ($paramcount = $#{$args{'parameterlist'}} > 0) {
+    	print ".SH ARGUMENTS\n";
+	}
     foreach $parameter (@{$args{'parameterlist'}}) {
         my $parameter_name = $parameter;
         $parameter_name =~ s/\[.*//;
@@ -822,10 +826,13 @@ sub output_function_rst(%) {
     my $oldprefix = $lineprefix;
 
     my $signature = "";
-    if ($args{'functiontype'} ne "") {
+    my $func_macro = $args{'func_macro'};
+    my $paramcount = $#{$args{'parameterlist'}}; # treat -1 as 0
+
+	if ($func_macro) {
+        $signature = $args{'function'} . " ";
+	} else {
         $signature = $args{'functiontype'} . " " . $args{'function'} . " (";
-    } else {
-        $signature = $args{'function'} . " (";
     }
 
     my $count = 0;
@@ -844,7 +851,9 @@ sub output_function_rst(%) {
         }
     }
 
-    $signature .= ")";
+    if (!$func_macro) {
+    	$signature .= ")";
+    }
 
     if ($sphinx_major < 3) {
         if ($args{'typedef'}) {
@@ -890,7 +899,9 @@ sub output_function_rst(%) {
     #
     print ".. container:: kernelindent\n\n";
     $lineprefix = "  ";
-    print $lineprefix . "**Parameters**\n\n";
+	if ($paramcount > 0) {
+   		print $lineprefix . "**Parameters**\n\n";
+    }
     foreach $parameter (@{$args{'parameterlist'}}) {
         my $parameter_name = $parameter;
         $parameter_name =~ s/\[.*//;
@@ -1704,7 +1715,7 @@ sub check_return_section {
 sub dump_function($$) {
     my $prototype = shift;
     my $file = shift;
-    my $noret = 0;
+    my $func_macro = 0;
 
     print_lineno($new_start_line);
 
@@ -1769,7 +1780,7 @@ sub dump_function($$) {
         # declaration_name and opening parenthesis (notice the \s+).
         $return_type = $1;
         $declaration_name = $2;
-        $noret = 1;
+        $func_macro = 1;
     } elsif ($prototype =~ m/^()($name)\s*$prototype_end/ ||
         $prototype =~ m/^($type1)\s+($name)\s*$prototype_end/ ||
         $prototype =~ m/^($type2+)\s*($name)\s*$prototype_end/)  {
@@ -1796,7 +1807,7 @@ sub dump_function($$) {
     # of warnings goes sufficiently down, the check is only performed in
     # -Wreturn mode.
     # TODO: always perform the check.
-    if ($Wreturn && !$noret) {
+    if ($Wreturn && !$func_macro) {
         check_return_section($file, $declaration_name, $return_type);
     }
 
@@ -1814,7 +1825,8 @@ sub dump_function($$) {
                             'parametertypes' => \%parametertypes,
                             'sectionlist' => \@sectionlist,
                             'sections' => \%sections,
-                            'purpose' => $declaration_purpose
+                            'purpose' => $declaration_purpose,
+							'func_macro' => $func_macro
                            });
     } else {
         output_declaration($declaration_name,
@@ -1827,7 +1839,8 @@ sub dump_function($$) {
                             'parametertypes' => \%parametertypes,
                             'sectionlist' => \@sectionlist,
                             'sections' => \%sections,
-                            'purpose' => $declaration_purpose
+                            'purpose' => $declaration_purpose,
+							'func_macro' => $func_macro
                            });
     }
 }
