Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8183F20E006
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 15:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736523317; cv=none; b=j9sDvldP8FBOyDqUCoDKCDVhzUb6L0DlNa1l7I2MAcHibJ1/uhawF8U1PY8R052ctLe/+PKN1SQAUoYYu9usEID346p3mP7GaJg+JXOaj8DQ89lU88YoLTbuP5NZu1njPM55Og2wk501sssntMroBQcx9D8ohnp+cKdsiHJngHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736523317; c=relaxed/simple;
	bh=d5Sw7dBjPFZKUxDbI6GyHLqIDgVlaRFY7ylsIvSUQHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IqvTJCKpk4xK9dGqMYoAfNN6a7M8F4FjpsxNqu/HRMmZKIfaHXKbtpa0bNjs6C/vF/dT84BpJ8IbvJrFEN2M22Ywhnwkjn55qqStk+McBmN0e1fqxONs1sAjXvqLsjC/uuRavxYYpbvUv55i477pVxvUTALvBIjk2ojmaFIol4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JMHZGONB; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JMHZGONB"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso23635035e9.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 07:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736523313; x=1737128113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hzALuTeGsxrz2Ujv8VfVqM+kWyzyAjXVBbotfhCob1I=;
        b=JMHZGONB7jeXGuWb6XanYWOGxnuBwuzm7IfsDf8wv31352q0Sde5ynA/XDAGETFn6+
         HOdZeU031qQfXxGAQ8s6WDnSYMiSRfV9XTma3TlO2XRgaM+NE7kpyZLzBcH7iChjao8N
         iVVtkM4wBSyProMvyqLvt3V/X92GLrCdZlCHM9el9LnfcXcrXMqioAzgDnecLl4K0zly
         SRNgC/DvfHiLc+Zr4BUDPKfBpL5JYL/chBSvwFD0TQRH5VbvAa+ebAgRoAIGeTn69P9o
         3n+efToQYyGJlzRD1ksLkS7orDIx8ihW14i/2CMBknh8W+TWTfHMiBNu1SrblgFJsUST
         InJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736523313; x=1737128113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzALuTeGsxrz2Ujv8VfVqM+kWyzyAjXVBbotfhCob1I=;
        b=Hd1QI2frLSWB8YK9Y0+1GsSEvrlyvt4Wtp+Mdg2A4A0wxkpMbKmkuRCSQuF4ZhHZdw
         HlDDOQHIDDNTsGNkfuNQx963JBKrIeJR/LUmErR/EBhWq8XIhFnjiWiFTKo6EAGVtSHg
         UcVc6aKC2ax6rHBhOyByjZ9d2qJCjZPZ1WRqrCEDUNjcNn51DUaHSxvsy6LeP93xGnSm
         D5cAHuhrtiGUimB29Ly+blt5toZ7rbGo5ZP9dHT17CcqACxamZtV14s0dgzwwpXkM16B
         LzC6tYxiBVyXghX4LtDCa/G54ETYL2tAkLigE1C6SAXbkjIOEv71EQHRKbIjNfw7fOj2
         z+Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUW+WROs2gRl+scL1m7JGfWmw2M1aeqab2JG2CWFjeeQDu9PpoRDs0NlcV39LErD0jKQhY/bv4RNPg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+d3oQlVetaqn9FLuS1JJjVBD/b7jBVsLA909WIt2SW3SI6f97
	w46W1QEPf3dp/XZZ87SDT8IJNJ+A0aDVWf+X5QBJTONzAWXKyGJSEEq4XgSBuX0=
X-Gm-Gg: ASbGncsGoBecxZiwEDg8LPibXt2AbUokpOQbA8ySXvXZ9geHDy6vxJaIwVBIk+4Zhqm
	VZK++/WZW2vbj99y+huElkj3z24BFho6YsdPWjNQZeZMImpbmaxfqh6cVAd81SW86opYXgFpUAL
	LPYqLdOyj8FrbgWkcNPjA/IorHGCNnTjzbT464idgaUShsWysE+XwXZkLvwB2Rd1ak0ygIPuke3
	olgSNeqwxcU05AKbkdbbyDH9+sTcy8MnNXYvZlu8QiFeSYFxfel5BibWUs=
X-Google-Smtp-Source: AGHT+IHQELDGjlEtVs1OouSf4OZtyUs/61z6YsUdiHktml3cGrNJbR8ZCZW5j57nJeAB18w3daTKJQ==
X-Received: by 2002:a05:600c:4455:b0:434:f623:a004 with SMTP id 5b1f17b1804b1-436e26adfd7mr26396275e9.16.1736523313395;
        Fri, 10 Jan 2025 07:35:13 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2da7768sm91710555e9.5.2025.01.10.07.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 07:35:13 -0800 (PST)
Date: Fri, 10 Jan 2025 16:35:10 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Waiman Long <llong@redhat.com>
Cc: Li Zhijian <lizhijian@fujitsu.com>, linux-doc@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/cgroup-v2: Update memory.numa_stat
 description to reflect possible units
Message-ID: <2piu6sz3vkjl3scu6puo45ewu5ffuzv6ikeetgt6rizpswkcec@2uezwhes37io>
References: <20250110123019.423725-1-lizhijian@fujitsu.com>
 <a8d5ded2-6921-4c6b-890d-17227147c28d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3oon2oaiqfe67wkw"
Content-Disposition: inline
In-Reply-To: <a8d5ded2-6921-4c6b-890d-17227147c28d@redhat.com>


--3oon2oaiqfe67wkw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Documentation/cgroup-v2: Update memory.numa_stat
 description to reflect possible units
MIME-Version: 1.0

On Fri, Jan 10, 2025 at 10:26:40AM -0500, Waiman Long <llong@redhat.com> wr=
ote:
> > -	All memory amounts are in bytes.
> > +	All memory amounts are in bytes or bytes.
>=20
> You mean "bytes or pages". Right?

Despite both variant are logically correct, the docs should better say:
+	All memory amounts are in bytes unless said otherwise.
(so that it points to respective explainers).

HTH,
Michal

--3oon2oaiqfe67wkw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ4E+KAAKCRAt3Wney77B
SZFUAP9hLFjYqd3/wr4uFM4W9vQFUjRXegr01fomOrtEJf8s9wEAmzHh5AOwn5F1
klsrKNloo7jlKJuiIi955hnrZUEhpQc=
=couS
-----END PGP SIGNATURE-----

--3oon2oaiqfe67wkw--
