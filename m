Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9618B333442
	for <linux-doc@vger.kernel.org>; Sun,  8 Mar 2026 11:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772968418; cv=none; b=IZPELeSv6uHekfRmNncTYtx1Bp4NmP+5coQSVOn2DtH2OhuRDXORYjmG6YijF76MlDBQ27nEvkTD5tUNneywYywe9zs0bnHD1E6CpPmfMutv/TQiCsX2ZWQI0Hx0MQ/hU6aZS0HfrAK4NveEOFXQ7ey3vhEvXk9UYscBcnHNRGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772968418; c=relaxed/simple;
	bh=rUIInd5K6kOACS1tWqup7nK+dUyf7CQRanumz9cLbow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UzxHC8BMg4hJvZH5TwY207aVzJQCLIHUUi5NU4QYD+USakY8osP43mpURV4fT6GqecrAZ5jQav3eRKLKELFLY08UdpuHOuOLvTMAhwtoXhDtiZvqfTJgWihhLbE8lvG4mEB0TaYQKu5T4CRIfjdIbljIY3a516R1dQvWxi2T8ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WpSJHO1J; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpSJHO1J"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-829a568f3ccso975638b3a.0
        for <linux-doc@vger.kernel.org>; Sun, 08 Mar 2026 04:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772968416; x=1773573216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e9z7EGgDIs51XBH02ZmG5zUVGonDeGX7qmX1TqKhzyE=;
        b=WpSJHO1JrXYekFDqyC5VD72EDLcCfYjntUJEPu1mJ/RJ/37ruTJmSkxq75WJh4lieZ
         JsuP9N9xEx9kw3AMZirNlKuFcbeVIzgpFjign4FRx2/ECLw1FlV3uwgIG0dvOrKVoLmY
         ibvSpBf+YBc9V6PYWPdrO48NAvedbrpUyuSPshG1giwxzPSpALMm+DeBPY4xi1aD43lo
         0LK7Hr0m1uN4Iu6Qi2A4/cbsuPXzbUSCF10B3/y/bVfsNBlE6IQYRtRQUpxtBqYg6ey6
         /PVpjXpwgLURr0gO4xzuTGooAOh3auJ2EIO3mr24SP805QobLoHFhvOyX9iC9qiivAu1
         eCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772968416; x=1773573216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9z7EGgDIs51XBH02ZmG5zUVGonDeGX7qmX1TqKhzyE=;
        b=O6lSgMDIRO2gbCZtbFbXkWBqfVUqn/mSw+9wMFKLiU50scwxCQNkGXKrTV4imum/a/
         0DFlNz4U4Dgz5XdTMAQyzFqaZj3VLhALOCxhrzrM42U7D5HyF031L+6sXXzad7Ds8uiy
         01/UC15gjXu9ecbaStrUZwPVhNICiiKFgAgUMv1nyt/QhnU3O7iGjk4qHJYUNbeLruBo
         E/4Dpyzd2GFGbkIsXb+GCLsLZqMAJB4AhN430LA6fG75e1CsUK1FWW268t0vQJ0ntqTP
         NBVCrIVn7zbw4lXPQlz/Rn/s3uDRzAYPt70HzYS1o+9H/neHl+kzB7678a9AcQ2yxN5A
         zNQw==
X-Forwarded-Encrypted: i=1; AJvYcCX7kcDdO0ZDm/trJYofRDuWqpJC22rZay0BX6M0w3PodPGVSbovLsLgmKrutwM8ILjaN6iOaksHh1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnI2y7oKx2Lc4PRzemG0feVQFM+1YC78qUxn11EXtl41A9tisy
	jfuztGcihS5CT2mtQ0xCZ5IxZl9nevSSOwAp5bJxljmz6oVobAymIJgd
X-Gm-Gg: ATEYQzz3wWwfEMbXI43M3s2frBvA5Kb9RcclqxaLigDpBkE4KAE1ltcrKSEli2D3M7G
	HNZsH8RwfqJwnpqL2zM8GfMOaULamPu46qnr2n0aIbvH8UmRjyWYEhjPbBoOE9GwKDNuDwqJg+j
	ZpivphfWCvn1c07tWbEyRYsdAH3ghCeoEQOrSLNSyG6xtnQl+4dwx9JxUarR/nmXoJHZCZpTyQY
	3UPe702soC4ffx65KTp3Y5CRjZYY7v9UZvN1POpmzu3tzgVpkVZJ65/YX4SWHA5sc1TK0APpMNp
	iocIDZjPXoMTE6B+wyni9MUnhS8G8du7e7S7Vdtho+3KJLnjuEKKUK2oD4JaY+V9fETYVpLSrV8
	rNPZDwEt8l3XRU5pA3OIR9Ncw8RAsw4j9yk0H7R2+80+Y0aQn2IeLe1jSmwwKy5ld+sshQmIbo+
	COSkO9wopn3Vd24rcC0QnnjVysh+ERxMzHW3dlb1Ni
