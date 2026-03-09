Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1CE376BE4
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 09:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773050320; cv=none; b=hKXvPLjue5o+qEzyXyFEii2xf3CtMWJC+WiLI342IR3Qk1JxOPmTvDQs4HtfYC+lQLb+LeVIF13TTg4acBddGOqPpSiby0YkCSVHedM8x5kJeLiOAZdt4uSx3Jk7TZsywLCYcXb4SXp5ZJ1E2yYUx/SfGUBvlgjNsrzR0Jgx0MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773050320; c=relaxed/simple;
	bh=HFUCoglJbXbiR8kUrCXuOUU8Xmz7mxY7BJqznpbLkm0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KM5Xq6+i8BgVzMDvd7mX9EzDQBM9osPuLCAT5wIUFrONiAJz9kf6SlyOm5xdMqO4KSirH0nH684yLA6nGafztMVbH0LuitSXtu2o1ppMQLe7r2RoVDSN5ktiUOzCMEbrr7ZUqyyxeFclTmt5rx/OTy8fAk36kqa3kStKqO3jOOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EOPQDGZ+; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EOPQDGZ+"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ae43042ea7so91249355ad.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 02:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773050319; x=1773655119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Yvkz94goFK1X6HfxlloW5SpPhXOJ/hm+dKJ/2I7lmU=;
        b=EOPQDGZ+XBZOawrpIts+mBeBTf12QehaJYAy4j+89Th+rfFKzemhpSpeqyGnDzmfNB
         h0BrNTP3Z96yBXLiWI4Pf1RjOtrYTzJaqo1jJJP/0Z9XMQoQeC/CGCw88ofJxtqPK2iI
         NMophoBE8DPXxac4wC5Z7m1QeIiNoe528rRpETojyh2KT5H9amklzANgPdV8Y7qL63nU
         UoSOzctQDkyLXxnQEdjaZJITUvhihbfIBexWquQ5nYjLmf8GvJdDpghOyAZ7rvXPurUD
         KFUxsYsjt7xD4MMqzP+QvgaWLZGHNOGe8Fmpf9nu/hWavqfXBjkguXRLpjFELoKaWUgs
         y+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773050319; x=1773655119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Yvkz94goFK1X6HfxlloW5SpPhXOJ/hm+dKJ/2I7lmU=;
        b=IVGaDfPCyAO8Q32LjGY4Ee2V/RgVN4yShqd/QiypGzo8BT6TKRMwxyWaZqBxnl/DBu
         zqhbTHW0xLZYelpNyAMdmeijBX5HFdXi9Qwz30aBTkIveJRMmBHP8NiNc+UmePncek9E
         koEbPA0FcjTkibpV4ma4da6l6zZXJJEOmAz5zfMbhJGemuPzgKQkoqo01XbFO4tRZfa0
         Q4ENL1L3qptoI+hkq4RYATHawdqn5ommZOmhfMsxvin+bBAKy5FqFUhk0vC+K9nzOGTY
         OkqxOLIyxmD9L83CqqwuDiKU5QVDDxX77DrbfPiHHJvptxpMbIrdKnRO1Jtp4j7eZTAF
         RvVg==
X-Forwarded-Encrypted: i=1; AJvYcCUmkVkQ5VQqFjuH0/Y3utmfR2zoOXzs4kOLdrp/rKX/8wphRqH6FP43ZppRwEag2NwCQ4dFau90VJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzruqTWCaQcJ5d1dOfksnGjlEgx52q9JeDhQ18w/kpD2YBpRjOQ
	ZLeFTyQoOO7ODXJx7gycMyAhX/I7uid1Zqd5c9wvLZsqorSMkeEHMkPN
X-Gm-Gg: ATEYQzzW2AuVUC40pYVX3CqYAuH9cY9CVEpRGQDGCksrUMzc6NguqwIgeP1mf/bAZew
	filNge+ocutTySZsEcWswi2l2PTYFHv51o0nbwSe6k9Hi479LW+4vEnrvzwjEoHJE4iHzLyacWV
	FTSsAuef5yMd+JF6Cthid1sLEsxvNSo6f8lfhghOFlSVpOjgvorYovc8ACobvs51LKyhZupksTV
	1S+I3Qs8cp4h1cOZl+i77DoS1ayucTZEA72AlB4WFtN69sgTH4O9gJB3yuCq8NhBqjTj6kVjc6W
	kXwEerwz6lZn6tEzmgzqjmaTyEldBkfgK018LtXbIOxj4lT86LEVhRoWLPN+dFZ8Ta8aM9F96/w
	EhQTjx5X4SrDKaiNY/Fnn7F8VSLCkc0B40Uq2q0v+VTvq9Poij2NYUMJt2YAPeA9hrdPuLy2fQ9
	Er0Ff6WhtuW4IAWm197loI8YbXT3zVUEIsh9bdhHGIZcSLROAmHgCm9EmPTB2EKM3SG0i0BUyvV
	MrEXTAvhWbItgme9A==
X-Received: by 2002:a17:903:b4e:b0:2a9:622e:fd46 with SMTP id d9443c01a7336-2ae82265ddemr106533375ad.0.1773050318715;
        Mon, 09 Mar 2026 02:58:38 -0700 (PDT)
