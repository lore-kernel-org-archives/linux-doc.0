Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792792334;
	b=OLLHKcVeZn3Y32idYVXUA1W0y/wd2jC6VWI4wn6RvF+/hxiCpBedTFjbOms5z9f51QqH
	 mbf9iCx0QpPpU7xTIEbT6JetTumcn846/IZ1b9HkJq7NPkD3blP0zvk2rsmGNaB+87i9p
	 Uz/IbNa3sQBS//94BrZpOhd7u3W8x4BRMmD5QwHWUktUg15Sty3GO28IkpgLSoSiL1Bpq
	 zKfA68qfWpM5eCzvdMFiOZ0kFvKHZFfJXNu+ECEjAC8CTmdZ6pgiB/IQ8FoJPrO0dnQdg
	 aq7jnCtgT/NcURWqETK+B6s9cCGHK4CTIY6ThTWDxs6Su68sk20KhS6ywIlHq3kzqfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792792334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=jU1IZAOHq9r8Ir5hIP1rjGnLwS+weWaNtdurABD6X5g=;
	b=TWyZs7q6nUKCwhqNCf7RKgYT3fibblMQGIluzXWDDwQCUQ+l79AGs25jJMlF4lKcaKcb
	 zSS8SBvClaYzafRaQ8kb1ea/9SjwcDhUMxZ0E4A0ZEPFQx/b4gw2Ydqn7KJM+hnl9DN6+
	 BiHZFW7GA0djIhQ5xwnnp93C7TxbOVvUGBUcG94mBQcZzzbu5xwrx55hrSRV2NkFSJ7TM
	 I8q1Lt+tiMAe+nwMBoDIPfeYgenuwQwBhLilCXjTypljAaw/agmGUVlOw7/zEMTdSZ0iE
	 6lZfXrz0EVHFyjjEK7GWcAtvZTVpyStQDpzjdCJd9umqbRaUNqGSRTMx7qYjGJw9gqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=HGqGxOqE;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CEA606A31E
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 21:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29CEA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=HGqGxOqE
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-917997ab0d9so15468746d6.3
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 14:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792792333; x=1793397133; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jU1IZAOHq9r8Ir5hIP1rjGnLwS+weWaNtdurABD6X5g=;
        b=HGqGxOqExzIyB7hPavSyBDvkHprEJhOVaBIV5g5URIZNOHs9N4YRyG5vMPVAgS/q/e
         I+cQ4l3HPXviBlFxpvlTlRpxuOp49ndv7fAU21ovgA65rnX2guDwXIma4qyoNi5MLYEW
         XdDuwvuS3z1gB5IYmho6szpf4Tiu4hoTuEnvYWQ0aVg16z3kioAJj7b6bMtlkyHxzpaf
         x7JCS2bPNpM2zG0eH4t9jDuct8F8iPqapD4rp8QHG+PT867T5gcDXwMdI93RmUcWGrEb
         R5C73gEQs8Vwj6CV7Ik+oQgE3G211F4vOsU82Rad62zdb4R3D4yQIrQarhQRnytIwAHO
         BB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792792333; x=1793397133;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jU1IZAOHq9r8Ir5hIP1rjGnLwS+weWaNtdurABD6X5g=;
        b=u61LT4L+j3FJgDHP8a7PDrKu7aCqnZiHbnpPUW8bJwegGP0izQb6ldAi7lKBfT+K9h
         b4ZiQN1iTJQ+uBhzYvghsnNOl+sGMZJveRmTkMMB1kYW0K84cNui3QNc6y6EIb7nkw4R
         FWPqV2qWHcpB2VvSObdWv5GxCOfPvGTFkjk6V8dfq7EW7cEioCWIj6ZnxPPQEXHCiyGM
         HASjRj8bp7Kdv+ubmtYCqz8VKpzu6Dy3SuRtFMK0s7Q+7bf1AheVnkweSw+cfCOrg4cD
         WC14TMSwgCjeytSgDRcwvi/y8LREjMevBz7XwM663HBds9GXloWW/yYt5UdeRHp+8oTI
         +V0A==
X-Forwarded-Encrypted: i=1; AKwUvBz86EeprqUH0jFAeQ/h/Nl8yTLKTlvehp6XzX9he8lRXVyrozhmAxkwcAtPWUYuhf8MNpGcIQZ4D5I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIarrBQR096KQekmbb6MXnqsyKQk8RK9wsmDukvzNwJguR/I3P
	NFSRcnejKGdPXJznlP0E17H5yCB7WWgXgH//vocJ0nuSVFoFfoSroi1SEL1/Z15Gwgw=
