Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593065;
	b=cQ0unfpT+d1Xh8Y9mWXrdRYXL4oxZ2vLfXOMvxPscp0R+tFjo3zc+FWfohToD30muG0Q
	 bu5sWyccg5FEG0uRFjU/e+eK38qVO1FLsK2lSGLirgaRSUW3GFd63zQuS/9ICwpOoQMJK
	 XAKECaIDKb1EmpL3w4/RC0MrBbvit0gjRiF71XeKY1MEVW9wQhS92sbyBu0aoJcYSDvJ4
	 qNxfOlo8TXqgpIcLfsF6xyQ+tQ05+1j/tOdhfpKo+petlbiMn5G/SULAhiW5ViDz61brb
	 8XDEOljL7gJw5s5zeda7M0lQeYbGkJXNhl3bOQqeuaRwfJpYAD5ltUQJPAqYunwprcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=CvAjV0S+oO0YGxdmFbKoXiKIWCesLPGwRDNvZl4jprQ=;
	b=MifcDGUI56T+H7VQiHnz+vlmGHaS8zl0me1PrTNhUqA3fEJf9N6kDF0/n6TkhNXWkoWG
	 6A15kRfJwdWHuwWlI0NUAG6eyxUyOO6wKIRNNVb7HAhX+z3Pousqb9EVV+nyeZtcLJjeO
	 3Y4pSx4wPYc2xamB8xx3N/u+JnG9IK+c7czm9VJyI5NDCg5SQHUMUGX2ax78bfwG0IMni
	 XekiZoslWcVH5sgYbEgOHML5wjQx8KyQEjA9dy4vu/A3RWpg6fWm1bkV9GJt4601MNLkW
	 yM9z1p1nvtYV/5368c1Tk5cH/Uye5AVHnw5EwVZ8wJ2GjnTKtWHPnw7YGybHJWmhxEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zFqko7p5;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0ED606A32E
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 07:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F0ED606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zFqko7p5
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3b14c80b210so1225407a91.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 23:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593065; x=1796197865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CvAjV0S+oO0YGxdmFbKoXiKIWCesLPGwRDNvZl4jprQ=;
        b=zFqko7p5m+zohQoNl5FgNLHWrDGTuOAae/lxM/3iRDil0k0nCuKQQ45aIyogl4s+eV
         2eBdL+zTBhWLsOHDnJbwqKioxMih/+IRCgGQ7sI4Wh/OMjzf2GDVOAFHoPsZIwUbV7dI
         COWuQFyYhMg9cg5yOiHmHdVMo7KDfjZnnN8q3k8yj10oKjDDR8dMr85xDSd5OSDxgllK
         lHmHNVFEosZbtynQVfCIBUr8LZp5d5mHJmB5xQC2TaefiFtdLjs/06tz9R2aPFsYN9YL
         YdAB6FwSApuk5qQktw8vr4pzVnszotzkAUTzLB+VIeb74DUajvQTUThFW/4x6xaXzNlO
         uDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593065; x=1796197865;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CvAjV0S+oO0YGxdmFbKoXiKIWCesLPGwRDNvZl4jprQ=;
        b=oq6sMnull92gLUZeIWu/y8PSYDIG/fLA3VsPXEQnW08f2IMtT0MsyLZ6YrRxSLVPLn
         Ls4XEuuvFCkPxezd6xFupHLe0VPzfz3RbNiiWoGSrxbf8qH+8brElQL45Q0G3tpFtFpg
         44S3p3//ePtVFKAENUoErto3BNg53vm4e/Z69S1kv+hzCgpOD6TFsH7pcIdKVtjo0dYk
         fb5uS7YlO47YcvbWtbducTIeyyQr2BoXj6ZQLFLU2H6deSJxyuRgsyh5vuisNujHNZk2
         kSnE9/HL4IXn7uXAA0qQn2dawGODPnEH6kUCXt4AmoucFlfMp/YKw3zFUMoWr0atlDjZ
         Ef9w==
