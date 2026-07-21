Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4043B994F
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 21:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784669744; cv=none; b=Y3njDwjcnEQWbZj4DIz62nspryTJUs5y2GqPWlCF14J0sGo849ziG/rpdIYccnwH2wBIifdKMgieKSp3/6HPVYdQDlC/rLuYj34mlCfMTwY3O7c16KbMBTAbk9a2VOQa0ClyAK6wYaC5k5ub0yffJPDu2ck+x4/drTrIgLLHqnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784669744; c=relaxed/simple;
	bh=n9GCy6FourVHMw42pszPZ/kxYjrtx0ToMvEFR8X96Jo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=haKzsiaS6g0DyPIgC57t3Go+gfrTehKB5V3jwWDPzgP3M2A1U039jfMk6FDWbUb7nxEK4zxEZ5fbAnjpy1MDsKeyMIq7OJQ9nPsNLC4ok8JUetb+2cVpoHJpQKFtjPM1+hgvoTX8Lyi+JnzKfsWzDIsIclN7AsL9WH1FkBQF91E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=U/3K4VWO; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="U/3K4VWO"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-92f03daaa97so937026985a.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 14:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1784669742; x=1785274542; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/L09p9hjhfnJuq67NKuGgM+hS4Xq9h8jqqROmbVMupo=;
        b=U/3K4VWOOuKMff8VtNDkHS6Fla6njlPIRUsOVtjxuHihefQZCJC4yHncm9heheYcKy
         epE/BvuC2jlYWAGhgSii/dlN7s+A5uluIkkME5Fx+QDmG98NZoKKu9G65AsDrKp6uE8X
         umpZumUSrzLvzmFhrDEG/GA9V023uqIa4xim2F+cvf1oHZbe6QmeMOvYztY5JhGeilC/
         a2e8+h5t1VybKI4OGpJmNJVyCDTrTSSyr8IU0UzxsyA2bEGn0o0cFsxHWzl1xZHXye/8
         GkEZPRsEiaXUeo7kLeh/beiqOohNq4jRasyDkEoZ94KXzQVmcnfEBF5diUf3mwm7rb36
         R9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784669742; x=1785274542;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/L09p9hjhfnJuq67NKuGgM+hS4Xq9h8jqqROmbVMupo=;
        b=Qz+/vKJxM5tgJkTMQouGzou6twgIGdoB2tQV0bo1sWtmcTjrYOrd+7YYct7bDcptSC
         xkUbYQ/Fotl8uBROj7RUgyJIRazt0FPQ91tCi+LNhjhWZsuOefB0hXW/487RuissTZce
         PWme2xKyXhRKwj+JVrMCiHzFGD/OUVpYeoRO7+E5CuLphpguftQyvnaMZwzeX0OWEtib
         dx3yF0h86+2gGcjfrF1ERjF5LfVZRFokdBlgKE1IWyHbvPZ/V/Hvk01mZtFE3W0PzZnZ
         LHGCIUEJl33BKKFG0dVPJ++CUEpPSAkVQsvEoGVfi7/NqfQ5Q17lGWlOz8rzXIP4C9VB
         PPkQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLsX1BEttP2KQoEW/u44u5T148vYDVoU3vR7BBiApZ2d209nejBAWrlxE3fs3KJOzlC0Bp7LYQWNw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjyO3jUpUev57idVSvTNceu2X7gxL2S0bi50TTSHFtRtcPOPgW
	KHuqD6CqGoiVtgtXAh5QONtnUmTwTSp9T+BgOtd7RD8b3LvUD9eLLMlaf4ojHuRZkD9shreE0+Z
	skF+P
