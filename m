Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBD21DEFEA;
	Wed, 29 Jan 2025 16:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738167000; cv=none; b=fH6l47qs8qhfeOLTK5QGcpZRjwb4uKDWUWMx2trtinLvx8zlqIOm2WVaT/xOYt3v00HtumI+LsnOWptogxFa4R8+PUyK/DPenRFZwojlzA7xQ92r4dWOGX2G6/+XtQ0x/efKC8sAy1oCjzfEkq0E8QROu4Ai4ue3eoYt++szMEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738167000; c=relaxed/simple;
	bh=5OUVA+DifT9fiAR1a4XwZcggsOOvHcxKgnNy11VXdK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iKervcdhoMx4Ob5l8E1FGNvsCcABgxk0+6acREZyHwEQ7VqSGm+DdRkzBgHaucmJH5XISb2nOTXpv/bJ5EQyBCts0MRlihXIl83FgQ/RS09ZFMcy7StN/tlG9EUzxI45EwqENjxYtTucqseN3c/wyQlnMsZdAvNsmd+Y7WVT1fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t/BH31fY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t/BH31fY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A013C4CEE5;
	Wed, 29 Jan 2025 16:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738166999;
	bh=5OUVA+DifT9fiAR1a4XwZcggsOOvHcxKgnNy11VXdK4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t/BH31fY6T3i68shjEYcsDRGT6Q9RY0aMsPVsDG83pYDdQ57/spyDPw7F26YLrLHk
	 NeJeaMlou4ZJPc0d/EMio/iDvqnM5mkwU7MJVWK14vRM8rOyF7LKS0aK1APQnlNLbu
	 Dg1NZlB081L/mz9kjXYaPZvf94Kx3boS0r5dIh8xaEhxtNA92hd7E5qM1h8R85oE3M
	 9q3ABVFQQ+939NxrAVoN5EegaOkvIm60jaW44fAe6Hp8E9hGd3w957hXQGfUCY12z8
	 LO0MDoh7Jw5Z2GWxm8yCM68bISxcKvHrulHHqFUbkffFuZKkeupm+3qWXhvgtyfc0O
	 S5RePaysWQPyQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tdAdZ-00000004PEK-1eS9;
	Wed, 29 Jan 2025 17:09:57 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Akira Yokosawa <akiyks@gmail.com>
Subject: [RFC 1/6] scripts/get_abi.py: make it backward-compatible with Python 3.6
Date: Wed, 29 Jan 2025 17:09:32 +0100
Message-ID: <6d74360f8cdabeb0bf628a6e870d10e134f396f0.1738166451.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738166451.git.mchehab+huawei@kernel.org>
References: <cover.1738166451.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Despite being introduced on Python 3.6, the original implementation
was too limited: it doesn't accept anything but the argument.

Even on python 3.10.12, support was still limited, as more complex
operations cause SyntaxError:

	Exception occurred:
	  File ".../linux/Documentation/sphinx/kernel_abi.py", line 48, in <module>
	    from get_abi import AbiParser
	  File ".../linux/scripts/get_abi.py", line 525
	    msg += f"{part}\n{"-" * len(part)}\n\n"
                       ^
	SyntaxError: f-string: expecting '}'

Replace f-strings by normal string concatenation when it doesn't
work on Python 3.6.

Reported-by: Akira Yokosawa <akiyks@gmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.py | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/scripts/get_abi.py b/scripts/get_abi.py
index 543bed397c8c..e6e94f721fff 100755
--- a/scripts/get_abi.py
+++ b/scripts/get_abi.py
@@ -522,7 +522,7 @@ class AbiParser:
 
                 if cur_part and cur_part != part:
                     part = cur_part
-                    msg += f"{part}\n{"-" * len(part)}\n\n"
+                    msg += part + "\n"+ "-" * len(part) +"\n\n"
 
                 msg += f".. _{key}:\n\n"
 
@@ -546,7 +546,7 @@ class AbiParser:
                     msg += f"Defined on file :ref:`{base} <{ref[1]}>`\n\n"
 
             if wtype == "File":
-                msg += f"{names[0]}\n{"-" * len(names[0])}\n\n"
+                msg += names[0] +"\n" + "-" * len(names[0]) +"\n\n"
 
             desc = v.get("description")
             if not desc and wtype != "File":
@@ -570,7 +570,8 @@ class AbiParser:
 
             users = v.get("users")
             if users and users.strip(" \t\n"):
-                msg += f"Users:\n\t{users.strip("\n").replace('\n', '\n\t')}\n\n"
+                users = users.strip("\n").replace('\n', '\n\t')
+                msg += f"Users:\n\t{users}\n\n"
 
             ln = v.get("line_no", 1)
 
@@ -596,7 +597,9 @@ class AbiParser:
                 elif len(lines) == 1:
                     f.append(f"{fname}:{lines[0]}")
                 else:
-                    f.append(f"{fname} lines {", ".join(str(x) for x in lines)}")
+                    m = fname + "lines "
+                    m += ", ".join(str(x) for x in lines)
+                    f.append(m)
 
             self.log.warning("%s is defined %d times: %s", what, len(f), "; ".join(f))
 
@@ -644,10 +647,11 @@ class AbiParser:
                     if users:
                         print(f"Users:\t\t\t{users}")
 
-                    print(f"Defined on file{'s'[:len(files) ^ 1]}:\t{", ".join(files)}")
+                    print("Defined on file(s):\t" + ", ".join(files))
 
                     if desc:
-                        print(f"\n{desc.strip("\n")}\n")
+                        desc = desc.strip("\n")
+                        print(f"\n{desc}\n")
 
         if not found_keys:
             print(f"Regular expression /{expr}/ not found.")
-- 
2.48.1