X-Received: by 2002:a05:6a00:7444:b0:827:3c74:e6a6 with SMTP id d2e1a72fcca58-829a30b9fd6mr5378887b3a.58.1772968415956;
        Sun, 08 Mar 2026 04:13:35 -0700 (PDT)
Received: from russ.ust.hk (wf121-083.ust.hk. [175.159.121.83])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a46369d3sm6923755b3a.2.2026.03.08.04.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 04:13:35 -0700 (PDT)
From: Haoyang LIU <tttturtleruss@gmail.com>
To: Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: Haoyang LIU <tttturtleruss@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] tools/docs/checktransupdate.py: add support for scanning directory
Date: Sun,  8 Mar 2026 19:13:13 +0800
Message-ID: <20260308111314.27333-1-tttturtleruss@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Origin script can only accept a file as parameter, this commit enables
it to scan a directory.

Usage example:
./scripts/checktransupdate.py Documentation/translations/zh_CN/dev-tools

And it will output something like:
"""
[1772967203.351603] Documentation/translations/zh_CN/dev-tools/kmemleak.rst
[1772967205.074201] commit 7591c127f3b1 ("kmemleak: iommu/iova: fix transient kmemleak false positive")
[1772967205.074337] 1 commits needs resolving in total

[1772967205.301705] Documentation/translations/zh_CN/dev-tools/index.rst
[1772967206.912395] commit a592a36e4937 ("Documentation: use a source-read extension for the index link boilerplate")
[1772967206.921424] commit 6eac13c87680 ("Documentation: dev-tools: add container.rst page")
[1772967206.930220] commit 8f32441d7a53 ("Documentation: Add documentation for Compiler-Based Context Analysis")
[1772967206.939002] commit 1e9ddbb2cd34 ("docs: Pull LKMM documentation into dev-tools book")
[1772967206.948636] commit d5af79c05e93 ("Documentation: move dev-tools debugging files to process/debugging/")
[1772967206.957562] commit d5dc95836147 ("kbuild: Add Propeller configuration for kernel build")
[1772967206.966255] commit 315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
[1772967206.966410] 7 commits needs resolving in total
"""

Signed-off-by: Haoyang LIU <tttturtleruss@gmail.com>
---
 tools/docs/checktransupdate.py | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tools/docs/checktransupdate.py b/tools/docs/checktransupdate.py
index bf735562aeeb..b0bc61f958cf 100755
--- a/tools/docs/checktransupdate.py
+++ b/tools/docs/checktransupdate.py
@@ -13,6 +13,8 @@ The usage is as follows:
 This will print all the files that need to be updated or translated in the zh_CN locale.
 - tools/docs/checktransupdate.py Documentation/translations/zh_CN/dev-tools/testing-overview.rst
 This will only print the status of the specified file.
+- tools/docs/checktransupdate.py Documentation/translations/zh_CN/dev-tools
+This will print the status of all files under the directory.
 
 The output is something like:
 Documentation/dev-tools/kfence.rst
@@ -262,7 +264,7 @@ def main():
         help='Set the logging file (default: checktransupdate.log)')
 
     parser.add_argument(
-        "files", nargs="*", help="Files to check, if not specified, check all files"
+        "files", nargs="*", help="Files or directories to check, if not specified, check all files"
     )
     args = parser.parse_args()
 
@@ -293,6 +295,17 @@ def main():
                 if args.print_missing_translations:
                     logging.info(os.path.relpath(os.path.abspath(file), linux_path))
                     logging.info("No translation in the locale of %s\n", args.locale)
+    else:
+        # check if the files are directories or files
+        new_files = []
+        for file in files:
+            if os.path.isfile(file):
+                new_files.append(file)
+            elif os.path.isdir(file):
+                # for directories, list all files in the directory and its subfolders
+                new_files.extend(list_files_with_excluding_folders(
+                    file, [], "rst"))
+        files = new_files
 
     files = list(map(lambda x: os.path.relpath(os.path.abspath(x), linux_path), files))
 
-- 
2.53.0

