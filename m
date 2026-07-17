Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE972339858
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 21:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784324929; cv=none; b=Ly3xstU4Icbgtqj3lorCxDcILYQ7+gJQRP2ySEEMJPQQthxsYcapLZE9/B400lshQ48g6ddNXIUNHDUjdZvfipf8Y5SSIFRtfolbbinYKhSKGO4CBjUQ2/SFPllQKwRaNpRUVkGwu2hZ9136hc/1LgoICCsO9qXTCyjDn3P7kH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784324929; c=relaxed/simple;
	bh=496HIZ5NHAZVhZ3LL7qzsW0iuwhuVPP7StMDlrFgMMk=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=bNlsL87yYVFwV1kbhW+kn1zBsKgsh2VFzQ25sBhdTsmcTda8JqgtHKMbRKZcBe/uIgVB1yvX9PUmO/cK3XHIANR/QGcewctUQEBTmHGN5SqMqqA9mGMTuREOkO4l4srYvdfx4uxLI1T3oyfmlxQqhsb7yUPO9WB9iHj3hA+GDZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Dyh4dB/2; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Dyh4dB/2"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8f1a8e914a9so58038186d6.1
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 14:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1784324926; x=1784929726; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zmfnNFiyVA8U0Zovz7XobfQoJyevheG0HUiwPSbCO8g=;
        b=Dyh4dB/2oii2ddBD5PqYjp+8vpfz0CZg8YySu0rn3tpeJy/V/+6yvaXZwLNxQExJb3
         WxRTWVEy2mvyNBzcRCnaMgeNto/hgBiH90mSYZMdMwhiJkzPIfqmcwKJKhc4XV806fj3
         kyQqTt7CgKLcRGvhcLpV/lKSNB7oILemFlGR1VakdG6xFiJgS102bCsPLWzWPchDTn5X
         YlQXTis234BznkcgYkD0uDb7sfwSpNokOhD53PxwC1VXgWIFV/WkI6SsO5Yq/oYoEP5o
         h5G1H9BrX2GiT2R4AQHPdWVIsUNfw6AT3IhNZ1092yyB1hG54b8L6tAJ6NfzWLOIjQxw
         2MBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784324926; x=1784929726;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zmfnNFiyVA8U0Zovz7XobfQoJyevheG0HUiwPSbCO8g=;
        b=Eev8ZnoxXqrl2U2kJkzbn4YhWcxLu/pwK+x403VwiSPDOleQVeM8CD36F8S116S5ko
         scBrMOYNXdXXcKrHb6ZX67+7iWu8dqNV4VCJPRDvOo1AH+vcPC6CwLXjSbcnnCa06KJM
         Y+NTXoLTfG076QEf/14S7XcJVuqHiLW739Gexj2VVEbw8LyNFwfgrTCmQHoBXdciIgoG
         auRuxRJBSD9UWYHhbt5F1sRTyUv0X9S1pS/3tfiKp7OITMpLeKM8gjTwrtPjJUivRdez
         3yzPqFGp6EmpSDWyQgk+gN7eh684bDWv4211laFOsb+Q0rrmHMKBoAt1TCp4SCMuH0sJ
         rn9w==
X-Forwarded-Encrypted: i=1; AHgh+RoipsAlwP+ye34PiCbYXhdZJ0kuvxhyjzSlI7OPZ9tIgC3mr3yNP59VXblCmBqheXYxk42Q+OgGdp0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ8JpsX8DhjxAL6k9ctE6Za8I1v/sgZYagNQkoEm1LyDfaYDpe
	uwgiljvLwhmrqBtHfsPwROtZ6sh8xkPHtDSVJ+QTGsR0WEUubJucfd+Q1bRysBJ1gbwiljKFznc
	Fydcj
X-Gm-Gg: AfdE7clBdaY1YA1rNi8/HVPogBFm+rvtWXJySgE98JNZOLNE/svZewlBkgLVc/ESVBB
	7UJPrp9mfo2DETVkCLqiWLK3KdNMHRGpkZTIFO3Jb7bxT+kmLNudM8dVM3Pbwo3M4BYf1iHf1iO
	6Z50K8LqPONuG4COQ6pUkBJ3bP8DgOjqm0zYRCQ4VgpoEwddLrfr9t9NQtgmJoA/cjucePK1kx8
	j4QWiABkYwm0+CtidhkiMPQQbBQN9w+8YWQywfgtl9EQAL9cYM0V/VbxbDi2pYthdtnTg9YHnv7
	oz5MhOOTTTGO8/mSn1CWWcEL9lIt95t9CNuHFFwlkj4PrCiowhFnUfGRU7ezp8xikUGuPLglpgb
	6mth/hjjohVOpbPyIwIEQR4Uh7nVzHLxEn8Jm0PTkbLcMHTYUx8Rf9p4Ekncc7wbsr80lUI0n4L
	/pG9qixchHr1JXWvWZvzeu1qSYd5lCbYgULDGISOs=
