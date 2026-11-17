Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794931550;
	b=f3cm3xXmFiT06fKbH8HZXwkfJtwfWT1XQbwO7e+eqjnqvEniyp+NVmUZVDtdQgSaboLf
	 UY/PvlOfWAzaW4g/HXmChaa3WmzUA/FDvJSEwIDCMKIRZAv7sFmOLGZ4c3CkLxq6jRuA3
	 +03MwH3w6gyfpB3xuSXV5Ez7dK/Vx8cBA9B78mumbBA5zaMzlPcIKujJ40AbEY14lFwst
	 KLVyrfzNOeNy3aaEUGEWRmw3AnKXWZOJvOO6VmXi/s0llP3p9kex2ydUERpy9yOVtDGs9
	 ZJ4buyItQibDC4x+L+7mqaEFjtJHB5nFr0P2FaxuEmPi10tWNcnoYqmUzks+6fmM4/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794931550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=IG2RtveLbr6LLHiOkKFy7cZt2dAAYGYqRZMKbSVVxF4=;
	b=OUo3qSNIdhHMoDmXNE47mN1ntGBpSU5+bgkBJw4v6tKE+wSZBTNH0tI/7m28wnTZjPlM
	 brSe0bdyZsX5IX1ExY+Aff1NHOqJB0S8fxhS7mlaAgcfW3ADma+ovhNQS4mnN7m15lVNa
	 qZdPHWd59JKMTClS9Qp6zhyzBfb/wV5rXiLDESZ0KW2NO9MtjishZHc7WkWJXn+oPJB2A
	 vAAh5vsQMws9Slbj1WwadwvUTNI2EDh4zz+3Wigus2U1Hu1y4H7J9eAAbaaV5uYSISyGg
	 2KZBx4uY6+qO6lQK4bwPbXNZtM91Ob2dcKaWtUp156uKiJLJrge4nEz0+fkvXbbTdoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=YKKSBogf;
	arc=none smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AC7606A339
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 16:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05AC7606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=YKKSBogf
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7cc0e865dd1so1504585137.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 08:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794931549; x=1795536349; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IG2RtveLbr6LLHiOkKFy7cZt2dAAYGYqRZMKbSVVxF4=;
        b=YKKSBogfpsOaEw7hrTWHZ+eSaB0FBHjKyn8IasdKAsTgDWDfjvGtFh+QKyhd9eN7ub
         exPwrhrKuT6LjORsHH82lqZ4CZUeXZGvFIOfzRvZV6IZds4/kHD8fD5yxbUvk4ljrWdp
         7O+qlXhxQpfXDWZycwzanxMqdFm1ezkM6IVwJaDDSCbJntYJJ2XJPh8xO3hLu8l8Lu9s
         XyWR6w1ij7RjVsBIdgza6nQt2FoeSRf00BMtZOyQ20SJIq9uF8PJQELrUmTxhi8t0l3h
         LoE9nmNF4DPCG4+DhyWlB0ipvZso6GLnNXIbrSBJxkfgvKtQNK0qkKKdAv1bwXUNmcMU
         jDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794931549; x=1795536349;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IG2RtveLbr6LLHiOkKFy7cZt2dAAYGYqRZMKbSVVxF4=;
        b=PO34fnZ9RICEB+Q2R5ZQygLTbUYa74li/LJWDun9vPTzfayJY5hqHsOGrBkxotzvum
         Lj15sKqznjRLycPMYMDzPPULTB15YryJQQ68uGpahZC2uZUG12xjCffWVnqww8IqCaDd
         pu1qZcur1UCVckrqDLwp82vUraEchGBjssHdzGujazqA8/MjvXvaon/x1TRweHDmg8Ot
         InUeVAEJZpob1QsomDiKv7udQX73fA3iOPDfGdMJH8NwuPFkaP3WR8cDVj7IVRXCaIHa
         IHhcLIt5SPjNB2kFDHrCUxEu28FvPXrqIajLj2W0ZTs6bbEZNynTqyE/l4Lb2NkRo1P6
         9dUA==
X-Forwarded-Encrypted: i=1; AL+hErEq1Y+QJzDr4RSguNAgP59VyJ1dCEWZ/SI7AvEGf4lKD17AsPly4XRLTqG9vzkeKQKb0Ev4DJU7vMA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8bosKtC14ppOygPAOh+U6Qz8d3z3xZDNySd8kgdu7rnm9pgEG
	HZvUPqq2J2/2T83aqvPd4Q4Y4gWyQP6Tmv6y3CY81jC5pd9lwhVXTrHu+Mvn3p+dVqs=
