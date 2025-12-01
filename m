Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF5C18A6B0
	for <linux-doc@vger.kernel.org>; Mon,  1 Dec 2025 04:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764562454; cv=none; b=IPYo+WOkBC6WCGczU9eX4QNcAU9HOQoREFSoxRi8GCFHqm4AO4sQFJ+AGBRpkEA7nj5Wn7r2F3+q59PSqBBXsCfwAGfuXk2j5C2F56ODvEuQ4IH9nEfgA32yWbYoFKJCdZBXF2clmwFmYjw5TytF0UqOuHOaM/UwolnrHea/s1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764562454; c=relaxed/simple;
	bh=GrynxDa76JNyWfJyi18gAXK2VCIZSuhzCnXy1qCrIx8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=CEWftQSdQaQKFfngF/yq++1F0U7a59GVqnWZeluCnFihEqcTCwvwll/TiRZ3XF+VTSgOXp/qIJRzANIMwIp/PatF07TsTrRIKTZuopFenvMBqnHhHTsGLv9pHy256yi6WAM3/WMTgw3y5DJ9rBpe6emj4C7Wx8puWwiI5ShkyWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGKWr4Wg; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGKWr4Wg"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-93c6d160fbcso2390646241.1
        for <linux-doc@vger.kernel.org>; Sun, 30 Nov 2025 20:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764562451; x=1765167251; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvqfHUMOZNX470bp1dryFycFk+/R03rrhA62xaGfUj0=;
        b=LGKWr4Wg2zcts8f8rlH+QrcOHpHOVmVbaV4+fxSIP9EfNGYbHPSdF4rslaqLdDWx1I
         NKybafVahY79vdtjrcLZCQu++8Wxro5NiD5d2bUzfpnWmlyJK8BR5LH7QQhHCw5wklFL
         2wftigQ/cIYWhuxur96qHyyI9CObfYuq8JJgagKUK4Bw2Qp/7VDifkH+kBLo37uJShpE
         8Y2Oa7KnQB/mSRO54fzMr3KOSybdE6HEADQlGtT/XtRWm9zXQ82PRK+uJZWigGxdALk8
         vvI1Xu/uwUUXj5cjuFG4eHCeQpERcXDPKzD19OV9Fvyse2ks1kh0mHe0WwVX27xbMk7B
         C3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764562451; x=1765167251;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NvqfHUMOZNX470bp1dryFycFk+/R03rrhA62xaGfUj0=;
        b=omDbiABp160B2/LpbImTSwuqOKO0t7Sgh8bXn30zD5cKiRoKQVQ9Rhu580Oy3t4ry7
         mglN+RYXgaewa4SAICVRrAqQyqpbLbKPDPDDhbfS25KwZMr3X/UBlnWDk+xAprtbjDOH
         bpQxy0Pzzr4uGz3I4hlAUGGQDRMfPcvQ2DsxlNUeo281MohbrKIKl56X21ZornPmf7Aj
         QfNEPV2T4q+BWd24ZNupmJocycCepsuiyQfa43s6Ts8Jv7dOJ6e6U+2D3kLp3+9QRhpX
         A6VVUIkESFPdfHDjgnBJ6C5iKMXYmuZ0GBGSNVP0wsBXdR20M3lfkg4VWP/uDeYdyeg6
         mzMA==
X-Forwarded-Encrypted: i=1; AJvYcCVqQRURhc+hEze/Owc+ESnqFErVPPMlkZB8u/rbHwjAH/+MT2Nii3pOGqGArUgvFQhf6ZW2eKHqV5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi/NwgOa8zD3SZOT1HHeyFKnJ1ObGLD/8ew8xG3RkXsBpHjiXr
	rVqujgTeYcxlJNLOL7gy7ryfVSs3NveZf6qNWy46gvRiCrAFYQOMsdqeL+dJ55fDzqgMAmem2xD
	78aJraBAseGd/DHl4ev6Kf3GwOuGWx8g=
X-Gm-Gg: ASbGncv5cT8fXCSIR3sYUFHji6NPvIwyXDv0oqb2odYAVEHPYRBd7W2HwFuWFJFqqjw
	7FI4L3xG5Jji1ofb6m0avrPYwANOaU/IbxRNK+MzqoJUGSsamhbRozJDtTY+bc85HOuEdAFRltr
	nFBaXFu2NegJmsqx46FYxYTlbkTFNp2RKSQafWScjPA9GdxUX2JO9/mV6Nkxfh0a6ztDQYLm0+z
	Jey5wZyzVdHXNIFmyjUcmQmpqUJkgxk9QjC+q1qsC4JkNCSpRjcDL0P0r7B7pMoOz7Eqg==
