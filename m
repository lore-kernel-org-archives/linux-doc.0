Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EEA377AB4
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 05:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785909312; cv=none; b=Y7OXakoG11Bf1omm1CgVQs03ufqY7Of15DQfzdkfqy3vmrsvffhsZpQOLN6MShXcVIY+DKjCJvcm7bYfgy46KUhrBb/wwbJjoG3yOMEKVYj9SxZIogLDcWZLdZJDRIVkvawI/YYe62XqL5T7Zm5BrqnyXmD1vv2zLsFahvnXzzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785909312; c=relaxed/simple;
	bh=hNu5OzkiiKB1hod0eLP3Mcrxrl4RJaAjWg0Akk7RKOs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=T01OcQw2hcGWeslHH5enG8PDHVqQm4ghPbkuo5rqVzPJyo9Dbdvv4iCNCaOUw/M0uwAUN6JjgxHyFvX5n44gI6zEKS2E9lyct11cB7lwziMECfbvaDOJZYHMsPFot0VoXUrAz6ogM6eJF5NyYKjFU9i8YRG/u4AGW5CLWj3VEoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctk5dKbK; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctk5dKbK"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e65e18969so53477585a.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Aug 2026 22:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785909310; x=1786514110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jdkA4cKJBsXoZIn8gr/e/FUgv7zUR1X9l5opTMXg4NQ=;
        b=ctk5dKbKoTkNGD6xFvdINrLIcxTXv58mjUigXZ2elBPj631BWOXthHUbPwFClpcZAS
         rXzTUjvjYUEWfum1WHiM2Emo4BvnWhx/9AfWk9XJYviQ5LyPHP4eqOOOyM0fXoi9HF7T
         f50c6b0vygRVebR1ewJkFEl81VjCy8umfKk4gwF4LOF3Cd4E1mnfgEWjjX3Z7RoRIFqS
         TlcHGN3l27pQFLtdsqAJHgxucbY4slgVavfRp+pfn07OYcfhVK6xaNFqotdCTcQutbSW
         w8E6bLd1oJ8mvHGgJYnZtePnc8EN7a4vr2pZEgiTD8qw/tuNQR3YCGSIlcyOkpAcJWtL
         smTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785909310; x=1786514110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jdkA4cKJBsXoZIn8gr/e/FUgv7zUR1X9l5opTMXg4NQ=;
        b=lsiNGnXc0jinpjE9RJqfIBW6jE5/ngxYKJBQqJSLs5U2ty/qw9REyc4PdXy4h+j2gx
         YsbE4aXxUEajpTZJehhi7zFBktYftCFnSoj3xZbV12QebRWYUJtQ6orIK664DWQDrtOT
         KZIn3vu04+8Q0D4M9zxHRfAe+tpDIOK+MaFc+LXw7Es/DxTLWXBqed35/moCXEFXePku
         zVfpimi4N/n9gbi1HFd733/qMhSB0dfCHpeKTnnR61+p89jptt9xucZd00L1n4I5P2Co
         5tcEx+aCQ2NTVDdoJ3zgtpuLe2sHS+9AUitRvcgCY88G+g92nP4BkUDUbAeRkBjEJ29W
         OiWg==
X-Forwarded-Encrypted: i=1; AHgh+RpskUrHYccIesgugCgow0TD5HmFl7QNqPnu5bYK31gyhWybr7fn/mVRGfhoujaXIw51cauWubk3lIE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUEPYoeAIbjCF2si6UNEsPxdOZgSMi/xNHSp4QQ9F9VJFkTNHp
	yS+ezJ5YKaLC2VyYktRo2/nzida4hRMLAy5ee0zUGPPfB632/A0ld50u
