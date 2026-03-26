Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAEA341062
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 21:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560722; cv=pass; b=o+6WFDQwsdPlb/7wp7g1Is8vK6Zjpq8GCNSMwkYI/r3r/ddO4pJnst+5n98hEOuPeUKtKUr+39W6KNRfspsf4SVSWD+BqP/sBhxejC0r0rudRWdE622UPQqlzcEBtRLeOBk8G9G2nnQ3wwHhEz0NK1f0enwaxm6bwCzY1j6JB/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560722; c=relaxed/simple;
	bh=TZyAuJdbm5lNyLHWtj8JZifMocqSIEE/M15yyD9cWUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UctKoc4NpwSCBM0zz+zldJhvVQpjFAyHodEVMNdnYD2eU819Ovj+pk7P6JIDV1svQy+yk/exdlMyLhshESlM6yfxnPUm0s73QULcKUul19MjfhF+Kf4KDkILcE0aeZ4aEM/RxertgDkAdMW4ZlTdmvT5uuZ7pgRU6KXDgMVGx+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kho7DaWs; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kho7DaWs"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79853c0f5b9so16255687b3.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 14:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774560720; cv=none;
        d=google.com; s=arc-20240605;
        b=HA3b2WSW9BPWIwjNgRkpsyEAjsB2QjTduZwcLa2f36DRQhn43yDmFroH0JGbpa96R9
         Rdmsn/nfGlQ/fs2iemgmJeuVZ4azoG0U3j4zwcsAhVHvuVcArEsrv7sitcWJtw8c6PGU
         ATjmYLnp8K/ZCY9eiBybKpEtFXOtYYs5SIZxvhBOdaJUCrUabTemBvqM0TjKNWsctWfD
         5ge3kLjg5WZN+Ml6s8OzoPD+e21/7pGTXVV+itNTagVrGxBmcP1FN9U/O/vLqBjNyNun
         DOHnNj45MwYA1YndYoS+2xnvz6AKikP25DBYQgj+LYQtDx0XMxxZ4yY64itxQ7NhdFzZ
         eekQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TZyAuJdbm5lNyLHWtj8JZifMocqSIEE/M15yyD9cWUw=;
        fh=5lzgZ1m2fxmeOPyqB2bR7EuoDzEAh07YmZ2JCO4orW8=;
        b=FRK7hhVl3w9U5V/KKNvN/HrGB6bRKIu/I9TH9C1Pgr2fYjUk+vpselWqu85RJkstDX
         yPY8zG+kUxsxvUneasBxV+PNfP8TE/KnO4wm6i1cOgw6XHwchGN3VxbYBo4fdWBCYZed
         MP4jjEDyHqcGBkvf8TfKcTOk9BKMpJWShe7OmpwSt3m+1UyhMvYlsik514VTuO03QFJx
         e9pQIln2VvIrJybosHEvDz8D8RVKWZVGkhB/O9Hb6MXH2PWTWhbI2haurwnotJm0P2TY
         Ni7MhfEOB6Sty7H0mCSXSW1u05umNAPSd34XeeU89fLZnwql+ONlAqO5K5/vpmM8eFhN
         OjDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774560720; x=1775165520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZyAuJdbm5lNyLHWtj8JZifMocqSIEE/M15yyD9cWUw=;
        b=Kho7DaWsIEK9g/9BJfiXPxDaRWvRSlr9ewjSWhZ3/2jVk7CTpXsD+LMoESL1iui1KP
         AizCuJYgmL+z5WuW900A2ZDSNB24rn3OMknbhvTvkaeEnfpew564K9JouS/ubzDclFcb
         u4h9L3i56FhJQIdnr7oX9QRGOjCj6pINHt9s4Ll4B7MQLLbD6vT1iSz2ui0En3rmrSNV
         xM6JSKvn07/GFG0caP4tW+mUgCMgeCRPWkYnxIsWIA7Q3a+DsGLoeE2e2nA0nOUIVh4T
         wk7nU+5HATu2tS1HYl9MtrIoSioadmZB30NV9ZfZDB7hjer2F2X99FQrTVBasg7zfz5K
         8SKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774560720; x=1775165520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TZyAuJdbm5lNyLHWtj8JZifMocqSIEE/M15yyD9cWUw=;
        b=Nd+LuewT9MvnmnoxynP3ZnWQ8p5+uRx7sobahGsz95UKPjBlacvUabqr+awWIHi6V9
         3Ubb6SzhR01BHS5gxMeuTYAjdmQcT4ZMDAHFYoGKIhW6tXsGy9ZNrVY4vn6U7OQIc0iY
         0HuIeePeGv+SCyQfYg1lUzDqOUVfccM3VEX4uirys02tTcJG8bu1myUZzt6JOrbiW16s
         dQ1exIxp86ly90/2EzWHG4HBlSsoB6L14ED5F8h1LFUJ1IkX1L4iZkclYsP/l8b4iqs+
         D1u41u1ZMrayEMM0lxJIUvewyU2VS4jMjWVZkq6bHsnvMiyk/12AgHjGE6C6t4rLVFVE
         B4+g==
X-Forwarded-Encrypted: i=1; AJvYcCXTWVaCUuoTLPUlNaPP3iBJTuDDjQ9XiTIuwBYUSzcMHiJc9rKx3sSBFQavrSG+dZC8se3dISerAHA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcsh6Zg92aErgdC/O6GI+DqkG3lyrBMzhuCapgGgHWZklNGgN5
	kHllKwWh9VrznMFsRbL4xgiWB9IeU25544q281BYXRMrEIEzlXryL8YU2DJ834s+1w0y3aQhhdv
	o/4hOT6rsrfB2hVZS7rqigGjZojxxOYRWrW/nUXLI
X-Gm-Gg: ATEYQzzDDX9YG+CLeCaIY2bHWgPIkQrxcBPaqIZ2kKRVXpoWZLapi4NzNsYiQNnwDnA
	2YrvTkeICRQuo3nndHtcM1FmbTgm9hw3SfGAn5BhO+fhU9dCySoHCNNS2WH3K9pFiLogJEjXrI3
	YAaHeDzO8CXegC0r3QgZB/PR3tJQwFjCeOA62wBnNNqsaG+5ka1tcfOs8T/8c8dUC5Xfvosf6ds
	gbO2OJJtoaFO/fazjs1mm52EGmIDYxv2ZFJhJ77FEbUEXYePSiKbL+m7B/RasJ02HZ3od3P3tkx
	Rf7QcgkH
X-Received: by 2002:a05:690c:368f:b0:79a:b409:b62c with SMTP id
 00721157ae682-79acf39ca9fmr101703267b3.22.1774560719217; Thu, 26 Mar 2026
 14:31:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305-kflagstab-v4-0-6a76bf8b83c7@google.com> <b83c9524-13df-47dd-a597-bebab93288d8@suse.com>
In-Reply-To: <b83c9524-13df-47dd-a597-bebab93288d8@suse.com>
From: Sid Nayyar <sidnayyar@google.com>
Date: Thu, 26 Mar 2026 21:31:45 +0000
X-Gm-Features: AQROBzDfMgZ3xEPPX-07HtZ6qMri8pHd4_VLlgIvmfka8IMZId9kQN4ffSRsYhc
Message-ID: <CA+OvW8butx7OD5ArjWXm7osCf4tV2O-suNHcHj4gFaQfMMPjwQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] scalable symbol flags with __kflagstab
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, maennich@google.com, gprocida@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 12:49=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> w=
rote:
>
> On 3/5/26 5:55 PM, Siddharth Nayyar wrote:
> > This patch series implements a mechanism for scalable exported symbol
> > flags using a separate section called __kflagstab. The series introduce=
s
> > __kflagstab support, removes *_gpl sections in favor of a GPL flag,
> > simplifies symbol resolution during module loading.
>
> I noticed that the series has a bisecting issue. The module loader
> doesn't see any GPL-only exports after patch #4. I think you'll need to
> squash patches #4 and #5 to fix this. Alternatively, the patches could
> be swapped, with the caveat that GPL-only symbols would lose their GPL
> property for one commit.
>
> Nit: Please use simply the "module" prefix in commit subjects:
>
> #1: module: define ksym_flags enumeration to represent kernel symbol flag=
s
> #2: module: add kflagstab section to vmlinux and modules
> #4: module: use kflagstab instead of *_gpl sections
> #6: module: deprecate usage of *_gpl sections
> #7: module: remove *_gpl sections from vmlinux and modules
>
> The changes look otherwise ok to me. With the above fixed, feel free to
> add:
>
> Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

Thanks a lot for the review. I incorporated the suggested changes and
sent the revised patch series for review.

Regards,
Siddharth Nayyar
