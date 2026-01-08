Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523B126B95B
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 16:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767889209; cv=none; b=JvVoQ/8lC95OH6cggTGT+wOBEJh6j8kikiYRyBHe1U6meGShveTDUSUMXeh7s1adoNR78MMK+SX/XXhH5JnUkiO0qshdKNQIy/PpiNbhaP0/xw5Rv6rOUxxWVFO/8slbzW6h4DuQCfMBY9kFKM6tUxhrbFOtpFyGn8nV6kdeaOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767889209; c=relaxed/simple;
	bh=yvNU1AvVWUsd+D1YN7GGiy/e4EfmDjtr0T/TuSwjWKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MjjEZPqSwbexiXv7FYWlNk3BAvpiP6arW7go/NxOTXok5pXRqM7noK4OyF1kdFG7HoX4RDd98oFcDowmEkqwxSnSh/Q1grQaNXGFNnDew2hldagyURrHCxpyYGquHUjbIl0ubrvXwSQBW0cpslfAnZBqwCJhYahb3u+UtpTEs2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNKHl54I; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNKHl54I"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-3ec3cdcda4eso2477162fac.1
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 08:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767889206; x=1768494006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVhhJuuiBGoK/sFvk0bqtRfj9CRgQvxP/k+MrdnYe6s=;
        b=gNKHl54IIO9I5g2NH+3g7xsv2nR/Ixg6cUgki8Aaw74Rt/gR0LM2AyWuWsD4mLIIry
         duuGPRIKgz09CE0Bs6h6GSthtteXS0bqkvzqdYaYUJYtnCi4XpJv+h31rWvn9wyaLU+v
         tflHiYFxeJVdLFrt6EGAOCTWIetZUyB2zbfcm85J27TiB34NplSLElsVEIbR8f4wu6vz
         u0KhDPjs2WABFD3dI3cPWkBYb3tgZ/AHtjMhDUNft73hIPuqsuKmSeS/3GSg0UiYPfiS
         NJuPe1UDBGKfxbVoUTpnQ7wCbx3+dCir9j/bmyXRbe5PppEkcs+KigQFcCM2vvuwNpxS
         xaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767889206; x=1768494006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HVhhJuuiBGoK/sFvk0bqtRfj9CRgQvxP/k+MrdnYe6s=;
        b=hJ8D7Oiq6g9Ds2sKeSuAShyntRfxKBctaeYtG+ok2/lDYRsECFmpFk+dr7OHeHeDkp
         5Q7Vz2zBKK6+5ukt3I6YAdVxcuu7cfFEuzl8pS+mvdRENtKG3j4INi1HHENRLKhaUWFf
         l4PEMPx5Ocvae9NRsKEf7V/4CucSARhyVaaSRJpBeQ8Wp01Imrc44Q8IB+Skpc93lMzA
         wXY9llKfWlxFLud88vheXyJsyNducHmXmEvX1CS0ir1MrVIGr4BtwGG5pPjIPHxwzGG8
         luXsgu8AfgEHiH5QulpYS+72NqWmS4NmU2VhNzeS8zwTP8L/pGJlyghWtwSOnUtQoikj
         vhHw==
X-Forwarded-Encrypted: i=1; AJvYcCVPZL+DdC1LflFfZFwqTVQDP3aMy0MVwcEjf/odYs/kqjpsVFESl+bvp8LTWImuW1ArtCMhblvki3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLFj2YJbr+hVH2PVbErejIktUsP0RtBXzzqaoz54eRjy+FswH4
	VaSvu9txqhV9VMFoF8ayAo8zwR+EtAXpDOiBH2d0ZQCTuA3tlv80/CUi
