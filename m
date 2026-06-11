Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634D54C956C
	for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 18:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203644; cv=pass; b=AnKRoHKnM9nQltzU9u+L6q0nqZD5HhbmflVLdeWf/f95Ytl9qwqeTc22L3HtC26LSzFbtB47D93dGmqa8JTkyyinGhMdZglGqzzxSp9r6mtmxZri84APEQ9dhFSRaaak9Yv2NCaNA7BIuf/xzP3Xpq5Si6m/Y3bsu1SUt1NcTk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203644; c=relaxed/simple;
	bh=MrFHJAtiz3l/SoMxwQsRd+iR3vzlfSRyOn6rVwZE7gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l/0QFCOgAWWg6Pz38oaGWEBXyNqr6d+s/4RnAGLs2XAEiupSPty8tZxnivemQq/d+UZ/L61jzeD1Eq5PEldVCdiR0OTApSTIqFyfbFsC/+mTGA+0Hfi8J4hO/oAbOaLJqiOjIvvPHRpNbc39uRbzEqVxMzHiyNeeMYZHqAZaIFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GlOyrWWX; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GlOyrWWX"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51765531803so106011cf.0
        for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 11:47:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781203642; cv=none;
        d=google.com; s=arc-20240605;
        b=Si0ct6uFS7P0n+jQBPl+kgdAEIxuKwHKxkZmtM+l+MSyCAhoeZrlKT2GPuDdmtazWW
         Hg4LP6DuZZe2rWcdRex0+cYpqyKq3uhxupehRSmQdoMC3VvQ8cyMwKUkGjaXwCWR86/X
         AG9TB1gz30kM5DjM0Bumg8oDn7PKKQVfm/7NxZFmfLpE4kAXuAUE4ycJIS686+XQXB6Q
         BMAgYowTMnpRTz616E65E01EM0uvCq+Nz8zdNotrewKjHVXSByQDJ9XNWn2NXvUl/dYQ
         CV1VHe5U2Xozk4kzeCmgZt/buygqi1ipW2GpOj8rKezd9lBY1NQijata4bxC0PiryIKN
         jTnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MrFHJAtiz3l/SoMxwQsRd+iR3vzlfSRyOn6rVwZE7gw=;
        fh=O/dO05ADQ+lFiv7tZ5dHx5rnt5P/dNXvLUm5J7pTC7I=;
        b=fy8q0aa8MjbobKulKqo/twgWzUXse7pYGEt0wHqUXbOK78qZZx0+BgEPCuuVYn9sm6
         XwjAhxpfVHELHTfAbplE56QBgMIuHcI7xOoT5cB0dVG7xkAp/XQKqajMbDkjCbDLJ6p2
         8qr+Kr4Dci4rPOvfLY02/P4AJ8Brtsxp/+LtK5xCJXZ0GKlO3pKgdKdgHMrtYfSduf1F
         fdJKcvCM3u8EGsvp3sDWhm+LpQm6O9MZl9rveQHWMh4JPGXwILinavlS4yG8xo3y6+4/
         XfLlte7Ouh6KKw4H0OKhONQLrCYGud6bnozVUH5FkU+T49XPEqrAVN9J3b4lj7W2zF/z
         TDEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781203642; x=1781808442; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrFHJAtiz3l/SoMxwQsRd+iR3vzlfSRyOn6rVwZE7gw=;
        b=GlOyrWWXyljN57w0qcrCOHSnEEGulh0DSdQKHSXkgJMO18VmFRkrb33ghtMLuUR6h4
         KaaR//NRqeu1LIQWvgvTFx76WEHDAXx50Dp74g0WlagMa1KG0TOd3ZnvohTemqpTQnky
         X2WuLNAUN/WnMlaxn+DdQBUU0PpYoD1T85N40ObuQih5PIhPJL0e0RgrG51TBYS+fPi0
         rBeRa4cEUQy2rw9CwjehyYGysbvN3jNeK7yZaRR16J5UqIynngIpS7v+WhXhhvNMT2kL
         ZRFomvexRap8ulrCfL6u8ZZKSXXVH4GeL1ZiV79lv7n/t9KtzEvHpzPPkOKMQIkjcX+7
         I2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203642; x=1781808442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MrFHJAtiz3l/SoMxwQsRd+iR3vzlfSRyOn6rVwZE7gw=;
        b=sfnNwnHDxdUkw7gabUO1b8Z8RjtW4+SszAidC3/n3epCk6PgnVXKSqPXvF4ycV0EFc
         PgeyskOM2a6XGhDj7oqyWEDZEPpUY1G8vpUkw4QQkMkC/V5gyKyCjASt1tYdNdfs9vGc
         FFyP4bwKNIZ4LtWkp0bzA0/y1YTOYPsH3J0EzT9ufgLoa/Js0v9I7B598Lhn0dxh1WiG
         /1JtzOJEad/WIa8XEV2a3kl5wQDHDCgKY4O/GP4H41yUblsDaM/bKC0xzDkGDuj3vEvX
         x4I8Ko6ndAVeV7ggf1sCbvhtda6Z790ab1zedqj/BQr1yJ28N2D0fFhFlTwM4NNVRie6
         0CJA==
