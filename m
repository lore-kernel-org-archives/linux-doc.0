Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E1921E087
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 00:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763081610; cv=none; b=PKu7+zubQQYFYXHlMta8IOz1srUy9Z1A/c7C+rTktIZ6pQh5NLkyc8H9lmS+rjpm6YjceEwjy3vKz8h2OYOpksqv4NChNHKJI2zaeo2ctF+FXM5KjAlqt5vIIQ6eDYX/6V6tbuIiY5Ud8iWF9LEOj/3oksT7TBI1IM5ejA7MRsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763081610; c=relaxed/simple;
	bh=sk2uMggCq1ckhCBdGx9muJo7+MWiHKvDO30mLbByhn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CiHXGtjgG0UP5U4ruizbHmxY3OvjQzo3q842dEiOcRYQNng5Koc+Z65SaOuq+rI29rubKhnEU35B+gV3Oo7m2ahvI0j0rjXwAl9RN6Iq8eyMJHCKhC0Z1ID2mYMyMoH9deSyzoT9m/jvdOmW6a1WpeuvF/42F7YlxrRNSEcvk7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FYewPZaZ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FYewPZaZ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4770d4df4deso15295e9.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 16:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763081607; x=1763686407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sk2uMggCq1ckhCBdGx9muJo7+MWiHKvDO30mLbByhn8=;
        b=FYewPZaZnXJz+oeofuFC+cW8dJW2Cw9bTYXju3ALNuURgkGkEUjkc2r1JdJO/yY06D
         XCpMXFM76mHmg9RSDohlps9BzQxwDZTcsuQ/91+zyg5v7IHjC6oWIsdH1CCRIsGrSExd
         VqmqdAbdWLM/Duz3fydlAeJ2P2z52viqthm3Q/skGQw6YfA81di0o9aocCCJBaXyYI7m
         rd3FBwMzDwENc82rXnhjncLLkmQCXX40bGXmQZZcSm9baNWZtnpeBg/ianCfHzVf20Ax
         luYw7vfPL1tQlKp4ebXMt4nnLdfP4d7jwr9ShfSljaLcjWLMwEFsHxn43Ski7F/ukW6S
         trGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763081607; x=1763686407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sk2uMggCq1ckhCBdGx9muJo7+MWiHKvDO30mLbByhn8=;
        b=LCqSdrCkdfA/GRbN5LqNyA7m6rlVF/RjImVjXQOqUm9YJzw4b5Lf/piOwAdJbSGSyo
         hLkwuGq+VDuUS2fbZ0m7UHeMl91IvAHW59T9yMPZ3aDwYiWB0gt1XWixkEkSLl1pYSSl
         onthShJVlI/ES8WJzOH2apWvxS0rwolpZgCuE1E8anQR0cUkNU8TSg61Pg1uP4LlHUy5
         ZXc/bZoFwfborKPRWYhZ16Eunex/lA7huevUrvvMCzvvFlRBYsD4FIJt7jNT9qDsldC3
         5UKu7grP1oxI0X3JLsczgS5QgxBHTCOckqSs1x+h87xRl/K0Z5WqyP3GJ/HUv+71HqbO
         3utQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEwz1P9vG+1FseLaOTUIzwDl0KZxmUJX3uY5XqCwOhXO8qeFRnwLMHZHPCVolQnrfHRrKTHoNyFPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRuueqnoYYUTdmMLi9vH4yiUUyDh57zl3xv3GlGgk2nn5SJaOt
	QYWy0QeYrOBc2ZBJS9GylebJ0V2ES5jbNWDRHFjqEw3DWFw1MuzrFug5w+vUhIEgDeDhcdn8+4x
	suvPf/KX57HkQs0vI0rYYF84iyPmmtiGb4kvnKpA9
X-Gm-Gg: ASbGncsCrk8Yphe/LRslD0kSk6HhCRlDOFC2+0dWQ5WMGIF8WNg+xZ3MerO61q63gve
	FAGvbnjFg/zTLTnhpvBUaWKrw20k3okWO0cCr7oxdiRuIEgifcUEChSV+AOj+YxnMDliZmPRX2X
	jxMfmms3R/NLwp5Cr/l1V4oXaDwdRYWcNSA3Wbe+qTcbWXFOnrwrFsyN42fbV6uNtJg6njrTvzy
	ADOHMzClX7PDadbjamErCfiAiYq6s9/ii+Cukl8QLY2lqoNUAwzmu+yaIeFf1AOR6ZtfglN3bdJ
	uJ8PfAYi74YqbkTk5yygitR5Kg==
X-Google-Smtp-Source: AGHT+IE3vstJm3oWP95qkqRJjs5fszSUCVzNUiug16EQF/JXNPVFpZq7hEiC3L8y9CW/kpoGUurTym+p6tSTb8UVNrk=
X-Received: by 2002:a05:600c:a20e:b0:477:86fd:fb19 with SMTP id
 5b1f17b1804b1-47790b10751mr266505e9.9.1763081607050; Thu, 13 Nov 2025
 16:53:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013185903.1372553-1-jiaqiyan@google.com> <176305834766.2137300.8747261213603076982.b4-ty@kernel.org>
 <CACw3F51cxSgd-=D46A6X6GptEZS8-JZ_MnB_yK_ZR1wktunYRA@mail.gmail.com> <aRZc1SqU01Cyxc5Y@kernel.org>
In-Reply-To: <aRZc1SqU01Cyxc5Y@kernel.org>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Thu, 13 Nov 2025 16:53:15 -0800
X-Gm-Features: AWmQ_bmZ-_H-myZL0CSQJa9c5c9xb22UWf4fE3TvV1ETbHc5zzWFdDRoRMYRrbg
Message-ID: <CACw3F50ti1cXOLwhyEbM8OCmwEaDDXK-r3QT+qfz2=a0yCTBjA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] VMM can handle guest SEA via KVM_EXIT_ARM_SEA
To: Oliver Upton <oupton@kernel.org>
Cc: oliver.upton@linux.dev, maz@kernel.org, duenwen@google.com, 
	rananta@google.com, jthoughton@google.com, vsethi@nvidia.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	shuah@kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 2:34=E2=80=AFPM Oliver Upton <oupton@kernel.org> wr=
ote:
>
> On Thu, Nov 13, 2025 at 02:14:08PM -0800, Jiaqi Yan wrote:
> > On Thu, Nov 13, 2025 at 1:06=E2=80=AFPM Oliver Upton <oupton@kernel.org=
> wrote:
> > >
> > > On Mon, 13 Oct 2025 18:59:00 +0000, Jiaqi Yan wrote:
> > > > Problem
> > > > =3D=3D=3D=3D=3D=3D=3D
> > > >
> > > > When host APEI is unable to claim a synchronous external abort (SEA=
)
> > > > during guest abort, today KVM directly injects an asynchronous SErr=
or
> > > > into the VCPU then resumes it. The injected SError usually results =
in
> > > > unpleasant guest kernel panic.
> > > >
> > > > [...]
> > >
> > > I've gone ahead and done some cleanups, especially around documentati=
on.
> > >
> > > Applied to next, thanks!
> >
> > Many thanks, Oliver!
> >
> > I assume I still need to send out v5 with typo fixed, comments
> > addressed, and your cleanups applied? If so, what specific tag/release
> > you want me to rebase v5 onto?
>
> No need -- I took care of the issues I spotted when applying, LMK if
> anything looks amiss on kvmarm/next.

I took a look and everything looks fixed, and thanks for nearly
rewriting the documentation!

>
> Thanks,
> Oliver
