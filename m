Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289696;
	b=YQloW1PPRmYw84w+qAqjF6fQOSSQEnOtWXHaxsbIQLK/5R20ND3pmJG374sDj8MGjr2u
	 hIRQChX+MnHrucOkwjo/l5k5LE0lLkV41pBVPWhmzR18etYqZJrB2UPJdMoYkvRMhCDEK
	 7RxjxOqRB8K3LqXXtQEZi+C1dFhWGXYp42+4/kGQCbMNbpEg7yhF8I1eE8ODx0eiURU8B
	 cRLYTA5H+i1iQgQ5Juk4nPK7tAFPTcOUzwUyo0QWtLc6hZIzi6vmLQF/3VM9ltUDTr+tP
	 jNJVg5gPIvvBvSyFQFCwBk4lLSxSgY0U/op3tFG6HjpD/Gwf224OLMsAOoWzv+aB6gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=n5ZnpCxALSpimlZbz+ysdwCQ7qxNjOgOx10w71IS4KQ=;
	b=5ssAei5Cuogcz0eOxfn4J1ftzi/XdAKf7CaVrThFa0bAMDQ/Yj/BBAv78QE1Vu+66Rl8
	 ePvbqy5nmjIU6q2rMuKKRMk2LtoLNamTRpDE21QmOBOfLq/qsj0eglVQAySkyJUZme6+5
	 CaeloluYXT6Kx6MuIKak5NIAIsEZbIUx6z+ujDY8CDx8hhIllmvQrMk/UMEAi4jSYiXQo
	 G7lk2OubkR/Xr/86LuFjS7tMd2CwXboXkB9RYWhjMRNf9Vu3evYVLcMcbeLbxWawXXtJk
	 UC4dxPwVYIA/EoV2qU3reuD6ixvfTMYk5crfY4Piv7Ky5Xd0F8u5MGPIP4EeJr3g7ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFfjWxj3;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF9F606A32A
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 19:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AF9F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFfjWxj3
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so1077391f8f.3
        for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 11:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795289694; x=1795894494; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n5ZnpCxALSpimlZbz+ysdwCQ7qxNjOgOx10w71IS4KQ=;
        b=jFfjWxj3Yvj4oNqD7D+livIIw1prdztnBFVWXeISH05y72ksTpXjmPM0Z05gSL+Mu8
         whT/jP3IRkvo8MpCsIqeIZzyDDG5A/ewg09CW1cZGaGa1sNKOK5nQ2VnHkkepxvv5d0z
         9QICjsYFNotjwblXS3EybXhYxR4ynCk92SdOVHZJbbmWYnp5knlfcJeDQKIplLVe3q5G
         9QPRamiXuXSYLbLio5MQTG3ADwDZzglS4+6TUWlwRx+3otCncuwMHiNS3izRx6uGWWpF
         kkqrbFZPfC48f5QvLGrQNKxisZjyUYKcMUk2/t4OlCcvjJ7dnrvJCrZTgLaTyMcYzJeI
         qdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795289694; x=1795894494;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n5ZnpCxALSpimlZbz+ysdwCQ7qxNjOgOx10w71IS4KQ=;
        b=ZC6JnmSDkMyI99o1F+9pdk+rNGK18Lt3UFgWLDvgcdDBfT9VoITiQEzSMdMbjBhPUU
         UWfeaGBFLrJQDfFktmBiImApH6wu9DO76YT2m0TFRXw7yCG+fxBaCILUU6h4qlxh4z5R
         ZHfTbc7TNCnbfwCUFT+/uoJYW++NvxDqC2Ga/DSIQ9A++fy8xeichNkqOvgoYYE6dcaC
         k29Q53HH4MUiyMCWYxFRIB/s7JLPDv6w9goK5dD4mAOlbMyWM9e9ng+Bh8K7RpnWPtyr
         2LBlnpN9cW70LVn4stazsTlsYoRFcFYXN2hPkrllnL8FmxGMN9Iy1XgNy5zj4jGhAWTG
         Jp3w==
X-Forwarded-Encrypted: i=1; AL+hErFximOS9ic59yXkvWvOYvZa3y/c/DZxzf3ZCEWUqyE2/jPM/lZRVd79rf2heh0ASuRiTM3f5dJAoG4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mLgxhP+r3v0FH5YShk4le8Pk4rfH5zBUzSwW2dE1BvoaADaaL
	g+F3szfl2V2ZdZHXzKTHsLhEGBnWltJYvnnhZtmFd0ieBz6Qn2tv9/1ItLK/q8sf
X-Gm-Gg: AZFdTZdU9eQzH8kkh0wFmbmKE9jU6g6oPqPCEZAUikHlEiKQ2HNXjoYqYSBWUaikuO4
	v799JZ4x47rQ5xAy9O3Zi6lzMMF+52QR9s6cnvnEro8SeLq/yyxiyOX+GSsdyRS9yV5mEhVHiV+
	bX7g/vR6dickm5SnuiELK0DmBWLh9UlYwhjkPzd9TJClnZVqOoJ2BKUZYmF+EzCg/iriE8vdwE7
	O7da/TlCcc16kpjshOnEOkRkvaMRduLikc5wGX3mRgeMpM1P3c1luMsT8TW/f1NaHzLuaXB4RsM
	lzTfx2E8haIE1DDiJLc4/LZ4W0mfnzFqHPjmYiaFgoL/24Ckocr2jyuBr9YMKt558198XfLr07E
	Mklyzi2bY0jFMjumjqdW6GhEq/KLnIM6lFv5Q5oNjnrhH6v9ut2HzYYIvaN0tCL85AuWXCCyxsd
	rWxBs66QBrf37CdRhF4vi6JXOzJn3YXHuNts8ye3KggNWJxMhIC90HQhYh+0BZfZVO+xVnOFlll
	nD/JLc2UpIFdQhePNg6HPi1GhWq+DWYnxsjjPMH714wXbH59Ji4Q7/LDbKqzA8IKCr6qVGauinT
	b5lv1c5yTd1wqq/15y9R76jPSY6B5yYkHJVOyWMAXlJH3sr4ew==
