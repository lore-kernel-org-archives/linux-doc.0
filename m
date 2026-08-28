Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5477A3E172E
	for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 20:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787950759; cv=pass; b=rorlP8S5nhCA/VT8F8bCqBcbU6Mlg/F6Hmm4xglyO8PbOSfjVyB8VPmz26eWDqvREvH+N5sZkxp2FblR3J1EG00527v1OqMa1uKRbJv+kk0zG7L7AeVpQFZQ5oUZ1/+02IFMPq7XWTLsVe7iBpVsKKR2/iy0uMTKn7YW3LQJosg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787950759; c=relaxed/simple;
	bh=th9sS0fkvusTIUN5eNH4u0h4op6zM/ybXH1l5XRS+yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=in2TVd0rKsPm4RlmGMu6fGZ7OTUJmPL6QcZqq4RAdBySZIYHx9TCwP3Vncb4i/OfysAX7qH9yPICrN4n8m+LjLKmT75en6k6fyUeGY1PogkE/kxTqhIB4gykQxxhHEYWYLioHUJ85OCYabloFLQM+DI8jCV82IYQTS9DzTi3GXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tEnwFclh; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tEnwFclh"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-52fac937235so21731cf.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 13:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787950756; cv=none;
        d=google.com; s=arc-20260327;
        b=jt0l0EaKn4MuWuYbJJ+czoaj3DB4hQo/0oi7wRnNmt/gckWtvSUkIj8eBXSTlBDu34
         MJwF1XiZNU/jaSRJUZy+QQpAOISu9GUBn2UfK47NNCnkOplSAf6vI3R0wjIcHBuUR6tC
         vcB4dIwf8anmFPSCoaDLQz/2k0ak6/ouy5VsJdcUYOy7cQuZs14rZ2XP2FXSb0vkgksc
         JvmNKzdMotQznB30RJC6RcZ9uWsd1vu7hm3Lh1I6LJiBHBaVR6H0Qz9cDZR8SCN7Tsw5
         VJkyOSyXkolhawtiPDzpIgfosGhv17bH8YtF1AqGZgTKTl5ltwsXGQC3seoNUg0zUPl8
         I36Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=th9sS0fkvusTIUN5eNH4u0h4op6zM/ybXH1l5XRS+yg=;
        fh=0XWUJWcOFMlXhf5mwdEb4IDX7Zy92Ue9tla8ggaqUyc=;
        b=Q6CrzXcZCocUyLQ2HzEN5rkVs3pOJjrljg92zZzHxv07dwz6ukDkfNvvjYfxz3Y4QS
         pQjHGmq9PbD9x6MSCPiRrwtzpEevOtscD+g919CUYlN+9HJKMzOl8bLNfcP37/Jg+bx/
         gAhNK3xB1lGcjmouITnM04CScDIJvILyVpf6w00ciayottWbWOH/L8xh/qkAYrRHqmT+
         xtBtfzV5dQUQ+Dn+KLR0eOBiroRqZJlNgnivxyVaVfTm7MEsbPcaa8Tc7pQy8PeVCYPC
         yuxXZ5ITgRkE/XzUUHMHzYDTr4coU9LsbwH0yAhlMTz5YNH0XkYKNh4Tvpso8eWGxzJ3
         nwGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787950756; x=1788555556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=th9sS0fkvusTIUN5eNH4u0h4op6zM/ybXH1l5XRS+yg=;
        b=tEnwFclhlqyqu+78nKbipQX97BQGXYmCP6EpTkjj4+yLp641Y9evxUlqGAa3is5CrR
         uxIlvSenoCvGikzj0UoLWyOhyJBJZ5iSBsQizW60U0UwaepJWNtU7Ou1p5T9JbZKfJCZ
         W0DM2xaoB8S+QtwxTzNI6/9UD0BzW154Y1tgaswfTDTDeK0E8bfwMMYGFq3ZLD7cXQk6
         GDhgblPW35ho95n7ZpquTDKKTS928ENMELaPpSF4LEqBpVSrGnZ5PagJXQ3yIMNNJJaN
         ZCm9+mwQtIkzHYc0n8Z2XX1s7+Dy8SqLUzk9Llu3xlIJVO+ucpvgTLTD8KDAjTxYCgyr
         40nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787950756; x=1788555556;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=th9sS0fkvusTIUN5eNH4u0h4op6zM/ybXH1l5XRS+yg=;
        b=CRrR1oz5L1ZO9XufAx8HXRdBiUfqcxaopfipciURYPN1AJbbKzBz4vpfE7k1veGYih
         RCkREo4yfYxh9A+Fl4gUyqpDJmPGG1IdFU62bJT+WBusvE0kpGtlD+/DXUKN+HiIOkZ7
         BHPkYceKzNGtZCUEgH+IBd7QwKUUSw/PmKRgtC/75dIWBa/+z0GBRVdm0HPCoR6POUtt
         FyOd0Q0LQjT4un9tkfomIYIhT115PLP2EPm/DaepYYLz391r/SqCN8NYCVLFOqvEVsBJ
         y0KEYU+IauRwkSiCJlHQasO99f8YRduzM981rXyNmfL9NWChpskDMdnzjmpedfbFdGn4
         RvEA==
