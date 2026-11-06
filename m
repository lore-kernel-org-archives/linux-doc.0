Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794009381;
	b=GhA02tEhxZx4GYHgzt4sJR2tTuqhEXvuzi7uFyfjdwFDS0coS4HleJeTTEk/BsQxCqWf
	 f+tshcVrly58yG4sq7jL601LpU0CgndulxvVvLy8yGSPg1HyDWOpCktkx3Gn4tsGUABw6
	 IIEpQ4T2gu2cABRHGHs6Sc9OKHoxyLuTM0K9x+rkUC4tq7JVay1JZOIpW9ljP4WytpNm3
	 UtCxi4A8eTi07kpKaa7NSIe57+zjkWsth9YpZ2dLQJjnGs+EJvViNjDSvMM+zzXxP4TPf
	 9zjwjetNjkDdZXk+pZbJM0O9OtOmWoZQJY6LsdLaLGB7AH6m7rs+PsxwoX7NR+V7FwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794009381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=re+IWocSwV5c8ScF+wx81yfMha910y/RtjGSN1S+bq0=;
	b=K30PAIQrtwBUpqdrjmL3f2dWNph9QYKfWqORI9D51tCXh3kR2sdfZaWvt0dNBlZUUQIg
	 rnOSxFxhiP/jLozLkPjMTAxNOsKIkzcbKLnXZiXywWeOPzGZX+h6gLqspJksWuDYDcSzV
	 FzCtKv3QjIgdJ19gagksjKzx8MHN6mWuAfi3Hgd6mW3aI3FKdjQ4+xK3iv5H++drT6hXc
	 TTSxvhtf5+rExV/Lbg1eFvRuCRsl2qJAYPg2fN5kIwb0GFx4trzo3c52QCLkXVXmKbzQN
	 5pzNgvu05yJ63vPp09g8/C8voKsagfxx9QAMZv9M4IOOXyvTY9Ay9bpeHpy+qYigvkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JHFdshfU;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AFB606A32C
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 23:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0AFB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JHFdshfU
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so619617a91.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 15:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794009380; x=1794614180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=re+IWocSwV5c8ScF+wx81yfMha910y/RtjGSN1S+bq0=;
        b=JHFdshfUT9qoSR9FDXb7/aVXoyN04XIJIrqvL/j+0tnLQHAnp3vrV0v036nZgyh1bv
         jrQXv0XmqRucKiI5Y/r//lEdBj2zxjxgDsuj0RTaMywRy9eaiI7I0jg6qPbwQhoDsVib
         xfiA7K3jAGGGa5K9stI8zSKJFMomZsJ8eZM3bquczO1rsq4gIrtYk/0XtQCyrH10UAm0
         eqqX7AQj6rianfVhqeJWIuODejfFxq7Dw+5jlskKs2IOsnlBmgo7rHjmja1XEbMVIKVh
         9Ds4v1JX4DVY+clpMy8EvldFIdVVYGAuZl3O6VtmrKf9fp2h5QiTan0obXdhyT4g6rPU
         ruzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794009380; x=1794614180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=re+IWocSwV5c8ScF+wx81yfMha910y/RtjGSN1S+bq0=;
        b=dmV+3/TaC/Dm59nitX87WFj6chl7/8zfXCw/77Nt4b5jJQukk60TD6dZ4DUgloswl+
         XbM3s4YbSY6ea7OrRwSwiDWiG/Gt1JEVIV6/gz6+JuKk6bhWFAmZDbgIRkOmBlSF2NAu
         ECpejvaX7niTlgeNIuEyJf5g7I6qnTRdS0xlBtUhWT20D9wi/AOmV9mlgoh1O/u8zL9b
         /F4UTqkrQHba9QK/tCPl9wRQozK8eWwQYeg8i+U/K+e9/8RmuUcMGvFOo925X/85qHkX
         EmXth3/v0BRg+flybca3nw/Tym4MbS0ZdGIYFrzWup2Aj9G6pmR9UFeDIEzludwFAz8A
         uXaQ==
X-Forwarded-Encrypted: i=1; AL+hErHskStsKFx9RWI+QOn4ry6yfJqEhLFhSa8nebZTzAo035/dkQkWCc7cry9oSTegOXOCNUcLc/IxNi8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8E74Q6V/VHLpa8F5gETefMr4bjyDjan3yTvaAJvHGXrAcF7sPW
	3pnpCmCm59sMagwhIjOygDOSkcU6hqEFbeMml1dNgMRidkL2n90JYSTr
X-Gm-Gg: AYBFou3Bd7QQzVQPuXPLqWkDiWIaFTJHsbxrZeD07+3UXWtZ+FEeYLAPRdVDL7z+yJl
	mZ2UZPpLvRjH9cEHgyxlxBcS7+utn+tZWhchdskcbtumR1StIqoSyp1skcrZ+trXKZ97e8t/YYv
	nTScwY7IkcqGm2dbu9ZvV/gMUTb7xl/EZynUiTa7MY8turWoEmlJWbDCLh6vAUjfVC+fElLWglC
	V4ZomjhDKCNYdZfxisbB5sZ0qCeu4LG2DDIAJx2OhMdpmIqevq11Q4MMtiKbXu3kbw4//JxTbnL
	eUGqfzeAEDQj2F3DH5A+JC4cpwFqRr0d+tZAoX93/fSn3LI0obI05Lw8zCWrp7fkOqe+A53Tv2v
	r0UaH70eJnLn1IQG8tqk5YiPw5GKcchP5CGUy/h/qoNvuXTM0fr6UGpOjr+KInFYQk2RBMkbpoc
	v/R3yyrWvYpcUXxsBTyg9cNclLGQJLBGpDLxQCMZiYbg1uuQro2hM0ER+8CYW61nufT2Xc805jG
	6EFCvgVQHF+YJLpnCZsFeiLn+huEQ2XlK0YSRu44358+SZGhcWUlBclxVkBt7LJuS0AnTMk219a
	MaUVeaqH1z+IpCBVjb5CgbYb0ceL9JXjE9uzEC3GYg==
X-Received: by 2002:a17:90b:3dc3:b0:3ac:7c52:fb04 with SMTP id 98e67ed59e1d1-3b0db71895cmr3876355a91.44.1794009380043;
        Fri, 06 Nov 2026 15:56:20 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057fda58sm852780a91.7.2026.11.06.15.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:56:19 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH 0/2] arm64: errata: Fix two Kconfig column entries
Date: Fri,  6 Nov 2026 23:56:14 +0000
Message-ID: <20261106235616.1533003-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two entries in the arm64 silicon-errata table name Kconfig symbols that
do not exist.  The GIC-700 #2941627 row names ARM64_ERRATUM_2941627, but
the workaround has no Kconfig option at all; it is enabled from
irq-gic-v3.c through gic_enable_quirks().  The Falkor E1041 row spells
QCOM_FALKOR_ERRATUM_E1041 without the E.

The first patch marks the GIC-700 row "N/A", matching other workarounds
that have no option.  The second corrects the Falkor symbol name.  Both
changes touch only the text of the table; no Kconfig symbol or code
changes, and no build was run.

TAKANO Mitsuhiro (2):
  arm64: errata: Mark GIC-700 #2941627 N/A in silicon-errata
  arm64: errata: Fix Falkor E1041 Kconfig name in silicon-errata

 Documentation/arch/arm64/silicon-errata.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.53.0

