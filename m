Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608036;
	b=Zilps+7ntqEFlGM5sg3tm/K0nbqXYBWTHoqRHZNjJ2FYiSWm66VvD0TJUS4D+6DtgRon
	 EQScHWdTsc8jDcWnGOp77D+tmTlCfJ3Fl5aEsMP08AKCeM4XAeCsZIIco/5386K3G1sz1
	 mGBZ8dY3scffg5hKbnrtiL1OKVAIGAJvwwgs3N7KPLnyGO8A+aGXH/uBDqFdY6QEr3iI5
	 XMJDc5Vy96yPunJnjntgNFvr6HSfcP2R2x+wkBEhLAnPijeWo4JU15lic8+X0lB4VXy/a
	 8H2XpXNO/wB9kdKxuMd/C2EAk2nz+rFIlDlc+QSG1wd14vERgne7bxzjhTSGalSgbQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=NexZ2xLQ4LexIAyhPn8eStBsD+iuDC+wM/nvMrZ5LMk=;
	b=TEQUOo4S0K7W+tbEEktsFmUc2k9YP3hzf2O6r6VLYttO5zhSKRaGsg3skH/QZ9LGh1W7
	 DAd2OYy1EYaSs7c/fcgXdyyetkGqjG5EH2ARz7kbDPCDsgQei2mISiDc8IyOxmf6++xHU
	 yabal5nyBGiSOmcq2Rq9w3f6RoUFP+GwXvD+ElQN5xqm9IoT2bBM/XrvTQywcQrXVig4K
	 Rds52JFVqWhOsRwi0mUDF5jNLmaCO57MR4gUmel3XsP1BA2T8j+2wFfyclVuqXc6g2JeA
	 KY1MymHyx9poDJjEwiFXJeltY5jrkMxaBmCI7qfzn6t1w1TQomjCgjBvUzdUBqnQRRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d9EHKR6J;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166DF606A323
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 22:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 166DF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d9EHKR6J
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so311700c88.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 14:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794608034; x=1795212834; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NexZ2xLQ4LexIAyhPn8eStBsD+iuDC+wM/nvMrZ5LMk=;
        b=d9EHKR6JclNFrRqlma/gegOnYEs8CGlfm9OVyxkdh+j70S4CRO8bf4suzcL32L/erp
         HjpKEftmM3vX2rkwT8iKePx6VhubP/KQG4uDrYMfeckOw1ZElyXNNE+broyp3f458C9F
         FvpCpznCuOUVu+KcA+kPeRPzOfOqjOCmMHku9AX1eDLdNhRslm/FCrJUxkZJBqQYJPtE
         IXhnbRk+8/9PUktOL1LwrT9pHTMocIPg27t5enT0/pe3q/j3cMJrXf0xgoS9gKpV7qjW
         x9BYaCCTO+sQ13y0dPs3KyTwbciGZCPcPs38bAc9sGLe3QCjEn6iQXCLaVvyP1J4Poqz
         Um3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608034; x=1795212834;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NexZ2xLQ4LexIAyhPn8eStBsD+iuDC+wM/nvMrZ5LMk=;
        b=BQA17yt4RBIH/Lls7oAm0W6oBzaqXDCws6UDJfbrJjs3AV0FYHzYhOGULRVyx8e0e/
         tpVxGX30W421C+0WDyLTsNR/BLcgsWLBQKYWf72R5AqLqhCm3fr8VMHMvInOEUkITw3h
         w8q/nm9Yh+LR6u+ID33C8xPVO1hJbRjIx0DQdNHuMZljqjPeY72GMCFkxgfz28uc2U1b
         tedIMaJV0yOWV5Lr3fItr2CATp8HXHzwq7wBovkfl6V3fxJ1IowWjCGMNHnhotBeUeuO
         28guO1Nc9IZYoKWR4OS8WCEfubC5hwi2P0Na1W6dmYwOD4waDPNbOPhV1fSXt2BL/lFf
         ZQ1g==
X-Forwarded-Encrypted: i=1; AL+hErGbCz6It0eJCGb92hh8USLxpkIzUYI2in+AIsxXS6DpSkrtfuSq4a5Vx9/Zl563CHfgLQMq5d8pwTU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SXjEOaKMCowvYuunnPpn8oTLQN+yM3d6jewfkd6OFKDbWcHiW
	malW9vDAX0T0u6u3Fn/+2XdP2H59VQampd/cxFDGY25fWX5ReCQVGpMIOhuN7MOiB/B6mNHA+Ye
	dtDVlpEa6ri7tzw==
X-Received: from dlep20-n1.prod.google.com ([2002:a05:701b:4594:10b0:1b2:375c:827])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:21c3:b0:1b3:a8a3:c6de with SMTP id a92af1059eb24-1b50306c4e1mr3614192c88.5.1794608033867;
 Fri, 13 Nov 2026 14:13:53 -0800 (PST)
