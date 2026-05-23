Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796CF33F36D
	for <linux-doc@vger.kernel.org>; Sat, 23 May 2026 07:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779520496; cv=none; b=KZ4GCIfX3e9BVwJYWKYrrPze2cAjVeGtsTt2PvnhENzFLq/f9F7WEv/nc6Z/kEjR9Eyu4Ze/t14pTVayzOnYjet5NV3sagmJb+VJQSacaQvJk1TTnodUXN/nqX0ACJ6drYANahQU4c4gfSVUV8w/jGpU/96A5Ly2DZ5O+hV7dG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779520496; c=relaxed/simple;
	bh=Ybb0kJKNd2BJDDcZYbhZbCACFsLVAC7m/M+jXCdbe+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NJvbVSue3SQkp9oqLs4whPXVDxrqOf+7KBLaRTaWpofko6yzkIocwtQbYGAty6n0P10sIBw9d5wn+1HoHAfxOlMID7JDxznQd3MolYqdApFUpfVUvMpIn1C0eF8xvUIXgSrxqHSFTgWxX77r4AhNo7aSefmky7S+gdj8Gl3sTFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qY20ayf8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qY20ayf8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso20666555e9.2
        for <linux-doc@vger.kernel.org>; Sat, 23 May 2026 00:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779520493; x=1780125293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5zD1QygmB8fWogN5M5u4F28IFz6bLgLGYRTXYqao/U=;
        b=qY20ayf8XTd1/FaYC9R0/8Eup7n61+/B1DOOeWoXOo8DSN3avAnR2HUgnpY+TQq31e
         myfV0xZWbwbc08aNSIWszbQrqb0+/VDzx7x4DPZym43WDVTT/AYPxQwya68S+jl1Px0P
         BHq0t8KrfZLx/QtAHg/Zn64SNT/KF2puRIzSa5EIEziHZCErQA/m/HMUz/JHRx/MD+a4
         g1koDtszSupJGveiZbRYUUX/CPfWHRu6PMlaGa4v6RC12dNDMXdL4y4bYq1QGOCWEFUt
         17LQTBE6RZrD0xr/T4U3zNnZ6UO1dT84eswvsgaJ+TCEbS9Bux2YufupNgG4rQQWfzOl
         vYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779520493; x=1780125293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T5zD1QygmB8fWogN5M5u4F28IFz6bLgLGYRTXYqao/U=;
        b=sICGBN4NGPZARc3GvL3mX9Fj+3COXY/MarMDtiCLYwD4c46+sokwpDJGji/tslIAMh
         FCrBheq/bj+rOxSo1EFgtQ5Az529M4jKr6hDGtcYU5IrsDepEkHaxPee9eij/1J22mEo
         gJBD0b7iV7+A4C8hIPdiqSpIgAxnV5gEANYNBiVbnlbzyoAEUAuNmN+8PKaCNRWjKa2V
         ZTNn/jyvI5qKFD26NStbpKs9aw3nbuPqFECHRZHnUb3APfVxJ4VPMj0kF3s+KOo1P7Zt
         UvB7gevzG6y2VTW/NvIHOfnk48qMOb1lXwHKxtGilyxspoiHcH6lhUPaPnLEFG+poZHs
         p+HA==
X-Gm-Message-State: AOJu0Yzmt8JrIQqSl7m8KY3T9kBGgsQCYU3SLHEhBx9Y/xomVqKhk80n
	ARb8jygNjtHDS6WY5P9uzV4zn0TzZ3Hh+TJJtyBb22OPmsogHIuPm1i7
X-Gm-Gg: Acq92OGxt9idZKGF9NI8+JB+8Cj9IxWOButx5T5ObIZ6dFZ1GGk/A4/sTyRqsTtIF+9
	BNmedu0METsqyqm637FXWD/b+ayJyyoNa3UuQIJsinIf5jM2oGnaFOiEaItxYa5w3RTe7bY2xjB
	3Iq9jtvIhEUaDgmuy+Mjp4TClGuB+q+sK0LNWJNmFMxdsiWSeQaaShd6dk44U8XwHbWcra6y1YD
	v01WZxTNBB4ob5hmQ8NQbq72Sht85UF9VE6PUtN8dEe1l278WPncgDwFxhXs04Ap6RRqJ7/yMJo
	drvJVs2lzGiFG0/OEL0DlSwFmdl0ThNpNBtBA4nZ+7jFTPcixGws6E7CYvq8Z5v8twtMtY7CGjt
	AV/yl9p6Q52ttRq5/CyqMkxocR0ItfFWqFNYM3FnGeH+EHlGsZ1L86C9qk+SLRmI1B9MKRZjhgC
	4EiDAsOyf9Ds0vyi9Lb4v7tH4S5TxRaw/jeZ09UG8=
X-Received: by 2002:a05:600c:1393:b0:490:3890:605b with SMTP id 5b1f17b1804b1-490428e0bf3mr95702355e9.31.1779520492801;
        Sat, 23 May 2026 00:14:52 -0700 (PDT)
Received: from [192.168.0.174] ([31.96.183.250])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45eb6d5cb76sm8639838f8f.25.2026.05.23.00.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 00:14:51 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Sat, 23 May 2026 01:14:35 -0600
Subject: [PATCH v2 02/24] docs/dyndbg: explain flags parse 1st
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-dd-maint-2-v2-2-b937312aa083@gmail.com>
References: <20260523-dd-maint-2-v2-0-b937312aa083@gmail.com>
In-Reply-To: <20260523-dd-maint-2-v2-0-b937312aa083@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779520485; l=1814;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=Ybb0kJKNd2BJDDcZYbhZbCACFsLVAC7m/M+jXCdbe+s=;
 b=LDyIcN1thUtutyJAzsuSaLyDVoxR6fToU6bjihGjPO/ev9h0D9jBnvwywJk9EE3SFg1w7W3In
 LY27uL7o3wYAABSy+dtsNqblN6gjr6Y+4iVRe4Jf8b6l7r5euO2kJXS
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

When writing queries to >control, flags are parsed 1st, since they are
the only required field, and they require specific compositions.  So
if the flags draw an error (on those specifics), then keyword errors
aren't reported.  This can be mildly confusing/annoying, so explain it
instead.

cc: linux-doc@vger.kernel.org
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 4b14d9fd0300..9c2f096ed1d8 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -109,10 +109,19 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
-A match specification is a keyword, which selects the attribute of
-the callsite to be compared, and a value to compare against.  Possible
-keywords are:::
+Note that since the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword and value.  Flag errs will hide keyword errs::
+
+  bash-5.2# ddcmd mod bar +foo
+  dyndbg: read 13 bytes from userspace
+  dyndbg: query 0: "mod bar +foo" mod:*
+  dyndbg: unknown flag 'o'
+  dyndbg: flags parse failed
+  dyndbg: processed 1 queries, with 0 matches, 1 errs
+
+So a match-spec is a keyword, which selects the attribute of the
+callsite to be compared, and a value to compare against.  Possible
+keywords are::
 
   match-spec ::= 'func' string |
 		 'file' string |

-- 
2.54.0

