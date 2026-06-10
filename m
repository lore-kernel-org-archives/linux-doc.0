Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7383DDDC9;
	Wed, 10 Jun 2026 11:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090891; cv=none; b=OKV5i+LQIXwRwcT1lyBmWIB17wzvzRll8zgI32Ag4h42S/2HR4mEVtRJ9PWNwOkX64LyWOGxrD4Mkn/UsetkJzkmMpeitzQE5B7YyS6iLkwR7nKABiFF1GyRhMdmdtw9aLluSuXGJ8xzDQx9H39UV1PKoXZ6Ry25fsfNo5f7yVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090891; c=relaxed/simple;
	bh=yV2n5HYiQ06aTJOFX3gt+GSH9PHTvaCFQIZLG+04Zyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4a35gTXWICaX8HH2emuAh4P9nnhOcOvTc8K2IznJmj9VlOVVubKwBV1JfHYfN2TB4Td3v5kdXq7CyTSSFEPdgFqK1n2NuSQRLig4ojtWkfueI8GZpvX9cPyzQGOrpoOfQyAVRzn2ATxd4fq6YpSfh2vPw7cGx8BBVsVNbjCgls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Wt4DnpbG; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Wt4DnpbG"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD046339;
	Wed, 10 Jun 2026 04:28:03 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99CC83FD88;
	Wed, 10 Jun 2026 04:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781090888; bh=yV2n5HYiQ06aTJOFX3gt+GSH9PHTvaCFQIZLG+04Zyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wt4DnpbGPuLCIezGfm1cPxXbkPy5cWIVdsEz+JqBySZEBJ8OhhtgSzJGEvJwG3wlY
	 hgSqb4Knew2ijMzZLd2nXGFZTRM6aZMSnm9pBARA8DQlIoox4Y8M1qDTiPQTBhtVDV
	 NJYWvvjOyagzdzrX+djSh+d1dPMKuvMAlR/M38ms=
Date: Wed, 10 Jun 2026 12:28:00 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>,
	Alok Mooley <amooley@nvidia.com>, Rich Wiley <rwiley@nvidia.com>
Subject: Re: [PATCH v1] arm64: errata: Mitigate TLBI errata on NVIDIA Olympus
 CPU
Message-ID: <ailKQJQuDSsHijYc@J2N7QTR9R3.cambridge.arm.com>
References: <20260609234044.3945938-1-sdonthineni@nvidia.com>
 <aik1owW9Rz8B7rEz@J2N7QTR9R3>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aik1owW9Rz8B7rEz@J2N7QTR9R3>

On Wed, Jun 10, 2026 at 11:00:03AM +0100, Mark Rutland wrote:
> On Tue, Jun 09, 2026 at 06:40:44PM -0500, Shanker Donthineni wrote:
> I have one minor comment below, but that's more for Catalin/Will, and
> doesn't require a respin.

[...]

> As this is getting increasingly long, maybe it's worth reducing this to
> "Various" in the title, i.e.
> 
> 	bool "Cortex-*/Neoverse: Completion of affected memory accesses might not be guaranteed by completion of a TLBI"

Sorry, I messed that up when copy-editing. That should have been:

	bool "Various: Completion of affected memory accesses might not be guaranteed by completion of a TLBI"

As above, that doesn't need a respin.

Mark.
