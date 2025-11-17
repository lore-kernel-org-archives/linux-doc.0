Received: from mail-43191.protonmail.ch (mail-43191.protonmail.ch [185.70.43.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112AA1C84A0
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 17:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763401887; cv=none; b=QzhAMXop8PnWwLhkcMiEek58UnfYiCMjb5oSp4UId+M4zHuIyX4J55yu7mBQvC3nltpTii4l9MgbJ4oqk1shBNTMNqlmK/TN5HsGY+uQ18QFhk8e1N0NEN1ZqzQnVeBShIxW2GH9/CmJC52nue0M5cjRhUb/fVWPUkKRaZzu5gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763401887; c=relaxed/simple;
	bh=dvBUOLItidwfrNQEf4mN9DTt1GLDuvVSAWBtWZ+I3h8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GGs91VUI1h7nJpUigzMY/lrRBoG0L8/KS81kw3JHwfOcQbIJSnKybrZvxJcK617JzrAAl0bBsniXBsLxpLn12M/xwTFDQuPE5pgMvw8YL5GLvw8XEBSU8+slSMvvIe6O4jMyByIZ/XRaexX/UWGbT3x2cq22HYYqfHEgzIckdsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=oQBqUjSf; arc=none smtp.client-ip=185.70.43.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="oQBqUjSf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1763401880; x=1763661080;
	bh=8JHRGFc+rtU8gXb3Jyiztx9jQrUCtKtMFdopnkmvtTw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=oQBqUjSfF7G2kJQrbbupyMiiL3urxY+IOjodFvyRKJ7BeHY/Dcl/doiaaDctJYfkJ
	 neWOwaOGLUAaNvOOA9Lnkn/V7Zxs46ZLspzWPnHWqsqxS/d+3JQ28pmHZyaP3ROCiP
	 lPORmcpqbEa/NLboQDALyeNMJy7OAFr681dFCiyvFWO465XYCDffdIMULNoQdGBZG5
	 LqsCEq8v1qizeghermjOZkDdSKpmudU0KEGcYzC75rPAJEG8nR1gQFIh5UjtYTVp5L
	 Abt+RNltqCl/40foE++yjpzIs3zTJ+mCRrvbsrD50yTsJZVBuZlmevHhrdCKoaSwyO
	 yZDKI/Aa1I0hg==
Date: Mon, 17 Nov 2025 17:51:13 +0000
To: Alexander Potapenko <glider@google.com>
From: =?utf-8?Q?Maciej_Wiecz=C3=B3r-Retman?= <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, ardb@kernel.org,
	Liam.Howlett@oracle.com, nicolas.schier@linux.dev, ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, stable@vger.kernel.org, Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v6 01/18] kasan: Unpoison pcpu chunks with base address tag
Message-ID: <ha5gz3hfjtfrmldzbscrbbtptecyqkwzkwdkjxnc2puqzquurl@nthv7frvqatw>
In-Reply-To: <CAG_fn=Wj9rB0jHKT3QKjZsPYce1JFcb1e72QBOBP52Ybs3_qgQ@mail.gmail.com>
References: <cover.1761763681.git.m.wieczorretman@pm.me> <fbce40a59b0a22a5735cb6e9b95c5a45a34b23cb.1761763681.git.m.wieczorretman@pm.me> <CAG_fn=Wj9rB0jHKT3QKjZsPYce1JFcb1e72QBOBP52Ybs3_qgQ@mail.gmail.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 7b84ae9accb4bc7551e617e5e7661cf28649358a
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2025-11-10 at 18:32:21 +0100, Alexander Potapenko wrote:
>On Wed, Oct 29, 2025 at 8:05=E2=80=AFPM Maciej Wieczor-Retman
><m.wieczorretman@pm.me> wrote:
>>
>> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>>
>> The problem presented here is related to NUMA systems and tag-based
>> KASAN modes - software and hardware ones. It can be explained in the
>> following points:
>>
>>         1. There can be more than one virtual memory chunk.
>>         2. Chunk's base address has a tag.
>>         3. The base address points at the first chunk and thus inherits
>>            the tag of the first chunk.
>>         4. The subsequent chunks will be accessed with the tag from the
>>            first chunk.
>>         5. Thus, the subsequent chunks need to have their tag set to
>>            match that of the first chunk.
>>
>> Refactor code by moving it into a helper in preparation for the actual
>> fix.
>
>The code in the helper function:
>
>> +void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms)
>> +{
>> +       int area;
>> +
>> +       for (area =3D 0 ; area < nr_vms ; area++) {
>> +               kasan_poison(vms[area]->addr, vms[area]->size,
>> +                            arch_kasan_get_tag(vms[area]->addr), false)=
;
>> +       }
>> +}
>
>is different from what was originally called:
>
>> -       for (area =3D 0; area < nr_vms; area++)
>> -               vms[area]->addr =3D kasan_unpoison_vmalloc(vms[area]->ad=
dr,
>> -                               vms[area]->size, KASAN_VMALLOC_PROT_NORM=
AL);
>> +       kasan_unpoison_vmap_areas(vms, nr_vms);
>
>, so the patch description is a bit misleading.
>
>Please also ensure you fix the errors reported by kbuild test robot.

Thanks for looking at the series! Yes, I'll fix these two patches, I've
split them off into a separate 'fixes' series and I'm trying to make
sure it's an acutal refactor this time.

