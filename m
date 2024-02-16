Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D113134A5
	for <linux-doc@vger.kernel.org>; Fri, 16 Feb 2024 00:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708044737; cv=none; b=XgpvgRIpLK3T2h5E1brkHJoEA9lKK61pz/lQ3Noh+WwoBG+ycwbL+ge6sgW/Nn1iRM/9hHEgtoU9qgtT0ruCmIK8PvS2TSuhg7VOa3ktRLlmEuzzeZ9HS9FAhRORepIqEnLEM1l5Ip4SxOGfhGSVrL0Mjg4p/KfRrV+CvYNc4uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708044737; c=relaxed/simple;
	bh=2xy53qgS2iJInA/5BDMVhpj6cwRaWAAd3dI3MMe55Gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qMdE7SKwaDDDDZa/yIDpbSP7t0QJqSJ0afqZG2fEM3W4jBY6zIkv891zhJUX2XpITLYC8UkS2SQh5HBrVDvls/KVsQssw22QcFTJtT+fR7Igh6f2DTCaY1U8rttFzxb6HLqRe+fy0Rhj/NnnIgXizDIYwcra5k0wRWF16Jb+Sic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=oprrFOsq; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="oprrFOsq"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc74435c428so1387929276.2
        for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 16:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1708044734; x=1708649534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xy53qgS2iJInA/5BDMVhpj6cwRaWAAd3dI3MMe55Gw=;
        b=oprrFOsqJykOmX8zng1ggw/imPDsjP6LsR952+nWuOFcMP55GT6qRXSMZ7iao+wvx3
         WyWo8YOFsZFcykfBc1fpkddIvOIefHY1ew5KhnSwVRbl0cuQLLSe2hdNkrClwNbFQdVz
         ZLLHM901XdhT4Wg0hIMGbVvRCJ7bKVT3BqIkl0n5fsUs2C3jqqmp3uhy74PniTQ/fnB4
         09z3O1C7oi7SXImOFm4B0yvnXfwRFQgvrfLhybhp6hzEyv9sucLkYc3h2hQ7+5nYH3RQ
         xYNOPi4ApnHeUeQNFx/EtYkBrvJMgwZCb+L5Hneoiu4xvljcPp8wH4LVfLea0q6ClKQx
         pMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708044734; x=1708649534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2xy53qgS2iJInA/5BDMVhpj6cwRaWAAd3dI3MMe55Gw=;
        b=G2IzMayP4sjOXF5Zc5ACEqxwrev6Y+UF8CKy5rp1HaPNdt17N3WRD1f/ydaykdkPtN
         cuEXmD58a8995esx4TnWZMSFdQiuHa2ADs4+i6SQyoQaez/KHjMR0x9IMI4aqZ1g/Pff
         yAAMauoJ1pqqb3pkqyLk1nMWbIXsfDT2hRpefjDTlswA+ou7MNLH/vCFdpE9fmcNODin
         a9tZ0d6VfFzIsu+Ut/Z1xRnm6bwKBT8Fy95LvcXm4Wd28PXl8T8SP0+tNbkuBRlqdgbN
         CVbkraU65UYdg6sf28g8ndNYzlC7111p7IB/bAqx9sfqgMqUpvoSCk5+CFPhlxqwpmwf
         jzMA==
X-Forwarded-Encrypted: i=1; AJvYcCU3MEWP08nomuiAmW0Z6m+AcmYOYvwbTkSpqQ/fbQKblpKo41q5HWXnRZJisz22mD21nS0PCjH87UaSp6/0WJY24ymTIY5ffHtH
X-Gm-Message-State: AOJu0YxLFa39cKNUKlmYeQAitrfrDe4US8tSgH29d3Ywp23aEgibeW1V
	w2zjTNz86OljGuDW+2djbCFm9z2GOBvNda2pfaA5/KVLbcjyZfltCW0pr61E/ALzlrzaP82SlEV
	YOuUI8fV6jZ57U0G4hRL01UtInAzvDKXArITTog==
X-Google-Smtp-Source: AGHT+IF9ZHlLR5v29XCimN/Xs8jNPLkvB/7wYRz01k7De6cwDyVRO4dJIc/6HTgOV7JHuNofEVjinUHjv2Bb5KdehIA=
X-Received: by 2002:a25:ae85:0:b0:dc7:4671:8ae8 with SMTP id
 b5-20020a25ae85000000b00dc746718ae8mr2779603ybj.65.1708044734239; Thu, 15 Feb
 2024 16:52:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214225741.403783-1-souravpanda@google.com>
 <20240214225741.403783-2-souravpanda@google.com> <20240215161441.c8a2350a61f6929c0dbe9e7b@linux-foundation.org>
 <CAJuCfpHF=yxV9+=pUo+5DwSjvF=r2y7A9_8LHsUGUSoP7EUNXA@mail.gmail.com>
In-Reply-To: <CAJuCfpHF=yxV9+=pUo+5DwSjvF=r2y7A9_8LHsUGUSoP7EUNXA@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 15 Feb 2024 19:51:37 -0500
Message-ID: <CA+CK2bDH9E_nHs4FVYxuOUcddL_asOTTXHJd1FuVmGfEGNeZXw@mail.gmail.com>
Subject: Re: [PATCH v8 1/1] mm: report per-page metadata information
To: Suren Baghdasaryan <surenb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Sourav Panda <souravpanda@google.com>, corbet@lwn.net, 
	gregkh@linuxfoundation.org, rafael@kernel.org, mike.kravetz@oracle.com, 
	muchun.song@linux.dev, rppt@kernel.org, david@redhat.com, 
	rdunlap@infradead.org, chenlinxuan@uniontech.com, yang.yang29@zte.com.cn, 
	tomas.mudrunka@gmail.com, bhelgaas@google.com, ivan@cloudflare.com, 
	yosryahmed@google.com, hannes@cmpxchg.org, shakeelb@google.com, 
	kirill.shutemov@linux.intel.com, wangkefeng.wang@huawei.com, 
	adobriyan@gmail.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, willy@infradead.org, 
	weixugc@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 7:40=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Thu, Feb 15, 2024 at 4:14=E2=80=AFPM Andrew Morton <akpm@linux-foundat=
ion.org> wrote:
> >
> > On Wed, 14 Feb 2024 14:57:40 -0800 Sourav Panda <souravpanda@google.com=
> wrote:
> >
> > > Adds two new per-node fields, namely nr_memmap and nr_memmap_boot,
> > > to /sys/devices/system/node/nodeN/vmstat and a global Memmap field
> > > to /proc/meminfo. This information can be used by users to see how
> > > much memory is being used by per-page metadata, which can vary
> > > depending on build configuration, machine architecture, and system
> > > use.
> >
> > Would this information be available by the proposed memory
> > allocation profiling?
>
> Well, not without jumping through the hoops. You would need to find
> the places in the source code where all this matadata is allocated and
> find the appropriate records inside /proc/allocinfo file.

Another difference is that memory allocation profiling does not report
memblock allocated memory, this patch reports the amount of per-page
metadata allocated by the memblock allocator in addition to various
paths that are used to allocate per-page metdata after the buddy
allocator is initialized. Also, the memory profiling has page_ext
overhead, so it is not practical to unconditionally enable it
throughout the fleet.

Pasha
