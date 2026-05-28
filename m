Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B503F9F5E
	for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 17:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779988278; cv=pass; b=P0SWtaZOnIlkbDIqC0icosxIZ5+gJpXj2RYbPCkud4+X1Ipd+9znI2jSwsXwPm5BdNAv19s+D5sVDY33wk7/eL5nUFwcXH34cL3vF5M14+mdjGQhvd38mHQX2M7oNCf57JjORHB8SNkg+isV9TdgjujMMS4J8VXZU5G5L7ygI18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779988278; c=relaxed/simple;
	bh=sz6XapUVmOA6zIuBmrCqm3oCvEoF6NkKyQu2hK/OPNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Io10U4kcbKODKnAa3H5POPUonaJwDTJX05wXBzEl3BEdtKalqNheSmVhWFWLOQBjJr5NLmECNutZMQbdT7F3Ocvrz9EGiTjW83EYf/artQbYdq0PzuyVJNyOkdwadhU9O+5zFn/9kZD4ndi389JWDrZwVvKbpoTG17wtP41DPX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hF3g3JtQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=E/U4dJMm; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hF3g3JtQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="E/U4dJMm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779988274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ihUpxCim2Hwyu43MMJlIX4H1ID4hW1kFB98h6S7dK8=;
	b=hF3g3JtQpCeEN8y62CVzZdM1xjaXNQcBrB6bdRO50AlmUJHdNyeJC/T9Le4VSqJVMcbSn5
	FMunuxLkFN/fzHVbiH8eEOm0G7/Vh88+jeGIFlxr/1uAbPxrRcvr7en6EqnHBRA032nkfe
	RQoI52B9FdhIOognYw2M5FqJkjTCpVs=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-zQ0-mg6mNxGD-IJ4jCI9SA-1; Thu, 28 May 2026 13:11:13 -0400
X-MC-Unique: zQ0-mg6mNxGD-IJ4jCI9SA-1
X-Mimecast-MFC-AGG-ID: zQ0-mg6mNxGD-IJ4jCI9SA_1779988272
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-65d9e66d0e1so10720722d50.1
        for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 10:11:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779988272; cv=none;
        d=google.com; s=arc-20240605;
        b=EfvoozQ7jjsmWaEIUsbQ/cRBZ3e79gAMVcBNAlknAdwUee6Y2B5hl6jwpu7mX+h3mA
         4x3Z2PPhSAi16N/z2BNHqoN818lAFoqI/QvxkDMVt5R9UbSIyU3af0DSG9Xgau0sShxt
         nbdaYDziBCwcfaINDUxtuHG10OfbeiOjonqNsxd8uUyRDofen7CGkbfY4zJQpZC+e3uJ
         wqB3DykxSj/id02BUO0LAQZVNqEwm6kjelV1qg59C3WLFDHALFkkeMJwEDQ9wO/MVkt5
         4ztIzIJVU0wmXCk26YI/Sq321thgc8LVsge1HicILe0MuxKjVtAGvixweBjwd0tsaXQf
         FPEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0ihUpxCim2Hwyu43MMJlIX4H1ID4hW1kFB98h6S7dK8=;
        fh=DP76UZXuWbhNXIKNxte/0qzbvftFtmV+e7+nN9NRwFY=;
        b=H4b2f5OSUbYOJzazgos4wd6wlJXCySLRCiqW1xXYt7Cu3NbZFhIT5T59HTA5ahRnZ/
         R9X8URn3/jicRfbB2W/Nscoa9DBiSuGWPtV+ysETNRoX6K+c4w5fOIAqY9tvlQkW2i2N
         mUSamdcM6USL4balGCtjHfdNlMoc/JDXDyInXAjU9xxHqFaD0XWKH5XqxBxid6ZEmR+t
         mHnP5mze5BE7Wh+8AMd/jljU9GQEyvVW2Ihzs4GM294H25wRW3jaj6d4lZFuTWzaqzar
         2tJwGnrgDVCmIaoShgiIrpY50GW4xazLiPbpP0wDR52snfCcdjma413AleLBb4/hJmia
         OItw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779988272; x=1780593072; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ihUpxCim2Hwyu43MMJlIX4H1ID4hW1kFB98h6S7dK8=;
        b=E/U4dJMmBlxML+D+B8aGNd63vqH1LRhI/5d5URjic5AoLpMCoUkJJFYew92mb08ZiJ
         apTfpBsswP5CNhyr/gn/Lz70BeammjQQyI/aLkhFMfMsmwaIrp9lx9KwbUgx98X6y+BP
         BWXAnGXZiM9jDeeSqC1zsiBbXQK7NMiH84dhuhKNczS8Vak86Hg2ghiXAMUySHbgPv4X
         5be9PaLYAvGPKuP4TMxweWzWZozGn3YL0U/Rqo8Xe7UDZXNXfg1kJylqDwSeNFN3o52C
         g1D6hvWFGV67loPx49Rozgz4MZQI4x/PDRx5YHM87IQphDmJrq4DbsyFZ5mRIxhG9us5
         7V7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779988272; x=1780593072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0ihUpxCim2Hwyu43MMJlIX4H1ID4hW1kFB98h6S7dK8=;
        b=NBwZGEQ2i/wHVTE7N5gBcY68Ool5xxBY7x8g1nyeUKvUm/Yd+Yf995WG70SPseEwVe
         16ULxQuM5ZhM6ayfeqIhvICY+3rF7KXi5Jh+qzRGAo5Ux1IDtmEod2Bx1fLKlz8RiMbe
         bMFY0TGobNrjHGPE5PhBORycu3M/DxnySjlcUH0YErJ18t7TyQ3zjOMnSPUAT1oXd30d
         zKfNftuy7qKZCB41xHv3MmESLRVFcXlO+DZcr8LCAEqFivZqxSagaVhYflerWWTTq10O
         mkV9/5g1uZUGTeG6y/oQBYRvzyx4LkgcO/T/9Xcz44Yyant4y2rVXTUZq6ep8eD+E09O
         eSEA==
