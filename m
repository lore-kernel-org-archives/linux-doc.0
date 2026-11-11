Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794431612;
	b=Ad958lbpy5dOLrhgD39/ZgEBbLunMEmS5GFhF9xYnOzpfe9UNaKsizO9CQupz1/+uJjT
	 JqTBbZ5Vi6DspBHJKokeglXDPwI73+OLX+TiRqCwfE2L7J7/G/ysXUUqhjLG80RJM9Vom
	 VvpKWy51ToCEAxMJJGrHPARUT578kJzjO79OfC+MuQ/Q6Gv/GfNSkN8RkaLBHv+eo2Pi9
	 MGq1RDECOQOam9WOvPMVDeKnVxSrR/D2Q9S8fEczzzKe3oX+DNDPMnlmuwJnaIhCNV7sQ
	 s8SOOGhFDSi3kHvLRiZOmX8Nxmzm3TuWgVpJ5nttCko9XciCrVoBG6XRv4JWU4/D/aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794431612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=3IrB6l2ge+kT+1cpfqcWAfjg5pGysZEjTO7L0UKFQf8=;
	b=hCvzkTo8tcZCzYUtVHpmGsKy0ctZtHMHbTBZs7J3MJRVJEs70aj3V7EZQdbw16vIrM/W
	 kqipbnOqcZDzk4HmO5out1kd43STXeHOcRm093olazUCm2vVfNcAmpBBqNghZwyMsHkjk
	 FG1vxgomasnGsVzSioWFUO2KGOZuhYaUKdB/5TXrbzXmW3WkuUvjlpYI+gjNORezqatCO
	 JKKHuz60VSCfJ4IrkGYeoeb9fsetXv233scxdaR5L/d1xtLd1zOwgTVuMRTDu0a9Vo3VP
	 +ERBt1BKaKj67IQlzsbDxMEt3wJ98dVn8fbZoBSHPYy+mzQWdEteSHouj0FlnCkwveA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=lOKYDDEa;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD3A606A321
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 21:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DD3A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=lOKYDDEa
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7d2db6408cfso1899248137.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 13:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794431611; x=1795036411; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3IrB6l2ge+kT+1cpfqcWAfjg5pGysZEjTO7L0UKFQf8=;
        b=lOKYDDEaWLLmAvnd3LQM0bZSGO0Yo4zxUjhMLVMO/5rygvi8q8nMWDBolKHpWEnZ7I
         8IjHA09+4z1l6wWIPKTnsWvBSjL7gYDA3ctTpeAx6z9ZK337J6Uf5jjqFo6G3+wBdeY0
         dsYm8PuwGPaQ1azj/WiNEYekFt/Vbp40p4yon3qKCZ+EUmprRGmN0dxN7v8AxfFM1AFa
         62G1cV6MN0GEOuYVWOf4swqYwLcEmmyAgk9tMyz+iwa/jiUA1R6LHxWtIcgpkT9qAnD+
         ulFbXBewxvne7l4vQnGgmrXU4rw3c4cxc5H8SCq+zK1ahVJkKWQMH2F8eKWHTiT1Odli
         f7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794431611; x=1795036411;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3IrB6l2ge+kT+1cpfqcWAfjg5pGysZEjTO7L0UKFQf8=;
        b=JPZ+Pz/cUnc6392jSSHqXMf66kwQ3r5aPMbvwIt1SXTxRN389dkaq3yULtFqjhiPeU
         ZZfCm+BlUx+3yX+xrrvVhxC7PEu/3Hi3fLoHaj2XuQXSH4Cptpw2XdXx64EybYqFJN2d
         /9mMxDPe7Z411EIgmZIYAiTxUjhPDr081opguR5A2c2VBrHhejaT3PmwgLUEfQe0xeqI
         A0exKtPaAKivyBcHgppLSc60B5WCCWNDEBm+JnJJ6HSG3+WNBjcto6jAfuv664x7nIWJ
         QUDAIJFIHR8dyQIUVgylmxd9p79Pi1AKLwymmwCB4SLPQjrvEsQlt9iw9uPRf6egAMUo
         G2ww==
X-Forwarded-Encrypted: i=1; AL+hErG3MLHdOSBZ5SoFNvVEe/AXKss6B6x8RZ++4OOGEWPbzjsHG17gaJebI9gonyz37H3Sa8nXgvCiSlg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o1E86NNRLLrQqcUV3qzMTYA86GQv4b/0jBpFBc+DuwRC1FF+c
	cEbMgG1pMR9mVE/oazIbNKguCA1m8H9l8z1ooXfeIxwZvwfz9NwgcHQjUAw/OXZ9Fic=
