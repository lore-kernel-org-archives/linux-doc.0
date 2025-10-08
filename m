Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F87829E0FD
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 03:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759893943; cv=none; b=CD4C7py5ocxAiI5f7BRkxJqHGH3/X2HHW9GXWR3DDDHMA7D80DLfLLLYSFqu2p8CMdTVzeC1YDZ4eS3OQxkbie9pS9xa52c9kEgDCkqMBMTpZQ8E4vbOpUcRO4XcJECeTjhizz4W5GhFqmeNpz5ldFUjfjd182O7nl25Lz89WNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759893943; c=relaxed/simple;
	bh=Aq7/8dQHrmRmSKQ6xABjHJxjL0wL6AjJEcMgMgkiMrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZMyvNk9PN+jv14bGeSm8kAVdOb2d+Csykh0g1440g3S03z2eDmqQzYV0CmvCMj3bGTycguuyiyK0EC5AKbKDhGeqJJAKDVsjaIK4xa5lRlaccX0/IqkDD68ei5a4Ah9gBqca06vN5dkWHnytHKUAFdetsG4GqDgIe0u5EPfhy3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izS7O8Nb; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izS7O8Nb"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ee130237a8so4958685f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 20:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759893940; x=1760498740; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aq7/8dQHrmRmSKQ6xABjHJxjL0wL6AjJEcMgMgkiMrU=;
        b=izS7O8NbWYd+JSuU5aTA2hEJWpUrKX29TsPeun8AgpoaWyq3lQCmWi2HlRDzFg4PU6
         1kBe4Wl0BsGB7vMbK59U1/S3nRlXIwYrHCaRwg0TFEiVfvn0z587IyJhv1+IZc4MaV9o
         sBr5nybTfNEI35upT/LeA2lGAiIGSEFP2EkH4ETqyVGyok6LsvovkIRWpAls5vGuWkyk
         kbp6uAbjs6i2nKLWtHcd+s0SdepO7n13cLWdp+XwwlSRCLM+p4jm7AwQxb6Tnwpvzo1C
         7iWmbOEdzCBgm6MnTt6cn5QO+qGgelEt6FW4cyKxeZuPUnYgRw/Jj47WzzyYxrDyjk20
         XoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759893940; x=1760498740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aq7/8dQHrmRmSKQ6xABjHJxjL0wL6AjJEcMgMgkiMrU=;
        b=V0r2tukUIFikG5D0qQNk5pSOCTtTGVV8NGXamWbjCoDb7ksn1QtnNmlJXYiReKCxs1
         tibKX5KjxSY4vmTCVntT/5Lcu5OcQ8utR1HcIz+6/aii0UM/e42PwKUC5DO3ztcYN9+J
         fXRWkEmhm1tMrKiijTlHTvzFQ2OQ+pzs9vdUOdKfEiLqfc2WMBoXLlBOwmFN7KXGYPGB
         y/85nyWTEFRaLpj9qnPB3UL07o4zzjPVNZXPP/WHrU3nMnGZCVIQhhuHZpAcFF7QRsbs
         Qv90PGsvFsaNm/0whf4YeGkZp3H9z9wc1LwRS+a/xNyiijlsvVj4jqU//Hdq7uXywncu
         ZZbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVGjPHWDdiggzfkPOG/M6axLZI3nEUnYHAERxw+PWl1DDR/YTAiGgdnsmeGYao1kWg4axkLppEON4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAk8DF/ImQEsLLpYIlRa1mY0r8f7n2pWfA1amsrWoJu27YYKWQ
	mSHu6fuNRhdKwTAatIsS3plpfVj0PtQHxqVufOr57eEhZrhKK1Expyh5E3cxIXm8Jlcyv+svZeI
	K+17QutK7DBEnbWyuwL1kOYQEh3HWj2c=