X-Received: by 2002:a05:6214:4284:b0:8e1:694a:73d7 with SMTP id 6a1803df08f44-90778380e0fmr48191416d6.24.1784324926660;
        Fri, 17 Jul 2026 14:48:46 -0700 (PDT)
Received: from [127.0.1.1] ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907786f79e1sm26338696d6.38.2026.07.17.14.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 14:48:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 05/12] PCI: liveupdate: Keep bus numbers constant
 during Live Update
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
 Adithya Jayachandran <ajayachandra@nvidia.com>, 
 Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
 David Rientjes <rientjes@google.com>, 
 Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
 Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
 Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, 
 Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pranjal Shrivastava <praan@google.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
 Samiullah Khawaja <skhawaja@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
 William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <20260710212616.1351130-6-dmatlack@google.com>
References: <20260710212616.1351130-1-dmatlack@google.com>
 <20260710212616.1351130-6-dmatlack@google.com>
Date: Fri, 17 Jul 2026 21:48:42 +0000
Message-Id: <178432492211.189683.10563224295975168718.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=934;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=496HIZ5NHAZVhZ3LL7qzsW0iuwhuVPP7StMDlrFgMMk=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBqWqM86KaHlniHcC84sbvvlVrTWaav3eU4iNKDj
 SHnfSycZhyJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCalqjPAAKCRC7dyhM23N6
 3pAgD/sHtZxz2X4+/Faxm+h83v6Zqb8OrDRH1Mq0Fu/Ty4wrIDO9AUyUsVw70fA/N2MvHxp/1Xp
 KSw01NVB4QDW/o8OkXnordoL06ZSPy/CN8pA4ibrtaW5GTXc0HvVn9XjzLb5TpkRvVQUFoDZlNy
 xqZQfN5QkA5t46L/QfCx5fVPGdFvvCf7gpOQ3aPXbygWPYWSjBL7i6noJgIm8o7tHCxqOCtmJpS
 KLj9FwZbnQrxac6ZagR1+sP2hfHfTsL07j8Xkw3dqdwDw76uuBV3ulOvMvLHk3xJiU8BQmb57po
 lsovpsci8MA+2Nd5qdOYySDGKbbyoTcdUVGqI7ynPmbWL2z6/i/AoYW1JgUN86kg2moCic79wqs
 5LjPhY13xc59vZIJn1Xcd+9qdGgfK5FHgXJ246tswyKVxFHB0Fom6tFgtrU/3QwZeD2Y9dcSZwd
 UJP391ZDKWNhdRK1FDFkE47jOg9y93FaurAyMhna+kJORxVLU814KM6CtBCoIQAwjPE3q+SFwKK
 74v4OBYVRxM7McuhNVOnSHLnObJdMRoYfVJheKPIHNs8V60mCzqr8vQjLPpQVkTZWWxup01Mbxq
 yaOhEnGzX9FrYRbdujMNfroiOD9ejkFN1MRBE6SzdTWb4+cRb6JylvfqUF3OT9qHkmHG5WBvAYM
 euocaROZ3nCR11w==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Fri, 10 Jul 2026 21:26:08 +0000, David Matlack <dmatlack@google.com> wrote:
> During a Live Update, preserved devices must be allowed to continue
> performing memory transactions so the kernel cannot change the fabric
> topology, including bus numbers, since that would require disabling
> and flushing any memory transactions first.
> 
> To keep bus numbers constant, always inherit the secondary and
> subordinate bus numbers assigned to bridges during scanning, instead of
> assigning new ones, if any PCI devices are being preserved. Note that
> the kernel inherits bus numbers even on bridges without any downstream
> endpoints that were preserved. This avoids accidentally assigning a
> bridge a new window that overlaps with a preserved device that is
> downstream of a different bridge.
> 
> [...]

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha Tatashin <pasha.tatashin@soleen.com>