X-Received: by 2002:a05:600c:4e0b:b0:4bb:6f45:2a79 with SMTP id 5b1f17b1804b1-4bb88817920mr169852215e9.22.1795289693852;
        Sat, 21 Nov 2026 11:34:53 -0800 (PST)
Received: from NullSecurityX.localdomain ([178.244.203.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm69591845e9.2.2026.11.21.11.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:34:53 -0800 (PST)
From: =?UTF-8?q?Ozan=20A=C4=9Fdepe=20=28NullSecurityX=29?= <agdepeozan@gmail.com>
To: brauner@kernel.org,
	viro@zeniv.linux.org.uk
Cc: jack@suse.cz,
	corbet@lwn.net,
	linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ozan=20A=C4=9Fdepe=20=28NullSecurityX=29?= <agdepeozan@gmail.com>
Subject: [PATCH] Documentation: failfs: setns() back out needs no privileges
Date: Sat, 21 Nov 2026 22:34:46 +0300
Message-ID: <20261121193446.105396-1-agdepeozan@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The "Leaving" section says the remaining way out of failfs is setns()
with a mount namespace file descriptor and that it requires
CAP_SYS_ADMIN over the target mount namespace as well as CAP_SYS_CHROOT
and CAP_SYS_ADMIN in the caller's user namespace. That reads as if an
unprivileged task in failfs that holds no namespace file descriptor
cannot get out.

It can. A pidfd names the namespaces of another task without a path
lookup. create_user_ns() refuses chrooted callers, but userns_install()
does not, and the caller owns every user namespace created by its
effective uid below its own. setns(pidfd, CLONE_NEWUSER | CLONE_NEWNS)
on a task that runs in such a user namespace and in a mount namespace
owned by it passes validate_nsset(), userns_install() and
mntns_install(), and mntns_install() resets root and working directory
to the root of that mount namespace. Rootless containers, bubblewrap
and browser sandboxes all run such tasks.

Verified on v7.3 with an unprivileged caller: after
fchroot(FD_FAILFS_ROOT) open("/etc/passwd") and unshare(CLONE_NEWUSER)
fail as documented, and after setns(pidfd, CLONE_NEWUSER | CLONE_NEWNS)
open("/etc/passwd") succeeds.

The section already says leaving is not a guaranteed interface and that
seccomp has to restrict setns() among others, so only describe the path
accurately.

The issue was found during an AI-assisted review of fs/ and
kernel/user_namespace.c. The reproducer, the documentation text and
this changelog were drafted with the assistant and reviewed and tested
by the submitter.

Fixes: a45a6605cd04 ("Documentation: add failfs documentation")
Signed-off-by: Ozan Ağdepe (NullSecurityX) <agdepeozan@gmail.com>
---
 Documentation/filesystems/failfs.rst | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/Documentation/filesystems/failfs.rst b/Documentation/filesystems/failfs.rst
index 21ff2db79..c34e29403 100644
--- a/Documentation/filesystems/failfs.rst
+++ b/Documentation/filesystems/failfs.rst
@@ -65,9 +65,18 @@ implementation, not a guaranteed interface, and may be loosened later.
 For now a process that entered failfs counts as chrooted, so it cannot
 create user namespaces to regain ``CAP_SYS_CHROOT``, and ``chroot(2)``
 or ``fchroot(2)`` back out require ``CAP_SYS_CHROOT``. The remaining way
-out today is ``setns(2)`` with a mount namespace file descriptor, which
-requires ``CAP_SYS_ADMIN`` over the target mount namespace as well as
+out today is ``setns(2)`` into a mount namespace, which requires
+``CAP_SYS_ADMIN`` over the target mount namespace as well as
 ``CAP_SYS_CHROOT`` and ``CAP_SYS_ADMIN`` in the caller's user namespace
-and resets both root and working directory. A process that holds no such
-file descriptor and restricts ``*chdir()``/``*chroot()``/``setns()`` via
-seccomp cannot currently get back out.
+and resets both root and working directory.
+
+That way out does not need privileges or a namespace file descriptor. A
+pidfd names the namespaces of another task without a path lookup, and
+joining an existing user namespace is not refused for a chrooted task
+the way creating one is. An unprivileged caller can thus leave with
+``setns(pidfd, CLONE_NEWUSER | CLONE_NEWNS)`` on any task it may access
+in ``PTRACE_MODE_READ`` mode that runs in a user namespace owned by the
+caller's effective uid and in a mount namespace owned by that user
+namespace. A process that restricts
+``*chdir()``/``*chroot()``/``setns()`` via seccomp cannot currently get
+back out.
-- 
2.53.0

