Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A2F34F246
	for <linux-doc@vger.kernel.org>; Tue, 28 Oct 2025 18:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761676117; cv=none; b=LLAdiopeWKmgBfiTBt6sE5IYVY2yWIHKz7pU4pbxDn7IYALZ9lY+ATchXG8KKEfnD12OPU9q8sLDfKSEd4jW7F+TBhAQ1+6FOjVNOeweJYkvcCPIiCWrhEcmxJ4BtW85bSXKJk2qZn90Vftx9W0O+kRUOXCVkMeraGnDDzezu/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761676117; c=relaxed/simple;
	bh=2dAa4RMKmWD/bUrT5o5cw61/7b2o4SLA35npbfQLoj4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=PPnbrdyffRg2KjEtahwcoKjZn/nAc7ZVk9QhchCUQ9wnVm/eEMPbIagOC2diBb/HgDGq2h2VHrYOJw1PncNdipPbXqOEMstm0KAkact3fDKwBfILykzwzAYKNkQCLEcgYVhR0+pHlCu7Qqx4ixtLSf0m/Lry2Xs6+JrqQiF6s34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6jlEv25; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6jlEv25"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4770c34ca8eso25889515e9.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Oct 2025 11:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761676114; x=1762280914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=molTA5hkZyuDOYaFb92vgkuv4wnED9t/TDjtQWCsg9w=;
        b=R6jlEv25uFhxC8Nzm000XFMtdrGDhWMZx0U7uGx8Ue1P7xiRh6SbA/bVjLWTgu5X2N
         86N5U3YLpNoScayGg8qOvjceI0aM9JK4H+Bbp3c3wUkxAM1cVyjPVezhpby170q0BJXv
         OGEW33gEjI9vJIInM1thp2lGjpF8SVsR2TPyG+ag68EFrrW42gVCAFyOXVvoT08XVJ18
         bpe64XzdLCKbC8susKVBc7vjg3pE6viNYdC/hkTgjj6n0IynC1rvhL7zBdja0uHi6+pE
         JALPRKlT3zrthvfjj6NtFznA2okldQTIRWN8HoLl7UgOHQOz7QSJ8xHXvuz/4bMdhCqu
         IG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761676114; x=1762280914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=molTA5hkZyuDOYaFb92vgkuv4wnED9t/TDjtQWCsg9w=;
        b=MdVi/RyZsuYR4fuSM1i+LVi0qT1TBvgkaCgcPzkcXrxVAmBPIv8yy/jp5pV+mhXgZP
         Hr/xFxSHvVxNxzIq/59vPksw57CX1qt3wiqgLn7aoZdaIGDFtyGF94tycLAhOEIgvWvT
         TDrau/yjstceeDMC9qv9yMCbi4WrDTqj1W/vKBM/i4RkOfH0hIqjilc8lMcqkMB4D7eJ
         eGhykxpgP/aAPCq6RQ43f5YIVFgCt4M4gO6fZTK+4Q5ue0HGOBKYUs9SBbQ6mrPYkOrO
         84F3XTB+ut0Aw8C97a7qMFBxA9Tt6nkOfePgKg8Vgbxa3zSy5a/Qx6TZeiu0pRTpGMzR
         sE2A==
X-Forwarded-Encrypted: i=1; AJvYcCUASjPldxHsOgy+7zvHzRjGDqmEwS5dZYXwh+lxJzCCqL8zEf/6YkRV6SDCmrIWDo35hTM6aqGAjSI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbDpjgh1SVlywPU9agehdY0A4KjkHNS2Rrf0YxUjowLRJ2UZZW
	1FcLl6hSywPj2ShPjTdlySvN8R4rwr397PskUEzqf6WE7I1naKkKCKSQ
X-Gm-Gg: ASbGncuZmwmyJKIbYP9GL4282K0C9iWnlEIfPRlCvul3/tTJvQ2iqAn1NLcyPNqfnsf
	0ASvXWBZgjKcFDumrGNPb4KXq8J7bNDEr8sxgTAJFhfZZxttMHQz6hCzsLppOe607bCfiH6mMsS
	VV3GDSpL5JnUae34l8up9ptVvOR8gOA8T+K3sOwlM4btgqF3jxmuW5R4SqW9cYLtL8Xjz8tEl3e
	0Q+YXnN541kxcRy9YBCKYyNItJyhCX108aW6mSrMkGv1aW8VOEsmSgbPWwDmCrGxs0inyFu1u4E
	ttZo0/k3APpMKmAt67NhTF19DEWDCdfBO+OCP9uD9CufOsvP6s9yIGA5IxrAe0JM4zvBpObz/7z
	ggQG/PkLLtwJeyOhhDlUvuW9OMEisIReYafoAkfHEFdVd8/cAOIYCNetrsFhtpgucPNADQPS2Mf
	ktwRm5DLR8uO1k2WjnjA==
