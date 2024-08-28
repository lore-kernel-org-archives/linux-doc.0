Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE63C1AAE19
	for <linux-doc@vger.kernel.org>; Wed, 28 Aug 2024 20:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724876493; cv=none; b=afLtfYL2DuQSlM5Nm6uEhDvxcBex3YI+U6X2rAoiaodYa/3SNyViymosc4c79gUEffjBuDhl1Z650/CBTdxEg1uqN9ntqBch8qdZrKT9rECA3Arhcu56LjNiEXkFV0yd/BUm2DilqxAJkkKrlPQgSJ/XMTBYXNT2NUUdRITZzw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724876493; c=relaxed/simple;
	bh=rhazEJ18zxL7GKKEYCY2DhRXiQx3Zo44AezMhmDRL+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jRYB+vLttDpLNSvhpaqX4wJ3B8gt+xEeEP1vDDzPPayqMDO2nS2XzmLL0x+gW3je1pKXmnYnvJD0JHRO1S32MCutXyL5svGcYNFFaL6VtyFGIFel6//AQ350z+kcggj0iNK+fVTG6fA9G39/LbvD4MgoQKsY59jxezye+mgRIHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xDFnR12P; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xDFnR12P"
Date: Wed, 28 Aug 2024 20:21:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1724876489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3Xm/6To/0+QIxO47lLdLDJqf3M7/P3VQuUcWXRAtwM=;
	b=xDFnR12P4UZuPbFMRnDS1mOuh500SWCcLTF1T1+dfD+1CiLSGfknLgUYsNMQlyj7Y+Vp5x
	I0KbpElMYEbGqnYg1eQUS5XhOAUycQDMSTvzW9pyH4Lx6Ot/QSdqjxDLNWwp1dZvtbA/50
	OgYG+Fs0RH1ZsZTl7D1K96hckCmICrM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: D Scott Phillips <scott@os.amperecomputing.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Rob Herring <robh@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-kernel@vger.kernel.org, patches@amperecomputing.com,
	Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2] arm64: errata: Enable the AC03_CPU_38 workaround for
 ampere1a
Message-ID: <Zs-GwkIMauATQ16A@linux.dev>
References: <20240827211701.2216719-1-scott@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827211701.2216719-1-scott@os.amperecomputing.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Aug 27, 2024 at 02:17:01PM -0700, D Scott Phillips wrote:
> The ampere1a cpu is affected by erratum AC04_CPU_10 which is the same
> bug as AC03_CPU_38. Add ampere1a to the AC03_CPU_38 workaround midr list.
> 
> Signed-off-by: D Scott Phillips <scott@os.amperecomputing.com>

You'll probably want to cc this to stable, that can be handled when the
patch is applied though.

Acked-by: Oliver Upton <oliver.upton@linux.dev>

-- 
Thanks,
Oliver