Received: from russ.ust.hk (ec2-54-255-20-216.ap-southeast-1.compute.amazonaws.com. [54.255.20.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e77197sm109972725ad.20.2026.03.09.02.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:58:38 -0700 (PDT)
From: Haoyang LIU <tttturtleruss@gmail.com>
To: Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Haoyang LIU <tttturtleruss@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tools/docs/checktransupdate.py: use metadata to lookup origin path
Date: Mon,  9 Mar 2026 17:58:31 +0800
Message-ID: <20260309095832.41209-1-tttturtleruss@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The get_origin_path() function assumes that translation files have the
same relative path as their origin files, just with "translations/{locale}"
inserted after "Documentation/". However, this assumption is incorrect
for several translation files where the origin path differs. For example:
translations/zh_CN/dev-tools/gdb-kernel-debugging.rst
-> process/debugging/gdb-kernel-debugging.rst


The correct origin path is specified in each translation file's
:Original: metadata field, which can appear in several formats:
1. Plain path: :Original: Documentation/path/to/file.rst
2. With :ref: :Original: :ref:`Documentation/path/to/file.rst <label>`
3. With :doc: :Original: :doc:`../../../path/to/file`


Add get_origin_path_from_metadata() to parse the :Original: metadata
from translation files and extract the actual origin path. Update
check_per_file() to use metadata-based lookup first, falling back to
the path manipulation heuristic only when no metadata is found.

Signed-off-by: Haoyang LIU <tttturtleruss@gmail.com>
---
 tools/docs/checktransupdate.py | 63 ++++++++++++++++++++++++++++++++--
 1 file changed, 61 insertions(+), 2 deletions(-)

diff --git a/tools/docs/checktransupdate.py b/tools/docs/checktransupdate.py
index cc07cda667fc..b3c695fa0f7a 100755
--- a/tools/docs/checktransupdate.py
+++ b/tools/docs/checktransupdate.py
@@ -32,7 +32,7 @@ from datetime import datetime
 
 
 def get_origin_path(file_path):
-    """Get the origin path from the translation path"""
+    """Get the origin path from the translation path by path manipulation (fallback)"""
     paths = file_path.split("/")
     tidx = paths.index("translations")
     opaths = paths[:tidx]
@@ -40,6 +40,62 @@ def get_origin_path(file_path):
     return "/".join(opaths)
 
 
+def get_origin_path_from_metadata(file_path):
+    """Get the origin path from the :Original: metadata in the translation file.
+
+    The :Original: metadata can have several formats:
+    1. Plain path: :Original: Documentation/path/to/file.rst
+    2. With :ref: directive: :Original: :ref:`Documentation/path/to/file.rst <label>`
+    3. With :doc: directive: :Original: :doc:`../../../path/to/file`
+
+    Returns the origin path if found, None otherwise.
+    """
+    # Pattern to match :Original: line
+    original_re = re.compile(r'^:Original:\s*(.+?)\s*$', re.IGNORECASE)
+    # Pattern to extract path from :ref:`path <label>` or :ref:`path`
+    ref_re = re.compile(r':ref:`([^`<]+?)(?:\s*<[^>]+>)?`')
+    # Pattern to extract path from :doc:`path`
+    doc_re = re.compile(r':doc:`([^`]+)`')
+
+    try:
+        with open(file_path, 'r', encoding='utf-8') as f:
+            # Only check the first 20 lines for metadata
+            for _ in range(20):
+                line = f.readline()
+                if not line:
+                    break
+                match = original_re.match(line.strip())
+                if match:
+                    original_value = match.group(1).strip()
+
+                    # Try to extract from :ref:`...`
+                    ref_match = ref_re.search(original_value)
+                    if ref_match:
+                        return ref_match.group(1).strip()
+
+                    # Try to extract from :doc:`...`
+                    doc_match = doc_re.search(original_value)
+                    if doc_match:
+                        doc_path = doc_match.group(1).strip()
+                        # Handle relative paths - resolve relative to translation file
+                        if doc_path.startswith('../'):
+                            trans_dir = os.path.dirname(file_path)
+                            resolved = os.path.normpath(os.path.join(trans_dir, doc_path))
+                            # Add .rst extension if not present
+                            if not resolved.endswith('.rst'):
+                                resolved += '.rst'
+                            return resolved
+
+                    # Plain path (no directive wrapper)
+                    if original_value.startswith('Documentation/'):
+                        return original_value
+
+    except (IOError, OSError) as e:
+        logging.debug("Could not read file %s: %s", file_path, e)
+
+    return None
+
+
 def get_latest_commit_from(file_path, commit):
     """Get the latest commit from the specified commit for the specified file"""
     command = f"git log --pretty=format:%H%n%aD%n%cD%n%n%B {commit} -1 -- {file_path}"
@@ -128,7 +184,10 @@ def valid_commit(commit):
 
 def check_per_file(file_path):
     """Check the translation status for the specified file"""
-    opath = get_origin_path(file_path)
+    opath = get_origin_path_from_metadata(file_path)
+    if opath is None:
+        opath = get_origin_path(file_path)
+        logging.debug("No :Original: metadata found, using path-based fallback for %s", file_path)
 
     if not os.path.isfile(opath):
         logging.error("Cannot find the origin path for %s", file_path)
-- 
2.53.0

