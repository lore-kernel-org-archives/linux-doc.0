Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792795142;
	b=xmTzdlwhFuQTFasuNmbfquaW80/V1BEPLs4i7gSf6JoYgHvFXaorn9K9LSOpWwXogosh
	 CqSTfdqp2VLDMw88O2/Kyjm6C2VjOf8R4VuJRta88ET7ZBMjfjnJvKg3ziunwQWIHVorN
	 hxdb1eTXGvZOPtSt+qoI0Fe3s+18/2ieb7sak8naD5UE4cJv7tclB/eaMkaGVmH4LdOTY
	 LgSZPMOAXtE/QSQ968bm51K1xko1l+eL0HVbpdxb1iB4OQltGl1S3H9Ni/lLnOEoAC3Jy
	 O4IXUCg5A2h/SlpRRSUC+7hSQ0fDuxJKPoAN0XrjF1dFEx4qZE9ol0icPyw+U9/w/CQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792795142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DQb9soIuy2IWf1LrfZEp4aNcssN1ddSrfFmGCMehWsg=;
	b=bplj9anbAZE0KSPN19PTqtUZ2nMlbo08D/CbLXdhn6euM4WnBIswA8Ylgqmk7abJDbpm
	 uzfN90old8eW4EID9LTeelMWf77Y+Yg0VAoqNPBbm84wpWluf6nv74MFceBDjPPjL2Gui
	 LyY83EO4KJHcyzLuEMO/U1EzNXqivt0yUvzqKRPoRszvJNrfxQUCRjRiflW4vRj3Vw+G+
	 lTJ7YgHxM6H6cw5VgcZ+1/bm6Y5pLSPaBEK0rTehmg/Fa3wt/EMqkKYVpybbZFlPfX204
	 tqVxIzcZH+0i43bm7/66OQyECFyjdQs1ATrBR5t8dHphya4OeguBFD1lJU/wtNq5DAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h2JEsMGR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DDC606A31D
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 22:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33DDC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h2JEsMGR
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48df8fe8513so1191348f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 15:39:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792795140; cv=none;
        d=google.com; s=arc-20260327;
        b=e4uL+xivq92rFpXS3rlc5U5JBAmCAIlBqjNMDs+lzCB7dvvexEbuPbGyIUaC7j8C3X
         LOvT0yvQRtvz5voPLXnNi9tIVHTupomyaBkvN6H3K3RRX/TsI4gR9ske6FSRl655aNBz
         N5KFXf/J7MZhEJw01b2x3SKjTYan/GT+NU/DVpfhf9VIB9YkeGrBdWju6TJ+lTYDropD
         kFn8DGdh8ekyvSSLx3a7Gt4yUQX4ThOBlN6SsBEHcGe1E41ciBSNPUFxVkXjvGX3VAhI
         DSGzj88D6SiONRDk53M2SOw+Qdt3m+K3YPg6g6+0qZInSJhcytSsH1/g0du72FtyfDao
         VjeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DQb9soIuy2IWf1LrfZEp4aNcssN1ddSrfFmGCMehWsg=;
        fh=SkXLJYjHZCCqaY+F66MjK55wkvdHDbVe4Ttudst10os=;
        b=ZBtw+eWcq2g1+f+gDUue8kULzFLPXGLWXU7Ka0u4hpLYmQRR4M0aWGXs/jpd4K8tNO
         hlSqeo2qqhwKXKQjqY1aqbj2WB/tQTpMvRVmPzsNIAwEEtb4klqGQGocdB7tNllZpPRR
         i/Ja0IPv8ACuWcERmH2wEedzvi2luXx9sECsBSHDXg+NgjJfyjjEFRqbNId9ZLlygt2t
         OcfsXVpckkm1psC5ULR4uTvenBnj4rqJBfQuqIsy+RMU0NthoOX90zeGCFS9FtsC6I63
         FQwRs/wqqSQwct9Q2AvZFw1JT+pD07zxki65ncePzab7JvGSZfb/NwlhsQfkKxkdZgZI
         j0pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792795140; x=1793399940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DQb9soIuy2IWf1LrfZEp4aNcssN1ddSrfFmGCMehWsg=;
        b=h2JEsMGRrVURSB0j47TGc5GJasxIhVL/JHhnfpggkvfbknB7iXYx4eM3fv179YZizS
         UDP0PvSpu3n/sqjgLr1SrF3YXEfIYj+wNtrMzD4T2trvVG1avenYj5g3ZI+meZwGPRK9
         opn7VSPA5ZI7wDpF+91pO+99cubxigV7u0ifnJvgrwnqjxpMGyoOflnN2rJ4GbjRUn3+
         UaYcfeSvsBOUXLlS3Itld7VGw0rSpsygpl6Kkm8EnqjFSllNzdz/+Afc6yuZBmetCJHF
         b5ayg8KUcHpQIuOh3oxQ67ZOL86P+WJV6NHR/yZMHzjfHGdS/VoAQ/Ssp4lKbf3Qm6nI
         x5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792795140; x=1793399940;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQb9soIuy2IWf1LrfZEp4aNcssN1ddSrfFmGCMehWsg=;
        b=S5R+E9chm9RT8V7FrZkocS6EAaHY4rhNPbVajLwGpc7oQN2i7wD/Tb3HXprom/oZ2Q
         0hEtu/I2jQzx2lpiWRZ3EvSv/Qr1I9qY69SFBfdDJcDwIaw+nyV+hOh56jLVBHnlgP3L
         5m1JWgQ2R6+MLk7V38uXCyMUTB81sgJT6myTBFbz2TRRzVcD0i/Zof67kzT0SDJOkfi9
         1YdpqaBa+mImhTzp3wgCI5Th2fymGnZ3feLAJaNNedN93hd3UTERMX85zGan+34ZuDOk
         4NCr5Wv0+0Faqlv4gKXMJGge1a5MZkzwtLWW/SB/s6fi0OGYEigNUr9RnucZlC+jYkQM
         aj6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxW1VG+DZx4XbMuv/u+T6M3a++7pGtiAPFFtoxGfiu1qhdXFfCH9EPyhxAwSSfcfcG51rsruj82PiM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjhCSD7MxBoDqdYrymxnLRLzTtDghzD+hcT8Gv+yFYFdH8hreu
	hkFpaeYST7Hr5uB5t4NhJBE4EOwAweqtHkbFjtcdQo2DpN/D9Kr/UJHg9U8elNAb9J8isKt/ZBa
	/7g36vlg4rDG+wtCgzkuPhkU6T4DRcrs=
X-Gm-Gg: AYBFou3w40raTYKAFjYT0IYa6Kbr/RFJM3nuCSGch7nUoM1/aJdls0jSGtFCxxN5sBT
	0pgi2me4mWO4Sb2fzJBk0886w1i4GjcnQAuy87qX8ueevhcGO7qJsf5MoZfqy7GiB0IRP5nAxZ0
	nk0BmWpRQiy1c5DGfZHIcvr0N0Uv0m/Lrmm45lujMcm2m69K+2ff3PL+oyleaiwty33iFK8+Btl
	FmgdHiSSQm6ojvwLy/haV3xDg0L4K4TFTZFZz+psOVXHy975ReICH1fHZcYucXVWtWmoe3RRcim
	AFrNiCt2imN08rdDWM/VicSEMm/QE2qsc6yp7QaMvGgykw7NxIrRx2dtD6dqPj2GHBGS2tErnzZ
	WrUYDTXu01UL8932hqdgbZPBLosViageMFny1NdW/NU9iqM6EErWDOShIm+e7HsYsHjRZDWgiw7
	zAtR7WLlAIq1WZkuGS9RuexCZdB3J/evhQNhuhAv1yrl9fXh8dlZl7
X-Received: by 2002:a05:6000:40cc:b0:48d:f069:570c with SMTP id
 ffacd0b85a97d-48e3eb93429mr575083f8f.41.1792795140106; Fri, 23 Oct 2026
 15:39:00 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org>
 <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
 <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org> <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
 <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
 <aqgMCIOFi0dKx_6L@fedora> <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
 <CAKEwX=OMYhUs3tt7jUzEzxsOW3yA2JmzpwwxVBP2eZuHOFu=vw@mail.gmail.com>
 <CACePvbUMjRgK=dQzLjECgBXaUtQSPdAnBXL1Y4=Kh5d15swYvQ@mail.gmail.com>
 <5c8a2b7b-b76d-4bba-92e1-ec3d66794273@kernel.org> <20261014195354.GA371161@cmpxchg.org>
 <CAKEwX=Mwc+D+AN-B5T7p=80fqCDijdsiJjd6aN_3YMrEQjyvwQ@mail.gmail.com>
 <a24ca7b8-8b42-43f3-ad72-afe62f97f76c@kernel.org> <CAKEwX=OdbOrFbdihntP3rmcWJUyM1UpYa5n+pYjt_feMQwx8yA@mail.gmail.com>
 <CAKEwX=PCSyCEAqxeOH6CkCMu1eB3xUn3iz5XNuTbpDM3EmWYAg@mail.gmail.com>
 <c6e62e80befa886fccd36d34a39cf56ea5b9c9c2.camel@surriel.com>
 <CAO9r8zOtK7YYdBNS+h5bNW-miKED7p4G0igy=D-=HRnGqA-38A@mail.gmail.com> <179279233116.3784731.9576593182600250610.b4-reply@b4>