X-Gm-Gg: AfdE7clyOaM5+43+TpojDBn6KqixxYpRr4q1/C55tP+5inDbxtt35W9CJ00/l4qlH4B
	K+SLdhCdBtZy4hHi9GGhr0KciruYE/ZRP5G4aQ4t7SzHlSulVyGLu1L/hgf8pYzPJ21jXbJf4cU
	P2u5bQoIJCL5BBoH8Cc/GWP70YrJ02igkzGAdzWP7bi2X29IiIwvC1ILoNd3pMQdz6xIi1TUiCA
	Kg1wGMYVvj5RvAkciWRt1QidKVouS+kXpz9adRRnC4eJZ4HAshhkE4N3dpJcAU+4sr3ZQLGD5XQ
	jYhj/tuid5KCGKI3E5WqldPI9lYL7VzZuex/+yRo94ca1+e2FeARC7UN3lG4pghJHxiFWlpC3v2
	qnqeO+pkxpJofQsWNoOKJMOWCf0Z5s3PV7Yn7OOQ2uSEtWz2agM4JadrROOKoUm4bbScE3QPy0G
	xxPtppZ15CGwQR6VCcjZXAfXDTVdy9IiBrFscen8o=
X-Received: by 2002:a05:620a:2b82:b0:92e:fc42:2c1d with SMTP id af79cd13be357-930b3ec9e69mr1935028585a.20.1784669741912;
        Tue, 21 Jul 2026 14:35:41 -0700 (PDT)
Received: from [127.0.1.1] ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b54773fbsm1200457785a.39.2026.07.21.14.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:35:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 03/12] PCI: liveupdate: Track incoming preserved PCI
 devices
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, kexec@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-pci@vger.kernel.org, Adithya Jayachandran <ajayachandra@nvidia.com>, 
 Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
 David Rientjes <rientjes@google.com>, 
 Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
 Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
 Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, 
 Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
 Pranjal Shrivastava <praan@google.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
 Samiullah Khawaja <skhawaja@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
 William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <al_VrpvPE-RLCF5X@google.com>
References: <20260710212616.1351130-1-dmatlack@google.com>
 <20260710212616.1351130-4-dmatlack@google.com>
 <178432481253.189683.3297727348836286619.b4-review@b4>
 <CALzav=e1Gcu-9TD7F--41cYqKBrStKOE4VqQ4K3PKdNuYnNmcQ@mail.gmail.com>
 <178458744511.332171.13770778781241262180.b4-reply@b4>
 <CALzav=fjTOnyg2++GFFe5B17rHqNCWW=afjsD0A=EEjycPW7Sg@mail.gmail.com>
 <178465652971.412167.17838319728990505256.b4-reply@b4>
 <al_VrpvPE-RLCF5X@google.com>
Date: Tue, 21 Jul 2026 21:35:38 +0000
Message-Id: <178466973829.1257886.900641450757526076.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3133;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=n9GCy6FourVHMw42pszPZ/kxYjrtx0ToMvEFR8X96Jo=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBqX+YrXoUG+/twOz13pZ+ErnnGUFKhvMcK9TUHm
 5U4aFzfcD+JAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCal/mKwAKCRC7dyhM23N6
 3h7TD/4mAowZzUytWw/GBQF/1nJIoe+y01Mpv8f7eHQexJ7iATsttb+FbfYLpomH6zguTcBsIoW
 91QFuHteD+mVmq6lMNDVxqr8K693bfjCPLXN5Yscg9ZF7cQ25fLLtxm5K8f1iQ9lYd9lRKq032E
 bx9u4OycAUnkuka7y3ETFu9ILaNao+94NQxkZXKetmUfOj2Zz1N2sxm7lbEMnLru1NFm9ZcyGp9
 1ytJ+H9MG3aafd5hmEB2IAZjS2BBgeB5SFG6rsJgcyd8OWKjWfsxvsY6PnvPeI2F+dEF2sM5wOX
 FQehPH+uHOqKk+AGUFUaPR8riMnzcbRju3SGFc3oJfz0BwGEokGw+DydfGI1bdP7qQd6aNL/2IJ
 /oKDcb131mYKVvU/sNoEjbbEHAO1W0Ikr70/GJ+LK7bki9dd/f2BcCrB9t2AuIcJfDDJxViqOEG
 b87uMr6gD7FDN0UHaiiFE22QN/rS3oA32+ABhGQumkv0QRBKnkS6s1wMo+56rTyxpa7ifn5oYRC
 B/DIkST6h/nSQazKrWUGhUoecK0s/AZgViO/YvZCJSYUqPh9noqC7hBiYGoXcmGAKZV0YjRqJpz
 GQ/C03e3p+3cug90wTpUluvrVrvZ1jal6JH6wzs0MBiaxFP24X1zUtHUitFs3Qj8g0M/aSUW7Hd
 g5Jx4S1u6NpTsjA==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On 2026-07-21 20:25:18+00:00, David Matlack wrote:
> On 2026-07-21 05:55 PM, Pasha Tatashin wrote:
> 
> > On 2026-07-20 16:07:47-07:00, David Matlack wrote:
> > 
> > From a design perspective, liveupdate_flb_get/put_incoming() is a 
> > logical read-lock/unlock pair on the FLB data. We use a refcount for 
> > optimization and sharing, but holding a get over a long asynchronous gap 
> > (from boot-time device setup to driver probe) is essentially holding an 
> > unbound lock.
> > 
> > Unbound locks make it difficult to trace refcount leaks or debug 
> > lifecycle issues.
> 
> It's very standard for refcounts to be held for a long time, e.g. file
> refcounts and device refcounts. LUO FLBs themselves already have
> long-lived refcounts taken by each file that depends on themm, which
> aren't released until that file handler's finish callback runs. The PCI
> core is just doing the same thing.

That is right, but that refcount is tracked internally by LUO and 
follows the design of File-Lifecycle-Bound objects, not the lifecycle of 
the FLB's users.

It really seems backward to me to force FLB objects to have a different 
lifecycle. Let's start with a concise lifecycle without setting a 
precedent where clients of FLB try to control the duration for which 
objects exist.

> 
> > Can we do a fast-path check first?
> > 
> > static struct pci_flb_incoming *pci_liveupdate_get_incoming(struct pci_dev *dev)
> > {
> > 	struct pci_flb_incoming *incoming;
> > 
> > 	/* Fast-path to avoid unnecessary FLB querying */
> > 	if (!dev->liveupdate.incoming)
> > 		return NULL;
> > 
> > 	incoming = pci_liveupdate_flb_get_incoming();
> > 	if (!incoming)
> > 		return NULL;
> > 
> > 	/* Check again, now that FLB is acquired */
> > 	if (dev->liveupdate.incoming)
> > 		return incoming;
> > 
> > 	pci_liveupdate_flb_put_incoming();
> > 	return NULL;
> > }
> > 
> > This seems to gives us the best of both worlds: robust refcount hygiene 
> > and a sane fast path.
> > 
> > What do you think?
> 
> It still seems like an overall worse approach to me.
> 
>  * From a performance perspective, the PCI core would still have to
>    acquire the FLB mutex twice every time it needs to use the device's
>    serialized state (once to acquire a new reference and once to release
>    it).

I suspect, acquiring/releasing the FLB mutex in this case is trivial and 
won't be noticeable in any  real-world scenario.

> 
>  * From a locking perspective, the refcount doesn't actually protect
>    against the device itself going through finish. So we still need the
>    pci_liveupdate.rwsem.
> 
>  * From a hygiene perspective, each reference is held for less time yes,
>    but there will more places in the code that need to acquire and
>    release a refcount.  That is more room for bugs to leak a refcount.
>    So I'm not sure taking more small refcounts is an improvement.

IMO, short-scoped acquire/release helpers around actual usage are much 
easier to audit than holding a refcount open across an arbitrary, 
asynchronous gap waiting for driver probe.

