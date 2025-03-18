Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1CE169AE6
	for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 10:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742293070; cv=none; b=cyAAZZAbP210NtG4+XnBy2A8zIogcF5o6Sbq3kqsm6iC/6sfM9K3eJQHEBFUyQHvO5JMMRPmyp4Gr39qfqpzi2M55pNIz4hQjIVerfpGV1CcpD46Ma5VZnwb6eO8N/HMe9fKZlhtnDwnqeHKFy0UPGEIYH5xd/zWmJHv42P9+oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742293070; c=relaxed/simple;
	bh=IFBxPeTjHI7TeObAp8XDFRUhMTnCq+H7JfaB8yzIjPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PaATMoxucPZrNLTJ5eAfpOUrhxno7+aEG6bMa6Z+vu1SVZvxkn5qIEmklGEV8XMgHftK0/LhHp5+NUDIXIa9+pKeNaMAlfGdb7vEPXVo7LgTBBklGRI8+M++Yraq1yRAlOJaZ/jozoAMvotWQFfIC8OUbh/BCCHi2Zu85xXCAjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UM5YD9ik; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UM5YD9ik"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso28938345e9.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 03:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742293066; x=1742897866; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IFBxPeTjHI7TeObAp8XDFRUhMTnCq+H7JfaB8yzIjPY=;
        b=UM5YD9ikWP1OFIYPz3YJ+tgr7rFxjVBQH0oF+MVEfJ5CKmXqLgfNRUEzOgO2tHQyLa
         2lqkskqOX2zazBcEnREatATOjmyiiTrek/N6E0j/5fXsow/i7SUvPE6mufD5Kvvl8oX9
         Te+es32uTajC4Q+f3l7hL1DEV7bIu2/Ic7O3YlFkH0sSeRCUTh+tkNMhtg3NNLsneXLF
         YWSK8s9efL7tu4r2E4EvsT/1/WDBoizk1H9E4hf8DL1ggU21mmd4pQoOao91NY3Q2j5Z
         5akK+S4c3BTiviKUN8kj+8tzOIy6bmQ9iN0ibXAy4Xu5qWq4cJfEpXx7HkwX8TM8Z7PU
         zH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742293067; x=1742897867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFBxPeTjHI7TeObAp8XDFRUhMTnCq+H7JfaB8yzIjPY=;
        b=hP1n7ptmb2zWwZBEwZGK7xxaqR5SWfoLg715Stca6wlCYVS/6eYkVgsT66zDxgdUgf
         kbQ7xL7xrcY7AQM5xx5W04LpjGFR0e6r3Fj1ZB03sa7wUDQ4MNO+RGKIbCY5ASCnJ0GY
         G1SHjRRyymL5ptVB9ZyT4OXtEF1GH/Sz13AXXZsRo9k+lk1777Tbzxvyp46blcchG9Bn
         Ht5X8LKpfWn0qvTDndMcEnbiocDA40SP9tB6wNw2mOPmIZqUrMp/qGG4C2M4ZnTRdtK4
         zxsuPhxwLTN/aDRjTtSCeRYgzeE9UjyL0YwIEP+zTaE3kFqBZxW8EESGpHctnLKM2Rc7
         mqgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQJzNpJicy/lXQPkZ8xxc8qSB3Q/thFMpmqwbJMPkN1LDLyReS1wCda1hpj7/sdRdaxPbknaDFFG0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZCskd1fColBQ+S62vSoiE+S/vex9tCJm5e7ydwKXylTr+ttzr
	1q5tvFh5iG24I8Fn8MGaOikJg2JvPN0MnD4wGL0XGxY9I8I6C0BGXTHiJZdeF+8=
X-Gm-Gg: ASbGncuMa2Lg93ZjKOHqLxX5ts890lsYlgSziFfXy+WjJZvZbX0vrLg5u6GvsniMXdq
	5OZi097bJMnKU1/KLC1zi8ZGU+dmAWfhIET0f/PQz7B70ao0c9LYRYfyL62KSwU9Q/TI1OLBRFN
	GkCTLzh7Tj6pSiuDyLsdCOw6ZDYY5hweFcG4bfEdNvpxCprJskO0zBt5anIih0wVqJ55RKBwoM2
	gBxua3fCuPOIkojMZR+j5VKhpgYrx99RL2eidaBHu0W/9RFyA7RD/+2BTkPDSAs+idla597ay0t
	HEg69LC3jBV6EX0k9lF9dxXoyzQrD/EVeuslTPygzTwWwUY=
X-Google-Smtp-Source: AGHT+IGDLa5UPBGfrRVOOm3XvQnMemu2Schtcck+5EYcWBJ65baV+gaiWnBiXGOVUyqS4P0tACKxdg==
X-Received: by 2002:a05:600c:4e8b:b0:43c:fa52:7d2d with SMTP id 5b1f17b1804b1-43d3b9dc596mr11587965e9.20.1742293066628;
        Tue, 18 Mar 2025 03:17:46 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d3ae040f9sm13194615e9.0.2025.03.18.03.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 03:17:46 -0700 (PDT)
Date: Tue, 18 Mar 2025 11:17:44 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: hannes@cmpxchg.org, akpm@linux-foundation.org, tj@kernel.org, 
	corbet@lwn.net, mhocko@kernel.org, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, muchun.song@linux.dev, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Subject: Re: [PATCH 1/2] mm: vmscan: Split proactive reclaim statistics from
 direct reclaim statistics
Message-ID: <qt73bnzu5k7ac4hnom7jwhsd3qsr7otwidu3ptalm66mbnw2kb@2uunju6q2ltn>
References: <20250318075833.90615-1-jiahao.kernel@gmail.com>
 <20250318075833.90615-2-jiahao.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m6wfz6q3cfwefzqq"
Content-Disposition: inline
In-Reply-To: <20250318075833.90615-2-jiahao.kernel@gmail.com>


--m6wfz6q3cfwefzqq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] mm: vmscan: Split proactive reclaim statistics from
 direct reclaim statistics
MIME-Version: 1.0

Hello.

On Tue, Mar 18, 2025 at 03:58:32PM +0800, Hao Jia <jiahao.kernel@gmail.com>=
 wrote:
> From: Hao Jia <jiahao1@lixiang.com>
>=20
> In proactive memory reclaim scenarios, it is necessary to
> accurately track proactive reclaim statistics to dynamically
> adjust the frequency and amount of memory being reclaimed
> proactively. Currently, proactive reclaim is included in
> direct reclaim statistics, which can make these
> direct reclaim statistics misleading.

How silly is it to have multiple memory.reclaim writers?
Would it make sense to bind those statistics to each such a write(r)
instead of the aggregated totals?

Michal

--m6wfz6q3cfwefzqq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ9lIRgAKCRAt3Wney77B
SRN9AQCIE/qNRp6gU2k+xnK3FHJnFxAelfP/oIqk3z71MjMSZgD/cizNdVftiC2U
CSpV9isE71qsCu5oCAFzbKznXsbF4Q8=
=Bloy
-----END PGP SIGNATURE-----

--m6wfz6q3cfwefzqq--
