Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A43335BCE;
	Mon,  1 Dec 2025 17:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764609348; cv=none; b=PhTkoNp1BipAPKnkD+6K17Ir5a+tob2cPBf92UJmWRumv0arEIeZf5AB9UkFO9uQCvOtvM2jOCJgmPKHxMmYY1KqiR6q79taU07/bgCz/TAuNZh6lwl1e9h8uDZgejOVXIqRqn1TsiWL5MeuQ1R1Qu/K12biDDG4aRGnDyQJe/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764609348; c=relaxed/simple;
	bh=rLYgVvDYFCv5VWOVcHSQEoBVSIb5lhQYtBsyrxpkaZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZi+JOKrQ3/yUV0DHQCfx5MkQJ/x5Zxhu/iRDV/coHUCirYiMRUBemHWAwevl7l4VQh4ndd82gtlOWXXVPGYUEdabmSzGNcvAaY1clAm+ERjcxghczPWQNWj9jlzQVrn58BWX006BrV+qdPWtWzoI6QDKMd9OPq4uqHuFXP+G+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qjh3kCfb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qjh3kCfb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 515B5C4CEF1;
	Mon,  1 Dec 2025 17:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764609348;
	bh=rLYgVvDYFCv5VWOVcHSQEoBVSIb5lhQYtBsyrxpkaZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qjh3kCfbMsy5thtbwF1F7EEFTReORtPNH4EFLdLRqvp4BKxTs39lX3zfEEX4gB1U6
	 ZQq6Gj6TcpTxer1AZwz9EL1Aw9a8QiBS3xR8cVzE7h7azSYNUcWteNOqTbBIYzG2wL
	 UOvgY/cF6fDpPCFHz54dwbcSJh1XlSrUB6iW+gl1QijWKHFSYXNOMBIjzb70xep8kR
	 9NZAW6CblwhHwO/D3x95l7R5EMyguNrnmdnnNa7rJWj2yn0suoher3659HfACWveG7
	 2EY1j70iXHDFOPFuJOV9x8ZkIv/AJL9Nr90P3XJGKFK2NahOXmEyqOef/HeWKKP2ef
	 LwGp3tt9r97mg==
Date: Mon, 1 Dec 2025 17:15:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Aaron Thompson <dev@aaront.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Aishwarya.TCV@arm.com
Subject: Re: [PATCH 2/2] debugfs: Remove broken no-mount mode
Message-ID: <8c2a2753-145e-4de5-84fe-9a900af6a2ee@sirena.org.uk>
References: <20251120102222.18371-1-dev@null.aaront.org>
 <20251120102222.18371-3-dev@null.aaront.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hGDuclrXYMe7b9hX"
Content-Disposition: inline
In-Reply-To: <20251120102222.18371-3-dev@null.aaront.org>
X-Cookie: $3,000,000.


--hGDuclrXYMe7b9hX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 20, 2025 at 10:26:33AM +0000, Aaron Thompson wrote:

> debugfs access modes were added in Linux 5.10 (Dec 2020) [1], but the
> no-mount mode has behaved effectively the same as the off mode since
> Linux 5.12 (Apr 2021) [2]. The only difference is the specific error
> code returned by the debugfs_create_* functions, which is -ENOENT in
> no-mount mode and -EPERM in off mode.

I'm seeing regressions in -next in a lot of testing stuff which bisect
to this patch.  I've got a test that looks at the deferred probe list to
see if it's empty, and the mm split_huge_page_test which uses a debugfs
file called split_huge_pages.  Neither of these mount debugfs for
themselves, they just assume it'll be there - it looks like that's not
happening any more but I didn't investigate properly.

I don't immediately see what's getting confused, DEBUG_FS_ALLOW_ALL is
the default and not overridden by anything in any defconfig so
debugfs_enabled still ought to be being set, but I didn't actually try
to debug this yet.

Sample bisect:

