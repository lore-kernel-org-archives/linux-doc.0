Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C8D2FD7C3;
	Sat,  1 Aug 2026 01:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785547383; cv=none; b=EPtfcAL0EsA8JcdfAglCVCznrEtc2Cd2UR5pAQBfcP8Jz/Hr2rs7p7puB7LYmsmJHLPSI9W7TDo4Ufh0luIk9lCnvtf/5BuKiNzGeFCwvtLyiXt2paRIYsyoVlT7Jz6cPIlnveSADIwOeS3E46u238rVj25Ob4W2jSmRzjRi2SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785547383; c=relaxed/simple;
	bh=P0mlazgzIPXveFJihvrtcdXfNDABujrDqKiF4JKWm6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pFgPQpppizDPK+yKxH8NYvn6BLi2hG3sPrfaNQvXDnlYdeGDI3PyuUv3Ify9ugTaM9gwpQUVJ9QtlV/VxgFoFBmF3HOnl6nyXdKykyjZJu1EMkoFIG4OFMqu1DBUJyEGFIuLrKtB7pyE2OUsT0auIkqKDhvMvYm4Fhw7NoEViFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=PNBjcU2Y; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="PNBjcU2Y"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D751840E02B7;
	Sat,  1 Aug 2026 01:22:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Zgdzh314TKct; Sat,  1 Aug 2026 01:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785547368; bh=F0SD6i6pVz8b5/Ctz0oWzgJGRgyCQQTAYRI4PwV2KW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PNBjcU2YIZ71vCjCbYTzWLhf+yr9I55rMO0a49+aZM10pRFGxfVGeGQut0BQK4crU
	 Ak4lWD0dYKkoS2MxKJakPKoKkJk6Lh6kJtcSVstWUC7wz2pyM9dBEI+0EcvqzlSAQ+
	 wzlrEaAbG4DSVNS/mPHJeeH92223rt8H0tDXcednU+zV9AksZdI4ToJNPaVD8iLYv5
	 /CTfWsvt8yoL0wklhvDz/IQiQ90GA8pfYWjMsA9vzo9fZ75Hg++oQrpw3Qo4wEs0Bt
	 sVsA8Fz6M6epv+1Y1oQWtedYbFEdGXx1akmgYJ6jFyWmVoaqOFNZPGqkIxaiJINsQg
	 +cVdw4RY0HAW4Bf12FRM7n76SQ+PAejNj8z6XA4Qkyx25/T8b3WnOKEMxH6HKtpy/L
	 QPvtecg1DLjJCxuV735rrCQHT6GRNx5ChKghA0Ju/06THFxTIpDjRfQB3sKNd651Wj
	 0X+zXqy1IQBvWlYDCLDznukLRzUJvXbR0GbFicfqV7EoZiiwIzrogQuRrr4GyataVI
	 +T/fPhRmqd09R2lmwLVQMF1o1rGCdn5L4x7ajpDf0mcm1+NMaNepon9EVJqZimVxv1
	 msyNdo5WC+U8o7nqeGC5uJQ77f74CWyrVPTPS2DZG1ZN/lYYmQDdKGsu30f/0+dVB7
	 UOC0rUIYYuM3iZJIT5vVKdYo=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 242BF40E00C3;
	Sat,  1 Aug 2026 01:22:31 +0000 (UTC)
Date: Fri, 31 Jul 2026 18:22:27 -0700
From: Borislav Petkov <bp@alien8.de>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: "Luck, Tony" <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>,
	"Moger, Babu" <bmoger@amd.com>, "x86@kernel.org" <x86@kernel.org>,
	"Dave.Martin@arm.com" <Dave.Martin@arm.com>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"Eranian, Stephane" <eranian@google.com>,
	"peternewman@google.com" <peternewman@google.com>
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
Message-ID: <20260801012227.GEam1KUyMz601QOzrT@fat_crate.local>
References: <7495c998-4f3f-4ea5-a383-350584afb42c@amd.com>
 <6d006c4c-907a-435f-ac94-32974562ce2d@intel.com>
 <e37866f2-974d-475a-b68a-8b74d6051dc4@amd.com>
 <20260730184626.GIamucAtZxMUUGagGm@fat_crate.local>
 <7d3dd384-9101-49cb-ada4-b8320198233e@amd.com>
 <20260730194328.GEamupYLsURg6VvxBU@fat_crate.local>
 <d364100d-45e4-458e-97d5-05416fbe5bef@amd.com>
 <SJ1PR11MB6083F7EC6D533C4E183D5876FCC92@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260731003436.GKamvtnJlKydaEqstA@fat_crate.local>
 <4bfafa1e-a7da-4c37-8da9-9fbba14106fd@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4bfafa1e-a7da-4c37-8da9-9fbba14106fd@intel.com>

On Fri, Jul 31, 2026 at 07:59:46AM -0700, Reinette Chatre wrote:
> The underlying implementations appear to be different between AMD and Intel.
> On Intel side only the RMIDs (not separate hardware counters) need to be
> considered.  resctrl supports this RMID limit by placing a limit on how many
> monitoring groups the user can create.

Sounds to me like the AMD side should do this too, no, if it doesn't already?

I mean, it is kinda natural behavior to track counter occupancy and deny the
allocation of new ones if there are none free...

> The Intel/RDT spec does leave room for this to occur but a return of
> "Unavailable" when reading a monitoring event is not encountered on current
> Intel hardware.

Why not? Because nothing's reaching that limit or?

> The user can always expect a value when reading a monitoring event (on
> current hardware).

How does that work when you exhaust the counters? Or it does switch between
them quickly so that there's always *something* that counts?

Hmmm.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
