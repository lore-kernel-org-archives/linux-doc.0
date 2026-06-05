Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B65390CB0;
	Fri,  5 Jun 2026 17:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780679402; cv=none; b=JY5wA+6mAYS1LHZRTIHkcb/tCcUtiDiXaFtkXn+vDP8p8mAjXJHblfTSR+fb1bwNb+wq3aRq+4P7mwC/Nmnk1kRFk+dHJPk+4FYlA16DjFACoA/DQH0oovyxhjYNdqgk7zlJX++IwV3tRH+kXZGtvBP3dOayx6YV5lpE+IX9lgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780679402; c=relaxed/simple;
	bh=keu4j5pYDup0L/Oc0Rnh3yagDc7liKc84O7CT27IUwI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rjKZjKuOkh4ofqOYqsJheXGxeh8lwjE49LQ4J+Z70yqTH+IL5YpdObaf7zgB7dMGU0DgmSKpq4/8/q9mlgHfx6bQchKnnG+rHGB85Wn5zmyocgumWvBcqvf4VVsVGFcHuIhTfN89x1gHAAfUzi/DSdOgsQhq1+GkiL7xeQWr52Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=n1TtCjPb; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=D18RsIXR; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="n1TtCjPb";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="D18RsIXR"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gX7GW0nvlz9vDX;
	Fri,  5 Jun 2026 19:09:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780679395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b2GWgUHDJ5lGu7jrUZwHtaSBLUH0qyRtv7RaM5fQa1U=;
	b=n1TtCjPbaPY0hjqYzCfdD9oNYbC6dqN+V0weZFg+2BxLqNz904hR0fmeSNz2zif/U0cri3
	2xrrcdBwoUgReVSTL5DhUoT0U15pULtiIRiX8Ka7cv201opq/+nok1BzyCJmgHz5OsU+2i
	+DNloBhOLjLppwTs0eUF4/CljMeXL8VAM2rd5o59ua9+HZ/Ie4P2YOIPYTUQqYu9dkSsei
	1kGeq4isJ3zVDHsXzNDEzso27K76d79gG8btBlmTQHZqeMgzpYNbqC4D6BZv/6Sq3/Ezm5
	mUY8iQE7lsM0bXz6iY3gfrvqjs225R8aMxcxonlWc0+f5N9FOE0GUN1MHVJf5g==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780679394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b2GWgUHDJ5lGu7jrUZwHtaSBLUH0qyRtv7RaM5fQa1U=;
	b=D18RsIXRWus1We/fddndZUddg9Uen/xKzWP2BCqJpdXfOzBpjoiGW+LwF90hpqPO4LnYkd
	TuF/SGzpwj6r+PD8SoX+zhcdX0YmRX8+am2B2o1wxG5eeynuupVLGY36P/xoc/VulgNS4M
	bLbYa+e7k/z6j7Go74u608qJQVyJdwDUxwGbAcKou6U1Vr35UELLhUslxZC4zXu4gFbk6p
	ZuW1+y2iq3NUHmpXO3itHgzc0YXFkGiExQwMek7YE1t46WYXFFWJ/KD9vcf3EXAUtyQKpr
	yLT2BqshSg5i06ALMDAhOI/7NTO1bPdBGrVEnxHoLkWbQGBivLPt1aJs2XLQNA==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH] Documentation: bug-hunting.rst: fix grammar
Date: Fri,  5 Jun 2026 19:08:52 +0200
Message-ID: <20260605170851.14096-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f2ceb472f8cc01c5abc
X-MBO-RS-META: pgkqpjgik8555mwseiaidmho3r76d6fs

Fix two grammar issues to improve readability

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/admin-guide/bug-hunting.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/bug-hunting.rst b/Documentation/admin-guide/bug-hunting.rst
index 3901b43c96df..a74ffe2d8951 100644
--- a/Documentation/admin-guide/bug-hunting.rst
+++ b/Documentation/admin-guide/bug-hunting.rst
@@ -63,8 +63,8 @@ Documentation/admin-guide/tainted-kernels.rst, "being loaded" is
 annotated with "+", and "being unloaded" is annotated with "-".
 
 
-Where is the Oops message is located?
--------------------------------------
+Where is the Oops message located?
+----------------------------------
 
 Normally the Oops text is read from the kernel buffers by klogd and
 handed to ``syslogd`` which writes it to a syslog file, typically
@@ -72,7 +72,7 @@ handed to ``syslogd`` which writes it to a syslog file, typically
 systemd, it may also be stored by the ``journald`` daemon, and accessed
 by running ``journalctl`` command.
 
-Sometimes ``klogd`` dies, in which case you can run ``dmesg > file`` to
+Sometimes ``klogd`` dies. In that case you can run ``dmesg > file`` to
 read the data from the kernel buffers and save it.  Or you can
 ``cat /proc/kmsg > file``, however you have to break in to stop the transfer,
 since ``kmsg`` is a "never ending file".
-- 
2.54.0

