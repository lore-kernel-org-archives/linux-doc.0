Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795124332;
	b=HrNm3e+IXtnwYoJXj6BueervaUtkx6wkuVkqJXUW6Nm0Bifs882iFbRp6O/Dl5kJePIX
	 JdHC4SSUO9t65w0NfKJ35YfFLODz43wT4F8uTlPJZtE2tr1epTkAchIe0nJvOb0A/hXN2
	 v4Y0nbzd9wOJ9r0dirnC12cGPv2kfwT5tdE4wtKLOgF3EDOT/VSD4fQI5RnElXhtztGap
	 7uTpRmjwJNwTeyS5qMjjg/QeqOIl2SEK8FpvJFLDduAY4OJqYsbe90xGaKvvm5RFFcsAl
	 hzSCj1U9CbNG02qhlmMrhOD3shfAfXN26+c2OdEA+Wfr+nkJil3Ut/e5/4x1Gpn6qLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795124332;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cAl6G7PN2cvyWtMhOuMNPb47Pa9JkEc0ZDSwTNQz0D4=;
	b=wO7cLtqbcRBXXeyw7EU8bFqwVsI/7tMV15RJAaGeHT941jS0D+RK+B8bG/KQh7bC8wh0
	 n9j+fDu+oN3G9XRN3pDD4GWgfs2buQUEYiScSdCAuo8zyNWkpR4fxCg1Jlkt9FoCbTbka
	 ha2gnawPIOo/ZqOH3B7d03IWvbGdZAMekgCNkypJGOngDbLUAwytFHCOrBV3Bt9zc9Ha4
	 /WxO3O5EnrWLPIrCr2qJvvBNHqNeq7MtfQfDf1Xs9a8+HRxgFf581MjIHRESUTb8fIsgq
	 9F4esEEct/W1y0t/IEJCk6slkJa3yErN4Xj1bGkDvSbb+aq3Xu/rADxiTbd5KewWMTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XR4Cn9vh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08A0606A326;
	Thu, 19 Nov 2026 21:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XR4Cn9vh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7F781F000C0;
	Thu, 19 Nov 2026 21:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795124332;
	bh=cAl6G7PN2cvyWtMhOuMNPb47Pa9JkEc0ZDSwTNQz0D4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=XR4Cn9vhmFnwx73O5gdc7uck9RG3VNO/323LpVdTxJ2fi4Kgr09iN4VB1eVn/xex6
	 YkN0pZ3Xab30C3CLkFsrwh992szEpBhb6v5PGJVJeX60OW0hDciwSBA49XY2jkmVin
	 huieF160JNXq9XgCj+sNlfrw4zgvd4fNmJrwZmsMQaxa2ajpXMY3Nsr1Hny77D7PMp
	 YLejP6K+qow1eoC35fjus1ZaNSvX8bv76JK/TBegd/NzSNJVhUGgbRYdEzBHoc2MZn
	 WiOo6D7Mrm5Mpth4e7Iuze3rzESXNZRX3mre4k9dvWQQK6CtybwiOPtE89L8695hOu
	 Y2h6FQJFa/lAA==
Date: Thu, 19 Nov 2026 13:38:51 -0800
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
Message-ID: <20261119133851.3f25074c@kernel.org>
In-Reply-To: <dd1d61d7-7bef-4a02-8518-e17d2f50369f@redhat.com>
References: <20261111164021.273409-1-ivecera@redhat.com>
	<20261116181612.107a4b57@kernel.org>
	<fe1dcdd5-ef75-4231-bf9f-03bf8536c2aa@redhat.com>
	<20261118174424.32e9f130@kernel.org>
	<dd1d61d7-7bef-4a02-8518-e17d2f50369f@redhat.com>
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

On Thu, 19 Nov 2026 13:29:11 +0100 Ivan Vecera wrote:
> > Right, for these level of waiting async seems like the right direction,
> > at least naively/without knowing the HW.  Why does the device wait until
> > PPS to apply the step change? Is the programmed time supposed to
> > correspond to the pulse?  
> 
> Yes. The device has no immediate ToD write, it can only write the ToD
> on the next internal 1 Hz edge, the next input sync edge or the next
> internal 0.5 Hz edge. The written value is the time at that edge, so
> the seconds stay aligned with the 1 PPS outputs.
> 
> Looking at it again, the zl3073x holds the channel lock while it waits
> for the edge, although the dpll callbacks do not touch the ToD, TIE or
> phase step registers, and they already run while the device applies
> such an operation, because the PTP ops return right after issuing it.
> I will look at narrowing the lock in the driver.
> 
> For the resync, async is not only about reporting the result. Fast lock
> is a setting of the DPLL, not of a reference, and forcing it makes the
> DPLL ignore its frequency and phase error monitors. While an
> asynchronous resync is pending, everything else done to the DPLL runs
> in forced fast lock. A reference switch, whether from a priority or
> state change, a manual reference or the device itself in automatic
> mode, would follow the fast lock phase rate instead of the configured
> phase slope limit, and the resync would then report success on another
> reference. A switch to NCO would keep the force bit set until the work
> clears it. So every request changing the DPLL configuration would have
> to fail with -EBUSY, cancel the resync, or wait for it. With a lock per
> chip they simply wait, for at most 1 s.
> 
> > Do the failures only happen because of "unforeseen circumstances" / EIO,
> > or there may be more common errors reported? If it's just the former
> > a devlink health reporter could be an option.  
> 
> For the output start and stop, only EIO. The device does not report a
> stopped output and the driver can only wait for one period, so a health
> reporter would work there.
> 
> 
> For the resync, no. The wait ends with -ETIMEDOUT when the DPLL does
> not enter fast lock, for example because the selected reference lost
> its qualification in the meantime. That is a result of the input
> signal the user needs in the reply, not a device fault.
> 
> Beyond the zl3073x, with the global lock any callback that waits for
> its device, for example an mlx5 firmware command with its 60 s timeout,
> stalls the DPLL devices of every other driver in the system.

Well, I'm not convinced. The relations between objects in DPLL are
already quite hard to follow, and objects from one driver routinely
"plug" into objects from another. The explanation of the locking
rules in patch 9 does not look clean or clear. The driver facing
API needs to be much more "dummy-proof".