X-Forwarded-Encrypted: i=1; AHgh+RoGoYPiDVxr29iJr7FRp+62qW0ltU8/SiNBMc7fyyIaRfuY3vPLbuKRWizUR2bGJb37imnqP4KVrZU=@vger.kernel.org
X-Gm-Message-State: AFuF++kpnAbSBTuCjB4Ccx4/PiJvl879dk7SAtWgN1PZJvTIiCV7tq9B
	z/Lo6rmuUAxvCZ/lTttZN56xwlpZT7T+zljWVJvSMbZ6fqdweyL31+12d9tjWd0/dxTMvUYRBXC
	OXBCgG34mHD9uskrq3Zlz7DNdtzRrfFXxfaWyB4JT
X-Gm-Gg: AR+sD13LeJS0hDczBiqbDHhbmd2eISowjM22WfqwzdA6zvpMOkiTunjy3URtam5nv2E
	cOOyphCRO3Scb4HnhK/4IfM2xFK2zEq+TnABT1+fRis6zAYkv4Ae5Mb89fbKXPflpwgTN2W8elS
	TrceMkNcFSZ/RpNldHL6Vlc61JTIkT/5o/zIpgXAkkdq1KloUcT1DVsjy8jJMkCy1Aga7K4ocob
	7vVlMYh4+vxQtPNADii33KXF6csNQqfpOywNLaKt1g7GIEbxSkCOOnelh0t1KOC3hTgqNMqn8Lm
	Ai8phnf7FxH1DMtzPPNoUzPsIYPYHD7yA8WN+CuOuaoH6xupwi9g1OjH0nk+tHYHf7VmqVkVzRM
	=
X-Received: by 2002:ac8:6109:0:b0:52f:9ed4:8d74 with SMTP id
 d75a77b69052e-52ff710cdc4mr3278821cf.14.1787950755287; Fri, 28 Aug 2026
 13:59:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-5-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-5-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 13:59:03 -0700
X-Gm-Features: AcwNN1WI_9DAW_34H7aprFGN9TAhxXzmVTrVu3YrXpEKWiXKUeYdo7vi9R_t0vg
Message-ID: <CAGtprH-Xi8-UGWTkVhNnd1dkmtcnFJsXOsTjr=ijK53aUuH4ng@mail.gmail.com>
Subject: Re: [PATCH v9 04/11] x86/virt/tdx: Allocate refcounts for Dynamic
 PAMT memory
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@intel.com, sohil.mehta@intel.com, 
	Hongyu Ning <hongyu.ning@linux.intel.com>, Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 7:09=E2=80=AFPM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
>
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>
> The PAMT memory holds metadata for all possible TDX protected memory. Eac=
h
> physical address range is covered by PAMT entries at three levels (1GB,
> 2MB, 4KB). With Dynamic PAMT, the 4KB level of PAMT is allocated on
> demand. The kernel supplies the TDX module with page pairs to store the
> 4KB level entries, which cover 2MB of host physical memory. The kernel mu=
st
> provide this page pair before using pages from the range for TDX. If this
> is not done, SEAMCALLs that give the pages to be protected by the TDX
> module will fail.
>
> Allocate reference counters for every 2MB range to track TDX memory usage=
.
> This can be used to handle concurrent get/put callers, in order to
> accurately determine when the dynamic 4KB level of Dynamic PAMT needs to
> be allocated and when it can be freed.
>
> This allocation will currently consume 2MB for every 1TB of address
> space from 0 to max_pfn. The allocation size will depend on how the RAM i=
s
> physically laid out. In a worst case scenario where the entire 52 bit
> address space is covered this would be 8GB. Then the Dynamic PAMT refcoun=
t
> allocations could hypothetically cause the savings from Dynamic PAMT to g=
o
> negative on exotic platforms with sparse, small amounts of memory.
>
> Future changes could reduce this refcount overhead to be only allocating
> refcounts for physical ranges that contain memory that TDX can use.
> However, this is left for future work.
>
> AI was used under supervision to collect/apply feedback, review code and
> workshop logs.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
