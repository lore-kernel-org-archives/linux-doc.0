Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E50E181335
	for <linux-doc@vger.kernel.org>; Tue, 14 May 2024 19:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715716516; cv=none; b=ftRDjFWq2+EsRAnNVdPOzVYZhW5xJQuJ0EhLkHPgf5ZB5zMO0xt/BvmCkN6fp7GKbmhIRHMidHi2iMuFN5+96YHihHfugjoaYeDK/0imYRhtjn+pJ0by26RF3lL0BozfksvzJxazZtG/VXJReQcJN5j3vv8hztnFe2E+yGuvyyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715716516; c=relaxed/simple;
	bh=Tn7ggDBZ467fewog7X29iTchxNr3w1imZ5QlMHFp0v0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+Cbo2E84k3exYKq4hctmYI2GzPzBC1p++p+k9bIaAWrWnBp75Z+NOibz+6rbYkeyODcd1buLgBwJ26HsRlWWy1tqIpobO3pzcID87btLSB4SdR/Ni1S7h/ocZjrCo5noYFuXyid1ojmwr0VU3lITWlR+nYeNpMhUqSCMHFmQjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=BQ5nTcrJ; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="BQ5nTcrJ"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dcc71031680so6420065276.2
        for <linux-doc@vger.kernel.org>; Tue, 14 May 2024 12:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1715716512; x=1716321312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5DfaKSvWBjSuruH8QpkzwqbDWxyqIe8ntp5STBjhPE=;
        b=BQ5nTcrJeiDGmJPbk+0RbPTElKvyqninC22tbUnOXLGS1LGq1NMiBlKd/vEdzgWmX3
         J6CyOwcl5ivwV579DFEK3+TPJNedRbX5ta4rufuEGc9PXSFysi/1ahLWwCZ145ht6Uyl
         Bw6LPtcCw4jhHWxePof5VARvVKrO7Gny5IjBXAEBH3jl2fhWU277pEPsN/aRwtFOao6H
         alRLOYOxC3Mw4O3SYM24cutTSjj6riCyqehsqMkh76Ix8NCPvVfYnaoGWhA3ar0CMRBO
         uOblc/Ql1V5KS6OL2dGv81/5AuDDrkYhB4Q5bH42HhK8obCcNSuLZXmuVzWWpy725Av5
         SDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715716512; x=1716321312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5DfaKSvWBjSuruH8QpkzwqbDWxyqIe8ntp5STBjhPE=;
        b=RdVks3FIOCePvtJHbtZ5K+govNYOs85kGSMmW2L6cbEMb6PYdbUpXJMpzCO9xwl+se
         8xkKhuCBgehTPI1UNPL5SRE00GSQtFoKHdyuSEuGk8EQjT8f6xn+jf/9icdKksIsQ25p
         Wxh3I6dvx6WBDtlXHMd9vgrQjtsXx+ZyIy4JhpinCgu5K20Y5GltFYftB8OHfeDxdLI8
         fXFWtrGP65tRgRtLhstbE0J/m3oc0b+ssqVeiyVWi2UMT/eXMZ4JDD2Bf+f7GhoTWbzv
         vf04tU6YR83uhbEQuTTioE49x6nc8BZwBJqh2W9I7PcWy4IvDw8DQQEo+NZy+BWPEjQX
         Ci9A==
X-Forwarded-Encrypted: i=1; AJvYcCXtcOtC33QgZTq4reYRb88m+OO53lK4cTM1ESKg0NP03GKuLYFyBPcau0judu0eLbLtkw32l9gn8tJCvdJxSVft2Sfxwsmy8fOe
X-Gm-Message-State: AOJu0Yxk/QcIhIxqJZrOppRS5UJ9SCjWZDNjWUw06k/hdm5wGWjOpUdl
	JzYZ9wwCSSpxQ7IgpaXnPmEuyh9aoTKam0mx57JfzSS7WwGppETNzwjzpaDY6ui4H9XU4Fd9Pjn
	6SmkyQJzmASVVb9H0Dp9F5OpjpmgwhrEju5vv
X-Google-Smtp-Source: AGHT+IGVq5mRXTNrK/KaBwurMBldLnV/6qJN5uwTdGazOX6+s8bWL81rsv23lU+ZbyujJVMk8Qdjk3/8J+Z+jQ3+QZk=
X-Received: by 2002:a25:ad50:0:b0:de4:619a:fbd with SMTP id
 3f1490d57ef6-dee4f2f6cb8mr13359322276.9.1715716512499; Tue, 14 May 2024
 12:55:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1714775551-22384-1-git-send-email-wufan@linux.microsoft.com> <1714775551-22384-17-git-send-email-wufan@linux.microsoft.com>
In-Reply-To: <1714775551-22384-17-git-send-email-wufan@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 14 May 2024 15:55:01 -0400
Message-ID: <CAHC9VhTK4WS6BOXqLJ4sNKXR9a17gT3vXJUBc1F11cZ_QaOYBA@mail.gmail.com>
Subject: Re: [PATCH v18 16/21] fsverity: expose verified fsverity built-in
 signatures to LSMs
To: ebiggers@kernel.org
Cc: Fan Wu <wufan@linux.microsoft.com>, corbet@lwn.net, zohar@linux.ibm.com, 
	jmorris@namei.org, serge@hallyn.com, tytso@mit.edu, axboe@kernel.dk, 
	agk@redhat.com, snitzer@kernel.org, eparis@redhat.com, 
	linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-security-module@vger.kernel.org, fsverity@lists.linux.dev, 
	linux-block@vger.kernel.org, dm-devel@lists.linux.dev, audit@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Deven Bowers <deven.desai@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2024 at 6:32=E2=80=AFPM Fan Wu <wufan@linux.microsoft.com> w=
rote:
>
> This patch enhances fsverity's capabilities to support both integrity and
> authenticity protection by introducing the exposure of built-in
> signatures through a new LSM hook. This functionality allows LSMs,
> e.g. IPE, to enforce policies based on the authenticity and integrity of
> files, specifically focusing on built-in fsverity signatures. It enables
> a policy enforcement layer within LSMs for fsverity, offering granular
> control over the usage of authenticity claims. For instance, a policy
> could be established to permit the execution of all files with verified
> built-in fsverity signatures while restricting kernel module loading
> from specified fsverity files via fsverity digests.
>
> The introduction of a security_inode_setintegrity() hook call within
> fsverity's workflow ensures that the verified built-in signature of a fil=
e
> is exposed to LSMs. This enables LSMs to recognize and label fsverity fil=
es
> that contain a verified built-in fsverity signature. This hook is invoked
> subsequent to the fsverity_verify_signature() process, guaranteeing the
> signature's verification against fsverity's keyring. This mechanism is
> crucial for maintaining system security, as it operates in kernel space,
> effectively thwarting attempts by malicious binaries to bypass user space
> stack interactions.
>
> The second to last commit in this patch set will add a link to the IPE
> documentation in fsverity.rst.
>
> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
> Signed-off-by: Fan Wu <wufan@linux.microsoft.com>

Eric, are you okay with the fs-verity patches in v18?  If so, it would
be nice to get your ACK on this patch at the very least.

While it looks like there may be a need for an additional respin to
address some new/different feedback from the device-mapper folks, that
shouldn't affect the fs-verity portions of the patchset.

--=20
paul-moore.com
