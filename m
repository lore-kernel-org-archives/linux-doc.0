Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808948;
	b=jyqYhEd2xBzZIMt7fq+25CloE690R4HUTmScMamuQ5D8cWIZzp0az+icviFOSGwAuNpH
	 yh8MAMcxvYWRbPlYJ3eMg0dHKfjvtjNB4yEn0wSjh5G9RhXkLupDl5gDE+06gDbfqUJjy
	 qsylxyXtSku+GJSz5l7+YfNbxvOj0qOQc20AoiCPcZo6X4u+2zBAflqgcm9Ybs0jVPffZ
	 KJGrzrE9GcvRKmUkDsnoQREB3wEjQyB3lFfKXP8GjtIcms1ZkXrtLEItcNmlr/WxaTM5E
	 ge6/hEJtvIC9+e6Par3wHTNvbYLQ+49oT/HngNK9UT1VsdB8zG/h8ksvttrJzICWfJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=OJqTJ4xyg07hJqswmJ5AikQ26UFbu12PW8dHC4PPKvs=;
	b=K18fqRBWcoZP2RBLtdtQznBkb2XAWIeUwHNh+jfjApI1KUQKbJqee4b5s1MPtCloDpm6
	 BMjVcFI/xdDOa+hZdHTAJvpCZBwLv+sZKEllszIH3OmMN3kEbE1nQjKwZcGUGU3W8/rNr
	 Xb7HD3Y9a6rmVzDpov2WMJ9brs+x81/YB26ULgrhnTfrMC4+VByDKnlyiWYmteR4NFj05
	 WKsMMGllKRQguM9+eEN7MZCwda+Cdtb+y9WIkGySXl4hsE9EXgviKZCywcj9VmNIqkhbL
	 kK+PJiymMx1b9ZizVJ1IfSqDcR0sxgWFFrWQQgSNLQ3bvQncBaLsOuKy4NqEZW600mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=OzvPmeDW;
	arc=none smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB46606A332
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 16:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFB46606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=OzvPmeDW
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-980c4f5c921so286467241.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 08:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793808947; x=1794413747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJqTJ4xyg07hJqswmJ5AikQ26UFbu12PW8dHC4PPKvs=;
        b=OzvPmeDW5bBy+zfv1z1W+Hmr2oI47pvOy3dB2/UBfqW2eCXCyi9tDXfI1TlMvDh/rl
         Nm2x9kE47US+HAkFxSooytHhU9bNEBF7Anl4SHKfnGI5RJhiNbRUq+CLiQtBws3hzBfb
         UPAjgPGjSaLt0PZlNevCOa9kBEtMkl30A3wq5rHlIE4Vyrnsiin2y3A2Q9JDein/WeUT
         nZpeL3Lp5JvX5cX+oy8ByhLUpP8fEbIvuV0jmpmf1JIiPRaeYWMr24XjK8gw5gsR4vrz
         iNZXpFU3ev7+1CybZzNzBhEdzleQ6Ti8vJ1TsXIgjQc0UjvVAbaP5rN4oFy5egP6V9RO
         8/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808947; x=1794413747;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJqTJ4xyg07hJqswmJ5AikQ26UFbu12PW8dHC4PPKvs=;
        b=WmMSTKZ5aIKqmAk8L286BwPcqJJne1rJlyY9nyNsBDW5K2EeJAPObCp3qoZja2UK2b
         18UiZbwx4lCSZWbCdkBDWinUgAkahozpWgGDHqo5Dc1IaHWNIGv5pM5yFIZO3EJXbk1v
         EswszKsZTOHNRbwyWt0Zt+IzCvB03SjhbMyKejTUDkaxtuTnNRxzsZ28VWpunGgMHgXU
         Vj6TkqTnJ59R3901JPKorHcFkh8Rnhyfz87yACfuv2q6uGoQNxbXVknPyQWgZjEDjKRo
         y3o3iTW4W9FAEM3oOfTG+a/L9ie/a5ltjTrO6e5UrD11EUnL6EklbT72SNYyNVmiy150
         f8yw==
X-Forwarded-Encrypted: i=1; AKwUvBwbgT6KsGtGYuuKIVlhYrRASKB7Mr15MsPSEBUPOegYvzrHkUhrmDuaKuJX7zAzZ3a3U4LNzJBInBk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8k1Sbdq9kgp4mm6f34BhhNcRebrxfYXOKDGSy3vJfWyA99C4k+
	35dNZkjVIkbbQIwTW+5eiVDN5Rj84owD+a2vjE4MPBktjOXxmMcFTCDzQnuqFo9IGm8=
