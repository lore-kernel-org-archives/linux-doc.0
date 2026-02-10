Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0DD280A5B
	for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 09:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714037; cv=none; b=VQQ277P/SyLQWGUSV3NEgRXtmb5AIi4sZoRCu28TVRxhTG2YhY/hc7SbHfdA2zYACloNibAAfbWByMJTkmaLYnTYV748sLceH6y4lGdQHMVwrF+cCTAxdfqEVt+8H9qe0qKBbdS65gV8A1kF2OotKyHgG4V4ADYhSt+UOuIUKbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714037; c=relaxed/simple;
	bh=w8yTUdbyiQnvXE0Tpjqmrd1R0TJWD7BCw3qshT+8cVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Jlo8huYWlVmXOoWzyM4NmP09FZyv/9kRkUJalR88wI44dAQYMr5BktZaV9x2F2Caaa+T0wGBPrUJGRFR0LF3rtVYrh5exbaLMmSbSHh8aHuE1DHoojNZY95IF7efe2A7nOsN1lacCFO/717viH/UR//EMdXITwQLbYyWN9/RKyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ig5gTCwE; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ig5gTCwE"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a871daa98fso27276195ad.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 01:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770714035; x=1771318835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n+z8sIhK3ezw4HrshgmYtJdGACxW3bN8LLVtULfSwKk=;
        b=ig5gTCwEHAKfQWWqB5aVidYbBcy60KGqpcGQR0Or+ASRkgVLv+kOh7+QdsB6ZLzWcm
         eLJWB4VOOqnsdXrrhfT0ahR9q0HZZcqW6gn9+b4/2wH0x6dq152pHd+8dj6H45m7eEG1
         ozIpfE1m3SfiMmKoySic/lZ2w7suN37Sughb/jN+aR/NXxKvf2Hu/BxxkMi2sIzIsxGB
         jQ5orlMQGTeydQwtM8pY5UdSAyZIOpDrYPvmRhfCgV+/tPS9jxEEA91cjmUZ6lv7gTKh
         QT3ARroaC50TBefGSfirHolNHilkvdNWbqarWZgpOe2eRYRv972i85E5dXgAYzQSbtHL
         DNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770714035; x=1771318835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+z8sIhK3ezw4HrshgmYtJdGACxW3bN8LLVtULfSwKk=;
        b=qHqwae8hUcTORKgBUny6yEEvp22YBiOS0snhEXfHk6eVXltauGgh+lSZYKXmFQ9v3u
         NsSs7K2qTjD6k9op4TNZWea1u0B0WfIDh/b8WwBwTlMm89UucSWyjT/wW1RZX9ylXnT8
         x3k9R+HyPkhnIcsoPgGnp24vuVeiPhiABnX2foAxMYkTu+aYYvvp1lgmiyk8OwyfWMdQ
         LygfRp5sPhqxm/ewE4Z6iqS9zzN4yuH1f0uRazuNtLRJ+DvfiCCnVwwmFgkKwRUl1uMy
         +cLMVlr6ehlTSaxjG6FS1ZD1XvmwbQyHoWwu4RJ7k3FQqophJdnuOq4WVZTgl0FWzJoB
         mnDg==
X-Forwarded-Encrypted: i=1; AJvYcCWt0tnWlLgXVbZ6PMpYAcD0D0rfL4mZLcdNpiTXFkk/IlukmqDrNYf6DRHuawZVTg/WiDNNnVvAOlI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfaH7+kfGT4TWrjWLD5xKextseZ634PubJKOOJbVNpN04iPCyX
	i+3bDNWvxGD3fQRLf2Z7dUbdFb2Q4YpZRzPe8sa9I4fIBNMicSYT1sPk
