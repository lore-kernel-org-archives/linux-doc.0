Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2927E17E
	for <linux-doc@vger.kernel.org>; Sun,  8 Jun 2025 16:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749400643; cv=none; b=DIfNW1PKQw2r1UNbDsMeW9xtAg1BdA+cL4QSPNSehf5RnVjcPHE4gCsuI5n4u4jsZvLS/xp3KfM7iMLDpHgWvjnFzmsq2pycP3I8FDOqkRUmb6TD9C4u/e9eT2hakv32XUp2RSECGIRaxx6HA12beudA+6sHD7cMzr9UbJqpfdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749400643; c=relaxed/simple;
	bh=Ab5IYEMCSXnjXJoa81zazAM9xrhkF9LpgVvghvLw2Y4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mHQEtDrn84CZNeRzsrFGS3zBc7taAEI8jctp5/HvLqN+TrTmyhAANVa2zPNGngTShaB951tMTLphlwJstikIrOpej2Zpm9jrPZDRGpqTJtdJGOmZHMSL3QBp722tWTV3/AajEu8Z92dY7EI7k1nbifUm+aXhkQqHmE90NjZ/Sjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=AGZODqcR; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="AGZODqcR"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4a6f0bcdf45so16898241cf.0
        for <linux-doc@vger.kernel.org>; Sun, 08 Jun 2025 09:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749400641; x=1750005441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ab5IYEMCSXnjXJoa81zazAM9xrhkF9LpgVvghvLw2Y4=;
        b=AGZODqcRzRvUYYgErAyMF/wGHWUGKSma66FKvYzlB1iX/UFSouRI4RRRwJDThWxWSR
         bQ0ua9ZCSj302JljzkujjHaSWPbs+M9oSDvtrr+/LWKlPrWyuppw7IY9gbCyccSClxVr
         P0pHsjb3i/on/A79jVliW2KMT3fKW5zSiFYxAazXr9NwdRhwHhRAsv89qOkirm1tbxfa
         +8tCjVfsGgX/DxQ/SqI1xW+F45EmerZNITP9yxiLTuZap2mRPqMJYbmeR23zjlYXR31g
         /3V1Za6KGG2OSPA1/wtZow7cx/iwGuI5xJGl65Gd4BfcKhKbZ3XHU/lDXCylsTP6Lp5o
         2W3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749400641; x=1750005441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ab5IYEMCSXnjXJoa81zazAM9xrhkF9LpgVvghvLw2Y4=;
        b=d0IBVq3eNwYuAkPxSEr+lBajBZn6Tvx0b7BeedCCOAEij6xdY7OarnsJZvbToIBWmy
         TqdNInESj3/OxccI1WIvh06xehHYQ1b63JN5IEZkFBEy025wso9nud3xFDHgASq+2Mwt
         vFG+vldx6WbVZD8CA4EySdSU927HT+iqrUHFPmxSQy6ygfrY4vUNYUnGX/1l/k9eS8eD
         fOdOjcMaFYD8eXiPIsLa4Z9Fe3xbZwBQ8flTMWHOWv+XKmNnzZiEEf97s1HPtP1qK0dS
         4x260xcvqwPxaKj2HAZnJ+Nr9da7jzOrKSocHiDqM/vQ2KCqnANmcICrybZVFWGk6AXy
         sygQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9T9rgPC/RqZXNUutBnA0kKT5u93WY/NvIDh5uS9/lNobY/96laBD7/TJYH1OiqNkw3lcBomyoJEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLortzuwIxwaOOWS8JHIKReRNY4B1RrCQ3tcuyx9cRQwT+qWRV
	btrTavhnvy23J0dAXGiQKWhtkKhNgeOLeEt9oEw1/4E9NfggdqA5Hqwyk4XzaNSHoqTAVjyeoMt
	bLRkjEkpNxTr6lRp8oEDn88YTBy6+KdE43v3TlvQZaA==
X-Gm-Gg: ASbGncvk9Zpsjv5XgA6/HVwOujF5+2yYm7RXZuGGfaOOt8ApoTNCWl97OQGNHS4SY1y
	OLcHAXilORx0ByUgt3MNB0hXFUFb+buz58s72NmSfSURAncN8vPlRbJeBW7Vtgrqjr/VKUXgthq
	zTYnAMMrWw724vRXLW2v40Hk8Cp8NRNQ==
X-Google-Smtp-Source: AGHT+IG7TGR/SrekoDc0+onJRf0onfQpl+KhRAPN38op7Z3+HE8nHerXh4JUuGRqCdAEroRR8Wt0dCQLMoLZ0skTHL0=
X-Received: by 2002:a05:622a:2606:b0:476:8fcb:9aa3 with SMTP id
 d75a77b69052e-4a5b9a2891dmr242085871cf.13.1749400641136; Sun, 08 Jun 2025
 09:37:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-12-pasha.tatashin@soleen.com> <mafs0plfirwh3.fsf@kernel.org>
In-Reply-To: <mafs0plfirwh3.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 8 Jun 2025 12:36:44 -0400
X-Gm-Features: AX0GCFuZQeD3HS-9cAYV1p6O4Tqr1uPw5wV4go1oCDGi974z2b27RRui1WzOPv8
Message-ID: <CA+CK2bCnMpRy=wYtt02Xy+R7BFhrY_RsdaZ7X4i+CUASv5Uo0Q@mail.gmail.com>
Subject: Re: [RFC v2 11/16] luo: luo_sysfs: add sysfs state monitoring
To: Pratyush Yadav <pratyush@kernel.org>
Cc: jasonmiu@google.com, graf@amazon.com, changyuanl@google.com, 
	rppt@kernel.org, dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn, 
	linux@weissschuh.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 12:20=E2=80=AFPM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> On Thu, May 15 2025, Pasha Tatashin wrote:
>
> > Introduce a sysfs interface for the Live Update Orchestrator
> > under /sys/kernel/liveupdate/. This interface provides a way for
> > userspace tools and scripts to monitor the current state of the LUO
> > state machine.
>
> I am not sure if adding and maintaining a new UAPI that does the same
> thing is worth it. Can't we just have commandline utilities that can do
> the ioctls and fetch the LUO state, and those can be called from tools
> and scripts?
>

This is based on discussion from SystemD people. It is much simpler
for units to check the current 'state' via sysfs, and act accordingly.

> >
> > The main feature is a read-only file, state, which displays the
> > current LUO state as a string ("normal", "prepared", "frozen",
> > "updated"). The interface uses sysfs_notify to allow userspace
> > listeners (e.g., via poll) to be efficiently notified of state changes.
> >
> > ABI documentation for this new sysfs interface is added in
> > Documentation/ABI/testing/sysfs-kernel-liveupdate.
> >
> > This read-only sysfs interface complements the main ioctl interface
> > provided by /dev/liveupdate, which handles LUO control operations and
> > resource management.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> [...]
>
> --
> Regards,
> Pratyush Yadav
