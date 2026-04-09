Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA403DB634
	for <linux-doc@vger.kernel.org>; Thu,  9 Apr 2026 16:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775751467; cv=pass; b=GaSyzbLVtcwEP9Dbx/00zDj1qoVwyEogHxIaH83ToLZ+a8ODjkfcDXEf4AmRMo2myYkRIoT6uULfcYpmfI7+XV2R4ArSrTqLunBNwjuyf3+GoppNSE1W84Ft6wK1PS5KP+M+L/SUHLhmQ6Bbu3CAZl5l5nso2DBu5JHsFzRptik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775751467; c=relaxed/simple;
	bh=u5xb2RET3ZHjMSQSsb7HWH90tD/uXVXf03fHQr8W4g0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ndRWHRtVnRQltS2cVUtPfTce4TGaZ2lwu64C4s/zn5002/D5z8M7L4nSSjz6yajVvTga2iBkXsjdkKi43RTdAp5Cr7MNzQOzMEuTSmecZZ7rITuwtmpmSMoQPSBpFlZH8gSnXznRBnyfhPndPG0RE3UVXnSLs4RJVe+kY9fF8Yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VMYVwiks; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=k0qz8wae; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VMYVwiks";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="k0qz8wae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775751465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u5xb2RET3ZHjMSQSsb7HWH90tD/uXVXf03fHQr8W4g0=;
	b=VMYVwiksx2LCQVf5Iqm61EKiKMop//f4de0PVro0vMg67hqnFriMNASKZncJjBW01icA+u
	tTQ893h0Rgt+ATnyFvb7u6vFBAyAq6hTt5mq3g/NrCaz9HFpVOPXCr/177RDBbDAgcdc03
	bntzJW8XjKucuFKTDBcFX1/qVtKsPcA=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-I5vUvb02Mo6KsRfITIeKfg-1; Thu, 09 Apr 2026 12:17:43 -0400
X-MC-Unique: I5vUvb02Mo6KsRfITIeKfg-1
X-Mimecast-MFC-AGG-ID: I5vUvb02Mo6KsRfITIeKfg_1775751463
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-649deef077eso1443298d50.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 09:17:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775751463; cv=none;
        d=google.com; s=arc-20240605;
        b=LVV4mBTOXkqaceHFir8Ao/9z4f+BSjHKJ8UOChLUaaLyOEI5qPhYHj98m6m9gk3dlQ
         lr0jVjUH7GC00d2fd8mjBXtVkM13Em8oXaQCt+c9EVaWah0n+YVpTNJVrcuSVhrjenUr
         lVxmbOR96CkKYb9jvnV9tmOwI2OI8wwFrVUxp+NBzzPv8GOSte+hTMfy+9bL9D6ZZBem
         XVfmhfyMSsv+5UslbL4EZrDrmSqYx62B2BRJbg5PIeEr0iflkxOcOiQK47RmMulWy1pH
         Xdju/EMLWOxo2fChQyq+UiRF0F0UoQ4fprkttmGyrYmqSt1XMhFZHx7AmvJzy59H7H/s
         m6Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u5xb2RET3ZHjMSQSsb7HWH90tD/uXVXf03fHQr8W4g0=;
        fh=6RaaVIeCE6/BL0t/9ra50y4n0a2/2yi8jlZ7ENmcYGc=;
        b=ILNyvYvZgG26hsSiBpw7LmS09+G78+epiB+4pO5+h9azZsuTdaLckWUbvXPKVuiLQo
         lNrXiyWFQB6DsfIa6i6TBCvEAJxYezE9bDzsdK7s8beP/KnQz01XER0ugOsnepUJzRQr
         6Fe4p26fmEJzdtVgqcXJ4dk7gpcGnGfgIIt+1f/DW9y5/UikeViSF5uDpJTsfEYLvwgr
         z+UypfqsAzbX9E+khSw0VACYvIp+35Eqd2Kq/dadTVRL3n2e4eNLX/GRkERlbprqy1HP
         Bv8a7a9chz5xKk39/a6EVpF9Obe/VyP54HtkEWTxN1CbJdcax1juWnY/CEl2hkzaIBd/
         eN6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775751463; x=1776356263; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5xb2RET3ZHjMSQSsb7HWH90tD/uXVXf03fHQr8W4g0=;
        b=k0qz8waeI2gQ49wd+HRngRvZ09m3I/AOhg/r54rDffjP3uLn/mVVxemkC88vMf6eus
         w7k6BS0AtxMaXC/twI/BvZGJdvk677A7ZuWj4wzS1032VoZdwZkq3kRFm2cAhJYhx6R+
         A1JP2RpJx49ufP31a9OdcnbXO/JLHDxdyoRxHPrlBjkzriRK7homazeMmqKCbjUer/ZA
         V9osnJrXeEFlLPcz+aY9tRqNqm9GgAw+waeKkmAi5b6ZwrgLGLfc4DKhIrx8EuZlmxlG
         3+g67ahq1yDG06CaqFH1I5UfyGws/n3lqO6bi3mb8Uq2xxMH2jO3swes7Mh8JqOF3SsV
         2zLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775751463; x=1776356263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u5xb2RET3ZHjMSQSsb7HWH90tD/uXVXf03fHQr8W4g0=;
        b=M259uao/IwYhCHp7A2MzwWsrFvU4P0SzVZD2m83C9mVakNDu7cjcjdkd5bNq0qvrxv
         OnzovC/5LGKhZX/3/wU7Yow1v2V/wd7KKg43mehl2p7Du1h66L+ByNQlq2PNEYXQ0FFx
         n3GrRbTr13peQjGP73o62TlGpP4O3iC4R8YRh44kC+A751b3xMeH8sf+LztIp9LudSgi
         LQZMs5PQt9VZY3BxLPhy3MJNHNjajveXfwhcyZ+vn3t5HcTTvw3HEPxXEcTMSka5KbPD
         rHRRfSwu/OtXT77BGmfXTcbJ2a30T3IpXe9vN2OvufPm3/jf+eoF5FbTFcd+n0Im0q48
         uohA==