X-Gm-Gg: AR+sD11oR0EhR/Bdg0I1TYmVNx0ihN1e7miPWOaaN3Uq3pB1JDKCjdXabAqTKIDD3li
	ykV3w6SRLnaywvOcvfGhBIJNw2YXptGZBbw77KuJ8jwpG7p7gjkclgRd1WX6++ClAaS2Cfw74TC
	MzCBrdFaSKej9tmdziwPWkWK3RgwQzH1b1Wp2QflvxYPROtTCtDL2Fpm3VtqdCCqBaNcpb9WmYV
	tJGIrfZwLCvVRGih/vPDvKsFxzw3o1YGOt7x9Sx7IZALDWuAxGgPGq1uuQ0NOFfeHTSkIeNojkX
	jWiUeJ2liv9kpUMsTZw+0gdpn4VKE9khx+ivDWJHqt9eyMJVZntS/OHWlNj2DJYOpAFnFGVX+EC
	4DqE8nmHF58Ezn9CYuU5/1JwAvXKbBG5CZiJaDnd+mSASv+weUFkBdiqfh3RXrHkubtBXCDnrcF
	r/MijVx8a31xHgnlY7MilXHOZOJHmy3u73CW5jS53VvPTiTiLsKIoYyygXlLJ0z62zQr2F43Ri/
	zSm/uxkQGk/HDF2TbPcs6BQ0db8BNo=
X-Received: by 2002:a05:620a:8aca:b0:932:db03:4da3 with SMTP id af79cd13be357-9363192efebmr784775785a.19.1785909309977;
        Tue, 04 Aug 2026 22:55:09 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9364a566d28sm85981685a.32.2026.08.04.22.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 22:55:09 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Gang Yan <yangang@kylinos.cn>,
	David Disseldorp <ddiss@suse.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Luis Augenstein <luis.augenstein@tngtech.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Andrew Jones <andrew.jones@linux.dev>,
	linux-kbuild@vger.kernel.org (open list:KERNEL BUILD + files below scripts/ (unless mai...),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: [PATCH] kbuild: let the environment set HOSTPKG_CONFIG
Date: Wed,  5 Aug 2026 01:54:35 -0400
Message-ID: <20260805055438.3482019-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HOSTPKG_CONFIG was added so that "tooling that builds the kernel" could
choose which pkg-config the host tools ask about their dependencies, but
it is assigned with '=', so only a make command line assignment takes
effect. Exporting it does nothing, silently.

That is surprising, because the other inputs to host program builds do
honour the environment: HOSTCFLAGS, HOSTCXXFLAGS, HOSTLDFLAGS and
HOSTLDLIBS are all read from it and documented in kbuild.rst as such.

It also matters. A cross development environment sets
PKG_CONFIG_SYSROOT_DIR and PKG_CONFIG_PATH so that pkg-config answers
for the target rather than the build machine. Those settings are correct
for everything that will run on the target and wrong for a program that
has to run on the build machine. objtool asks pkg-config where libelf is,
gets the target's include directory, and compiles a host tool against
the target's C library headers. Because the directory arrives as -I it
is not treated as a system header directory, -Wno-system-headers no
longer covers it, and the build stops on warnings that would otherwise
be suppressed:

  usr/include/sys/cdefs.h:486: error: "__attribute_const__" redefined [-Werror]
  tools/include/linux/compiler.h:123: note: previous definition
  usr/include/stdio.h:449: error: redundant redeclaration of 'fscanf'

An environment that knows it is cross building can then say

  export HOSTPKG_CONFIG="env -u PKG_CONFIG_SYSROOT_DIR \
                             -u PKG_CONFIG_PATH pkg-config"

once, in the shell it hands to the user, instead of every make command
line growing an override. Build systems that already pass it on the
command line are unaffected.

Assisted-by: Codex:claude-opus-5
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 Documentation/kbuild/kbuild.rst | 5 +++++
 Makefile                        | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 5a9013bacfb7..6d7de86764be 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -110,6 +110,11 @@ HOSTLDLIBS
 ----------
 Additional libraries to link against when building host programs.
 
+HOSTPKG_CONFIG
+--------------
+The pkg-config to use when building host programs. Set this when cross
+building, where the default would otherwise answer for the target.
+
 .. _userkbuildflags:
 
 USERCFLAGS
diff --git a/Makefile b/Makefile
index 902f3f3d54b7..ba64518d5309 100644
--- a/Makefile
+++ b/Makefile
@@ -461,7 +461,7 @@ HOSTCC	= gcc
 HOSTCXX	= g++
 endif
 HOSTRUSTC = rustc
-HOSTPKG_CONFIG	= pkg-config
+HOSTPKG_CONFIG	?= pkg-config
 
 # the KERNELDOC macro needs to be exported, as scripts/Makefile.build
 # has a logic to call it
-- 
2.51.0

