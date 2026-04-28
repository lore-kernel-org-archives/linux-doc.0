Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2DD3009ED
	for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 07:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363121; cv=none; b=NhZairElNzwYg9O3yntRvjtGRuuV+b/wzRD1tYL9jnx5iYjwOdLzuMbuvIvueNPbFP+1GsO/OOLXQE56VEEBE7DU3B2kgrTS/gJUcbO3bG6MkqgHf7/nO42k2yJXpRYs/kiiM8rvfjrlH+IScIUkHo+bnemgtPlFIXaSDGVuNGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363121; c=relaxed/simple;
	bh=ZdxLpRAvrey223q59Wjm8MO81du/WkAqqYDf+kSiL60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unaK0sWtJJdcdCqVycdGg83EwrdSUSV0s8THLicaGm5SiAODYuN/nfxyeR1HawR5ZNZ8b3rD87JCljDTr7e+sAJvHpaXldHSXPolN6HKfAHXNWRUJUTzwmG9b6pvpJVwc0uMnWdjB7116t3UF+dtaptGTU/RQ3dhjTvJbBHiJr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RqtvEQIe; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RqtvEQIe"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43fe62837baso6433174f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 00:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777363118; x=1777967918; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qagrd0tizvJjaLYUYS0sYCos+nfO9AiOSWAVzoIEd+Y=;
        b=RqtvEQIeHwu1UHw50y9bGDvymuf5R3u+zf08I7L3/T4BxB7L4vdox8hImx/vGEAbVx
         9pXk7WtZFSLEEBClhansU+n8kfP/H1pViMZ8n0k/maPszR6REmpcqjcPH7nQ/MjR88hX
         lpaQ9wNfi6yLxWrm1Yt6dFS9OToghrux8ILsYepTeRZqU4g2W69PwjV58MqXSWr0ZeNk
         +jbTGL2CDIrtV/pyVeyUPxMkMGoB5QCLrUYjquMQt2j6bboEqWzCIF8nG2EVaU6FsVy2
         1qtpzMS73pA+rGTiil5N1HRGy8l+7ho4NUtAP515rvZgGFyjkI0y5G9AJ1YczPVl8q+G
         BnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777363118; x=1777967918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qagrd0tizvJjaLYUYS0sYCos+nfO9AiOSWAVzoIEd+Y=;
        b=FwasIvwexn1VGNtxEbTb0HVffQUJnyx1ST1fX0SDQsQZ5Af1nPzri7LzOS8gz0s1CF
         WqmVOVv9DswFwVxjzF6330JLKFuv4M9oVlQASTLlB1WBK2Ep8dLlWE9cey6WrjtTrNWI
         FwLNFkaw0UFTIw67dSa2j7rECXOitTwz0cb2urH13Lvyq6cHjJOnhmPhJ2iIwtHTBw8O
         o8vvhaKd9cqINAI/J0gVDGSL7wLwS61qZyA4AaU4udjy1T7Qqak+An/zb7RFMS2PDs/D
         DiQFiKwvw5HWI5NyT4gdQJSVvTalq0mhwzrkBr9lfKDkS9/k7kWBe5epIEdGTQpKQBH5
         LWpA==
X-Forwarded-Encrypted: i=1; AFNElJ+8ydqVWg4+n80ub3yKy9AzQF2vvw8CLT67L994/xhROfJLmLWV/2LsIK98ugxPRATqz3TI1pgkpCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YziuI4WHtz4pHl3/6/J2FGwzZBuPrNJLzrYB06r9J9VrXfp113y
	3Aizo7Z1B6kZ3FYqj99PzbKTZmTbnmKpHIZa1RZ+cMLJ55J47Mt54LhvJsateou94jo=
