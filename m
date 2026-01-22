Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CD6378826
	for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 18:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769106334; cv=pass; b=DfK/iUtWIPU0/G4vZvE3WbyKDZOHMMI6BheOnRYPTnxgbJQAjL+PIJMqpvEzxjIC82nuMVVQMzXzNLxGYJn9ZZ0AztbnEzwYjByeZR4Kvx+sa50QC9+6Mw4F0Dbh5Dnvjjnx/M/vGqPyqVdRwuYY4vftlKPKYbci17rpaGRRDHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769106334; c=relaxed/simple;
	bh=WFOd21OrOaTASX4uEQiNxUw/bfAFX0dnX3kSWacS/BI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jH7Qb51FyipN1hzdn+5+3wuBWdd8EA033jlFCaux0xG2wuwHEss4aHZrGcV/bOumx+IafVQovfjOp0bIqU0Xy7amlKs8EPBomjMPMqtMzMATejqjgg4DhCrlXuxbSKkV/pPd+PIPzkpT3U2Mhs3RmelhIkiTtXpd5OB6Ee7IevQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Q8iEFQfa; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Q8iEFQfa"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6581af9c94aso2713912a12.1
        for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 10:25:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769106319; cv=none;
        d=google.com; s=arc-20240605;
        b=eIDAcXyqfYnToJXlAVN1rXvoaxc6uI4MbAso2EbqqhNIkO/kgfgOXfAgFyAAnMVliM
         Ppb5c1SCOxpZ4q/lyTXUyQPuGblEe08dW3S2SoYrjI6YprCfeRZbncpVF/77fsRzsnJT
         Yl1incvGJl+ZVd74gtelQBqsNDt3V2XU8sKS78Z2JiuS6G1daT3UVu84PNlbJZrbqhr7
         S18xXtJ83sxgtBzGVHabV+tnSWKtoGeubL72d9qi+RijHetcXkSrLak/u+vjAcFowKiO
         iCYwzDqQZC9IUll54jCLLcT4xKA1IYRQ1QuycMTtDf8hQplk8M5uLjHQUzTY0A70rOFE
         UoaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sfl+s++fPRdzTiKMIVj4s7ehxijfWuV5r3RCr1G2vIk=;
        fh=e7/qxCNug8bzkh6WpheZbsYIldsOLNwKPjc8DfuqB5c=;
        b=kDXjS4VNXN9LL3BQKSSUwSY66yYdyUJweowgdUgkPQAMNAAjec8U8oqxqAhhe8whKq
         QKhVlhTwduutt5z4TDwxRHj2JkcYgMy/OUSv+GQkxrZVBSJrVB6yMS1SbJe0yfDAjzRi
         7Ohll97ounmRlwxFuCUd5u0Q8hjwYAqMXRaC4ikM/J3XCAV/NR3pOIQaQgYBA7ZHCKQ1
         e2nkhQgJyFuD0Y55N52NTZM3StFLAoWVxF9W74fwNU5GCioJ9xKCjWLVfM16iJDBF0pD
         Xu4Dt8iHGzsmqEaq3D60dgEr6zEHMd+Ta0SqyO00jIlC2ZokpWIyEqcDsTY1/3SSMPsu
         /8og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1769106319; x=1769711119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sfl+s++fPRdzTiKMIVj4s7ehxijfWuV5r3RCr1G2vIk=;
        b=Q8iEFQfaYHLhdIprKd4U40dyiQC2dENg3PO0auDAXdHZrHtu9JGbu+Ue7zP3JM3M33
         tesvzH7ninNGQxxl/NjNRkZ1LyS1k6oMus4p0CPUAD/KO3uRB9b4xydByyTq2ohyELPF
         pdUyM6pLc38KNo6O6Nk9oRtGT7d/89xSwd0DJ3r4W8hUXtkCegek++Qu2kEKM48u1rw5
         gBgoaoM4UeB1B5v1/jZQKyeHYcduMbn3HZOPNie7APglQJ93uY6P1AOW+AKCV2I+zG+O
         HxcBglbag7H0IZFbtcDZ535lDUpxxfk17Cdj/i558mcX9BSrh0eb3qMIumzHw1EAPTVL
         TDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769106319; x=1769711119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sfl+s++fPRdzTiKMIVj4s7ehxijfWuV5r3RCr1G2vIk=;
        b=nfxM48H/XcQb+KBiXb6Vos6HkRrP/8KgF0mHDKUdVjU+oDGBfQcd2Qq0T2LXdzXkVV
         FFcHqCnbt2BvqzGgm+lyWcGIJclTbbxU7OEKYTxLRdxvP8VBn3rY2lxrq/nWqGnPuZoV
         HO6esH6kfvPPxaMIg9+Vv6sudnKStgDznOn96Bcc+xD3JGR+PIRuCpSdRePPo/AJ+8t2
         wzB4GRbHaVKeX7iCCJF6tJJ33jLnh1QzU3I82t6r003OEvxVw1aWoY7bFrdRZyPiz6Wq
         TGohzlIupbN6DUocvOZAlwd9TJsajMPjLZZA5u9bayCx5b+nos+ScobBObycHwISld52
         ZSEw==
