Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D724C957E
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 16:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778690144; cv=pass; b=g5z4yXhsWLRqhj06j1EV1qiwnc6NMtRH1b9b07NfLy/XTyY+IBkWlHD6GkKBKf1gGL0X2pfh25LXi9zzwH6HRbsz4idQc4HvODSG91LpmZaxBilkQXx53H5YPFjr8vZ8eyatJOUQJ8m8lya19JzFgY8snDkp+EA5cauxAntz4OQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778690144; c=relaxed/simple;
	bh=szTmaxP23lVkEVq/RlBkdxcb8V6CMoKd6fObh9S4BLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tEcI7k3icD8jyncs2eO8jWyNvhaPOxyLBNrlOXBQI7DeAm1dzn6UdEpZN96ZxKH5XZSPfp1j3KX6lmXiuyv6LkujPR0pwMRu6pu3tPplRZrII2aALrCQehdgfzqHSVhWVdjYysENjnDOiFBdOsX+RHiNxhAcK0c510Ex2NbQwcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mnz0ReYQ; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mnz0ReYQ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44a74032ff8so5256191f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 09:35:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778690141; cv=none;
        d=google.com; s=arc-20240605;
        b=ICiDe0cfGypFgZonWu9XK93VzTlmetXA79zERoMFFG8Lwqq90iAtfLyRF5YYMPLAvO
         mcRECrpsYQw1z1wd9oY5Ykni5RlFhh1FF38itvyDgVt/0zmrXBvkSg3wLqFM49rGwTxb
         aTvSVua0Od14uy4s753VDSfpbQdTAXYwHxRlLHc6krfrJ374fSb1nf+rI0SodYBn0EEF
         wJWH+FRk+zPQS35CS2MFV0fKGUr/E6M9pIXLYX5DHwvTwxSdcdGI+VdqB1RIyQascfwP
         Hq/5x60UM/nCftphjmkTiruQEkiBH8XrfRrGf/RbkS5UM7Wiv+B7plNfv7gSBohlhjDs
         WHUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=szTmaxP23lVkEVq/RlBkdxcb8V6CMoKd6fObh9S4BLA=;
        fh=HueUs7fDlrbEzjAZdIkSubbihwq5vuJzIpG8XeLJ0Js=;
        b=ZCicNcJb1dQLthPlkN65vzKYhFxjvOpvhtwkCw+IYLKGX6OL/OZyAE+yR381cHlc8i
         2UBqM2Ya4ku2l68s2zShn+UOXCdnqTp8zh3gALnNZK/XVTgh3C12mBlFUhLusLlmOgC/
         nl6opfeX8vNFsnabey5+/Zxr4eTGwaPvewghJRErtwtIbLewM50e4SH+wRGYjLKjDRaZ
         r+ff1Ac3Mm7cii8GbWJirAcJfYHq0t+xeBhSzq/TDIA5KHbfpIvJZIVXZ/Vm0rAN/zlJ
         sRTZhjgqZnv210mcJnnC1LrH9dzUInCuCg4w+zxn+IehCVjEH9sflNSF6hKMbGCPSkxN
         fZ5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778690141; x=1779294941; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szTmaxP23lVkEVq/RlBkdxcb8V6CMoKd6fObh9S4BLA=;
        b=Mnz0ReYQKxqtSGLn3aICTB8GIlcb+ejq6ZwbKM4a3OUMjot/T1uuBurp4GLGybwL67
         Rb/B/qxdy1v4CZx+l1zBz/nHAKRHHRXcbm8hkrDQq8CPcDWrihdqOHFxtoDaC67BKOIX
         JWLpcwoD3iDmIOLYv88btopPuluD3uue5f2qEtZ9khgGAROt4kJtrkrMP5cee5aDt0JH
         /2kdmlm44Mhf3Vk3N8xyb6V0IwxgR8oY5ancyKc4zdLtrK/A9oDCsMNsk86VahGnou0R
         tThTlKSFTv3SnccWMdyF/bARMgNVJOPBD38yLXsae0XT6IFINMdWwyuSJ1TJX0816x/h
         SAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690141; x=1779294941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=szTmaxP23lVkEVq/RlBkdxcb8V6CMoKd6fObh9S4BLA=;
        b=bE31MLTbj3DGBDdUJNrqvVNqCctlkpsF3p7pOdFvhsg+6OYYvU/FmbO1EheITk5RRI
         UmB/DRZDtPSpl1NG0k6ozsTq20VMsDQi9JcsRk0R60f3p0CKSRz3NdNWcJo8Ng93e5nv
         isGU42NGMxo8uBazm00/DkLB0rNLpKr8Fl3mmzp74G4QoqRcmhBnHyuSLINWaIbDLDMb
         s4NgtOV4Le0Tem2rHrjblW+84gioJgHlxLbsFFDZAnirVgS2jKXfyEGPUlnvLbhS0xzp
         4g5Vtu0k5sPZM2HrovvOXtTeF3u7R+awoc/MDzaREI2yJqvf9wCHfE6EW3z9Ftv3WCmQ
         HzXw==
