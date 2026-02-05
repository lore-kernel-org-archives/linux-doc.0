Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696353ACF08
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 13:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770297016; cv=none; b=oyzf/qkKB3zszCXIwjRKuXHG74oqvexLP/vW2p7RelaBhwamVtlMrqaGG1XIXnqvfGcM+bK57vRVycKvucMw9uUV+3q+ufjATeJWyZp5MaNZH7ypZYc97ijh1wUBLumRz152R5bEFVWA/7zrl1QQ6V8sp752TGhtnxdS8m5NoQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770297016; c=relaxed/simple;
	bh=g06hxuxEUhC4yKf7OWaLtDoSkFebbaVKoScO/qtaIEo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h++8UFdLNcMggE5bL6dF/pI2EoTW4SGK+CMWllUOqTgyFMbMhREP5ayh+bbooprffo1bcDLTrKsUaDXsLnsRjjhmnJsuOLuln2xJfOKFmeiaonLRWfogXTRRuJiqnVXXnVQ98StsS27gabsucOtOOdjFRc6kGSfdY5iUhPNL4KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YC2UxFPi; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YC2UxFPi"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso9817535e9.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 05:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770297015; x=1770901815; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g06hxuxEUhC4yKf7OWaLtDoSkFebbaVKoScO/qtaIEo=;
        b=YC2UxFPi4+1WHeCj6ORQX2JVh+2Ew2eyUAiGFj4CSvbdKSZQDbUOhX/4gzCPTR6AQz
         9qrgOMV7y5RdhlNxKDO3OCT0x+NHw0sky0sOznKFW+PYGoqkFP1pDoOBrRo8nfAr3tOu
         sIqcFshwIzuIRI7aShgxG7XuIk6ioQ32g8k7zEExY3y4myW2aJn9rXBptYXVAHvAIcvC
         v+bKnchz4KpcQ1fBDAn/+sXbMuXdjOjuvMAxqDEafbnUA4RYWszGbkZoVVL+ViuvfrXV
         OiWWJxC/RltE0LbdSmE4+RVeQgwB7vKtDmk1hENCqinNjiY34JFbdP/K+S4eMQNZ6Zmv
         VD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770297015; x=1770901815;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g06hxuxEUhC4yKf7OWaLtDoSkFebbaVKoScO/qtaIEo=;
        b=QG6HeWqIbOYFNAiph+79/gVNtJJffS6sUsAT+gMFcBEtiizPmiDPw5EGahaEy4UJNW
         B7qZ7IjPVTcpkFGYea6UI0pjcTkdkJZi7bM4slSrm7XjRyMvA3m6Nvt8/jlUiZK8dxVH
         bNldGzHYHXn35QdhjlyAWnNUEBtUv0CxTnLisDZkyf6OQk0dlohIvqvIUA0UFdwVR6Fw
         4J6X034QOd+sGeOvi/1ts4GEkW7rGEdW6dPyUVftw7zjgkt2wxO/swIA+LJ5Je5q2IsD
         KpIwyU7BaGVjDkmszEX+Hk5mfN1a1O9xMMTeXADKJmIyUimCB7aJ8xXPfy6CSpHHtePi
         i4vA==
X-Forwarded-Encrypted: i=1; AJvYcCWh+pzxPJdVD+iOnWhTRXAbVP5SmakseRo8EDTBph4ILEIf8RUSiJD5z1/833AFmqsIDh2gyGz3PhE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc9U05Or1xuI8GSd96YsbUBYKO8CHMAy+OYsu0DLoFk+VVUkLB
	wk6/wSyuyz1mDDxAtgpIQ3GMJKtfi9c+Q+9hOJV94SjzW5NgnMNXO02i
