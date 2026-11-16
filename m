Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857811;
	b=wVipegeFRMhkS2CMfYi6aj716hC2dg+3rJ0zAgFNsytr2iWuwchpkvHZdtE+2XkMvbvL
	 VkZnGgL3dPDkjytsFiOv9eeXemno8ksI2bLGN+yFcHfD3wZhD91GJjfy1mEKaUKKt786E
	 80GF0NCsG1F29BVD13Gq5YK842qzHBLCl9QE1jM8rqelL7xtW42IBB5GePGhKBY9h3eO+
	 mwUaXmv3xTKSZo38pZTTUDtJQhT4cq0zkV0jlkpz1ZgLQ7ShyDXEf3R/34FCAyWyb7him
	 7+WjxoLKIVMjGoYO6zmiHOdBl/5Ul3sIeJqdep1ChFAbBnjBf05x3ODurMFVtVV1HHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=nh4pWMvkRsPEst/kCwIp1wxFa2k7tAfx6b5lfGN0krQ=;
	b=ntommHl7WUOTfMHRqDe+9g5uL7FDHYl4BI4EbXucZdBWk+MGkggu5Oq+H15kkTo6bEJ3
	 V5JK2j31SjIPnSQYyIHBxfJnsjA4mvA28vBYukQhuvYfLWOVvAtuMMzkuDzx498nQUXx7
	 mjqA9pNYpSeVYF3ohgCRKTd1jDcRx7aWeoW+P8e0CvzpMl0J3tebIeB/FYgAdjM12zFcb
	 Jgh60TxSY0nw0rEnLXwRzS+/KzhpjCwQsSRVsKZjzvrHWmJF5gEviThUPrhIHUpO3d8zH
	 ySRXZU380vMZQFWyRBqbxnRWEz9eLJ/gzY1w4k7TRJlRnWhceBOzCMkWvdUlv2EZZnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=JE0F9thh;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0C6606A322
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 19:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D0C6606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=JE0F9thh
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so624125266b.2
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 11:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794857810; x=1795462610; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nh4pWMvkRsPEst/kCwIp1wxFa2k7tAfx6b5lfGN0krQ=;
        b=JE0F9thh/y7UOTJSKLxzXKX12imABePPMOEs6ZIqDpMCHKNnzFR2d8+uI2rH3zTxFb
         3+zn+/+ytydiFugyyWX5j1XDjGVg1yc1fDfTMFBxntmN74IYqLR7d+xqVvxZddj565v1
         pu0IKYOb0XbsknnypjIZaGJErbXCCh3Lfw1vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794857810; x=1795462610;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nh4pWMvkRsPEst/kCwIp1wxFa2k7tAfx6b5lfGN0krQ=;
        b=wKcK8IopvbEkfJYP8LK51CNR22atX6Cvg+8sUzsysmhNB4rxa3gEd9dGL8efzpxbqz
         1ZALfgcQJf62tASiRWTs/yIJR+TRVMQECYmYVT4ZinwupztQq5Id+QZ0xugL8/hlhbIs
         bN4qZBtMNadYGOEvAvl7zthXv0g1imtWvoeUQ3ebBKNu0XjL5RbPx6OQvvbQxp3IdVVA
         A8ympgA9BPDYgFJdEZ4nmo82CS8hyHWsRmZZKa2L0JadO5P01Ww4A2tFX7tJtot50GBH
         l4uGlbwC+Kdbb9JEOfhU4sq57J40ZhvWu6tSrp3QlxKYdrWf7BnhVI/3CyBQfqf4aS42
         5GBA==
X-Forwarded-Encrypted: i=1; AL+hErGZ59xHWvVrjZmksdAa7Kw87fd3TiXDDSPYBmHUjWn5ArRURu2n8XrW7dRSLd/PsrHX2idnIU4G1qE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/I+rrLYqVIurFIHAduj3BsSLDhIY9AejZGGPz2DnUOUmUHSTl8
	DlO6zp12V/QG8vuZzyQQu0dcE9n6LcAp/2Y2haaLYpkRi9bhphUo/xxS+6sFiN5C7xHcP+qHvxN
	dw/C1T8hWaw==
