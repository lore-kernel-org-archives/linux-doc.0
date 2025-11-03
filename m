Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E122F2603
	for <linux-doc@vger.kernel.org>; Mon,  3 Nov 2025 11:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762169990; cv=none; b=M4KB6WmGguaQHuKcDScEwS4CnUWvIEVMQOcvWHZSE/Okvi6ufG/KdE0zi5OehXAdlEjpY3SrAYYZeuSDraneS0yIXqxVM7avTrrlth9e8jml+HnJHjGfAfPvXFaVPxCpqqefPIMmUxP88UPmlfdOCLnXmxZjsXJnAziWESpKKkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762169990; c=relaxed/simple;
	bh=p293SKf5o/p3baJzQjvB+/sLwGBM0lsd3WQD3vZfrVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uQW+ZAssmOEFUGB9BExd3x1lyKG1qa17P0vvRO9G58HDNgqzX6g7qr31/9H6HAaLSz5TDY9QyWfJ5beInviDbiaIpmc3GRzJb6iedLQn+UNXp6wVDMLciPWtlTW38MhoT+QZ2Tmbd74ZJIPGfMiWDd5g4SKCrXN9frFlGvdFBMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhMvr4bA; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhMvr4bA"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29516a36affso29060695ad.3
        for <linux-doc@vger.kernel.org>; Mon, 03 Nov 2025 03:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762169989; x=1762774789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/r08ApJzmACuZwLJWForR04uW0kQJLXeWuOH252Kn+k=;
        b=OhMvr4bAQy/h3UdeYzBNYlB7S9TLCnITU+XoyEHhUgvbVhOHxAc69mtCMNTt7KCG1k
         ZlJcyPhp7A9QbnVoVeupFS3U4cUbcrC9PHm+9uMWu8oEogWUAWfDwa1Z6HwX5HD2uKTY
         00Sc+Ptxn7D8/g10WUyh3Sfoj9wCLxZ7tqNZo4eA9RTFjwxw9mW/omY/FQx0DjfhVQ++
         uZBxBtvO+MW7WxvezPiZ970VG7tSAtSe6JBNUP9cWNtBvCV8BJujw/VOwfLVIa0fBioo
         pknFdkzvsSGbH224yWE1FeEN3Xxzi4dXzCXcKSt+9PtcLI0nL8LYZ/p5u/dLsp6OZbe7
         nrNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762169989; x=1762774789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/r08ApJzmACuZwLJWForR04uW0kQJLXeWuOH252Kn+k=;
        b=Hj3ee9n8a4Fvvy2Y/DvcAzuXExUjm6q4YUtY+IztRj9Dqlchpbf61+kyEZOSFLLgWn
         fpdDLkKG1N2feWB7K7avIHuJExxplg51ojPLbKaMC8JCPUPzWdXv2q77rqV4Kyg0FFzY
         RkxZ6jj7Iavg/fWLLBO9qbJmDJo98k4V6LKztkSjasyN+3V9qtaJ61ikml8tAJx5R4nP
         MIkGs8xq0SLwwjWvlyD69GX9Fo+iY1PjH14RLBW3Hd9NiHdfQhAGnocKoJqWtq/EonYd
         o4/BXy81zuNmy/H1qm6C9tpu2yx8MqmD1AYTJirb5Oh+QNImrGtnOf5PBPt5Erj7hJNV
         zUSA==
X-Forwarded-Encrypted: i=1; AJvYcCXYGtPE0720Dj1Jox/r2SpGYSRiyZ5YYmvCsEebIlVDDMNUF2yCZFhA5rriWcg15JFx1QMc1hb1ssk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLanv4PqLFFUTcg4gZDBhHbVxpq16BflTgMBJEXYEOf74bwLCE
	VISaH8+botdf2JLFMhkkqTjmQ2+/7wzYiqTYOwkuXelb4AIOGkfyA8jm
X-Gm-Gg: ASbGnctaUIvJDsHWqUY8U6VkEfTXrLv7Z/u3tg8cavfmb86sghanXNJTHjLiHNI9jfd
	Soi1ezx3mlBZRdi8r1GUzmYiESpxoYMNCM5ADfPbiqbQFRijS9Vw4EJ3dXYfejXdf9dkS2NB3ju
	oSv/wA7xV3WOpuVsxLo/7eC7rifCUOeCbzzvVxZvlavbho68SKfwt4+xJYcEDJTswURGGd7pTNr
	q/0JDdkjXYic5nRyZ0cdpHVFU5K7qwQLbLRbPe3oSlYP7TP5rM0wlkefgTKFdcY9wUAdEj7Ehcs
	8LJ9kE+YPsggKJCgDv1aaeXhPOAN4/d4DfHfBqo/t4Gr7mMCkIuTGQuZTbbVOP1amXTeJpCAu9n
	NsYQgyxqd9TAI37JNyWBvDCZBk8KSxi3mJUVTVt+USU7vkCgDkjW7cHrT4sJsUFxeoetj9Kh9gc
	Ai
X-Google-Smtp-Source: AGHT+IGVaoQkYMseij6RRLrsVDqj6D0bH7qiXKKA5WqNNjbqxLqG9f/9/U2SkMikJgtrNK8QszUkWQ==
X-Received: by 2002:a17:902:d48b:b0:295:613f:3d6a with SMTP id d9443c01a7336-295613f4033mr92547815ad.29.1762169988522;
        Mon, 03 Nov 2025 03:39:48 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2959e5deea5sm46177175ad.37.2025.11.03.03.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 03:39:47 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 2D8A6420A685; Mon, 03 Nov 2025 18:39:44 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Security Module <linux-security-module@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Stuart Yoder <stuart.yoder@arm.com>
