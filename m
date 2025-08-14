Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E275204096
	for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 15:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755186905; cv=none; b=iUm2JwYMT3cn5Pe9pIa8i6rNWxexD0+DfzJfEtBrIHRzdgpdPAufB4zM3X/VMng76kvEfyqJP21EtRtcxg75AdvpcIQDX1naMT8jX8n8ejnnIDVvwM8mOL453bRzFeMZ0mQOdbgbmjbdZ3vFn9frex8AVHZHtIXp+fEKUzKypIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755186905; c=relaxed/simple;
	bh=XkpJgq+lIXUCppVHf15aiVr5Q8p7XI7C729dg+Vl3Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQNLjE/FRxfJe2uJ4mYSIjCptIHbnv9S9YrvrejnqxyEia9x5BiE7roDlukxUx5WpWy6ZWcU5llLIx2LxC9ZkfPFiYyDGdRiqd++h8nU63XOUqrKdHEpGPsSxz4o+eykT0LmqihTQnVeMF5FZTXoemqXP2PCqx+YACuXVP2SF48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HhUKmSmR; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HhUKmSmR"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45a1b0cbbbaso7584935e9.3
        for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 08:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755186901; x=1755791701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SviimhcnBMLOVVMhOENj2J5Tfh1/NQV1XS5VZG0D3iQ=;
        b=HhUKmSmRpXmjZFZ5q/DoCDAPbLa89O1pAzxr9RG0pfEAMsY+VGEGPuPpus4BiNfK2f
         OP3UWnBLgTiFOCLKIOudw+RO+8dZhLZQVivsrnUqdRizT964W2XrjTDknJ7fbqSEdXCB
         yQMXKx/GosmiQWhAZd/aJRMxp7ySrXoZYphjtdkGbLVaI3vqu4tGWTrWRo1+ULQhcNeS
         nXBonXQaaLA5APE+I2oLRjaM1LBFz644LtblJhLyqsSDU9umKxA3xEqg5nmQOzS4o0Rf
         mnGGbtJDtkPowPQlKi/43B9xwTc04cJGX27HvfZ3NaBqROEu2Gl9OaqgX//qGncDXwlL
         R3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755186901; x=1755791701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SviimhcnBMLOVVMhOENj2J5Tfh1/NQV1XS5VZG0D3iQ=;
        b=aFjNeCOnp9DyK0H9GXU/7CB9vqI3/Y1wyhgpJWkBtuKqGhGuQN630U2AouRihShbty
         t1TAQ9AmK9+EMtiKFXzVECvETtfJvXbNnNKSXB7Gm+nEz2osMNdiJ9vqMCT19dmgGxBX
         67eKh123+ukRVNzsxiBpWsBhNEhIKLNT4v5QI2Hxl1ASumSpJ3JIJOZ01/dw9Hx0h5p4
         W2ibWsuMmK8yh8Sv4WrYBPbzj71ISYwTBgwKGMBAhYKuLTWcVdeUGGmhJIXPOyUFhS3k
         aFECH4LlLg5w3x2n07DNc6MBv0PpEEwZETvme99YyUTMNTTt0JoGv4hIMnsjxaO1GxAA
         HT8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3BeOiDW5S6bmzpy9dfZXlUw/o4we43fkq7JZYKyX+BNkTSNKRgDAT4/K6uVb2PV4s5wdtkYA7XrA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz838Tw9r408fJAk0+kjr4fmAiQJ44JstCdbh+F/MZdDAxcbY1b
	KxFeiqzwinBZILxQkGVf3CN0cBmWEPmSovhMe1m4zBsMpuA2XS6U6gzhj1Oz7RcBuKQ=
X-Gm-Gg: ASbGncur79RH/3kyvnDZCQeeff+aBdPVzobyemGSk5bhRvCLNBnsW+pexWB3kRmSvlJ
	K/t6EtkCgChF2Q6BUZFgLaL6WvATab7bWsa7SK9KyMz1F4/cwxJmX+uRFlY5tOvZpkm93yq/tyY
	VM/td6vHkAJymdpJeWQW3ykg2xf4k55BuThxR9cWT1qMza8vRRq1uJw3g8FPp+1q4XsoaY877Be
	gP9+v6gU0YJg75a/cwwis/Pwxt/jtRwYXp0FSTScG2mFjSwMdM7viVRyAEa/IBG9/HSANMUBf51
	c3BJw5Df/IXplYyBSGTzSxm06ZGtf9bmA7WOFMJPvvLENBYGGo3n1YM+PRCxODAtMNb/GlrA7iK
	tuYSiGrpxqrRtwvNq0jwAjRQmg7K/eNtsH2K4TrbBLw==
