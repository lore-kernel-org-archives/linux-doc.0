Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370FD73496
	for <linux-doc@vger.kernel.org>; Mon, 18 Dec 2023 21:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CREFUUaD"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-4b6d2103c66so286002e0c.0
        for <linux-doc@vger.kernel.org>; Mon, 18 Dec 2023 13:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702936489; x=1703541289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqsrGRSNXs2jP/UwD+ksz1Ps/gXN9w1X+zQo7BqyXLo=;
        b=CREFUUaDngnwzcLfkMO8Xe8wArCgVeSWTdpgNKrNRa5RW1YZyYzuyFhkYad/H7UIhb
         9XADF1RQi2dhT+M0FGUfI6KPaqynSZivw8ak7+CCvh/rJYwxUUHvuMKApnfkt1kw/718
         IgToQlcq0yiv6NI1OdQ2bhHYi10IvY8gEe5Bo0HnPIWTW29jCpYQ3sIm5FIqg3i6VTOB
         mQD1YN6cBe8N/J5YrBQG4U5eXxI3ki6eNFDbYeeT44e6y9k/gWfSxVRk/yelNIXhkPz+
         9eNCE6aQm2A0zTUEgnXt9ayinJ0t1Hzl1GcnSLa106UQaoB6RmKMUQUvTaFSJUutMxBs
         CVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702936489; x=1703541289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqsrGRSNXs2jP/UwD+ksz1Ps/gXN9w1X+zQo7BqyXLo=;
        b=HgPyY0vXOQhewzJIOCPOfERz0y6Yv18016RWK4HD4htr66Ot8AqqEhBQZgAKqBX7nS
         tTxdmyUMu5EmMjZhCTj0RshHl6pD2KTNQF2mqBjR3Hm8bz9NnGGUizHfpLvNhEa6hCNR
         rQQRyDZu2SZfUbtFO/u/F/pcME8dLP1nHUCoxz3FtdbvkaSs+m8G/mH/UlXKct7AjNNI
         mxYMYUVG9HEoJc9p+fRrR23+MzjVCdJ5tWlj1wRRymZyJRMbGftMLUkwwmVcEHHitHKd
         t5BfOwjJQsBxwdk5qloQpGaeaMVEUZQzKYIkvxDNGvgb2NlgpF9TjWtnij4N/iqI8uz8
         AbzA==
X-Gm-Message-State: AOJu0YzZGeCyD3pgQ+0hlEoN/hxHGdxdTIP0ZES/b0xb5rsNjfpDFDaC
	0hyAghHPM65bxUUQdbTazalx6WdnaJLhsdXuqQVnBA==
X-Google-Smtp-Source: AGHT+IHmq/AzLvS5Arc8RHX9mM7ruDwKw/HHft/+nkm5HdBMm8LoRUCVPEqhe0FFpHi9mzq7nBTThxUfZG+GJnD+NpU=
X-Received: by 2002:a05:6122:3129:b0:4b2:c555:386 with SMTP id
 cg41-20020a056122312900b004b2c5550386mr12663985vkb.28.1702936488976; Mon, 18
 Dec 2023 13:54:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207192406.3809579-1-nphamcs@gmail.com> <CAJD7tkZXS-UJVAFfvxJ0nNgTzWBiqepPYA4hEozi01_qktkitg@mail.gmail.com>
 <20231218144431.GB19167@cmpxchg.org> <CAKEwX=OdeFCPNFzwQsGTsMV-+JB8dfTSbEff_ztENZ-8gwdnJQ@mail.gmail.com>
