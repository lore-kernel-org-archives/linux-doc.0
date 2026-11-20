Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795167073;
	b=qTc6DG4fV9IwdiV7dJ+MevS54nwI4XQTozMjYH+lG+q4t2qED23Nbz6DrFB2IZo9tN0h
	 1/bmZm8qAvYg4UNDMVcffZPemI12Wxehw1vZKqEurTe3elcki2wv90zjbMUOw3A42zP/P
	 0pM3b099p9VSQlDLxrx3UHOT6bHZ9b1Ys1KJEjpQTTJoNLSsPPxI0ZFBM8ipMfR46n9h1
	 RnDhNtJhiCivz0VUvUl3+szE+/teqRL4NEswUMcyiZWD+GKDFx60lIZgKzFd4b4Hf+loZ
	 +fSm0KRBgCgTpmeykFadi6nv0ai4ZksPKKOMofg59aFPCkwyofjxeBZcfXilHuIiesg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4i941FDPhpmYcUdo3BnCKwVlDsg7lnYxXVRnzu5LkiA=;
	b=4d8R9s/ReH15slmHccig/7hzGCxrN0TJkAouq5LAOZpN80YayhG3OkhY+GVU48mmT4wz
	 n+f+0WYTGJRx9jUEkq3GdxxdmmL0OMKZ2ge0zpeyZFn6y/9rM+5/Tlh8YJLb5NjaZhfSV
	 qZDGk68yRG+3WRMY5pFrYoh6Si6UBDsFFDT1Zj1MXFNkDy+ntGazjELrE4mPhSqTvE6n5
	 hmA40VXgH+h8L0v8Ibh7zXDI6coX1+3g1Ite70T0rjb4cR+7FVfUhpmQsB8IwBCrB47Tm
	 sd69qekwveO3azoGr8MkKri7PnnVXVaFkR4C2Q+VUp8fllVnkkg11Zz0pF0GZ9t67sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=HecZDQb7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5CA606A326
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 09:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC5CA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=HecZDQb7
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-84a248254f4so459494a34.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 01:31:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795167072; cv=none;
        d=google.com; s=arc-20260327;
        b=jeGdfX3OTM1VdlLhwbYWp3mcgJdgVpk6LClh3tghGaf0GiipNIwWpdZ++dpFrrvg6T
         6Ie+pK/kZnrzsIhtnyJLqZiKiOqObc6iJG35hGNsvDlkHCSnj7k9lqMyTpbYprVUyfOk
         mPhdxufoZujad0HPLU7cFAB3t8TEA9eWYUP7eknLPO9s8OqJypDc8fvJ43ONfRqe6Muf
         NghUOcnnCQ21CKlSnjJGbQV0Ntb3I9WNbhkH374JZwPM4U6ajMfhsl8e18MVXz0ELCUG
         RNMWnTAXekkwP8M6CrI2hXH40d1O+jLVHEzjAE1iC6+IASVYp554RB/RKI/9vxEIld+7
         Lovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4i941FDPhpmYcUdo3BnCKwVlDsg7lnYxXVRnzu5LkiA=;
        fh=ujQp5lo6a/51oJc0wDgBb81PYTwdmlzyzZkP7inp4f8=;
        b=V037qX3T2v0oiWAUC69TiO7P3I86LBXoT2nSjWUNgfn2Ez5k99DaEb725YCBXaIarH
         zePRAxfkeZhDGr6DEfOWmkAQJIG+1TNIohqsUiXbSJDs2OmhfxouOiHPu7c0yjnigxF8
         uIdbWLNtAxtR7NYEIgUoqW408XQvzgwNvzb2kcejbQCzORZflZ41wl3+cgUQ9d2YgVdG
         SvYWWXGkzJmbq2sm+bhCeqPmH8T+e+lp+Sg1qX0VN0mOFcIEF7AvvFfgshn+OVfd7n11
         6I5YExmEV2S3ir3EzBDLUPMvgWmgrqrJpbNn16RQ6bvi+tpzk+iyWyT0BFtr281FpN3Q
         GIJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795167072; x=1795771872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4i941FDPhpmYcUdo3BnCKwVlDsg7lnYxXVRnzu5LkiA=;
        b=HecZDQb7CVbdeNhyqELK8mZSGQ57dXFWoER3l0AH6+yx5s0ejZrONtGeXBWlJhLiBH
         QzLZkzyrbuTorTMCDNjmhx5b89Lf7UdN0/FvcT0do7Rhk1Mq/F3TxADF7VMlxgjT7J2A
         j8AFrO4OV/VYhwc046wuoaLGgw0tdvP/vQEB/o0iOpCjOOe6gqukg0sF0Xw5ID+7xmYC
         U4syCqx59aikiColh7/aHtpGEE93Co09aD7PVl+oy9Frc/2BRfjfg0620KYnd0IanT5D
         Py/bWFv9dl0PEqOGXJrXhd5E6mpzzDDliFUj55wl4acvjRHteuK3WWBj25pfxz0vApNr
         3GIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167072; x=1795771872;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4i941FDPhpmYcUdo3BnCKwVlDsg7lnYxXVRnzu5LkiA=;
        b=QkgGboA0ptpIOcuSB7o+F/ahZqfRdpdj1S3u5vmUtVmUQOVpMArwngzWWwT72wD8Rq
         pd9lEiAH/e/pL7cvSuB+XGD0tig3lpy56jFPMvoBrHZQFvc8K7c6dDgdKWlkXKObcl4z
         9wQdCH5EoopLEXjruYFtyJ7ptk1McB+lKbIg+H90jJZwNXzqJX427fW4SvcOc6www5hf
         uPIO+0HkZqShBWpdEjSFWqZbe48/zy3rtEWyYLLZsscoxL7sZrqmEgIoIOxBZKc6EaZu
         cs2XUHxAyMzGBMaWvjuaquZDo6FaTIixN8s+/ScHEj3mmlmWu8EV8Ya5x7icg0HYGgY0
         Wyvg==
