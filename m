Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52F613633F
	for <linux-doc@vger.kernel.org>; Fri, 27 Sep 2024 15:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727449317; cv=none; b=r2pB7Cq8lI6hvW5bZHKNTOYQULoe4HCDy8g12h0sUjskFmliSudM7m/FXxDOiV2Skck8f9uISY6tuZYrJOLDgjWJNWDmkiOmqiAx3C0CJcVsaIwdMIHX+2V0YBIHSyFutrs7bR1+HkRMos185eoifTh2WRYmsTjaS9ORN6bevHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727449317; c=relaxed/simple;
	bh=W7N/EQeR/lhHhguPLRJprccZj2+9O2XDkauEROKyWh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSXnP78WBSODleuKTAR7NQmhYBPrNXktg9jJZbL94yC6eEOsuyJiciWw9SwRjAmewi0jzVfZmRQoscdU/Q+3HSpppYnFG+x+doDI2YdUoDKurIJuqlHsCues3gFxLEz0Zsd7IM3yx6uIuWMkrQ04lagmVpmy7XX9cUF1KRptKPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LxutwokS; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LxutwokS"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8a6d1766a7so289534666b.3
        for <linux-doc@vger.kernel.org>; Fri, 27 Sep 2024 08:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727449314; x=1728054114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UUM+bpOv66Y9QgP1R8130p8o9XHECAN86pwWkNohE2g=;
        b=LxutwokSHgNszQo9lkqG/jjuf0AsRpNh0yJG76HayBAC5YddOew9K5h4o5IrgGuPIM
         PRYJi5zC66T4q81KPdfjmsrg3Z0yHY0WbFVUQUjGJh+p/dNe0bExNAOUd+jLxfHfaPDL
         Se4dhvYRgHndlVL32TSN2rKxU/3jWbuyp6lvncySO+LCyfhiWaIaHAYfBS6OwlSj8jIN
         HEV4HTavR0ip8Hk52XZzQ59P5Ao7dqYt80dXce6dz22AkawWj6qAxNVT+hgasuoNUosJ
         bty0W99d9uz9r5gHxo9LRYrls3dzG+v4OQ1rEIT0LMrp+NhCjVfuFMj13oPbYwbgLDeE
         h+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727449314; x=1728054114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUM+bpOv66Y9QgP1R8130p8o9XHECAN86pwWkNohE2g=;
        b=nJIfR+Ml8rL43ecU7XyZv6HOmy1+frAqXMp1qUShWgHsR8eGCNdHkY5BHpFESH3Esp
         R1FNC8rBnrjdVUo1B4WAYiO47i4eBmO3ths2g3haRCHqnZc2weV0gR+U79aPLSTw7Sfa
         9AMa5PPfuy0CbW15RzakIAlNE1xTS2db2FC/qTeFpQRan4vK2rEtsiMzhy72DFJnDo5Q
         9TSivmnHWv8MIzG8hIgM0vdJ6WKnoH04ZojNkExKwhRGL8ip7AjHlii91JNi0yGGDhBY
         iwj1iB08EGuyiyPKkOqfB+nhkHeC8BscDjTyNyJ+Qd6+kvrYT3k0qX8sOg4Ag4QpBsH3
         zgYg==
X-Forwarded-Encrypted: i=1; AJvYcCXb4y1BcCPUDcGCrjMGw7k1ccG9gNbCP04OtFXFwVB137oRFhznCkT77c7rkWKKidaK20qPmDkUGzk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+RhKR0dK677JABiLA18oXJYxdkDjm4kjb6tB/SnQeG56DQNDN
	4mDIMoCkrvLFI5Pc7Vla5wvzmnRfGw+0FlvLmYQKRhthjT5hTIo/tSamzKYNeTs=
X-Google-Smtp-Source: AGHT+IE7aH+/QOJ0USm8BISs8pFXjirWHHWPmNv3Lor3k3JqBdyLPa/XnrWJ/uRw2UIawMPkzVKemQ==
X-Received: by 2002:a17:906:da88:b0:a93:c1dd:7952 with SMTP id a640c23a62f3a-a93c4c2839dmr343180166b.56.1727449313906;
        Fri, 27 Sep 2024 08:01:53 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c297b597sm142688066b.182.2024.09.27.08.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 08:01:53 -0700 (PDT)
Date: Fri, 27 Sep 2024 17:01:51 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Ivan Shapovalov <intelfx@intelfx.name>, linux-kernel@vger.kernel.org, 
	Mike Yuan <me@yhndnzj.com>, Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	Yosry Ahmed <yosryahmed@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] zswap: improve memory.zswap.writeback inheritance
Message-ID: <5hnu3xa5hcusvmvg37m5ktsfcutghk2z3dh7lcoctyyfluabqv@u4ma5mafchpw>
References: <20240926225531.700742-1-intelfx@intelfx.name>
 <CAKEwX=O=Qu4LZt79==FztxFjgBu2+q7C6EDji-ZmW5Ga38_dSg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="axzvv5m7sut2voab"
Content-Disposition: inline
In-Reply-To: <CAKEwX=O=Qu4LZt79==FztxFjgBu2+q7C6EDji-ZmW5Ga38_dSg@mail.gmail.com>


--axzvv5m7sut2voab
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, Sep 26, 2024 at 07:28:08PM GMT, Nhat Pham <nphamcs@gmail.com> wrote:
> API-design-wise, this seems a bit confusing... Using the value -1 to
> indicate the cgroup should follow ancestor is not quite semantically
> meaningful.

What about assigning this semantic to an empty string ("")?
That would be the default behavior and also the value shown when reading
the file (to distinguish this for explicitly configured values).

(The weirdness of 0, 1, -1, -1, -1  would remain. Maybe switching this
via the mount option could satisfy any user. Admittedly, I tend to
confuse this knob with swap.max.)

Michal

--axzvv5m7sut2voab
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZvbI3AAKCRAt3Wney77B
SdcwAP9zU47ZgUAzX3AO5mbdpBmN640D27AJpW062yLgfBHb1AEA/fL2ZMKKBoOD
BWyYV695rIq1IDleJ9alQhdyyvtfpgg=
=4dtO
-----END PGP SIGNATURE-----

--axzvv5m7sut2voab--