X-Forwarded-Encrypted: i=1; AJvYcCXn185OLhsX+0zTwA15oGJ64F8O/vSd8hlWGyR53dOtsNdQX+r7Nn8x24k2Y06LZCPxc/XeUKLXCV8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1SZJlI+mfO2gfOMX8jNRIz1vXVdp0veQ1JAa/9cSFTL0ZxYu1
	HYaqjudgMOcX59e2xgIZ7ykRnF8XYCSLcMIHfZljteL9Xg/b5Pf/W/yXXVlclDhnREVsyPmkxkn
	oAkFtOKL9ZOkkNCxhNwtTkRekkcKfZPEE6PsobsURDg==
X-Gm-Gg: AZuq6aKXptuxmNoXuFdyceIEuiiLeQYtqonDo6ujM1v5d5T9z5SUgE7Ys+kDzvi/nhC
	nvlmVBe6NL+JP3SLauE0AMJwmcO7hmsmYQcYPA/QOnttm78rtpS49wLwgviZg8IMrO+ljXlFYYq
	EF006bP3HtJ/gZmxpczuhk+CGcsV/lBbvjG7h51BsWpkOAY8lplk83DCKGBX13TfZTDZuBiV6Kt
	OY55S/JSzLJ7s048l06odgymY9uZ+KX45KSG4D3SZm4IsYWFvErzjTSoJVUkSScP4kMOpWfyzEl
	LQ7zaawodPfbLV1qo68sebkrsw==
X-Received: by 2002:a05:6402:5202:b0:653:ae75:8d71 with SMTP id
 4fb4d7f45d1cf-658487626b5mr327872a12.8.1769106319440; Thu, 22 Jan 2026
 10:25:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105165839.285270-1-rppt@kernel.org> <20260105165839.285270-6-rppt@kernel.org>
 <2vxzy0lscks4.fsf@kernel.org> <aW_Mqp6HcqLwQImS@kernel.org> <2vxz5x8wcdv3.fsf@kernel.org>
In-Reply-To: <2vxz5x8wcdv3.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 22 Jan 2026 13:24:43 -0500
X-Gm-Features: AZwV_Qi2mnNh0d8uhfT7gi820V4jZHl3-8Ga9SArfokbd4YKFntrUQRwEGR-uHA
Message-ID: <CA+CK2bB18ymLKh8YAyg8O44j5-7ttAfKC-Og-XMg5KQ=O_Xhwg@mail.gmail.com>
Subject: Re: [PATCH 5/6] kho: Relocate vmalloc preservation structure to KHO
 ABI header
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Graf <graf@amazon.com>, Jason Miu <jasonmiu@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 1:56=E2=80=AFPM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> On Tue, Jan 20 2026, Mike Rapoport wrote:
>
> > On Tue, Jan 20, 2026 at 04:26:51PM +0000, Pratyush Yadav wrote:
> >> On Mon, Jan 05 2026, Mike Rapoport wrote:
> >>
> >> > From: Jason Miu <jasonmiu@google.com>
> >> >
> >> > The `struct kho_vmalloc` defines the in-memory layout for preserving
> >> > vmalloc regions across kexec. This layout is a contract between kern=
els
> >> > and part of the KHO ABI.
> >> >
> >> > To reflect this relationship, the related structs and helper macros =
are
> >> > relocated to the ABI header, `include/linux/kho/abi/kexec_handover.h=
`.
> >> > This move places the structure's definition under the protection of =
the
> >> > KHO_FDT_COMPATIBLE version string.
> >> >
> >> > The structure and its components are now also documented within the
> >> > ABI header to describe the contract and prevent ABI breaks.
> >> >
> >> > Signed-off-by: Jason Miu <jasonmiu@google.com>
> >> > Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> >> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> >> [...]
> >> > +/* Helper macro to define a union for a serializable pointer. */
> >> > +#define DECLARE_KHOSER_PTR(name, type)    \
> >> > +  union {                        \
> >> > +          u64 phys;              \
> >> > +          type ptr;              \
> >> > +  } name
> >> > +
> >> > +/* Stores the physical address of a serializable pointer. */
> >> > +#define KHOSER_STORE_PTR(dest, val)               \
> >> > +  ({                                        \
> >> > +          typeof(val) v =3D val;              \
> >> > +          typecheck(typeof((dest).ptr), v); \
> >> > +          (dest).phys =3D virt_to_phys(v);    \
> >> > +  })
> >> > +
> >> > +/* Loads the stored physical address back to a pointer. */
> >> > +#define KHOSER_LOAD_PTR(src)                                       =
       \
> >> > +  ({                                                               =
    \
> >> > +          typeof(src) s =3D src;                                   =
      \
> >> > +          (typeof((s).ptr))((s).phys ? phys_to_virt((s).phys) : NUL=
L); \
> >> > +  })
> >>
> >> Nit: not a fan of exposing code internals to the ABI header. But witho=
ut
> >> this the definition of kho_vmalloc_hdr won't make any sense to someone
> >> reading the doc without looking at the code. Dunno if we can do anythi=
ng
> >> better though...
> >
> > These might be actually useful for other KHO users.

In my view, khoser definition belongs in the kernel implementation
rather than the cross-kernel ABI. The ABI describes the preserved data
format and should be independent of C types. However, this is a minor
complaint compared to the overall effort of moving the preserved
format into the ABI and making KHO stateless. For that reason, let's
merge it.

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
