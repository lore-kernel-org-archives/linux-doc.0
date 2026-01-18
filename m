Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949F0199FAB
	for <linux-doc@vger.kernel.org>; Sun, 18 Jan 2026 13:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768742119; cv=none; b=hHQ1G8DXGD1nSWHaUczJ3GW/L/e2k9B1T2XFUSYHBtbMt5r7lFYRyjaDgZOWsy5RnOlEyWSmUk/9smHTPUw5NhjwHQ6SZkFHg6rrGNTKR4CnTyTKZ7jj94CLR5lB+RD87uelf4Do6fs3Yz5qgI/P6Gsp0rIVkDV+FnEFsgjUysc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768742119; c=relaxed/simple;
	bh=4TEa7pHP2ikSWgVdHInrsbOyT2CYj/3mm8xIYJwHTR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dpCEQ1Uwqsdh6OPJ6KGjsGkWIScgM/x4wMTgLqK+a4Y2yJeQEO8pRQJ02IbFuxMlPb8vjYbBVa7KnKmLXsLDY2oxHKZ4RKnXZfIpXL2VnYoixfIkYaq9zJ4AJlunW5OOBOD3D6+IixaQgiY4N9uYQaNqrEJJ+OJ6CwuQJrlaIY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WU429C2W; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WU429C2W"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so29844875e9.1
        for <linux-doc@vger.kernel.org>; Sun, 18 Jan 2026 05:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768742116; x=1769346916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sa8nTgcsWLvaf6pbTiRseNi/rif1T3zmlnbTbk9J3SM=;
        b=WU429C2WgWQU1zAb5ao4guj2XpVwfdabeawgKEIjs7FPG69nD0IEXP3C9O1unbDq6+
         qvvXxGRXRJcO2uow4nlFxESIUgDIwfhHdCjdtcKzbwLA3aQXPQWxNjkaVH+OjLzPzvr9
         RMssMy8PWMUY6slKsGQtW5caU1C/KmwOuT/4BE+6W67IODOo0WinDxwYIwcvKGbsFEPt
         QnNMJNDPdUHty+wsDez5bZZTrZX7rgZss+KYV3txdh370jzeyYBrM2gvqwyIfoqxx2gG
         wmuStUedfzo307lGqYzNJ62OxxSwIsyPO1fTfV4I72hH7eJF1iThAr1dD/nNyWOoIDFy
         ytMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768742116; x=1769346916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sa8nTgcsWLvaf6pbTiRseNi/rif1T3zmlnbTbk9J3SM=;
        b=wMa9jZji000PUeK6kh7c/Vf6bniAtoT/BWr1bHX0y1NFpOH8cD+zFDo+B5qX78KBFI
         SSekAxBHstfPkeYCTtpThZrKbYwY21e4sh3GC5l2FO1gT9UsafycDWxYZq/PlLcwAwov
         ojmNT4rn2NCyBKo5wpDopnw8WzeVf7N9B0zWJ0veShoOhiMmDhCVEEujjT9SRLtnjmZT
         RWQGdP4Uzhe80izfOSTlDX9AX99YgSKRZnsdqnkO+ePqQudF0ECQXIIDBeE7tn0jT71B
         1KaUwUevTj2sQCdkoumXXWWSrYwWEoDe6pZ3rKz1t5S2AOST8tQfQsE4IWX5lP5nyZ0S
         IUwg==
X-Forwarded-Encrypted: i=1; AJvYcCUpoVXp4viMII/1ozvzFzBOPz+/bi7XTpxvQ+hQMt1x7qe2gpzh42iTpZRYhA0sE7ivQtF8koJpPYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkeSWcZpiybDMfW4M5k4Oa2kdf5Js1xh6YCEFWpIiMQ5oeP3ur
	rm8nFWgpT4Rhdy4z3AqKwGum1iOcdJccmBg7FkcUGyrgt9Byj3Rl305C
X-Gm-Gg: AY/fxX5tVVfORwVs662zY5nA3p+3HOk8uJLmDz99BeZWMWzVh6AktYavY7avCZBUiZo
	1DSLPMjIoN+fodL+cmjmm2+N/uGKQ6H3Dkk4N0JrO/uUQxsvgSQvsk37oopYA3qvSQYdtBeMCqQ
	fPN3bfeQbMz+4lVufy53OWDOaBrtYjpGu4Qur59bPILxUwpNrqrD7ekSQk9g+Cvts6L64d/Z9HO
	Y5g4Y6gWNJz8ts8jFaX+pP5Hkg7oxDmUo4V+y2hbf+hSUZB4E5d9AzP3yjY286lxgnCS297+DIk
	RKnhz0hvffs8cnuDaSa7Rdk/uUJzYzbTyay+JM1DeB61MQB+2563nKzW8c0bKeMdpGylbgPp7JQ
	Et+0jnT/WcDRuSo0lzF9ttlSJosNAQtG0Ulb0kwVSAoaTvbTVW/ee3wCKQU4d0ujnbXB4Y9pjRa
	RjBotYnxi1iuRvus375pbY5xTnO6Y=
X-Received: by 2002:a05:600c:c16a:b0:47e:e20e:bbbe with SMTP id 5b1f17b1804b1-4801e33c332mr105274575e9.25.1768742115712;
        Sun, 18 Jan 2026 05:15:15 -0800 (PST)
Received: from practice.local ([147.235.192.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f428bb0b5sm196377835e9.8.2026.01.18.05.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 05:15:15 -0800 (PST)
From: Jay Winston <jaybenjaminwinston@gmail.com>
To: corbet@lwn.net,
	brauner@kernel.org
Cc: viro@zeniv.linux.org.uk,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Jay Winston <jaybenjaminwinston@gmail.com>
Subject: [PATCH] docs: filesystems: escape errant underscore in porting.rst
Date: Sun, 18 Jan 2026 15:16:12 +0200
Message-ID: <20260118131612.21948-1-jaybenjaminwinston@gmail.com>
X-Mailer: git-send-email 2.46.4
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

filename_...() seems to be literal text whereas Sphinx thinks filename_ is
a link. Wrap all with double backticks to quiet Sphinx warning and wrap
do_{...}() as well for consistency.

Signed-off-by: Jay Winston <jaybenjaminwinston@gmail.com>
---
 Documentation/filesystems/porting.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/porting.rst b/Documentation/filesystems/porting.rst
index 8bf09b2ea912..86d722ddd40e 100644
--- a/Documentation/filesystems/porting.rst
+++ b/Documentation/filesystems/porting.rst
@@ -1345,6 +1345,6 @@ implementation should set it to generic_setlease().
 
 **mandatory**
 
-do_{mkdir,mknod,link,symlink,renameat2,rmdir,unlink}() are gone; filename_...()
-counterparts replace those.  The difference is that the former used to consume
-filename references; the latter do not.
+``do_{mkdir,mknod,link,symlink,renameat2,rmdir,unlink}()`` are gone;
+``filename_...()`` counterparts replace those.  The difference is that the
+former used to consume filename references; the latter do not.
-- 
2.46.4

