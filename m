Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3825426ED45
	for <linux-doc@vger.kernel.org>; Sat, 20 Dec 2025 15:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766243533; cv=none; b=a+jssS+h/tMo3L4CFpWcXHdTwXXWGI9XBr0kaG2qznHVhR4AS189lHqCXXTDg63lxCWzNpDyUE+g4DdJp1ntF6FAHAJZpVnU945+kcY+XcKCnJjij+Ww5jfDitYld6EG2so3HEzszAv6Vx2NdkccY48BLaYIvVwDNiud9s3rb0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766243533; c=relaxed/simple;
	bh=NirtzK3cSKP6Dn8RC3SUqGY+8QtbdDa8PCdCAnfz/Ds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BPtYYbjq7fvvRNkJaEq6lbLo/92M9mx0TJ1tlOFe30fCQxJNm6myd5JEWyAXWXYL7YSL7RZIXPzd7R2HlV+gH5uilmpk6789zaYmitTNc4iVDIPpL/6aIsnlDeOonC+JU+Ipl2SVTjofMNPSsNNPlFEDZL1PXs8BZwDTQOb9wGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Noj6aOAz; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Noj6aOAz"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-640ca678745so4601750a12.2
        for <linux-doc@vger.kernel.org>; Sat, 20 Dec 2025 07:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1766243530; x=1766848330; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NirtzK3cSKP6Dn8RC3SUqGY+8QtbdDa8PCdCAnfz/Ds=;
        b=Noj6aOAzYt7uhz7Gl41awf7Vp7AWle6jgYAwSuDNul8LoW+54IcCgWOTFybp3OGNJb
         70nEqugqtcpfT+1f2wQtFbTpwKUdxSsOmripXXky7mxZF612LfH+e1PjQck46yU+wOsC
         Zr4pCMdc27bkhuD57QRTnwjvHrh3lobbYs65Fa6esUZBwdX5sxdSJVHQqe2zP/GVFf5k
         jkEzWbwbaty7kPGXZjdGokUZtGSpnAlv15f7PwO2O7C4zJyWokaN9GLRge3YxEOeOWdo
         onw+ehWP3XR/eTNlF9AzHdSlLGikVeGniKjjL+2EiCEOVPZjoMOfb1zC3Vno6RfgqmXh
         jDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766243530; x=1766848330;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NirtzK3cSKP6Dn8RC3SUqGY+8QtbdDa8PCdCAnfz/Ds=;
        b=mIaUcNmt1CRtmdsTRS9zU0RhF31rYwkXATh/1kTYf1iRxB0J0PWtSiyyuU4U2TuMtn
         p0Aevzoltw1TwcVTcl0O/LyvDhOllPRi0j4PPE59H6VpoqIo1in2x3GsjO5A8peRPG9n
         fhOkMohofOziAFK//WTluF2zEe1B9gB/GFqG7GhCF5/ZJSbes489qRp0VyqeTSOVp4fY
         pVwI+lF1HrJiETZ3j2lv/SBInUbuuTmaoYtQh3djrGcwjerjMIzA9WzRqBCg2t9DZHpS
         KXB+5z5cKvc4P93Z2G7nq79TAhyv8ehTJoZ/3cjvlbrkXY6FkDYLtiE8Ni8bUSsNF6Dr
         iSQg==
X-Forwarded-Encrypted: i=1; AJvYcCUZNLCx7fN5OtdmzcdrETNM2I1QKI8yHTGSfmMyC80zEiH9jzhTniuEDrW55nBkZ6Whns7vBZgWhws=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Y7wCUZ5gp6h0lFx6o4sbcQDRlF7ZwXwwME8UPkPU63w7ZAWx
	zssRaxA0/GlQtb6rcKVEGd9vkcFGFqnR8ATrmbGMOFXTY9bMTxvW9kkOlcPHzb2ZuStfCdaZ4el
	d6PHxcffD0ioRIbly6ZbBAsKlbVnQqsJ93KkmiCo3GA==
X-Gm-Gg: AY/fxX5nzt9orrB0vFePaPpWluvywwxqCdKtlOt6/AjmTSThIYzZ2TERpsl1TsoyI5z
	l6Sw70Y+O4r6Ai91t7RV8MFhKPIYoK6oM9KOduxg7feBl3x8v3+gRdLrcwMeSp9yAj5QiB/KDGn
	9I3X+rh6Cx9rV+9fhxMHqSn5kM60ky6zpNanGCIBA69Ha4lW9ro8kle57c4aLSRbWSltHfe/YxA
	3jkJOW8dGO4Y6JbIdwNvpyn+qXaUEbGcNmMRjlv25nSNkt4EWrSkSv/1VI8DblmJYvFqa5T/3c9
	MjdDVvF+ea8ldDrXU8VGJIb4XEnpdQRQowGLWE9NjIarEMaX4kbCwdEyHBwwiw==
X-Google-Smtp-Source: AGHT+IG2H0JMzpZ4Rw9d+GSeTdHtlvEwfcgulZM7WmjLKT/BwHOEpNubFax4Xm7riytdiegSHPUBkYePz2N2H5EqPpE=
X-Received: by 2002:a05:6402:34c5:b0:649:230e:ec52 with SMTP id
 4fb4d7f45d1cf-64b8e935a65mr4687631a12.1.1766243530490; Sat, 20 Dec 2025
 07:12:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251206230222.853493-1-pratyush@kernel.org> <20251206230222.853493-5-pratyush@kernel.org>
 <CA+CK2bAV1y_LySjyj-wcn1cdSuVBdC+r+zQL7AQTY64nk3OxuQ@mail.gmail.com> <86wm2hj0ky.fsf@kernel.org>
In-Reply-To: <86wm2hj0ky.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 20 Dec 2025 10:11:34 -0500
X-Gm-Features: AQt7F2rkD8DzKJtnBrRBVjSiNOllvUXl1o05w5fOraa6mNPG1z2m3wrrR9PJQmQ
Message-ID: <CA+CK2bDWF6pbNQRkJFa+WcD1pwUOr3yQdrRUs-mgLWu5ght+7A@mail.gmail.com>
Subject: Re: [RFC PATCH 04/10] liveupdate: flb: allow getting FLB data in
 early boot
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Alexander Graf <graf@amazon.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, kexec@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> > [Follow-up from LPC discussion]
> >
> > This patch is not needed, you can use liveupdate_flb_get_incoming()
> > directly in early boot. The main concern is that we take mutex in that
> > function, but that I think is safe. The might_sleep() has the proper
> > handling to be called early in boot, it has "system_state ==
> > SYSTEM_BOOTING" check to silence warning during boot.
>
> Right. I will give it a try. For hugetlb, this works fine since it
> doesn't really need to do much in FLB retrieve anyway, it just needs to
> parse some data structures.
>
> If other subsystems end up needing a two-part retrieve, one in early
> boot and one later, then I think it would be a good idea to model that
> properly instead of leaving it up to the subsystem to manage it.
>
> Anyway, that isn't a real problem today so let's look at it when it does
> show up.

FLB has exactly one .retrieve() lifecycle event. Once called, the data
is considered fully available and cached in private->incoming.obj.

If a subsystem has a requirement where it needs a specific state
available very early and other state available much later, the clean
solution is simply to register two separate FLBs.

Pasha
