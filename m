Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792813446;
	b=xgEGeTCJKJ72Y6EnaTjXZbCo6A+KUiw6U+v/DudrpqYQVh//U4pCdQtVq0BDGIuKoog5
	 9GPLWIrK0daW0Op1YG8DfTQMTu33r5lVFd+z5FQ9cCXFfx1ShZRI53Jlu07+z+0eVr2TP
	 1YhXlFI6fdfvL3SKIvnJDVPCQxctglujpcll7k11veZ28yiAben7OipVz2yCyQBdysMfJ
	 kiLrmtsG/Lgi0NosP1pW+VHImH2ApdBmIdaIQ6j92WeKP+CH0XrNq1swJZr75eQgG6jlO
	 /omYlYrYhiSx2lS6M3T2zUU+rEspby4Q347YPHJh8YCullJkfSj4+Yb9CzTI/L66trA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792813446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type:Content-Transfer-Encoding;
	bh=D1EfrUVYhMkemv76adwO/TrD45i9KqtzMIzJ/at72g0=;
	b=d9TZHZI80r07QnGOIrrjGWbuna3LdhB+B+vkm0zjVqx1rR1CKDi4PxEkKEAx1z/IWJCa
	 byZSFFc+BpljP7KhAcqZV9Q2GxPkeD6wzmbIfiADOFLIGu1Yx1uScJyLN5IZqbRBaSyLd
	 l9hX6u1nzkO44CXhdc6sfmFP07QpuyOS4IFm2OHfwLX2aT9Wwj+lh+fRKEhJo6fY5vfPW
	 TnQb7GcihhBcvWCXqndPgs37mSpfhmcXM0mSLrRnjJbNbidwzZogJypVWwfIgvK3NeCsJ
	 dyHjX0JAHxnPlPMvHb5QMAW4S0m4LWNzA8n5tXEg00yESu000F2BCq7HMi5Zk7fUVng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dsq94QfJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3D4606A31B
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 03:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE3D4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dsq94QfJ
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-46556b9e02cso944323fac.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 20:44:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792813445; cv=none;
        d=google.com; s=arc-20260327;
        b=GtKsrzzHSGprVaLxFqh7CwY6jAAeYjzBeJBIu6SvNa4JMJWnFfTa66zUL0BImXmviO
         BXD6EkFZOmMRnnKrFP/M5qWMU1ju6xpQiMLZKqYWcEibFy6yuowUa1DF1SUxf3++Xsik
         ylK09W71w0/PqeLgcOvZpiLzXJc4cEkThJAVEjBb8hNesdFYT0wMiPi50E3XDLQE2N8j
         lO2/aO7xm0jR3kUmT2zAoIb9jcsQ4/BdioW3pG7tY7/4gemtd7tgkaJG7i0FSOpT2Brw
         UZG2p5M1iQbNJSBq+6JWAPqJipiwLghUJE7vewdeM99BBiJrhynJIk9J94yfYEkfuy1N
         AdgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=D1EfrUVYhMkemv76adwO/TrD45i9KqtzMIzJ/at72g0=;
        fh=u+LoQchQdtsJ0jGHnMpcwY3MjAECrctHlkvHcevt2LY=;
        b=VU+YXtvAkcZ3gJyOYY2PL01Wmr0AqzRvUQNR6xUEJ089c1Ywska7+19qTnwy1WOEzm
         fHtgya0emnjFA4++knvLmp2KZDYdY+30x8ey3P885I0vTx+s+bl6midRAoBpG83wiWxK
         3Uc/lTPtY2CgBaNsVWnyhZWwqqkFQC1FtAlFCGzgJvyKZZJ+u4AHld2kNuUeoiOS0zkT
         5nOjnEml0AcMv7ukMBpQBpUC+GvPKLIm+m1C1+8u0cdJYZVDV+RcsUOqsYl7Cq7fZjd8
         B8MViDFTFpyjiGjeXn5M1YM+pgG2qNd8Oh5en6sB3iMG0bLdnLSAfvqJ9pkxb7v4w/om
         OL8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792813445; x=1793418245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D1EfrUVYhMkemv76adwO/TrD45i9KqtzMIzJ/at72g0=;
        b=Dsq94QfJwuxTXWfcWbJgISmpq5FjyjAioasRFdAxllP/qjxzZBiqk61NzPXHzvQJ9g
         KeYQcvhK2rYrU4UWIl/fq0HzOJ3IpNMptHLszl+cnhvQhUeAWNSOdytcduFL9fG4cTRw
         rl3AEyCPBswgrr4UvmxyQgB/i/AeM8DCVRP69Peo5QB22tFJaaEnf/Nekl2wE+JsRaXl
         7oCzA7FFVU8uWHhyoxkfw2+V5Jp3opmBqUr5EI6cvfnUYLO1wwmw++XA92IHK3XGuZkM
         fIkXDzbe3NkN/adKsoPVao3xCKZ0mX5JoqrreqFrbH27cayJ90Ic7Mht2Mr8WL0KFzeP
         ndPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792813445; x=1793418245;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D1EfrUVYhMkemv76adwO/TrD45i9KqtzMIzJ/at72g0=;
        b=ArC6Osp6plMtNVGHHEISSUfiL195K3NoJUDqbxPKABDbClm9AwrIjckAliCyZPZNH4
         8R+Fe+GsiKBR9+tpwRzSYVDoN9kk/EjXERr/GIG6URBdTwQAX4U+gh+0a4Pix7El9311
         SaBtKxlWDPzBN+z7kDsCmlIl7jzTqxCozQYroKMmyzX6Q40MEAhQur9TYfli5D08Rnq1
         e95v9nCEUvY1YIzRNJP0oEYId53xPqtOAf2PJFaFhS/gnrJEkFvJdm9oBWhqw17DE86t
         eVrskeaVY7rzIArfET5Vm8Nj/Q1Tgypab6aLPGY10AshtBbj+n+yg3XsewlU7MpaGXhz
         +USQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNkQEa8oIbrsrRp7xYGvhYSaI6ffZODD+qPxpfm6egG7UAeF7BKm46zLUMxOwmIk1HAbfZ1xqYN0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXqDzh6VtLazho8Ap5I/V9xzdE8odB6XgPEIkfh3iXkvKmZb+e
	8HpRnE3f5Mw0mmimIwmrPHjzZXiXnrvJDUmikUYTTjZf4BWjZirmBzBL+TWHJQ756h0fSAVy4z2
	NT+r7eqcEMzyf/3DloKTnlt1plthCoLk=
