Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCCD1DE3A4;
	Wed, 28 Jan 2026 22:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769639569; cv=none; b=oDsXsafOfqliF5bVWxT89RTwq7EVEZBjCcoW0KQ2M6KSswuSABOmfLRe1QYQSZpQxXRllMN4BYUsBO1pZilc5W72RDXys+2GOQTQO8eYBOVDV5Kz4KsHyg/ngBSvHwN6QASbtTegTUzAlH2yucYnxDQUkJgi7LFF58bAHTAJWBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769639569; c=relaxed/simple;
	bh=FHS3cyehLOiur3RrIO8o2ryXLb9ryM3CBNlVWpv+GpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a8j+pyvBSfspSAFUyWAeG3R4BykVVlHdD2IrgRfiTJWhsRm8A754dRlwOfFiLFie20brSkModINcbddP7sYCgFKKSJBorXRiGUBm3Xd+hp95qMgt/G2fIr+FRhB0sL8Hc2p8+/ZWqO8qYtiomG9oQNlvAXBtmDsbjPlvvzUJQO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pkWPh4y/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pkWPh4y/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67871C4CEF1;
	Wed, 28 Jan 2026 22:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769639569;
	bh=FHS3cyehLOiur3RrIO8o2ryXLb9ryM3CBNlVWpv+GpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pkWPh4y/U//7a1AvA5UJBUs1F/L7KV2zJHcSQ/QrmtXlPO0nj2H0rmV+3KwIp4Hcg
	 gAp4lgHhJ91jB+I5W1JgYeqnTa/xjtz3nJLq1KcPZw/y06ihJfwaSBAnCap+pSxIDe
	 KxBrttj7QqOUYqtjDP5gjkAkB9Hvo6iCXGP8t8PaN3giisx560lqNzwmasLhRi2E10
	 EZmxzfPMn4lOU9uFp02y8WvaCv/S2qLyM8HwsuIV4Fw5R9dMpQ5AMol7ujHd5C3Xda
	 9gML2clagmpnCx38aj+n7gj5QIbjOw0pSDCYkrBBkVqxPTT2CwMkgS1P1NpjMeK3EW
	 uFg4ryeevxPGg==
Date: Wed, 28 Jan 2026 14:32:48 -0800
From: Kees Cook <kees@kernel.org>
To: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Cc: Aleksa Sarai <cyphar@cyphar.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, Tycho Andersen <tycho@tycho.pizza>,
	Andrei Vagin <avagin@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	=?iso-8859-1?Q?St=E9phane?= Graber <stgraber@stgraber.org>
Subject: Re: [PATCH v3 4/7] seccomp: mark first listener in the tree
Message-ID: <202601281432.8E0D84660C@keescook>
References: <20251211124614.161900-1-aleksandr.mikhalitsyn@canonical.com>
 <20251211124614.161900-5-aleksandr.mikhalitsyn@canonical.com>
 <2026-01-21-hectic-wriggly-dips-flags-EE541h@cyphar.com>
 <a54303d478e4492977f8760b0f2d22894bfe604a.camel@mihalicyn.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a54303d478e4492977f8760b0f2d22894bfe604a.camel@mihalicyn.com>

On Wed, Jan 28, 2026 at 08:05:25PM +0100, Alexander Mikhalitsyn wrote:
> Yeah, I'm thinking about preparing a separate patches to address
> a quirky seccomp behavior we discussed during LPC and then resend this
> series.

Yeah, I'd love to see it as a distinct change. :)

-- 
Kees Cook
