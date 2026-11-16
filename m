Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794852876;
	b=c30BOIa3yRJclGROFNjGwunnG211cCT/8kf4j8aBAz3fhCn0UIC86oGGZBBpNbrkyAZx
	 tej6jk1g7xVX00bH5FK47y6Tu7QIaSV0PCkO/hlf91sPHcCl3N61v5lDu8BH0GOMDBoQB
	 ugpccn+kd9uQQnrBSRgcQuZQ/p+c0GaCBx3xPmGTDM+aGq0j9yvvEkW9g8MhjHT9V9Qnz
	 JiaAIq6Nvc52+0mItIo/w3nSNqtl+1YqG0HUJ32fxQU4mC2Bu3OTBqqXppnrL9bqYaZu/
	 dgGZNNl/G5ed68stxU0sEbfJH6MHiEU3izO6EmkMApKzGUBokPuFSz8KDPOfKFMq1IQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tbwNSvGvkZ6FGvVLTIjJxQ3bE6+PehswRYJGBnKvxtI=;
	b=DmF+sNmsovC0qSh+hBTjWHJw0vE1oAEC2SBy11krcQiN3pkEyfGqsk6AomevCk1WnRqb
	 9hWXGo0zIceej9DjERQ/AFlhE/o7URyDEqw8PCJ90UdIw6bnWOlNSl8QiQuNcCI4GKcr5
	 29IU9/2xZetontHnUr/1yANMoUjPrJWz4XjX0di1X9wMH4f4QWHAa6LHX+99xdi91gzoU
	 hdKl65afw7R2MAckkcyEEPVwHFMVHMMP3sn0uSq73pLRd5OvSmYCz9Qb5h2QBSQBB4vBi
	 hS7ES/ioSwylhgQzKCpuW8LxhxZ0+7nA+etiSFcwXi3JEH6uSEzmUm+8gaXoevuX6Cw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=REtwaOnD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB65606A323
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 18:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDB65606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=REtwaOnD
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50e9408873so117831566b.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 10:14:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794852873; cv=none;
        d=google.com; s=arc-20260327;
        b=UOOrTYhlLiVRFSmtkj97cSYJDlx0ckT+WtGVT3J3tblOlbhzfQV7nL6Q1W2BH8q8xb
         U7ukYGQdZ7TGqtZOjFuukAh4nRfqoG5QUgdP8xAQ4xsMK45AWHhtoxKOrInmZr0Eyb6B
         I/qK2RAa8kik1J2wHjs25/vRhJde9mch6aTK4Wccjyuw+u0/CVvzImCC/nNGGyoNdJKE
         etPpffZdMoD/rRuww1gk2AqPJ9STrlrI/F11vKw8/VS+tmTmJuKm1d0EVKUD8DpoIJ8X
         jJjzWGz3lzUMvbVHXTOzTJn/DqDkT0Qn/HS/jK6fL3MPniw8ilgV4tuDhuVtSdcYHdBE
         29Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tbwNSvGvkZ6FGvVLTIjJxQ3bE6+PehswRYJGBnKvxtI=;
        fh=jju7ddJBfXDu0VVqWXRbIXHRJNYpnE4Z7oS/mM2SvvA=;
        b=SmseULkiCagL3kTWmdTsMCXjGKcFOKrnSlxdg/io5L7Kr2rK5y20x/QTN0SypLR/WO
         OylhFB2IWHwit3AaGGcTMCsPwfcWMUwfLuOMuE07K4qp9Dc72B3trtCGRVGFlPPBHiwe
         9wsU4WONVLbyEoRT01k0d9ceqhRQurEt1ipcg5E8xr2FR72VYSSCwaRax6/HG3XVt1vC
         wrYX+8LcERfAGwhebev3YVD7pXQAsTNaYVsfTtx5nhaMnseIvMFgC9w666G2Z6Co8mh4
         rNhHGH2kuXO15ZMkigvw64BOTD4EWxx+Nj4YvuMuM8cWkNzs4GSJveI3IGYZeiHX0v5U
         P8PA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794852873; x=1795457673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tbwNSvGvkZ6FGvVLTIjJxQ3bE6+PehswRYJGBnKvxtI=;
        b=REtwaOnDQoPmhuzfDWBecqvY2Nej4BY/Jc4KPgXp1NH++xbW04qqs5XLWElU23N/Kf
         JT129YSY9gG87GzUgRtmPPU7nYEKhNe7HzFsEnt/iUqSYBZUvSUmK5XCYL3rOgR/hWkg
         r5bgTY1lUh7wS2Lbao3cD8uS9cQAUZemxzLXULZHVyKKhcvKLiIZxS/FtShIFca0fXDV
         RJjhaLktOXMJzhtbTg7TEcdaFfcB6cd8GTXsdJ8UkF6yvS05qEbeimYnaXQwHM3DhO7K
         Px8BixiJP2UdTiHOBgaKbygtKt2z61AwQ+CYPuD9Ah9l5olPiDAcmFd7h4I+lTgm/3Qw
         c12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852873; x=1795457673;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tbwNSvGvkZ6FGvVLTIjJxQ3bE6+PehswRYJGBnKvxtI=;
        b=k6lNXzsYSeijkYSvnenUwzL3V0ZH9ik87ig+ewMi1stjtYi0J4cO9b+J29ePLH+3Pb
         mqnBLxykwSGSM1mfYBfEJTRXAlvQSu5Jo6/KwXElWeewuQau2CT4eqhAvE5/2u+KpfJT
         oYlC1d3BrqmxVDmiPROaHG849DReOyI7cITFXue2RFL+z7jtJkVD5jZr+OyJlOPAydUm
         ExTZzsZlI30FiiZR4CHKkm3QPrAe6rHEMI3Y4o8iA+sxUjeYrpQhzT9rrLVufFrPZaw/
         vOBS/jibDlkIt67ohwCBchx2A/d+6ga2+6IXK1criHUZpFm0bgcg/SwQbwlMtdz9paiS
         Qafw==
