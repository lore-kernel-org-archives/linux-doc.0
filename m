Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FA21C3BFC
	for <linux-doc@vger.kernel.org>; Mon, 29 Dec 2025 17:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767028446; cv=none; b=YlzhqNGxMaQxPbca5RigCvJt9Mrk0EoxZdjXzhLmUlvNrhvY70WcCGa4W8F/f9Q+kkvsVifFbC70xl5YpFuireCmhDvDFo9cQQW+X4MeA+aixaYi3RmJFqiiNPTQixCDbob/SrlonrxO5IO7GhGK7IirNWKhP1C7gff4OiNLi5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767028446; c=relaxed/simple;
	bh=rPHsj2oVdQZJmJLJWmWO3toMXK9yiLTRStaMVd6JXbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o0odx+uqQNsgsHYNpmhKRHVM3fnzzahNh+zntT7g+NGPKhKhhbGcs4aRQLu493UUlZVLO0J/e2XmkwN+BUBH7jk6yKWrTmUJXEJN/5NOQHfl1IAXlndJhVJ/SIUnZJ1Rf98DsClXlIKyMMKqqgLqyQZ60MaoR3ttOaIXLZ1uW3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIqSjaYO; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIqSjaYO"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bfb84c2fe5eso3906381a12.1
        for <linux-doc@vger.kernel.org>; Mon, 29 Dec 2025 09:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767028444; x=1767633244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nq0hy4ZDbyOAkYMZ9R2bJ77qMoSVUcBr/BQKEBLGcD4=;
        b=GIqSjaYO1LPsrpNx+MJUWdouSiwqq1TK0fcFqnIsRtvuZ12XgO8SfwBzriE3wgzLPo
         e0ZYaemf16rLUaOC0HTYWCUD93l/g1Yga21wt6aElb8a0HEjxa3B5pdig/nopRdz4BeJ
         pRZszj0yS9okHYU9ToggSWm8ewt+VW9d1ifHEWILEMtatcQCB+tR4VYF3uM52MJ4jgQb
         i571ihJiXIx0VgN7OrSQpdRDe+4sUxTPo1AmT4Ls4ttzRXTBb712R2q/EEzQ5HGDqbpn
         bUsoEPvxsbOczHl+Q9cfKuED+iW8LWMbNnSixSv+viCwXtPdiMEphoUSAjbtZtDYlIQe
         uVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767028444; x=1767633244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nq0hy4ZDbyOAkYMZ9R2bJ77qMoSVUcBr/BQKEBLGcD4=;
        b=XbvshqZsRQ4Gtx4QGJvp9Es375o90dXK/ynfjXo/+fJnM8XOsSTltcMBuVyAWfC5o3
         tjGIzd4iHaS7rkbFWmWZveZNMN5CJKxUk8r1JpAO/rKYhLRaxRkoH38JN5gOMrV8dPa4
         6saDgsDHrNf0j/JxtZ4fArx9H2NzsoDvHKwJdKQlevbGecwfBFYiompUWtz9Cc/yd5Ww
         twa1w1NvTHOprRa3NbBX2uVPUxrYhsN/sjcQKFC17tUOLDmuTLfbtSjYhXrAdVPNhH2V
         K+Fyaj3j/5iLHFcFRJjf6gIGgNy4kZNWnGKraVKNw4ydPhc6TV1TWW6stnm6KLYe4sp0
         vfOw==
X-Forwarded-Encrypted: i=1; AJvYcCW8d5F23vo99NariS3lWmppZ/GOMvuWNRxNAUoUoeOeyO/3yaZuTQNa9PWZRynnJfI0I/ZYztPm5OQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2PNyijdwjzffjU80yms55Tygu4URKRcwaYy3budz7dryx4rzh
	2NNtSRAjLdOT3/nXR1qEhU/5/7Fz4UgGEDa6CoTGOH9qbaYWszAfwQnb
