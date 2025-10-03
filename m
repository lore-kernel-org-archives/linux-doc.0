Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9832D24A7
	for <linux-doc@vger.kernel.org>; Fri,  3 Oct 2025 02:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759457928; cv=none; b=gtb+VhH08NSCSIqj6ETQ0afQflVu6lGCQ/hCXGvsgYPdD2wXCPnUtV2KpvrLwxc8u3smxYeIowvqcR4C10yboyRTnyZgj/7BrPSRxISmOlU10/+KL+TsSXHKwAT3tJEKbQCOOcsIK7C2aaPqjY24cqJyCGjulZX8Xux6ACK/YKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759457928; c=relaxed/simple;
	bh=YwdIWqYwyVfdeCv+Niz43GiSsR+lHbtXSQFoDV7XnBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sNZ77jtHC3CREe3mhwNoEl8kYe8FTP99SHRGyY0Go4elmpuRWkpW0bCIwcGX/UxIyCkyqDitrT5ikfjUXYuXdGDxd4gKqikFu5d0oBCO6PRyNTG+bFoJvc5mE3sFq8xPKTedopbmM3/4x/jjr/AicTbXx6gfQ8f1uvIj9poqn2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWJFN79A; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWJFN79A"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46e52279279so11356735e9.3
        for <linux-doc@vger.kernel.org>; Thu, 02 Oct 2025 19:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759457925; x=1760062725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2e/i8EbjlbnXxewfi6hJm/z/4ZP0XZNKcXcN/4b871g=;
        b=NWJFN79AMeM6DsxRpE+O8M9CNrXkzLxdWrjMG0Egzg9gl0DLd7BTgCOL7DJvW/eFKr
         ynTbLkw8RiRsDqT5ZzMyLVc1J2brv7fN8+K6IY6Dn/HOXEBYK2cnov0x14XBr8ajHEBt
         o54URJ1Nv0Q2E9uyLJAufdKy9hhkvhWZRXSQi2W03EVSCYi+bllDjSSMJyM2fKtdNo0R
         9F5ZtXuKgRZtMgfZh+v6radU+Hy6G3lKxQUySu5t0Zm982uwLT4EUZ+BRmY7pQ/8MX+X
         mcvZErUc5wlDXsSYZMBwVi8Ps+PibM16WWzX+k/Uxnv0FoehMD3fgOxlWm+Kq/AQvMHC
         sPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759457925; x=1760062725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2e/i8EbjlbnXxewfi6hJm/z/4ZP0XZNKcXcN/4b871g=;
        b=CCMjLhEhihKdE/gNy4S+53hBNO8HVO26ZMYhnVh23ycXtuSRhFbHCBI/aMp3BAItMU
         18UVtshPnhjcbEvjGpqcc8Id4fVs5h79KJzSpQfng5UCbL+qmn4+vIetMEHLxPnQwnEM
         vKRJSIm+P2X2V1tMJVBO7rs8tEo7vDo0FowsArXPbSgZWzjAs4nPll6BgkKHCfw3LqsU
         tI9Q+T62TwAQAiDpQ2T4PgkIgy48S8ZqS1/t7STsqze72H5sb3JF/b951G/Ps2LonRiw
         pc3WMeirVxaQwk08fy+H6y0CEhcXTZDtJ++AYcNWNnUua5wQ5yNwjoMA721b9DGly8QT
         aQaw==
X-Forwarded-Encrypted: i=1; AJvYcCWtKIJRsA7zQvWxGycjLwltLI755NVo4d3rMrnJuLbRdMopaGuNHdNnDvgDq9zc/1mSYsiIH1Z5ZTc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW+3thA8wF8oU7YxApRTMr6QbciO+cAkcu4MD8FzxpUwYiSMI3
	fLPJGdbhhKILuF5dMYzVb82cuJW1MfqquyaRFDqezFklL9kO8Pk8e3m2bBKlyhDRoXvxy15hhd9
	BUBl0HVEpbwcWHCivyD3oKcZYNp+7ETc=
X-Gm-Gg: ASbGncuAXC2q5NkTGmqCyhYGhnNaIvKloroiyeFhqtcs+WtRt4L7AUUO3UZ1FIK8YVC
	taPn9OFSxbjA/dmSsCirv1OgyNINpfSAdDMJH/zgWMNnFYKsI+PnuvObk0fLztNGt+W7gEbFT7m
	NJ6xNLxDogAQv5CaRzGMjv5ii8AH+uejeNJDhP0qCLvV15C+mM+nIX5nia4a+baqNO/EdmkYJyE
	xX5fatZviq79hFIQiqQatNEnOzWnovfwZc2pmvnYz+UnH8NjhV52NQMHDf/
X-Google-Smtp-Source: AGHT+IEUdi5h2t7CXTLul7ivkETFz4Fjf+lqMHwgof5CobhAX/VcEKSKvJeht/4smjkDa2Hgzo4fwK0xXe88/EAzHP8=
X-Received: by 2002:a05:600c:8b65:b0:46e:2861:9eb2 with SMTP id
 5b1f17b1804b1-46e711002e7mr8372685e9.8.1759457924865; Thu, 02 Oct 2025
 19:18:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250930055826.9810-1-laoar.shao@gmail.com> <20250930055826.9810-4-laoar.shao@gmail.com>
In-Reply-To: <20250930055826.9810-4-laoar.shao@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 2 Oct 2025 19:18:33 -0700
X-Gm-Features: AS18NWB-xO-pJI19YtwvzZWDSOLQVewqObSZM817yMkm5nTGr0yasX6RQmgofXI
Message-ID: <CAADnVQJtrJZOCWZKH498GBA8M0mYVztApk54mOEejs8Wr3nSiw@mail.gmail.com>
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

On Mon, Sep 29, 2025 at 10:59=E2=80=AFPM Yafang Shao <laoar.shao@gmail.com>=
 wrote:
>
> +unsigned long bpf_hook_thp_get_orders(struct vm_area_struct *vma,
> +                                     enum tva_type type,
> +                                     unsigned long orders)
> +{
> +       thp_order_fn_t *bpf_hook_thp_get_order;
> +       int bpf_order;
> +
> +       /* No BPF program is attached */
> +       if (!test_bit(TRANSPARENT_HUGEPAGE_BPF_ATTACHED,
> +                     &transparent_hugepage_flags))
> +               return orders;
> +
> +       rcu_read_lock();
> +       bpf_hook_thp_get_order =3D rcu_dereference(bpf_thp.thp_get_order)=
;
> +       if (WARN_ON_ONCE(!bpf_hook_thp_get_order))
> +               goto out;
> +
> +       bpf_order =3D bpf_hook_thp_get_order(vma, type, orders);
> +       orders &=3D BIT(bpf_order);
> +
> +out:
> +       rcu_read_unlock();
> +       return orders;
> +}

I thought I explained it earlier.
Nack to a single global prog approach.

The logic must accommodate multiple programs per-container
or any other way from the beginning.
If cgroup based scoping doesn't fit use per process tree scoping.