X-Gm-Message-State: AOJu0YyF/TQHox25VombjrHwfTuh1buApQihfunD2w3yXY7BsMUzsRfW
	b+9Toyb59VImZXOuN1hhWOdpx4Ll+1eeSwdDZkfJKF6Ep5a2ggJ+q96BwAwUyjBU5NvY42ClvFp
	DyE13jzv7yYvIjloEItf/DFiMa4Q3mrrI0uQUKdGkw7rqLKGdtTPYBtsN1kxR4jieYPziaLT5b/
	bxHy/mRZ2pxlnVAKS/0Bqz+CXjn8I9PAqIkhhk
X-Gm-Gg: AeBDiesF0G1ow4V7Qp/VHgtkz64r6Gypfk6xT7lNLiYYVxuaRnhCfGqr3iDyy20ecWE
	coWT0eaSn+mTs6q08VRchg9Y3CJD5EUw2G9jNEFaQ4c3eR7g/aNbYnt7yGptDN2hW7qWTjupSzZ
	q0KCFUTUieuKmLLhu6DfdmfQXl5twslRn40SnSA9MDkGlyo8g8Rw/BI1gw3/z0oysZatvIblAhd
	4w3i6Ac
X-Received: by 2002:a05:690e:11cd:b0:64e:e0fc:a311 with SMTP id 956f58d0204a3-650488b2a89mr24106286d50.66.1775751462337;
        Thu, 09 Apr 2026 09:17:42 -0700 (PDT)
X-Received: by 2002:a05:690e:11cd:b0:64e:e0fc:a311 with SMTP id
 956f58d0204a3-650488b2a89mr24106105d50.66.1775751459745; Thu, 09 Apr 2026
 09:17:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226031741.230674-1-npache@redhat.com> <20260226032347.232939-1-npache@redhat.com>
 <8a4568de-e0f9-471b-bc94-1062d4af3938@kernel.org> <ee39e605-0d9f-433b-9dfa-f70fd92edfac@kernel.org>
 <c4e80668-9018-48fc-883c-5d52a5950065@kernel.org> <CAA1CXcA8nE2PZrB4J1gV5v16PeQ7X2AiwjJ3gO1Q8hW7tyTtPQ@mail.gmail.com>
 <2e3f7c8c-c443-4e71-ad60-36c5203de09b@kernel.org>
In-Reply-To: <2e3f7c8c-c443-4e71-ad60-36c5203de09b@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Thu, 9 Apr 2026 10:17:27 -0600
X-Gm-Features: AQROBzDa3ZlDSyBeTiJ6U3kFPCzeIQ0iT24eqWDzIWH0VQcWacDEzklP5yv7TuM
Message-ID: <CAA1CXcCNLkdjMt=WXgJ1QYSn9WTgN8FVZDQk8E9P=S54sFDSDA@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v15 03/13] mm/khugepaged: generalize
 __collapse_huge_page_* for mTHP support
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, aarcange@redhat.com, 
	akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com, 
	catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, dev.jain@arm.com, gourry@gourry.net, 
	hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, jackmanb@google.com, 
	jannh@google.com, jglisse@google.com, joshua.hahnjy@gmail.com, kas@kernel.org, 
	lance.yang@linux.dev, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	mathieu.desnoyers@efficios.com, matthew.brost@intel.com, mhiramat@kernel.org, 
	mhocko@suse.com, peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, 
	raquini@redhat.com, rdunlap@infradead.org, richard.weiyang@gmail.com, 
	rientjes@google.com, rostedt@goodmis.org, rppt@kernel.org, 
	ryan.roberts@arm.com, shivankg@amd.com, sunnanyong@huawei.com, 
	surenb@google.com, thomas.hellstrom@linux.intel.com, tiwai@suse.de, 
	usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 9, 2026 at 2:14=E2=80=AFAM David Hildenbrand (Arm) <david@kerne=
l.org> wrote:
>
> On 4/8/26 21:48, Nico Pache wrote:
> > On Thu, Mar 12, 2026 at 2:56=E2=80=AFPM David Hildenbrand (Arm)
> > <david@kernel.org> wrote:
> >>
> >> On 3/12/26 21:36, David Hildenbrand (Arm) wrote:
> >>>
> >>> Okay, now I am confused. Why are you not taking care of
> >>> collapse_scan_pmd() in the same context?
> >>>
> >>> Because if you make sure that we properly check against a max_ptes_sw=
ap
> >>> similar as in the style above, we'd rule out swapin right from the st=
art?
> >>>
> >>> Also, I would expect that all other parameters in there are similarly
> >>> handled?
> >>>
> >>
> >> Okay, I think you should add the following:
> >
> > Hey! Thanks for all your reviews here.
> >
> > For multiple reasons, here is the solution I developed:
> >
> > Add a patch before the generalize __collapse.. patch that reworks the
> > max_ptes* handling and introduces the helpers (no functional changes).
>
> I assume that's roughly the patch I shared below? If so, sounds good to m=
e.

Ok cool! Yeah very similar. I was just making sure you weren't dead
set on it being squashed into the other patch.

>
> --
> Cheers,
>
> David
>

