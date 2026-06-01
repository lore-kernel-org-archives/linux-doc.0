Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF652D12F3
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 17:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780336197; cv=pass; b=mi/yMXeOFlAV19a83ZVkm5DcQ62fj3z/5yYCJC1MD+NW8O/2aghkd1CXSMjes2C0EQp9+lRITzmOFSlqlKBGlLsP9QN2GXX+Dek9eIqTSjXqdCP6YA1GJC2Xo4kyZYQb5Tm9PaP7yL3nUrid2OpFt6JvWD8by+qZFP8e3a0sUgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780336197; c=relaxed/simple;
	bh=MHMfGyIQO/wWrdZz2ftsSzh09DwykVOPctTnncxFW2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ve+Eg+FzSrSq9k3tOjJgCa4YojU0DftRl/1PFEyE9DA6whiJ+WWFbs2kM6hnqQwmjkpn4PUpPzB2SPyYjKXcFt+JS3ZUAb/GvxVnrsZVa1t5axjg+kxDa+Z2h792xV9xbDCSHKx4wEs/+Pc1B4i+bl77kOP1yBxAo+wWR3Q0QOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rryOr97S; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rryOr97S"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-68bac6e24fdso5702824a12.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 10:49:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780336194; cv=none;
        d=google.com; s=arc-20240605;
        b=LNpzCz7//AfDEoKPVV4Je2ELP9H+KD97xE6cUrALK2XTKU8FNF1UbMLLgeKtUZpU/J
         YdvTSwl6y060zn7MRkTl3xdkqCG0WNqUbcvczd4o1acLK/CUI7u4JKA9bNcVxnaftOg1
         rmcdysvtWJ7zA0Dam+4u8ml7/Y8lGi2P0VEN7Z4RpcXJytf90RdRo8wyZaMnx6ynwHde
         lAOoY29uU6ThPA34zEtzRWa0nKlaSQ2g39MsaN3bnBy2g34e7Gkz/fHrvy4qUU5xQ0zH
         EoHW5z8/HXRcK2SiRPvmGJrPCAEN0SdGlxweH9taLK5DS5D40VFzPDTRClwoAJI46X5t
         FaWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pMR+vMx9phwXvzk3LCs0RnCPA1OW1RBGgb6+eYeQRiE=;
        fh=OcakI1BnH7gi8yZrsnMFoiMHGmBGhjMNHu6zVRWS8/U=;
        b=XDw/zJit8Tl7Gr7S5Wi7cNwRYux0YTW+cKnA5s1aVBp1I723VHxVBQepDJ7Lblh4qb
         kFFW110DQ5F+ll4a/1XvZMPtyeeg7oTjVc5CRW2N6XS1WV2nXwxXQP9VPa19Ht159moA
         KDCxypvo8aiy8wBuAiym5uRaAEzNwDcXvapxxr7X8ADTbJCrBME4AGkgWT6fudPgwoVu
         XQYoDcj2Ic+nkgaeKfoshy7jb0HiiDYQm3552WwJWe3be5c0zwMBkr1p2h9qjbZ0p+Kf
         wesAhE5pECHk4sjoH8JvUQjIOaf8f0UgigKZRGCsgF3OT1X8c6mAFyVk82UDGxG7WGp+
         UOuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780336194; x=1780940994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMR+vMx9phwXvzk3LCs0RnCPA1OW1RBGgb6+eYeQRiE=;
        b=rryOr97SQy0Yvp2+DlBXsOoeF8EjhQ/KHkErallpDjCJTM8vVvnrxje8waUS3RSM6W
         K44IiWvhr+V7Mr1GrVuyd0oPesAgAbYIEwnpHi4ZUzoD45LioXHsBw9NsL+heiwigq4Q
         jDS7J1LfYzKtBTbBUkElNuXKSFoYll0jTvdQ+h1Y1QVtLGUek+o1BsBc8nxV0CMb9q+f
         uSQgTgxyE327kQkFtC4U9+JNVT0j7XQQ+aEzSl5wP/FhIwJxmfqHxax4oX+3vUO4HcQ9
         gcfswYK4PLHucfo6VsL0zt1lYOWydWR49L5Ioiu/uehdq9XGLtyM+xwnzUkRN20QnWVe
         CKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780336194; x=1780940994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pMR+vMx9phwXvzk3LCs0RnCPA1OW1RBGgb6+eYeQRiE=;
        b=J57uQnbXFs8z0MEecLz6RuazIrci8LsmOAgC2TRrzWnSxslK13JschX4Wjl075exCm
         OVU4VUKAYvYfykVeyErIKiTsAISwpWFVP8NdhrM/Rb2nzVd3BkQVZkZ/CajwD/gS+Tfh
         c9y1w1ev3wBK4qXn5octvY+3ZU3AKTQc6Eb4aDsvZXMYbthmEZUcETuKRTIBT5kboXe+
         n0BXUhnr6hQ7I+3KhMnxbW8sm6vfsrvIsAoGVNXS20jWpO0UeoQJR3a2j01g2G/s1CwA
         7EQfKHWXU9NkTv4An8LTmQPuEY3KNki6o4zM9kqK9aeSkSnabx+TYuDYA3nkYFb9bDxg
         rqMw==
