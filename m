Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C99525A343
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 14:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762956138; cv=none; b=lh5lJJqxw15+hlYO1fZTwhD9U4yDXwQDvHtyO2P95h+3nivLB7osK12Lxw1ruESbWAEy1CkubABalnfCGOaUgXU7jXLLS0JjL35LHO5oWoHTA2YLT3LEnrYYMZRp9JZqAYWTqmoZ0q9+I9WU+ac48NIrW5gGBcG+mFvTSjyWmW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762956138; c=relaxed/simple;
	bh=SlEYDOScQZNVr1WYQjXUJKiqkkseqZPjckRYMu3nBoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CIhrgVCCCGD8hMmlimr1lXk6/+ynHy+qYupj/VFMnk3rTHPX3OWXY6LI8P1Pky4pUo9o4z5lxJ9SuMTaNhtXOe54H+wpUuxH5TDabDUoXqQU1HqJRJsltTT/p0jQErEyFWMWaZJ1gu0YQ1K6+Iyn9aWoXpd2pD6GpACZhVmATkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RcnkXanq; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RcnkXanq"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so511894f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 06:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762956135; x=1763560935; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=97+x+h8dQ4e8GUTjDZqoRrL1FA9+Qvtg5x2caP/F8R8=;
        b=RcnkXanqGjT8Whv4CCstturHR4uI5lkDApZuKUjhCQQ1GvnH/AWDLvN+8blXno9HBj
         uD43U+goT9He3rHbTnqXwmRB/QSEQK2hf96/xJij8GxaZdrR24oLPcFSOcurpgj7ynQr
         mMVHKgPMFxdw2HaBPDJIXxIeCs2Y4/FTpIHL8LJkunWvmHtvrD0+fYoXnMd8hdlWDcvM
         QcABsylAuLD/yp47dQVLPgjy1QNsJ9Xe0joC173EH9DJ6f/w2o8qppdE5EUI7wFfPH5i
         u2vU/JNPh5ICSPPMtaz8QZRsnJANH8M+Jt2L/6zmIDo8r39puVR7U0y4lC+dXDNpsmE2
         n3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762956135; x=1763560935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97+x+h8dQ4e8GUTjDZqoRrL1FA9+Qvtg5x2caP/F8R8=;
        b=G4p4RaTlg+ISouMiKknqrr6k+XCx8VVsRpkqRuZ8TX96Nfk560/tLjmZYAYtkEW6NR
         Y68mKApVhQIwB1ilPilPTcz3v8BQ4DxUwsVGzkBVhJM9jlrZckpjROdjdskqUgSFZri+
         NlegeLOgS1t094VkPNtPR88qb0IVjkeqH2FvR8aAndQdSydQE8DXkbERX1LdDwcbEOUD
         5YSEYGkorKZlCpvjsLzkTKYtN8OI85naqmt+GPvaNGSnS9+VTsEG9rsR71IbFv4j6Cyo
         E8CUI6WYp4sSVeQVPysyDgmAkucyItAPc2NmkQsSW0Jw+wVgA5y6uvCqxbcTfYdufT9B
         ayng==
X-Forwarded-Encrypted: i=1; AJvYcCWTqgtyRoH58DA/DiWQkWQQKsWWR2Wy4g/2OVQNE/0/LduPkJFGYrnC8iVPy36tOgy2d12BaisK2o8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhztz4z4n6uSDTL0saek+c7yS/bjx1zNqQBy3eDZqBECai+mWy
	nO8tU0kc6Nqc9GojnFRh5OIXrJgM0TGq8dL4XdF3UMllutysJM5wQ7k5m/krcyvKRbY=