X-Forwarded-Encrypted: i=1; AL+hErG9mXW9vaDc/2L/23PfickFhFFRm+yFmDJlH7g2zM802nAwlKBHlZ52EGM3jl3F8CGNbK2eRGatCek=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9ReXFvXMk7qMQVIWpGADnRW/hDnaAcloYp4H/euIblQTtiGuz
	F0oiG9fuB3wvMtcrqNGM62WH0IXxa6nOCr6gGutG9k9aMIeb2o0Eh3lB
X-Gm-Gg: AZFdTZenr5DTjq7FecJ9RpHL4f/eZG8K0SVrABz0batu+tJvVfmocCa4VZq4O035+iT
	e6tFtb+ZPIEl6dGWRDAEXPAHLvf1r56wI7uZogGhoDHxNbzJOTeKTZ1+b3jbZxcWAp7A0UlieZl
	YYJL03lv0CntGSRIVH89CoYDoaR9DSGT7Gv+DKdtdPGxpC5SskfXLJT7nW0JQB+f4YPktWRv6Ok
	J0Sn/kmsIMuVAZ4fSv6FD0M4c3k9cOZ2AXZ+biCpOVHevCTlgdRQXT+5TgA16T7jSNCO16N+lYp
	5JTJcqUUfUADg5B+3djWOZvKXccbzu3Fq/W38A7YsNbtolSfauQ7aGvwv/Xzew0BdBRkD0eJCvr
	XmN1fjc1TYrcqoznHVvXatWWQePBWfZeB9W2vRmGIHZ+vhi1hcLM25VxswhzQhJ77J8IXpx2jJS
	6ddampS4bb+zC2/Ex5XO1hpa9JVSJEE2/8e2/BhT4+FPTEVsrDi/J4svyljTKhjcwIDingirKWt
	0mlj9NS2qcRURs9K97YWryaVKYMKSd/yShGUMNm0NiPzTeKFv5lCYHUvTd1Qy1Getcv8CZUbA6c
	DfEWxbJ4kVtcE7kdber4FxhYtQ==
X-Received: by 2002:a17:90b:57c4:b0:3b0:9cc6:62ba with SMTP id 98e67ed59e1d1-3b41caead33mr14614340a91.38.1795593064735;
        Tue, 24 Nov 2026 23:51:04 -0800 (PST)
Received: from nixos ([2409:8a28:ae4:7f20:3645:b698:a929:4bcd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7c6513sm12341521a91.4.2026.11.24.23.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:51:04 -0800 (PST)
From: Zixin Wang <w1355457260@gmail.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Zixin Wang <w1355457260@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	linux-doc@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	corbet@lwn.net,
	wagi@monom.org,
	atomlin@atomlin.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] Documentation: real-time: Add boot parameters and task isolation section
Date: Wed, 25 Nov 2026 07:49:43 +0000
Message-ID: <20261125075037.33630-1-w1355457260@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <awXN9RY3x5xEGFe4@lx-t490>
References: <20261124163202.56921-1-w1355457260@gmail.com> <awXN9RY3x5xEGFe4@lx-t490>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ahmed,

Thanks for the review and for pointing out the scope issue.  I have sent v6,
which moves the runtime tuning material out of kernel-configuration.rst into
a new Documentation/core-api/real-time/runtime-tuning.rst, and keeps the
configuration guide focused on Kconfig options.

The existing CONFIG_* section headings and anchors in kernel-configuration.rst
are unchanged, so the documentation links generated by kconfig-checker remain
valid.  I ran the preempt_rt rules from your v1 checker (reconstructed in the
7.3.5 tree, since the tool is not merged there): all 12 generated
documentation URLs resolve to anchors in the built HTML.

The C-state, EFI runtime, CPU isolation, RCU offload, and interrupt affinity
content from v5 is now in the runtime tuning guide, and the configuration
guide links to the relevant sections.

Thanks,
Zixin