X-Forwarded-Encrypted: i=1; AFNElJ+ogJja5jfeZQ1F2dPLgJSzjJWkf07DSqdTU6d9U07pVemSmhSaJ30TYIvDW/Z5yaO/qiorp2AqmJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPUorsced+Pz12L/ewhGn+9iquzkOZmp0G7DdkENgknAAnW2Ge
	C9mPH9cnAwjyG3Im4cTVTWoQQ+pmkLk0oL/F2SAjEUgDkpdCO1BJDmzcEB6MbGucMUs2BKt0dDC
	DNlPrmSC/Z4USKImxcBUlr2bq507rVfEIiq7rKWVKAoCsTME9/u+8CkTVhAyX9gsDa9uwFz7MbV
	X2pcsAX2mrKo6d8bV9hWIPCnJVOAVWEiwL3Ql/
X-Gm-Gg: Acq92OEXs5okkbD5hRjY8dYlueEhXnw6W9jRnOLfCxI237ynd1Ly2xY4joO43NRlUMi
	xEgSD4x+lmmuEn6HCkO1qZTmn+jkRjLyZ1q/tHxqQc7r04NFSYLW8Uul/41t7OpyIQoaywgk6xf
	6vB1cct9ceBGBVeCivy2tDWsLz0f1MhQp8HXj/ZPshNZRMOz3on8Ta59TkXLUXEpajiHa45gD3R
	8X/4ng2njQ/sKOx
X-Received: by 2002:a05:690e:1544:10b0:65d:bf4b:f16b with SMTP id 956f58d0204a3-65ec96129d6mr21884206d50.3.1779988272477;
        Thu, 28 May 2026 10:11:12 -0700 (PDT)
X-Received: by 2002:a05:690e:1544:10b0:65d:bf4b:f16b with SMTP id
 956f58d0204a3-65ec96129d6mr21884113d50.3.1779988271977; Thu, 28 May 2026
 10:11:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522150009.121603-1-npache@redhat.com> <20260522150009.121603-12-npache@redhat.com>
 <2b2cda8c-358a-4a5c-989c-ae42593ef2ea@redhat.com> <20260525121041.2f2508a4f627c338cddd837a@linux-foundation.org>
 <20260526065708.oyyddmt2zgfwu2q7@master> <CAA1CXcDXyDhMyiVAb8XbusqMU10JXA8nOUw6b4_2i9H-kV2vwQ@mail.gmail.com>
 <20260528084211.wsdrvbvxvkddokb5@master>