Subject: [PATCH] security: sctp: Format type and permission checks tables
Date: Mon,  3 Nov 2025 18:39:23 +0700
Message-ID: <20251103113922.61232-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5303; i=bagasdotme@gmail.com; h=from:subject; bh=p293SKf5o/p3baJzQjvB+/sLwGBM0lsd3WQD3vZfrVM=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJkckw+cjnnzTlUswkzq8mK2iLyPfdOqpixwvT5l0t21Z sIMeu6vO0pZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjCRiGiG/+GCr42t+w63Mu1b JdnOVHY9bceC6P3T1+4r3qb1gH/Lt7eMDDPNlu044a1+RXZVf7RzsveVyYc0l83ZxcnU5LMq0PZ FEyMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Use reST grid tables for both type and permission checks tables.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
This patch is based on lsm tree.

 Documentation/security/SCTP.rst | 48 +++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/Documentation/security/SCTP.rst b/Documentation/security/SCTP.rst
index 6d80d464ab6e7c..321bf6c8738970 100644
--- a/Documentation/security/SCTP.rst
+++ b/Documentation/security/SCTP.rst
@@ -46,24 +46,31 @@ Returns 0 on success, error on failure.
                ipv4 or ipv6 address using sizeof(struct sockaddr_in) or
                sizeof(struct sockaddr_in6).
 
-  ------------------------------------------------------------------
-  |                     BIND Type Checks                           |
+.. table:: BIND Type Checks
+
+  +----------------------------+-----------------------------------+
   |       @optname             |         @address contains         |
-  |----------------------------|-----------------------------------|
+  +============================+===================================+
   | SCTP_SOCKOPT_BINDX_ADD     | One or more ipv4 / ipv6 addresses |
+  +----------------------------+-----------------------------------+
   | SCTP_PRIMARY_ADDR          | Single ipv4 or ipv6 address       |
+  +----------------------------+-----------------------------------+
   | SCTP_SET_PEER_PRIMARY_ADDR | Single ipv4 or ipv6 address       |
-  ------------------------------------------------------------------
+  +----------------------------+-----------------------------------+
+
+.. table:: CONNECT Type Checks
 
-  ------------------------------------------------------------------
-  |                   CONNECT Type Checks                          |
+  +----------------------------+-----------------------------------+
   |       @optname             |         @address contains         |
-  |----------------------------|-----------------------------------|
+  +============================+===================================+
   | SCTP_SOCKOPT_CONNECTX      | One or more ipv4 / ipv6 addresses |
+  +----------------------------+-----------------------------------+
   | SCTP_PARAM_ADD_IP          | One or more ipv4 / ipv6 addresses |
+  +----------------------------+-----------------------------------+
   | SCTP_SENDMSG_CONNECT       | Single ipv4 or ipv6 address       |
+  +----------------------------+-----------------------------------+
   | SCTP_PARAM_SET_PRIMARY     | Single ipv4 or ipv6 address       |
-  ------------------------------------------------------------------
+  +----------------------------+-----------------------------------+
 
 A summary of the ``@optname`` entries is as follows::
 
@@ -228,26 +235,33 @@ The security module performs the following operations:
 security_sctp_bind_connect()
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Checks permissions required for ipv4/ipv6 addresses based on the ``@optname``
-as follows::
+as follows:
 
-  ------------------------------------------------------------------
-  |                   BIND Permission Checks                       |
+.. table:: BIND Permission Checks
+
+  +----------------------------+-----------------------------------+
   |       @optname             |         @address contains         |
-  |----------------------------|-----------------------------------|
+  +============================+===================================+
   | SCTP_SOCKOPT_BINDX_ADD     | One or more ipv4 / ipv6 addresses |
+  +----------------------------+-----------------------------------+
   | SCTP_PRIMARY_ADDR          | Single ipv4 or ipv6 address       |
+  +----------------------------+-----------------------------------+
   | SCTP_SET_PEER_PRIMARY_ADDR | Single ipv4 or ipv6 address       |
-  ------------------------------------------------------------------
+  +----------------------------+-----------------------------------+
+
+.. table:: CONNECT Permission Checks
 
-  ------------------------------------------------------------------
-  |                 CONNECT Permission Checks                      |
+  +----------------------------+-----------------------------------+
   |       @optname             |         @address contains         |
-  |----------------------------|-----------------------------------|
+  +============================+===================================+
   | SCTP_SOCKOPT_CONNECTX      | One or more ipv4 / ipv6 addresses |
+  +----------------------------+-----------------------------------+
   | SCTP_PARAM_ADD_IP          | One or more ipv4 / ipv6 addresses |
+  +----------------------------+-----------------------------------+
   | SCTP_SENDMSG_CONNECT       | Single ipv4 or ipv6 address       |
+  +----------------------------+-----------------------------------+
   | SCTP_PARAM_SET_PRIMARY     | Single ipv4 or ipv6 address       |
-  ------------------------------------------------------------------
+  +----------------------------+-----------------------------------+
 
 
 `SCTP LSM Support`_ gives a summary of the ``@optname``

base-commit: dfa024bc3f67a97e1a975dd66b83af8b3845eb19
-- 
An old man doll... just what I always wanted! - Clara