X-Gm-Gg: AY/fxX44W4rr9Z9M+juJe8dBh8j354rmK3Ytl+bk/Kcv55p0ThsTeMi0uyW6BT3FxTo
	IUVgF55X5IddxBxdeU1UfCvdURBEWz/OVcqZlYV5jzJ9Kq+sJcW62v8Nq6iIHXFX417OJAKycnX
	DDns/hANaOWirMZ1NyiQ6NYT3W3smrqbhsMtmnWvRaFKNYjlVusaaOMdkMCWh9zVm7TIAAnZLtF
	3xduIplWAhB+7gkIpfLaV3/YWPR6HjpsvGndbCyBJIaD8ZCbVczpSXTePkSsL5QZSYg2in39fTI
	MAn0gDs5Oa4E7EyO1tSrBglSVSJgmjEUHOHnKhodbsaaxiqEpDzPY8vFt5ImzfmuJx2n5EOuWmD
	5BD+k6mKvC3yNL80qM4LZU37rxrKCgwsfLFd0yWPtLv/GNZ6FsZFTjb7lw/VcHZNHoBChxVlPfe
	g+jHZX7a5H10MoSu2bQvdeBxh+QQJHpw==
X-Google-Smtp-Source: AGHT+IH6THnfmjfea6h0UnYX2fNH0dcgns7iJzl58Bvp4j/zTpmPcfdP7f0qEllI2ONh7EMKMC6yuQ==
X-Received: by 2002:a05:6820:f002:b0:65d:1e7:9526 with SMTP id 006d021491bc7-65f54f06dfamr2864960eaf.10.1767889206030;
        Thu, 08 Jan 2026 08:20:06 -0800 (PST)
Received: from groves.net ([2603:8080:1500:3d89:902b:954a:a912:b0f5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65f48bec1c4sm3344121eaf.8.2026.01.08.08.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 08:20:05 -0800 (PST)
Sender: John Groves <grovesaustin@gmail.com>
Date: Thu, 8 Jan 2026 10:20:03 -0600
From: John Groves <John@groves.net>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, 
	Dan Williams <dan.j.williams@intel.com>, Bernd Schubert <bschubert@ddn.com>, 
	Alison Schofield <alison.schofield@intel.com>, John Groves <jgroves@micron.com>, 
	Jonathan Corbet <corbet@lwn.net>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Amir Goldstein <amir73il@gmail.com>, Stefan Hajnoczi <shajnocz@redhat.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, venkataravis@micron.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH V3 05/21] dax: Add dax_set_ops() for setting
 dax_operations at bind time
Message-ID: <tndv7ezryq5m57r5iyoyr5suq5lliy37ciqluia7gh6znaecry@nfwbtzmsvcyn>
References: <20260107153244.64703-1-john@groves.net>
 <20260107153332.64727-1-john@groves.net>
 <20260107153332.64727-6-john@groves.net>
 <20260108120619.00001bc5@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108120619.00001bc5@huawei.com>

On 26/01/08 12:06PM, Jonathan Cameron wrote:
> On Wed,  7 Jan 2026 09:33:14 -0600
> John Groves <John@Groves.net> wrote:
> 
> > From: John Groves <John@Groves.net>
> > 
> > The dax_device is created (in the non-pmem case) at hmem probe time via
> > devm_create_dev_dax(), before we know which driver (device_dax,
> > fsdev_dax, or kmem) will bind - by calling alloc_dax() with NULL ops,
> > drivers (i.e. fsdev_dax) that need specific dax_operations must set
> > them later.
> > 
> > Add dax_set_ops() exported function so fsdev_dax can set its ops at
> > probe time and clear them on remove. device_dax doesn't need ops since
> > it uses the mmap fault path directly.
> > 
> > Use cmpxchg() to atomically set ops only if currently NULL, returning
> > -EBUSY if ops are already set. This prevents accidental double-binding.
> > Clearing ops (NULL) always succeeds.
> > 
> > Signed-off-by: John Groves <john@groves.net>
> Hi John
> 
> This one runs into the fun mess of mixing devm and other calls.
> I'd advise you just don't do it because it makes code much harder
> to review and hits the 'smells bad' button.
> 
> Jonathan

If I don't stink up something, I'm not trying hard enough :D

Next iteration will be full-devm.

[ ... ]

Thanks,
John