In-Reply-To: <CAKEwX=OdeFCPNFzwQsGTsMV-+JB8dfTSbEff_ztENZ-8gwdnJQ@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Mon, 18 Dec 2023 13:54:11 -0800
Message-ID: <CAJD7tkbiJ0bQZ3zr08JWfTyp43LqwgahgO-6hnbQbwbUtCdxKg@mail.gmail.com>
Subject: Re: [PATCH v6] zswap: memcontrol: implement zswap writeback disabling
To: Nhat Pham <nphamcs@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, akpm@linux-foundation.org, tj@kernel.org, 
	lizefan.x@bytedance.com, cerasuolodomenico@gmail.com, sjenning@redhat.com, 
	ddstreet@ieee.org, vitaly.wool@konsulko.com, mhocko@kernel.org, 
	roman.gushchin@linux.dev, shakeelb@google.com, muchun.song@linux.dev, 
	hughd@google.com, corbet@lwn.net, konrad.wilk@oracle.com, 
	senozhatsky@chromium.org, rppt@kernel.org, linux-mm@kvack.org, 
	kernel-team@meta.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	david@ixit.cz, chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 11:21=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> On Mon, Dec 18, 2023 at 6:44=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.o=
rg> wrote:
> >
> > On Fri, Dec 15, 2023 at 01:21:57PM -0800, Yosry Ahmed wrote:
> > > On Thu, Dec 7, 2023 at 11:24=E2=80=AFAM Nhat Pham <nphamcs@gmail.com>=
 wrote:
> > > >
> > > > During our experiment with zswap, we sometimes observe swap IOs due=
 to
> > > > occasional zswap store failures and writebacks-to-swap. These swapp=
ing
> > > > IOs prevent many users who cannot tolerate swapping from adopting z=
swap
> > > > to save memory and improve performance where possible.
> > > >
> > > > This patch adds the option to disable this behavior entirely: do no=
t
> > > > writeback to backing swapping device when a zswap store attempt fai=
l,
> > > > and do not write pages in the zswap pool back to the backing swap
> > > > device (both when the pool is full, and when the new zswap shrinker=
 is
> > > > called).
> > > >
> > > > This new behavior can be opted-in/out on a per-cgroup basis via a n=
ew
> > > > cgroup file. By default, writebacks to swap device is enabled, whic=
h is
> > > > the previous behavior. Initially, writeback is enabled for the root
> > > > cgroup, and a newly created cgroup will inherit the current setting=
 of
> > > > its parent.
> > > >
> > > > Note that this is subtly different from setting memory.swap.max to =
0, as
> > > > it still allows for pages to be stored in the zswap pool (which its=
elf
> > > > consumes swap space in its current form).
> > > >
> > > > This patch should be applied on top of the zswap shrinker series:
> > > >
> > > > https://lore.kernel.org/linux-mm/20231130194023.4102148-1-nphamcs@g=
mail.com/
> > > >
> > > > as it also disables the zswap shrinker, a major source of zswap
> > > > writebacks.
> > > >
> > > > Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
> > > > Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> > > > Reviewed-by: Yosry Ahmed <yosryahmed@google.com>
> > >
> > > Taking a step back from all the memory.swap.tiers vs.
> > > memory.zswap.writeback discussions, I think there may be a more
> > > fundamental problem here. If the zswap store failure is recurrent,
> > > pages can keep going back to the LRUs and then sent back to zswap
> > > eventually, only to be rejected again. For example, this can if zswap
> > > is above the acceptance threshold, but could be even worse if it's th=
e
> > > allocator rejecting the page due to not compressing well enough. In
> > > the latter case, the page can keep going back and forth between zswap
> > > and LRUs indefinitely.
> > >
> > > You probably did not run into this as you're using zsmalloc, but it
>
> Which is why I recommend everyone to use zsmalloc, and change the
> default allocator to it in Kconfig :)
>

Internally, we have a cap on the compression ratio, after which we
reject pages because it doesn't make sense to store them (e.g.
zsmalloc will store them in a full page anyway, or the compressed size
+ metadata isn't worth it). I think this is where we should head
upstream as well, you proposed something in the right direction with
storing uncompressed pages in zswap. IOW, I think such pages should be
taken out of the LRUs one way or another.
