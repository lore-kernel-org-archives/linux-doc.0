Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC4A33ADA9
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 06:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774506041; cv=none; b=SVb2ILKO6KOToqTWn+6umKESUngFKQQqRSVC7cI70I+/sQMA+ESP9EsK2c5jsLhLS7VdKe3wAMDarwLuF4usms/DmB5FlLaj6Woc7fuPOjDp5t8Xjg9TinrTMb8tXiHT24os4qpxtlYIXWN6tM06KeIWYY3wIznCA/fw8zgmHhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774506041; c=relaxed/simple;
	bh=br/jwXyKsOgF8QpG+OEMmn/wjLJg+ymOyi2ueX2+2uA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jR+3MkFBNzgTvi2ONSO34cb0rtmFxz6lcG0YJWF4bklyxoA8ATIMsW1SLhlwKTVzFbVYdlmZCXy8+DLxy36KGkv4g2PZetyVp6TJAdrr8Oqgka/Ox7cyeSJa3jjWcPdupwyl4J5syU19Y0DR8zHCw1lTcPtswXT9cPQFq/K5Qrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Owp7F8af; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Owp7F8af"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-128b9b7e3edso1653754c88.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 23:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774506039; x=1775110839; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VofYlHZ2Eo1t9FKVicPQrSRmzPkyfNodwvF5CvNMdtk=;
        b=Owp7F8afms/+Pn2vqioDtJJxj7hTFuRkb3f37mdZ/ThwYceMufrtLB8U3rtExIs3dF
         81xzx0iF2NCMXx3ZOyRyA+8BktgwVGUkXdWP67CuN6eHcFvwjP2c1oVra+0tdxJAtg/b
         +y5Ej1rrJljJN8yHP2fJnKrZTKZma8OVj/GcbgqNKRAoziuqVRIGzdg3lsHzZlb+U+oB
         +xndyP31pIuUGuZqDij8Nxyzh2eGPwzOskjFIafyn2TnF0bGDLuDFSR+9W3knuMSDfMl
         KBvrh2BqHfHmM6/bZ1A5NTfnVKNxlzx1jxPmUEPCj4IpHrYUw2JiOHSQjVlSEy2Nmc4G
         S53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774506039; x=1775110839;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VofYlHZ2Eo1t9FKVicPQrSRmzPkyfNodwvF5CvNMdtk=;
        b=o9ArGxZYU5gZ1aYGPs/gmmEWpkVDJbYvIE0fIxaO8w6iq/ju+kXR/b+xUkjnr5D6Aw
         HBxrmsmDRgen/NNu5ZK61QaJcUltqeltT4PEwkoNUqpG+mU4BmpR7UkryBysaRrb3lav
         87Jc8zGQP1pSavgX3w6QPzRh1kHNWhaT6Wlfy/4H4S6c0PTwXa2CPhpFARIxJ7uGrHAX
         sj20SSmE9vz7+BMcYFW+LglDfmZiYjBj1u4waSEzMa4T+poHgI90YuGGSG/niSawiDij
         dGB18nSgj4d1dx9kD0VJXcTeOCZjrsHGCoz8icuC4s/72yKBY5tTdYn/GqQjm4cthRrZ
         owQg==
X-Forwarded-Encrypted: i=1; AJvYcCUYVDHaP+qRDajLQRyiJNTE/shPfw8Lp9/jqWH7hvxuEDMIa1kzJU7/XOUh4nXlgcgwEBMVFbuxqII=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5qeCn7Kf+m1pXA9bKsO3/1LvT2MVZbmTFUBINDyjLYv3tqGql
	VJOX8NZbA9zRZucVK2SaGoRAj7Mcp53WMN6poxZVvuYAtSJVfwzXE6Yu
