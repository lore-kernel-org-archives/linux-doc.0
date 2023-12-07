Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I4/KHkK0"
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 484CF10DE
	for <linux-doc@vger.kernel.org>; Thu,  7 Dec 2023 11:27:41 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a1d450d5c11so166349466b.3
        for <linux-doc@vger.kernel.org>; Thu, 07 Dec 2023 11:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701977260; x=1702582060; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4E9EjufK+QQ1AdYRrvjoO8aPYSHXzTiO3F6OND42SLI=;
        b=I4/KHkK08+OWS1hN5mtQXof/bTMhQfAsjhynUtzwXGLjBWvHLiqw9pZrXxXLNK0QIi
         Sxkd3eU1r3A0TWcCpC4GlctsK1i35sJGNTSpeIwxjtcXULFUSRk1QJCJOO7UcK9n2VQS
         ESfmBVAwC8M8JXcAzUyx/ETJEvia0p3AfOIf6wpz7g2I1ih1VdG316yHrnhGhGYo3IE9
         VkqVDPYGZfsp1Fqz307UuNx6X3oRX/0UYhCpuhoArxT8fJ6/o79scRUEV/C2C6Zl98FK
         2NJt40hB9/ZmZs6//8L5163JekFUUcGLzqoQYNx1vWBCpM266/ZM5Bn5FuS8Ybua60Xt
         h4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701977260; x=1702582060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4E9EjufK+QQ1AdYRrvjoO8aPYSHXzTiO3F6OND42SLI=;
        b=Z7yUk0OUMdGvt7vzycUua1bl9SjgkQhIH/dfM/JyKUtC7XTuyZ5pUC98ZV6Vr7vE2f
         ZMCgpF+t9NZQ4/n7s6ITbMGEJ6yCZg7W2uDV17xfLr5R5vmwPputSbRUoUOwUkMHx2GC
         hmPFVBuoUirnnQVeTePUgf0bvbhtBlyz77lhx9bkxn5C9orSxbcECv5bwGn0iDzqsCBh
         K//3aAXfzcgYXBsmbSUuma2KgNE1yp2Fdm7Thrl+Qr0oSTsvc+tASt2ejBP4scOPY3Nx
         eVd938YtIDhJd03+z7A6M1kwVFhzfGP1kbrXeaJEFeAH9UAHW/u2mSauWo40WQqHht4W
         Pi9w==
X-Gm-Message-State: AOJu0YzzX1ETnqPwSZFmPuoZdjk5A4EEJ7KpSU1cXehQQnK2O5WzpTWR
	i/J4XXk1pwjcfiNHpsRnS2FUPGyWTQRdqV22fnzZkQ==
X-Google-Smtp-Source: AGHT+IHH1zFYufSwyQB8U9rgrIC4sq0GB6WXoJ/zmhJTj49HFlZA7bY4ykSDj9Wui1XOBR/5t/KfodLOglwZxfBCqQ8=
X-Received: by 2002:a17:906:4717:b0:a19:a19b:5604 with SMTP id
 y23-20020a170906471700b00a19a19b5604mr1751313ejq.148.1701977259361; Thu, 07
 Dec 2023 11:27:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207192406.3809579-1-nphamcs@gmail.com>
In-Reply-To: <20231207192406.3809579-1-nphamcs@gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Thu, 7 Dec 2023 11:26:58 -0800
Message-ID: <CAJD7tkaNE8G_Cd5gghaVUOf76kFxZvePv6XSZY2g4zWq2s_kfA@mail.gmail.com>
Subject: Re: [PATCH v6] zswap: memcontrol: implement zswap writeback disabling
To: Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, lizefan.x@bytedance.com, 
	hannes@cmpxchg.org, cerasuolodomenico@gmail.com, sjenning@redhat.com, 
	ddstreet@ieee.org, vitaly.wool@konsulko.com, mhocko@kernel.org, 
	roman.gushchin@linux.dev, shakeelb@google.com, muchun.song@linux.dev, 
	hughd@google.com, corbet@lwn.net, konrad.wilk@oracle.com, 
	senozhatsky@chromium.org, rppt@kernel.org, linux-mm@kvack.org, 
	kernel-team@meta.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	david@ixit.cz, chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 11:24=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> During our experiment with zswap, we sometimes observe swap IOs due to
> occasional zswap store failures and writebacks-to-swap. These swapping
> IOs prevent many users who cannot tolerate swapping from adopting zswap
> to save memory and improve performance where possible.
>
> This patch adds the option to disable this behavior entirely: do not
> writeback to backing swapping device when a zswap store attempt fail,
> and do not write pages in the zswap pool back to the backing swap
> device (both when the pool is full, and when the new zswap shrinker is
> called).
>
> This new behavior can be opted-in/out on a per-cgroup basis via a new
> cgroup file. By default, writebacks to swap device is enabled, which is
> the previous behavior. Initially, writeback is enabled for the root
> cgroup, and a newly created cgroup will inherit the current setting of
> its parent.
>
> Note that this is subtly different from setting memory.swap.max to 0, as
> it still allows for pages to be stored in the zswap pool (which itself
> consumes swap space in its current form).
>
> This patch should be applied on top of the zswap shrinker series:
>
> https://lore.kernel.org/linux-mm/20231130194023.4102148-1-nphamcs@gmail.c=
om/
>
> as it also disables the zswap shrinker, a major source of zswap
> writebacks.
>
> Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> Reviewed-by: Yosry Ahmed <yosryahmed@google.com>

FTR I still prefer a more generic and future-proof interface (e.g.
memory.swap.tiers), but I am not opposed to this. It will just be
annoying to have different interfaces with overlapping functionalities
in the future if/when the need for a generic interface arises.
