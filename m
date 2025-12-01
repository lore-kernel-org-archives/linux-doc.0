Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE841E3DED
	for <linux-doc@vger.kernel.org>; Mon,  1 Dec 2025 21:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764624924; cv=none; b=r6WPQRITcy0Bual82ZT/fjh0/Mgd5VJTGYP7KJoYkEInoirSpUBMOTav6b5T3/dx6z06w/YJ3PEZZpNvmocyRQAn9MukN5FwjGcfZjaTLddM153Gm0ETquiLX9/yQcx5IFVewAAlh40Vu67Z0rfVTnsLJiNhoW57sHA5OCY2LFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764624924; c=relaxed/simple;
	bh=dYQGXqwPFWGIYV2PFYgZ2uiYOnPw3Ic8p09fl/bdFus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uLG5ni7bpaUDTqewMuf8rjs0n0JgQkW8MR5CUq0JTSDDm9t0tL9JSvW5Z3WrSrP/6WV6mShyiNp9oJXIarioiEQq4Te7vOtV/+417GU9OKyPFnNaKzTk6CsSDDANQbXMgb9csl8lw0Rp1VTHhNAxNGPP3exlHMvtmNw47MX8tNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wnx0q/my; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wnx0q/my"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-297e13bf404so838965ad.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Dec 2025 13:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764624922; x=1765229722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pztwMSM/xJ8ORFd02azXUTlR9KBkGnFnYMXGWY/ok94=;
        b=wnx0q/myE/QjQ6RxUOmwfssnGd8Rlc0jQR5fTFP9ikdCY3CF+Dot7tu5aZTTKtAclo
         9qvtGpSdxeGJqaZQf9QjZqZZ/iX7XBqT/KGnspYo6cMKyEUgfNdETD+D79j27/Y3rEDb
         cn+I7t2U7SvgezE+0PKll9453ktwHrlQGQFJZ+TIcNztSiKUNSYCCcz0vJLDQs5jXs4D
         TeJozaE3qQDErVKXvjJR1x7Da7HR03LFHtlcvyk18jLGn5LZQAnORL4sXSfUPUfaFR0s
         CceCoZ27HYclBliWzGRao/kAIre92+o9Z5BEH0qCFNKoppB/GSIqexBS10Gscxii9ADZ
         SzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764624922; x=1765229722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pztwMSM/xJ8ORFd02azXUTlR9KBkGnFnYMXGWY/ok94=;
        b=RzARdU0zw7pHdmgqUYk1rO3kh3v83MOkTK33gMk1S0QhdtPo1HbyzAKtWfIyJPiSuN
         6JdRizeqJjD01HfDizFflzrTZohazS1XkipKHIT5Up8BV5s2/7j+FVpxM5A73B0KeiuF
         OzHPlPTS8e3xkBXUgUjmwD8RwLJTe47mEBJbtpaJLkgZpVQ+fJ/vHhx+vIwv3uHSyo21
         D5r+Kh2923wIFPTAIILKn+XozVn88Z4Go7YTI8x9Ea2mJuRYcedPZ3IlME8TYEb7Qpjq
         f7C5AqnSW1iH3GTZJ7hVG5J80xDKdjoh/1LzXAoCFGg87tmM7Ijll6aroDN1QiGK6wjh
         GFfg==
X-Forwarded-Encrypted: i=1; AJvYcCVr9BWb1Sg+zxG1avmYNS8apybXzFTIqGI4gvm4iSgYu7JxQSvyTIhWEXBHdAl6yr/Zl+v0v2bNqJk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5zGtBpfJgy2WMyQUT25tIr7uP3rcroDiUHCP7EPleOxDxuTLm
	i1e4ynQdvWLh0G3LvHL2BoKOg+GeKT/6thId2DB51tqAYPBpythWaQvwYO74zBeal8Rb1FcgaxV
	776X8axabUrXaRG3fzDJkP2qXuRiBCTyRJGkyV/Ji
