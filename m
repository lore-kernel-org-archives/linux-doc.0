Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EAD583AD2
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 16:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885945; cv=pass; b=S78Y1qkgSMV4PvIUZ7hh5pVDL31ea0TOP6Uzac9l434LOZKfxx7oQrEsEckd46jwM9zr8OHFSs/9ClxFYkqtn+gLM2cwpInTU/PV6VZaxYCRXRYYirLvCLHMHlepcEVz0NLFFMgzFUo+s7A1bwoGPwSLeH6bq/3ez7FUiqsPYuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885945; c=relaxed/simple;
	bh=Emh4r7YyMhyoPJO25yHzs0ZWlSLxOb8NX5/sVQuWrzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mfPLwAPRrs3gjaXPOsoLTKfxna6srNWF8Sb6yXo1cbEleUyyz41qILVYpi7pTpMJtk7OcugNGT+6edKcrSLXGuF7qSR/3St3QSHyn8vcJLvujCuiXhCif29uW862LUtlqWtFEzynHcvVycyLCJvZwfyEY5D5BggtZEDa6TJgck4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jivIW1l8; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jivIW1l8"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so5542173f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 09:45:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788885942; cv=none;
        d=google.com; s=arc-20260327;
        b=LEHUJ+UJEuLJspzHFfQqfy2GOQc77FdkZ2HIvIx8u15sH1jRcDxa1CKa1hL3Y40Iay
         QVfiy5T6Xob+V02ZRpx3bIHMs8zvMbsKpsphuVtCBikrBgromDwEwV51c72UgbtYWP+D
         Xhwh810Yvw6/Vkp00w24XrWcEPWFNOsWQQyHdnkIS9WGguXaCHo2mQrTP6a6/GNy87fv
         rFnEVY2eH9O7WBfQRWqmRkUagty/zzjrfOnnvBjogfC/2Y+iVHE/v1c72npdEw2l9vl8
         +dyIuq1PLduBcwISTBq8ULtnwsoCCsDzueNHS87IBjSKIKemvjOapa3YGhA3kZs0aVPl
         THRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Emh4r7YyMhyoPJO25yHzs0ZWlSLxOb8NX5/sVQuWrzk=;
        fh=jDlvOZik2MVgMqLwglF16bey0D3GfNhLx4PN6uAdKAI=;
        b=n2eI9y4bzEgI/kT/r1a+ACxbRzvRPmxsxdfu9KDC7fLnKNDfQqqWWHl5fsmUMqgwSM
         xiEAnqnaiBkX9lEGdQnbSua/4N4J9o/291k1X+rwwhESzYYN1OYZuTn9UZf2xUbuTMZv
         i+1EqV1TclHQqAC59PwqfdwuwYf7iuRdh93bFIO2M1Tx1jZmSDw8mSyIvpz0K2xP5eXJ
         RzSTdIBrGDhkNO5NOqgqwg2RpQT5G1bInbs9PhE+cODjELgGFDjUVzrFRpfOiY4s3fp4
         yqaEGTPROC/4qYm2kywErKP0KX6VsO+Iq2FMdKP8hTUwPwcBYOUXFSGJBgMF6gvTVgNu
         1Omw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788885942; x=1789490742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Emh4r7YyMhyoPJO25yHzs0ZWlSLxOb8NX5/sVQuWrzk=;
        b=jivIW1l8eDX8dT2akCqSRvFMHOK8/VvbyxR8aZJastkAAsRb0YC33lL8EB7FTKsjlo
         ipY7YN87/NSa4BMS/bQ93UNp/M/SR5lEXE//cVWGfTKTXjPyQ8QaPH9LI1+FcNdeqCp/
         oMK6sDLlc15tYdB1QHWmL7V73WGodJv2K9wH54p1R6pNPUb2795sH355wlIr0jTPZKeJ
         roznixBw1XdPcpZChiTgThuKtk9YpRr0SuyOHJhQ36qXaSX5aTtphoJDkjttmMDrC9MO
         4ZyFHu/wP5SV8lGJ4d1vnD9Mf5ci6tlYZD2QFRBU+fs3fjHL5JUZGFuSXX8PkW3i1FdI
         IjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788885942; x=1789490742;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Emh4r7YyMhyoPJO25yHzs0ZWlSLxOb8NX5/sVQuWrzk=;
        b=d00JRk77oseLCXM+30ZM9rIF16j3l+qrWYOeolAxFYVJgfvq/pZWvtbS+ftP9iTLdk
         dYJnreXhrSj+uTh2bBvIPQGdzyQaF6Ia8jUznuoos9LxQ5/7MJqfn5G2veRbHN0g4wmH
         QfNFTc/PyZQzuJ2Q/eKCx6o9G8SZPxo2yKC+4zct5OJMkgAWx9K5ZGqQiZtXHDqQezLr
         xTKGRSWZsNiRwH8Sjs6Gjf3wt9fv2PUP6gfeus+ouiU9mcg23EZj06wCoUx6CwgugjGG
         W55aKYohruGuw4iKkeqQ77lJXFqSM2pNHuMKiVpW76uLLVzhNcJlwellxgRn2D9d+yhZ
         9IIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWx4BGplDzVUH1/Bv9ylXCg0VA65QtX+eNXHX2oeO14Tm+qXBiMxecUZLLKM1qPq1bHOPmQ43gczg=@vger.kernel.org