X-Forwarded-Encrypted: i=1; AFNElJ8IrRFuKpR+uSJdsjf7i+NjoaBoMwCZ5AcjIaY/m1dxmwrFfq90LH2tsTfT1TTFRjhanYSybMZ69do=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXwEngY+0TPpjfbBgI8EsSHXy3h1nF8tfj8mHT+Ft7QI/ZJ8wl
	T502yPwvzMP9LdZOcyBHlkTFZGYiuSo1LbrCA3Lgh50O+6iTLwrlIogYXyFNhMNmSxsG8iy7jUY
	9WeLHKXGx5gf0Fn/9+ZPiSkfotFv/W3c=
X-Gm-Gg: Acq92OHhpA/LF69SPkaXxLXcLoh6gW6UTwMm9GJekDJ2Ei0L9aMTZtRgFNnrKY+NQJC
	lNmkOee2h9ao63Rzc8VP9+Mcd8nJCzrt4XQ0S9foNQMfV7Z1RtfdZbxIVwm8tNMc5Tqgmv3P3e3
	G5JMgUtVSo+tKllpGNhDwM6YO3UZ+zgEqLG70yl8j3VWFvVZCJqCmkdM5YGZEo5W7tUY3/4ke1z
	HzeM7BwDv1LwEMuf7Kr7h2AG6XuK++z8IY+e6DCevtv6M+Fn6V4ssz99k1urv3NTiatAspILzvz
	s0C/TqOwdbhDe3nXtCcBA6OGNd31pcxztD4qp2POU1VH+oq+sDPDkTNnkxMhnXKwpx9EHOsAoEO
	HC0S7rbLSeq9RvsykyFTdhiJX2vTaHMXmBEWz
X-Received: by 2002:a05:6000:40da:b0:441:36b7:725f with SMTP id
 ffacd0b85a97d-45c790b29d5mr5681775f8f.5.1778690140854; Wed, 13 May 2026
 09:35:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503164700.548164-1-atomlin@atomlin.com> <CAADnVQJ5fatNF4auH+a8E39zWMfja3rm4BM_xGcTnLX8uuCQ9Q@mail.gmail.com>
 <20260513111331.7bede512@gandalf.local.home> <CAADnVQL_sWznA+JJLdzP_ZdUgQeO7p-AGnOtx9=fXjH+PnRJBA@mail.gmail.com>
 <20260513112307.53e77312@gandalf.local.home>
In-Reply-To: <20260513112307.53e77312@gandalf.local.home>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 13 May 2026 09:35:29 -0700
X-Gm-Features: AVHnY4K_hlbgG6Weelv9JfOoNVR8uOv-dykIa4nZRH_llhP3bTFiLQRGwYl2Ss4
Message-ID: <CAADnVQLw+_NaOVeaKabuf085wNo_-6MAv8w0EDO3fBz3KCQT5g@mail.gmail.com>
Subject: Re: [RFC PATCH v3] bpf: introduce TAINT_UNSAFE_BPF for mutating helpers
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@lwn.net>, Song Liu <song@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, Matt Bobrowski <mattbobrowski@google.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Jiri Olsa <jolsa@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Yonghong Song <yonghong.song@linux.dev>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Randy Dunlap <rdunlap@infradead.org>, neelx@suse.com, 
	sean@ashe.io, chjohnst@gmail.com, steve@abita.co, mproche@gmail.com, 
	nick.lange@gmail.com, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	linux-trace-kernel <linux-trace-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 8:23=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Wed, 13 May 2026 08:16:07 -0700
> Alexei Starovoitov <alexei.starovoitov@gmail.com> wrote:
>
> > It's impossible to track all modifications.
> > See what sched-ext is doing.
> > What does it modify? Everything.
>
> What about just having a list of what BPF programs are loaded, what they
> may be attached to, and what kfuncs they are calling?

Ohh. These have been available forever.
Just bpftool prog, bpftool link, bpftool prog dump xlated
