Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED8F54939B
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 20:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923545; cv=none; b=RDQfWriQGvhOXdu8OtKQK59eUqxmSem2NRdEjTK2mvOwyBZ1traYmZLhElBLeLEjKZRTAlcZgqeyzbtU41lJspJLkXacvHPi9TzMBa1ANqr/PKBSQFNRspCw/AcysZ/g5HANdXkwguxeGL5leTKzIXPh0XI6s5wicjkvZFeBzbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923545; c=relaxed/simple;
	bh=6JajpgDfEBwfZ8sqZjkLO3o4yng9oDArTPI6I0e/LXg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fGGe0M1AXNBZTsWsEG3nBlapWRE4rxGTFOW5JInkt9zPWo8dZXz+p1PYWOcAN1m3+K8ER33R1CYFO3rgFDTL0VBJMqqcSJXfhImXHhKio8ZcS7sL8GV+WcA0TEowk4LADuKyjvpKkzthwOcHmJvSIJtzDf8AtRc6oi8G1YlP6F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUVhdNQ8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUVhdNQ8"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a16c399641so33916065e9.2
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 13:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923541; x=1792528341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6CpVY6MeWJcdZtwhnTmqF4lxIQszWxkfvqL28C9V5KU=;
        b=DUVhdNQ8Q4JvcGMOe04dpHFK3ORX3KqjCiOru3PpjOdpQvhM+Ch4cwkV9hvgdWNi2Q
         KA9AHaq51HoR2HfJd6HvVEwa/s2UMtPfZvlnOPYUrL+akMoJNbwsVHvBWbmuHabwZPLu
         pbFlGAlswpGDYQzHC3xd4XwCNNQ32gmd3KqLt7+gUcH0xzr08BQ7uy31qKTT3H8DlHY1
         j6cKgnqAYhvwT154g74a/+WzU0JjbpN+eR65e/irUS8lzGteREEpSHpNOB5Y1P/LvLj1
         W8z7CJqPxg2kyAFeZz81G/E9BTvyFLiZThBgum0/aJEpq/uR+ngBvnp/svCLmTKeHAUt
         bxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923541; x=1792528341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6CpVY6MeWJcdZtwhnTmqF4lxIQszWxkfvqL28C9V5KU=;
        b=QCkoWhNFLt+uSHm2T966BLyiHBR0C7VF6lUTK79ecT1dKGYeH+ESsgck0ydvspVC8H
         7fhYiitrlQmMELokui91TtAT8ifzGI92VpXctvekPPoAnGhL5wxs5baMg6QBoR+BdfTH
         84B6hJSnHCgOkTyR+iTRPuW+TI+M5jdmkMmfPeWPFsU894cqQRjGUZzg9l/NCjYZYdzx
         E9uIcQ8FbA0u865c5ac9Bn1czghT2VYYc5axrDBDjvZFKAWc5wK537iYlzxpWVyqL9ek
         7VJHT4DrqIAqmrwn1X9LInqnVJ22QGuuEemwELYqmDFTRVPs+bc82KZ5+BA+0q9SYVH5
         PVgQ==
X-Forwarded-Encrypted: i=1; AKwUvByMnzE1BJn6thncJYnJkqObohcDfeeils2L/VwtOEriApQKxq1vAuhbzk4+jalPx1dKZBTxgQ7yLjI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzotMx3ALm33NfDmjNpLfmsQkiXx/UxvH5/LPTWC7AvuZHNozL
	hD+R/Lt+Ld25Sz4uYFLM8V8oI7LMNUTEwv+OmCCysXFKDg4AGl/bhPPl