X-Google-Smtp-Source: AGHT+IHaMqZuas9WygehcwbfPiTeO5dpQVV/GnKrQNSaR3dSV5zdTBhceIjR5i7m5iWNLyC2LmN9tg==
X-Received: by 2002:a05:600c:4708:b0:475:d8c8:6894 with SMTP id 5b1f17b1804b1-4771e34a956mr3820075e9.9.1761676113806;
        Tue, 28 Oct 2025 11:28:33 -0700 (PDT)
Received: from imac.lan ([2a02:8010:60a0:0:a938:2bbc:5022:a559])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3b7ca2sm5110355e9.14.2025.10.28.11.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 11:28:33 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH bpf-next v1] docs/bpf: Add missing BPF k/uprobe program types to docs
Date: Tue, 28 Oct 2025 18:28:18 +0000
Message-ID: <20251028182818.78640-1-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the table of program types in the libbpf docs with the missing
k/uprobe multi and session program types.

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
---
 Documentation/bpf/libbpf/program_types.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/bpf/libbpf/program_types.rst b/Documentation/bpf/libbpf/program_types.rst
index 218b020a2f81..5e7a202dce5e 100644
--- a/Documentation/bpf/libbpf/program_types.rst
+++ b/Documentation/bpf/libbpf/program_types.rst
@@ -100,10 +100,26 @@ described in more detail in the footnotes.
 |                                           |                                        | ``uretprobe.s+`` [#uprobe]_      | Yes       |
 +                                           +                                        +----------------------------------+-----------+
 |                                           |                                        | ``usdt+`` [#usdt]_               |           |
++                                           +                                        +----------------------------------+-----------+
+|                                           |                                        | ``usdt.s+`` [#usdt]_             | Yes       |
 +                                           +----------------------------------------+----------------------------------+-----------+
 |                                           | ``BPF_TRACE_KPROBE_MULTI``             | ``kprobe.multi+`` [#kpmulti]_    |           |
 +                                           +                                        +----------------------------------+-----------+
 |                                           |                                        | ``kretprobe.multi+`` [#kpmulti]_ |           |
++                                           +                                        +----------------------------------+-----------+
+|                                           |                                        | ``kprobe.session+`` [#kpmulti]_  |           |
++                                           +                                        +----------------------------------+-----------+
+|                                           |                                        | ``uprobe.multi+`` [#upmul]_      |           |
++                                           +                                        +----------------------------------+-----------+
+|                                           |                                        | ``uprobe.multi.s+`` [#upmul]_    | Yes       |
++                                           +                                        +----------------------------------+-----------+
+|                                           |                                        | ``uretprobe.multi+`` [#upmul]_   |           |
++                                           +                                        +----------------------------------+-----------+
+|                                           |                                        | ``uretprobe.multi.s+`` [#upmul]_ | Yes       |
++                                           +                                        +----------------------------------+-----------+
+|                                           |                                        | ``uprobe.session+`` [#upmul]_    |           |
++                                           +                                        +----------------------------------+-----------+
+|                                           |                                        | ``uprobe.session.s+`` [#upmul]_  | Yes       |
 +-------------------------------------------+----------------------------------------+----------------------------------+-----------+
 | ``BPF_PROG_TYPE_LIRC_MODE2``              | ``BPF_LIRC_MODE2``                     | ``lirc_mode2``                   |           |
 +-------------------------------------------+----------------------------------------+----------------------------------+-----------+
@@ -219,6 +235,8 @@ described in more detail in the footnotes.
              non-negative integer.
 .. [#ksyscall] The ``ksyscall`` attach format is ``ksyscall/<syscall>``.
 .. [#uprobe] The ``uprobe`` attach format is ``uprobe[.s]/<path>:<function>[+<offset>]``.
+.. [#upmul] The ``uprobe.multi`` attach format is ``uprobe.multi[.s]/<path>:<function-pattern>``
+            where ``function-pattern`` supports ``*`` and ``?`` wildcards.
 .. [#usdt] The ``usdt`` attach format is ``usdt/<path>:<provider>:<name>``.
 .. [#kpmulti] The ``kprobe.multi`` attach format is ``kprobe.multi/<pattern>`` where ``pattern``
               supports ``*`` and ``?`` wildcards. Valid characters for pattern are
-- 
2.51.1