X-Gm-Gg: AZuq6aKmv9aSy7xHFQGNYYdfojAA++rSJht3r8WsVNZGyCWPxJc4nTcqluCjBgaRNYo
	/to3yLS5ruNHleqKByZv4oFCTVswPJp0F3XuB6gLLSq02YMhc1UeAv5Ylbagw2PZiQ4sv3+j4qX
	b3RagChPh/0Rke/evdXgR/y988XJAysgpHU9sIStfcqzkKi/g2pJBMJnKcKxvvgOw6wcTpt5l5f
	1kjljya+lsfdy2eVU13Fnk65bIjlVVbW1pyeKE+2wPA+b+uKc0dD9O5BQ1v93VKyzahKeG+Plyd
	jZQNvNDR+5+rMQTm65aofghIIh7g3osnHn2OR1p51m4XAJISR5YpKztYgKteocxPg8PL1k7ibC+
	IldiVNXc8ywxEHX97OqLup3xv1Yef0NAcyuuzsU8nZv8EfWLuugIEMIhpgcy6l9nC77koZzIx47
	4wM5Sza2slX2Ox1pw=
X-Received: by 2002:a05:600c:3549:b0:475:da1a:5418 with SMTP id 5b1f17b1804b1-4830e9351f5mr99191295e9.1.1770297014494;
        Thu, 05 Feb 2026 05:10:14 -0800 (PST)
Received: from [10.245.244.111] ([192.198.151.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830ffc9f3asm46238925e9.19.2026.02.05.05.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 05:10:13 -0800 (PST)
Message-ID: <acebbfddad686122c4aee9d1a87b048379dffbab.camel@gmail.com>
Subject: Re: [PATCH v7 4/7] ACPI: CPPC: add APIs and sysfs interface for
 min/max_perf
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Sumit Gupta <sumitg@nvidia.com>
Cc: viresh.kumar@linaro.org, pierre.gondois@arm.com,
 zhenglifeng1@huawei.com, 	ionela.voinescu@arm.com, lenb@kernel.org,
 robert.moore@intel.com, corbet@lwn.net, 	rdunlap@infradead.org,
 ray.huang@amd.com, gautham.shenoy@amd.com, 	mario.limonciello@amd.com,
 perry.yuan@amd.com, zhanjie9@hisilicon.com, 	linux-pm@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org, 
	acpica-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, treding@nvidia.com, jonathanh@nvidia.com, 
	vsethi@nvidia.com, ksitaraman@nvidia.com, sanjayc@nvidia.com,
 nhartman@nvidia.com, 	bbasu@nvidia.com
Date: Thu, 05 Feb 2026 15:10:09 +0200
In-Reply-To: <CAJZ5v0gBHrGf4TpjqV+W5YynM+9_xWpepgrOiRegSYS9CvPV1g@mail.gmail.com>
References: <20260129104817.3752340-1-sumitg@nvidia.com>
	 <20260129104817.3752340-5-sumitg@nvidia.com>
	 <CAJZ5v0gBHrGf4TpjqV+W5YynM+9_xWpepgrOiRegSYS9CvPV1g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-02-03 at 13:43 +0100, Rafael J. Wysocki wrote:
> On Thu, Jan 29, 2026 at 11:49=E2=80=AFAM Sumit Gupta <sumitg@nvidia.com> =
wrote:
> >=20
> > Add cppc_get/set_min_perf() and cppc_get/set_max_perf() APIs to read an=
d
> > write the MIN_PERF and MAX_PERF registers.
> >=20
> > Also add sysfs interfaces (min_perf, max_perf) in cppc_cpufreq driver
> > to expose these controls to userspace. The sysfs values are in frequenc=
y
> > (kHz) for consistency with other cpufreq sysfs files.
>=20
> But this is not cpufreq and it is not consistent.

Just my 2 cents to add:

CPPC and Intel CPUs don't use kHz for performance scaling. We should
avoid introducing additional kHz-based interfaces where possible, since
the performance units <-> kHz translation may become more complex over
time than today. Future implementations could involve non-linear
relationships and reduced accuracy. Minimizing kHz interfaces now may
help reduce future work.

Thanks,
Artem.