X-Gm-Gg: AYBFou3Obe7EhdPU93eAm6sB6/BG45z6gpO9On77CHNrizhrqU/bEGt/ym29gYQ/Tzn
	6/MJb7Gvveq3pE2l8LnJtl/fUN+KkhLcSXAiOqq6UiyPoHFdBA8yifc9ZZ95b5CUhCtrJEnglyH
	hLy83ulkr/JTanuaoQFkWAingS4VHrzVB8uBoHtHx94dj7h14xRxkVkJHRPez+IA1MgDQfST+ui
	Ee9jAvrrkap+spMptFWWUVT3LZM1c75XqSf/IlKZX3370BEcYjI5nSGrLZqrNpLv3M3ifcD5EkJ
	VkuMcmPqbQ1afQ5VqVk/xAkAd3Nnwv29iqrWXbd/O5MjPJkhvy3uCvCFePibE+TqdUtn5H4gUEj
	oglP0m8u4eRBDwWwVbpSLGdPoA3g2P+3B96Bs60YAQcjiCt3dJG+ZM0GrKysIgKVdpLNswsJMjd
	cmPZ4sFZy3Yg3/CcNQ+NvZMTps0/mMIGxJ20LQj4/BNeeO407GbPVGZ3x0B7Cp5wBC/92Xc0WB3
	FKlTVkaETfzrimki/bJoyE2KEdcp0I8VX0oyML8WKzbVsdTOSJBH6AIZM1QqhVRDgBZA+4GkdiC
	xSvwNA0eqxE0Ao7McdnmawZMhOcdur5pky8daF2oJLCJ8SwguHp0siDm3/ypD68WCPMPfadYAD9
	YrEbhK5v7et68UZG+oedY2FLSrTAg
X-Received: by 2002:a05:6102:2d0e:b0:7cb:bc5e:7d9f with SMTP id ada2fe7eead31-7d4fb2577edmr1659351137.11.1794431611247;
        Wed, 11 Nov 2026 13:13:31 -0800 (PST)
Received: from localhost (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d3023838a9sm4907083137.7.2026.11.11.13.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 13:13:30 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 16:13:29 -0500
Message-Id: <DMSOX12JE1BL.33ASGRFO04NUM@soleen.com>
Subject: Re: [PATCH v5 5/6] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl
 to freeze sessions early
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
To: "Mike Rapoport" <rppt@kernel.org>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>
Cc: <linux-kselftest@vger.kernel.org>, <shuah@kernel.org>,
 <linux-mm@kvack.org>, <skhan@linuxfoundation.org>,
 <linux-doc@vger.kernel.org>, <vipinsh@google.com>,
 <linux-kernel@vger.kernel.org>, <corbet@lwn.net>, <dmatlack@google.com>,
 <kexec@lists.infradead.org>, <pratyush@kernel.org>,
 <rdunlap@infradead.org>, <graf@amazon.com>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
 <20261105050053.3063001-6-pasha.tatashin@soleen.com>
 <179439592041.425130.6098227055493441109.b4-review@b4>
In-Reply-To: <179439592041.425130.6098227055493441109.b4-review@b4>

On Wed Nov 11, 2026 at 6:18 AM EST, Mike Rapoport wrote:
> Hi,
>
>> Currently, LUO sessions are frozen automatically only inside the
>> reboot(LINUX_REBOOT_CMD_KEXEC) pathway, where luo_session_serialize()
>> iterates through all outgoing sessions under global write locks and
>> freezes them serially during shutdown. On hosts running multiple
>> workloads that quiesce one by one ahead of kexec, userspace needs an
>> explicit per-session freeze point so each session can capture final file
>> state under its per-session mutex as soon as its workload pauses.
>>=20
>> Introduce LIVEUPDATE_SESSION_FREEZE on session FDs to freeze an outgoing
>> session early. The ioctl runs .freeze() across all preserved files in
>> the session and serializes their metadata. Once frozen, no additional
>> files can be added to the session, and subsequent freeze calls return
>> -EBUSY. Freeze is only valid on outgoing sessions and returns -EINVAL on
>> incoming ones.
>>=20
>> By default (flags =3D=3D 0), session lifetime remains bound to the sessi=
on
>> FD: the session stays frozen while the FD remains open, and closing the
>> session FD before reboot (for example, to abort the session or on
>> process exit/crash) unfreezes it via .unfreeze(), unpreserves its files,
>> and reclaims all resources. During kexec, already-frozen sessions skip
>> the late auto-freeze and are published into the outgoing KHO subtree.
>>=20
>> With LIVEUPDATE_SESSION_FREEZE_COMMIT set in
>> struct liveupdate_session_freeze.flags, the frozen session is committed:
>> it and its FLB dependencies are immediately inserted into the outgoing
>> KHO subtree via luo_session_publish_one(), and the session survives
>> close() with full ownership retained by LUO until reboot. Once
>> committed, closing the session FD (or another session failing to freeze
>> during reboot) never unfreezes or unpreserves the session, allowing
>> processes to hand off preserved state and exit prior to kexec.
>>=20
>> Update the uAPI and core LUO documentation to describe session freeze
>> and commit semantics.
>
> Please teach your LLM to use shorter paragraphs, focus on why and don't
> list every implementation detail, but only important ones.

The first paragraph explains exactly why; however, I agree that it needs=20
to be more concise. I will address your comments in v6. Thanks!

--=20
Pasha

