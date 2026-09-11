Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9933769FF
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 15:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139173; cv=pass; b=lgjWj5BIHXJozJ/G3uhbYx3NAd+Ir6Rji6tyAUJVqkrAsra+I179nqVAf78ifVLFYXj+J8hMBWTMbkSBLaw/ikExQLmQdXU97ws587FKCpk0TFkXXGXgBWaoeS1nqDA+I+E/t5RmCF6zEJdGJ09ms5cuOQ3txUY6MWt7dEP//Kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139173; c=relaxed/simple;
	bh=31WGPI9CsS8AEb1QmZigfY8oBbhGb6+EPuGPGJKusUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HCA2fGO8sod4Fy21P2qMmrbxvnpK04Gi2qS74OS0kukjcCYTaFxwB6TW8WGuM1a4j6Vfz8wn67SFXbxZ9tSzpLyic+vHcDupxVcXs6u9/0VXIIegOt0Crd6qcaauDVxM/gxXyqOHdqDKXH8KrooO8wpCt9v55MVhhO1cCtyUHaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qUJmVijz; arc=pass smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qUJmVijz"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6bc475ffcf6so544177eaf.1
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 08:06:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789139169; cv=none;
        d=google.com; s=arc-20260327;
        b=GYORBGlRgMVeC3axlxx2q2XxFHhTR/ZfXGsBrcWr5YDUCkco/uwmuB4+lVsRaW3z5/
         glnmjI4Kb+cXLEUCaPT1h2R1vkeSXEq8CWsKsJOodO9jJaO9tqVhVL+NOetNwMfC0uRp
         OeuBgmKgbEP7zLjXsQVTVjiLi/dQnOJUFrnug/7IwCSPsY+tcokDc+5v1oyofv/xoLnd
         LQETi6HqTmt7ppJFID6Wa5yqYUCLpEFXRDiPOZ3xCM57HT7DlolC0LUYlSTd+ra+W2rU
         wbz8m+BgQbLMmbi9cmvSy+FGCoW9My6LV/dA8tHsXF5i2jonJvHDpeOEQpWZSRJ3aSlp
         mGtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=31WGPI9CsS8AEb1QmZigfY8oBbhGb6+EPuGPGJKusUg=;
        fh=GvDtJZcTt2EdMiCnZillaQWr98295HAJHxRzX7cMa0w=;
        b=seFkNsI+zePUJHkCMrUuydIT8aiAcEGc+EiTuRhmbG0eE0qHBH4wPQxnncdpqGObTB
         XZt4ZbLtEY47BZtwm6Fz0Rw7wg6qD9vS4z6wlHzJ+ShKYiho9Yu2mg5jLo+IdiBvzpc3
         6nMw27A585hyyM+r5HIgWXo+uWs02ItLw2f1LTLPhsU7QjzbAEk38M+Gwi1lGS3kpVO0
         LrJKtu8je+z/qfjoS9ZLdkESIhG5Nd16ZUXZOaH2B4f80WOzlreRX29Ah1N1gG0EKZTI
         byru8tkvds8SeHArhHVvVIaG/BvqQ1j7hP9n138gt1e0DQpYaRD0W8gt33DK0Sp88NAH
         kKfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789139169; x=1789743969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=31WGPI9CsS8AEb1QmZigfY8oBbhGb6+EPuGPGJKusUg=;
        b=qUJmVijzNEk2CFd/2JKrWKzj5OmgEMFOKvrh0RGm0n62p5d07lbv7bYFKZ4eoKjugP
         QYSUcrsAA+c0AC27+gjFGpBkZ1a1c9ABcQ1Fl8BDYr6h86r5AUW0twP+0XWZRX7zfazr
         WEe6kAFGuCoQJNfIOrlZ1Y4cXE0+DuMMuYG5O6jqgitmJVAWNdT6ULGieq+wSEvSt+GR
         VLr9QgoNO08ZRPxx3H1SiOPsijt847d48Y5SbIVoEaG8wcJJK23s+hXBs0U+z63F9Nr0
         c/S7CJ9EFmUrGuwhSykK1cuReZLfisdthyJt0xRBaUYoDFWgwq9cl6gQg/hPBAD3m+j/
         rUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789139169; x=1789743969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31WGPI9CsS8AEb1QmZigfY8oBbhGb6+EPuGPGJKusUg=;
        b=bKKRtw6eio+KbOxZZE7BQGydBhcikObP3Qrtqu63fwEfPi1Gsv9a5+b0LN7j3Dh9zQ
         /X3LjGTMs3xXX46YGI6PUH/d780PpK0TTF8zEJkxkCq1VnawOL5U2eO4MvnGknDYBRg4
         pTg+MAQKuaaMqxL+xjMWJuRxzoq4NUZCPb980Q+GJniBOBsQo3EdPnbUqX6vXLHKAUnE
         hPzFbF8wHETrdz1gMcE5i2tSrUIs0zM6ooU7hjag/qTTA4Nf5D8B3y6LAse55bJ3HJW3
         Kt34WTGbF9DyQfkTfJTYcML+NgQhDeEyO3MZriiiAakIwfbHJvJzN7YkShoZh5IwqEA2
         UJHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGSVvNkxbWDw0qS2P32N5v2o73J+V9GiteRUIJD1Ky+Whji01hFBfjuNq4Ma1nO6F4oU7zg+evTho=@vger.kernel.org
