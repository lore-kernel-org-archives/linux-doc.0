Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31392DB785
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 21:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772141262; cv=none; b=NLwdHLWYlDaJX1pOu6gx3xcFfGoByPzp4c8wPAGTlTcj1A1qa/qbhMDdfHLjDdg1yBYIFYycwYQcPU+ogCCvTa9tXZ44o4rwOM8cu+TEeAfYNdYGBLjQsYjZu87kL8erpJnG6cOJ0aVvnKKjFzEnyVHQmbnisTBPzhe62LK6l5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772141262; c=relaxed/simple;
	bh=Ml9C/51QK8M0A98LhA1v60YsGDI4l+hL0gxgYOYaIK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kZJPnW4dzQksKUtltrJ8E/b1n+Her/tscSH4/6oOGopz/YtTTFotIcmYVuYBDdOpbVkSUcL3dzj0AXtZkksszbA7/pDGF94pix+sOuke5m27SrSbqzhLtW7FdwXmPBcECIpJoELH2AHaAYxdTYGEgYcpTGKZe7qsuOg2VBNXTvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QstkMlrM; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QstkMlrM"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5674d8be45eso641400e0c.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 13:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772141261; x=1772746061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SFRtrnCi8gAbN7Gqhqf6fpZ+PJzmjbUPJ/K6ntqob+s=;
        b=QstkMlrMSL0lIbsuup2JX0eKhX81al/V2PtjG6LOj0upAIEMRrnCy58VRNgI0PqcoR
         /eUg4HqaW5E10lPG10DpdBdK8QCnwjxyVQeBXEGmBYHphWyQ1B9jaaDpBcsp9/zGxXLc
         qleOvXrRRFi5/y1JrJJ//7Pw89P7HDNybetCUFCVikWGMhs9VhuUeEzuMAyRy8J/IFwZ
         j35RlO+WN2CjlAdw6zKDh31JPANQ1XrV6UOXGNgyn+0oZUg8yEdwXCJQf5eltD0ELi1m
         m9GC0Hq/LqgP6HOiAgFCnc/G2e2FDBI3+BBY6To/3LVAf8f1uKBGDmB2Gl+GRRq+YO0e
         Dxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772141261; x=1772746061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFRtrnCi8gAbN7Gqhqf6fpZ+PJzmjbUPJ/K6ntqob+s=;
        b=goLFCMCPM2wZO4ROf8b8kRS79IZNAOvasJs9vdc1u0LLHFoWrLRX7bekx3IlTKIA9z
         1H5sn2wn1vs8wH4Y1OzhZ7DCsMWbeJtygm1S5Y1PyBSZleql9Ekr422/qb1n1g3EJlib
         05b+mIn3niKS0YqyeaTvwVpg/LbGG4l2k+rN2hGL2q9CLw0Mei1lRjwOmwHOmxgDpurp
         KE01+nMh6ioBTFueq8gToxhBQgdXpYYoSfWQwvqlaPD8fy/eKhAP+CORXqc1W37WWyFu
         2ZNYV3Q5LEmWCxORUTtI9WIuPV+pe+v0SldigwfPJU0VhR9ikBZ3PVfREpIMRKnburyz
         TG1g==
X-Gm-Message-State: AOJu0Yyor6lJjuA7JmHnFZJHC3Su+yeGL+DCErSeaSa9+4LgTjEQTV5L
	ZaY8+hOhnG+tUxX202ZtNF6OWglbykumk/+qIecPDVFUkzOE5XEBDbUjTPN+O+KA
X-Gm-Gg: ATEYQzwP+Jgp+TeEbxTZeCJ+ulj9eoMacKwZe+p1EshJyZ76qyGF3a01D9A6VCb7jKu
	NuHGu9jWcnnybFnxWTi3RUaHcZZg8ZCF5JLRHT0GR7fenMOmTm/lCevt5gqVLbqsEb2qVbtpcRJ
	KMHRlnBUks6q5HDu5Vi3yT5jpl8WmjWlDpJuw7Yv8wC+p5t2RLniN5mxDDFR283ojKz20/fzQYn
	ZrpCRFljgx3fEfhmoowjDdwiUZv3eSSwoFqP0dQzAQzRSWfOTVr9eCjzN0XlIIajA/5DOHRATM5
	NWUp89HyzKYFIq7L4JdQ9Q35iuqvuiXVVTcr5zEQpT81Fv1/7s0W7pBP62FEr24OqtguvLOfJ7p
	2wBy3Y4O8BWfvzbSfp4t0EAMiB6vgdMlamYTQpDi919Fa069qnkjS0ZXpRr1YoIplWqLSjabDPw
	+gSKZCUP0L7QCMjkcD3xYkeSqwP9/h627DOlbK7FVhsEw5b8l8B+rQ0JqFidiXFfU3Zr2WGYrwd
	dND5w==
X-Received: by 2002:a05:6122:a26:b0:566:398d:96b9 with SMTP id 71dfb90a1353d-56aa09a9a82mr343468e0c.1.1772141260466;
        Thu, 26 Feb 2026 13:27:40 -0800 (PST)
Received: from localhost.localdomain ([2804:29b8:512d:4c55:1868:543f:1aeb:fd26])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91bb4fbesm4104553e0c.5.2026.02.26.13.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 13:27:40 -0800 (PST)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jon Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH docs-next] docs: pt_BR: Add translation for maintainer-handbooks
Date: Thu, 26 Feb 2026 18:27:14 -0300
Message-ID: <20260226212716.260546-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the Brazilian Portuguese translation for the maintainer-handbooks
documentation. This document provides subsystem-specific development
process notes. Also, update the main pt_BR index to include the new
translation.

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
---
 Documentation/translations/pt_BR/index.rst            |  1 +
 .../pt_BR/process/maintainer-handbooks.rst            | 11 +++++++++++
 2 files changed, 12 insertions(+)
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
index 000000000..849c7705f
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _pt_maintainer_handbooks_main:
+
+Notas sobre o processo de desenvolvimento de subsistemas e mantenedores
+=======================================================================
+
+O propósito deste documento é fornecer informações específicas de
+subsistemas que são suplementares ao manual geral do processo de
+desenvolvimento :ref:`Documentation/process <development_process_main>`.
+
-- 
2.47.3

