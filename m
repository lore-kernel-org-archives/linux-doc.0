Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA0C31D38B;
	Wed, 24 Dec 2025 15:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766591683; cv=none; b=c0QogI4tyiucrbdSLsGwcRRZuXhPjMm4uac1QD+HFGkw5I/PwJfljIdMaV8De7FaRUXzmjc/7SsNPuFBI4ku7HBwJE9AKYgeQXBEZj0vW6YesWlScrh0GGwthlmDxv04YgiHSffHHB8j3KZ7Z5uMk8TmVzUg/gjzDk6nKq8r60o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766591683; c=relaxed/simple;
	bh=gBgZUdgdaIOopU8i+Mbp/KWtjXuza0duQmAUavj0oUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8LXC//+IJ8mgJIgaRlU6+TG9oGr5k2cmfRL/yVNH09UMs6wF1UDVAzUuZ6tP1FJYeRltZyc3EpeBJmuntrAFh0bvdv/RbXKG6bnEyCoLnLJ4Hb4Ak84xKDEJQts4VqhdjndbmNOht8BfUvoCwlyo4kUEb9jPldtgk5F86Jn0JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PW0H7t/M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PW0H7t/M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD0EC116D0;
	Wed, 24 Dec 2025 15:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766591683;
	bh=gBgZUdgdaIOopU8i+Mbp/KWtjXuza0duQmAUavj0oUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PW0H7t/M7DdJTQMer8paEQT9Htxa0aWSnBgQcv7MiEF+eXbwF1rY94nI1UYrdMzHw
	 vaZtUX9Y7e5EllK3uIsziDjWO92kbF3tLPVZQhUXXJ+lTGcUj1w5dEwL2s/GajD5sd
	 MMS4NCaHMURQW0EzPYED6wNXu4E0WkJVEx+KzzZQ=
Date: Wed, 24 Dec 2025 16:54:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
	aou@eecs.berkeley.edu, bagasdotme@gmail.com,
	catalin.marinas@arm.com, conor+dt@kernel.org, corbet@lwn.net,
	dan.j.williams@intel.com, davidmcerdeira@osyx.tech,
	devicetree@vger.kernel.org, dev@kael-k.io, haren@linux.ibm.com,
	heiko@sntech.de, jose@osyx.tech, kever.yang@rock-chips.com,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux@armlinux.org.uk, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, maddy@linux.ibm.com,
	mani@kernel.org, nathan@kernel.org, neil.armstrong@linaro.org,
	palmer@dabbelt.com, pjw@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
	will@kernel.org
Subject: Re: [PATCH 2/5] virt: add Bao IPC shared memory driver
Message-ID: <2025122401-drainer-pedigree-45ae@gregkh>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20251224135217.25350-3-joaopeixoto@osyx.tech>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224135217.25350-3-joaopeixoto@osyx.tech>

On Wed, Dec 24, 2025 at 01:52:14PM +0000, joaopeixoto@osyx.tech wrote:
> +struct class *cl;

Why not just use the misc device api instead?  No need for a full class
for just one char device, right?  Or even if you have multiple ones,
again, no need for a whole class.  That should make the code much
simpler overall.

thanks,

greg k-h