X-Gm-Gg: ATEYQzx6czbBFcZYX5X//aYv4HZriMAEf2CCSzchhothANwwX0Uvz2kEK+xhtWohQUk
	4UriskEmG1t78ubT8TAprYfZ0bUfN7/Lo0dUHaPeV08aEjLZmxAYAIWxNp5Nq9xqOt6ab5a17tF
	SKBAHe+UhqPLaxr96nEhYn5LTmpADuaXyBjB894Qi6OP/wM1mpEgtj666embqXsbDlMaV3R+T5a
	1J5vB1tb6bJE4rbEGtTpsSZgOSN9MSmRkwbaHEZ2PN43Mx2VH3BDVTkT18uJbOZGZ1PBTYPR5j0
	AR7lT4JunJmYpJsqp6UPuLDZWwAD7aTBtofowMVXd9FXDxObs+76tfcq+4k+Km+xbAvjq/U2X+0
	lkO13io/aEnRTRIui+ZL+SSh+ToL1/hwGzH3eDDX0BVvJdmM5Oqae+KsAYDaTVjbBes+6bDz5HE
	oHszXcRGEEsdXS17R1NbDrvUPuWayJZOyd8P+3F6rf+dGRB6sgJIKvYmfmXX95eFgr
X-Received: by 2002:a05:7022:670f:b0:11b:88a7:e1b0 with SMTP id a92af1059eb24-12a96ed3ea0mr4115540c88.26.1774506038953;
        Wed, 25 Mar 2026 23:20:38 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b7b4:352d:eb23:66e5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa762430bsm3051833c88.10.2026.03.25.23.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 23:20:37 -0700 (PDT)
Date: Wed, 25 Mar 2026 23:20:34 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>, 
	Andy Whitcroft <apw@canonical.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] checkpatch: allow correctly handle full files on stdin
Message-ID: <acTPXMJfkHLeItrK@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

checkpatch does not handle full files well when they are passed on
stdin, because it does not know how to treat the text, and whether it is
a C file, or a DTS file, or something else, and so it assumes that when
it works with stdin it should be a unified diff. For full files it
expects to have a file name as an argument and read the contents from
disk. Unfortunately this does not well when trying to use checkpatch as
an online linter and feed it contents of an editor buffer that have not
made it to the disk yet.

To solve the above introduce a new optional argument --stdin-filename=FILE
that allows tell checkpatch the kind of file it is dealing with and
apply appropriate set of checks and rules to it.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 Documentation/dev-tools/checkpatch.rst |  4 ++++
 scripts/checkpatch.pl                  | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index dccede68698c..b521e3ca6ebf 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -68,6 +68,10 @@ Available options:
 
    Show the diffed file position instead of the input file position.
 
+ - --stdin-filename
+
+   When using stdin, identify the file as FILE.
+
  - -g,  --git
 
    Treat FILE as a single commit or a git revision range.
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e56374662ff7..e26951ceb36b 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -57,6 +57,7 @@ my %ignore_type = ();
 my @ignore = ();
 my $help = 0;
 my $configuration_file = ".checkpatch.conf";
+my $stdin_filename;
 my $max_line_length = 100;
 my $ignore_perl_version = 0;
 my $minimum_perl_version = 5.10.0;
@@ -94,6 +95,7 @@ Options:
   --emacs                    emacs compile window format
   --terse                    one line per report
   --showfile                 emit diffed file position, not input file position
+  --stdin-filename=FILE      when using stdin, identify the file as FILE
   -g, --git                  treat FILE as a single commit or git revision range
                              single git commit with:
                                <rev>
@@ -323,6 +325,7 @@ GetOptions(
 	'showfile!'	=> \$showfile,
 	'f|file!'	=> \$file,
 	'g|git!'	=> \$git,
+	'stdin-filename=s' => \$stdin_filename,
 	'subjective!'	=> \$check,
 	'strict!'	=> \$check,
 	'ignore=s'	=> \@ignore,
@@ -2652,6 +2655,10 @@ sub is_userspace {
 sub process {
 	my $filename = shift;
 
+	if ($filename eq '-' && defined($stdin_filename)) {
+		$filename = $stdin_filename;
+	}
+
 	my $linenr=0;
 	my $prevline="";
 	my $prevrawline="";
@@ -2891,6 +2898,10 @@ sub process {
 			$realfile =~ s@^([^/]*)/@@ if (!$file);
 			$in_commit_log = 0;
 
+			if ($realfile eq "-" && defined($stdin_filename)) {
+				$realfile = $stdin_filename;
+			}
+
 			$p1_prefix = $1;
 			if (!$file && $tree && $p1_prefix ne '' &&
 			    -e "$root/$p1_prefix") {
-- 
2.53.0.1018.g2bb0e51243-goog


-- 
Dmitry