X-Forwarded-Encrypted: i=1; AL+hErESgyNhLKPVLvjmr/rbjemau+WLWINKx4D2pqm7m5Lm/emYRpulL/oSYeGjWkTp/FvMB+1kjIxkdAE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PmsPWo93y6QTvMxRR19//wVtDIv+8w1hbtcCVpvN0tnbxWyW1
	vX5lXWbCrDfrXLmbDhQMvpcFI6XTg3xAFvAa/oGXsBiVKHULsSugQFLzB4hopXbqOKXSy4HIkgX
	mE3XAnqsnlWvm5Nfso0as2Js0LSDmqHsRCw==
X-Gm-Gg: AYBFou1UOEkEOMyb2KWVe/iQy6eV+2cBQ4NKC3XEK27Bj8TWieCYmeX3+IcQxZg82aO
	swLjCLZiUHOw8mR4ShJXYc2SRm4dqQVz6npI0xyW5zf7NyD1jKlJPeAU38ESlv2yaWmQAl2zVGN
	wI9ummhHc0O1Zo+RU5VeQoqg0LQv/oDu1t7iZkjGj70XgFJofkFzh7EU+GE6fLsMSlWFf4ehEzA
	O1kTFxrGnHNCWWPJL9DlwmpD/5XbxPkCMBf4OwKLQvZpuZCNqMaN90tRLjUQFx7CCQ52vL0M+J5
	OGvoaW9jjedu/geXjrD4vNKkUVTfT8i7dyOBOk8Xo3BqFZxADnDU7TALMoO0+Ei4pddWz2x/zxX
	6sw1OFoJ2V4HUqtWiX/niqxx6WzNJW3pT33RXbt5CY9VzR+PGHd4EvPTk1X9svUQOboLO1Q==
X-Received: by 2002:a17:907:3ccc:b0:c49:a235:8e0c with SMTP id
 a640c23a62f3a-c509637e31dmr934233266b.22.1794852873007; Mon, 16 Nov 2026
 10:14:33 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025164719.1831477-1-sashal@kernel.org>
In-Reply-To: <20261025164719.1831477-1-sashal@kernel.org>
From: Sasha Levin <levinsasha928@gmail.com>
Date: Mon, 16 Nov 2026 13:14:19 -0500
X-Gm-Features: AclHuK9sfeiUUhkQOi4L3FtpqX1XWSWrAtRgGWBj0BPLzcNiTLpwmGT382OC52c
Message-ID: <CA+1xoqcxAsRij1j10TyhNX9JXNXNkdWO3sMaVRXCqYdEXi45fg@mail.gmail.com>
Subject: Re: [GIT PULL] Kernel API specification framework for v7.4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping?

