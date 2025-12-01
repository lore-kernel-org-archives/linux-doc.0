Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD3F30BB95
	for <linux-doc@vger.kernel.org>; Mon,  1 Dec 2025 12:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764591862; cv=none; b=JYiGvnARwDM8rYcUbNSvd31nv4PvBEgVI0nuEr25duBER4iz2QFW5fSy8n3r5kTPe4W0qnJfhirfWB9kyxVnzDMGYwvqqZ9zJwNyAuOncPGlr/hTm2n6xzDtezlzBQORHGCR8YvrB6A4F0GYXUdKZEmN88rShGWFcjeQqYBJ+iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764591862; c=relaxed/simple;
	bh=/+W6BnRm41PwQfr1i6QnKDnTOxqcyEQ40SOEI/y9Gs0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GDld6AriSwyRXUj0w6If5euaPbVOe2PdMZGvpLKM5X4lNZ/jx1axDCDNa0t7vTIkc2HkuV37LdiBY+e2qQK+2NPH+AKr+nvVhQCYMddoqL9nnXGmsA0Xn0B+JpNGCsdiF8pyKaXFqeh00I8O+37AgG3VBtUGnPlmmlRehRaJ3EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=eHwHSctb; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="eHwHSctb"
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1E35B3F2B3
	for <linux-doc@vger.kernel.org>; Mon,  1 Dec 2025 12:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1764591851;
	bh=7Mkjq1bUgfEqWcPG7pP9ef/rURS8Z4bqcdLjGL4dulQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=eHwHSctbbIMepkkfs29EA3B+NgflW2gq8QpymtjdKe+1s10sXuHxt3FlG332z3mke
	 XcH08RWRG9ysv6OcqCQ/aPNX6WbF31Yklp0SFj2TCtDD1JI3xNHgy8w8Juhs3wXd8T
	 0Ao+pgzFed85cwom+7XOOtCyOBGmIPASA0ArNoTvAaF4++7FiPsdmip0XgDxjX0fKn
	 Pwzt74hktABhgpZYs4LmkgfX0yazAuW7OLAt/UE9VbV3RKUWQddcEUzXXPiAsTteFC
	 dJIGbwJe2ZidD3QpLPrT2vcCA1GEvBzw8yxFzB0DmHat3Lc8XifJq/2gE4QE3MpvTe
	 0HnbzvSmtLXZ/ZMkxG/FbvLUwYLlPk2UE94TAaia+TUnj8VcPyMYJsBRNSzF/eHW8K
	 uSOG0JBvtzRqzWiTwaz2uK/0MEeWgoZRma0V0y7TtsUZaPJECFjE3BcM4TsaOzXFQY
	 V3Ur/kTFknt/ph1HsDUp8TtKWYMvOyhwtpcZihdpv+Etu6j45PmPS6BctgWbeqGg3L
	 DZMEEoztXGCkIYeymXfcZZ74uMXWItMmaCR0Cb53TVhD7COaRpbMFYrajhzvoI29yC
	 ku0MNCxnV0xMbhG65UHd8XDJih1EFI/+Olz/Ll9Q7t5Vkq2qbeWCk9IE8cue42Bs6F
	 B8U98huBs1dwkxWd8fx3i8b4=
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b736eca894fso330884766b.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Dec 2025 04:24:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764591850; x=1765196650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Mkjq1bUgfEqWcPG7pP9ef/rURS8Z4bqcdLjGL4dulQ=;
        b=rPv742R/FT1p5vwTYSRZwuImipjwv4BgPV3Gi5uQ7OEl8x6HZhXOY/IRww+9AzIjpN
         bnNN5osVoJVd6ioj+Wk8ORechedGKGJgyzQ/kinEgLbTwAlvkO7K03a1BpXQOWvGruHe
         zuAtGz4yRUG0ivnVaCfKoK1ZjlGQZRp4ymvAf40KI5mEYhjfWG1gU+/QY6VtHudD6bNg
         sb8KXuWfw4XPGZhtoKtamAwNjdYnRJFsP5ysdLdPQsmLUkBf3KxStzhBfZu8tLAtzidh
         oA5gew7z6MunwfFsXfjZ8FkjMKIfVOsA0o//vHSWxa746vRMiFyKLbDRiKobSB4mc6fb
         q5Sw==
X-Gm-Message-State: AOJu0YwDFnTu6eX+rZf5HapSc3yhjBuvE+u5XM67JylNo1NWFTooXVW9
	UAe5d+EDbuWy/ZfIvFqW76EdgiYb2Wv/2dgkeNoMyiZiDY65ZGHW1Dh2kSYDgOl89RVpSutCRXs
	Lfwr3Y4ZFW2bwxDKoXvm4dngwD08ifyoMipxA5vuWLAitsNN4nHiGCqmrhk23UNF8s08Lwutm0A
	Wp0w==
