Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7F93B9616
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 14:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780323504; cv=none; b=bLZtHcWckroP6pfpLYGZQWJwg4xw6k6KeocgQpJLkxIsXCOof9e+fnwA1JdKy+Dk0p3YTE3iw3cAYb3nPmMpInurDBEhd4gQdxlX7lt4USPUNq72eE7M1sWqZyQwQTiC1Yo9gPkT6APcJLC20DrqdpTZ3TBkmxuJO0T2RKkCaOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780323504; c=relaxed/simple;
	bh=W1xQ7RR3f6W2gygq8YRntn2oji9dZ7t4CiasDB970Y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OlJQnn+nbE7cBcQmg67gli4dH6CdGeqekRk4K4BDWxFpeZLtq4POy0mejvb8DPyXgTL6/WnReGlxFsaq0YVcJM1V4FvvwHfe9odsV+Yl1tTDmkS1/TgmujaudVSlW4/hjBouNr3usbeM9Ah60A7s18Fwm08mtx4lrMYyxJA6aLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahzTl8Jt; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahzTl8Jt"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bf02708e8fso31607365ad.2
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 07:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780323502; x=1780928302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1xQ7RR3f6W2gygq8YRntn2oji9dZ7t4CiasDB970Y0=;
        b=ahzTl8JtnOtAGdwVfWPYnEz4Y7keBb60tTuXNBGU/m6nVYPY5TaEnehVmvv9LQZCYq
         PbaOC2oVwIK3vpVGf9fli1FRakJlZGp+sOAEjvqzN0IzWp/aHOvgRC+WuBrrR1u39g4Z
         ah5N8u9sqRMtIKsvR2wKLjiKdFNySmKzqy+iyTWHch9nmlO6ORd0VttdJGSZjYvXt5WW
         nkh3cfGvleHLpmKhVNzFuGKDRGSQNIBZmPlCTR6Ld7sS1oY4WmoYnRzkEgNjFMRIxPB3
         FC4jOxREW5PHMxNEMKAO9nLQXksDRjtnX4xj0VVu+PTwMM3vPWgZc1FFYxh+tpE4XLwX
         p4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780323502; x=1780928302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W1xQ7RR3f6W2gygq8YRntn2oji9dZ7t4CiasDB970Y0=;
        b=oylNAZXw0jtBbpb9AEl0KuPHUDkYPVsDe5kDcQ72snLSWcQPRuFeokIdMOpljcQ9ib
         P4GclWmS5oyuFKmTuk2HPFB7L4Xc7WxSZlWgiAJc8mdydvt2CjvOb8xAHSD848BriHzW
         1SvIXHtFHdLZQpda/2dcTR0vV5tPrrPOPrgCWPcgWAAXjrb+ueehSn6q2yiqbESOhYUG
         /ZgUZBGNHt6WAVe3l0IU8JXxo7fIPDqYgeC44ooZIaCA9gIHLsYBG71//y1681uqTq6M
         C2pfiroZ4LHFrMONIAr7Sb6TxJjqQ89tncdXdNOUDUXQ4LMCIpaGLt91fM5Rqw5nr3Wp
         NVvg==
X-Forwarded-Encrypted: i=1; AFNElJ/b+ZfmLS+tkVu32uklvQLrh4t+X6BxeCFJMCQAChRPN6QsR6y5xqULBgei66rOwfCjSpTSqhvPNaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGY/MbBdE3TzozTggsIPlVvVGAyMWCAZEixqe7yo6zAGU2ZTWq
	zZQMg2rCVNH5GoFmM/WJPQDi5Qp7FkQcemwTRAMizxgRvWHCaWQDlxfU
X-Gm-Gg: Acq92OG8pQCzpkIeqghQ9QhuL7xfFAcSOqc56XaRJKYiP+TdB7g42rZoegpxly86v3B
	KK+MF6NiwqBUhJ7yVxXY2n4r+DThgmnwH0aAct3S4BnU9qDeITQ9meWMA7vj7LPNSV4VZrvFZR9
	X2db7B7nSyK+1Q5KGKFim/BwksilfFe3v7eNn4DtU5wbnpwN8OIxFrSXuN3PE1VUGsf763B/1rD
	a9qbLyoC+UMJ6vaiJEVST0GrlMYu+cdpZ0QNVA0YgbcGHdVbUCkBSJcTrDltjUsXkmIWvuhSkim
	gTc+k/76Ks/dufjWrp1tiSKMzPhOGQ23yA1+aCTQZddbN1ZzXYWwhR8Oo6Iepc0UbBGmuJsxpES
	GNVlzww6jXqc7fpuwJDDNZzo8vzBVRgt7JiQJvGRatctdNvZMGdgobq4euDrSmISEKoXzJmA3Jn
	OiSJGoW5ziBktxaldo+p5B5CerUGkvHiKOlg==
X-Received: by 2002:a17:903:286:b0:2bf:2369:a131 with SMTP id d9443c01a7336-2bf368786bbmr133870415ad.34.1780323502187;
        Mon, 01 Jun 2026 07:18:22 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::40e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c2da36sm134646855ad.69.2026.06.01.07.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:18:21 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Paul Walmsley <pjw@kernel.org>
Cc: Guodong Xu <docular.xu@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Shuah Khan <shuah@kernel.org>,
	Atish Patra <atish.patra@linux.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Zong Li <zong.li@sifive.com>,
	Christian Brauner <brauner@kernel.org>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 03/10] riscv: Standardize extension capitalization
Date: Mon,  1 Jun 2026 22:11:50 -0400
Message-ID: <20260602021638.158707-1-docular.xu@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAAhSdy0pHPAMRRR-Mri735zLu3ymr=ePQ7gA6zZ11BkHEXj+AA@mail.gmail.com>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com> <20260511-rva23u64-hwprobe-v2-v2-3-21c5a544f1dc@riscstar.com> <CAAhSdy0pHPAMRRR-Mri735zLu3ymr=ePQ7gA6zZ11BkHEXj+AA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Anup,

> Acked-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks for the review.

> @Paul, This patch is independent of other changes
> in this series. If you are okay then I can take this single
> patch through KVM RISC-V tree.

There is a dependency ordering I should point out. Patch 08
("riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection")
uses the upper-case RISCV_ISA_EXT_I/M/A... macros introduced in this patch,
so it won't build without patch 03. I mean, if patch 03 goes into a
different tree on its own.

But of course, I can rebase them onto your tree if patch 03 lands earlier
than the other patches.

Either way should be fine with me, your call.

Thanks,
Guodong Xu
docular.xu@gmail.com
