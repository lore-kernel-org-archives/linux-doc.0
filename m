Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284EE34750A
	for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 05:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779341349; cv=pass; b=RnHsIj9o5oR7pCTpyVYDDJ5suIFZsTonFxfWc8gJ0UQfqmzL66APrx5K/+PZ0eU1sxjdVa8U9Covww3kQ8jvPAYdzkcY4StEUi9XlV+/oSYwicN+bVWBqsPDlRrBKlvoASpH5Y0noyjlOiiUCZRA5KnjhTDitxV+B+DPiA/c9xc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779341349; c=relaxed/simple;
	bh=b2U/lc55wl/BlR1AIw4hzD2b81g+6qnnNJJ0BmzR9k0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DzvoJbrSoxN6NLLrnej64tGyu+cnpOHpQDad5uatijm/a6Q6XXa6MfhfrhpFjvIk+TPUqfH8ZTAV68yCt6XP4Z1ZiCi+0OeM6hZDvUzD3Xl7CRumgYUmJ8eB+b33GGW6r8pSzx5Pt2GcdUA1F0VB5QR7zjMHPLKANbuuWKDTMUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0X6d9zT; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0X6d9zT"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44ce78ab5feso4774138f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 22:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779341346; cv=none;
        d=google.com; s=arc-20240605;
        b=LsZgR02TIL9Odiv+KlIzPA/z9ejhQG6COPB8dJfAHF7Wwim/YS2HAsTnArK0tBJOaL
         dPgyjELLIqDcC9Ufc8Gx5tvzgjzy+h0BdchM70sYhaxeHfRHRvGiCgprrMzjIb+TKZxA
         G0Qf9Pz206glvFsIRSF9yrzhh4KrMVgFU/VU7ewWD2cuPwpeooENRpabutG9i1B61sL5
         40HpV1HdpE1323IxElADENpn1gSKzwt11cuPH5JViMypR6aDSQP9WNpxRiRvyW5DDvgE
         J0VkcnKBZogepm3dfkYvXlxAca3PwZ8vlccOykrTtlPwqeYeJgTa6RT4AEuQvqA6MNVU
         2/SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KatY4MrrW+s9oPPVFN47J49ZD0Ibx3q1UvU7Bqv7B1w=;
        fh=ESULh7Ym9U16GVTRVH71rlvfUfWuUCJAY8/PfGq2jlY=;
        b=L2cbpKS5ngsdURjwFKbHyPOTaPnNi2fsmX04Hviw91Cn2jGeE5nQE8lIQAZLuaqfHI
         /ozky1ar0VHGpB4Wb5RSLaHCBBxbHCl3r4Tzd1g8XbHVv36+ZT24RXnW/t3w0/Pj3u7+
         gp+DEG4p+XoNuJAbnIXZhJ9OiwzJpUl29bvVqj+x3dW1OiotnCVXoJ2MJTgZBegc/zok
         H92cDY8IAlKlf4w+OcIVpwQOqi6wYDvndTbnlHm1YzNBrLdRQO30ovDIS+kBwL0Q/rQf
         mKUrj+dzNEWLG3Zdf0wWEcqsp5mP2eMQhsom7rDS9AZdEVBgHvK/8/9diRVdQTYxg4Lu
         aNjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779341346; x=1779946146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KatY4MrrW+s9oPPVFN47J49ZD0Ibx3q1UvU7Bqv7B1w=;
        b=H0X6d9zTHA3CYuLCgHJgHfa/XML1BukgW+yDc65v49fuJSrIWTiFuM/oTbwnfdfbLi
         9keAbUw520mj4jlzOL2xaR0ZkLQJsemoqjHF+ahlhPBqSgaW0blD+cg870N6O99BbIZ/
         qpLTibkN8mIU+0GtcWR+9cGBpwqQWATRMVCl1/um8/TTO68SYMNH9yfpl+aZ7tP2Ek3S
         v2m+feeUVXYuhFqqTQ04J69jjOoVwGnBfa1guIf/KpCoIo7O+t96liFflWsC5vrFe29G
         WVMUt+M2ORaMg6YKFcSEf0TQRIxzULWr140kgPM8B5UeXpu5Rqz2iYhpizklKxX78CXm
         imrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779341346; x=1779946146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KatY4MrrW+s9oPPVFN47J49ZD0Ibx3q1UvU7Bqv7B1w=;
        b=B4CGKPT1U2V3GwitIVa3X33P+xnuABg96O1itmcQfBFZlbHLES9R7Q9xnjpaX0Il9q
         S7vm2/D9sxplzULMGPy3ke4XcMwsv89NIvmjvqisyKST5EldeZaQnkEXEZZjFr0r1oQp
         iDdGoORvGQPrVyGvw+Bgr6PiWovc8jrBzX3ejO3D04i5cWZ5bOi4045546GurEbf4YyC
         LPSFtqii+UTUaxWV3lahjp624ZjYxxdBBo9FTIBAbYor4yO6ziOBIhOQwz8FEjVPYarr
         a0WmZfE4tWRll57JxxiyMhlVZw6+hXtZMc3LEkafjdkPhSdgAmK23WXXLxK+e91+6G7T
         MD5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8x/zI0Nb8PJoN0PYnxvuo8yg270uQ6Z0beBiKUCBBaRKolIUmkLFsrx7j2SWZCva8umKrNxSdmd+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsrI99lH/Y9I4BiCiyrumj9J2Gaxlded8M+AvteBRzK7vVbYlG
	9CN5xxyPxZEaklloLof65h14Dv9BC7oVoXmtkS7u1x0capFu/4vL/z36w799MsfAQA0vcxegMlk
	22y4eeIIHuWjRNuEWSoUpWklTk5GKrbw=