X-Gm-Gg: AeBDieuTQGke3pF15/E9KYOkZDmOoM0wE+98wlliYIEWnB9GcrKFVg+45jlHsCVdsq/
	SwS8o2mFa3Q9KCy3+3vk0NiO79vq3JfEIuEs9/bxbGMbLoFmPg/RLqxC0oZre6/x8g6J/wDoahF
	SQf+od2oYFluxUf2V+I3J197VHn/tVheq82t/5PFr2RKk19GwiTACGqvwBX9/Amg9NHHZgeTs6K
	hmcAsoGFN34IiP61Bddwi2wV+vdaf8PimeGgSY/qhz/NLICZBW+IF1E9RRnL63sW17vQ9bR2Mzr
	VMevy0Q774QcQRmrsdismnpsUIZCqU/b8WiOwyIGPvYG2QbgxYprCgbAWs68UZhq4TRpAlwz1nb
	6UXUxB6R630wTt9NfBi8mvYDoZkd89wq4zzc4D4Eh4ZI6viD0/7Nv7H9D0vVIPN52fwtynLteTH
	fXc5s0QJNhn1Z4GntCHWhXoGd8J3p6loHOKJg/BvwdjmWYHPlzggrQO5ZwWRw=
X-Received: by 2002:a05:6000:2212:b0:43f:e413:43ae with SMTP id ffacd0b85a97d-446448b900emr3496914f8f.0.1777363117896;
        Tue, 28 Apr 2026 00:58:37 -0700 (PDT)
Received: from localhost.localdomain (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463f5b50c1sm4186489f8f.17.2026.04.28.00.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 00:58:37 -0700 (PDT)
Date: Tue, 28 Apr 2026 09:58:35 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Waiman Long <longman@redhat.com>
Cc: Chen Ridong <chenridong@huawei.com>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Xie Maoyi <maoyi.xie@ntu.edu.sg>
Subject: Re: [PATCH] cgroup/cpuset: Creating or adding CPUs to partition not
 allowed without privilege
Message-ID: <7so4b76wg2apwwk3yh76q42jgwnpvlv7sursmsmzeyefhp4pbt@thybpp4litm6>
References: <20260428033439.783246-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v7j7lm3upsqvk6fp"
Content-Disposition: inline
In-Reply-To: <20260428033439.783246-1-longman@redhat.com>


--v7j7lm3upsqvk6fp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] cgroup/cpuset: Creating or adding CPUs to partition not
 allowed without privilege
MIME-Version: 1.0

Hi Waiman.

On Mon, Apr 27, 2026 at 11:34:39PM -0400, Waiman Long <longman@redhat.com> =
wrote:
> Creation of a cpuset partition or adding more CPUs to an existing
> partition will take CPUs away from other cpusets outside of the
> partition leaving less CPUs for the others. So it is a privileged
> operation that non-privileged users shouldn't be allowed to do.
>=20
> Currently, remote partition code has check for CAP_SYS_ADMIN capability
> before allowing such operations, but not for local partition.

Remote partitions need such a check because their CPUs are sourced from
the global supply (top level) without=20

> This leaves a security hole in case cpuset.cpus.partition of a cpuset
> is chown'ed to a non-root user and its parent cpuset happens to be a
> partition root.

I wouldn't say this difference between remote and local partitions is a
security hole [1].

Consider this -- cgroup a is created by root (admin) and its resources
are constrained by root's policy. However, what happens in a subtree is
irrelevant from that top level view.

# setup			// owner
a/cpuset.partition=3Droot	// root
a/cpuset.cpus=3D0-3	// root
a/cgroup.procs		// user, they can organize subtree as needed

For example the user may want to create a (sub)partition with some of
the CPUs they got:

user$ mkdir a/b

a/b/cpuset.partition=3Droot	// user
a/b/cpuset.cpus=3D0-1		// user

This should be a valid configuration and behavior, no?

Thanks,
Michal


[1] And thanks to the need of cpuset.cpus.exclusive chain down the tree,
    the capability check for remote partitions may be too restrictive
    too. But I don't not plead for its removal now.

--v7j7lm3upsqvk6fp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCafBolxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AjUaQD/WWAf7wbM6SpsqgVsTUGg
g0IHvtsWG+gcAF7OSxg8BaAA/3tsjCKLTBgl9yGrabUcfcBzpM3PrGtwFSexQPAC
Lj0E
=1WQo
-----END PGP SIGNATURE-----

--v7j7lm3upsqvk6fp--