Date: Fri, 13 Nov 2026 14:12:45 -0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261113221248.3535369-11-wusamuel@google.com>
Subject: [PATCH bpf-next v3 0/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME and
 KALLSYMS_QUERY_BY_ADDR ioctls
From: Samuel Wu <wusamuel@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, Samuel Wu <wusamuel@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

/proc/kallsyms is the primary interface for userspace to query the kernel
symbol table. However, resolving even a handful of symbols or addresses
requires reading and parsing the entire text file, which is often several
megabytes and takes thousands of read() syscalls.

This patchseries adds two ioctl() commands to interface /proc/kallsyms:
1. KALLSYMS_QUERY_BY_NAME: Finds a symbol by name, or be prefix with the
   KALLSYMS_QUERY_NAME_PREFIX flag. The default is to search vmlinux
   followed by modules, but userspace can specify a specific section with
   the optional module_filter. Each call returns one match along with the
   match position, such that subsequent ioctl() calls can continue with a
   (position + 1) call.
2. KALLSYMS_QUERY_BY_ADDR: Finds the symbol that covers query_addr. A
   caller that needs an exact match can compare input, query_addr, with
   the output, sym_addr.

Both commands fill a shared struct kallsyms_query_sym, with fields:
address, size, and optional name and module buffers. Buffer lengths are
in/out; on -ENAMETOOLONG the required sizes are still returned. As with
the text file, return values adhere to the same permissions (such as at
open() time), otherwise the ioctls fails with -EPERM.

For version compatibility, each struct carries its own size, so the
command values do not change when the structs grow.

libbpf uses KALLSYMS_QUERY_BY_NAME to resolve typeless ksyms. It matches
exact names plus "<name>.llvm." prefixes, as well as indicates if there
is name ambiguitiy; this keeps the semantics identical, while still
getting the performance benefit.

1. libbpf typeless ksym (8CPU Cuttlefish VM, BPF):
   Metric                      Text parse  KALLSYMS_QUERY   Change
   --------------------------  ----------  ---------------  ------------
   Resolve 11 typeless ksyms   152.6 ms    4.41 ms          ~35x

2. Perfetto symbolization (8CPU x86-64 VM, 175k-line):
   Metric                      Text parse  KALLSYMS_QUERY   Change
   --------------------------  ----------  ---------------  -------
   Init                        131.0 ms    0.04 ms          ~3000x
   50k symbolizations          28.6 ms     3.5 ms           ~8x
   traced_probes VmRSS         15.0 MB     4.5 MB           -70%
   traced_probes VmHWM         23.7 MB     4.5 MB           -80%

Note: Main reason v3 numbers are slower than v2 is that ambiguity
resolution in libbpf requires extra ioctl() calls.

Changes in v3:
- Add new and missing ioctls in ioctl-number.rst (Randy)
- Split into two ioctls() BY_NAME and BY_ADDR (Andrii, David)
- Add shared struct for both commands (Andrii)
- Add optional name and module inputs (Andrii)
- Encode size 0 in commands and keep the sizes in structs (Andrii)
- Add an optional module_filter (Andrii)
- BY_NAME searches vmlinux, modules, ftrace, BPF JIT and kprobes (Andrii)
- Add one-by-one pagination for BY_NAME (Andrii, David)
- Add prefix matching (David)
- Do not return hidden BPF JIT symbols (bpf-ci)
- libbpf: retain semantics (match ".llvm", fail on ambiguous matches) and
  fall back to text parser on error (bpf-ci, Andrii)
- Added module_kallsyms_find_name() as a separate patch
- Selftests: report skips with a reason (sashiko)
- v2 link: https://lore.kernel.org/all/20261023001603.560210-8-wusamuel@google.com/

Changes in v2:
- Replaced the BPF syscall approach in libbpf with the more generalizable
  KALLSYMS_QUERY ioctl() on /proc/kallsyms, per Andrii
- Added KALLSYMS_QUERY_BY_ADDR for address-to-symbol lookup
- Added proc and bpf selftests and procfs documentation
- v1 link: https://lore.kernel.org/all/20261009130708.1370675-1-wusamuel@google.com/

Samuel Wu (9):
  Documentation: ioctl-number: Add PROCFS_IOCTL_MAGIC range 0x10-0x11
  module: Add module_kallsyms_find_name()
  kallsyms: Add KALLSYMS_QUERY_BY_NAME ioctl to /proc/kallsyms
  kallsyms: Add KALLSYMS_QUERY_BY_ADDR ioctl to /proc/kallsyms
  docs/procfs: Document KALLSYMS_QUERY_* ioctls on /proc/kallsyms
  tools: Copy KALLSYMS_QUERY_* definitions to linux/fs.h
  selftests/proc: Add KALLSYMS_QUERY_* ioctl tests
  libbpf: Resolve typeless ksyms via KALLSYMS_QUERY_BY_NAME ioctl
  selftests/bpf: Test typeless module ksym resolution

 Documentation/filesystems/proc.rst            |   9 +
 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 include/linux/kallsyms.h                      |   7 +
 include/linux/module.h                        |  13 +
 include/uapi/linux/fs.h                       |  56 +++
 kernel/kallsyms.c                             | 379 ++++++++++++++++++
 kernel/module/kallsyms.c                      |  57 +++
 tools/include/uapi/linux/fs.h                 |  56 +++
 tools/lib/bpf/libbpf.c                        |  99 ++++-
 .../testing/selftests/bpf/prog_tests/ksyms.c  |   9 +
 .../testing/selftests/bpf/progs/test_ksyms.c  |   4 +
 tools/testing/selftests/proc/.gitignore       |   1 +
 tools/testing/selftests/proc/Makefile         |   1 +
 .../selftests/proc/proc-kallsyms-query.c      | 248 ++++++++++++
 14 files changed, 939 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/proc/proc-kallsyms-query.c

-- 
2.56.0.679.gc527c65306-goog