X-Gm-Gg: Acq92OEvGXRvtbVZxbArq6XRtGyxlitZJow1JBBzTnSr3pTiMWyBOdkzRGSmBYCcQD6
	Vh7hVvbKHwj5NLd9VLcb3ceoQCXvthVcetWCGw1MrFVdCrvL+d2EgcdvFi4my37Ya8LJJv0uz4Q
	9dhuf2Cy9EAaK1A6BgXbgij4gImXSESoVyhdzw2qX0x+j2BsxGyIxZvqkIx7ZJLRKsqecXh7TY4
	PVBTJaq4GIJx/T0v70hy9Iqu0fbCleH8G7wn9akITee70YqGM0MXur0iSnICR3vx0Ld2s7c1B6W
	K9KqIvWA5fvPLgnoSKeIWKAqnMzzXYThQLmZn/AX/2GWdIWQAGwxfoh2Rz8n8XknJdwq
X-Received: by 2002:a5d:6f18:0:b0:449:c5e2:a8b7 with SMTP id
 ffacd0b85a97d-45ea38ea615mr1725141f8f.30.1779341346248; Wed, 20 May 2026
 22:29:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521043553.199781-1-find.dhiraj@gmail.com>
In-Reply-To: <20260521043553.199781-1-find.dhiraj@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 20 May 2026 22:28:55 -0700
X-Gm-Features: AVHnY4LGyFWFsjm9R3zFYMXek3cxBABL9M5qSD6O5YY2ST_emxxJt8II8Xp9c24
Message-ID: <CAADnVQL7EK49kzHX36Y=C5YErRH9ATfTNEdBc-fyqrDM-rexbQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next] bpf: Add kernel-doc for arena page kfuncs
To: Dhiraj Shah <find.dhiraj@gmail.com>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 6:36=E2=80=AFAM Dhiraj Shah <find.dhiraj@gmail.com>=
 wrote:
