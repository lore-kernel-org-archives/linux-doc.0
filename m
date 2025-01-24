Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DC121ADC9
	for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 10:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737715169; cv=none; b=FIo0AE420aTLVDwtzIfaJM7KaBj5tuG2syYmvwliiB6/xiPJgCAeSMBAuhQYQaCofBWvR4R6+YCe+WXyCqek3MS5x/qd7pad28Xj2Mu88cPw44c+KM46qX9FDfYzF1N40aRsmeCmZrpVP0Cu7BH4HnUj2kmVxAZVyxaQKFaxCIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737715169; c=relaxed/simple;
	bh=UT2slwg+3H7K/6HSej7fBwUmYKvcgi3W47s58DdvaTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLuXWCR8EI2xAxFWw/RZjuAbfU4nAnEd/ehVDPAO27Gy4L6hBpAT36Hd7l/07Es8i1Qvfju0tdB6RCE/BHsZ285VLKFi0SMgFEDsErRoec129zNYONM3tV0mb5mC664HADk1iFdnm/vdqTjdyOYO2psti7Jy7u6r8gF+5EgmNc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=U4+nbbQ6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="U4+nbbQ6"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43618283d48so13621275e9.1
        for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 02:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737715166; x=1738319966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UT2slwg+3H7K/6HSej7fBwUmYKvcgi3W47s58DdvaTg=;
        b=U4+nbbQ6WP+Strtxug0Ysg6U2LI2ecM1Sk2YIXKpHjXEwXP7az+0YGNkSv0sLNo2ue
         ADQJWCumzJSS5QwA2+95CiJHbo8gUi1oqDBjfB0BBAP1ReDsSIj78pjztp209VAsyhV1
         tY7frsl58WmizOCsZN6GJmDxRc2IAgGFOagfzdbGUmXXV48ph2XfBQkCbhuxfJd18nvI
         RwCeZmzbjsDl75O5laFWcNWijMkoKxSv/yC/n/uFniST9zgFDXJ5khJhfKsozRVorG6W
         hl7QsnYMkr3hGcQ1W0JIciRAfeBTeaD+Y5YQmAq0dsy5sAbC6+MIlkbUtNI3cipHu+Sw
         dTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737715166; x=1738319966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UT2slwg+3H7K/6HSej7fBwUmYKvcgi3W47s58DdvaTg=;
        b=ZgJlC5upZJ28AnvIExT4BBu2GngEVDbArHBRN3fzk9+Zy75QN7Mx7O15J1onXv8B78
         IH2CrH3j69DDQkoHtD8mxUQBlAOThjzSDgAGeG7a3+iLYGbxCjfgy4tMekJTSJ8y3B5Q
         UFIEC+bdF7bi8oY8tlr0SjLq9WRlxtMxEp4Pg9VKF+nzzb5q9qkZgN1kG/H1e1mJKHN5
         EqK/Kxv8HYW1p7JcmW7NUOuTLkffX5PzqGz312FZn9/1f0kP7W+Q6qNmBEgTP54OzWD9
         B8dhdpGNQ8NADMBXClJEnMJpwiiV24jd42RANFssentTbfqImysmpVVw3MLMUlw3Nc07
         hggQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAAaWpjpS/sYxZLns7qlyJtIYAl5DJD34RV498bDPG9mejyjGx3Klf94YmKPGhr7tqelLZ/36DUtY=@vger.kernel.org
X-Gm-Message-State: AOJu0YydWfec0TPWRSIRbbPvqDb5IrF4vsuZ/x5R/s5tYV72wUEsv22H
	Kt6n6aEids+AMguof4aDcVkQmf7JkCdsPb5eaJ75x6VPIubh+Kdd758aNMe3TpI=
X-Gm-Gg: ASbGnct90LfoVqh/HxOx623i/1u54fgrvDV3HPmlYldgIljHzkpnWAAD+Bapuus23+H
	34y6lU/0nQIABpdeOkmkKeRGqqVfJ2x01gzoVMQ3VC6sFCDJEnjAg8cKwKKg2PIrBnd/Ct4u8Hx
	UHHb64GixdzCosgg3GgRaV+gWEDfyDT/w6UMtx/mW/eYQbwQfxn6b47uvpL3D+z6Gi44Yy8UWlM
	P4Z9VnRZMb561ojYRhQvpuabDdfl7Gsb1NXF6Y9x+gYjyY3Xgiq2xoRHSL3W+JSXkJKZYKPkB0u
	mmVJJh8=
X-Google-Smtp-Source: AGHT+IHxVUpA6JnV0UM+ASUvrze0A4aDFlrUT4ekQ6eY/q9PI62J6bns7k5vlcjJjRBUja7ZL5TQWg==
X-Received: by 2002:a05:600c:1e8b:b0:434:f609:1af7 with SMTP id 5b1f17b1804b1-438913bf885mr288158065e9.4.1737715165891;
        Fri, 24 Jan 2025 02:39:25 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4d2a82sm21815685e9.36.2025.01.24.02.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 02:39:25 -0800 (PST)
Date: Fri, 24 Jan 2025 11:39:23 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Abel Wu <wuyun.abel@bytedance.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Yury Norov <yury.norov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Bitao Hu <yaoma@linux.alibaba.com>, Chen Ridong <chenridong@huawei.com>, 
	"open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] cgroup/rstat: Fix forceidle time in cpu.stat
Message-ID: <amw4ehhgqglvym6u4bkht2fcrxfzcwcyh4eeju3m3a3icnscxa@qx5ntsgw3y3c>
References: <20250123174713.25570-1-wuyun.abel@bytedance.com>
 <20250123174713.25570-2-wuyun.abel@bytedance.com>
 <cf5k7vmtqa2a5e6haxghvsolnydaczrz5n3bkluttmula5s35y@z35txmj4bxsb>
 <a7a24c05-87ca-49d1-9fa3-be4c3555e238@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cevqhc5nyjoojkeq"
Content-Disposition: inline
In-Reply-To: <a7a24c05-87ca-49d1-9fa3-be4c3555e238@bytedance.com>


--cevqhc5nyjoojkeq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 1/3] cgroup/rstat: Fix forceidle time in cpu.stat
MIME-Version: 1.0

On Fri, Jan 24, 2025 at 05:58:26PM +0800, Abel Wu <wuyun.abel@bytedance.com> wrote:
> The following hunk deleted the snapshot of cgrp->bstat.forceidle_sum:

But there's no such hunk in your PATCH 1/3 :-o

--cevqhc5nyjoojkeq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ5Nt2QAKCRAt3Wney77B
SdTZAP9x2+N8xJi+gkrAMqDzALVl5oGYN5nooXAL+KroNXDafAEAyQxKxbQrJGik
H1VmUbxZmYMwAyvgj+zPbanJFBuwAwg=
=odFv
-----END PGP SIGNATURE-----

--cevqhc5nyjoojkeq--
