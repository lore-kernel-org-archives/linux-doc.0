Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61ED4199E94
	for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 01:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755135038; cv=none; b=BG7W3TrDCOqFxasS7bqppB9yOWTklFNsfwEr39xWRiak9Oy706PGqc+I+z1AUtzSqyxcrzfQdb774FhJIbclo0Twjm9my/cz4nJr8kzIvPuvAMZSPPekU5hyoFpUXGCFc+My3tBqBNxPlMJBEmZ8MijoTjPQ/EM7KeIW+fqIwQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755135038; c=relaxed/simple;
	bh=WbgJ5isNsqVYV5zzaKVbpULuS/3hHjDmri82xKxBaDQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=otLQjBI3iJHJhUya7kD1htyrIaxtd6ZZcstzfkgpQEJ8pBTZ1o9lXFO1+MDaIHnlMV9J1Om5RmMM89Gpsv6QP41zrFP/Wznqf7+YSAzzqvzCFPAdEr47nbiJ5T1KQkBYVvsbOueM2n1N6ewAnmzPXr8XBSf2vru8w8UVHBetq48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r/G5BgbH; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r/G5BgbH"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-24458121274so4638835ad.2
        for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 18:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755135035; x=1755739835; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:user-agent:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4oH/H8Uczj38sjgvka81xmx7klPZUzo+Pao4BcFdNEY=;
        b=r/G5BgbH01l17L9hLaUr8LrJjHdwJS8TGK0S/8Y8GGcnlxtNzDshxVo7SmLGcBGpS/
         W2dQoqCIi5WWR+SUID++57ytheg66TiYNnytJ3SyBC19QP3HtH+4wjMHdRJXb8BejCSz
         FY1V0IBmZ7MUy3+4MMHtZwVDfqisttn0F/S1kpLpdeovqQZqRF7vrvszc2HJh6ArpZJC
         N8JefQsQSr7lxKfq44kKsaXY4KIGOyofQdDaoCdv1iarj7ye1wzw1RepuQxgO18pDOIA
         AXlBzLVsdY+9qAWCWhOtEpgKfmnpkiDSxt0KzCnh+EhknRHJzOMT8PSOXggtb8uy0h3q
         ROlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755135035; x=1755739835;
        h=cc:to:from:subject:message-id:user-agent:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4oH/H8Uczj38sjgvka81xmx7klPZUzo+Pao4BcFdNEY=;
        b=vmKGF8GIblRyaHAgqs/xoZdQny4nUc+bGC5Sfpo3LuAAC/tds6kY/ZIFsNsRTKv5i5
         hdIHE8ruG4CoZc8PgfVtxRG+wTS/vOgf+jf9pdsZugN9rnotTyVrJxdQa8B1wZNkyY79
         +WxIPrDDRKF0UdVeQRvTrFxk4akjpJw32v+zjsUHP+VqhWF07La8eSoLVdFMlLoM3GRt
         F02q16qXIM8ifWdmetHtMQWF4PXynVRmyNMWYj1hgakXHYG4ZnAUurHmeh6JBmqLQKPK
         gNDUe3YZ3/boRz7t/q8be352jGkydxYuWU0mxdKw9/nG4ewXIgOYZpsjGmykzvKP0ciu
         c0Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXorYXE1ElhDtFuVJZwJgKuDhAozhmoPSOVMOBCmE1YkBLrHgvme+gKpcU3H3+Xd4It8UFHQCbXE8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAIU1vIx5g2iaSOyxBvuDBJXekzFb5PVrnNbSW5+A/C5C+Nipr
	4EaRJipWnWaBSHjP1pWfNvPkazH9BH6num5PtwfD8r/pcgny+G4vqk+jxz5MS4SNZ/5X0IxqcjF
	ucSpROQsnSA==
X-Google-Smtp-Source: AGHT+IEvtjIjDFf5oUu8XtuvZ66AuDR6piAkpqJV0aQYguAIByySyHcA1rR4otGY+tKdX93cPC7afkFJ2b9b
X-Received: from pluo13.prod.google.com ([2002:a17:903:4b0d:b0:23f:f074:4148])
 (user=ynaffit job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:138a:b0:240:4d19:8797
 with SMTP id d9443c01a7336-24458a50a4amr18212045ad.22.1755135035267; Wed, 13
 Aug 2025 18:30:35 -0700 (PDT)
Date: Wed, 13 Aug 2025 18:30:33 -0700
In-Reply-To: <aJo7udUoWJt_jLzK@slm.duckdns.org> (Tejun Heo's message of "Mon,
 11 Aug 2025 08:51:37 -1000")
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250805032940.3587891-4-ynaffit@google.com> <20250805032940.3587891-5-ynaffit@google.com>
 <aJo7udUoWJt_jLzK@slm.duckdns.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Message-ID: <dbx8qzxe7kqu.fsf@ynaffit-andsys.c.googlers.com>
Subject: Re: [RFC PATCH v3 1/2] cgroup: cgroup.freeze.stat.local time accounting
From: Tiffany Yang <ynaffit@google.com>
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, John Stultz <jstultz@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, "Michal =?utf-8?Q?Koutn=C3=BD?=" <mkoutny@suse.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Chen Ridong <chenridong@huawei.com>, 
	kernel-team@android.com, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Tejun Heo <tj@kernel.org> writes:

> Hello,

> Generally looks good to me. Some comments on cosmetics / interface.

> On Mon, Aug 04, 2025 at 08:29:41PM -0700, Tiffany Yang wrote:
> ...
>> +  cgroup.freeze.stat.local

> This was mentioned before and maybe I missed the following discussions but
> given that cgroup.freeze is a part of core cgroup, cgroup.stat.local is
> probably the right place. It's not great that cgroup.stat wouldn't be a
> superset of cgroup.stat.local but we can add the hierarchical counter  
> later
> if necessary.

Got it. I had ended up opting for the "freeze"-specific name because
there was already a cgroup_local_stat_show that seemed to imply that
cgroup.stat.local was reserved for controllers with a struct
cgroup_subsys. I will update v4 with something similar for core!


>> +	A read-only flat-keyed file which exists in non-root cgroups.
>> +	The following entry is defined:
>> +
>> +	  freeze_time_total

> How about just frozen_usec? "_usec" is what we used in cpu.stat for time
> stats.

Ack.


>> +		Cumulative time that this cgroup has spent between freezing and
>> +		thawing, regardless of whether by self or ancestor groups.
>> +		NB: (not) reaching "frozen" state is not accounted here.
>> +
>> +		Using the following ASCII representation of a cgroup's freezer
>> +		state, ::

> It's a bit odd to include credit in a doc file. Maybe move it to the
> description or add Co-developed-by: tag?


Will do! Thanks for looking over this :).

-- 
Tiffany Y. Yang
