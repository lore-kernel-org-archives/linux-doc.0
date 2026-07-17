Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C99389455;
	Fri, 17 Jul 2026 11:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784288005; cv=none; b=YEcY8H1jX9adAFUA2G4AJQlSTBzxoLgQXt55lXSuzSHoaJ1yP5ONRzdme/51dSmKNQyIgZIn58KRyoykTIVVpYJrZSsWiOPT1ryuFrNRZUaUPwCDKe/9XzYJ+fUqqdwQMUsT8HjWF2zJct29jKe2qlnPzsAs4wo4SoEgoYXVHQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784288005; c=relaxed/simple;
	bh=6BETA+wKcoLv8Jpz6mIx2oFg5zQncmW6ai6+tT1x6Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FG8s5podI9JRUFkSRFgFAVEEmV6wGXuj3Z/2Mk08vYYw9eUCfGo/tlR5QZESXmWaRSbTtvq7u8hN8jF2E5i/ORbSd4HEMa7bNdQCeiQJLCS/bRCqju4kmO1NcKgjpfoKp+3p0YxVaFIBkdHH4G8FTUwBtoIp2usSSdeO5G94sgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iq42tPbO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iq42tPbO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 546FB1F00A3A;
	Fri, 17 Jul 2026 11:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784288003;
	bh=eIjS9piUmE57cYRXDTfna1Rukyb5JMZSPthrMyRy+dI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iq42tPbOoZtO6nh+GKjVtUHfeIfHZK1bmON1BBNXij/itmb7LzRjjBIJY8GKdmjGP
	 1JUZugohNu6nNjBQ3aato7NA94Hnl1Fngrs2kPfUVZvhy5/RcJ/q+HaW0sxbVW5SWH
	 sb60zNG2UeU5cBwkdVxIJrxNQrz4rO88mC/vlk/zLOnm+uZ0JY+NoeqUn2ugpYXilx
	 vw5TXrxruuDeqeUtA8m/+nR4R2eIyXaEMGkeji5naXwDFnkHgRtqN0TrY05ZeiAg3l
	 P1wpDK2SXbmf9z22nXHLmBPsM6BXwmw/RJpng9h+X66d5J+c9Eil+Rs5SFgny6uA1C
	 1/oEcd/H4t+0g==
Date: Fri, 17 Jul 2026 12:33:17 +0100
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	maz@kernel.org, oupton@kernel.org, hch@infradead.org,
	jgg@nvidia.com
Subject: Re: [RFC PATCH v1 0/8] Arm Core Local Accelerator Driver
Message-ID: <aloS_T3LQvpHeZUV@willie-the-truck>
References: <20260717104759.123203-1-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717104759.123203-1-ryan.roberts@arm.com>

Hi Ryan,

I haven't bothered to look at the code (looks like Sashiko is having fun
with that), but I'm going to jump at this bit:

On Fri, Jul 17, 2026 at 11:47:44AM +0100, Ryan Roberts wrote:
> * User space availability: The kernel driver exposes the capabilities of the
>   hardware to user space. Arm plans to open source a user space driver, but does
>   not yet have any committed date. I'd like to understand if the availability of
>   this component will be a prerequisite for upstream acceptance of the kernel
>   driver; either way, I'm hoping we can at least progress with some discussion
>   in its absence.

From my perspective, I'm not particularly interested in having code in
the upstream kernel tree that we can't meaningfully exercise or benefit
from. I also think that the incentive for Arm to open source the
user-space driver practically disappears if we merge the kernel part
first. So, at the moment, this just looks like a burden to me, especially
as it appears to create a brand new, device-specific UAPI for what is
ostensibly a form of SVA - something which the community is actively
working on already.

Relatedly, is there a spec and/or fastmodel/qemu (sorry...) support for
this?

> I'm deliberately constraining the scope to bare-metal support for now.
> Virtualization is something we are considering (and have prototyped), but plan
> to post a separate RFC for that as follow-up, once we have agreement on
> direction for the bare-metal driver.

I'd actually like to see what the virtualisation part looks like first
because doing it as a bolt-on later feels like the wrong approach. The
structure you have at the moment is remarkably clean, given the
architectural/CPU interactions (this thing even apparently builds as a
module, nice!), but I'm unsure how far you can push the separation once
you need to start hacking at KVM. Maybe the MMU notifiers are enough,
but I can't tell.

Will
