Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E321CCEE0
	for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 20:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758229055; cv=none; b=Jq00ltTZ8iRE7n2nAFFSpWxeeIelsb1zapI66mLcnveDBm9+NH+CtSDtpTSK21ZoRGpeMu8+/vyX0uvJkTN2lzjXDXg7MfOhsuOJzB3FHULr4Eou/EZL9xwu7sAgp5COqdZ6cmkjuYjK3r6yHleD+yp1djOTyWoRvCB2iV4J77w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758229055; c=relaxed/simple;
	bh=13VJs7I563zMXcilTJ5ZSbYvZTg0GMtcoQCa3/06YfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQQSrHcn6kOVI8tJvOLZdWh82zri4kiqsTtbqwMEHaj1SZjT055u8nD3kNEQmf8FKskLzF+Dy15S4hZto3nUOWIXzLjQu/ITF44q0hn/WFIhz/t1+YLqCe1yXqa6ZJwofVPbNfNLI9racDAvBpmD5efAFWl/+lxYrt7Y3MHXV8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hMwX8QrH; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hMwX8QrH"
Date: Thu, 18 Sep 2025 13:57:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758229041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YboiNlJLrHuwno2dTNAWyyWHcEmx4DdrrYbhMW2x15E=;
	b=hMwX8QrH4fVXAwsA6C23vCpsbnXMcPQ5RT3fH0rwp8436N2NIRDg5prPa4eJl3ts0ENGgl
	OnHiTWmb+Yba4LKkFNqLIietZ8lHLPmXh1JuiGOPdIJtj14t/ToyD4SSZmqzMts2ATW2cN
	q31pKLvfhA9Rnm/xi0Hw7bSQ3xPvRAA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 1/2] KVM: arm64: Expose FEAT_LSFE to guests
Message-ID: <aMxyKbnVjS35YuQi@linux.dev>
References: <20250918-arm64-lsfe-v4-0-0abc712101c7@kernel.org>
 <20250918-arm64-lsfe-v4-1-0abc712101c7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918-arm64-lsfe-v4-1-0abc712101c7@kernel.org>
X-Migadu-Flow: FLOW_OUT

On Thu, Sep 18, 2025 at 08:42:06PM +0100, Mark Brown wrote:
> FEAT_LSFE (Large System Float Extension), providing atomic floating point
> memory operations, is optional from v9.5. This feature adds no new
> architectural state, expose the relevant ID register field to guests so
> they can discover it.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

We also need a test in set_id_regs.c selftest for the writability of
this new feature field.

Otherwise:

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver
