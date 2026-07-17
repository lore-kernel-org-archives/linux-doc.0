Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08123F8ECC;
	Fri, 17 Jul 2026 12:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784291797; cv=none; b=JMOAAN0xTBaOHu7e+OICSoXpolyFjeXLOsUtBh7lnT0UTF6ZE/B8xmRCPOASfkPTGGoOujpLQ8PwVG3UhMsEvG6/hThx2Rq6KyO3zdbmBq801g0OQ60/vAlUAeunbAv6WbhX9e9TTdAWGMTcvzBLzRPrF0IuM0o/G1dhNjkqZ4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784291797; c=relaxed/simple;
	bh=cK5CyITB0AQ4m/M1LPMHQsYqVGfmWCfGzBB/iAt08Fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AbhqQ0NX51ZNSZFYA8fmz4jHlxjqKXncJASgl2Dm7OBnwzGdkLrRdNqANzKPoJpk8XknUiAoI1Z5MqvwOCPlpNYyvGM57Q5K3NYU1tucq+iAdpX0qWhgI9ICOE0CqqTYCOi+4kJ5X2yXAf5xK7Dev+9uLRu+6waPALCeIlvhJm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SWY4iwE3; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SWY4iwE3"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BA161476;
	Fri, 17 Jul 2026 05:36:30 -0700 (PDT)
Received: from [10.57.84.220] (unknown [10.57.84.220])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DB2D3F7B4;
	Fri, 17 Jul 2026 05:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784291794; bh=cK5CyITB0AQ4m/M1LPMHQsYqVGfmWCfGzBB/iAt08Fo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SWY4iwE32bOwuSxhu1Kr1LYKKKXPrBMFSFsib240wu2IB7V33T92lfoCNtCvAXPRu
	 tDR54r1ifr8tF0pN1OPK5iKnW7W6gAVayDho5Y4frWx7ELROJHnFijd5hlJvaDQoFe
	 ZLPPTRk6SWeGqDpwVM6hbKtrmRZgFqBqIDuSl3bM=
Message-ID: <c000fe3e-2c10-4b2e-9f3c-852e38be5eb8@arm.com>
Date: Fri, 17 Jul 2026 13:36:30 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 3/8] misc/arm-cla: Probe firmware-described devices
Content-Language: en-GB
To: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jean-Philippe Brucker <jpb@kernel.org>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
References: <20260717104759.123203-1-ryan.roberts@arm.com>
 <20260717104759.123203-4-ryan.roberts@arm.com>
 <7927c483-57ed-4253-a7df-40104ff2b192@app.fastmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <7927c483-57ed-4253-a7df-40104ff2b192@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/07/2026 13:25, Arnd Bergmann wrote:
> On Fri, Jul 17, 2026, at 12:47, Ryan Roberts wrote:
>> +
>> +static const struct of_device_id cla_of_match[] = {
>> +	{.compatible = "arm,cla",},
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, cla_of_match);
> 
> This is missing a device tree binding, and probably needs to versioned
> in some form.

Given the aims of the RFC, I didn't think this would be a blocker for now - of
course it's on the list for if/when we get further along the road.

Thanks,
Ryan


> 
>       Arnd