In-Reply-To: <20260528084211.wsdrvbvxvkddokb5@master>
From: Nico Pache <npache@redhat.com>
Date: Thu, 28 May 2026 11:11:47 -0600
X-Gm-Features: AVHnY4Ix-JM5FCWg2fh8KtuGbuZClmx1qOAN3nLQNHVscERKje9jLsvBNl47yHQ
Message-ID: <CAA1CXcDSuD8D8S98=-zqh12CwrD8dATpzaV+usNvgF-RC-anvg@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v18 11/14] mm/khugepaged: Introduce mTHP
 collapse support
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, aarcange@redhat.com, 
	anshuman.khandual@arm.com, apopple@nvidia.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, byungchul@sk.com, catalin.marinas@arm.com, 
	cl@gentwo.org, corbet@lwn.net, dave.hansen@linux.intel.com, david@kernel.org, 
	dev.jain@arm.com, gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, 
	jack@suse.cz, jackmanb@google.com, jannh@google.com, jglisse@google.com, 
	joshua.hahnjy@gmail.com, kas@kernel.org, lance.yang@linux.dev, 
	liam@infradead.org, ljs@kernel.org, mathieu.desnoyers@efficios.com, 
	matthew.brost@intel.com, mhiramat@kernel.org, mhocko@suse.com, 
	peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, raquini@redhat.com, 
	rdunlap@infradead.org, rientjes@google.com, rostedt@goodmis.org, 
	rppt@kernel.org, ryan.roberts@arm.com, shivankg@amd.com, 
	sunnanyong@huawei.com, surenb@google.com, thomas.hellstrom@linux.intel.com, 
	tiwai@suse.de, usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 2:42=E2=80=AFAM Wei Yang <richard.weiyang@gmail.com=
> wrote:
>
> On Tue, May 26, 2026 at 06:07:38AM -0600, Nico Pache wrote:
> >On Tue, May 26, 2026 at 12:57=E2=80=AFAM Wei Yang <richard.weiyang@gmail=
.com> wrote:
> >>
> >> On Mon, May 25, 2026 at 12:10:41PM -0700, Andrew Morton wrote:
> >> >On Mon, 25 May 2026 08:15:53 -0600 Nico Pache <npache@redhat.com> wro=
te:
> >> >
> >> >> Can you please append the following fixup that reverts one of the
> >> >> changes requested in V17. The issue with the change is described
> >> >> below.
> >> >
> >> >OK.  fyi, what I received was badly mangled: wordwrapping, tabs messe=
d
> >> >up, etc.
> >> >
> >> >Here's my reconstruction:
> >> >
> >>
> >> Hi, Nico
> >>
> >> I tried to reply your mail, but found it has some encoding problem, so=
 reply
> >> here.
> >
> >Yeah sorry I didnt properly configure my email client after getting a
> >new laptop.
> >
> >>
> >> >
> >> >Author: Nico Pache <npache@redhat.com>
> >> >Subject: fix potential use-after-free of vma in mthp_collapse()
> >> >Date: Mon May 25 07:38:59 2026 -0600
> >> >
> >> >Between V17 and v18, one reviewer (Wei) brought up that we are not do=
ing
> >> >the uffd-armed check until deep in the collapse operation.  While not
> >> >functionally incorrect, it can lead to unnecessary work.
> >>
> >> So we decide to tolerate the behavioral change?
> >
> >Yes, I believe it is ok for now. Either way we needed to remove the
> >potential UAF. It only affects the behavior if mTHP is enabled, so the
> >legacy behavior is kept. And the uffd case is limited.
> >
> >My future work involves further optimizing and cleaning up khugepaged.
> >I'll make this part of the goal too. My first thought is to do the
> >revalidation at every order (between the locks dropping); but that
> >essentially pays the same penalty... I can't think of a clean solution
> >at the moment.
>
> One way come into my mind is add a @was_uffd_armed field in collapse_cont=
rol
> and updates it in hugepage_vma_revalidate() when latest vma is retrieved.
>
> Still not elegant enough.

So our issue is that userfaultfd_armed is at the VMA granularity.
Ideally we want PMD/PTE granularity, but we only have that for wp. I'm
just still investigating all the nuances of uffd and its interactions
with khugepaged (something I've been meaning to understand more of
anyway). But from what i understand so far we actually can use the
bitmap and the was_uffd_armed to optimize this further. It solves the
issue and has a rather small race window, which can just be handled by
the revalidation later on, probably eliminating most of the potential
cases.

IIUC, filling a region with previously empty/zero pages is only an
issue for MODE_MISSING and MODE_WP with WP_UNPOPULATED set as well. I
have a work in progress commit to improve all this uffd handling.

I think what i have is a good middle ground. It improves the current
functionality and closes this gap we have with the new mthp_collapse--
best of both worlds. If the race window is hit, we will pay the
penalty, but that should be greatly reduced. I will send out an RFC
for this targeting mm-new once I have everything verified and cleaned
up :)

Cheers,
-- Nico



>
> >
> >Does that sound ok?
> >
>
> Not sure. I can't imagine the impact it would have.
>
> >Cheers,
> >-- Nico
>
>
> --
> Wei Yang
> Help you, Help me
>

