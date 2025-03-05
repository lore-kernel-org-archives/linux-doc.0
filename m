Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE07567D
	for <linux-doc@vger.kernel.org>; Wed,  5 Mar 2025 16:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741191592; cv=none; b=SciA7/MdaIEhG9LlqRaCYG8Ry4fFrRr6eiHxiY9GP1ITflWacnYVXDzaYu1hYWokgD2a9ATZ2JTznIleXWmzo21iaLccjuES4bTw+jPHiC5t+KGs84SK8Rpw6LMEtVoL11a3oJUBAwu6AzL2kWQpIiUwA0+Qt1b7IooVJvkK9hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741191592; c=relaxed/simple;
	bh=lfd64ISt/RbrcjtvA7JF0gaXVbwwmUokpUC9i/vb/O8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hv0t1sQ0rI/8DjocWrSFPkNzNJZ9zP7BMvknFPgjoNNEbOKiZiqQwQBDJkblRgzR2kpeM7A8kvb1W4kMgw1TzHplRUV09VkRrsK9s7BBrI5vCJzo+IM9xJYpbXeZOPM4bjYvacS4VZ85xUXG0z1jZX1Jqzw2Xj5hO67x3DxSEV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZEzjGrd8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZEzjGrd8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43bd5644de8so8808275e9.3
        for <linux-doc@vger.kernel.org>; Wed, 05 Mar 2025 08:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741191589; x=1741796389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lfd64ISt/RbrcjtvA7JF0gaXVbwwmUokpUC9i/vb/O8=;
        b=ZEzjGrd8W77Dz+Gcck7iqywTksdbLXgtO58AMmFKoJ67Huug5Dt6P6ExpIYKKmPhSi
         sXE6NDoX27fYT1/qUXzaxKWDKPqkF98VL6WtldXSAOeSd74nYIrgLAiXElQ0sDXenVLr
         78A0dJ01ZgNkc1CyOtc+k3Xn661skl9qb/NL2HkcBV/yTjwN4wJau4KRWCKRM4Zkdu7v
         RtYKBP51+ym4qJWwmDwvYPYePNFNe3HYgr6scmtvj9m4KgAh4gOLSL5kFqQndFrdalXm
         qhXzDs9XJ+5ujYj5S2nRCfM9A+SSrdrYT5QunjVpqZfI6FtudCJ6TVoNJZ7CQVqBJClp
         gbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741191589; x=1741796389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfd64ISt/RbrcjtvA7JF0gaXVbwwmUokpUC9i/vb/O8=;
        b=O+mcpT0byFOBFv2AHcg7PJd6lsFfMnRu5kJ6D8BsFLwsS0LPRASwsSxBVbcEGHSoXH
         SOFueUWWOHS1SLj9XlrIxKm1mSGQGgKFpK/84yOPIE5SiREUqcyrFDkXA92Il4KFmgqc
         7LBo09oJTUXf26SU62vJYw4UnnpuRH9R2Hy4jnsof9vW9Pw3HTzjM1+QqBMyIza3BrOg
         np0n92Fj7OHIoHIKYSwKCFYb6zor/exM14sRQqGdLLSsUgrWB1M1oU3Gf0loIPmmtvaH
         HfUvR+tGvrJlV7l2pnD4K0+qSUWyEMvNbid4MzdrcZyLeG1sQlzZpw6JucV30xcvaetJ
         hfPg==
X-Forwarded-Encrypted: i=1; AJvYcCV4S6skgTTT0xTIfpuMPDSh2wey/wz0tR2HZhm19vcWF1C1UJwJ3vFy3XuPLd/7Fjixdq2LHB7szp0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJWLKhEzilR+yBcWSPiJcHtn+HZrkcGaixrbwwRIZWbaNsnyBc
	FNXRqGXC2zOb0SHEvB1Wh3ojZKVvSXSQAGc75oGDoEJV/15FZ16/R1/VQHIbR1U=
X-Gm-Gg: ASbGncswJU7j5KqbAT8esW0uuTUibHDFPmekCtoWdKkUjbkGjauLRqIx74rl7DtmTSd
	JmTOZSKs4CawepzhwVcb+Zl3+i0aNs9dsQCkokzEVS9tO04Mb7KTYFbUW+YMrmdWrPNO117jxPU
	y8EKEG41C2LCJeG21wc1KBbK42klWViv6PdV4UIhmuWUxlh1OxQTbOCnJ9wz+PhvvUj0VVssQMS
	AqGxlfKRY6GPyfYiDZ03e5P941fKw/nxEZXlZ3kpXfoAjU0I4VDRanIPQ9O6S2iCyWP5bkgPlDc
	SJm3gASfCcL0Oyh9exeJtynBRMuqXwjLn2YSBYV8QDsxTDo=
X-Google-Smtp-Source: AGHT+IFoRFVOSxz4aXuAZrJ3O/Og36uum919iPEJQo0fgDe96HeJ4Jmhlw2xmiXGf0Dk1Ste551NFg==
X-Received: by 2002:a05:6000:156d:b0:390:debd:70c3 with SMTP id ffacd0b85a97d-3911f7caa1fmr3937218f8f.54.1741191589084;
        Wed, 05 Mar 2025 08:19:49 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485db82sm21108816f8f.88.2025.03.05.08.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 08:19:48 -0800 (PST)
Date: Wed, 5 Mar 2025 17:19:47 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: shashank.mahadasyam@sony.com
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Waiman Long <longman@redhat.com>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shinya Takumi <shinya.takumi@sony.com>
Subject: Re: [PATCH 2/2] cgroup, docs: Document interaction of RT processes
 with cpu controller
Message-ID: <thhej7ngafu6ivtpcjs2czjidd5xqwihvrgqskvcrd3w65fnp4@inmu3wuofcpr>
References: <20250305-rt-and-cpu-controller-doc-v1-0-7b6a6f5ff43d@sony.com>
 <20250305-rt-and-cpu-controller-doc-v1-2-7b6a6f5ff43d@sony.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="grdslyhitlxydqpc"
Content-Disposition: inline
In-Reply-To: <20250305-rt-and-cpu-controller-doc-v1-2-7b6a6f5ff43d@sony.com>


--grdslyhitlxydqpc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] cgroup, docs: Document interaction of RT processes
 with cpu controller
MIME-Version: 1.0

Hello Shashank.

On Wed, Mar 05, 2025 at 01:12:44PM +0900, Shashank Balaji via B4 Relay <dev=
null+shashank.mahadasyam.sony.com@kernel.org> wrote:
> From: Shashank Balaji <shashank.mahadasyam@sony.com>
>=20
> If the cpu controller is enabled in a CONFIG_RT_GROUP_SCHED
> disabled setting, cpu.stat and cpu.pressure account for realtime
> processes, and cpu.uclamp.{min, max} affect realtime processes as well.
> None of the other interface files are affected by or affect realtime
> processes.

I'm not sure the changed formulation make it clearer.
What was the unexpected value with !CONFIG_RT_GROUP_SCHED that made you
change this docs?

(Please note the docs is for generic cgroup, not only root cgroup.)

Michal

--grdslyhitlxydqpc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ8h5oAAKCRAt3Wney77B
SZS9AQCweGn9vmr0uVAY0ditk3HYDJkXqtlv44llDojm9l8lfwEA+VwWyZAHkc4M
qf0ODOchzeAkh9aPU/wjv2zNmo43Iwk=
=/JpA
-----END PGP SIGNATURE-----

--grdslyhitlxydqpc--
