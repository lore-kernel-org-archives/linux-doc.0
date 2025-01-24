Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D72C1F5404
	for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 09:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737710579; cv=none; b=gmPpZ5JsyMXquZt73dyzNTmcDGF6teMDd/tSH4KVi/iMyRH7AZ1qmrcMjbCB6m1lFkt/aOrzmdCz/pMeeSrIZtlcZBk0MSe8BVVcYqoqpc0jPs2qzG0gkv2OWBV8TDi0E7RO2AqPAuh6uOOrxsLoUc/h+KYCvgCj+g7BpLmHH80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737710579; c=relaxed/simple;
	bh=BbsRykMYCjEOKx7rDpeahHQv23T4QNwSld/rN7RPwss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPnZBVdqT2jChJKw00GhbFb1IIXZBl9n/46H8F+6yXzsVUBxQaWUayaWPN1H1OQwPgVymuFf6nnGJRQ94EwaF3ksJS5gSUHp2Tlhykqv9Esmtdc4Ku1T9qc/v5D+QW7d0nEzoTIh7pw2vw+wIQoY6FrlswcOafvJWAg5ONtYjxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fUap0/6R; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fUap0/6R"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so1119652f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 01:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737710576; x=1738315376; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H9bWsbPziLBG/7e5Qa+ePdC6ESiy5rTCswnH/uw5eaY=;
        b=fUap0/6RxaPcO2PzRPDx08CKOnWltHs9eY581focOMF3FpQOSnRmLQGtGjteb9E3tV
         5QzWfTHqi2Tj8U1kwrI9VdvEi7tiJiRMxRyUxqcgboJtHsRo9PKJG+ZqM5QI6U3MwIuk
         YrHSj5vV9zT/VXt1B2j/VeuSNOLJtJIJwnuSCDechGGIKMYr7cQx7wGuaHR36+gXQmly
         PqQfD543jThB7in9Fbr9rIR9DycA3WteauwTbYwSpu2JMgKg9n/5A5rf/8yxh3xtTv/J
         vWSWz9HrLt+G7OzRahQ5iAAVyTqQOzu+FmM59fSdizXIYci6tkW6+mL7O2HzQQnWMtXG
         ljJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737710576; x=1738315376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9bWsbPziLBG/7e5Qa+ePdC6ESiy5rTCswnH/uw5eaY=;
        b=Aai/LcEdWXZGNITiHGdK6v/kBV4wm1oGvenJEfFWwL72BOoyQ/f/Q2PtKY0bMwqL4Q
         g6NqqBJUaOd6De8LKZAWEPIZLOdujxfW2KsidJs6al27VScsPzPPAezVGZ8Aw0fbmri5
         g67ASa/8fDtXY8HVzoz7DrleWatZQWQK0JhZ4mYFVIXlGH1b4WcCrTM5RYC/ueyOKMJ0
         Qvbb4BmLgehI0ZwTqkM/yGJvmOyrSDOlYoCVRuTHrNSz/dRfRCYc1iSh5xIiQ1QTO7xZ
         J8zysL7W9a1sS4ZjlVzYM7WXWVY5kHtbjUqzsaUcffV9goN2vZBH7cUSZGYNAg0RUQBO
         +Xgg==
X-Forwarded-Encrypted: i=1; AJvYcCVtWExMBYeH+qRRUknx+sDHeIgkrkcHlKteuvUx66ynAo2uQ/u3C4/Jc/pOVBtz72zT2Guixsowleg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiZF746+33ng6AcMZmcmWYV/Fb4ZEImkBfUkvj+wbg+Cz5ddKw
	vG2Wy9KpYHiReNF75k0+rmJtBsFfWlZPwJpxHKDA1jRKTreaXl96uxjMhsiPHug=
X-Gm-Gg: ASbGncu+EpQJoIwqQ/UcwsudB2HnV9YOHuvXbiYVV2LbhSk0jVXPO2Y1cFiPbXnOpVO
	cnvEzi1NoguW+2mGZ79FmvjRMXs8Xv3oba4iw60uqZFvYWErFTTifCGeqUSQ+WT+0GtmetStIYw
	+fQ6hZwDiO2zjNPcQ5qjtAsV4LoY4Jf/uEFW8voUrgQH00nIL+UeS6jehVRk4LJaQCdkq7nHZWU
	hpwk0Uy3whDxiSRi/mDy6oHTfG+ElgQ5fxDz3FocpWYwgnUX4GrBomi4SQZf8qnWyl6saODWpih
	MrTnUCE=
X-Google-Smtp-Source: AGHT+IFCv0eyiKtehn4II4+oph9TbabT8LdFIdP3h5yuguOk+MeNiApyBbpxlhqnpnT9+v/L616a2A==
X-Received: by 2002:a5d:5f48:0:b0:385:faec:d945 with SMTP id ffacd0b85a97d-38c2226c070mr6932255f8f.9.1737710575601;
        Fri, 24 Jan 2025 01:22:55 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bb0d4sm2162149f8f.69.2025.01.24.01.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 01:22:55 -0800 (PST)
Date: Fri, 24 Jan 2025 10:22:53 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Abel Wu <wuyun.abel@bytedance.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Bitao Hu <yaoma@linux.alibaba.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Yury Norov <yury.norov@gmail.com>, Chen Ridong <chenridong@huawei.com>, 
	"open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] cgroup/rstat: Cleanup cpu.stat once for all
Message-ID: <2fenjyawa46abfrpcebluaoi6dd4z5v2y7pp7jyuu2oblmfmhk@reaaehe6pkzn>
References: <20250123174713.25570-1-wuyun.abel@bytedance.com>
 <20250123174713.25570-3-wuyun.abel@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="syvfmw22bmuvyaet"
Content-Disposition: inline
In-Reply-To: <20250123174713.25570-3-wuyun.abel@bytedance.com>


--syvfmw22bmuvyaet
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] cgroup/rstat: Cleanup cpu.stat once for all
MIME-Version: 1.0

On Fri, Jan 24, 2025 at 01:47:02AM +0800, Abel Wu <wuyun.abel@bytedance.com> wrote:
> -static void cgroup_force_idle_show(struct seq_file *seq, struct cgroup_base_stat *bstat)
> +static void __append_bstat(struct seq_file *seq, struct cgroup_base_stat *bstat,
> +			   struct bstat_entry *entry)

Not sure if starting with double underscore is needed when the helper is
`static`. Also something like s/append/show/ -> cgroup_bstat_entry_show.

Thanks,
Michal

--syvfmw22bmuvyaet
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ5Nb6gAKCRAt3Wney77B
Sb8LAQCFszj1nUqoEGjfi5O5vLldmjO6b16rc7J3nw3bB2xTjAEArlXDdjEju8ON
7oESO8RLLV6Pu+swMBg+me4JS8deTA0=
=ibQ+
-----END PGP SIGNATURE-----

--syvfmw22bmuvyaet--