X-Gm-Gg: AYBFou0OHaLR0iIigm7nkEQbj7B9vqEWmn7SNXLCTNpFtCP4kbxRags8SFtT5TEcEWH
	txOnb94AyjtsMCkkpDrHKn+YMTBB8giG7SDk7XmXmbFh4a9BDdQeXwmaHvfT1PMxgheAEg/eq3U
	uQtsWldfz6pDsbgE8TiTTwXiLGTJSzATlPRgjcRc08oVdAnwPDaZ0OVXRU5KtzCLvjd0ACT8x/Q
	V0GAVC53ONhweDXlnmyrohJBgfPy916MWBTFbarFLMMBnZeW758YOkNYg3CgeLQ7ZI592/XCi2U
	r6W/H2svy4QVoU3qHmlqnvDLIRmjU2oTyTiXmACWj4Oaxass5orvC9NfkscDUF5tsCSsd4U/psM
	MUIK+E8l7b5bgbS65Ka/bkjBZKLAp5H9MiUR5GqxtIs7TSebe+9qM5DYowbAd5XZQwvJRtY4Q8O
	HwtfsIBnaWm7V3ek0r0cxXaVFVbghuyImB9jWXfHyvOhCnPGY8H6E52dvT8G60ITUQhg31VCcVY
	D2yYTC6out6pDkS0KdnQoqw4TT+hwKCXioj/PaqZSMXwv2wazgO2rOrqCQMpe/fqt3EVYJBbcmu
	akmO5VWvQwi0qQCbzWW7djSE38FNCER2Er7WgAlRduHOOWPBT96LOo+9zhCc8E2x0iBQ7FXL+dH
	TIOHEaM22PPhC13HkYeVedhvTwUBg
X-Received: by 2002:a05:6102:8092:b0:7cc:9d82:61e2 with SMTP id ada2fe7eead31-7d0725cfd86mr6050535137.13.1793808946717;
        Wed, 04 Nov 2026 08:15:46 -0800 (PST)
Received: from google.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d8afbfe6sm2262989241.3.2026.11.04.08.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:15:46 -0800 (PST)
Date: Wed, 4 Nov 2026 11:15:45 -0500
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: David Matlack <dmatlack@google.com>, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Christian Brauner <brauner@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 03/10] liveupdate: Allow file handlers to mark
 retrieve failures as retryable
Message-ID: <autW_3fjUS_hEhZf@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-4-dmatlack@google.com>
 <2vxzv76ck7n9.fsf@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxzv76ck7n9.fsf@kernel.org>

On 11-04 15:12, Pratyush Yadav wrote:
> On Tue, Nov 03 2026, David Matlack wrote:
> 
> > From: Pasha Tatashin <pasha.tatashin@soleen.com>
> >
> > When luo_retrieve_file() invokes a handler's .retrieve() callback and it
> > returns an error, LUO currently records the error in
> > luo_file->retrieve_status and blocks any subsequent retrieve attempts.
> > This is necessary when the handler has already partially consumed or
> > freed the preserved KHO state.
> >
> > However, with user arguments passed to .retrieve(), a handler may fail
> > early while validating caller-supplied parameters (such as a missing
> > argument, an invalid or read-only target file descriptor, or a non-empty
> > target file) before touching any preserved KHO state. In such cases,
> > userspace should be able to fix the argument and retry
> > LIVEUPDATE_SESSION_RETRIEVE_FD, and if the file is never retrieved,
> > .finish() must still run to release the preserved KHO state.
> >
> > Add a retryable output flag to struct liveupdate_file_op_args. When a
> > handler sets args->retryable = true on error, luo_retrieve_file() leaves
> > luo_file->retrieve_status at 0 so the retrieve operation can be retried
> > and .finish() will still clean up the unconsumed preserved state if the
> > session is finished without retrieving the file.
> 
> Should we give some sort of signal to userspace whether the error is
> retriable or not? How would it know it can or should try again?

The goal of args->retryable is internal kernel state tracking.

From userspace's perspective, LUO ioctls behave like any other syscall 
where errno is the signal: userspace decides whether and how to retry 
based on the error code (e.g. retrying on -EAGAIN, or picking a 
different mount on -EROFS/-EACCES, or adjusting flags/arguments on 
-EINVAL).