On Sun, Oct 25, 2026 at 12:47=E2=80=AFPM Sasha Levin <sashal@kernel.org> wr=
ote:
>
> Hi Linus,
>
> Please consider pulling the kernel API specification framework. It has
> been discussed on the lists for over a year: five RFC rounds starting in
> June 2025, then v1 through v5 this year, the last on October 8:
>
>   https://lore.kernel.org/all/20261008084956.2911790-1-sashal@kernel.org/
>
> The branch has been in linux-next since next-20261009. I held off on
> sending this until the first week of the merge window was over, to let
> things calm down.
>
> There are two conflicts with what you already merged. linux-next resolved
> both the same way:
>
>  - Makefile: kbuild added '*.header-check' to the clean rule at the same
>    spot where this adds '*.apispec.h'. Keep both lines.
>
>  - fs/open.c: vfs added filp_close_sync() just above sys_close(), which i=
s
>    where this adds the sys_close() kerneldoc. Keep filp_close_sync(), the=
n
>    the new kerneldoc, then the existing "Careful here!" comment and
>    SYSCALL_DEFINE1(close).
>
> The following changes since commit a90ee4305c4a5df72c11b31dacfdc76e00fcf7=
8a:
>
>   Linux 7.3-rc6 (2026-10-04 13:45:25 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/kapi.git tags/ka=
pi-7.4
>
> for you to fetch changes up to ef777ef05ebcc5ea5393b4bd5af6fc3ad1b3aec9:
>
>   kernel/api: add syscall enter/exit tracepoints (2026-10-07 18:26:44 -04=
00)
>
> ----------------------------------------------------------------
> Kernel API specification framework for v7.4
>
> The contract of a kernel interface (which arguments are valid, which erro=
rs
> come back and why, what context it can be called from, what it locks and
> what it changes) only exists as prose in man pages and comments, which
> tools cannot check. This adds a way to write that contract down in a form
> that tools can consume, next to the code it describes.
>
> A spec is structured kerneldoc covering parameter types and constraints,
> return values and error codes, execution context, locking, signals,
> capabilities and side effects. At build time kernel-doc turns it into C
> data in a dedicated section of vmlinux. From there a spec can be:
>
>  - checked against syscall arguments and return values at runtime by
>    CONFIG_KAPI_RUNTIME_CHECKS, a DEBUG_KERNEL option for x86 and arches
>    without syscall wrappers; a call that violates its spec fails with
>    -EINVAL before the handler runs
>  - read as JSON from debugfs
>  - extracted from vmlinux, debugfs or the source with tools/kapi, which
>    emits JSON, RST or plain text
>  - followed with the kapi_syscall_enter/exit tracepoints
>
> The first specs cover open, close, read, write and madvise, with a KUnit
> suite and a selftest in tools/testing/selftests/kapi.
>
> Everything is behind CONFIG_KAPI_SPEC, which defaults to off. With it off
> the syscall definition macros expand as before, kernel-doc output is
> unchanged, and the only change to fs/ and mm/ is the kerneldoc text.
>
> ----------------------------------------------------------------
> Sasha Levin (11):
>       kernel/api: introduce kernel API specification framework
>       kernel/api: enable kerneldoc-based API specifications
>       kernel/api: add debugfs interface for kernel API specifications
>       tools/kapi: add kernel API specification extraction tool
>       kernel/api: add API specification for sys_open
>       kernel/api: add API specification for sys_close
>       kernel/api: add API specification for sys_read
>       kernel/api: add API specification for sys_write
>       kernel/api: add runtime verification selftest
>       kernel/api: add API specification for sys_madvise
>       kernel/api: add syscall enter/exit tracepoints
>
>  .gitignore                                       |    1 +
>  Documentation/dev-tools/index.rst                |    1 +
>  Documentation/dev-tools/kernel-api-spec.rst      |  648 +++++
>  MAINTAINERS                                      |   13 +
>  Makefile                                         |    1 +
>  arch/x86/include/asm/syscall_wrapper.h           |    3 +-
>  fs/open.c                                        |  557 ++++
>  fs/read_write.c                                  |  710 +++++
>  include/asm-generic/vmlinux.lds.h                |   14 +
>  include/linux/kapi_syscall.h                     |   35 +
>  include/linux/kernel_api_spec.h                  | 1226 ++++++++
>  include/linux/syscalls.h                         |   42 +-
>  include/trace/events/kapi.h                      |   74 +
>  init/Kconfig                                     |    2 +
>  kernel/Makefile                                  |    1 +
>  kernel/api/Kconfig                               |   74 +
>  kernel/api/Makefile                              |   13 +
>  kernel/api/internal.h                            |   25 +
>  kernel/api/kapi_debugfs.c                        |  553 ++++
>  kernel/api/kapi_kunit.c                          |  720 +++++
>  kernel/api/kernel_api_spec.c                     | 1470 ++++++++++
>  mm/madvise.c                                     |  549 ++++
>  scripts/Makefile.build                           |   26 +
>  tools/docs/kernel-doc                            |   12 +-
>  tools/kapi/.gitignore                            |    3 +
>  tools/kapi/Cargo.lock                            |  679 +++++
>  tools/kapi/Cargo.toml                            |   20 +
>  tools/kapi/Makefile                              |   33 +
>  tools/kapi/README.md                             |   33 +
>  tools/kapi/src/extractor/debugfs.rs              | 1704 +++++++++++
>  tools/kapi/src/extractor/kerneldoc_parser.rs     | 3335 ++++++++++++++++=
++++++
>  tools/kapi/src/extractor/mod.rs                  |  442 +++
>  tools/kapi/src/extractor/source_parser.rs        |  531 ++++
>  tools/kapi/src/extractor/vmlinux/binary_utils.rs |  461 +++
>  tools/kapi/src/extractor/vmlinux/mod.rs          | 1160 ++++++++
>  tools/kapi/src/formatter/json.rs                 |  659 +++++
>  tools/kapi/src/formatter/mod.rs                  |  220 ++
>  tools/kapi/src/formatter/plain.rs                |  679 +++++
>  tools/kapi/src/formatter/rst.rs                  |  802 ++++++
>  tools/kapi/src/main.rs                           |  123 +
>  tools/lib/python/kdoc/kdoc_apispec.py            | 1391 +++++++++
>  tools/lib/python/kdoc/kdoc_files.py              |   12 +-
>  tools/lib/python/kdoc/kdoc_parser.py             |  101 +-
>  tools/testing/selftests/Makefile                 |    1 +
>  tools/testing/selftests/kapi/.gitignore          |    2 +
>  tools/testing/selftests/kapi/Makefile            |    7 +
>  tools/testing/selftests/kapi/kapi_test_util.h    |   31 +
>  tools/testing/selftests/kapi/test_kapi.c         | 1163 ++++++++
>  48 files changed, 20350 insertions(+), 12 deletions(-)
>  create mode 100644 Documentation/dev-tools/kernel-api-spec.rst
>  create mode 100644 include/linux/kapi_syscall.h
>  create mode 100644 include/linux/kernel_api_spec.h
>  create mode 100644 include/trace/events/kapi.h
>  create mode 100644 kernel/api/Kconfig
>  create mode 100644 kernel/api/Makefile
>  create mode 100644 kernel/api/internal.h
>  create mode 100644 kernel/api/kapi_debugfs.c
>  create mode 100644 kernel/api/kapi_kunit.c
>  create mode 100644 kernel/api/kernel_api_spec.c
>  create mode 100644 tools/kapi/.gitignore
>  create mode 100644 tools/kapi/Cargo.lock
>  create mode 100644 tools/kapi/Cargo.toml
>  create mode 100644 tools/kapi/Makefile
>  create mode 100644 tools/kapi/README.md
>  create mode 100644 tools/kapi/src/extractor/debugfs.rs
>  create mode 100644 tools/kapi/src/extractor/kerneldoc_parser.rs
>  create mode 100644 tools/kapi/src/extractor/mod.rs
>  create mode 100644 tools/kapi/src/extractor/source_parser.rs
>  create mode 100644 tools/kapi/src/extractor/vmlinux/binary_utils.rs
>  create mode 100644 tools/kapi/src/extractor/vmlinux/mod.rs
>  create mode 100644 tools/kapi/src/formatter/json.rs
>  create mode 100644 tools/kapi/src/formatter/mod.rs
>  create mode 100644 tools/kapi/src/formatter/plain.rs
>  create mode 100644 tools/kapi/src/formatter/rst.rs
>  create mode 100644 tools/kapi/src/main.rs
>  create mode 100644 tools/lib/python/kdoc/kdoc_apispec.py
>  create mode 100644 tools/testing/selftests/kapi/.gitignore
>  create mode 100644 tools/testing/selftests/kapi/Makefile
>  create mode 100644 tools/testing/selftests/kapi/kapi_test_util.h
>  create mode 100644 tools/testing/selftests/kapi/test_kapi.c
>
> --
> Thanks,
> Sasha
