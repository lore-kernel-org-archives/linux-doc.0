Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052666;
	b=X0rzQy9XLCfje2ujvg18tGb40f7La8kPYvNKckT1VTSfzfTCl1px9f3r7W3o0KmIrpnU
	 89kEKtJgterKKeHBlbCo5hqFJ0mvPmLI7vFRIDpztENmr2CcNJGL1eQ2RgLy2V5Lm/UdB
	 QzFTRRkyJc4CNZscpXp7MdnwUWkVRpRVtjZeIo1ISIpsx/fT6DflxkzN4j1iG8OUHodWu
	 7rpdUbzK0uIu09Lt+8Rgaq3EVaU2ke6sErODW1lttm1x6Q2W9vs+Y+6s0jWwIcAGttfAC
	 y++1B/XzjUyi7kgtj6efk1EMeTFFeBwHpoe8SZVPpQa+Sl8dcV4Ju12izrRs12P/b0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052666;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9waXTkMYmXwP4/W6e6Zut8DdWOx9w1dU7kQpzPoyvwU=;
	b=HpP/ztlOXM5CaPZQCD/cLqWd/+6is6dmlZvn9heSg5BRlyauyhXUG2wbJ1MdDdIeJGuW
	 fFM8b44q83OBV/D+L410pL123iY5BFZzQ+/nilTvf4g7oy0HBhjfqGLxtOjbrmfqV2zv/
	 EXAZqMo1A3FCKYMPi5ZqgLUALMO8Q0rS6LSJxUlvb9Ad6yzDK46/oEMX5Fl6TT/kR8+hF
	 zuaOLd/usleIw0oxZGofoWA2pynJBrCIM8NzWpCzB1M4Fnf24lEJnRRLhxDlsDXRd/C2a
	 Mdh9suMIp+2Zst5PFSiB7DQUhNltdjg9iRDu2OrEtXwVjtzkK0tH6G2ZjeJ4jLAuv2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g4+24Kgw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249F7606A31C;
	Thu, 19 Nov 2026 01:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g4+24Kgw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8C51F000C4;
	Thu, 19 Nov 2026 01:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795052665;
	bh=9waXTkMYmXwP4/W6e6Zut8DdWOx9w1dU7kQpzPoyvwU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=g4+24Kgwh/t7ZndPUj9S0xlpXcGv1IYYD22Krr8k+/31irosmzvTiBx1eEohjk3O3
	 MFJDjLIiWO+DEEfv7a8XHdJsDWvk9ihr2hLU67OZcQVvcMBrvGF2kyLtnb9AMWivPX
	 dIp6oKsNR8c4w4TdEzUYVpraMDEFj5xzlTEPJikb0W+nzvtlDK66uhxl7VmnrM3Oj8
	 vqh6CcEr6FGt4lYrT74jDza5iMl90iWjconT0umM/VmscSjTVcYhNWX/o4lVQsM5jk
	 WCZndvOtsHxjZ/NJnUrQHQbF4WLq6o7LBa28as8OWMDZp1+DfXXhOlUkU9AS8RO1Tf
	 WfKnQb0ObJK4Q==
Date: Wed, 18 Nov 2026 17:44:24 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Jiri Pirko
 <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Min Li
 <min.li@microchip.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek
 Kitszel <przemyslaw.kitszel@intel.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard
 Cochran <richardcochran@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org, Grzegorz
 Nitka <grzegorz.nitka@intel.com>, Karol Kolacinski
 <karol.kolacinski@intel.com>, Saeed Mahameed <saeedm@nvidia.com>, Tariq
 Toukan <tariqt@nvidia.com>, Petr Oros <poros@redhat.com>
Subject: Re: [PATCH net-next v2 0/9] dpll: do not serialize driver callbacks
 under global dpll_lock
Message-ID: <20261118174424.32e9f130@kernel.org>
In-Reply-To: <fe1dcdd5-ef75-4231-bf9f-03bf8536c2aa@redhat.com>
References: <20261111164021.273409-1-ivecera@redhat.com>
	<20261116181612.107a4b57@kernel.org>
	<fe1dcdd5-ef75-4231-bf9f-03bf8536c2aa@redhat.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Nov 2026 16:29:23 +0100 Ivan Vecera wrote:
> A step of the zl3073x PHC, which ptp4l and ts2phc do at start and after
> a large offset, waits for the next 1 PPS edge, up to 1 s, with the
> channel lock held. A phase step can hold it for up to 3 s while it
> waits for the previous one. A dpll callback of that channel waits for
> the lock under dpll_lock, and every other DPLL request and notification
> in the system waits behind it. With ToD writes running, requests to an
> ice DPLL took 1448 ms in median and 3.9 s at most. With the series they
> took 0.2 ms and 0.3 ms, the same as idle.
> 
> The bigger reason are zl3073x callbacks we are working on, which have
> to wait for the hardware themselves:
> 
> - a device reset with resync waits for the fast lock, up to 1 s with a
>    1 PPS input
> - a glitchless stop or start of an output completes on an output edge,
>    so it takes up to one period, 1 s for a 1 PPS output
> 
> Holding the global dpll_lock for that long would stall every DPLL
> device in the system. For the output state we tried an asynchronous
> implementation, but then the callback returns success before it knows
> the result. 

Right, for these level of waiting async seems like the right direction,
at least naively/without knowing the HW.  Why does the device wait until
PPS to apply the step change? Is the programmed time supposed to
correspond to the pulse?

> A failure can only be reported by a later notification, and
> the next request gets -EBUSY until the change completes. With a lock
> per chip the callback can simply wait, and one chip cannot do these
> operations in parallel anyway.

Do the failures only happen because of "unforeseen circumstances" / EIO,
or there may be more common errors reported? If it's just the former
a devlink health reporter could be an option.
