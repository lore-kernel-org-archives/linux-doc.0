Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4F24AF15C
	for <linux-doc@vger.kernel.org>; Thu,  3 Sep 2026 13:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441778; cv=none; b=Hg0UUHRvdSb9scUlU/em0L0jD3+12fTbgEEz1j00WKfq9P5J+KlrUD+HgUNfn+6Lg3OeKXv52QzlSVqnezYHYHPXMbMhBQpakPA6glehdav8CD1E5idQovNxZAuIdEXDtrrOp3qnxRglPafm87JYas84WIbq5fd6D3HIXE3aCgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441778; c=relaxed/simple;
	bh=PEVmRGy5gh+Dt/A4TY4uR2plBY2Ml8HO3HylSTnFYAU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BsMwGVcwLe53Qt/RTSBwj01MtEcQSU92oAVs7aUa74IgH2WJrlZxDqMIuONyFrZTdPOxBqB2pt1k3nwwFTTczwXSS89Hx37oY4BdhISMDiWVu2rzIqNhARsXKkE3vUfxynghP6gvtVWOIS1O8GLHdusr5Gn3Yn/1XUnkU6ZsuhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQ0v9ClJ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQ0v9ClJ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ce98cb8165so11686645ad.1
        for <linux-doc@vger.kernel.org>; Thu, 03 Sep 2026 06:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788441760; x=1789046560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PEVmRGy5gh+Dt/A4TY4uR2plBY2Ml8HO3HylSTnFYAU=;
        b=PQ0v9ClJwGnNAL9W9dhdGGBqcqt/2hF5QdXtNot+yC8cAncwQCTuT7Ij10so9uR+GH
         zYooH5Biw2X5uaRB7Fcxmn7okalDm8DR/Dx8qV3EdkW5eqLdVyO9TWg07anc9CeKHXfc
         C0CG5Kd2PuUxZ8t/Xh6IPJ+6YXivvVutEfpyAEiWGldEheS6TNccklLQ+XZzaPQu0V/A
         h8ktpuV0k4qozSRCD/3j1AR9RrS/8Ql8XqcGrRhIshGV5p6zbwNWJOq2LFKemQ0od0mX
         omPj8AFEYP5A59Smv/lJEjyegdr1IMN6ulUxRzKVb1mh51nsukBa8i6GVMSD4ukyHwIB
         HxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788441760; x=1789046560;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PEVmRGy5gh+Dt/A4TY4uR2plBY2Ml8HO3HylSTnFYAU=;
        b=kATISHHahLCnZtaFhPIS/e8tWsmdzl3Fd0YVcPB+HoVi7B1RBRka1gHz+La32ZICEw
         q9dDvjAbLOsb/LrAY5Xva0PiWuiDRGIUGqAWGqAex02Q62B37k6kUVQs5NVgg2581vca
         mLEicdzqAt4tq6g6Ubmw7p+tWMfYzqJjRASixS/SEu+12lsd9vIHYdwcKPXgoZWsykot
         8lrEwLnt66vv9O+p2Y+7egrSf9VPe3+LJQqgL8R5Gg7oXYJd9t8Jsm36xZpSmTsClVvC
         UKFT4IYGFgasqKTS2dj6xTISA1qY43oaLmYh5+qs9L/DItKaKLycFZbXxW2gWuBNp8uc
         rOlw==
X-Forwarded-Encrypted: i=1; AKwUvBwsGu3uuTE9SAWipEu4eaqsvfnBqjjoPhyWoFXp6jmSdSiw0dgL+ge7Ax4d/0AlfQMOkIGd8RLJyVE=@vger.kernel.org
X-Gm-Message-State: AFuF++nQaOBi6Pf14E4qLgzmhVijvDIOO9tEJIfeMs8sedTRLLRkgTJN
	kbHlor1rvDlQp0vDHnTzmF675oOKzYPFhEpm4ROZRUQHFNhtcX3PXkVO
X-Gm-Gg: AYBFou2k4r5OG+O1AjULVBOfooKRydOM45NjUgjEo1LntLgO6CMlaxTtS9P9XarssRm
	hYXYtsAyzQyDbm6F3VCLLa8yZtPaMm/UKZKs8Ig0ZpHW6NB2QNMm0M3gFbq+gFUGqO6rgWUzvh6
	pXjRWPVofWiuqlmrkyGiBIRcFIf7IBh+cHZzjES9emQnYU7mcFSCQANs3RX9ftGq1nOdDUlgL9B
	x5+U0kmT8sgbk+8hsO8zaQR9IBHuHnQPNC62pcga46esUhjP3UtIdt2Rs0cXYXHZpWztuu1uW7J
	EchGIqAyY5NNnFqgqN9xrzkFnn5j1EJkxcTMS6B87iizsV6HNyXVPM1pK+pxeFs4S4L154OKmie
	+oiLsI+HXX4o9HlMr1PllglpG84n0PZZaQEbth7YQm1jEJfiFClFVOOh6VLw3p9IDydv/cAoWkE
	IqaB+FT427VVt2DMXzhvtuy7lsE8vhB0FBQCu5oggnqNqZlDbXjG5RxJEB1acyRfSfusmJ0AtNk
	54=
X-Received: by 2002:a17:903:1b44:b0:2d8:d4d2:d135 with SMTP id d9443c01a7336-2dafb1061cfmr56943085ad.17.1788441760409;
        Thu, 03 Sep 2026 06:22:40 -0700 (PDT)
Received: from localhost.localdomain ([2408:8607:1b00:8:d43b:6dcd:a4e9:1d79])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafe62d1b4sm9977395ad.18.2026.09.03.06.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:22:39 -0700 (PDT)
From: Pengfei Li <ljdlns1987@gmail.com>
X-Google-Original-From: Pengfei Li <lipengfei28@xiaomi.com>
To: sashiko-bot@kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v5 3/3] trace: add documentation, selftest and tooling for stackmap
Date: Thu,  3 Sep 2026 21:22:21 +0800
Message-Id: <20260903132221.256923-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902065127.662BC1F000E9@smtp.kernel.org>
References: <20260902064242.28606-1-lipengfei28@xiaomi.com> <20260902064242.28606-4-lipengfei28@xiaomi.com> <20260902065127.662BC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 2 Sep 2026 06:51:26 +0000 sashiko-bot@kernel.org wrote:
> Is the documentation correct, or is the commit message correct?

The documentation and the selftests are correct. The commit message was
stale.

Reset clears the map and nothing else: it may run while tracing is
active and leaves the ring buffer untouched. That is what the code,
Documentation/trace/ftrace-stackmap.rst, stackmap-basic.tc and
stackmap-reset.tc all implement. The v5 commit message still described
the earlier design that required tracing to be stopped and cleared the
buffer, which was dropped after Steven's feedback on the v4 thread
(https://lore.kernel.org/all/20260821235129.078dd489@fedora/). v6
corrects the commit message on all three patches.

> Would it make sense to add a similar cleanup trap here

Yes. stackmap-instance-gate.tc now installs an EXIT cleanup trap
instead of relying on the manual rmdir in fail(). It also records
whether this test created instances/test_stackmap_gate, so cleanup
removes the instance only in that case and a pre-existing instance is
never removed on mkdir failure.

Pengfei
