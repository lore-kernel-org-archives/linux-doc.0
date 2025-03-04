Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A6A24EA8B
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 20:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741121128; cv=none; b=k5sd4VQOv2KJ/lzhLmi/QB/Wt01yJNofsokSh/E3eTOX27CXXC0t7uz7zfeB0UeLVQfLuzSmygXMJNBY5O0SDNXO/BFnca5XevU8wZhCFuJSscLhT5Jp8FqXhKufFpHkroxCPzAsPQPx6csSJfvssjn17qrqZF/2mYtp/qaKu+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741121128; c=relaxed/simple;
	bh=GBTYcWM988+PKQB7e+LWCSDv1bTZ9jOTHc6PlHK11LA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=KXl8GQlIp6ssv+cXG1+QVN4gUZjR9FyM1VS4WQohSCt84X6xnERzDN0Dj52yguI+2mQDJCsnwNkAUk46w5POzDLZrIpDeaMAQijd93Z2f/ozbULQXl3Pl7rWAcVeXp8E8XJ/oCMFlnZK4J7bgqqX/FUNTUqQooKUt7JGhhey1+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P9Phi7bb; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P9Phi7bb"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22380c707d3so53001905ad.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Mar 2025 12:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741121126; x=1741725926; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O/h3K1VAjVU+85Yct7CoBzw18CRZr0W5WJZ0048JDtU=;
        b=P9Phi7bbhFM4EUHnYOBI5owmxpoPMASwmpEAEortBpeXyhguguVeo74oFZX32R0DFx
         NZYokAQqSWjyAkjVNutE3quPraDyc83tLUxNKKuWUvVW7rTsHbuJmfexN2mvZSLoAd59
         S4xNSB75SncT6uR8Z6VJ5AftCR+yiSS0tiiRBBbQ3dsVluysmuc6IUO+7qLHGDJNSc0P
         W5jqD2nCV8Flts8qSfFkUOd/5fUqSpCvFMksjqSr68u8xcnjcUgJb3iP28+S8xwGN8UO
         tsftjoh5zCrtD4HFeVPlttOphg8sJdCKnqmpb9Q+qu8mpDuBaTDhR0BkiDzKSWEbv9xT
         88Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741121126; x=1741725926;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O/h3K1VAjVU+85Yct7CoBzw18CRZr0W5WJZ0048JDtU=;
        b=AJchJmAg/j8xK4xwQiGSdXRdOmnoq0XHlmIrcowwSr7gplHQmMt8ToBLyQWbjloQmM
         J1iLxqcUnV1f0mmsTnvQAeo1ITGOIITgzsVgiSuZI/ooGTYfb5GgW9P9aNwtz6vLBX5l
         uW3W8vA9RAdyfBeQ8Xp5dohT3Zy2L5qN4xomThcZiQ+MOJzB7/xHdJEkJLias2ESOv2B
         QVLVCEg0J2NHKUhcb6ftPwB9kxNz1bW83+EQy9faFnWYP4KPiZ4WEd3Qk4iGQhYCMcNl
         GGYBJUzQwrraIIT3y1sy2t1SlFdNo7AhVHcmVX6M7X/girvHiBIWh0u11PorJVulyAOA
         N6ng==
X-Forwarded-Encrypted: i=1; AJvYcCWIM8iGgGmZ+QvaZXbuS1lMb7MHQ43hrsVFlU4gF6tfbYSg47j1V5SSI1hk22zXkpM6M2HzgOy4CCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhVHii885zF2bi8I0dqKCXk2d1g8FLkgVsxzHl6cEOLnyH4smQ
	AH3IjVHl+0goaiVf+VR26XGeTU9L0kLB3JQMIE9zrR8LzrVfHlVmOPakoMALybsbM4k/AA+8c/A
	VH4zVdR/QjhKMcw==
X-Google-Smtp-Source: AGHT+IEvAad14fuI/QYpN+y45DYnXWvF1S16Js2zs5xq9qmOkzSmCsB9Vo4K4dzj+al9VXMxX9NcMQF4YzW17IM=
X-Received: from pjbkl12.prod.google.com ([2002:a17:90b:498c:b0:2ef:7af4:5e8e])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d50f:b0:223:5e76:637a with SMTP id d9443c01a7336-223f1c97445mr7020845ad.23.1741121125659;
 Tue, 04 Mar 2025 12:45:25 -0800 (PST)
Date: Tue,  4 Mar 2025 20:45:19 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250304204520.201115-1-tjmercier@google.com>
Subject: [PATCH] bpf, docs: Fix broken link to renamed bpf_iter_task_vmas.c
From: "T.J. Mercier" <tjmercier@google.com>
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Dave Marchevsky <davemarchevsky@fb.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, bpf@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This file was renamed from bpf_iter_task_vma.c.

Fixes: 45b38941c81f ("selftests/bpf: Rename bpf_iter_task_vma.c to bpf_iter_task_vmas.c")
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 Documentation/bpf/bpf_iterators.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/bpf/bpf_iterators.rst b/Documentation/bpf/bpf_iterators.rst
index 07433915aa41..7f514cb6b052 100644
--- a/Documentation/bpf/bpf_iterators.rst
+++ b/Documentation/bpf/bpf_iterators.rst
@@ -86,7 +86,7 @@ following steps:
 The following are a few examples of selftest BPF iterator programs:
 
 * `bpf_iter_tcp4.c <https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/tree/tools/testing/selftests/bpf/progs/bpf_iter_tcp4.c>`_
-* `bpf_iter_task_vma.c <https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/tree/tools/testing/selftests/bpf/progs/bpf_iter_task_vma.c>`_
+* `bpf_iter_task_vmas.c <https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/tree/tools/testing/selftests/bpf/progs/bpf_iter_task_vmas.c>`_
 * `bpf_iter_task_file.c <https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/tree/tools/testing/selftests/bpf/progs/bpf_iter_task_file.c>`_
 
 Let us look at ``bpf_iter_task_file.c``, which runs in kernel space:
-- 
2.48.1.711.g2feabab25a-goog