X-Gm-Gg: AYBFou3F8Dhd5OKJ0rnBj2e/Qws8oxdZRCxsOcHKmFp8ieKI+LKvRH4oZSim2RmRxYS
	95eYNi6bgEI+e87Qu32WrNGRCM2L10+dvEdhw1bugN40QLuFcxFTORr+WlCDP98UQCqiKmzcIRS
	wwTyZhvQaUu8RMFAKSkZ4L/TIALJLRxhLmjsnWAuWCEjQChRyuDSDTEfkmrqSRRwQAV8viVGlGg
	OSp2DIzZ5f0Ve2tR6YMSorGqY/UDFIpMkBUS72h+H/J6E4pqW1c49smKO5ULbT5iBILWq8ok5GI
	MBaOyAFEkPRQn3cQhtPcADwGZiNZu+Aj9mba9pYtKf2HwMY0CTEGXON5irThwJEwilChsTbI3wS
	E1e1zAUawU0dCLux1jTdEme6MJ3e9M9jgoaILr3b3O/MhhCJSunAyHUzxLE3arcIN1UhaampELC
	56QLm5zyfTNPiL1gO/3mudJgCPlCfbAKZMKyszkFD0KUq6prKNrdhFVLLO9RfC512FdPzdvsvDK
	PdfMkHBgF+HO03OW9TviP5G+eR8lMS+eLqIaTfBTHZWjvR4xEWOHeoeIS4eyyhpVkL8CiijzJYw
	emX/ZPHn8hT5laShdoxt/WQWDtcq8sdT7As2A5In7TVZdPXvtIabA38IZQRFUGxfChxeUpBOvK1
	GJI61
X-Received: by 2002:a17:907:3e8b:b0:c29:f5d8:9c78 with SMTP id a640c23a62f3a-c50964101demr914519566b.39.1794857809850;
        Mon, 16 Nov 2026 11:36:49 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50e9b2b5fasm92810366b.35.2026.11.16.11.36.49
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 11:36:49 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so373219966b.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 11:36:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFvdJtY3UidWjFhZ9fG/WLtZ/3cKRmEneoeQGWwJ87gCe72hwKPQrzCNkFfzcBSmiWRIVeUvyrbycs=@vger.kernel.org
X-Received: by 2002:a17:907:d86:b0:c50:4b6e:329 with SMTP id
 a640c23a62f3a-c5096372173mr926077766b.15.1794857808907; Mon, 16 Nov 2026
 11:36:48 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025164719.1831477-1-sashal@kernel.org> <CA+1xoqcxAsRij1j10TyhNX9JXNXNkdWO3sMaVRXCqYdEXi45fg@mail.gmail.com>
In-Reply-To: <CA+1xoqcxAsRij1j10TyhNX9JXNXNkdWO3sMaVRXCqYdEXi45fg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 16 Nov 2026 11:36:32 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgCX4=ZSPALxR7VHKKAKipU1nD_Am-Q-0z1SRKxr-VRRQ@mail.gmail.com>
X-Gm-Features: AclHuK9wFvPLbk2hT2Jt-YCf9KvKeXcURMdq1CAih03odFDrPYf2QaCfvYcr5qU
Message-ID: <CAHk-=wgCX4=ZSPALxR7VHKKAKipU1nD_Am-Q-0z1SRKxr-VRRQ@mail.gmail.com>
Subject: Re: [GIT PULL] Kernel API specification framework for v7.4
To: Sasha Levin <levinsasha928@gmail.com>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 10:14, Sasha Levin <levinsasha928@gmail.com> wrote:
>
> Ping?

So honestly, I really don't like it. I don't think *any* of this
should be inside the kernel. I don't think the in-kernel side helps at
all: the comments are too big, nobody will read them, and the whole -
and only - real use of them would be outside validation, not at
run-time.

IOW, I see only downsides to polluting the kernel source code with
comments that aren't useful to humans.

If this was a spec that is maintained in some automated format - not
in C comments in source files that aren't useful as comments anyway
purely inside something like tools/kernel-api/ (or Documentation, or
even an outside repository entirely), together with the scripts to
then validate it, that would be one thing.

But polluting source code with huge comments that aren't for humans is
right out. Particularly when it clearly is a "first step" and the
intent is to make those comments bigger and more extended in the
future.

And I see *no* upside to any /sys/kernel/debug/kapi interface. Nobody
cares, and any excuse to make it dynamic ("We might update the API in
the future") is actually the complete opposite of the whole point of a
stable API and not something I want to make easier or support in any
way what-so-ever.

So all of the in-kernel side to me looks like actively detrimental to
the whole idea.

What I think *can* work is an external spec that is written so that
tools (read: AI) can actually then verify it against kernel sources,
and that can be used to also drive automated testing. But putting any
of it inside the kernel is bad.

                  Linus
