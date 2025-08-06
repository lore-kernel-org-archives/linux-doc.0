Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BC321765E
	for <linux-doc@vger.kernel.org>; Wed,  6 Aug 2025 22:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754519320; cv=none; b=XLiSwCd5PXswyHuHUkje8OgRQIGZH2quNU9zninniGzLlqHhQCYlmkxanCSx9dJk+5xlPs17bIk6j5FNclaqwb4ZcBIrt+u7RgEZSFJA7awmbYEIEZ7HMnBMRMAWeXXquIPNJ9m6+OJbIiaIsI4FDaik8yYgUwi33cuGRCYJH/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754519320; c=relaxed/simple;
	bh=jp5aL9hosoVfsIf/vUTflIwyWNQUTNECZPt4O+fKGxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fC3FuFC8jEwCkMIEDDJaEnkmr17ssRzey0Qqhz5IN2Pfqh87mGIKDZWHHTs0z9H1OUvowBAsnyBcYBgRBes4n84eIUrmtLn6Dq5yXC51icUAj0vZgpF/mzK/LlV3zQyCEvhN+/9PSDFipVcmvxqb8SitOgB9r/NVbdhrURvlBcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=eo30fwtJ; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="eo30fwtJ"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7e7f940a386so25301485a.3
        for <linux-doc@vger.kernel.org>; Wed, 06 Aug 2025 15:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1754519317; x=1755124117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhQ142AcHuDpEckqO7rgr+eVAp4QNMkO6ZcybFE1pag=;
        b=eo30fwtJc3FfmJwRbu1NMdcEcqTZKJWByRpVc9OQJoktmAevqt2uWeqlNSJVhGwJEc
         W/+BR+NeypBV4LA2+rQVcIYO12jMb46CNAKy0tg0lHcr1F2HGWniRsAmovCmtZiuNsFF
         EBX4sEJOHqteOyjr+gVkvWCvoETjFEsHAfGOiI2GtGStR9APNAkEh0/DJog7cvW9QhBI
         ixIslptNWRTPPhlewctV8LM9rhkNS43YzajszMmkisyeGedQQPM6Y/7EgPOkGp5d5Vi8
         LBm1S1eAQsURdAhDPAIgCudSWEDEXmlSuxdu3QsH1tfHTBhRWdkcPc8XqjNVjDIcpgKs
         nkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754519317; x=1755124117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhQ142AcHuDpEckqO7rgr+eVAp4QNMkO6ZcybFE1pag=;
        b=oSWuQJ+N0nfZOuW7VROKNnq2zGxYDhFTLx/DAravZXQGnFFkFjjeZJdM6PfT5q9EtP
         OOyQpotlGCFH3VEtMHCUJYPq4FuQwMB9pgdWo74azjRfdhsEH7s88UVNRrxpe0+5DDB6
         1PALxUODr5S212VASRUlkYkZXQ1MOhgCyMGqP7FnUZOvTKRgAMXjbiWrKpcnPpyWP5K8
         zI0264J7mgmyHW4+ADLhBnNk4Y+qhGMOLY7zjZWHG9lApE6d95HTDCKRYx7/6vjdJ3Vg
         hWLVQdQn69AI10aT9vl7eWNTSqyNxF0GP1apz03t6AlpD1JtFBJO3Cht121sQFuHu3WH
         CUDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWnr86ZkzENTKhYG1bwSVkJddeluPQRgVTW31y7aENhXD6LOIM9PY6CB28cRtoWKhP1zqarzlLdos=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDodn186M6WsoaIa/9C+pUeiiuG0MevImU1vMEkyBLNBa9wT33
	ZNI+81vAtKfJ3G2/NFc9VSXg/FEuENICFNkofavtvwC0HBu/MoDwdrHTIqkDb7TC9gdmx4JBsq8
	LLijZmSQgBmgWBmGNZ+AnIZMtkDKFqogdT0aCN5FuJg==
X-Gm-Gg: ASbGncvN3nrdPVBsj/EpFCi8jq9ndW3Bw1S/2vnqXUquR/rQmeoqfPWEybZasyjsbXW
	PWojlQRX22AA3OcRAB3+d2yVXpXzR7FVY/+ktSQRFWQT/aPe4WpxBGNldg98hxsfLhYDcznU/zX
	Cz0rFDpIsywFOXm21hrbIBit2sr+82LrwOgkV2GqWbWTsPTgWSl1M4TspuXPYbpO7x96WsoUXlF
	lrN
