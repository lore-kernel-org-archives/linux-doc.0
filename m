Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CDD218ADA
	for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 09:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737710568; cv=none; b=CxOECAgQt41w0Fa9OGgVbr4mOpDTbe8cuOLhGRllIAwxTlojrIAXcnyH4/TsRKl+zmxasUm1nb9qzAxgRDXkW6yUKNtEyIbiLSzYqT0Qq1cBDKNC4/p2oUkMKS/EyzUO8UEBqK+IBOtWl4NS2JVdJBJh47YtN4ZQ3Myhzo+OOq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737710568; c=relaxed/simple;
	bh=tOfZmZ3X2M1YsShLam1ysLU6Wy6kcFyF1UG/dG56FN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ou69eW9XbXqWV9IRj4kyYNlNpCF70XePRVJIuZ+ptkctyv1bpWTqcuxpk3t7SCyhaNCAf7a2dLscVQlmqlcUDMlj0u0z4e976ALzQ+PoYGZ/dJmSHWCmAFrkoAgNxDSz/xBOip2uFa2ToULQMYqcy4cu4ho1e6Qafcj3uGC1XrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AyDAY5mO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AyDAY5mO"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-438a39e659cso11707855e9.2
        for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 01:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737710565; x=1738315365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tOfZmZ3X2M1YsShLam1ysLU6Wy6kcFyF1UG/dG56FN4=;
        b=AyDAY5mO5Ha2nRjhIh9O2DuA18JjIQabRK0C0QUSNIh9VX0GqJW2YqbX7j3r8dM7k9
         rJLvF8/GXHeNYxE3J06XNnSswWuf1jY7gmjx9soCqSTlAyha/qJa09H4kGox3dqNKMbs
         YMx6A1TeiamJmbSKeCYSzfMaY/KtGz053NBsdht2MrZLcaGm9lg89maRxXvYcA4Wkiqt
         ZII9cHWBK9en5Q9Q9GX6D8VmefA8oo1HUMtQr5v3+dSEVf4v/tblCOmpy5Yd0biXi6j0
         7EIjqmaYXK5uDR8w9hMrPWt26Ls4DdmJThMMG42F7WrLYjDm4orKuVH0Sf5hewX6+j8D
         XQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737710565; x=1738315365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOfZmZ3X2M1YsShLam1ysLU6Wy6kcFyF1UG/dG56FN4=;
        b=Mj3OZIZz6zc/DukLdpcizmW1oWTabGqSI5bh3I9itPQux6BMFP384013Dsivu4JZRz
         qjJOCTlSqgpRLP1PoOCacaSLI46xNXkmrQXK+FO/AAE2a2SMgo4+O8dGse/rQ9H8/i/K
         Hso7nBw+AaMMK44kxBe6Xgti5rTeYgpUKfcpc75l3BZK8lNU/9vhCslmZfSg6ap+naun
         2473cRxBPdbjLxBYKbq9c3uyisgC1sBXWuc/LcT7KMoVy/ZkY2mE3HQtWYaiRmKla5iI
         TCFOKcwmiz74HiQ1dICT15h8zUX3ztRMskr8qyctSUgmtME0rGnVX87V7r8VVPmaWKv0
         HvuA==
X-Forwarded-Encrypted: i=1; AJvYcCXOgBjl1cGsM7O+zYw4orWdTX9kPb8icDIAg7NLzzqoeWakl6g0aa+IeJ0Jcw5xb2d5bbzTY1oc4j8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVaODiZLo4CLAghgtKqYl2aPogjwGT53L+d8Wit8DG3q4D+Oqv
	uAjZ2spHHHDcfKgdn2PQIiXJZ+cX85UHFwD4baGzJ4TCwbT34Z8IXo+nkIeWCWk=
X-Gm-Gg: ASbGncshyTbE6nBDCuuyuZsvV4UETSKjSrKKABu5Zl/vuw7Fc2J/7W0qU+VWiuWBBcJ
	2qdGmXf5QYDHv6m33DpHSE7iyV9UshAVnXE9wReEo77BZlPBfSbAtqngZzTUDfJawcEeVlRu/nA
	2zRO2+pL5E6bPl4Yz6V7SrgKhtm7EfyjDYu9AaQS8gnYBoAH4wQM99E+bUiuXcExNlGa+elpPSD
	ndzaxyQgAl8vZHmlU5n3Y/m2SNrRrjiBrsIAFgEzupoNCWuguL8Jb2pCCHseRV+o/maGFQeoqmk
	QTTLumM=
X-Google-Smtp-Source: AGHT+IGf/ycD9Nuo2PzJtkWm+CufPDTGz6X/LAYynmtjxNnVnFNcfNG5q0gYdRTaIFFgtq10IAJ9dg==
X-Received: by 2002:a05:600c:4e89:b0:434:f739:7ce3 with SMTP id 5b1f17b1804b1-438913cb518mr266642585e9.8.1737710564956;
        Fri, 24 Jan 2025 01:22:44 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd5023acsm19659035e9.16.2025.01.24.01.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 01:22:44 -0800 (PST)
Date: Fri, 24 Jan 2025 10:22:42 +0100
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
Message-ID: <cf5k7vmtqa2a5e6haxghvsolnydaczrz5n3bkluttmula5s35y@z35txmj4bxsb>
References: <20250123174713.25570-1-wuyun.abel@bytedance.com>
 <20250123174713.25570-2-wuyun.abel@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ybjc3fh7qxbtzpcn"
Content-Disposition: inline
In-Reply-To: <20250123174713.25570-2-wuyun.abel@bytedance.com>


--ybjc3fh7qxbtzpcn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] cgroup/rstat: Fix forceidle time in cpu.stat
MIME-Version: 1.0

Hello.

On Fri, Jan 24, 2025 at 01:47:01AM +0800, Abel Wu <wuyun.abel@bytedance.com=
> wrote:
> The commit b824766504e4 ("cgroup/rstat: add force idle show helper")
> retrieves forceidle_time outside cgroup_rstat_lock for non-root cgroups
> which can be potentially inconsistent with other stats.
>=20
> Rather than reverting that commit, fix it in a way that retains the
> effort of cleaning up the ifdef-messes.

Sorry, I'm blind, where's the change moving wrt cgroup_rstat_lock?
(I only see unuse of root cgroup's bstat and a few renames).

Thanks,
Michal

--ybjc3fh7qxbtzpcn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ5Nb4AAKCRAt3Wney77B
SXACAQCXX27Hv6VjgNLajAE+XIAL9zTPaOboCo6welo+fDm4twD/SKHQecr4XZ2H
n0qSovlCgbTtnisMZMlzKR8tJ8HoqA8=
=2reT
-----END PGP SIGNATURE-----

--ybjc3fh7qxbtzpcn--