X-Gm-Gg: ASbGncu3sOjZioDu6pwJHMxyNafx8gqS+3Q/bD50k7h895lAeDJOCPMGqwCQnLjqrYp
	Ick/FkKo4lq9Jz6sCT/xph6tEIIoNGrHOfCqkI081/v0r3D0nOHNW1jDWvHez5ul4CFI2k9QLMw
	OGrZTNPL6vX7xGGKDXcESWkT3MHRYuXI6LmYxmp2eyy6tTkE73+p4wSTDCRqX5CjLpIuEjQ7sbS
	K70ADaDZc2JIdyrgBC8M9EcWtC9z6M5fSlpc9FhC3tpK56HJCbFW3Kol/ZMQ7Pn
X-Google-Smtp-Source: AGHT+IHeswXWseQTzOZVDgPDpClSJjRdYqa3Gk+TNJHyXQ0PCdIukEVOo3TQExJxoJHeGY0CBioSlo3kBJaFQswByNk=
X-Received: by 2002:a5d:5d02:0:b0:425:7c1b:9344 with SMTP id
 ffacd0b85a97d-42666ab87c3mr807115f8f.15.1759893939583; Tue, 07 Oct 2025
 20:25:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250930055826.9810-1-laoar.shao@gmail.com> <20250930055826.9810-4-laoar.shao@gmail.com>
 <CAADnVQJtrJZOCWZKH498GBA8M0mYVztApk54mOEejs8Wr3nSiw@mail.gmail.com> <CALOAHbATDURsi265PGQ7022vC9QsKUxxyiDUL9wLKGgVpaxJUw@mail.gmail.com>
In-Reply-To: <CALOAHbATDURsi265PGQ7022vC9QsKUxxyiDUL9wLKGgVpaxJUw@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 7 Oct 2025 20:25:28 -0700
X-Gm-Features: AS18NWATPwVk-W8hdC0xrQiJYrJaEbx7Di3QWbBv11leFl2ACmYaQhhy44lYgpI
Message-ID: <CAADnVQ+S590wKn0rdaDAHk=txQenXn6KyfhSZ3ks6vJA3nKrNg@mail.gmail.com>
Subject: Re: [PATCH v9 mm-new 03/11] mm: thp: add support for BPF based THP
 order selection
To: Yafang Shao <laoar.shao@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Liam Howlett <Liam.Howlett@oracle.com>, npache@redhat.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, Johannes Weiner <hannes@cmpxchg.org>, usamaarif642@gmail.com, 
	gutierrez.asier@huawei-partners.com, Matthew Wilcox <willy@infradead.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Amery Hung <ameryhung@gmail.com>, 
	David Rientjes <rientjes@google.com>, Jonathan Corbet <corbet@lwn.net>, 21cnbao@gmail.com, 
	Shakeel Butt <shakeel.butt@linux.dev>, Tejun Heo <tj@kernel.org>, lance.yang@linux.dev, 
	Randy Dunlap <rdunlap@infradead.org>, bpf <bpf@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 1:47=E2=80=AFAM Yafang Shao <laoar.shao@gmail.com> w=
rote:
> has shown that multiple attachments often introduce conflicts. This is
> precisely why system administrators prefer to manage BPF programs with
> a single manager=E2=80=94to avoid undefined behaviors from competing prog=
rams.

I don't believe this a single bit. bpf-thp didn't have any
production exposure. Everything that you said above is wishful thinking.
In actual production every programmable component needs to be
scoped in some way. One can argue that scheduling is a global
property too, yet sched-ext only works on a specific scheduling class.
All bpf program types are scoped except tracing, since kprobe/fentry
are global by definition, and even than multiple tracing programs
can be attached to the same kprobe.

> execution. In other words, it is functionally a variant of fmod_ret.

hid-bpf initially went with fmod_ret approach, deleted the whole thing
and redesigned it with _scoped_ struct-ops.

> If we allow multiple attachments and they return different values, how
> do we resolve the conflict?
>
> If one program returns order-9 and another returns order-1, which
> value should be chosen? Neither 1, 9, nor a combination (1 & 9) is
> appropriate.

No. If you cannot figure out how to stack multiple programs
it means that the api you picked is broken.

> A single global program is a natural and logical extension of the
> existing global /sys/kernel/mm/transparent_hugepage/ interface. It is
> a good fit for BPF-THP and avoids unnecessary complexity.

The Nack to single global prog is not negotiable.