In-Reply-To: <179279233116.3784731.9576593182600250610.b4-reply@b4>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 23 Oct 2026 15:38:48 -0700
X-Gm-Features: AclHuK_IYUAj5HLbnP3AeCgr3emPoTaAjXpZJxAWWXcpmGT_QzEhtpufA_J3jmE
Message-ID: <CAKEwX=Nf57X+Bb7C+0L1L6bkVDw2rjTMSfn=xuMRsXY_qrB_ZA@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: Yosry Ahmed <yosry@kernel.org>, Rik van Riel <riel@surriel.com>, Wei Xu <weixugc@google.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Kairui Song <ryncsn@gmail.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 2:52=E2=80=AFPM Gregory Price (Meta) <gourry@gourry=
.net> wrote:
>
> On 2026-10-23 13:25 -0700, Yosry Ahmed wrote:
> > On Fri, Oct 23, 2026 at 1:03=E2=80=AFPM Rik van Riel <riel@surriel.com>=
 wrote:
> > >
> > > +-------+     +------------+
> > > | vswap |-----| swap cache |
> > > +---+---+     +------------+
> > >     |
> > >     +----------+-----------+
> > >     |          |           |
> > > +---+---+  +---+---+   +---+---+
> > > | swap  |  | zswap |   | zram  |
> > > | file  |  |       |   |       |
> > > +-------+  +-------+   +-------+
> > >
> > > What exactly do people want to accomplish here?
> >
> > Today if you swapoff a swapfile, every is swapped in into the
> > swapcache, whether it's in zswap or on disk. With vswap, you have no
> > way to trigger swapin of compressed memory in zswap.
> >
>
> This seems like a missing interface in zswap, rather than something

Yeah, and I don't think implementing "draining" for zswap is terribly hard.

Zswap already has the reverse mapping (from zswap entry ->
virtual/physical swap slot). You can loop through zswap lrus, then for
each zswap entry, basically invoke the first half of
zswap_writeback_entry(), which loads the content into memory (i.e swap
cache).

But you're right - this is something that belongs to the backend
layer, not the virtual layer!

> vswap needs.  But you could just write this as
>
> vswap swapoff {
>   disable new backend writeback (swapcache fault-in only)
>
>   for each backend {
>     backend swapoff
>   }
> }
>
> so rather than vswap.swapoff() you'd actually just want a stop-bit that
> says to disable the swap subsystem writeback behavior to all backends.

Yeah if we can "swapoff"/"drain" each backend then that brings all the
content into memory!

>
> Otherwise the user can just disable each backend individually.
>
> --
> ~Gregory
>