X-Gm-Gg: AZuq6aJODxxuNZezOJVbklo+Gm1de5bIZV3CpgiRg3RyABArRRjCkmm/xXK7DjSXNan
	QO0UYQi4JxpFpMRIFqvLFcmuIJUFgtYv64XerBFqxCAJN/bbDJ6MQyGAg6PMPhG/jesLaEXX0Li
	tONAj85nIx65mb0NOjZqRBAoKPitCK7XJoEaozHdTmsxHu+wPpvt4Inj0hA2DLH72T+a7qIZjtK
	jc0YrkRyoflDLop45Q9nBkDVaV632AbYb7s6reUIRrIBd5wcob9ttTj056/tjtIk12h7nC3MYjn
	JO+REJV7o2/0peNld9Fmv2OcJbHnefqOX4Z5KjG/RvVIzn6DTy2pIKCmqIlwpxdM27RnjKlwIgK
	FEfMQGdtA9niIw86KfwHCmFSck6v1gMj0uPR5dlDCmSSgKI/3vvHdZJ+Ffzlu07t49jqkF/+pYn
	NqUBHtu6cGpUEQMpC1khL/wf4NlejEURvdZvFHQYYXgUbwWc2rfgs/+wArcxNqvHAy25hhSSU=
X-Received: by 2002:a17:902:e94e:b0:2aa:ecec:a447 with SMTP id d9443c01a7336-2aaececa5ffmr69096715ad.36.1770714034700;
        Tue, 10 Feb 2026 01:00:34 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c7a342sm129536605ad.26.2026.02.10.01.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:00:34 -0800 (PST)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: linkmauve@linkmauve.fr,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	corbet@lwn.net,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V6 0/3] Rust support for powerpc
Date: Tue, 10 Feb 2026 14:30:19 +0530
Message-ID: <20260210090023.2587534-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable experimental rust support for ppc64le and ppc32be. The patch for
ppc32 has been provided by Link Mauve[1] and ppc64le support[2] has been
merged over it. ppc32 needs some toolchain fixes mentioned in the patch
`rust: Add PowerPC support` and the discussion for that is done here[1].

This has been tested on powernv9 hardware and power10 pseries qemu. I
I request Link to test the ppc32 part as i don't have a hardware to test
it out.

[1] https://lore.kernel.org/all/20260204030507.8203-1-linkmauve@linkmauve.fr
[2] https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com

Changelog:
V5 -> V6:
- Added a missing Tested by from Venkat which got missed since V3
- Support is marked as Maintained instead of experimental
V5: https://lore.kernel.org/all/20260210053756.2088302-1-mkchauras@gmail.com

V4 -> V5:
- Removed a nested ifdef from PPC64 for Little endian toolchain
V4: https://lore.kernel.org/all/20260209105456.1551677-1-mkchauras@gmail.com

V3 -> V4:
- Co-developed-by header added in patch 1
V3: https://lore.kernel.org/all/20260205180429.3280657-1-mkchauras@gmail.com

V2 -> V3:
- Splited HAVE_RUST in 2 lines
- BINDGEN_TARGET_powerpc initialized before assigning the same to
  BINDGEN_TARGET
V2: https://lore.kernel.org/all/20260204210125.613350-1-mkchauras@gmail.com

V1 -> V2:
- jump label fix for rust has been moved to a separate patch
- PPC32 support has been taken
- rust support has been marked experimental
- target.json dependency has been removed
- HAVE_RUST now depends on CPU_LITTLE_ENDIAN for PPC64


Link Mauve (1):
  rust: Add PowerPC support

Mukesh Kumar Chaurasiya (IBM) (2):
  powerpc/jump_label: adjust inline asm to be consistent
  powerpc: Enable Rust for ppc64le

 Documentation/rust/arch-support.rst   |  1 +
 arch/powerpc/Kconfig                  |  2 ++
 arch/powerpc/Makefile                 |  7 +++++++
 arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
 rust/Makefile                         | 10 +++++++++-
 5 files changed, 32 insertions(+), 11 deletions(-)

-- 
2.53.0