X-Forwarded-Encrypted: i=1; AL+hErFvKR3xX5HGdDlncEMUAtS0vkJ4YCC/x+6EB1KdHHQ29R60W7jt4nQ0rxydSrTPZLJPWaDPgMWrvsg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9A5TbP2ka+efvD3WkbxP4vcrN7KZkeTuqD5s8Skv67g6YploBV
	AQdFPK/2sWpeMY6j3uEhIdNsfYNfoDnC/N2VDX9haSaTN0JHviVqururs/8xXkRXf+D8a/0Pi4V
	GYCQeyfOAA1sIujVnYlXzwP9klS1RJK42zbcXuIohwg==
X-Gm-Gg: AYBFou0BPpGhEaMFivPXC1br/2NUI1i05kksH4YZO9sYn413BWjLxmjnPF7z/q7pYf2
	VFx1xj3IiaLyZ05wyTQal0KmUcuFJdPF+n6dG1MsA4Xp52fiizvp9g6l+eTCse7yiS14LvTUlEl
	qS6vMKgnp9ZrgYUfi1DyHk/ql8DbCqbsBx3DMRyo6ue5bLZwHykIewEyCbiTqSSWxD7l/YldquV
	CBNMH/acVxikO9fcKVwQ8XZXMHvINW27tsQEvyaVIiySSxYEBrgP0fiea8PlRl1bNSxdvWzpYWl
	emBCynkwjhW0ducztZ3BwinhvMS8KkWzAXU/II7jppnNnNjyhj1ZK3QMBe3HLAFNOhRh6U0CdUG
	fSY+ff3/yXPxXdl619q7z4nVbwZWL/xiAcM4wu1I5J5Q=
X-Received: by 2002:a05:6830:6814:b0:862:e9e6:6297 with SMTP id
 46e09a7af769-86315985934mr3086650a34.18.1795167071723; Fri, 20 Nov 2026
 01:31:11 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-dfustini-atl-sc-cbqri-dt-v12-0-6ef1f627072d@kernel.org>
 <20261114-dfustini-atl-sc-cbqri-dt-v12-1-6ef1f627072d@kernel.org>
 <20261119000846.776930b3@jic23-hlaptop> <CAEEQ3w=voZYrfcMuKC_SQG9U8hYN_thcc02nf_PgMu5UyuG32Q@mail.gmail.com>
 <av-WvzoxSv7QpMhQ@thelio>
In-Reply-To: <av-WvzoxSv7QpMhQ@thelio>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 20 Nov 2026 17:30:59 +0800
X-Gm-Features: AclHuK-k8TRNXUVZzhRA9w-uB92JwpYAjGJmp8KpAUe03HieCcNAOF5c9k-Hbw8
Message-ID: <CAEEQ3w=zXTYjAoWcBZB_CSVYKsbOSjGvp4JW63HET_BwLnW1Nw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v12 1/5] riscv_cbqri: Add capacity
 controller core