X-Gm-Message-State: AFuF++nwNn9H1rvJbRJJe2JrN0CemhHWAp5BpRO+rRpGvSJERsi3oZ/f
	U12zaQgUJ965hqQGydgBMHziI6ByhTskzr+B3GhLkICQNF3L/ek/32vga2qi0Drk1sESI6Hxghf
	6YcnL4sI0wBtMVVB3jG3SHkBNbaqyIO0=
X-Gm-Gg: AYBFou0QaJp5y4jD+ALVN+nlWR3enZmjpJaO7Lr4raTd3WZNXwI6P3D62QOkqMG35l7
	xY0TO96rZw9eI2zzr5/vhCWLjFxdcCcg7I/X9vCxuUKdoRQnJeYM3v+lwPbL5t5bQOFsFj9DMI/
	xuP3BJa2XRuRJCm/O6XV2BLgP2bfEAm0mJEahdg8Q86ps0jU7pUDLJ3ok7Io2sARPjPZ9eKyGVa
	5DHG9wSSS3LOZ98PDwp4GKn37dbQgCKQJiIt8cp1UtNXS57djin2jG/J+FEEoNVj5XDe62FaflC
	rb6DaPSZx4kti6CWD9SCNWexAB6g81Y4FKP2zyvbIC5jTgy12tp/xCV3xZPSGDaGIfQoZlnMm4d
	t
X-Received: by 2002:a05:6000:288e:b0:485:8c16:a33f with SMTP id
 ffacd0b85a97d-4858c16a5d0mr27884309f8f.52.1788885941502; Tue, 08 Sep 2026
 09:45:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org>
In-Reply-To: <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 8 Sep 2026 09:45:29 -0700
X-Gm-Features: AcwNN1VKHJXv7OJIvb-6r4VRgrNUVYMe2NFk6RQyVFERhDXV76DkbFan7U8qPdI
Message-ID: <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Kairui Song <kasong@tencent.com>, Chris Li <chrisl@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
	Gregory Price <gourry@gourry.net>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Kairui Song <ryncsn@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 4:30=E2=80=AFAM David Hildenbrand (Arm) <david@kerne=
l.org> wrote:
>
> On 9/4/26 23:14, Nhat Pham wrote:
>
> Hi,
>
> > To Kairui, Johannes, Yosry, Chris, David, Andrew, and other (z)swap fol=
ks -
> > I need some help here.
>
> I'll mostly ignore swap-related stuff because (a) -EBUSY and (b) we have =
quite
> some swap experts around :)
>
> Reading below, I do wonder if the swap subsystem needs some more coordina=
tion
> and collaboration?
>
> For example, maybe having bi-weekly/monthly meetings to get everybody ali=
gned
> and uptodate could be something reasonable?
>
> This approach has proven fairly helpful in areas where (1) multiple compa=
nies
> are involved (2) many concurrent development is happening, and (3) people=
 have
> different priorities and requirements.
>
> Is there already something like that to organize development? Should we g=
et
> started with that?

Hi David!

Thank you for your suggestions :) More collaboration and communication
is definitely needed here. Conference is a good place for this, but
it's not something we can do very frequently, and many folks could not
attend (visa issues, etc.).

A bi-weekly/monthly series of meetings sound very appealing. Swap
contributors are very spread out (China, NorAm, Europe, etc.), so
coordination will be tricky, but let us figure out something.