X-Gm-Gg: ASbGncs/I9GG2MKT1d8Wf4S3wNp/yTUqXHPPzz5eL8vZHUjFGxeJreX6bzx71BqaYAZ
	Bc+ZA2RU/msEORrPoQ7ScgGfyQdJtVA0kyt9n99YG4CZXAZqU3y86efhCiYFbWE2oCYAq1rbu/e
	NDouOdCYgDePqM2DnOwAX05+RArVmIfQ9bCMT7YP+W7ueglM6yrrwZvturaTGi+JBY+vh8UBsaZ
	JByhww/bQsmHQWcBjXxshdlo1suBECNE4zJezjh5IvquxFBmUxqRfojSsaESkhCPzapf5iSRN6O
	xAOVGYxpM/H1ucxfU9OYr0dYDEBCzrAZmHts
X-Google-Smtp-Source: AGHT+IGcEr+u4Lvyu2lcr5/u3UATd1g0adlZD8heHy4ha30xHQDJbp7Oka+Ww5wtit5evGdRnPc0wgduqHEKGAIhdio=
X-Received: by 2002:a05:7022:6190:b0:11a:4c75:a45b with SMTP id
 a92af1059eb24-11de93975a9mr2477c88.10.1764624921927; Mon, 01 Dec 2025
 13:35:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128025315.3520689-1-wangzicheng@honor.com> <20251128025315.3520689-3-wangzicheng@honor.com>
In-Reply-To: <20251128025315.3520689-3-wangzicheng@honor.com>
From: Yuanchu Xie <yuanchu@google.com>
Date: Mon, 1 Dec 2025 15:35:05 -0600
X-Gm-Features: AWmQ_bnUvWHfjLPC5vTcuKxCijZrgA-YfCUFmk-n0mUVC2U4d1FBt5FslZMBSHs
Message-ID: <CAJj2-QFM3iwO==3JKQ4nnHfAxYJuyYXZ6uNJUR8rQdf_Q_1x0A@mail.gmail.com>
Subject: Re: [PATCH 2/3] mm/lru_gen: add configuration option to select
 debugfs/procfs for lru_gen
To: Zicheng Wang <wangzicheng@honor.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, david@redhat.com, 
	axelrasmussen@google.com, mhocko@kernel.org, zhengqi.arch@bytedance.com, 
	shakeel.butt@linux.dev, lorenzo.stoakes@oracle.com, weixugc@google.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, corbet@lwn.net, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 8:54=E2=80=AFPM Zicheng Wang <wangzicheng@honor.com=
> wrote:
>
> Signed-off-by: Zicheng Wang <wangzicheng@honor.com>
> ---
>  mm/Kconfig | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/mm/Kconfig b/mm/Kconfig
> index e443fe8cd..be7efa794 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -1325,6 +1325,16 @@ config LRU_GEN_STATS
>  config LRU_GEN_WALKS_MMU
>         def_bool y
>         depends on LRU_GEN && ARCH_HAS_HW_PTE_YOUNG
> +
> +config LRU_GEN_PROCFS_CTRL
> +       bool "Move lru_gen files from debugfs to procfs"
> +       depends on LRU_GEN && PROC_FS
> +       help
> +         Move lru_gen management from debugfs to procfs (/proc/lru_gen).
> +         This production-ready feature provides critical memory reclaim
> +         prediction and control. It is no longer experimental.
> +         The migration ensures availability in commercial products where
> +         debugfs may be disabled.
Hi Zicheng,

A config option determining where LRU_gen files reside creates a
fragile procfs interface. Consider adding a similar interface with
less implementation detail to /sys/kernel/mm/lru_gen/ if the goal is
to stabilize the debugfs APIs.

If the goal is to proactively age lruvecs that have been at
MIN_NR_GENS for some time/events/etc, is it possible to integrate this
into the kernel and avoid leaking MGLRU implementation details into
userspace?

Thanks,
Yuanchu
