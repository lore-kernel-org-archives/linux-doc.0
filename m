Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1F827463
	for <linux-doc@vger.kernel.org>; Mon, 21 Apr 2025 14:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745247366; cv=none; b=tZhkXByRftgMxgWEOCePyXPaRyaqzEpCzBaUdbA+O5L8U0Ll7KPMKIpSaWmrq5IA5hGtxBmb8fY2kr8xPvnRbDZNM+jKXcVNloRw12TPXf9RxKXbvnNQzFF+3Os3yt6mCTsfuLD8eernRJk5w+0b/NZbrgmz7y36qkUlRHfKiSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745247366; c=relaxed/simple;
	bh=ELRmkTdRqMv3QmAXEhzU+df4jLtDbLH6i9rhrVJgjrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ecoO82LpCuZyVH/XFfxhBiwztXyuEdkrahaWgHDsjE/XE1W7TLuUC4JRydg9B+EvrFgJdqTaN/tEKu9aSz+xXKQB8bSD4YopgCN5CxyUMdWmbCH0D98NiEg2uct2iy2eDvvt6CPvowKTUVoe0eiBNeGtPcSq8dotxo98HfXiph0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=f5r1s4EH; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="f5r1s4EH"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4769b16d4fbso21380901cf.2
        for <linux-doc@vger.kernel.org>; Mon, 21 Apr 2025 07:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1745247363; x=1745852163; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELRmkTdRqMv3QmAXEhzU+df4jLtDbLH6i9rhrVJgjrk=;
        b=f5r1s4EHUsSKsKyl1yI0fQHcAxCTZeDS55jthIPbYizhG+niM/IpLvKeSEC1Ikp+Nc
         5ezosHfsIIy2OwIsaPX8ND06iX4MhMQ3PTFV64HGQKVfR7ynOAOMgzgmceD9Y5vJ4GcG
         B/M2ZpV4xvgUVyYsuJwZvf4rM7CKaY51EFRDgC54EtpzGh+6TzJGR8M3U2ce7ja4qrd7
         bkLCSG4/FY/06kK7XdOM33pGGTv/zsND8nBlaBFtIKjvogtGe+EyBvieeDkUmDvBJakI
         Jn7Mcv/fCHPpdlvsgONRRXiff+gcYkoUkt5OupdElIWT51nkCtOhZEDkTX9rJKXHgoPy
         XIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745247363; x=1745852163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELRmkTdRqMv3QmAXEhzU+df4jLtDbLH6i9rhrVJgjrk=;
        b=X0UzWdrXN3uTD23sXs3PzUczf152+9RmaFfOLTsoWeVhIKN4YBR33kFan8Yg6HhO9/
         rrnuErpwOuOi5mfcjFEihBMGt2N8BlarvXRkKIcCLlOZuAqk4vm0ncBtU4qINo3iaeTN
         5V2uxCYvWhU0gTKNjc3VJBhfV7W9s6bOPMRfe56vjhzRPrH+f0kvkl+73sNKMfPNvQgg
         RpLOxaIDKNl6XXKIKYs5fQ3AfPI7jimoVncYoniOVUkw5P7tbSNkng+/ZTyD4MuSOrCC
         rvtO+aQ0JAe55V7PStYqScReKCqwFqqUsvjR/+aDAPrWupOsaCvtqfCuUMmA4vNYxTiN
         HW5w==
X-Forwarded-Encrypted: i=1; AJvYcCUb0p8wAf+kogVTYMnS3KlvfjiMC0V1oB8U3BZ7NDI223rtSA32XBSkXC8F+2htqsKPR4lOn1cDYKE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZpRd+KV3In+hDNxUG5lWvCMIo2fgtUg/YC4CuOFCXUn+6jI/c
	3cvlqGn4+T4KPgzsb97XKa9QN1vpZxahXyGygDMdEID8ypc3mAdqVFZx/vCw6dAfLe6lu8gIHRF
	FSCdOahvC9EVSGMsqVjtYvhfy8q5aaqM7vmPNAw==
X-Gm-Gg: ASbGncuA5reSbMzom+FLVPIbkBA7xyD7pG04bngkMTSxfWyGf15JJEfWRW5UPJdBAwU
	VfAoo5A9yuGowqa05nfoMOiMAHypf3Z/51xEUu+tWC7hUTMh6g1HZrn37m8i6rO9WsvSF4QuWbV
	o2sOehu6wUl9IoDjVZT2k=
X-Google-Smtp-Source: AGHT+IG7rZTE99WK1bHTOSOgL8Ei1b2E10Kh9ByX6KEwCjeK4vA8bx+QufdyTPIfemEXj3xR90xjsvbo9nLMMoN+O1w=
X-Received: by 2002:ac8:5946:0:b0:476:83d6:75ed with SMTP id
 d75a77b69052e-47aec4c3d0cmr197368441cf.34.1745247363105; Mon, 21 Apr 2025
 07:56:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417142525.78088-1-mclapinski@google.com> <6805a8382627f_18b6012946a@iweiny-mobl.notmuch>
In-Reply-To: <6805a8382627f_18b6012946a@iweiny-mobl.notmuch>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 21 Apr 2025 10:55:25 -0400
X-Gm-Features: ATxdqUG02lj5rHej_8Beu9BNKw0fpQPgfWQ79J7N0ZJ28950dBS1dnNGeIj5FpI
Message-ID: <CA+CK2bD8t+s7gFGDCdqA8ZaoS3exM-_9N01mYY3OB4ryBGSCEQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] libnvdimm/e820: Add a new parameter to configure
 many regions per e820 entry
To: Ira Weiny <ira.weiny@intel.com>
Cc: Michal Clapinski <mclapinski@google.com>, Dan Williams <dan.j.williams@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, nvdimm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 20, 2025 at 10:06=E2=80=AFPM Ira Weiny <ira.weiny@intel.com> wr=
ote:
>
> Michal Clapinski wrote:
> > Currently, the user has to specify each memory region to be used with
> > nvdimm via the memmap parameter. Due to the character limit of the
> > command line, this makes it impossible to have a lot of pmem devices.
> > This new parameter solves this issue by allowing users to divide
> > one e820 entry into many nvdimm regions.
> >
> > This change is needed for the hypervisor live update. VMs' memory will
> > be backed by those emulated pmem devices. To support various VM shapes
> > I want to create devdax devices at 1GB granularity similar to hugetlb.
>
> Why is it not sufficient to create a region out of a single memmap range
> and create multiple 1G dax devices within that single range?

This method implies using the ndctl tool to create regions and convert
them to dax devices from userspace. This does not work for our use
case. We must have these 1 GB regions available during boot because we
do not want to lose memory for a devdax label. I.e., if fsdax is
created during boot (i.e. default pmem format), it does not have a
label. However, if it is created from userspace, we create a label
with partition properties, UUID, etc. Here, we need to use kernel
parameters to specify the properties of the pmem devices during boot
so they can persist across reboots without losing any memory to
labels.

Pasha
