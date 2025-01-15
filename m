Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1283F78F4C
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 15:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736955212; cv=none; b=LX9/TnbQ0ofC/2lYbPrDED2q4Vl/X3kLTEkgUU2LiRwcu6bnSqAZRyqMP0eEipHtTtoAd+m4+befeLDI7zlv1D67fIAK8+UZF3eTXgftIREAM8hs+7tvf8EIvdxuAHKclnximWDOZOt7m7VNNVUb6SslH5KJODwpe4K/hamOWKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736955212; c=relaxed/simple;
	bh=dIIWMhXFshwK0c8HjNy74unEM10fKpL9De0DaDB8PYc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DgaIdMHHXjtuNaKnLNj8FG4zXcvRpceecBLM8/ZKVPnZ66NZMY2NwSdIatTOG4eqgpDoZYnFSxktdQZWtBXWdjHuxgJUf6x/v6hqBgjEUr1m4yffdIe0hR1/iQCciO44F8Pp++H82+TzqkHzudAuFJgLdPKMElSI4iAw7s7Fn68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K6+ohymi; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K6+ohymi"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-38a35a65575so4960885f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 07:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736955209; x=1737560009; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hb5nIvWb71zdixZrhCvXh2iRHQbvKVO57HrQVmjQSXE=;
        b=K6+ohymizA6SWvlPusW32Gnlo5VHljYj+F9MNhx2JU/vKBFW6Su+9hIVguUuADuxEO
         XJvInhg6/8rV7neUk1jSN3VUsPr3/wKzQMoAGGDbVScI3pWRsk4JrQQfijb8LC3fhPeN
         cGwdlXbRTP/zT0sB2MhcMlx//M1TlEoi3ZDpXHNi44SEe75vjUn/K8HS2xQ58UfhwceN
         jDQSm7+Exby7VIArzFP79Q4qII7ge4EdIm4foNIQG/B1Gxi4cFbukraXXj2G9NXrJtfa
         U+1lXcetputKaQsOp349ICHYZXlE61/SpgtmlWicDvUC8ADsdEFtbH7keVy7onpHn8XI
         Kcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736955209; x=1737560009;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hb5nIvWb71zdixZrhCvXh2iRHQbvKVO57HrQVmjQSXE=;
        b=Jru6NPYzaZu2vGi+rZY7APO0083FSf3BmxUl9EwtZVsIWgrDvcbMKpkgD/6gss5Pa8
         qmkR6KWymP+iwT41xJCMty6uLUjJB8ngXvNdX+08nsh4ZDkM3dP0Dqsj4RJqXqOw87Zr
         GQbffkT+zdFwTZD4z+BP5iWTghbsZXdOmgCKxvJ7SJRO2bD48iH+Tii9Id2jf2VydFFx
         uBH+3HvGWlpHLMzbJTQaLbjdQVZT9PPcQJvWsV9OYbmrY2/NtcF2rNfUv085to2Ivsrk
         CdDzkEjDQ0dDxwKmY+cLTrvOwJVlhuKvRIVyu/AtHSHwtkMqmqDlbgpnLEEfEd7rv4z0
         fsVw==
X-Forwarded-Encrypted: i=1; AJvYcCWgZSgyKS0WBvlPEYYBnkGarlk3QvyckTHGxX+4vPu1+J8RCEyAEhcsP6lW3sP4Wo/j8z3DBJ4FiLE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbtkG8XHWF339qivbVEzInjb/CghJBwWs7/JJBJtfGcuAOQNJ1
	mqQPbQOq/YxWwhIfUfre+bAmcSWQl6Vgkhf/4DAbW2sNQ7+bUncydyOGQXUbfbiX+FXmpXkIBH0
	qGDkDFdWtQQ==
X-Google-Smtp-Source: AGHT+IEOG/8ZYybzXMLqp4IPj8wc7/hNOUswEq3NyYE3RGEusCYfw84ucZSBSOkJU0GLZHB1mGHoEx2594mIRw==
X-Received: from wmpz18.prod.google.com ([2002:a05:600c:a12:b0:434:ff52:1c7])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1ac6:b0:38b:da34:5915 with SMTP id ffacd0b85a97d-38bda34591bmr12849093f8f.23.1736955209523;
 Wed, 15 Jan 2025 07:33:29 -0800 (PST)
Date: Wed, 15 Jan 2025 15:33:21 +0000
In-Reply-To: <20250115-checkpatch-ignore-v2-0-8467750bf713@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250115-checkpatch-ignore-v2-0-8467750bf713@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250115-checkpatch-ignore-v2-1-8467750bf713@google.com>
Subject: [PATCH v2 1/2] checkpatch: Add support for checkpatch-ignore notes
From: Brendan Jackman <jackmanb@google.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

