Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C202243CE64
	for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 14:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786978485; cv=none; b=d/cAcrWqX3jZHiwTD8IZmiZ0KbqwrlFTPzqkTGf7vxe/ZK7XbNbyDJtdAArLKusyRoljFG2pzElNKJyJlx+PgG9xsDnautTSucFXiLsFzOFoLwLSjGKE+OO1y+ERXvre0aVZByDodZhmpWFSFK9+UQeaVSGVgMU9LqJBzOlZVUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786978485; c=relaxed/simple;
	bh=DvmBTxt+D3RgK45fcsGPfbTFZvvFhGT9lSctjsN91j0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q23Yl3EogH+nqrpSegKvEaKFFNnjMgu5B8J9RITgZNoTiQTYBlTIIUyJMBy/dgJZTKWkUtLodq13aP6GZTVYGKp0TLM0rfi2poIStmAbbfzujD8owPfMg0t49zFdhqAfrGkpVDdRPkfWn3Q1fGXTx3DGaYuMyD34C/SwxvWOP3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=X7bqfEOe; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="X7bqfEOe"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47fecbb7000so1868110f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 07:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1786978479; x=1787583279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DvmBTxt+D3RgK45fcsGPfbTFZvvFhGT9lSctjsN91j0=;
        b=X7bqfEOemfX3Z8rOTF3GciiU2Ow69MGQQluXnEPLspL9vNjAew1+LFIB4wwVK15fgl
         08G4KVvuiEwClfFlsiP1TtvTCQfw7JKKKXi5mMi3b7hzyuV6GcIYEjboppAa4cXmCrks
         JalX4C0APEBjmJInFc7ZO6eibEFnF/NRM1O4TlguITbgXpCxcVpF/IkqREI/L9rQCyPa
         VUp00g7JjXqFx8iAp2l0wjoCCFH5mtLmb81CgvZ5BMaXmf3VBKmpQnvI+u+PtQBLmCbI
         ETVR2e/pS6oErjl/lXkHYVS9X0TpSgywPz2yW07Z9wulItGGf81X6XWcm4KtoN0FUBsF
         Fl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786978479; x=1787583279;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DvmBTxt+D3RgK45fcsGPfbTFZvvFhGT9lSctjsN91j0=;
        b=G8+/83rgHtajmRMj9BgJpxRN+XF5iN6krDcAsy+CKl3OzwpZETmaDd/Zb6v8+v/C8q
         vfWEhUPly7lPzgPMkjQnZXP8rs8FVEIo7glVx+dtFWOSiZstxOORh8/Vf3iuE5mKh0GB
         opg8wKBgsiF7OLFT+vaEBIJNrTB8iTUskgEFn2k3QxXqTsu1VE/XyuntibfjZRxKk9D9
         Dlj0wYbJQsDv3/mfWC6Bw2ul6QiaTXdzvv0qSf1MLr07xRHIzQIF+lgxTFSriCfnlF47
         wcjpq414fCUByeZ/zZVLvTsAuq/ODuzhM7Zce18fnE+as3o5AbdNti0sU1mSj9jWUmRG
         lY7w==
X-Forwarded-Encrypted: i=1; AHgh+Rr7C9AZOtu6Rlh1QBBmydXbsUzn8zws+1mvif9k/csc+GT67EupC3DHjMqoet24B2l1rXDSZpws5IM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqK5YsuNBEQCwQRTSojCKy4nNWg2Bvo4tJ4z8oaUNmJSDWIIBb
	vtMLQM4PCjfSFJdldurWp0vn+9QdAeggw6D9/ye9i1yKQRYgA2gIher6Yw7+kjgO4EQ=
X-Gm-Gg: AR+sD12RSmUOAsk/3V3QinpX+W7nNWAVigYkF7Pd42P7jfmomS8TQ1XSX/ND0JGGdtT
	CjjKfwCCm6tUHX5jmu9htbaWehzHg0meVpA08LPsbOP7EB54Ksvuy96Dh2n1FwfPV+MBm9fttmL
	Uft/eMrSlwNJojFhNbj3doNRu34R5xwjZ4HCpUcKiSUqGHBJ3v8EdJ5yvJOxTSRskMnLKBdyeO4
	J3ibBHNekN/ZNFfzRd0KYhaFIsAubiXMC/f5NVTNQnBTA80tzW4ijzxg/a3jRq8kokVbnjzjo4i
	bHXfUYRBCRchMmGCrDOtWXuiO7cH6r5PJqlSd6jiFb2WxFzNfFpsnqOAoMDsBF2dIsbWHbwmsxO
	QDAyRKYj/Y8psSPYrVfH/6zyIYWARWfHqKbBrrjnUpWyEdpkugPrRj/IDHUpvU8/Ufaabz0eA+J
	BV1/7VXX32M/60O2ptbWcy+t5BAnEqF6YXhUiRB8C9CXtttxoFLkjaxOa15pq8RMg=
X-Received: by 2002:a05:6000:4718:b0:481:568d:f118 with SMTP id ffacd0b85a97d-4816076ff7amr42575589f8f.30.1786978478922;
        Mon, 17 Aug 2026 07:54:38 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a31543sm5347627f8f.4.2026.08.17.07.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 07:54:38 -0700 (PDT)
Date: Mon, 17 Aug 2026 16:54:36 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: shisiyuan <shisiyuan19870131@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, 
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Peter Zijlstra <peterz@infradead.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	shisiyuan <shisiyuan@lixiang.com>
Subject: Re: [PATCH] sched/psi: add cpu_prio pressure metric for
 high-priority task stalls
Message-ID: <aoMf0P5L2QmOMOP0@localhost.localdomain>
References: <20260811104610.100617-1-shisiyuan19870131@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qu27gvil7scj6yvu"
Content-Disposition: inline
In-Reply-To: <20260811104610.100617-1-shisiyuan19870131@gmail.com>


--qu27gvil7scj6yvu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] sched/psi: add cpu_prio pressure metric for
 high-priority task stalls
MIME-Version: 1.0

Hello.

On Tue, Aug 11, 2026 at 06:46:10PM +0800, shisiyuan <shisiyuan19870131@gmai=
l.com> wrote:
> From: shisiyuan <shisiyuan@lixiang.com>
>=20
> Introduce a new PSI (Pressure Stall Information) indicator that
> measures how much walltime priority-sensitive tasks spend waiting
> for CPU, exposed as /proc/pressure/cpu_prio alongside the existing
> io/memory/cpu/irq metrics.

You can "just" put the priority-sensitive tasks into a cgroup (no cpu
controller needed) and track the per-cgroup PSI values.

HTH,
Michal

--qu27gvil7scj6yvu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaoMghhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AjpSwD+NKU2R01cwLlTMNBxrtTc
+P6kokVooPs1htIXqDBrC6YA/1vu0Ia8h9JHA9xofNvUo55BtiT7X1siVWbcVXPQ
WWUL
=A4KP
-----END PGP SIGNATURE-----

--qu27gvil7scj6yvu--