X-Gm-Gg: AY/fxX6stBUasvULoMpWlIdCYrMgM/D08aXMJ6SQOfZTEGNWqgVYwEZX2qKsXPXTNEf
	JPBQrH8aZGCc/WuMJ2Gf2zYHAggJlnarqtTvULuJ5gOPbUML7jML0JyXPRIH5cGxspgjLjQw+tM
	CBZdR1C5gzMprN5+T0kl//fAvA3cB0ZKwY9M/V+77VzsqFFRBWrt2LJB4bAhQi7pSvI/cOprQdL
	Gnw8xkg+fQjhQi7Q/BAc2BfIADBmWd8tWGpCeYJ/idHVFsRdaoWFwPAcXZlv7HCUqq5Cjy4ySZ7
	BRtkT6qABIV6xjA/Ai4vgGN248KKwZE/nz/h4BFdon2PjON4q3atnjARdm0zrJEAjxvgqOKqckQ
	GDNJFqTCbcWwai2Z3+CEkA1cAGvA2LTaDy2HvmfweFaMOViDASn+cMERjW357lEI9ocFZYWx5y2
	jiVlfmxhcNyh/ii2FMntpX1w0sFgt4gTEuljNuUI+WBSYFo7S9OR/wXrPbdRFfWA==
X-Google-Smtp-Source: AGHT+IG4eXbFG3XgvqZI1V+B2x2P42ZmXTkV7Dp/LoGqVFuSVOvFy0fGaXCjk1bAi09n8KFPykhhkg==
X-Received: by 2002:a17:90b:2e4a:b0:34c:9cec:3898 with SMTP id 98e67ed59e1d1-34e71e29544mr29378809a91.13.1767028444325;
        Mon, 29 Dec 2025 09:14:04 -0800 (PST)
Received: from kailas.hsd1.or.comcast.net ([2601:1c2:982:6040::e14d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e76ae7618sm16105280a91.1.2025.12.29.09.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 09:14:03 -0800 (PST)
From: Ryan Foster <foster.ryan.r@gmail.com>
To: bboscaccy@linux.microsoft.com
Cc: James.Bottomley@hansenpartnership.com,
	akpm@linux-foundation.org,
	bpf@vger.kernel.org,
	corbet@lwn.net,
	dhowells@redhat.com,
	foster.ryan.r@gmail.com,
	gnoack@google.com,
	jmorris@namei.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux@treblig.org,
	mic@digikod.net,
	paul@paul-moore.com,
	serge@hallyn.com
Subject: Re: [RFC 00/11] Reintroduce Hornet LSM
Date: Mon, 29 Dec 2025 09:12:48 -0800
Message-ID: <20251229171402.1491979-1-foster.ryan.r@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <87v7i4hpi4.fsf@microsoft.com>
References: <87v7i4hpi4.fsf@microsoft.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

I am considering how to reconcile the TOCTOU concern with the "don't touch BPF internals" feedback, I think a very small API might help:

Minimal API draft: BPF integrity measurement

Goal: kernel-generated measurement of the final relocated program + declared inputs, so attach/link can be enforced without poking internals.

1) New BPF cmd
- BPF_MEASURE_PROG (or BPF_PROG_MEASURE)
- Input: prog_fd
- Output: opaque measurement blob + metadata

struct bpf_prog_measure_opts {
        __u32 size;
        __u32 flags;
        __u32 sig_len;
        __u64 sig_ptr;
        __u64 prog_id;
        __u64 meas_id;
};

Semantics
- Kernel computes measurement over final relocated insns + inputs explicitly in the integrity contract (e.g., sealed maps).
- Measurement is kernel-owned and stable for a program state.

2) Per-prog integrity state

enum lsm_integrity_verdict {
        LSM_INT_VERDICT_UNSIGNED,
        LSM_INT_VERDICT_PARTIAL,
        LSM_INT_VERDICT_OK,
        LSM_INT_VERDICT_BADSIG,
};

struct bpf_prog_integrity {
        __u64 meas_id;
        enum lsm_integrity_verdict v;
};

- Attach/link allowed only if policy verdict passes.
- Any input mutation invalidates meas_id and resets verdict.

3) Input immutability
- Only sealed/frozen maps can be measured.
- Any write to a measured map invalidates the measurement.

4) LSM integration
- Hornet (or another integrity LSM) consumes the measurement blob, verifies signatures, stores verdict.
- SELinux/IPE/BPF LSMs can gate attach/link based on verdict.

Why this helps
- TOCTOU: verification tied to final relocated program + frozen inputs; mutations invalidate.
- No BPF internals: LSMs use a stable syscall API, not map internals.
- Minimal blast radius: one syscall + small per-prog state.

A thought for future iterations, happy to help refine if this seems useful.

Thanks,
Ryan
