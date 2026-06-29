Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33FD19DF62;
	Mon, 29 Jun 2026 15:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747138; cv=none; b=CJjSewyeyEl6epNTqyVCZMeNsQ8XSCo4Q+wogNj9Ax9LwdA74k8ARhfhza/g+u0966buq1HLit2a5gVeJd70VSwxAdxa0Nvu4sXavSAzsOeZ5UohyL3nd6/WobjfU55wT50zy0tL8/TNl/j9aKNJcGlVX+cqEDYV/6x8PNM3ykk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747138; c=relaxed/simple;
	bh=nzGFSONTbjRflbqwbSz64iM1d9EbDo/lGLeH4NqmteQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KQmk2Ua1twYEUySCroPd4bnoGxvO9sxG5I8Qm4lBBgwG5pF26TPrwvv79gBnlWIkI8h6GNmPh4apaZfU5eaWJdojKuuZ/Ci0J1Wb8UJ8akBu31wRVR/VJX27USD9rR+X/aoEErd8K3DNBiK1/xm0bpzZgFdvjGZAtB0F6RTqFq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tZ8jOueB; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=OCtJ+HAF; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tZ8jOueB";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="OCtJ+HAF"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gpqyk6nvsz9vHr;
	Mon, 29 Jun 2026 17:32:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782747135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y6lUgVlBAJF6R12RVGW7gesy7dokdiVnQ2CN1iL6Jrs=;
	b=tZ8jOueBTHdXSDIIC0YVWJBrLMiPxN8F6xNC1i9/V5ZBDoE8pY+CW1XXz9DaRDdiIz0f9Y
	BvhV+5fdBT16zXrqAiCnCh82twliL6QlDbm9cytsQxCnxI+VLdiriAlvUEEKiMqXa5DbO6
	aZASBFJ0/Q2wWxjrNG+xM/KcGHTe/uzNIS5/G1+Gz4P6my8uIQE2vAs/l4yyOKxSYBhZYp
	gOHfAanc3NH/k2TKj36X8LbBTOOCUDZGjvX05vU3IEjRbd49cDOD+gjZ1X8wM5F4XhRMeD
	HMu7NvpuRAwhgRk6mqRXbjfPMahaAvVIqxafKnHTQYSyQO19yKNNLmnp6l/DIQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=OCtJ+HAF;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782747133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y6lUgVlBAJF6R12RVGW7gesy7dokdiVnQ2CN1iL6Jrs=;
	b=OCtJ+HAFA7u/nvf8J/hkD9LiBQjlCreX+ekBq3IjHn2nUx1H5uy3PGfFuBDw6LvZEn7wKi
	Vw23reWZucr2qEffCGTLiFUw6R6Zd8StUjCnz+VnppAu5osPJl7Lh8ETCBccfLdDO3gsH4
	PmuauDv1RWdnpryzBIutmwSn2aK4OHGXDrH+b2pKSh8boHw0aBBuN5JICdRcHNwlZ4Ws1J
	4vu1A5yvbT4PJdl4NzRztnh7HNIuQ6CPOA8EWwKlJmMgnZmWGuJ+mhHxGEmf9LGu/Ag9/e
	HwxGNxw4aRRmY7Ck16MrdIO3iMnjgM5SQHZfoB9PYfVdB59sVoihqlLrPLJbFA==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	SeongJae Park <sj@kernel.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH v2] docs: kernel-hacking: fix typo
Date: Mon, 29 Jun 2026 17:29:13 +0200
Message-ID: <20260629152912.86500-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: njxes6uhzxir5ug3thb4rp8tafse8914
X-MBO-RS-ID: 8078d810e0019ddfb82
X-Rspamd-Queue-Id: 4gpqyk6nvsz9vHr

'GP_KERNEL' -> 'GFP_KERNEL'
Remove trailing '`' without clear purpose

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/kernel-hacking/locking.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
index c969c76ef7cb..674475123593 100644
--- a/Documentation/kernel-hacking/locking.rst
+++ b/Documentation/kernel-hacking/locking.rst
@@ -1317,7 +1317,7 @@ from user context, and can sleep.
 
    -  put_user()
 
--  kmalloc(GP_KERNEL) <kmalloc>`
+-  kmalloc(GFP_KERNEL) <kmalloc>
 
 -  mutex_lock_interruptible() and
    mutex_lock()
-- 
2.54.0