X-Gm-Gg: AYBFou3V9CvSo+RJOJ/YgX0XkCQq7IkjaF5IdGdBVGKiCtmL5Tb/bzmP/g5sgjq+5ae
	tk1zll/K8kWz6kVH7kcWdZ7FeeMLNqKZfnzc4yQYTfot2Zy6HZg/fZciP68jR7CfOCLXcEuIkQ5
	PM9hX1p5myOPJ3BuyZag4JoyQOD6dzK8UFBDqqmgMM8RfJ4NOytTKnvGyCtMpQAIPEdf4YXEDKJ
	fPxeKZ2/cJ+o804ErZa5gMvfE+f43mJ568F+wZEqkjn3UWMGyoFaSfWwVFSJe8e8sgoLX1lOkIB
	cdG5W2eYZIkEpA63kpZCvK2KWAShjBHxmiYPHj8OlQ/8ZInW9nglf5791dPQdnoscnEYMhr4vZ7
	ECUktSptFZtcw9HgrNjESL46ioDerbstoepj0/mOHcornZofQmZLluVtXNKV5KsdcghUKznjvWn
	Fv4B3orrj1BL01cWhx0ZlPG38EtAL7FJ2BLuJ+9KevXlYm7nV7dnBtma6IE3ou99ZkYKXKiLW7r
	P9ib8Q+Np11bGt1ViggskvW9scfgxc9pU4WKQK711JXYQLRz9vnhkhBPZcfbCPp62WDJtBQX/m2
	q4n9nSnqG7Ng8uOppYC6oPJi38A=
X-Received: by 2002:a05:6214:5c45:b0:91b:8870:3930 with SMTP id 6a1803df08f44-91c48e76cf4mr5685596d6.45.1792792333037;
        Fri, 23 Oct 2026 14:52:13 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c6f3bcsm5375386d6.29.2026.10.23.14.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 14:52:12 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: Path forward for Virtualized Swap?
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Rik van Riel <riel@surriel.com>, Wei Xu <weixugc@google.com>, 
 Nhat Pham <nphamcs@gmail.com>, "David Hildenbrand (Arm)" <david@kernel.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, Chris Li <chrisl@kernel.org>, 
 Baoquan He <baoquan.he@linux.dev>, Kairui Song <ryncsn@gmail.com>, 
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
 Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
 YoungJun Park <youngjun.park@lge.com>, 
 Chengming Zhou <chengming.zhou@linux.dev>, 
 "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, 
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, 
 =?utf-8?q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
 Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
 Yuanchu Xie <yuanchu@google.com>, Gregory Price <gourry@gourry.net>, 
 Wenchao Hao <haowenchao22@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
 Meta kernel team <kernel-team@meta.com>, 
 Linux Memory Management List <linux-mm@kvack.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-doc@vger.kernel.org, 
 "open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>
In-Reply-To: <CAO9r8zOtK7YYdBNS+h5bNW-miKED7p4G0igy=D-=HRnGqA-38A@mail.gmail.com>
References: <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org>
 <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
 <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org>
 <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
 <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
 <aqgMCIOFi0dKx_6L@fedora>
 <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
 <CAKEwX=OMYhUs3tt7jUzEzxsOW3yA2JmzpwwxVBP2eZuHOFu=vw@mail.gmail.com>
 <CACePvbUMjRgK=dQzLjECgBXaUtQSPdAnBXL1Y4=Kh5d15swYvQ@mail.gmail.com>
 <5c8a2b7b-b76d-4bba-92e1-ec3d66794273@kernel.org>
 <20261014195354.GA371161@cmpxchg.org>
 <CAKEwX=Mwc+D+AN-B5T7p=80fqCDijdsiJjd6aN_3YMrEQjyvwQ@mail.gmail.com>
 <a24ca7b8-8b42-43f3-ad72-afe62f97f76c@kernel.org>
 <CAKEwX=OdbOrFbdihntP3rmcWJUyM1UpYa5n+pYjt_feMQwx8yA@mail.gmail.com>
 <CAKEwX=PCSyCEAqxeOH6CkCMu1eB3xUn3iz5XNuTbpDM3EmWYAg@mail.gmail.com>
 <c6e62e80befa886fccd36d34a39cf56ea5b9c9c2.camel@surriel.com>
 <CAO9r8zOtK7YYdBNS+h5bNW-miKED7p4G0igy=D-=HRnGqA-38A@mail.gmail.com>
Date: Fri, 23 Oct 2026 17:52:11 -0400
Message-Id: <179279233116.3784731.9576593182600250610.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-23 13:25 -0700, Yosry Ahmed wrote:
> On Fri, Oct 23, 2026 at 1:03 PM Rik van Riel <riel@surriel.com> wrote:
> >
> > +-------+     +------------+
> > | vswap |-----| swap cache |
> > +---+---+     +------------+
> >     |
> >     +----------+-----------+
> >     |          |           |
> > +---+---+  +---+---+   +---+---+
> > | swap  |  | zswap |   | zram  |
> > | file  |  |       |   |       |
> > +-------+  +-------+   +-------+
> >
> > What exactly do people want to accomplish here?
> 
> Today if you swapoff a swapfile, every is swapped in into the
> swapcache, whether it's in zswap or on disk. With vswap, you have no
> way to trigger swapin of compressed memory in zswap.
> 

This seems like a missing interface in zswap, rather than something
vswap needs.  But you could just write this as

vswap swapoff {
  disable new backend writeback (swapcache fault-in only)

  for each backend {
    backend swapoff
  }
}

so rather than vswap.swapoff() you'd actually just want a stop-bit that
says to disable the swap subsystem writeback behavior to all backends.

Otherwise the user can just disable each backend individually.

-- 
~Gregory

