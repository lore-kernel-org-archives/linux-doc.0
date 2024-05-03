Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159132C69D
	for <linux-doc@vger.kernel.org>; Fri,  3 May 2024 21:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714770035; cv=none; b=OMeUURKM3vbboz9x/AaghLNCrMEO2k/PIqrZKCjF2Q9RgKUUOd4e3/slK1iP1UP0EnPfpdpwYxy+rufkE4/oA4L6xiiXnkfi8n7Cdw9hfZ9oHT4jRINS//lTYVbP1+/G9VvbrveJmLgfOLlWqtYAT1HUduS6K4DLCgLJi/Wj0lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714770035; c=relaxed/simple;
	bh=cjuvDeKp4X9JIYKyqCJmxX+PFjcdi9fQ1jJZtd6qw34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SevdeT2bNSbXLJbGD9OwXSpGTFNDU5ySsZ/T9Rd4U7JROYxeZSm5eSbH6yZ2HzebhNDIi8kjZko9mEvFpEeL7AL+eBrTCUga24zBaAh7eQrhS7KDpGWcErRGJ67dbX4tGJFsG7qoYr1KE4Uhs5HsQoOHtFtws+/sVZip3TV86sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wiLoik8x; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wiLoik8x"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-439b1c72676so29301cf.1
        for <linux-doc@vger.kernel.org>; Fri, 03 May 2024 14:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714770033; x=1715374833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjuvDeKp4X9JIYKyqCJmxX+PFjcdi9fQ1jJZtd6qw34=;
        b=wiLoik8xf1dL3rDpgOfkuFX2Y91V1OdgA51BT7QYAS98Op8s2BaTJGLGdxEzmXy+ZR
         IQOMZynMaNR7/wofcso8hMQO26OVe7ZKtO9tjAJmKMHhuajeG7DrgNLndlxxO3/MBoPd
         cpqkmpOxpo6HQHylLUxeyK8/+gV8dxjF26VDh8on8qXqnfUE4/3Z0ajdJYpNeld62r4M
         rEGfeeneLPG/xs0v054Ff7bhg6EIbhdmp54zJ62ksmGS9upUGQ9A1w7C6QzfiZ4+kkuY
         BtINllx3u2e+v9gAhBT7FQMfmzkoF7AZJQEL+eqK+InIoJYGf6ITcOUK1agkz/a1Vb5h
         TkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714770033; x=1715374833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjuvDeKp4X9JIYKyqCJmxX+PFjcdi9fQ1jJZtd6qw34=;
        b=lLKNpyGYtW78qhLny+YMDlJEyeEEWuIPlYCnKKAawRN7kqJ0dh9qkT12GZRUTad9zt
         N44v9Y5z2r7re4xZ6YVgR5zKiwoy6OZAUwOCBNqAmJllSvBQM2UHA/vqQtYNOsED5Iik
         in1kVMgVIH2dcoS7K+X7HfQ8vEh95PtDQajPBY0uGWqI+e2WT6kBPCqMDYTd5Kl8ihI3
         yTBrtv3er8qGVZhEkJGpwknARZ3UNm8r9/vrA6kX5DdXZp7bl9QzG5Fs/afcocpWjkyk
         K1JguSBFfuYSswZ0V2xc3iJRKFIgTE7nv0svhV1reCHBlywPlzay7hsn2pVx/p2jYA56
         kYWw==
X-Forwarded-Encrypted: i=1; AJvYcCXAsRvtuAnIOzEmk+H67cZYjd3C6NaLatU/Mi4UZKXRIvt+8jYNJwBIDJK+Yj1cQwMbonHlNXboPRynm3K4hqbpaL/VjLK9kdhA
X-Gm-Message-State: AOJu0YzKaXByh2PdeUCr8memoxyFU4hfAN6ed/qX6dZ8y4ArYGRKN/uz
	qQl0UpykC/K0odjcU8betBsLxZEsa4Meu+wmDITR7wTaWDnobNEHsDSRIZ0q8N94Uerwm6ibq8v
	aaS3evYjhiwnqbIChnmunAyiq9QdU2hVJTT2a
