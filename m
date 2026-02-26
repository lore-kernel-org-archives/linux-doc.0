Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0128C3A4F25
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 22:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772146785; cv=none; b=rIyFDsPW17fG0GzcXA2gTiOdfN5m4Ip9sSUMuIAFAG5qR3nc+s49FiKD9FYTUqB55ZNSrhj/30L9CGI0jkvw0QEPyiEUFN8NBqoTDF6gQrX0a+jw+2mM4Mb4DCS75t1c8JOAYxXQ3wbKnCixtXawd2MX8fBVmSZ35yERZBcR4lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772146785; c=relaxed/simple;
	bh=jbJq7OXmQeBZmwRpjd9yJUs3eMItznmSe9ewMHfDyUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S27bYlw/JHPCAVn2u+TlPkiPBlf7ibmmNIt0cngXKEEvHkZqMMf73iTdZRlnmCuoCYZzXgZ8oYyLTeSYQ7SGoKvNfvQtdS6eMnGFXnDG26zbGGVmu/Y+tLi/46Fjukpg+jtuP727fKAYwHPQkSx225cKGN+T3iPVYDv95osdv/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8S2U1RK; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8S2U1RK"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56a857578a8so536651e0c.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 14:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772146783; x=1772751583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6aqj9c9xjhLgEaKwvruYk1MR/l8jOrc5ozuF+ZF05Hw=;
        b=G8S2U1RKtouJ6+ArgBKQau6cm0ZH/67hYdbThbVsmeE+LeITiqXPns8vfghqDvLQ5Q
         Ya9bTaBTf8uhoAz9ppoE0+ve/hKcKH7vEvqkEXsosqIQrgZO4T8Lj9AYnzrD7HU7lQJ/
         rUGcUHjfIL+oMaVCSxoehUeFeMe9WM6t9bopZFv7Ld7EJ1BngthOnGIJiUtuUH7NbR+s
         rjjN63ABBOJkRcNJsihJ2dH+y8w+95w8XgjdP2nM0tLZtTIGbRjre9PMgl0DIS5VhJ2N
         fX9JedaIociFV9eCv1/BCHqBXjmX4c6wR9p/cvOiGNHAxA5wcCXQDTI/6VQ/2nZzDP+r
         7vbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772146783; x=1772751583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aqj9c9xjhLgEaKwvruYk1MR/l8jOrc5ozuF+ZF05Hw=;
        b=t8XjUGvHSfqrveO6XZq+Oa7EdM7DMv0HL9aCajrglCPTNHmnv7Skrpedx9fMHYqNnt
         BWB6cWkhJOU87+Qs/S63VoFSUa/fNWT8h6opSRUnIf+FlwgbB1E2PcVI9Gb8xk6V9a9Z
         hKBV71HGVG39FoCc35i3SklK2J/hN4wA9w7Fdk0/zCZK3P+67GC2drjUHsTBXWVTMlEY
         AlbfJBMoLGHERvH1+1R3AWpik8prRgbbsMdeITz47Uq4q5gaPrzM4x0sfYlPb03oKNhx
         j5v1hn0x/9SFx/qrRQWT1dBxRKf4MAtPkabXiKx+DnMaYlzdbA/hHr7oFecLZEgOITJC
         PiMg==
X-Gm-Message-State: AOJu0YyUTv76mqfeXFviss+adSBLisoQgZARsFyOTjh6IImjGrNXgqbO
	6tTYMSAI9KhU4mI0Rq+x1dZWx57v1tWqKQOJX8ye1OHQgkTY19vybzO/
X-Gm-Gg: ATEYQzw3w7vF+8Y+Lr6uvvMm9DZ3+OW0clgPWmRvM9/1+1wxWf0Ps0An9pvZF/B5v2N
	kEG2m9APyz3tA2SWusI+WdOcd5ZT8AQkOoEHZ9nk9SQOCenbq9LuKR/wuYxD5TtOxgfeSD14vbq
	WAeHkOTbQpJfWjyOJ1SJF0a32BR/7+NLUH2PJhNtJFdJ02ec8/603VNtq7zGsmte/uS+8LGYVn7
	3Le2J42wszk5CykcI+6U9+PR6rKEqBm9GkDZpMxpVj3lowR7T3OMbF8PMt7k+Le0uqESpuJoggo
	1Fd+SfS05y+BnIp8A4VyFyHBEadTVA+8U1I+DEFaVOW299c0aKbV113COMCjZYDq2t1tPYceWtQ
	D7pxVLrYMA6/G88y0JHHDieg4bq7H0UHlKUwSew6UGPmz5bsFSx8A/IynsLXcmotDc+LBCMi1xr
	lFBlZIKfTLiCRW/oWjLGV1Bj2WVRkQ/1Vm0wh9iCfg+TCKWQcdNhMzv31HAHJSMs19yQTXq1JAE
	TzLjZ+t5UnXty/6
X-Received: by 2002:a05:6122:d29:b0:55b:1aa5:bf88 with SMTP id 71dfb90a1353d-56aa0a2b86fmr555085e0c.7.1772146782620;
        Thu, 26 Feb 2026 14:59:42 -0800 (PST)
Received: from localhost.localdomain ([2804:29b8:512d:4c55:1868:543f:1aeb:fd26])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91bcc3eesm4342455e0c.8.2026.02.26.14.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 14:59:42 -0800 (PST)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH docs-next v2] docs: pt_BR: Add translation for maintainer-handbooks
Date: Thu, 26 Feb 2026 19:58:48 -0300
Message-ID: <20260226225849.268373-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate the maintainer-handbooks.rst into Portuguese (Brazil) and
update the main index to include it. This document provides a starting
point for subsystem-specific development processes.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 Documentation/translations/pt_BR/index.rst                | 1 +
 .../translations/pt_BR/process/maintainer-handbooks.rst   | 8 ++++++++
 2 files changed, 9 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/maintainer-handbooks.rst

diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
index 55f9f377e..de5c005f9 100644
--- a/Documentation/translations/pt_BR/index.rst
+++ b/Documentation/translations/pt_BR/index.rst
@@ -68,3 +68,4 @@ kernel e sobre como ver seu trabalho integrado.
 
    Como começar <process/howto>
    Requisitos mínimos <process/changes>
+   Manuais dos mantenedores <process/maintainer-handbooks>
diff --git a/Documentation/translations/pt_BR/process/maintainer-handbooks.rst b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
new file mode 100644
index 000000000..eb650bc60
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
@@ -0,0 +1,8 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Notas sobre o processo de desenvolvimento de subsistemas e mantenedores
+=======================================================================
+
+O propósito deste documento é fornecer informações específicas de
+subsistemas que são suplementares ao manual geral do processo de
+desenvolvimento :ref:`Documentation/process <development_process_main>`.
-- 
2.47.3