X-Google-Smtp-Source: AGHT+IFQFaTlSgrkPrDF34ZzuXXc6tRWv7IWzSI1FLwFBEaeyfWtvk4amHL87+8261TG5sC/U7niA6iwfCoFudViaSk=
X-Received: by 2002:a05:6102:919:b0:5db:f15a:539d with SMTP id
 ada2fe7eead31-5e22423f36emr8227948137.7.1764562451234; Sun, 30 Nov 2025
 20:14:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128025315.3520689-1-wangzicheng@honor.com>
 <aSm800KsCAptVZKu@casper.infradead.org> <ti7h5cbrg5s3zf7surof3zmxb6supnl34x7hsbziqutm7r2laf@zuunap5hwsbx>
In-Reply-To: <ti7h5cbrg5s3zf7surof3zmxb6supnl34x7hsbziqutm7r2laf@zuunap5hwsbx>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 1 Dec 2025 12:13:59 +0800
X-Gm-Features: AWmQ_bnCsLVtTt2xe_A-3mmx3kROTPC9EO7s9FoipJAT7VnWafh4GCqMSpp-xoE
Message-ID: <CAGsJ_4xJ5qMght93FQOYrk1OiJTh-wFC4e8Nd4K0A156N3ZEBQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] mm/lru_gen: move lru_gen control interface from
 debugfs to procfs
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
	Zicheng Wang <wangzicheng@honor.com>, akpm@linux-foundation.org, hannes@cmpxchg.org, 
	david@redhat.com, axelrasmussen@google.com, yuanchu@google.com, 
	mhocko@kernel.org, zhengqi.arch@bytedance.com, shakeel.butt@linux.dev, 
	lorenzo.stoakes@oracle.com, weixugc@google.com, vbabka@suse.cz, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, corbet@lwn.net, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Liam,

I saw you mentioned me, so I just wanted to join in :-)

On Sat, Nov 29, 2025 at 12:16=E2=80=AFAM Liam R. Howlett
<Liam.Howlett@oracle.com> wrote:
>
> * Matthew Wilcox <willy@infradead.org> [251128 10:16]:
> > On Fri, Nov 28, 2025 at 10:53:12AM +0800, Zicheng Wang wrote:
> > > Case study:
> > > A widely observed issue on Android is that after application launch,
>
> What do you mean by application launch?  What does this mean in the
> kernel context?

I think there are two cases. First, a cold start: a new process is
forked to launch the app. Second, when the app switches from background
to foreground, for example when we bring it back to the screen after it
has been running in the background.

In the first case, you reboot your phone and tap the YouTube icon to
start the app (cold launch). In the second case, you are watching a
video in YouTube, then switch to Facebook, and later tap the YouTube
icon again to bring it from background to foreground.

>
> > > the oldest anon generation often becomes empty, and file pages
> > > are over-reclaimed.
> >
> > You should fix the bug, not move the debug interface to procfs.  NACK.
>
> Barry recently sent an RFC [1] to affect LRU in the exit path for
> Android.  This was proven incorrect by Johannes, iirc, in another thread
> I cannot find (destroys performance of calling the same command).

My understanding is that affecting the LRU in the exit path is not
generally correct, but it still highlights a requirement: Linux LRU
needs a way to understand app-cycling behavior in an Android-like
system.

>
> These ideas seem both related as it points to a suboptimal LRU in the
> Android ecosystem, at least.  It seems to stem from Androids life
> (cycle) choices :)
>
> I strongly agree with Willy.  We don't want another userspace daemon
> and/or interface, but this time to play with the LRU to avoid trying to
> define and fix the problem.
>
> Do you know if this affects others or why it is android specific?

The behavior Zicheng probably wants is a proactive memory reclamation
interface. For example, since each app may be in a different memcg, if an
app has been in the background for a long time, he wants to reclaim its
memory proactively rather than waiting until kswapd hits the watermarks.

This may help a newly launched app obtain memory more quickly, avoiding
delays from reclamation, since a new app typically requires a substantial
amount of memory.

Zicheng, please let me know if I=E2=80=99m misunderstanding anything.

>
> [1].  https://lore.kernel.org/all/20250514070820.51793-1-21cnbao@gmail.co=
m/
>

Thanks
Barry