X-Google-Smtp-Source: AGHT+IEIGy4nqYGH86PDEWSQhg7IkncqGap7dmwBx14xP6Jh9GdrFdigevbJYYU7UTVaEYBgRYxv/BBebFRnyTDfMVY=
X-Received: by 2002:ac8:7d01:0:b0:43b:43c:2e05 with SMTP id
 d75a77b69052e-43d088fa520mr98671cf.19.1714770032856; Fri, 03 May 2024
 14:00:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1711674410.git.babu.moger@amd.com> <CALPaoCjZ3oLdKymJjASt0aqtd0GGOme7LavvYOtPYTb_rA-mYQ@mail.gmail.com>
 <b35dc4e9-7e8b-42ed-9a51-ae50d521cf4b@amd.com> <CALPaoChxYoJx8eR48EkSKf-hu2p2myQJLZEhj_Pq6O4R15-=5A@mail.gmail.com>
 <6edffe1b-e9a9-4995-8172-353efc189666@amd.com> <ab2a6a4b-3740-47c6-9443-e6bb7a0c1adb@intel.com>
 <CALPaoCiYFKeASPMDwzzaHLw4JiMtBB6DTyVPgt0Voe3c3Tav_A@mail.gmail.com> <b725e4ca-8602-eb26-9d47-914526621f52@amd.com>
In-Reply-To: <b725e4ca-8602-eb26-9d47-914526621f52@amd.com>
From: Peter Newman <peternewman@google.com>
Date: Fri, 3 May 2024 14:00:21 -0700
Message-ID: <CALPaoCiu2_UHyGjsyitz28BL1N93TSn28E1r-6nhXg--bzmU+Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/17] x86/resctrl : Support AMD Assignable
 Bandwidth Monitoring Counters (ABMC)
To: babu.moger@amd.com
Cc: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net, fenghua.yu@intel.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	paulmck@kernel.org, rdunlap@infradead.org, tj@kernel.org, 
	peterz@infradead.org, yanjiewtw@gmail.com, kim.phillips@amd.com, 
	lukas.bulwahn@gmail.com, seanjc@google.com, jmattson@google.com, 
	leitao@debian.org, jpoimboe@kernel.org, rick.p.edgecombe@intel.com, 
	kirill.shutemov@linux.intel.com, jithu.joseph@intel.com, kai.huang@intel.com, 
	kan.liang@linux.intel.com, daniel.sneddon@linux.intel.com, 
	pbonzini@redhat.com, sandipan.das@amd.com, ilpo.jarvinen@linux.intel.com, 
	maciej.wieczor-retman@intel.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, eranian@google.com, james.morse@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Babu,

On Fri, May 3, 2024 at 1:44=E2=80=AFPM Moger, Babu <bmoger@amd.com> wrote:
>
> Hi Peter,
>
> On 5/2/2024 7:57 PM, Peter Newman wrote:
> > Hi Reinette,
> >
> > On Thu, May 2, 2024 at 4:21=E2=80=AFPM Reinette Chatre
> >> I do think ABMC should be enabled by default when available and it loo=
ks
> >> to be what this series aims to do [1]. The way I reason about this is
> >> that legacy user space gets more reliable monitoring behavior without
> >> needing to change behavior.
> >
> > I don't like that for a monitor assignment-aware user, following the
> > creation of new monitoring groups, there will be less monitors
> > available for assignment. If the user wants precise control over where
> > monitors are allocated, they would need to manually unassign the
> > automatically-assigned monitor after creating new groups.
> >
> > It's an annoyance, but I'm not sure if it would break any realistic
> > usage model. Maybe if the monitoring agent operates independently of
>
> Yes. Its annoyance.
>
> But if you think about it, normal users don't create too many groups.
> They wont have to worry about assign/unassign headache if we enable
> monitor assignment automatically. Also there is pqos tool which uses
> this interface. It does not have to know about assign/unassign stuff.

Thinking about this again, I don't think it's much of a concern
because the automatic assignment on mongroup creation behavior can be
trivially disabled using a boolean flag.

-Peter