X-Gm-Gg: AYBFou3bNLGPKbC0SW4zoVaBfTCahcHVSwWOOyuAOSa3YHz1sZdfy1UKUbwiMXC672v
	Y8twxoDwl0OvLt65voQoxRpTpp3cNitXMrgF2d5kw+6rPr/1SlY/whs+cV9VkANK4n2ZRA9WC2A
	hEJNvYp3neotiH9aaphcHBkxh20Sj8HXkSizs6YVxO0icDfhdqRYgukw+YKkhmh6xFp7Owos549
	R92iUgOfpStD0+itx1OKMbxbYa8ad4eNv4hs6u3nOsYxw6AGFinYMmfxKbD/NsrmLXLSjLBukYP
	QrYYi1IoO3NJAHffOQ9qyTfhpMDExUkqLN8vs8fq5a4nsljGqGZSKusIcO7U0r+H6w9C8W5SKzw
	S/6ywTYbkyC8gnFpumAfvvl+neHWgRbqbRMBSdA==
X-Received: by 2002:a05:6871:b2b:b0:470:e97e:8f84 with SMTP id
 586e51a60fabf-4a83f524928mr628402fac.20.1792813444700; Fri, 23 Oct 2026
 20:44:04 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: MaeeFilho FL <joaoanandalima@gmail.com>
Date: Sat, 24 Oct 2026 00:43:52 -0300
X-Gm-Features: AclHuK_AGq1lvNz9W2OO7Eg_BHM0lXyGPTbv0z4Ci5LFM_mC0rlj2Yh3p9Rsm-Y
Message-ID: <CAFA5sMeMcqawompHuzrokwhP8icaNVtghqFr0GYxuqUm1TaB_w@mail.gmail.com>
Subject: [RFC] mm: page-fault: overcommit: PPM (Page-Plugger Under Memory)
To: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Kees Cook <keescook@chromium.org>, linux-doc@vger.kernel.org, 
	jgunthorpe@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ard, EFI Subsystem, Kernel Subsystem, Doc Subsystem, Jgun NVIDIA, Kees,

Actually, the Kernel Linux memory management subsystem introduces
significant latency spikes during single-use, high-velocity volatile
data streams due to speculative overcommit tracking and reactive page
fault allocation handlers.

To eliminate the cycle overhead of the page fault handler (vector 14
exception routines), this RFC proposes a localized, pre-mapping bypass
called Page-Plugger Under Memory (PPM).

Architectural Overview:
The PPM subsystem introduces a non-destructive hardware plug mechanism
within the core page table layer, targeting the upper execution bits
of gfp_t allocations (allocated within the Bit 54 and Bit 55 matrix
limits to avoid legacy subsystem collision).

1. Allocation Handshake (ppm_kalloc):
Using the GFP_PLUG_MEMORY mask, the allocator completely bypasses
passive overcommit verification. It instantly isolates physical frames
on the RAM, maps the page table entries s=C3=ADncronamente, and forces the
Present Bit and Writable Bit to 1 before returning the address block
register to the CPU.

2. Desallocation Cleanup (ppm_kfree):
Triggered via the GFP_FREE_T parameter, the release phase executes an
immediate length truncation to 0. It forces a synchronous TLB
invalidation (via invlpg execution) and flushes the data out of the L3
cache lines using clflushopt instructions before moving the hot clean
pages into a dedicated priority recycling pool.

Performance Target:
- Elimination of page fault latency penalties on performance-critical pathw=
ays.
- Deterministic allocation timings with localized hardware cache purges.

This header infrastructure is prototyped inside
<linux/ppm/gfp_types.h> using global tipified configuration masks
(GFP_MASK) to enforce 1-clock execution checks inside the allocation
hot paths.

Feedback and architectural review regarding this memory plug
optimization layer are highly appreciated.

Signed-off-by: Jo=C3=A3o Guilherme da Silva Freitas Lima <joanandalima@gmai=
l.com>
