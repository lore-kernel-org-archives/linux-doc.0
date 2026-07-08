Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55DD384CC2;
	Wed,  8 Jul 2026 10:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504835; cv=none; b=AW0kt4LF6uw3EYQWJUhhOXe1WaEjVfSoCyuOZccD0Inrx14IP8kuROfo1kSOCgtt9pSTwtGlhO97KI6yZPQYSawhOJbEU4TNJ1nFyo4x3Mxn9L8oSsenp8I5nyEE2EzrjQCSO/4GKRiw6yzDAXCt0jwxkDHaLTQWQi6p6XioV9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504835; c=relaxed/simple;
	bh=8oFU73UDNb1/JzzX/59Hz8/SUvhrGo6jInm1l2EOvkk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=SC5yzpSvK+qioOC/ZeUDXoB2yw9xxs6s9n7xuNKHvxQZbu1v9OHI8sJKa8fT88LErKD0Wv7SqF8UGnPqpPfMPvEmoukrMeUcc70wKyQucY2LtyHypMQa/u2IpIeSOZ5LNTHmeFtnZtmZIyP6FJ9MkTk5Oq4SEjUYmxIT3zmAEqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=K2QzZNWS; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="K2QzZNWS"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B75871E5E;
	Wed,  8 Jul 2026 03:00:28 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 31A4B3F85F;
	Wed,  8 Jul 2026 03:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783504833; bh=8oFU73UDNb1/JzzX/59Hz8/SUvhrGo6jInm1l2EOvkk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=K2QzZNWS5qvtc90qr2P/bmEBxGozBIkajd4g2BYgXL6Gp07XfQg2fDAaRimBjytR3
	 AnMyVUC1k+1MwDKxSrlcekXCA+Xo6jxwuhPGUKvb9LNjSYAl8jWKoOD6L8rj1fhHUR
	 MBLQpicTg0GtL6aQ3jsYy8mAbKKMKwErUf1HScIM=
Date: Wed, 8 Jul 2026 11:00:27 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: Mike Rapoport <rppt@kernel.org>, ardb@kernel.org, david@kernel.org,
	will@kernel.org, linux-arm-kernel@lists.infradead.org,
	akpm@linux-foundation.org, bboscaccy@linux.microsoft.com,
	bp@alien8.de, dapeng1.mi@linux.intel.com, ebiggers@kernel.org,
	elver@google.com, enelsonmoore@gmail.com,
	feng.tang@linux.alibaba.com, gpiccoli@igalia.com, kees@kernel.org,
	kuba@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	lirongqing@baidu.com, peterz@infradead.org, rdunlap@infradead.org,
	tgopinath@linux.microsoft.com, tony.luck@intel.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [RFC v2 PATCH] reserve_mem: add support for static memory
Message-ID: <ak4fu1qINGyAQUEl@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630170911.43521-1-shyamsaini@linux.microsoft.com>

Hi Shyam,

Adding Lorenzo, Hanjun, Sudeep.

On Tue, Jun 30, 2026 at 10:09:11AM -0700, Shyam Saini wrote:
> Following up on this, As Mike pointed that reserve_mem is best effort
> reservation mechanism, so what is the recommended reliable Linux
> mechanism, if any, to reserve a predetermined memory range during
> early boot on ARM64/ACPI platforms for warm boot scenarios? KHO is
> one option, but I'm specifically looking for a solution that preserves
> the region across warm reboots.

If you need ramoops-like support, I think ACPI ERST is a better fit and
we don't need any memory reservation tricks. I'll let the arm ACPI
maintainers comment further.

-- 
Catalin