X-Forwarded-Encrypted: i=1; AFNElJ9WWDaPusLKMhEogtXsDNZADym2JHJrGU6E3+uUqMhWOsyR/xoY+ImWOVTlOyfvRODhca+7Z5NIOAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoS30zD94UOVi9FKztVcOzb0VdtM12kRmxXJFX3cJODNfcy9xG
	UZ5UpFxqjyDGtVUdbDDNNCFp/S+V7Y91A3tItAjw8Jobh370LK7mi7SjGjDHLd9rM1pb4QpawP9
	PB5zed6upacPIe2boHUmXX0dB3ywahX4=
X-Gm-Gg: Acq92OHnfuY/3rY58eGx7eLhUWFKRpgqo4tW++ouWyVYSb90WVtdJi/MW0vJs+dkdgr
	E1h6CWALKOgB380b1sZ68CkZi3W+4QMj2ANuQLTwoJo8DqaCAlXfLTl4gpP1Ct/t8UpX92T24fC
	r+xuI/Qb//VPNOuPj9inaxqjRKUj8aTW/jEwsETXEcMFyZyg7j4EvOP3ZDVuPlOWcYYZ4qRbTYS
	GlWfT0/iKgC1zyqNpWZvu2rhCXkXqRI7I20oIj7yYJkiGXIm3swDGIRKhDhOkrNUzVGsMF4aFV4
	LjkDizp6CSbB1TPZCyRcnXBPA4bX8r3ZMcNtd911qF2Bn24syt8=
X-Received: by 2002:a17:906:1ba9:b0:beb:e13b:b3eb with SMTP id
 a640c23a62f3a-bebe13c09c8mr420086866b.9.1780336193926; Mon, 01 Jun 2026
 10:49:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528212955.1912856-1-nphamcs@gmail.com> <ahz_iYG4lqWL4g-J@KASONG-MC4>
 <CAKEwX=PzMwXXgq=ULAkFD9UqMz+ewLqhKt+xdGxkV7OmA2QG6w@mail.gmail.com> <CAKEwX=NNNf0KCZC0ph7VRW0gjnbXd4W5NKEaHM4XzPdN03Ek3A@mail.gmail.com>