>
> The page-management kfuncs exposed by BPF arena -
> bpf_arena_alloc_pages(), bpf_arena_free_pages() and
> bpf_arena_reserve_pages() - are part of the BPF kfunc ABI but lack
> rendered documentation. Their contracts (valid argument ranges,
> sleepable-only context, and the set of error returns) are today only
> discoverable by reading kernel/bpf/arena.c.
>
> Add a kernel-doc comment block above each of the three kfuncs and
> render them under a new "BPF arena kfuncs" subsection in
> Documentation/bpf/kfuncs.rst, alongside the existing core kfunc
> subsections.
>
> No functional change.
>
> Signed-off-by: Dhiraj Shah <find.dhiraj@gmail.com>
> ---
>  Documentation/bpf/kfuncs.rst | 27 +++++++++++++++
>  kernel/bpf/arena.c           | 64 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 91 insertions(+)
>
> diff --git a/Documentation/bpf/kfuncs.rst b/Documentation/bpf/kfuncs.rst
> index 75e6c078e0e7..fe0df1e16453 100644
> --- a/Documentation/bpf/kfuncs.rst
> +++ b/Documentation/bpf/kfuncs.rst
> @@ -732,3 +732,30 @@ the verifier. bpf_cgroup_ancestor() can be used as f=
ollows:
>  BPF provides a set of kfuncs that can be used to query, allocate, mutate=
, and
>  destroy struct cpumask * objects. Please refer to :ref:`cpumasks-header-=
label`
>  for more details.
> +
> +4.4 BPF arena kfuncs
> +--------------------
> +
> +A BPF arena (``BPF_MAP_TYPE_ARENA``) is a sparsely-populated shared memo=
ry
> +region that a BPF program and a user-space process can both address. The
> +following kfuncs allow a sleepable BPF program to allocate, free, and re=
serve
> +pages within an arena:
> +
> +.. kernel-doc:: kernel/bpf/arena.c
> +   :identifiers: bpf_arena_alloc_pages bpf_arena_free_pages bpf_arena_re=
serve_pages
> +
> +A typical pattern is to allocate one or more pages, write to them from B=
PF,
> +and let user space observe the same memory after a page fault populates =
its
> +VMA:
> +
> +.. code-block:: c
> +
> +       void __arena *page;
> +
> +       page =3D bpf_arena_alloc_pages(&arena, NULL, 1, NUMA_NO_NODE, 0);
> +       if (!page)
> +               return -ENOMEM;
> +
> +       /* ... use the page from BPF; user space sees the same bytes ... =
*/
> +
> +       bpf_arena_free_pages(&arena, page, 1);
> diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
> index 49a8f7b1beef..b8ec2953dee6 100644
> --- a/kernel/bpf/arena.c
> +++ b/kernel/bpf/arena.c
> @@ -870,6 +870,33 @@ static void arena_free_irq(struct irq_work *iw)
>
>  __bpf_kfunc_start_defs();
>
> +/**
> + * bpf_arena_alloc_pages() - Allocate pages within a BPF arena.
> + * @p__map: Pointer to a ``BPF_MAP_TYPE_ARENA`` map.
> + * @addr__ign: Page-aligned user-space address within the arena at which=
 to
> + *            place the allocation, or %NULL to let the kernel choose. W=
hen
> + *            non-NULL the address must fall inside the arena's user VMA
> + *            range; otherwise the allocation fails.
> + * @page_cnt: Number of pages to allocate. Must be non-zero and no great=
er
> + *           than the arena's configured size in pages.
> + * @node_id: NUMA node hint for the backing pages, or %NUMA_NO_NODE.
> + * @flags: Reserved for future use; must be 0.
> + *
> + * Allocates @page_cnt physically-backed pages and inserts them into the
> + * arena's kernel VMA at the offset corresponding to @addr__ign (or at a=
n
> + * arbitrary free offset when @addr__ign is %NULL). A subsequent user-sp=
ace
> + * page fault on the matching user address populates the user VMA with t=
he
> + * same pages, giving BPF and user space a shared view of the region.
> + *
> + * The underlying allocator may sleep, so this kfunc is only callable fr=
om
> + * sleepable BPF programs.

what?

> + * Return:
> + * * Kernel pointer to the start of the allocated region on success.

what?

so much slop nowadays :(

pw-bot: cr
