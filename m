Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FE0346FC3
	for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2026 04:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776571919; cv=none; b=ZwwuyzJXl+PxVc9nX26PaoDpFSqWDf0aWpgULtUaJcQwqSij1E237RPfVfbvDpWQFmRN+pCS14SMouKwyjWNkYP9wsAHOOE+4f6oLYfn++rdMM8YXvYPOexuVssEvkcBhTUXLe/QX9T9fvG3oSuuYM6E/auiBuzj8dw3KmmWFZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776571919; c=relaxed/simple;
	bh=1J5HfoqMCRzodR4Puf6pKmINNdR110Co/q3KXdwFaYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fbtnz8vBlMehuElAotUgrBkv/XOQ+gHpkxtQ/yd6Buwro51a/67Ha4epOHsKEA41k5MNOyq8yQh260nj6+6KqBXcu+u2R8KwHRJY+smj1w75RU3SrJNUkU16TrSndkWsFcQd3F7ZwzIKvdjGIfDzEOMMEgNuMN3MJ+VMut1O0Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ipl00bKG; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ipl00bKG"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cb20bcff5aso187158885a.3
        for <linux-doc@vger.kernel.org>; Sat, 18 Apr 2026 21:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776571917; x=1777176717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2nvHv9jwSE0jszVR+8lSNwcWk7t4hLfdkLVMWS5L8+Q=;
        b=Ipl00bKGaoEhWQLbCT6f44sBNoJEG25nWlbZCKaW8z+WD4yOaVnphF9/VozyLznlRk
         /N7LyBsNbg8R/XBNr60RHN3+Te2+gAxBl+RzmQ0w7VgpC/Ed7NeRIeWxwdheffxMtwCe
         AqnerFPIvBTt3aX2eIE+sy4vz1oBp3GNlSPC5edHDM81f/FmTEsSPtBng93EU2z2Vc+t
         90IeqQQ+tZL7eYMN8XSY0oSCnijv/qdfCCp8/15mEGOJ/CHt6REisFl4MYCQsaJfOW2W
         FAKJVJE2OjLhBGQNiB7evK4mw6yYk7pNe1pAPmV2PUhtWpdID6nnlw16lQa+SY52tE6W
         PEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776571917; x=1777176717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2nvHv9jwSE0jszVR+8lSNwcWk7t4hLfdkLVMWS5L8+Q=;
        b=ngNoYKoc3YCS9POxcebEmdQmqcBFNBCsMSB4feCGEx4Yqtrpbrb0rFwQ5ZnOdky/I0
         uUKRB24UkAQSSC1AcomxBX3980csw0BhCp9sfdD7QMr4t9G5hPSczAj9VgnF3cO3WJV9
         o06bjO8G7JA7ETCWfz7zvYZD0E/WZypmOUT1hX4nNrhKj0Ho1W/ZIvP2W6Ez7OpsX48L
         KCnrzkrddDffUgbQbiC+OXtWa9z5XebAajh0YH8hSovOM0aAAmPJzPRcKJFCQfW5WrDb
         GED8i14A6RMtejmFdEjiJkjU8p/VEyeCCJUu3o6z9+ykx5N0ir+bCkrVkoT7OVrUUpbE
         adVg==
X-Gm-Message-State: AOJu0Yz948zoF9dQBsgC4DV+nanu4E6k+PYUsmwNrcm2j4shD2/Nn6pH
	QTy1nyqY5eP4DfZl93sPS2ExhdSpi4lWmRSvz+5oh5+RL+Av88QnTWpK
X-Gm-Gg: AeBDieurmWGalyCqjQ/MufStTcK/bCGyl5VeP60bwn3t8nrvo34g0L3f2gLjcWY1XrX
	bJjL1h8sTCJ+68da2VEIEwSLODjXA3fFtbnT4OvnCi5TEh9JtMIaB2h70uE9VPnkSV1Yz+0K/7V
	8oEBfwrRc3dj/X5pxn2utoXLCiNj6B3UYULn1bB8jJk+1kZ52bHCyvzbz7Akbnia/Pl/fclIHiR
	JLCtA2amkNlCumHgpJQpWGqolFKVWlDK3xzTPNPDPHor1aDtWsCH43+xzTWqXp2j5CeLOFDAhjc
	5VCdXKEkR9xhmsGgWb+1oZbbz8aZDopYHVqd9KTaL3B03FNDJdRAJJnAvx8kvmO2bsAeET2R0Dj
	za/YEYc4KScdAnAm0mU4bhvF2178Tjo2KK8myI426puksBUjfZaiGXjZdnZZGcKy4zM5K8JGuc5
	6itnre2UJEkJ0xWXJVZ2cQOKLRhK2qy/J4hHDGZl1E63jaEgluvJsQ