X-Gm-Gg: ASbGncsSR57Q4vNYVoEU4I1ynFvy5GAMkz6LkJlpIxb1op4vb3wxhfSNLGcCkfqg1Px
	FpifOX3N4oW60NFwYKDHCVDotwFj+dQTY2jkPddmiEXmocuBDgAsAShao1bJp+tSUReo5g3f3L6
	3eGZlSH+yqQywaRpDkApRDQoh2jRtYqu7LJ6gQC2Pgvc0lMnAzIEy5P1/8SlYe+PPyrY46C/ACV
	k8RhQytK9wvVFPF1cxmiFhxuotj/rLOkqlKk0whzsdlLPvjIZa2PavfapQ2heg+tPqr9/kqiTOR
	BlmbXz6vFL+9LfaSavRtUirtXViqBkt7f35PWGxaezShasx2Ca3Zf5Hvn44jVSuMxcCfZCO2s1S
	1c7aeUsxFSOLl4+XbCGHsCRMXeodayJSNK7NfltgEL1G6yM2Gjq1GoPfRNagHa4e3UHTPKo8CXJ
	rGrRzrP25PE0bo1567x3sBOPyc
X-Received: by 2002:a17:907:9812:b0:b73:398c:c5a7 with SMTP id a640c23a62f3a-b7671847649mr3675877566b.41.1764591850296;
        Mon, 01 Dec 2025 04:24:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEB6mTSXIUXj7rWz03oA7m7S8ohwwSd/s14P0xUJXb50kip7lK8odKTbRY9H9EdRDRcT1PoSA==
X-Received: by 2002:a17:907:9812:b0:b73:398c:c5a7 with SMTP id a640c23a62f3a-b7671847649mr3675874266b.41.1764591849812;
        Mon, 01 Dec 2025 04:24:09 -0800 (PST)
Received: from amikhalitsyn.lan (p200300cf5749de007c66abd95f8bdeba.dip0.t-ipconnect.de. [2003:cf:5749:de00:7c66:abd9:5f8b:deba])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a6ea36sm12307884a12.2.2025.12.01.04.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:24:09 -0800 (PST)
From: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To: kees@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Tycho Andersen <tycho@tycho.pizza>,
	Andrei Vagin <avagin@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?St=C3=A9phane=20Graber?= <stgraber@stgraber.org>
Subject: [PATCH v1 0/6] seccomp: support nested listeners
Date: Mon,  1 Dec 2025 13:23:57 +0100
Message-ID: <20251201122406.105045-1-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Dear friends,

this patch series adds support for nested seccomp listeners. It allows container
runtimes and other sandboxing software to install seccomp listeners on top of
existing ones, which is useful for nested LXC containers and other similar use-cases.

I decided to go with conservative approach and limit the maximum number of nested listeners
to 8 per seccomp filter chain (MAX_LISTENERS_PER_PATH). This is done to avoid dynamic memory
allocations in the very hot __seccomp_filter() function, where we use a preallocated static
array on the stack to track matched listeners. 8 nested listeners should be enough for
almost any practical scenarios.

Expecting potential discussions around this patch series, I'm going to present a talk
at LPC 2025 about the design and implementation details of this feature [1].

Git tree (based on for-next/seccomp):
v1: https://github.com/mihalicyn/linux/commits/seccomp.mult.listeners.v1
current: https://github.com/mihalicyn/linux/commits/seccomp.mult.listeners

Link: https://lpc.events/event/19/contributions/2241/ [1]

Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org
Cc: bpf@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>
Cc: Will Drewry <wad@chromium.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Tycho Andersen <tycho@tycho.pizza>
Cc: Andrei Vagin <avagin@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Stéphane Graber <stgraber@stgraber.org>

Alexander Mikhalitsyn (6):
  seccomp: remove unused argument from seccomp_do_user_notification
  seccomp: prepare seccomp_run_filters() to support more than one
    listener
  seccomp: limit number of listeners in seccomp tree
  seccomp: handle multiple listeners case
  seccomp: relax has_duplicate_listeners check
  tools/testing/selftests/seccomp: test nested listeners

 .../userspace-api/seccomp_filter.rst          |   6 +
 include/linux/seccomp.h                       |   3 +-
 include/uapi/linux/seccomp.h                  |  13 +-
 kernel/seccomp.c                              |  99 +++++++++--
 tools/include/uapi/linux/seccomp.h            |  13 +-
 tools/testing/selftests/seccomp/seccomp_bpf.c | 162 ++++++++++++++++++
 6 files changed, 269 insertions(+), 27 deletions(-)

-- 
2.43.0