git bisect start
# status: waiting for both good and bad commits
# bad: [95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a] Add linux-next specific files for 20251201
git bisect bad 95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
# status: waiting for good commit(s), bad commit known
# good: [4ffc97b7687d1b355f08f464e212fb1085ec5c34] Merge branch 'tip/urgent' of https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
git bisect good 4ffc97b7687d1b355f08f464e212fb1085ec5c34
# good: [87d5c4addc7e535618586e7205191a7f402288ba] Merge branch 'master' of https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
git bisect good 87d5c4addc7e535618586e7205191a7f402288ba
# good: [a4ad48eac682ccdc21e2f16b8f27abbf615d8d3d] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git
git bisect good a4ad48eac682ccdc21e2f16b8f27abbf615d8d3d
# bad: [b99f4ac0a6c7ccf37be14f5ef61b160b1c8a74b0] Merge branch 'driver-core-next' of https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
git bisect bad b99f4ac0a6c7ccf37be14f5ef61b160b1c8a74b0
# good: [24cefd05bbf969c95fff3733da174e8a352c1cb2] Merge branch 'master' of https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
git bisect good 24cefd05bbf969c95fff3733da174e8a352c1cb2
# good: [a5d0f36158717334aa85753fab8dedfa0dfeeaca] Merge branch 'riscv_kvm_next' of https://github.com/kvm-riscv/linux.git
git bisect good a5d0f36158717334aa85753fab8dedfa0dfeeaca
# good: [f16919001053bba074af696571831d4d3e7f86bc] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git
git bisect good f16919001053bba074af696571831d4d3e7f86bc
# good: [4f7961a0cc56637fb5df8d118e72ab12160e6c11] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
git bisect good 4f7961a0cc56637fb5df8d118e72ab12160e6c11
# good: [0a75f3d90e7ab9cd182327fca4b4e3bce379afe5] devres: Move devm_alloc_percpu() and related to devres.h
git bisect good 0a75f3d90e7ab9cd182327fca4b4e3bce379afe5
# good: [2a522e38f813c7fab9e49ebdfbfaba4c05b06579] Merge branch 'for-leds-next' of https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git
git bisect good 2a522e38f813c7fab9e49ebdfbfaba4c05b06579
# good: [f10c23fa159c5481dfe0025e619dc5ef844f6ce1] tick/nohz: avoid showing '(null)' if nohz_full= not set
git bisect good f10c23fa159c5481dfe0025e619dc5ef844f6ce1
# good: [f940e425c6fbcf5282e8daddb9351239e2343598] Merge branch 'for-next' of https://github.com/cminyard/linux-ipmi.git
git bisect good f940e425c6fbcf5282e8daddb9351239e2343598
# good: [ac1ab906d7a98e34be95ef63b81ff828cc432346] driver core: WQ_PERCPU added to alloc_workqueue users
git bisect good ac1ab906d7a98e34be95ef63b81ff828cc432346
# good: [3ae94a55d047d133fad1e6c811befe4347b75791] debugfs: Remove redundant access mode checks
git bisect good 3ae94a55d047d133fad1e6c811befe4347b75791
# bad: [f278809475f6835b56de78b28dc2cc0c7e2c20a4] debugfs: Remove broken no-mount mode
git bisect bad f278809475f6835b56de78b28dc2cc0c7e2c20a4
# first bad commit: [f278809475f6835b56de78b28dc2cc0c7e2c20a4] debugfs: Remove broken no-mount mode

--hGDuclrXYMe7b9hX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmktzT4ACgkQJNaLcl1U
h9BJlQf/bESMGw5aDSrEOLZTPy+h/j37kLiHGSmJ1SxIN2dmZXYfjgz8LWGfJc6Y
HGMAM7toxJO7TvYdpVPzPPaOtlkvIiF1mqAyOXBP0RN98dU3psB0QWIy1pfNyKlT
F7nTyM3CrQh6QjiLeP7o0PsO7Z9cmezw9G7q6jjKcouwLI+5oSzhMWX1JrS2JNE9
AEZmV6DCQkMQX2ugHHgRJn9BgxKdGkldRcGd74b80MydRkv9lXfkKCvfhFfJevlm
XbZIxob7w6Fjx3UMdLiHo64i1HyRhw+XxPRRUiyXDztzkbl2Tp06hr0jlv78+o9s
X4Iz8qoxwlw7WTGE+3uqMjXQnZx+AQ==
=EoHB
-----END PGP SIGNATURE-----

--hGDuclrXYMe7b9hX--