X-Gm-Gg: AYBFou3RAWsOscTvsfyIF6lzc4/gFb3DZOqWTSDJz3Iw4yqPu6kRQwrd4Zi46ZPDEn+
	ouh2Q4xfitKJ8rTtsbRJIGzZmV/ChV4Wxml7/mmpo6pvuelh/8euDwdoNnwqNnnPNZpmYd8UVOM
	Bi4Lz9ghzJS9Qn3gvDdVFCKJSkXSGQ0K8G8ahAAoVX9lBydsrpIq0NzfIxi6M9EuTY7eKSU0chN
	ThVb9zywknyFFwxaa+lh1n1Lwk3p1zeFP/7JPjTtYjaOps5TCPlW0QvlXOuJ3DLcb05coRp81QO
	7yaZEOlxbLgDq0U5DFjoY9d7vkfWKWEtb8CmCjCACHbywQogXp8yV/u4rzJAnWTEy36fX9ofH3y
	2zeuTCeAyWFNVnCgzG2IQGr8cpADqiKe/QkhInXVhYZnkU55lr77UupsXEVkwiAWoDF5cBp5p7d
	FI+grUvOMa2Cc6Za36UXFRIvxhrZXsLPdellQb6xKB21m/9ax1x/+DNi834v+/lzu5n2gr9o/3T
	GJvwINipi3g7/FmSIZNs10QGgHGcjjw3G2c2pJ5LYdBLaK7MH+uhQSnuEZIoFd03XRzgsCCcny/
	J086tw4hZq3g4vtSlZc7xDfIollvY9ZpwW1FToBMnJaDIuRNOZanpe25NVuZWxhN1kE83d/wsZV
	Q/oygecKZwj8NvJz5Xw==
X-Received: by 2002:a05:600c:3f1a:b0:4a1:ac66:6ac6 with SMTP id 5b1f17b1804b1-4a1ac667160mr69814455e9.26.1791923541329;
        Tue, 13 Oct 2026 13:32:21 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.32.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:32:19 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] ARM: rust: Build Rust code for ARMv7 on ARMv7 kernels
Date: Tue, 13 Oct 2026 22:31:40 +0200
Message-Id: <20261013203140.31741-7-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261013203140.31741-1-kmehltretter@gmail.com>
References: <20261013203140.31741-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The arm-unknown-linux-gnueabi target builds ARMv6 code, so ARMv7 kernels
cannot use ARMv7 instructions in Rust code.

Use armv7-unknown-linux-gnueabi when C is built with -march=armv7-a. The
target uses the soft-float EABI with NEON disabled and permits unaligned
word and halfword accesses, matching C on MMU-enabled ARMv7 kernels. A
kernel that also contains an ARMv6K CPU is built with -march=armv6k and
keeps the generic target.

In the tested Raspberry Pi 400 configuration, Rust text grows by 1.9%.
Six small benchmarks range from 10% shorter to 5% longer runtimes.

Tested on a Raspberry Pi 400 (Cortex-A72, LPAE) with clang 22.1.8 and in
QEMU virt (Cortex-A15) with the minimum tool versions. Rust modules load
with the movw/movt relocations.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index a72843890241..28eb8484ff82 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -73,9 +73,11 @@ arch-$(CONFIG_CPU_32v4T)	:=-march=armv4t
 arch-$(CONFIG_CPU_32v4)		:=-march=armv4
 arch-$(CONFIG_CPU_32v3)		:=-march=armv3m
 
-# The rustc target fixes the instruction set. -Ctarget-cpu cannot remove
-# the +v6 of the generic target, so older CPUs need their own target.
+# The rustc target fixes the instruction set, so pick it like -march above.
+# The generic target builds ARMv6 code. -Ctarget-cpu cannot remove its +v6.
 rust-target-y				:=arm-unknown-linux-gnueabi
+rust-target-$(CONFIG_CPU_32v7)		:=armv7-unknown-linux-gnueabi
+rust-target-$(CONFIG_CPU_32v6)		:=arm-unknown-linux-gnueabi
 rust-target-$(CONFIG_CPU_32v5)		:=armv5te-unknown-linux-gnueabi
 rust-target-$(CONFIG_CPU_32v4T)	:=armv4t-unknown-linux-gnueabi
 
-- 
2.39.5 (Apple Git-154)