X-Google-Smtp-Source: AGHT+IGj0vOgYMp9T/0JmW5XllWs9eR8q77wvB4/2/eB5UfznGaAzPWexivE55P3uc74jC/GyDuncjth4cnA3wVQmDo=
X-Received: by 2002:ac8:5889:0:b0:4b0:695d:9ad0 with SMTP id
 d75a77b69052e-4b0924e0f3emr47887021cf.3.1754519317270; Wed, 06 Aug 2025
 15:28:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723144649.1696299-1-pasha.tatashin@soleen.com>
 <20250723144649.1696299-11-pasha.tatashin@soleen.com> <20250729172812.GP36037@nvidia.com>
 <CA+CK2bCrfVef_sFWCQpdwe9N_go8F_pU4O-w+XBJZ6yEuXRj9g@mail.gmail.com> <20250805123103.GH184255@nvidia.com>
In-Reply-To: <20250805123103.GH184255@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 6 Aug 2025 22:28:00 +0000
X-Gm-Features: Ac12FXzz6aElzLLHqZjWxK5H3LOARobpBSmk1rsUp_q_uPWZt7Z5vxl_KzsDWdA
Message-ID: <CA+CK2bCeaH_Lesyr1G-Ur0eDb9HgKqOYgTu=vk=wrpZExMrWuA@mail.gmail.com>
Subject: Re: [PATCH v2 10/32] liveupdate: luo_core: Live Update Orchestrator
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, dmatlack@google.com, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, zhangguopeng@kylinos.cn, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org, 
	cw00.choi@samsung.com, myungjoo.ham@samsung.com, yesanishhere@gmail.com, 
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 5, 2025 at 12:31=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Sun, Aug 03, 2025 at 09:11:20PM -0400, Pasha Tatashin wrote:
>
> > Having a global state is necessary for performance optimizations. This
> > is similar to why we export the state to userspace via sysfs: it
> > allows other subsystems to behave differently during a
> > performance-optimized live update versus a normal boot.
>
> > For example, in our code base we have a driver that doesn't
> > participate in the live update itself (it has no state to preserve).
> > However, during boot, it checks this global state. If it's a live
> > update boot, the driver skips certain steps, like loading firmware, to
> > accelerate the overall boot time.
>
> TBH, I'm against this. Give the driver a 0 byte state if it wants to
> behave differently during live update. We should not be making
> implicit things like this.
>
> Plus the usual complaining about building core kernel infrastructure
> around weird out of tree drivers.
>
> If userspace wants a device to participate in live update, even just
> "optimizations", then it has to opt in.
>
> Frankly, this driver has no idea what the prior kernel did, and by
> "optimizing" I think you are actually assuming that the prior kernel
> had it bound to a normal kernel driver that left it in some
> predictable configuration.

Fair enough, that subsystem / driver should simply participate in the
live update process normally.

> Vs say bound to VFIO and completely messed up.
>
> So this should be represented by a LUO serialization that says "the
> prior kernel left this device in well defined state X" even if it
> takes 0 bytes to describe that state.
>
> So no globals, there should be a way for a driver to tell if it is
> participating in LUO, but not some global 'is luo' boot fla.g
>
> > > +       ret =3D liveupdate_register_subsystem(&luo_file_subsys);
> > > +       if (ret) {
> > > +               pr_warn("Failed to register luo_file subsystem [%d]\n=
", ret);
> > > +               return ret;
> > > +       }
> > > +
> > > +       if (liveupdate_state_updated()) {
> > >
> > > Thats going to be a standard pattern - I would expect that
> > > liveupdate_register_subsystem() would do the check for updated and
> > > then arrange to call back something like
> > > liveupdate_subsystem.ops.post_update()

I added another callback liveupdate_subsystem.ops.post_update(), which
gets called on live update, just when a subsystem registers with LUO,
because that is when we know that it is ready. I will send the new
patch version soon.

Thank you,
Pasha
