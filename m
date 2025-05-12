Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849DF267F4C
	for <linux-doc@vger.kernel.org>; Mon, 12 May 2025 23:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747092168; cv=none; b=Xeqf7HqIhGxo1NT47QwybYn6BmS84XkkZto3NbkdsImfem7TxI1EcQZM+66ivWLqFS+5HEcVM9gMegGSQ3jwj6p/YKEiv/xOxiJM+XsIcos56GoqsSqk1WtAftSdtfDlduvqUFyYZyCP/OJF17ncOPHh6mb02r0My/4tj8kgM8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747092168; c=relaxed/simple;
	bh=8QV63ZeK82zaeUMGjGSCyyi7ZPB6N83H+neOuJEIHNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMUITS8QUmsySnJalVpheLun+ekkfPjtHfV7rdwST6N1hmo47sRj4H1gEwI3l2eUtAT4II0H83yUccuRcZwKFAmwFajlFYxwiFqksvCbntWfLJdQF8dNDRewS/2kUpYjrbLVgfMBMFYV1pSybwjoPKonRvA6v6U36iVuFmcT3X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=e8x/qITM; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="e8x/qITM"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so64646906d6.1
        for <linux-doc@vger.kernel.org>; Mon, 12 May 2025 16:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1747092165; x=1747696965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5jkt0ZTtnxVT0Fjxc3OfhXNx+LgFr799Cqodw+ag0XE=;
        b=e8x/qITMzwPV1wzZMPV8Qmx9mUcwWFLDZ1hIkQ1dfCx+LHOkvxCdtNSCXG0yB9U2Tt
         4agILe4LTSI4jyH+k8GroLvtGh3hU7mkRyPsGih4aw8CfRSSpJKR+xIhASl0ybawnBA9
         EcNxdIQdrUK5ffQDm6kTHh/WeL7JUCN4AWtz8YsETW3vEt+LlSRl7JJr8rgtT8r1mpuS
         hY0ZSqZdvY2f/yWyUaCtLQlGoQ/kmAJMpuzIv1gWzwGVpqJN1Yjlgq5OMUYuzoe23KSz
         +cbv8XR/hUTuRGj6QwYS7kXZQ38n2/lqnTMBiPUT9exbHCMwXJRkYGtDnUofe95VydK+
         /nhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747092165; x=1747696965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jkt0ZTtnxVT0Fjxc3OfhXNx+LgFr799Cqodw+ag0XE=;
        b=Y6fULtLGC/ssXCyzP0x1u2qZEGskqBO0sX5UOZ61RahgRFmi2OMGWP1y8kTiSU4Za1
         wsFCL2+Njr1NUzFaSPpJD+cBtLJkRJvWdfsJG3N8vlY3XQkX2ZmvFiHxz/ySa9glcJb2
         +oKgttO//3FuZ0Xe2weOQX4Dhu+bXb4kNZeFw7QQzN1GX96Cv7hs2+x0GaFdzPVEP1Wa
         +/kVPXSis680XgdtEkoMuwNzoF2sipgFJ6tG+Y4g0Ww/ppx44NFPRfxSvbu9s+1vrKNS
         yj2BcilNO4R6KKoD0o/yKrDdnfvNm7sylPbN4cKKCKji9Psvi2ktgv9WCPkax0cq3u5A
         U8xw==
X-Forwarded-Encrypted: i=1; AJvYcCXS6scs8ITsIzcuKUpxkUExNpOnN3SAbjs9DBO4xqdimQ5KWUrt8DGDNyX+siL3BMIWbKd7Lv+0MtM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBcyTmS7iJmckXPbN2FbKkoGVF/LFRVLdmBSWIBxIuDjf45Am6
	xoTZhaO7K3U9ggwgDmWM7iMkkSwiOuZ0eQZpRCE2XOd26l/dX6cLZbt/ZkT1xYA=
X-Gm-Gg: ASbGnctrjyfJKrYAwqEzgA8IOVrwZMnS6QtCDmRTpoHxhAt5BFfx9qwVrZbSns6EwsR
	4Szar2GDXV4zOrLoJyVoyO093qt00dLp2t2rKbz+PMyKCzsSc57rrObwSBseQGX63N1cDnXpQqK
	pd0z42VrRhwQgV0MaIRl4HiGyJ/smrZ3XqhgAD3Sea3DbSpuoHkobaSFNwxJ+EJvYWsGRvJmMTz
	GGMEq2jqF02LGnvfiHr9CYm4CWyzgIwa0O/vWHZoIpVeOTASb80Ns2ix6+0qiYLyT94xX+QQiUO
	0y6PnlmLiNHszLwyIHXOxPVvvKGvl8GuJfRGhObvIHHlGCg3OiWlQNsDf9ZWa1z+WCFdTo3amuY
	NtvNwKOBV86prsYVUOV5fE44tN+TUY0w=
X-Google-Smtp-Source: AGHT+IEpJbFQRhO+lDwtLTNlPn4mXIlKeDMD51VI/PuTcgz1q8t124IwQ59ij5lyVuEVA/gq3wvZ8g==
X-Received: by 2002:a05:6214:2405:b0:6f4:c824:9d4a with SMTP id 6a1803df08f44-6f6e47c339cmr228299066d6.13.1747092165369;
        Mon, 12 May 2025 16:22:45 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e3a52490sm58716856d6.96.2025.05.12.16.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 16:22:44 -0700 (PDT)
Date: Mon, 12 May 2025 19:22:43 -0400
From: Gregory Price <gourry@gourry.net>
To: Dave Jiang <dave.jiang@intel.com>
Cc: linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	dave@stgolabs.net, jonathan.cameron@huawei.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	ira.weiny@intel.com, dan.j.williams@intel.com, corbet@lwn.net
Subject: Re: [PATCH v3 03/17] cxl: docs/devices - add cxl device and protocol
 reference
Message-ID: <aCKCw7wvvfiad0Q2@gourry-fedora-PF4VCD3F>
References: <20250512162134.3596150-1-gourry@gourry.net>
 <20250512162134.3596150-4-gourry@gourry.net>
 <e5211a03-617b-43f8-8ba4-b75557e283da@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5211a03-617b-43f8-8ba4-b75557e283da@intel.com>

On Mon, May 12, 2025 at 04:08:24PM -0700, Dave Jiang wrote:
> > +As of v6.14, Linux does not provide a formalized interface to manage DCD
> > +devices, however there is active work on LKML targeting future release.
> 
> I wonder instead of referring to a kernel version, maybe refer to the CXL maturity map on support status.
> 
> DJ
> 

This is a good idea for cxl-specific stuff.  There was another patch or
two with working like this.  Might be worth collecting these all and
just updating the wording in a follow up patch.

~Gregory
