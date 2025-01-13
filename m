Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1CB1FBBCE
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 16:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736784282; cv=none; b=ZPj1bLBExrLguazJX2dPOFa6grGoFgJP95AodhUkh79LqtD8AjsFp7CVnbIUZaXPk4tDLJHxUia81MR8FY6F+X3xDvdFRP9Mo4hbUkn5XsWU4AcbNfJ67/YfmIaonZh0bA+TZqey5nyC3wYVhFIybkVz/cYfo4OnotwoO+gHiHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736784282; c=relaxed/simple;
	bh=fjoK8HDLW422WKVfz9YDN5UtTY/6nLQ7+L3SwllBF+s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VseqGgfCAZQetrSwB6QLH8uUvNINTt5sQJcO4j7y06+CBW+Jjn3oJ62burscd2+lpb66N2HpoCX+BOBfr9fgdc07OlGMqLa8TktNJJC/nwt/fo0E9JjsN/k20Ln3b+hh4tSVVqcqGKqP+sNk14wV9Xh7d34Aix6qFcyC5CU9JMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NHa8PAov; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NHa8PAov"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-436289a570eso10158555e9.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 08:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736784279; x=1737389079; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S8y1PZN0G4pk+w7VtcCO+G6q3QRt0PKx+t9418hnYUk=;
        b=NHa8PAovyeokZwDeIqUvpXzaP4+5Fs5LfvLnxKGPuDscPrapZY+tXKtSAQo2fGU5OH
         WNR7xaX18R7uwKDZtULkNUBB6XGcyTrBKL4VMCGmolEbiFMR0J5NrezPo6mFNanDNEfO
         /8iI63sWEfvUrd/8uS/ciemSUxeSc3C/quz99SsMsOnli84fRiFbJVSQGW01gbo1CXNd
         mD6u7XfAuvfhhvO9z20LQA0/6dX0QmhgnyHdMYURLj6sS2aqtrS2x7t1SDLLHBHurt8K
         XxDL/tAzXHTzeYsRCae4ieV5Iwppf4uK77xDzg3K0qZYpDmKSl1/NgRZsTPHj6U0oz2x
         Ql3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736784279; x=1737389079;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S8y1PZN0G4pk+w7VtcCO+G6q3QRt0PKx+t9418hnYUk=;
        b=bjaBvGtrVjvKJnQtyiUx1wTAt1+hKnvW7y6mf1cC+JfHVGZv062xws0eINmCUcMUnT
         lAaHywIoj1lIfLHmzf+mloHWvZuk6VgWbKKpMeob3XSa7h4CiY0e8tJVO3B3W/p4rzG+
         IG/IbFwSHdnrw6BY2dCoV3TgXY/xs7dfB9GiBH7+xuIRPBK26yB0AMsQEPeDHZNR3LDT
         LFheKLwosbm/T4G0oRuPu/v7ugsgdEhlPr45KdpKQP9ou2PDyS8lZniXoGdAr0mCIbHn
         9dkO3ejag4KtaOIGiEe6XWxi8/q2+n6Wq/l0NRJEw8Rptq4qt7LMFCtzUeH3cvLe7oRk
         lc+A==
X-Forwarded-Encrypted: i=1; AJvYcCVzfs/69uOX2x90pxjwIKV+PZtWirCVvX/7ILiY7e0AyaB1ZTp4GVLt61TAUBFnpX4FAJrsTt+QF8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpfC08AB8voZsPvNUfUyF3rqJqXgExAoHs0SxNcrNDuszEoOfm
	UlAh0dptV9zyKnLdHqTffwSGezYDd7nkWcxabcPJ9tJ9/Zor5cgGptZBJTDVvCo8xm7YaUJqm3A
	kKQENzTLpkw==
X-Google-Smtp-Source: AGHT+IFYcZCoaeUHv6rBIzCBnC3FVVEjyVmDlqKB5Jndi+mfmsYTXA3gI+zZzg3vJ6Zix8ZVZx9PvMSnBG4kaw==
X-Received: from wmjv9.prod.google.com ([2002:a7b:cb49:0:b0:434:f173:a51])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:54c5:b0:431:557e:b40c with SMTP id 5b1f17b1804b1-436e3fb231cmr176144475e9.27.1736784279343;
 Mon, 13 Jan 2025 08:04:39 -0800 (PST)
Date: Mon, 13 Jan 2025 16:04:22 +0000
In-Reply-To: <20250113-checkpatch-ignore-v1-0-63a7a740f568@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250113-checkpatch-ignore-v1-0-63a7a740f568@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250113-checkpatch-ignore-v1-1-63a7a740f568@google.com>
Subject: [PATCH 1/2] checkpatch: Add support for Checkpatch-ignore patch footer
From: Brendan Jackman <jackmanb@google.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

Checkpatch sometimes has false positives. This makes it less useful for
automatic usage: tools like b4 [0] can run checkpatch on all of your
patches and give you a quick overview. When iterating on a branch, it's
tiresome to manually re-check that any errors are known false positives.

This patch adds a feature to record in the commit message that a patch
might produce a certain checkpatch error, and that this is an expected
false positive. Recording this information in the patch itself can also
highlight it to reviewers, so they can make a judgment as to whether
it's appropriate to ignore.

To avoid significant reworks to the Perl code, this is implemented by
mutating a global variable while processing each patch. (The variable
name refers to a patch as a "file" for consistency with other code).

This feature is immediately adopted for this commit itself, which
falls afoul of EMAIL_SUBJECT due to the word "checkpatch" appearing in
the "Checkpatch-ignore" reference in the title - a good example of a
false positive.

[0] b4 - see "--check" arg
    https://b4.docs.kernel.org/en/latest/contributor/prep.html

Checkpatch-ignore: EMAIL_SUBJECT
Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 scripts/checkpatch.pl | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9eed3683ad76caffbbb2418e5dbea7551d374406..1a2ae442068d870903d46bd2dc63b757609e142d 100755
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
@@ -2329,7 +2332,7 @@ sub show_type {
 
 	return defined $use_type{$type} if (scalar keys %use_type > 0);
 
-	return !defined $ignore_type{$type};
+	return !defined $ignore_type{$type} && !defined $file_ignore_type{$type};
 }
 
 sub report {
@@ -2701,6 +2704,8 @@ sub process {
 
 	my $checklicenseline = 1;
 
+	%file_ignore_type = ();
+
 	sanitise_line_reset();
 	my $line;
 	foreach my $rawline (@rawlines) {
@@ -2778,6 +2783,10 @@ sub process {
 		if ($setup_docs && $line =~ /^\+/) {
 			push(@setup_docs, $line);
 		}
+
+		if ($line =~ /^Checkpatch-ignore:\s+(.*)/) {
+			hash_save_array_words(\%file_ignore_type, [$1]);
+		}
 	}
 
 	$prefix = '';

-- 
2.47.1.613.gc27f4b7a9f-goog

