Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF43F290DBB;
	Mon,  1 Dec 2025 14:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764598768; cv=none; b=Uz8UabMKx+phMjESooqJrM1OUGqXgXI2V2vYVvo9k4B56E5D1GYqhFCyrFCjiXt7rTZ3hI1T8cY9QW7wtSSe1tUbICwXkK7ndEvfQPaxdNXYZTGTg63UKGPKOXHfHUvkdYzP8N3qJ4LkhZYSolyxPzXp/XMdlE0vOsl8W6g4pVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764598768; c=relaxed/simple;
	bh=z6P4HSnPKssDlFtYKX3qToha+6nvPmfuV7sb2feAzmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cIPUf+I62KQnY8JEkTBuHyFv4jMUbw6gPHj28QnewIadCiEpJin0ZRdtw1brE5nlMcMmwnutHf/3BlzZIRXlS0NCBeKjFSlQXWprjZu6xxIixA+qaIee5rdACEIPk029u69XzYiMDleFPETxrzQ2ScHwbBoc8Tw5FrNgAaJ0+fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXBnFWIr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXBnFWIr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61B3C4CEF1;
	Mon,  1 Dec 2025 14:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764598768;
	bh=z6P4HSnPKssDlFtYKX3qToha+6nvPmfuV7sb2feAzmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eXBnFWIrIboWEUSSrdcdx1GxmcKJGifgtSlJrERlr9ZKzEmI40WhNGQKnFCDGNhM/
	 nTgb0BifUCJ/KxBl4EMKcFa31NQP/Cr1F+u/vvDAm0haxKZS5U//lgZXVVusfjZ8ho
	 gexfcZW8itUqPu0yFXMzFhTN1t+11BNHz0HphSLBaBO5fMzmzMKeNAWJonyxXS21iU
	 mH1osHKks+JnBkTgiNFtULjtXM1vSEM3wbjd61aFCDiDLCjk3utyB2pGM1O0KjpzUb
	 RhVkKIbnRFWmZgsHUQjvUuQeLrFf/Zi9ETRGWAkDXsLwcWGgqAmmHnq0I2mndJLBKu
	 dBJVpfO8FDDoA==
Date: Mon, 1 Dec 2025 07:19:25 -0700
From: Tycho Andersen <tycho@kernel.org>
To: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Cc: kees@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, Andrei Vagin <avagin@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	=?iso-8859-1?Q?St=E9phane?= Graber <stgraber@stgraber.org>
Subject: Re: [PATCH v1 1/6] seccomp: remove unused argument from
 seccomp_do_user_notification
Message-ID: <aS2j7aaHH9quDDDL@tycho.pizza>
References: <20251201122406.105045-1-aleksandr.mikhalitsyn@canonical.com>
 <20251201122406.105045-2-aleksandr.mikhalitsyn@canonical.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201122406.105045-2-aleksandr.mikhalitsyn@canonical.com>

On Mon, Dec 01, 2025 at 01:23:58PM +0100, Alexander Mikhalitsyn wrote:
> Remove unused this_syscall argument from seccomp_do_user_notification()
> and add kdoc for it.

heh, looks like this was unused since the original commit, whoops.

Reviewed-by: Tycho Andersen (AMD) <tycho@kernel.org>
