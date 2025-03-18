Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EAB206F1B
	for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 10:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742293136; cv=none; b=RhnOOHprXtQrFt42P9sM2S+74cnQ5xquQlJsO3d9Uu5pBSHdEFrztzr2WncHqG8wFTrUKVSnx/DMLBn5j8W87byN0hrGLWMd5oGD89AcUO/3BBT5algQyKEoJea4swFJM2jWe3jE2HO9Y5Wx5LrDSz1kmygCls3FMDfKraCMn4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742293136; c=relaxed/simple;
	bh=4ssJsJxIWYpA3fFkasszhPUhMVSzH9qY3MwdoCqp/rE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gd4CXd480FiA6VMwHSIfAVBkOmrbS3lGzvg2Gm46TdhqARl0Nj4HO0e6FAzQR1sHa4fIMMYyjOhWTs+dYRtAKfYMCn7kKhrntDOx2ZrTA3Z0Vusxzy2Yv8iKaEQ3+KixFjv/fMjIMQ+uFg24PaU4xf5ki1Q0bwcwZ3ln7ClMifs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UT0Qy1+7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UT0Qy1+7"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf257158fso20525405e9.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 03:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742293129; x=1742897929; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n7xGOMAuQUF7MWyNDY6Z3/tomm5PbBSvhnd4ckgMx6g=;
        b=UT0Qy1+7UWpCaH/QVVmkp+9HAWJag4LEgdwwnzby6gS2CyaMOCRwkQTy4YbwaubF8H
         2abQZDC/Ua/YiM/V8mKxkwkM4eP+KRBWedKbPZdXI281fKp1umeNnIDRNyJY2RtRU4lb
         vHYt4VAbdXYpo0evg1PoaywwasJG+Gn7MR9fz7Nyqy5jRFpOSX9Y3EimxKJ4P+sY6JaV
         RM8NndL2vGcyk7lQ8BS6cNmA/RIavjKZgcBdkAIiGlT54XdiyK6ymcHw02egnVc6Xems
         zCDTnUVB32TWOvtWk25Z8GQ2AcRy/ouB+s/p1jzX+Gvy/wEn/r32BCwiYq2eyaJWsqY9
         06EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742293129; x=1742897929;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7xGOMAuQUF7MWyNDY6Z3/tomm5PbBSvhnd4ckgMx6g=;
        b=Q6V/A53d5qWNp3wIWpprru97UBF8232yRVkoR7QBoOt66aWgM6UlpSdbMLavgcDOOp
         5ySF5PB3lX/9Tvk6bR3Uj2T+8UWk8e0KDAs6vXM68v/Y1+3YoiTwFgVEeLxv7zFbHvK4
         47WjBuZfbDoWytVyNx5Zpp1Eu6/oz6XAv6hFb/hD0glXYn53PPJN0/PCfuJKlAvnjayj
         CS7V5M9rp0wtHCuvPIqpI8LZlBYBF07jLcajs772PjWzBZTVdi/Y8fZuOGuvjhxVXuCu
         e4U3cXaCRX/FRC6FPIP/luYuWEL0ldA+ORstmU6SjL9FScQ38uERC1D60DyrxzjVd9ZW
         KQkg==
X-Forwarded-Encrypted: i=1; AJvYcCXJmhxWfkoS2eUa5Ju4t/x5R5VAdTW8PJ6f8EnVAyEY6iB4M03BBPFKhztiyi7AEykCV2M4cM1gLlY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywte3Oa583c26hEt/hCAHaYkPPrq5uvEkQmzGGJb5yiI8EjJWZH
	ASs+wiMffrqotEs4STxFgV9kJp+kX4iySm3pK06QKkmwbUYN5famXNZvTwUZmEw=
X-Gm-Gg: ASbGnctbRmRSY3bxBAlUCZCvUXcRsqlSPxg54yF0J/Kf4nNF+r4qLcSNHjqBeIS7Lll
	pzscAlRSAtysoA7MUrm5IVTMASgrxyBkj6lW6QXhLqJHWIYiiAL6W4HO88wmwPFXWmXkRdiEugd
	/2p2yJo0oYx3KHMaUE9eaioth9hwW9MVorNFttICJ5ROkjt8GtIlXfxAIMklE4aCV4L5B8eJBnU
	n8QQVCC7MVMH8V/0yrurJZ0zSBeeRuQjg4FLVfd+jh9ZvTwV3szi6YR58GEQ+Bm9dEsUeD1HkfA
	Ui5PQS/jjUle9SptE/238LXDo8FoSEBlPFe7pT2qA3264Jg=
X-Google-Smtp-Source: AGHT+IFrT2crDX0AazaJrXxMyeiUJbVXB4waHwmUEuTI2Pk2priOkOM8LHglNdNkvzmeJCEOd9dpDg==
X-Received: by 2002:a05:600c:4ec6:b0:43d:db5:7b1a with SMTP id 5b1f17b1804b1-43d3b987ec2mr14873995e9.12.1742293129530;
        Tue, 18 Mar 2025 03:18:49 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fdda208sm132395975e9.6.2025.03.18.03.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 03:18:49 -0700 (PDT)
Date: Tue, 18 Mar 2025 11:18:47 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: hannes@cmpxchg.org, akpm@linux-foundation.org, tj@kernel.org, 
	corbet@lwn.net, mhocko@kernel.org, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, muchun.song@linux.dev, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Subject: Re: [PATCH 2/2] cgroup: docs: Add pswpin and pswpout items in cgroup
 v2 doc
Message-ID: <2bzz6n6ugfuvw7kpnewqhdzmv3yxghe5o4y4jxrwtrw65f6jsd@zgnh7qkpw33y>
References: <20250318075833.90615-1-jiahao.kernel@gmail.com>
 <20250318075833.90615-3-jiahao.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ceucqiazdoxttvyr"
Content-Disposition: inline
In-Reply-To: <20250318075833.90615-3-jiahao.kernel@gmail.com>


--ceucqiazdoxttvyr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] cgroup: docs: Add pswpin and pswpout items in cgroup
 v2 doc
MIME-Version: 1.0

On Tue, Mar 18, 2025 at 03:58:33PM +0800, Hao Jia <jiahao.kernel@gmail.com>=
 wrote:
> From: Hao Jia <jiahao1@lixiang.com>
>=20
> The commit 15ff4d409e1a ("mm/memcontrol: add per-memcg pgpgin/pswpin
> counter") introduced the pswpin and pswpout items in the memory.stat
> of cgroup v2. Therefore, update them accordingly in the cgroup-v2
> documentation.

Fixes: 15ff4d409e1a ("mm/memcontrol: add per-memcg pgpgin/pswpin counter")=
=20

> Signed-off-by: Hao Jia <jiahao1@lixiang.com>
> ---
>  Documentation/admin-guide/cgroup-v2.rst | 6 ++++++
>  1 file changed, 6 insertions(+)

Thanks,
Michal

--ceucqiazdoxttvyr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ9lIhQAKCRAt3Wney77B
SQcmAPj5mu7c5i0F7YE9fLx+JKryDsiUXIhpYvodLh4TGWAxAQCdwaT9YNeayOac
3hnyVehCiIPruqy8kwaAR7cXejMfAw==
=IbXD
-----END PGP SIGNATURE-----

--ceucqiazdoxttvyr--