X-Gm-Message-State: AFuF++kX30BBiyE6MxC88iglHjTUjqcPndAr3RBr/m/+9qS0yqeJy4z6
	VgTOinEpDGHxUwopX52RjJVN4LJpVXyDFuPSIJSoCpeIDnPwnKt/rTgZvGIYkta8EyN5LRJpplD
	pjTbImrLYsWPCVEEZDuIzgF8+XN+GA/w=
X-Gm-Gg: AYBFou0JV3eCp9lKlZHkt+48TIdKkuuDN55IvftkyOHJ7+51oTcs4rFG/8qioBfcl7B
	0gz3vKu+trsN7CalDm1R98jEzgXebnd/MIqvTt1jRnkJHElKFeBmTuLVn1VxIpZQNmlRoagTti5
	FARpC41ebjUSW/WmT9slUg0Ac015b0PuRy3Sf47N5FxHESTtvcMpb7Fgc8Ux4/ErH6XSQMwDyMU
	jEBiUq2sUqY9TmuLsjBBGkUCkybc2CAnLoBaKZIgR+ncr/e+w6l+BWbRagiQT9EQ1S6VmWIH7J6
	ZDrKJEVNzEcxLMbDtpu1Vekn2v+lNK5q3ZsECySJOAoDWk93FGuk7nE=
X-Received: by 2002:a05:6820:8585:20b0:6b1:be9f:ce6c with SMTP id
 006d021491bc7-6c0b9d4e35dmr4967721eaf.4.1789139168581; Fri, 11 Sep 2026
 08:06:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-b4-mmap-prepare-vma-flag-sanify-v1-0-dacf19cce22b@kernel.org>
 <20260908-b4-mmap-prepare-vma-flag-sanify-v1-11-dacf19cce22b@kernel.org>
 <CAEjxPJ7hXSi=oLtQPV+7GEvN+txfYwZ-u-v_EysNHM0gSGNrCw@mail.gmail.com> <aqPUqU3eZeFrykj3@gremlin>
In-Reply-To: <aqPUqU3eZeFrykj3@gremlin>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Fri, 11 Sep 2026 11:05:57 -0400
X-Gm-Features: AcwNN1UL9TCHStClpz4OqpdpVCOHFGRlTtL1ELl-GfcxGBMtPjfBSuHNlaSY27Y
Message-ID: <CAEjxPJ6P19eKF-c+mm2BSr5_WpmhMTZjjUfSamv3SfOPO4SGVw@mail.gmail.com>
Subject: Re: [PATCH 11/39] selinux: reject writable opens of policy file, drop
 mmap shared/write check
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, 
	Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
	Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Xu Xin <xu.xin16@zte.com.cn>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Miklos Szeredi <miklos@szeredi.hu>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-rdma@vger.kernel.org, selinux@vger.kernel.org, 
	linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 6:16=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> On Thu, Sep 10, 2026 at 02:11:18PM -0400, Stephen Smalley wrote:
> > On Tue, Sep 8, 2026 at 4:07=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kerne=
l.org> wrote:
> > >
> > > The policy file has no write method and is exposed read-only (S_IRUGO=
 in
> > > selinux_files[]), yet sel_open_policy() performs no open mode check, =
so a
> > > CAP_DAC_OVERRIDE caller can open it O_RDWR. Reject FMODE_WRITE at ope=
n, as
> > > kernfs does.
> > >
> > > The file can then never be mapped with FMODE_WRITE, so do_mmap() alwa=
ys
> > > clears VM_MAYWRITE and VM_SHARED for MAP_SHARED mappings and the VM_S=
HARED
> > > check in sel_mmap_policy() cannot be reached. Remove it.
> > >
> > > This also stops sel_mmap_policy() clearing VM_MAYWRITE on a mapping t=
hat is
> > > neither a PFN map nor a mixed map, ahead of the core enforcing that o=
nly
> > > such mappings may do so.
> > >
> > > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> >
> > We should likely do something similar for the other sel_open_*() and
> > sel_mmap_*() functions too.
> > In particular, truncation of the status file can bring down systemd
> > since it is mapped by libselinux.
>
> Yeah I think there's definitely more that can be done there.
>
> Though I think obviously that kind of stuff is better as a follow up as t=
his
> patch is focused on eliminating a case where VMA_MAYWRITE_BIT is cleared
> incorrectly.

Agreed, posted one for the status handlers at:
https://lore.kernel.org/selinux/20260911145840.19039-2-stephen.smalley.work=
@gmail.com/
