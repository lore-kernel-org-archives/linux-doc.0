Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5DC31618B
	for <linux-doc@vger.kernel.org>; Tue,  1 Sep 2026 06:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788243684; cv=pass; b=Y+G8c1wgcQ7JbPm48EIuyrVDbkEKYZCgmaAXHHwNBAZKy0mzFpaU+n3JqE0h4TTnKej2ZkODwCyrKx1gQ1Xzgj/zX9O3ykYyQA/ePUWfOuEY+TvYHZ3InKyuQ4XWwhBcGRLtwniHUl0gDWWriRGfjXV20aBUNJHW+7WxVxv/Vy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788243684; c=relaxed/simple;
	bh=I3lSPzdIKrqVH24xSYTfJkxcALnNqxzrGfeYxDEtYXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M0nroPHdCUXAAGs/hXURMgVZc3h8GgphhPfHq0R7rWawigkkdRqMQYeKqHhoTq4yqU1vTlbdSs9Zxo0tor1+QGJOnbyICfMiPp36kZKy6XYISmPq+ZSmFXQtM1Nh8xBEgp6K8/DkzpZX/s7Uu3lzX9EqZJhejkGZrr52gxJUCyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m7XwxRAr; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m7XwxRAr"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso5434724a12.3
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 23:21:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788243682; cv=none;
        d=google.com; s=arc-20260327;
        b=rg8kt8qwREn8dsA0sfNb+bQSPt2amyWpVNHB3SKPAkdUDwLQgfHbzp8FvjPLgC2l06
         psnco/Zgkjf1eZQlV7beSMr/JKvCazwyQTasE1wLGnAAdG+iDoFy9f0kk0bSNuKxN9RQ
         gr7buqeOdnc4E0JNxkQbhotVFtuPusGA+fP8AO4T7O9+App7yAeXZdr2VRjmHYzxcbaN
         oz7d/fGUj1WZ2IsE0PMXVKaBupuZmeshK/6k0lmmla1HFHrxpAJGLIebF1SjenVp8xig
         XolIeKAAocWFFgSXDuRtSgAHAI58j0ZzCPqiHi2fZJyQZ5Tt4teXilrt45Gb6UaVN3QL
         gqqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I3lSPzdIKrqVH24xSYTfJkxcALnNqxzrGfeYxDEtYXM=;
        fh=HRRYw4GgqcYVLQYb6nT1UV8fln/iTP6SvfpP3hYDZrE=;
        b=Szetu7tRRoi+AxvOuq3CqdGNsIUu0eeKWEvw61aNI9HIegC00zuyivqlbsLvoLXd7J
         H5QEMqH0ByY8GcNjoYFxDyIb7jb35LliRP8A1HswmutZzY1GFaBmteTxQfINcYnkvpXM
         ZgieDMdAwx6FI/KR0ieKnscyLIf/dwfLcLPXg1SKXj2GK28x9Q7pWB9Ot28KD94kJtoN
         rF+Cav6ahBj+Xz+6uMMkU7KCr5cgLiLx5g4cFMm0mpw+0pfuo1erVjoEX4g6Wx9ba6Fu
         pbr8n7qMichiNgC2ttRfpaWM2FYmQgvO24Ual/xs+wfEOLyzeUXm2XqAhO2zGYKpAfIY
         jY8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788243682; x=1788848482; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I3lSPzdIKrqVH24xSYTfJkxcALnNqxzrGfeYxDEtYXM=;
        b=m7XwxRArAefMxoydkfuig8zdmevCCo4RtmerQMVrjBV9fKihtYIOJaK3l1lGEK3ib5
         gcvlf6ijpgiMdJW+Pbmy+BxA5v6836IIIJ/Z/r1t8lA50Kbwq4U2yby2YRwvZFxmzqrB
         o4Brj5IAuUp13ZuglvhmegFA6aS3DkQzPtfZqRQBrQFeez4fjNkTYQTW0kTgIAcGNKLu
         DzBPyKxtwKs1i7rhvi5kiKVFis47uY6h9eaLGeYZYNIhjq0lCVVfCY6xM4s1SNld5tDz
         mA8cd0lGrt5ZFPi7kJqT3zO+EtWktfaOyzYdILbCtTeUQ28+MsVobQq5Z9ddJC1ZVQhh
         tSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788243682; x=1788848482;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I3lSPzdIKrqVH24xSYTfJkxcALnNqxzrGfeYxDEtYXM=;
        b=PIJSW/g9UIWpugdt6wWK5IDZV0RyoiiEDTj37ADZSjmRRnqX6fA9oIZ8YT2CmolGjk
         M6zHU6b71VyWaqp4oqVXE4mTAfo/ceQhrItWUxLwSCeWC69CgL8S3DJ2gnj3pNnOlfWD
         rHVan4wKAnBmRZFCqIcGHNhaTiVhG4YlS8gbFidEcBESaNKUB7FTN4EneR8rptpLekJ/
         gaUH01exYaB3jLrJAdX6g8ns8jereiyZvevW0gmhRUV8lYabqZNzHRjPIapuLQJHG3eQ
         ZdZe0pphf0jpQXBNOeoo9mp1cnmKDFTNU0D3FWtTuCS2YNa3+e+4kXnVKsf/LANosAQn
         gfhg==
