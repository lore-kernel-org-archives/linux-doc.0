Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235FB27467F;
	Fri, 19 Jun 2026 14:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781881099; cv=none; b=ZE/HFegX6H6ZjYG4hSIG80weCnLAmf6GpYc+KrJ+Yf6sWBUliHT3cmPUzzjOPfOGeg+oank3IP9Vs+Wb32WoeawxwoViEp/ZVIGVH5MUjWoK/QK/9+FASSGqRD8XudfYfBIcPXwwykQeGs4FnJo8eot/CRrB9/6aGA4+GTypkLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781881099; c=relaxed/simple;
	bh=8KhHgkWRc7VHnO5FYlI3mGpUO0iOQJL11MaGtcd7TBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bIa8tRNFxgInko/mm+V0aAN08yVLFvZvj0PPYa1mSWNzbvlfOnTcEY63OLJbHYO5iD+RLzUgJno8laryQWiOAmI3MSsFhDihvEsRedcZAIhWlzBN1yw1WVrq4/gt5XkR2DGKfGv9ov4j+CcZF9XfiTswDvvoUxdRQrDSvc0VX9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6hxcns3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6hxcns3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FBB1F000E9;
	Fri, 19 Jun 2026 14:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781881097;
	bh=Kt5gfqyzeUam3ANkFxyr/b9wMEBxAdenPJCFwqOG2UA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N6hxcns3KSAGulJMrmCCntDq2gj4FT2xe7UH9uLmY6BkSN8SoKoj9SyVckpTRxnvz
	 BMvkD2FbUfuVF7YcliezwvJ6El2FzL4Kf9U3KukOt05SlgG5DCD7gdDQkaOxZSglXD
	 L82+jnQye4xgafaNhd9g/80iNXN4FWj9w7KLkYsUOKCYFre+239EGLNVUhufyAku3F
	 ivwSToXeWK1wCnFEsuJkfHivjEZpNH3UnvyzcrZV84IgXVjDLpQXAWb3KwF/H1LlOU
	 IfQ0kVWgxkDq6qEn3RNKRkXAMdkOBd5l9V9BkK96a0VhyLQw6aOxBYR1ISyXpRRwNy
	 l7Q9On3NB+UPw==
Date: Fri, 19 Jun 2026 15:58:12 +0100
From: Will Deacon <will@kernel.org>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>
Subject: Re: [PATCH v3] arm64: errata: Workaround NVIDIA Olympus device
 store/load ordering erratum
Message-ID: <ajVZBJgKn-5sxHD6@willie-the-truck>
References: <20260610164822.4157248-1-sdonthineni@nvidia.com>
 <aiq5VigmtZq9GlAm@willie-the-truck>
 <IA1PR12MB6089049028A73A2078FC6831C71B2@IA1PR12MB6089.namprd12.prod.outlook.com>
 <851c4107-3f6d-46f3-b659-212ce4f69e6e@nvidia.com>
 <20260612124825.GF1962447@nvidia.com>
 <25495831-f32d-4332-a7c2-fb1463b96174@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25495831-f32d-4332-a7c2-fb1463b96174@nvidia.com>

On Tue, Jun 16, 2026 at 08:22:39AM -0500, Shanker Donthineni wrote:
> On 6/12/2026 7:48 AM, Jason Gunthorpe wrote:
> > On Thu, Jun 11, 2026 at 08:13:48PM -0500, Shanker Donthineni wrote:
> > 
> > > For the scalar MMIO helpers, the workaround promotes the raw writes to
> > > store-release on affected CPUs as v1/v2 shown below. For the memcpy-toIO
> > > helpers, could you please clarify the specific reason for adding a dmb despite
> > > the documented no-ordering contract? Is the concern that some drivers may
> > > be relying on ordering across memcpy_toio_*() today even though the API
> > > does not guarantee it, and that we should cover those cases defensively?
> > I think given how arm implements them today the iocopy's are actually
> > the _relaxed variations.. I wonder if this matters to any user?
> 
> Following Jason's observation that on arm64 the memcpy_toio()
> /__iowrite{32,64}_copy() helpers are effectively the relaxed
> (write-combining) variants, I'd like to settle one open point before posting
> v4: should the workaround also promote dgh() > dmb on affected CPUs (now
> Olympus core), or leave dgh() as a plain hint?
> 
>        If you'd still prefer the dmb defensively, to cover drivers that may
> rely on ordering across memcpy_toio() today despite the relaxed contract,
> I'm happy to fold it into v4.

The point is, you're going to have different behaviour to every other
arm64 system out there. You may be able to find vague comments in the
code that imply that you don't need to provide ordering, but at the end
of the day it's a pretty cavalier attitude imo and if a driver ever shows
up that relies on it then you're in trouble.

> Please let me know how you'd like me to proceed.

It's up to you. It's your broken CPU, not mine. You also haven't actually
provided any performance data for others to assess the trade-off.

If it was up to _me_, I'd upgrade dgh() on these CPUs to that I don't
need to worry about this again.

Will