X-Gm-Gg: AYBFou16x2xeI0I5yMDucLNpfyEAJIlKQt6sYE29WYczAbtM8Gjg+LNLas3yAv3ONWk
	FzdV9SXJDKOa5a9CbdiijBFukZk3640xNzWt1b41E/6BUUAjvP84pNv2/D1wndE8Z2AUfgFMsLH
	BmXqvyXjxQIi8Gx/B/zunRvBzEdOUkpBXi9r1ElmkXJdr3c4jcexVMx/o9pfJ3zu24DJgV3k5DV
	787s/fPE6+0sMgEztP82hArmvI6nz/zaiKCFMGmlV4Bmq9L28G85/CcEANXBZx8KO1qFb++8pbL
	HFNBwT0IIq3hJRg6eHV9zbIApFqkX0VqWStnvifPEGYfbP4iRp763PPheUcDrNtZVdlwr0yspCM
	s8CfmR5a8iq93sQKYMG6mKf1kzxz+Ohz5+aYQJwPRjl0rB+p3h1UlPdkZVt+5xDSBVT9LzAJCda
	uSuCrKmoLujuv6nQaPWtyf4WRObpuDysWMPzOD/N+UPfAKkplqJKYeuW2etM6abU/zwFNTQJPNr
	utvcUS9AUT5oVqWVEqrhMSaBWDZrsWPO9y6LJXP6wa1dldr7M18tYlDRp+sSWlHDYRWGD5yHZgh
	fIBuP4dBxxwmdlxwWUkUNOgBlBcb24aKizisCbfHz64Ddok3jQERRLBUgcoiC7pPVtpz70ZbM/4
	T6J73oTOH6XB4bl/7oNlnbupkWKqp3FU=
X-Received: by 2002:a05:6102:4457:b0:7c1:8aa5:36d6 with SMTP id ada2fe7eead31-7d64d6d4a85mr3228252137.11.1794931548510;
        Tue, 17 Nov 2026 08:05:48 -0800 (PST)
Received: from localhost (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d69e023608sm2832234137.7.2026.11.17.08.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 08:05:47 -0800 (PST)
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
Date: Tue, 17 Nov 2026 11:05:46 -0500
Message-Id: <DMXM4P4NQ6DH.15QJ2AU95YJRT@soleen.com>
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
To: "Pratyush Yadav" <pratyush@kernel.org>
Cc: "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Mike Rapoport"
 <rppt@kernel.org>, "Alexander Graf" <graf@amazon.com>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Tarun Sahu" <tarunsahu@google.com>, "David Matlack" <dmatlack@google.com>,
 "Samiullah Khawaja" <skhawaja@google.com>, <kexec@lists.infradead.org>,
 <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [RFC PATCH 0/5] KHO map
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <20261116134013.1636689-1-pratyush@kernel.org>
 <179486913878.127049.11178890384802388709.b4-review@b4>
 <2vxzwlqbfxtf.fsf@kernel.org> <2vxzpkw3fp2y.fsf@kernel.org>
In-Reply-To: <2vxzpkw3fp2y.fsf@kernel.org>

On Tue Nov 17, 2026 at 10:35 AM EST, Pratyush Yadav wrote:
> On Tue, Nov 17 2026, Pratyush Yadav wrote:
>
>> On Mon, Nov 16 2026, Pasha Tatashin wrote:
> [...]
>>> Instead of caller-chosen depth, the tree should grow (and shrink?)
>>> dynamically bottom-up based on the widest key.
>>>
>>> Plus, with bit 0 tagging leaf values, 2M entries can be stored directly=
=20
>>> at L1 and 1G at L2 (on 4K pages). Even for huge memfds, the pgoff space=
=20
>>> is much smaller than 64 bits, so in practice the tree stays tiny in=20
>>> depth.
>>
>> I think it is a good idea to allow dynamic depth in the ABI, but I am
>> not sure if we should deal with the automatic resizing just yet. How
>> about we start with making callers specify the depth (max index/pgoff)
>> up-front for now? The ABI stays the same, so we can add support for
>> dynamic resizing later if needed.
>>
>> The reason for this is to keep things simpler to begin with. That said,
>> I don't have a _strong_ opinion about this, so if you insist, I can add
>> dynamic resizing from the get go.
>
> I take this back. I went and looked at how xarray does it, and it is
> pretty elegant. I thought some sort of rebalancing would be needed, but
> all that is needed is to add a level above the root tree, and demote it
> to a subtree. Similarly, for pruning, the subtree at index 0 can be
> promoted if all other slots of the root are free.
>
> So I'll add dynamic sizing and reparenting logic in v2.

I agree; let's implement this properly from the start. Growing from the=20
bottom up is the right approach. I am not sure whether support for=20
shrinking is needed, so that can be added later.

--=20
Pasha

