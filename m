Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3272427FA2
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 13:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787578922; cv=none; b=iKzPjk/TawY2v3vp2+Duoq1ZtUK+NlBty2z7UPNKxorc5C0XXiDaeuKLSfzznN45CMfqDntv+q14Mgl3Wm1cq9KWMBNin1wvSiMPpyA8gPYiK4sKDyHGfxhR+T4V+Jw/oE/YVQhi7doSrHiceTgcADKzX+Z4EXKjIs2sgm4vvgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787578922; c=relaxed/simple;
	bh=sUJnHhuPy90G3YkuM0+hoRK3i6Ml7NH3z0qLIwzobms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZkKHt+BkgjxEsxuELY8a8g4iYqyxOil/evlUFESLqDUa1gOPPaX8BQKaxes4ALhBLTJVXTo9Y1nLO/3bdMe8vTNWFOl2cByZno02CB4WEFGgn/mBv9tcRkogrOYhFAW3CD7wHVrx4k6lPa+PUOp3el7QkPRzPy2CQ4tQSv4Z00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GPYxRjdV; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GPYxRjdV"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ccdf36f63dso158395ad.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 06:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787578920; x=1788183720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MXklq75Z4X2qA44rayjTFnITvL4DP/DDkWPkbOCUBY0=;
        b=GPYxRjdVOQxQmiIiZMosi0ALTs9ZYMufPgnWVqer9nbj3SfzIdYHsuloNYtztGoJwF
         ZUevZfIxglWQF26V/YVV8nHZfJ0Mq0mSLOguQufd+EY2D36OR8qekZfZbD0nbETmCDVQ
         21tGZjaW+XvXqFbk2ZJ2rIbZeMxg2CxS/xrp98+sUoxapNTON4P5G9cNOuNwvjrtDbWt
         6pW2DzvWnHt9+TFw6Nj9AUlxOoKWwlA220DtBuXF3NqDgYzU6ZpPcsMA7teHKX67+yLd
         Q+pdY1lcsftDsLw4ncV8ygoI+7A/NkFVZOEn8A3Kr0yYoc8o6PfFD4VsicR+vg+xyr0r
         kPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787578920; x=1788183720;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXklq75Z4X2qA44rayjTFnITvL4DP/DDkWPkbOCUBY0=;
        b=Lr5KBzeMn1kEUFg2w+Y8B86OVyI2R6UXdInJaQIP0t5h5QyxlbBYW/z07wbICXJe64
         CarTGlZrHkpbJSzhMGjGU9Lv9pjBpdGl9chxbOwJaB7rUp8qPFoD8lLSn66538RpbaKq
         tOMRUDxgUlTE1QJP21lXHDiPWQyG+sq1EdUmYWjInFgQDf0ZHVzfUUTplWr68UXQFDxB
         skBgBScc7AtXw9PQoF8qWH/w7KAE7vlyW10vdtd87yQtCD8a3lv/tLle02/g5x2zFi3h
         uJTLCX2xuzC2JIVqvlDBIIHr/z4MFkZ7MNBmS/8dXrFV6f/j9C+lkkSdzzaQzy3CqhQz
         6THA==
X-Forwarded-Encrypted: i=1; AHgh+Rrf76UXiZCpX9cdxRSq8q59Aj52pLrk/kD9QtcgVeC5VGP4Y6QJhfzq9q/OfqRn/H3PCYSh5/UHrmQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nmXR9GqXf3wFv8h6HYK4o1GS3cwMZtDpxsivxyRxYmgXwZlWQB
	Fu7VeyoYw4gKkbwqNrQqjui+6pVX3mqieekHERZOiPeOKm4/tjJCeapsoz/cKJFVbw==
X-Gm-Gg: AR+sD13+teUsMHulFzAepjPlEEDLxMz3aFvPCpg1bS/15dSLZ61coSJjYQDeLkkbVht
	AIY3DLYATpEcNuw5qbaAEzuSUlo9PdXTYE+u+m3NIxAH4VguBRfpz1RcJISWYvepSHYkxqT/OLd
	npBwIjD7Ol4dfpmIZTrEBUCn+qPReuzSida5ZRNGJ/qu358SNkNsH6dygq8UWM2C9/v2Sa0hiDK
	irD4vRVz53Xkn5efaalyHt4o7NfKuyZND5VT5aUN9IlN3q9GdKIlC8KB5E5JZHfjOnPsVikxK1f
	761+5WcVSmRCK4rApCmYMJNRdj1ndF2qGiTcJ/Du4L/H5QBzfArB2z4fT4d4O0pIMQ8/lcSX9vf
	B98J2rIin69qXUUinMnki8yo+55EjVFHDjKyHVt0BotMyEkg2AWdC9d0ozaUYBElv42iAdhBkUM
	9PSGZDNncVmvjJGaNraORV5aABqrjx07uirJ+47U/d219lIX0gMRbNnxdMmKZIPwWq7oTcfHPKl
	qdOKeAjppNtdrhiLcBZ7zf4WA==
X-Received: by 2002:a17:903:1b4e:b0:2ca:cbe5:c3af with SMTP id d9443c01a7336-2d673b9e9ccmr8380625ad.7.1787578919029;
        Mon, 24 Aug 2026 06:41:59 -0700 (PDT)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676761c35sm18347475ad.15.2026.08.24.06.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:41:58 -0700 (PDT)
Date: Mon, 24 Aug 2026 13:41:50 +0000
From: Pranjal Shrivastava <praan@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v8 06/12] PCI: liveupdate: Auto-preserve upstream bridges
 across Live Update
Message-ID: <aoxKHh_zLBb5vhzY@google.com>
References: <20260728221007.2098560-1-dmatlack@google.com>
 <20260728221007.2098560-7-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728221007.2098560-7-dmatlack@google.com>

On Tue, Jul 28, 2026 at 10:10:00PM +0000, David Matlack wrote:
> When a PCI device is preserved across a Live Update, all of its upstream
> bridges up to the root port must also be preserved. This enables the PCI
> core and any drivers bound to the bridges to manage bridges correctly
> across a Live Update.
> 
> Notably, this will be used in subsequent commits to ensure that
> preserved devices can continue performing memory transactions without a
> disruption or change in routing.
> 
> To preserve bridges, the PCI core tracks the number of downstream
> devices preserved under each bridge using a reference count in struct
> pci_dev_ser. This allows a bridge to remain preserved until all its
> downstream preserved devices are unpreserved or finish their
> participation in the Live Update.
> 
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Signed-off-by: David Matlack <dmatlack@google.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
