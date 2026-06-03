Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D523CCA02
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 12:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488979; cv=pass; b=gCnfVso5TdHKGmyqUASRIDTKi9BTC3yYxPQXo25DDVp4yNVgP+NDkdYPXB7O+1TEoux4G/wRNt1kvZPw/f7/QSpSfrxa8284gIs7OegXuRrjb56Wi2N/phcrvQBeVtQU2ag+sWBWHnWASyi8x/CQeYuaTNKCS5mogg7cY0Xs3E4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488979; c=relaxed/simple;
	bh=rr4Wx+WQ9kTyjJZ4jV8jG377uxMzetXCa4qJ2aoZkEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ATEftM4A5uqjO2SV939FrCuvGgzgWioeL+TyYjTnID4e9dZlpp0P7z/WWkrZBfsjnNW/EECvXg0y/R8k4OpmeX1ekNrZg9K3DwNKqOcx2GqLS8DufTZ0x4hj8WBw9w6FTdoZAdf7aPHr3d1gAhjak+ShfZqFxr+UA4w7Dwc7zGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=geYhhZqd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=daFzELaz; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="geYhhZqd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="daFzELaz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780488974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wNEtlb9dNSrrLzMMlCD/oxjjgcgHEDwsYx0ryDudzQI=;
	b=geYhhZqdwbLEZEunJszXlNKs/ewe077X8XOdyaz5EC4RHODvoeiKNESSohKhOTzfQNxkca
	SR2+uszy1WHvksvT3q3R1a8nQicm4ZsGRKq5UWpK1XkFxBZX4+3vSc4p1/ZcsQeoF3x5OL
	j680LgV4I8UnPy++cmb33Ads/k3KghM=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-jJHWdozgOuGWRt4Ry6vkcw-1; Wed, 03 Jun 2026 08:16:12 -0400
X-MC-Unique: jJHWdozgOuGWRt4Ry6vkcw-1
X-Mimecast-MFC-AGG-ID: jJHWdozgOuGWRt4Ry6vkcw_1780488971
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7dbe4c01345so7173977b3.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 05:16:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780488971; cv=none;
        d=google.com; s=arc-20240605;
        b=TD34KpdwdIp/ZqU1KLzSxprIC6yetkWkpYVEWKydEJ//iazDlgbz/o+i1ZdWUZQlmU
         mBzOXj8Bkt5tgiT+qP0gFOtEuqshx0UKd0Ht98pNLSwnj+Dr0Dz4cyNE2a648Wc0sA/3
         Tm3EUdnmnmngBNPlBZOqhuORQXEqtFlFTo5BIT4xK75vCnU5VXfE9R13G0REteY2aDfy
         eJtabiYucI+Oima/LqNlEZnAnTXxvBkh+j9Lk/NPpQDMfMmskmc69AAIyC6ED/HYxjNT
         DFlgkVWCF8PKlKHPhReL8qlBGQGWwa4vM0MTFX/ONHu4peOd4eyYl4DZAaeXkgl79lZn
         HQ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wNEtlb9dNSrrLzMMlCD/oxjjgcgHEDwsYx0ryDudzQI=;
        fh=xq2M47Ct122L7EC3TXJqZYVPA+hqOpxm384DdLa7uIQ=;
        b=XvODwC4XDAHFTHwg7DmVGsQKXtECr5qT7JYhfoUfXDUYy/WUFk9xl7SwEKSpDZPq5U
         /mjMGlnSSCk+XXS7zZ1DpEeOdqdo1aG482DBrJNWwRWDzFvANnGBHeEYE9P9QgQ0nDze
         mHZzRdYSvOUnaS+hXrTVNvSJXQ+VF4pAi2TDA5yQuBPQnpXMb/FnEaV4J8hGPPACY77F
         2n771i/Y1EOfydIvRC/3LgXZO5udvNeksr23e9l7G1wEE94twUvxkfCwfGEiGZEz6vA/
         UB8Y1UbYOTqjqUo/JKNgZqJDcBw+1PnXN/r9vLwtNBHLn2PJzM1vbBjTJJTL/vTmQy2O
         YmzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780488971; x=1781093771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNEtlb9dNSrrLzMMlCD/oxjjgcgHEDwsYx0ryDudzQI=;
        b=daFzELaz9zSaYPPZPuNrOOpwePhwZy9Fqx7ULjuWAMw4jYQ51oFU4q6hd6tkTToygV
         k5c3vSiw/gp3gjgqUZnJxdnFb+8IaN8nsc1LDq4sSqbUwwNiqX4fiwJyjaArP/20vz/n
         HAbbQbg3nmILxwwYgobKRrYAsOQEtbZ+Km87BRhzo6WdEzBBF28lrMNiqHQbv+Lhccu2
         lpCtUhUQg8qEwRmQerXwFFqhLYln4dN3dQeNYaVHow7uKvIqRVqRYI5rzmv4Zuwrc926
         IazgGiAgI5hRzmD/5ff1PMZ1HNUfDmFpPEZtiIn+NSMQPxoRKbPz9/XWLojiVlwb9jIS
         N1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488971; x=1781093771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wNEtlb9dNSrrLzMMlCD/oxjjgcgHEDwsYx0ryDudzQI=;
        b=lqz1Ct7bdeHWN8cX0Az5crPyIiPl/SQFrp34OKe96pLWuIjCzyJ79Q8/n8J0R4z+xA
         7MZOGcqTODCZmryn2Zmhhnb9mkyXUVSmm0QVQ1JKlfooEFH7p+EMXHprSbHVBYsuPzcK
         jiz1VYqPSO0X2+YXKHDELmAy3ORx+HkmFUsbR/fN0duUs1nw9OQmrjvpCZHRISz6k/Yw
         wR1z0bmVzsqfRz8YiIRjGFUQAK/s/Fcxpunuzdj3xSy6bWlxCKTO9UFudGCFa9I7eVip
         l99icWhKF/MVnn6RpcD55xtCpXuDQiU198ihAAArhCetvQLeS8+BjZamSmtgm4zSjwcH
         QtMA==