X-Received: by 2002:a05:620a:7102:b0:8d3:d13e:8ed with SMTP id af79cd13be357-8e791c8e81fmr1234467485a.52.1776571917191;
        Sat, 18 Apr 2026 21:11:57 -0700 (PDT)
Received: from inky.localdomain ([2607:fb91:4c8b:380b:91a:9dec:26e7:3d7e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d5fe98dcsm508388385a.7.2026.04.18.21.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 21:11:56 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Sun, 19 Apr 2026 00:11:03 -0400
Subject: [PATCH 2/2] Documenation/binfmt-misc.rst: Make "P" flag path desc
 more precise
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-binfmt_misc_doc_update_p-v1-2-757c12f33cc2@gmail.com>
References: <20260419-binfmt_misc_doc_update_p-v1-0-757c12f33cc2@gmail.com>
In-Reply-To: <20260419-binfmt_misc_doc_update_p-v1-0-757c12f33cc2@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776571911; l=2657;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=1J5HfoqMCRzodR4Puf6pKmINNdR110Co/q3KXdwFaYs=;
 b=501vNHBhe3+OspE3Q3Cs8UcA5hXy5KFIkKEwHNX/2W4VCemBfhGg/KIpAPUMFqarz4q02X0DT
 nVoFX9WlA2lAXlrjaDWV4n3Teb0QBImhSDyVda/6Z6KsXYzhZJse4Sr
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=

The "full path" is not passed through to the interpreter, but rather
whatever path was passed to execve. The user's shell is the mechanism
that is converting the executable name "blah" into the full path name of
"/usr/local/bin/blah" instead of the kernel. Clarify this in the
documentation by noting that the path is found in execve and including
"shell" in the conversation for locating "blah".

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 Documentation/admin-guide/binfmt-misc.rst | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/binfmt-misc.rst b/Documentation/admin-guide/binfmt-misc.rst
index 2e2be2922ba6..aabf6599ac49 100644
--- a/Documentation/admin-guide/binfmt-misc.rst
+++ b/Documentation/admin-guide/binfmt-misc.rst
@@ -56,16 +56,16 @@ Here is what the fields mean:
 
       ``P`` - preserve-argv[0]
             Legacy behavior of binfmt_misc is to overwrite
-            the original argv[0] with the full path to the binary. When this
-            flag is included, binfmt_misc will add an argument to the argument
-            vector for this purpose, thus preserving the original ``argv[0]``.
-            e.g. If your interp is set to ``/bin/foo`` and you run ``blah``
-            (which is in ``/usr/local/bin``), then the kernel will execute
-            ``/bin/foo`` with ``argv[]`` set to ``["/bin/foo",
-            "/usr/local/bin/blah", "blah"]``.  The interp can be aware of this
-            by checking if bit 0 in AT_FLAGS in the auxilary vector is set to 1
-            so it can execute ``/usr/local/bin/blah`` with ``argv[]`` set to
-            ``["blah"]``.
+            the original argv[0] with the path to the binary found in execve.
+            When this flag is included, binfmt_misc will add an argument to the
+            argument vector for this purpose, thus preserving the original
+            ``argv[0]``. e.g. If your interp is set to ``/bin/foo`` and you run
+            ``blah`` (which your shell finds in ``/usr/local/bin``), then the
+            kernel will execute ``/bin/foo`` with ``argv[]`` set to
+            ``["/bin/foo", "/usr/local/bin/blah", "blah"]``.  The interp can be
+            aware of this by checking if bit 0 in AT_FLAGS in the auxilary
+            vector is set to 1 so it can execute ``/usr/local/bin/blah`` with
+            ``argv[]`` set to ``["blah"]``.
       ``O`` - open-binary
 	    Legacy behavior of binfmt_misc is to pass the full path
             of the binary to the interpreter as an argument. When this flag is

-- 
2.53.0

