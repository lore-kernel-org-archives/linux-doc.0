Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AE630B528
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 18:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761761387; cv=none; b=CMi8bl18k75yOREK+K0PltnN5XyVrbWMyw//25/a5KHmsqORO+rvHNS5rZ57+144kT/GNV462uO9jGUiIS1JydcZ9+bxplsIaQggjRbO6ysXPWN5In1UNjRL/rrA/t9hgRhNy0VO3Xv+AVZ82d2Ot3REQJjRIIJvODZXyz8p4sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761761387; c=relaxed/simple;
	bh=dWPZ1vMUZGwvldnx5hHqv6HtLWyBzsxGQxxMlT68dFo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Dv7WWoQvmg47v3GISbAaUBjfq36+1nhUpem06X6bjxpN90NB0kB0tWJ/woLqsnkAoDKpFnaP+a9FcauwTN1lZm29IWNIY2NO6dgBN6cU7Q6AfZEn014vwZXlfn0IRbPGO5vj/msYQ9jzOs88iw6KwUUBQlBzke7uGO5oN5dVtUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gOLUlSpq; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOLUlSpq"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-421851bcb25so75820f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 11:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761761382; x=1762366182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mXI33tD54+aq9nAZ/zSVwb1H0zSaU8dg1YNP4Ue9Y1Q=;
        b=gOLUlSpqrJkDg7270uSho/R/Mj8CgY+WgURZXZ70RMz2z+/noJxtF4PNPMGIqbR46D
         dwp6HwlqtUA04GfXN0EBhfmVKEEh7JM0OO3q9dq/XjB0EP+KgJC/F5EOpOJFImjFg/W8
         c2ILXA6BJrMC3Hw8RpRhshquFpgbHxe3EOGOLIj8Mktt4eutDQ4zQzLiq4nmCrkqq2SG
         LBo2i1oItJv2ZHplNDqFmsx39VnNMyvLjMJHk0R0kkCj+XPjD0rxfLQPDE/rTjXvMRi2
         /bb4hY110up9MTkk0AKtoqs/k167UaWaRtgUcvne+tKFUShznsBgUzSNBzN9cMdiEWVO
         cymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761761382; x=1762366182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mXI33tD54+aq9nAZ/zSVwb1H0zSaU8dg1YNP4Ue9Y1Q=;
        b=l8ctqGjWEaNnZEHCwgMJcNA5TkzlBbRoUBS2Bpo5sL3RV/CvgaUG6VScPnJr8xtPBx
         s+zD9OdDaLLX7VTO4E0lJjn7NFDuf+Nd0Dt9LsydhQxX6Ao1Kf04LdB2YV7/8v3gU2UA
         RDAp2mJL115LhXIU8xIuMjN/hdPyqIJauT+675H+e6gA8KnZhoIK/7r1l6BK9xXDbg1n
         VyM3g8f7siFo0imyaaXJ5UKE2t4FU6FSmZmY+HmeYPm/ICMjQhM6p1oBM8V1UBo8+K2U
         t3RZHyG3b3Jas64Of8qagJzP9eM6kU2fJX50L3XJnau8/Uf4YmLA+jy9KgmXT6d2bEiP
         ztcA==
X-Forwarded-Encrypted: i=1; AJvYcCW7uAr2k2DyIyT+sTjw5abT2SKmyzma8t8JQekoYvsgfN5++YIGb8XnUF1+8Ac6+nDgo874g0enkdM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw33++YPesQ2Qo9621w4pCZK6VarQR47kpwmfNGwUk9Tp+hHs3i
	W8gnOrIxTu1ZUOchQ0hziFi5lh5Mc1rbOM0QzDe5mN140BxgsKCHJl/1
X-Gm-Gg: ASbGncsm2hKYf7mjSi9wjsMnv9Ao906XUluB27aE3VaLccW3R3xTE6qmqWHzyS0ppm9
	z9UOpvCFu9w8LX7/C4AnHmD/JUtv654j67Y2Zn2zrpKul+Br7OCbF2znJ8qk/wreTjHx9wWV6Ze
	w08MaIMCtEchi7nkyaBOFN+PJeBKBZ4YKFZUD7EwLOZMwBNiayPu5xQMX0ce8LiP+LOjr6zNno5
	iFLFSFElWHXT8b9X3ekngIT/EahNxX/3WYkNSyJG9D1TfGpfaC5lEQk2UMLuSp2kYoOaQgPe3Ms
	7NR0/QfNrOOeEA7J8lIkbK14l40yVE8XCTSnaaCoAv4+DDgove+mNsCHBEj2vbdyJ8JUkTe7vTA
	YJljlGfQ9Cg5yYoKE+ws5ToFE2SgY9d97J8u4KOhkS5i8Cx6oebCVB6HM6+STFjZyO2UNndqGmm
	5AtobKWvYldmMSuKtXCyuMgFrhTG4=
X-Google-Smtp-Source: AGHT+IEcrPMculvGLm+7SwTY0vEPu2f5p0xV1Ze5JnahmEGnJoY0TXskVU7ulCQN2i8vhgM45yjxIg==
X-Received: by 2002:a05:6000:2584:b0:3ee:3dce:f672 with SMTP id ffacd0b85a97d-429b4c73515mr449295f8f.4.1761761381534;
        Wed, 29 Oct 2025 11:09:41 -0700 (PDT)
Received: from imac.lan ([2a02:8010:60a0:0:dfe:468f:744f:5a8a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7ce1sm26979595f8f.0.2025.10.29.11.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 11:09:41 -0700 (PDT)
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
Subject: [PATCH bpf-next v2] docs/bpf: Add missing BPF k/uprobe program types to docs
Date: Wed, 29 Oct 2025 18:09:32 +0000
Message-ID: <20251029180932.98038-1-donald.hunter@gmail.com>
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
Changes in v2:
- Document the correct attach types for kprobe.session, uprobe.multi and
  uprobe.session, thanks Jiri Olsa
---
 Documentation/bpf/libbpf/program_types.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/bpf/libbpf/program_types.rst b/Documentation/bpf/libbpf/program_types.rst
index 218b020a2f81..3b837522834b 100644
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
++                                           +----------------------------------------+----------------------------------+-----------+
+|                                           | ``BPF_TRACE_KPROBE_SESSION``           | ``kprobe.session+`` [#kpmulti]_  |           |
++                                           +----------------------------------------+----------------------------------+-----------+
+|                                           | ``BPF_TRACE_UPROBE_MULTI``             | ``uprobe.multi+`` [#upmul]_      |           |
++                                           +                                        +----------------------------------+-----------+
+|                                           |                                        | ``uprobe.multi.s+`` [#upmul]_    | Yes       |
++                                           +                                        +----------------------------------+-----------+
+|                                           |                                        | ``uretprobe.multi+`` [#upmul]_   |           |
++                                           +                                        +----------------------------------+-----------+
+|                                           |                                        | ``uretprobe.multi.s+`` [#upmul]_ | Yes       |
++                                           +----------------------------------------+----------------------------------+-----------+
+|                                           | ``BPF_TRACE_UPROBE_SESSION``           | ``uprobe.session+`` [#upmul]_    |           |
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