X-Gm-Message-State: AOJu0YwOOwJaE6fvT76mPi4xlBE+OztSkItmGSn6lfOkBQauy09BaLUT
	7cIlGKJCvsk/O3ePe6RDrWOQbAJzLfxor+WkHqG3J0GUPT1u7ieRQXq0DykqZF+nFQOqp9azKVz
	xia3L7BqTQU3z23a43r1aHWiCM18SxuMJ1i/OTZmuujHq/4IpGGOkVR28saChbqGbUFSsXmNxup
	m//8lbcwyZwg0Dc1jLe/B1CJkrI6rHUaDLy5UJ
X-Gm-Gg: Acq92OGYK2dXsEuckAIQZuJkTyL5yLj7BgoV4jxXkb2mGTwCSAI9hnSIAk62itGox57
	SR37/7Mc/eysxdTnpNl8ewe00cDQPQ0mCBnZ/+340v0uRzOWKisjvs471szkJxqWfbmCs/Lwh9b
	sVobXShkZj96V2ZY1QWD09o2Uz1FAn8JIUtPOoM1Gyrwqone72JxksbiiYero8/pP447smMMxef
	NaewLXjo8DKoYVX9w==
X-Received: by 2002:a05:690e:440c:b0:65c:58d2:18a5 with SMTP id 956f58d0204a3-660dcbf56cfmr1408322d50.41.1780488971436;
        Wed, 03 Jun 2026 05:16:11 -0700 (PDT)
X-Received: by 2002:a05:690e:440c:b0:65c:58d2:18a5 with SMTP id
 956f58d0204a3-660dcbf56cfmr1408255d50.41.1780488970976; Wed, 03 Jun 2026
 05:16:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522150009.121603-1-npache@redhat.com> <20260522150009.121603-12-npache@redhat.com>
 <b8380eb3-096a-49f1-9ace-99c1e75888b4@kernel.org> <CAA1CXcBg1su-bk3i_H+TW4-nTgvGSGqRNeC9MpQo7sGeH8ejnA@mail.gmail.com>
 <d3c2b00c-6810-434a-b837-0707b0a11611@kernel.org> <19639b08-5bf1-4974-9635-c458d512fa38@redhat.com>
 <ef5c470f-3c32-418d-9566-17ec01b691bb@kernel.org>
In-Reply-To: <ef5c470f-3c32-418d-9566-17ec01b691bb@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Wed, 3 Jun 2026 06:16:52 -0600
X-Gm-Features: AVHnY4LAQaiaHNznOXVI6g4R-yc6NKejy8321oN1JhGLTXQQA6dG-VWPanP8lA0
Message-ID: <CAA1CXcD_Bz=Si+vP0Sg_FhAHVjbeAJ4VdvtWGM-jVYiRXFHAnw@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v18 11/14] mm/khugepaged: Introduce mTHP
 collapse support
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, aarcange@redhat.com, 
	akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com, 
	catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, dev.jain@arm.com, gourry@gourry.net, 
	hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, jackmanb@google.com, 
	jannh@google.com, jglisse@google.com, joshua.hahnjy@gmail.com, kas@kernel.org, 
	lance.yang@linux.dev, liam@infradead.org, ljs@kernel.org, 
	mathieu.desnoyers@efficios.com, matthew.brost@intel.com, mhiramat@kernel.org, 
	mhocko@suse.com, peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, 
	raquini@redhat.com, rdunlap@infradead.org, richard.weiyang@gmail.com, 
	rientjes@google.com, rostedt@goodmis.org, rppt@kernel.org, 
	ryan.roberts@arm.com, shivankg@amd.com, sunnanyong@huawei.com, 
	surenb@google.com, thomas.hellstrom@linux.intel.com, tiwai@suse.de, 
	vbabka@suse.cz, vishal.moola@gmail.com, wangkefeng.wang@huawei.com, 
	will@kernel.org, willy@infradead.org, yang@os.amperecomputing.com, 
	ying.huang@linux.alibaba.com, ziy@nvidia.com, zokeefe@google.com, 
	Usama Arif <usama.arif@linux.dev>, usamaarif642@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 4:01=E2=80=AFAM David Hildenbrand (Arm) <david@kerne=
l.org> wrote:
>
>
> >  next_order:
> > -             if ((BIT(order) - 1) & enabled_orders) {
> > -                     const u8 next_order =3D order - 1;
> > -                     const u16 mid_offset =3D offset + (nr_ptes / 2);
> > -
> > -                     collapse_mthp_stack_push(cc, &stack_size, mid_off=
set,
> > -                                              next_order);
> > -                     collapse_mthp_stack_push(cc, &stack_size, offset,
> > -                                              next_order);
> > +             if (order > KHUGEPAGED_MIN_MTHP_ORDER &&
> > +                     (BIT(order) - 1) & enabled_orders) {
>
> Why not a test_bit() ?

The test bit is at the top of the loop. This adds a exit if the lower
orders are all disabled or we hit the last order.

>
>
> But, wouldn't you want to skip orders that are not enabled and try with t=
he next
> smaller one in any case before you advance the offset?

We are currently iterating through each order (not skipping them).
There may be optimizations to avoid iterating through every order
(like your changes suggest), but currently, every collapse, whether it
succeeds or fails at the bottom order, must also iterate the offset.

lmk if that makes sense!
-- Nico

>
> --
> Cheers,
>
> David
>