Checkpatch sometimes has false positives. This makes it less useful for
automatic usage: tools like b4 [0] can run checkpatch on all of your
patches and give you a quick overview. When iterating on a branch, it's
tiresome to manually re-check that any errors are known false positives.

This patch adds a mechanism to record alongside the patch that it might
produce certain checkpatch errors, and that these are expected false
positives. There are two aspects to this mechanism:

1. If a block like:

   Notes (checkpatch-ignore):
     FOO,BAR
     BAZ

   Is found before the diff in the patch content, FOO, BAR and BAZ error
   types are ignored while processing this file.

   Its expected that users put this in the "graveyard" i.e. the region
   between the --- and the beginning of the diff.

2. --notes=checkpatch-ignore is added to the `git format-patch`
   command that checkpatch.pl uses in --git mode, so that if the commit
   being inspected has a note [1] under the checkpatch-ignore ref, it
   will be formatted into a block like the one above.

To avoid significant reworks to the Perl code, this is implemented by
mutating a global variable while processing each patch. (The variable
name refers to a patch as a "file" for consistency with other code).

Because the main loop in process() begins to emit errors before it has
necessarily processed the checkpatch-ignore block, this parsing is done
separately in its own loop.

[0] b4 - see "--check" arg
    https://b4.docs.kernel.org/en/latest/contributor/prep.html

[1] https://git-scm.com/docs/git-notes

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---

Notes (checkpatch-ignore):
    EMAIL_SUBJECT

 scripts/checkpatch.pl | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9eed3683ad76caffbbb2418e5dbea7551d374406..ce6914a845ec3f936ad656fa123f58aa85ce4b2f 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -53,7 +53,10 @@ my %debug;
 my %camelcase = ();
 my %use_type = ();
 my @use = ();
+# Error types to ignore during the whole invocation.
 my %ignore_type = ();
+# Error types to be ignored in the present "file" (i.e. patch).
+my %file_ignore_type = ();
 my @ignore = ();
 my $help = 0;
 my $configuration_file = ".checkpatch.conf";
@@ -1306,7 +1309,7 @@ for my $filename (@ARGV) {
 	my $oldfile = $file;
 	$file = 1 if ($is_git_file);
 	if ($git) {
-		open($FILE, '-|', "git format-patch -M --stdout -1 $filename") ||
+		open($FILE, '-|', "git format-patch --notes=checkpatch-ignore -M --stdout -1 $filename") ||
 			die "$P: $filename: git format-patch failed - $!\n";
 	} elsif ($file) {
 		open($FILE, '-|', "diff -u /dev/null $filename") ||
@@ -2329,7 +2332,7 @@ sub show_type {
 
 	return defined $use_type{$type} if (scalar keys %use_type > 0);
 
-	return !defined $ignore_type{$type};
+	return !defined $ignore_type{$type} && !defined $file_ignore_type{$type};
 }
 
 sub report {
@@ -2624,6 +2627,29 @@ sub exclude_global_initialisers {
 		$realfile =~ m@/bpf/.*\.bpf\.c$@;
 }
 
+# Parse the "Notes (checkpatch-ignore):" block in the region before the diff,
+# and set file_ignore_type accordingly.
+sub parse_checkpatch_ignore {
+	my $linesRef = shift;
+	my $in_checkpatch_ignore = 0;
+
+	foreach my $line (@$linesRef) {
+		# have we reached the actual diff?
+		if ($line =~ /^diff --git.*?(\s+)$/ || $line =~ /^\+\+\+\s+(\s+)/) {
+			last;
+		}
+
+		if ($in_checkpatch_ignore) {
+			if ($line =~ /^\s*$/) {
+				last;
+			}
+			hash_save_array_words(\%file_ignore_type, [$line]);
+		} elsif ($line =~ /^Notes \(checkpatch-ignore\):\s*/) {
+			$in_checkpatch_ignore = 1;
+		}
+	}
+}
+
 sub process {
 	my $filename = shift;
 
@@ -2701,6 +2727,8 @@ sub process {
 
 	my $checklicenseline = 1;
 
+	%file_ignore_type = ();
+
 	sanitise_line_reset();
 	my $line;
 	foreach my $rawline (@rawlines) {
@@ -2780,6 +2808,8 @@ sub process {
 		}
 	}
 
+	parse_checkpatch_ignore(\@lines);
+
 	$prefix = '';
 
 	$realcnt = 0;

-- 
2.48.0.rc2.279.g1de40edade-goog