X-Google-Smtp-Source: AGHT+IEg8KfFdsEWg4VePIf9NMFdjfj2YyB1TPJBwkQF8f3PI8g01heEQys1xj+KdL5pkHweD6cG9A==
X-Received: by 2002:a05:6000:2910:b0:3b8:d5cb:ae1c with SMTP id ffacd0b85a97d-3b9edf2d87dmr3225979f8f.28.1755186901323;
        Thu, 14 Aug 2025 08:55:01 -0700 (PDT)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24302e028dcsm70954145ad.91.2025.08.14.08.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 08:55:00 -0700 (PDT)
Date: Thu, 14 Aug 2025 17:54:44 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Tiffany Yang <ynaffit@google.com>
Cc: linux-kernel@vger.kernel.org, John Stultz <jstultz@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Chen Ridong <chenridong@huawei.com>, kernel-team@android.com, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v3 1/2] cgroup: cgroup.freeze.stat.local time
 accounting
Message-ID: <oel2dyzlyvzggpwxprhwbd7n2ye2bst32izjnzywjdilo4nena@p7bcxgy6lqyq>
References: <20250805032940.3587891-4-ynaffit@google.com>
 <20250805032940.3587891-5-ynaffit@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pjtwomnmbus7efjt"
Content-Disposition: inline
In-Reply-To: <20250805032940.3587891-5-ynaffit@google.com>


--pjtwomnmbus7efjt
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH v3 1/2] cgroup: cgroup.freeze.stat.local time
 accounting
MIME-Version: 1.0

Hello.

On Mon, Aug 04, 2025 at 08:29:41PM -0700, Tiffany Yang <ynaffit@google.com>=
 wrote:
> +  cgroup.freeze.stat.local
> +	A read-only flat-keyed file which exists in non-root cgroups.
> +	The following entry is defined:
> +
> +	  freeze_time_total
> +		Cumulative time that this cgroup has spent between freezing and
> +		thawing, regardless of whether by self or ancestor groups.
> +		NB: (not) reaching "frozen" state is not accounted here.
> +
> +		Using the following ASCII representation of a cgroup's freezer
> +		state, ::
> +
> +			       1    _____
> +			frozen 0 __/     \__
> +			          ab    cd
> +
> +		.. Originally contributed by Michal Koutn=FD <mkoutny@suse.com>
> +
> +		the duration being measured is the span between a and c.

This is so little "artwork" that a mere mention in commit message is OK
;-)

> +static int cgroup_freeze_local_stat_show(struct seq_file *seq, void *v)
> +{
> +	struct cgroup *cgrp =3D seq_css(seq)->cgroup;
> +	unsigned int sequence;
> +	u64 freeze_time;
> +
> +	do {
> +		sequence =3D read_seqcount_begin(&cgrp->freezer.freeze_seq);
> +		freeze_time =3D cgrp->freezer.freeze_time_total_ns;
> +		/* Add in current freezer interval if the task is now frozen */

Nit: cgrp is frozen, not a task here

> @@ -179,10 +179,16 @@ static void cgroup_do_freeze(struct cgroup *cgrp, b=
ool freeze)
>  	lockdep_assert_held(&cgroup_mutex);
> =20
>  	spin_lock_irq(&css_set_lock);
> -	if (freeze)
> +	write_seqcount_begin(&cgrp->freezer.freeze_seq);
> +	if (freeze) {
>  		set_bit(CGRP_FREEZE, &cgrp->flags);
> -	else
> +		cgrp->freezer.freeze_time_start_ns =3D ktime_get_ns();

I wonder whether it wouldn't achieve more stable results if the
reference timestamp was taken only once in cgroup_freeze().
Measuring the rate of cgroup traversal is rather noise in this case.

Thanks,
Michal

--pjtwomnmbus7efjt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaJ4GwgAKCRB+PQLnlNv4
CNbxAP9FzlDCoVP1/jhXEaVA20T+mwq1x7BETTs7XxHWatYQTAD+OE7kYl0NbVYD
g6r21AfecI9/DXVLMsPPub/G82cpWwI=
=3Weh
-----END PGP SIGNATURE-----

--pjtwomnmbus7efjt--
