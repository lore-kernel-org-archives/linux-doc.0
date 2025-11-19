Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CF6357A4B;
	Wed, 19 Nov 2025 12:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763555407; cv=none; b=Xib5TzQ7kBBKURj0KuEaP6RG7wqgEHiDNHlwKDg+CC6UrSRP3OSpPNXHqQu5vPEx9K63knlTdH06nLV8vPnaWmHBzx8jNq1l719Y6r6YvdOTMJRGED6XH3L4qyEfMes/nqxAC3OVj17+Wl5DZyjifxBEKnGcZsNtaFIPCsHBty4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763555407; c=relaxed/simple;
	bh=ffy1X76GLIMJE0TXgbuJyaj9fyeFK0DwPB+Dyx9qSaE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=dAPKXTjV95zAamgsZ5Vc/oYJdY8L+YuhDLrm1TxWEihO7L4plAPq20uDzhyN5xFwPby4qdXTS+abLkFtNiHhWzCTWfeV6m3SM3daPVlfvRWUDaW99tXfFQM10nyCjFGSfFumoszW+Kvf8iPOmD2Vii+zHeX8/fT5h7Md6PeKi14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=clywpDSV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="clywpDSV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38A0C4AF18;
	Wed, 19 Nov 2025 12:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763555405;
	bh=ffy1X76GLIMJE0TXgbuJyaj9fyeFK0DwPB+Dyx9qSaE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=clywpDSVn/cjZNNrIB6YS5IjPPtnql+RttSvk+KBfA68DdmQbh2jzGBu0FJe8Oxxn
	 NLONdTNzqOzFa1nV9DCf0fA/RYBQTOccEa7nLJC0Sc0jyf4E5x2Rkl+j+Lqe5CfztV
	 bBilw9Aj7jfAwiccENUaV/QnEBmVdTXdnw4N1TShY5rQadTk25UnALc1R+jIUlEplH
	 JNN5u2U9JyIIJQGQLBBXdt2Qj4ebGa+kkDpsaIA7R06myr8XtMAtPHrjQylX/he4y1
	 sM+nT+oYH6K8NFZT4pQIXZu03ADnvrFxhiTwcubigjLaarFVmnCBFoytvrP/qHz+mp
	 vPHbEtkOcTLZQ==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Nov 2025 01:29:59 +1300
Message-Id: <DECO7PZ38DCO.48OA35WLU5QO@kernel.org>
Subject: Re: [PATCH v2 0/2] devres: clean up and move percpu allocator
Cc: "Philipp Stanner" <phasta@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Rafael
 J. Wysocki" <rafael@kernel.org>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251111145046.997309-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20251111145046.997309-1-andriy.shevchenko@linux.intel.com>

On Wed Nov 12, 2025 at 3:49 AM NZDT, Andy Shevchenko wrote:

Applied to driver-core-testing, thanks!

> Andy Shevchenko (2):
>   devres: Remove unused devm_free_percpu()
>   devres: Move devm_alloc_percpu() and related to devres.h

    [ Fix minor typo in commit message. - Danilo ]