To: Drew Fustini <fustini@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Adrien Ricciardi <aricciardi@baylibre.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
	Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor+dt@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dave Martin <Dave.Martin@arm.com>, 
	Fenghua Yu <fenghuay@nvidia.com>, Gong Shuai <gong.shuai@sanechips.com.cn>, 
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn, 
	James Morse <james.morse@arm.com>, =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Peter Newman <peternewman@google.com>, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Sunil V L <sunilvl@oss.qualcomm.com>, 
	Tony Luck <tony.luck@intel.com>, Weiwei Li <liwei1518@gmail.com>, 
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, 
	Zeng Heng <zengheng@picoheart.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Drew,

On Fri, Nov 20, 2026 at 8:39=E2=80=AFAM Drew Fustini <fustini@kernel.org> w=
rote:
>
> On Thu, Nov 19, 2026 at 07:00:21PM +0800, yunhui cui wrote:
> > Hi Drew,
> >
> > On Thu, Nov 19, 2026 at 8:09=E2=80=AFAM Jonathan Cameron <jic23@kernel.=
org> wrote:
> > >
> > > On Sat, 14 Nov 2026 14:06:21 -0800
> > > Drew Fustini <fustini@kernel.org> wrote:
> > >
> > > > Add the core for RISC-V CBQRI capacity controllers: the register
> > > > layout, the capability probe, and the allocation operations that
> > > > program a capacity block mask for an RCID and read it back.
> > > >
> > > > A discovery layer maps the register block and describes the control=
ler
> > > > in a cbqri_controller_info descriptor. riscv_cbqri_register_cc() pr=
obes
> > > > the controller from that descriptor and adds it to the controller l=
ist,
> > > > which stays private to the core. The core owns the controller state
> > > > after registration, so nothing in it depends on how the controller =
was
> > > > discovered. The caller keeps the register mapping alive.
> > > >
> > > > Tested-by: Zeng Heng <zengheng@picoheart.com>
> > > > Reviewed-by: Zeng Heng <zengheng@picoheart.com>
> > > > Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > > > Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > > > Signed-off-by: Drew Fustini <fustini@kernel.org>
> [..]
> > > > +     /* The resctrl glue keys its domains on cache_id, one control=
ler each. */
> > > > +     list_for_each_entry(other, &cbqri_controllers, list) {
> > > > +             if (other->cache.cache_level =3D=3D info->cache_level=
 &&
> > > > +                 other->cache.cache_id =3D=3D info->cache_id) {
> > > > +                     pr_warn("CC at %pa duplicates the L%u cache i=
d %u controller at %pa, skipping\n",
> > > > +                             &ctrl->addr, info->cache_level, info-=
>cache_id,
> > > > +                             &other->addr);
> > > > +                     return -EEXIST;
> >
> > A controller with the same cache level and Cache ID is not necessarily
> > a duplicate. A distributed LLC may have multiple physical controllers
> > managing the same logical L3 resource.
> >
> > Matching controllers should instead be grouped into a logical component
> > keyed by (cache_level, cache_id), with the physical controllers kept in
> > a linked list. User space would see one logical controller as a single
> > resctrl L3 domain, while the update path would iterate the list and
> > program every physical controller.
>
> Good point that it is not a duplicate. However, I would like to keep the
> scope of this series from expanding, so I would prefer for that scenario
> to be handled in a future series. The domain id is the cache id in both
> cases, so it won't be a problem to add later.
>
> Do you have a platform with such an L3 that it could be tested on?
>
> For v13, I could change the comment and the warning so that they say a
> second controller for a cache is not supported, instead of calling it a
> duplicate. The alternative could be to skip the whole group if it is
> a problem to just leave the first of the group enabled.

Keeping only the first controller could expose one logical L3 domain to
user space while configuring only part of the physical resource. Requests
handled by the remaining controllers would not receive the same allocation.

This topology should be testable in QEMU by creating two capacity
controllers with different MMIO bases and making both RQSC resource
entries reference the same PPTT Cache ID.

One possible grouping model is:

1. Initialization
Group controllers by (cache_level, cache_id). Represent each group
as one logical component containing a linked list of its physical controlle=
rs.

2. Set
Let the resctrl domain reference the logical component. On a schemata
update, iterate over the controller list and program every physical control=
ler.

3. Get
Read the configuration from the first controller and verify that the
remaining controllers report the same value.

4. Monitor
When monitoring support is added, read the counter for the same MCID
from every physical controller and report the sum for the logical
resctrl domain.

User space would continue to see one logical L3 domain, while all
physical controllers behind it remain synchronized.

Until this grouping is supported, it would be safer to skip the whole
component rather than enable only the first controller. Since this is a
valid RQSC topology and can be covered by QEMU, supporting the grouping
in the current work would be preferable.

Thanks,
Yunhui


>
> Thanks,
> Drew
>