X-Gm-Gg: ASbGncsiEaH3RmWY9hxGs/6vWAfv3GOgcqQDZhaUwSaMIwNdXME7rxr3tNaKUwdUo2m
	+Mm8fzxBBR43AO+Eb6PJEZiQOYIrahM+ryM75MKypCOsR46vymeJj7qSMDF9+jewoXJSzX/mnm+
	y2NP6C+1JnpKXN9b4H9YxZImfD1dnxPT89VNS5QckM1lb9JZLtFb9AAGeXF5oURKzBUJ0hYPpMP
	tBuAg8K7Dx7VTPNLbiaGsFuNC7kTK288Dkqb5H9ZYJfIMfVm8E42VqDA8tFtG/Mnm9T8gOLmR3R
	jxiNuOtbCto08oAjrznrE9C/lL9uzUWWY3Xxr4LdFLMbPOjxjjuxXS32MuBLVdO65hrCD9WqT6M
	0mc6H1/QxxduXAZvSNNa9/liY7QSDnJza0Fp8eUrk+qfHKaIPhQjhS+Telq22B+Od4IeE/iPF8T
	aveR9z1a0ZH4GLUj+oy+XB
X-Google-Smtp-Source: AGHT+IF+oB8mjrQRe5QSu7EfBjAysEQG22PZLyD/6924dtA5Ki8nSfNI1qTwkRcog78mpQsXY/aLvQ==
X-Received: by 2002:a05:6000:615:b0:426:f9d3:2feb with SMTP id ffacd0b85a97d-42b4ba81c5fmr3242633f8f.23.1762956134571;
        Wed, 12 Nov 2025 06:02:14 -0800 (PST)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679c5dcsm38723673f8f.44.2025.11.12.06.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 06:02:14 -0800 (PST)
Date: Wed, 12 Nov 2025 15:02:12 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Chen Ridong <chenridong@huaweicloud.com>
Cc: Leon Huang Fu <leon.huangfu@shopee.com>, akpm@linux-foundation.org, 
	cgroups@vger.kernel.org, corbet@lwn.net, hannes@cmpxchg.org, jack@suse.cz, 
	joel.granados@kernel.org, kyle.meyer@hpe.com, lance.yang@linux.dev, laoar.shao@gmail.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	mclapinski@google.com, mhocko@kernel.org, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, shakeel.butt@linux.dev, tj@kernel.org
Subject: Re: [PATCH mm-new v3] mm/memcontrol: Add memory.stat_refresh for
 on-demand stats flushing
Message-ID: <chffrjnr5ebky6aytx6va4lptu7mbxclmzqvzdnjwa6hrb7fzw@ewpebokeqfzs>
References: <7d46ef17-684b-4603-be7a-a9428149da05@huaweicloud.com>
 <20251111064415.75290-1-leon.huangfu@shopee.com>
 <2f43bdf7-5ce0-4835-9e60-39d91f637152@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qrv7ktcycf6a43eq"
Content-Disposition: inline
In-Reply-To: <2f43bdf7-5ce0-4835-9e60-39d91f637152@huaweicloud.com>


--qrv7ktcycf6a43eq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH mm-new v3] mm/memcontrol: Add memory.stat_refresh for
 on-demand stats flushing
MIME-Version: 1.0

On Wed, Nov 12, 2025 at 08:56:28AM +0800, Chen Ridong <chenridong@huaweiclo=
ud.com> wrote:
> However, this fails the LTP test quite easily. The error logs come direct=
ly from LTP. The issue
> occurs because the threshold isn=E2=80=99t reached, resulting in an RSS v=
alue of 0. We tried increasing the
> memory allocated by the LTP case, but that wasn=E2=80=99t the right solut=
ion.

You touched on a slightly different cause (other than  async flushing)
-- there are other fields/stats that are quantified by (basic) page
size. I.e. I think that might need different/more central solution, e.g.
working with absolute (not relative to pagesize) thresholds if absolute
precision is needed.


Thanks,
Michal

--qrv7ktcycf6a43eq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaRSTYhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIACgkQfj0C55Tb+AiSagD/WULk3YU+JZ1RgyrGtBcK
Rk5AScqXYcflK31hxM9Cw9UA/3e8l571U4YVUYXkPQ44w97Y1nTKbxU0rJ7BHri1
sywP
=pSJv
-----END PGP SIGNATURE-----

--qrv7ktcycf6a43eq--