X-Forwarded-Encrypted: i=1; AKwUvBx2Fos0aRlrW7PiwBZ9HmZf3dbaLQq15JiiAbleHoJBihN1QLB0S5ALqbQuoLtdAkOYYQtR75dkgUU=@vger.kernel.org
X-Gm-Message-State: AFuF++kuspriF5SG9wU8eFfBuXYGRA4o1dcHPf2f/UVNpjPWYjHneKoM
	twmpENwwmUs2JIEPB8BTrdavpCyKUAPrNC9qRdPb4U/ON3dphrFnYJfHxnzW8Aa3SKOdOurPKRa
	NrHZIL6XFfZj4DyBP6y+/lxZIMIx1MpUBY4rbvqw05A==
X-Gm-Gg: AYBFou15gemwtB7l5p6EJ+LHX8W4pwNgmS4Ehn/RVlP6iRelbMFCIyH7XXGt2RkeyoL
	zReGpja9nNh/4aJs8GZ22tOXWINhgQzDI+gIUruEJBpqfY4Sx/5/EAdlWbG1RhXfx9MysrQNz48
	eojXkKZug/oQllOeoykwbmMI2SYV2Tu6t3Qq0jyC6jsPE5cdtW/qQHHg9RUEyHGOZXtJbGmGdNp
	Zm3rpCvP9/HLVhbFw2s6Qf9E/rL+R4scLwjuSt6iUzwmn8U6x/riitWdHqipzWvjXVgf/ybqpEy
	1tkFAGDltyWhWKFqQXuH9l9iCBq72iHcUZ/o4CwcFVfg/UlD5cbL0ecVNhbP8VLqZolu1m849pD
	nr1btX/k/Em9C
X-Received: by 2002:a05:6402:42c4:b0:698:be4d:ca2a with SMTP id
 4fb4d7f45d1cf-6a663ac4091mr3714223a12.15.1788243681562; Mon, 31 Aug 2026
 23:21:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825103855.721013-1-sshegde@linux.ibm.com>
 <20260825103855.721013-6-sshegde@linux.ibm.com> <8262d2f9-9f2f-4821-8497-991d7c8448a3@arm.com>
 <apMziCV_8y0xeIBT@yury> <53035ba4-53ec-4907-93b8-c8b957d1fa61@linux.ibm.com>
 <CAKfTPtA5Bdw89hezn1wi_p0m0dJgJJ1GYg8H93PsvsMC4bVJxA@mail.gmail.com> <apWxmL_brfi4fa4z@yury>
In-Reply-To: <apWxmL_brfi4fa4z@yury>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 1 Sep 2026 08:21:09 +0200
X-Gm-Features: AcwNN1Utuah9bS1-hCxKZcQtbUk5R5Z8_GlRW8ZBL4bnKRqxoMfIHUQt_k9sfL0
Message-ID: <CAKfTPtA4zmD=0Es2cXSHAodTZGLJPvv88s0_4QScp745PxFVMw@mail.gmail.com>
Subject: Re: [PATCH v11 05/12] sched/core: Try to use a preferred CPU in is_cpu_allowed
To: Yury Norov <ynorov@nvidia.com>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org, 
	juri.lelli@redhat.com, yury.norov@gmail.com, kprateek.nayak@amd.com, 
	iii@linux.ibm.com, corbet@lwn.net, meted@linux.ibm.com, tglx@kernel.org, 
	gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com, 
	vschneid@redhat.com, huschle@linux.ibm.com, rostedt@goodmis.org, 
	maddy@linux.ibm.com, srikar@linux.ibm.com, hdanton@sina.com, 
	chleroy@kernel.org, vineeth@bitbyteword.org, frederic@kernel.org, 
	arighi@nvidia.com, pauld@redhat.com, christian.loehle@arm.com, tj@kernel.org, 
	tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org, 
	rdunlap@infradead.org, kernellwp@gmail.com, linux-doc@vger.kernel.org, 
	jgross@suse.com, virtualization@lists.linux.dev, sunlightlinux@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Aug 2026 at 18:54, Yury Norov <ynorov@nvidia.com> wrote:
>
> On Mon, Aug 31, 2026 at 05:09:41PM +0200, Vincent Guittot wrote:
>
> > > Dietmar/Vincent,
> > > Do you think it makes sense to enable the driver on ARM64 now?
> > > Or you think it is better to delay it and once the feature is stable
> > > ARM ecosystem can enable it?
> >
> > It's always better to support all arch by default, unless something is
> > missing which is not the case here.
>
> ARM64 testing is obviously missed.

But the cpumask is already available not like if you need to create a new one