X-Forwarded-Encrypted: i=1; AFNElJ/BJUt19SC59ipRTSta6WIJ1DO2VZjQymGiJT/CqBH3l7KBeiaSoGq+8u7v+jxCLBKeDj6dOXya6U4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAqGupFiq2cx8h/52cyjPmjBn9hqYuNdBenSHrl/scC/5JCBbC
	+IPM+sx/ShZz7D/A2IILOPPM4+FzlqzlHpzOeFDY3dSs1K4SeIKAQEIZ1BzsBnLAmBxpsK3hwik
	8XSHSY9oIygL0SZuVsfJNQLjvx84yklXuYnsTugKh
X-Gm-Gg: Acq92OEzm4PMN8+cjhx62Xr5IkZ6yieQOJriYJhZZ517rTatU955F00J/QfVHPYIcvy
	7VlIsp9VzFbzX07co8ImidZ3KHJfHoMbz20qTvcSgHksVCrHkIcG34CWlNGWJ/X+UGl4BG3LLwc
	171CyvmF8XBToaQtIWiMk3M0o1gY1zwHKOxUpTA2cihK+DbS//HAhhD+tX0ny1QJ7AA1keU8DHx
	2lN76uyeYqrfPN1LOfQBFdsh7GB8rLbb4Gp4Dljhxzst0hvToEtaxCR//7Ws7OIIoW2EL88XFOR
	v1h6fyYdu2ukwk9PfvA/XKh2nXTSlgVlZSP1dhvr
X-Received: by 2002:ac8:7f96:0:b0:517:38aa:c2b3 with SMTP id
 d75a77b69052e-517fb07577dmr1124901cf.14.1781203641487; Thu, 11 Jun 2026
 11:47:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526023515.288829-1-rick.p.edgecombe@intel.com> <20260526023515.288829-3-rick.p.edgecombe@intel.com>
In-Reply-To: <20260526023515.288829-3-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Thu, 11 Jun 2026 11:47:09 -0700
X-Gm-Features: AVVi8CfMS_qzgZKmmT0RbAyGSJmggudRfRKARlOu3o-uoZD12JuItpxRuWOmlpo
Message-ID: <CAGtprH-TzqYbwp0_8ah0VJcccOwHnUz11Ve2Fk8Y-zwqqGFMsA@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] x86/virt/tdx: Allocate page bitmap for Dynamic PAMT
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 7:35=E2=80=AFPM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
>
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>
> The TDX Physical Address Metadata Table (PAMT) holds data about the
> physical memory used by TDX, and must be allocated by the kernel during
> TDX module initialization.
>
> The exact size of the required PAMT memory is determined by the TDX modul=
e
> and may vary between TDX module versions. Currently it is approximately
> 0.4% of the system memory. This is a significant commitment, especially i=
f
> it is not known upfront whether the machine will run any TDX guests.
>
> Each memory region that the TDX module might use needs three separate PAM=
T
> allocations. One for each supported page size (1GB, 2MB, 4KB). The
> TDX module supports a new feature designed to reduce PAMT overhead called
> Dynamic PAMT. At a high level, Dynamic PAMT still has the 1GB and 2MB
> levels allocated on TDX module initialization, but the 4KB level is
> allocated dynamically during runtime.
>
> However, in the details, Dynamic PAMT still needs some smaller per 4KB
> page scoped data (currently it is 1 bit per page). The TDX module exposes
> the number of bits as a separate piece of metadata than the 4KB static
> allocation for regular PAMT. Although the size is enumerated differently,
> it is handed to the TDX module in the same way the 4KB page size PAMT
> allocation is for regular, non-dynamic PAMT.
>
> Begin to implement Dynamic PAMT in the kernel by reading the bits-per-pag=
e
> needed for Dynamic PAMT. Calculate the size needed for the bitmap,
> and use it instead of the 4KB size determined for normal PAMT, in the cas=
e
> of Dynamic PAMT.
>
> Unlike the existing metadata reading code, this code is not generated by =
a
> script. So adjust the comment to be more generic. Also, start to adopt a
> more normal kernel code style without the tenary statements and if
> conditionals assignments that the auto generated code has.
>
> Assisted-by: Sashiko:claude-opus-4-6
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Kirill's comment make sense to me.

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