In-Reply-To: <CAKEwX=NNNf0KCZC0ph7VRW0gjnbXd4W5NKEaHM4XzPdN03Ek3A@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 2 Jun 2026 01:49:16 +0800
X-Gm-Features: AVHnY4KkMWDCgqvQ0VtgzLPCLTVcd18CUg6LbNn4WT1rDML5IaDfG1WZK2GBXNs
Message-ID: <CAMgjq7CT0ccCnzmpRGjTGPnNEn4eK==5A-OFbr3+p465dQMH4A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] mm, swap: Virtual Swap Space (Swap Table Edition)
To: Nhat Pham <nphamcs@gmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, apopple@nvidia.com, 
	axelrasmussen@google.com, baohua@kernel.org, baolin.wang@linux.alibaba.com, 
	bhe@redhat.com, byungchul@sk.com, cgroups@vger.kernel.org, 
	chengming.zhou@linux.dev, chrisl@kernel.org, corbet@lwn.net, david@kernel.org, 
	dev.jain@arm.com, gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, 
	jannh@google.com, joshua.hahnjy@gmail.com, lance.yang@linux.dev, 
	lenb@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-pm@vger.kernel.org, lorenzo.stoakes@oracle.com, 
	matthew.brost@intel.com, mhocko@suse.com, muchun.song@linux.dev, 
	npache@redhat.com, pavel@kernel.org, peterx@redhat.com, peterz@infradead.org, 
	pfalcato@suse.de, rafael@kernel.org, rakie.kim@sk.com, 
	roman.gushchin@linux.dev, rppt@kernel.org, ryan.roberts@arm.com, 
	shakeel.butt@linux.dev, shikemeng@huaweicloud.com, surenb@google.com, 
	tglx@kernel.org, vbabka@suse.cz, weixugc@google.com, 
	ying.huang@linux.alibaba.com, yosry.ahmed@linux.dev, yuanchu@google.com, 
	zhengqi.arch@bytedance.com, ziy@nvidia.com, kernel-team@meta.com, 
	riel@surriel.com, haowenchao22@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 12:22=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Mon, Jun 1, 2026 at 8:56=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
> >
> > On Mon, Jun 1, 2026 at 12:34=E2=80=AFAM Kairui Song <ryncsn@gmail.com> =
wrote:
> > >
> > > On Thu, May 28, 2026 at 02:29:24PM +0800, Nhat Pham wrote:
> > > > III. Follow-ups:
> > > >
> > > > In no particular order (and most of which can be done as follow-up
> > > > patch series rather than shoving everything in the initial landing)=
:
> > > >
> > > > - More thorough stress testing is very much needed.
> > > >
> > > > - Performance benchmarks to make sure I don't accidentally regress
> > > >   the vswap-less case, and that the vswap's case performance is
> > > >   good. I suspect I will have to port a lot of the
> > > >   optimizations I implemented in v6 over here - some of the
> > > >   inefficiencies are inherent in any swap virtualization, and
> > > >   would require the same fix (for e.g the MRU cluster caching
> > > >   for faster cluster lookup - see [8] and [9]).
> > >
> > > This could be imporved by per-si percpu cluster. Both YoungJun's
> > > tiering and Baoquan's previous swap ops mentioned this is needed,
> > > and now vswap also need that. If the vswap is also a si, then it will
> > > make use of this too.
>
> Oh and the MRU cluster caching I mentioned here is not the allocation
> caching. It's the lookup caching, basically to avoid doing the
> xa_load() to look up clusters for consecutive swap operations on the
> same vswap cluster (which is the common case with vswap). For v6, it
> massively reduces this indirection lookup overhead. Performance-wise
> it's an absolute winner, just more complexity (because I need to
> handle reference counting carefully).

Ah alright, that's interesting. And I think we can keep things simple
to start, since sensitive users is stil able tol use plain device this
way.

BTW maintaining MRU is also an overhead, I'm not sure if the lookup
pattern always follows that?

> I also just realized we'll induce the indirection overhead on
> allocation here too, even if the cached cluster still have slots for
> allocation, because we look up the cluster (which is basically free
> for static swap device, but not free for vswap devices). Might need to
> take care of that to maintain vswap performance (but it will then
> diverge from your existing code...).

That part should be indeed coverable by the si->percpu cluster though, I th=
ink.
