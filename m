Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DD76FB1
	for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 16:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJ0JlZ2L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF7BAC433C7;
	Thu, 12 Oct 2023 16:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697126808;
	bh=00lPvPtzMCUPSLjIIa16o5rJLJHCDfj3pECK1utPSs0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QJ0JlZ2L1r1KkhNHIRGx+Mo/3HN9OiCTVrlBNED3Gx+unODo3pKyMnlZmDZpp37OE
	 fAifTI3MYzPpRSX4h9Q1Ql0Gzq5qX48qg+dRN5Jk3FO0Q4K9bEPXt2mpYAhmDHzuPz
	 MlnYTjCPm8/CSKKIcK0Op/xcKmyX0+iMeGkdfEHDfzeSnIcLSRk3CLUWMXrNfchvaB
	 bFlO+kNEa9EymKS6qJwMFdXyWRXK5ozx+6IhsHUnGWyEFcqski4xcy5fPDbwRrPX46
	 ELsTwILTAq3/VmKPALalRabbNWfdFHh8S/K6cEK/lACi53Nt6gY4Ob9ZCyrmGLa8iz
	 UvNbGznzHtXMw==
Date: Thu, 12 Oct 2023 18:06:43 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Willy Tarreau <w@1wt.eu>
cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
    security@kernel.org, corbet@lwn.net, workflows@vger.kernel.org, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Kees Cook <keescook@chromium.org>, Solar Designer <solar@openwall.com>, 
    Vegard Nossum <vegard.nossum@oracle.com>
Subject: Re: [RFC PATCH] Documentation: security-bugs.rst: linux-distros
 relaxed their rules
In-Reply-To: <20231007140454.25419-1-w@1wt.eu>
Message-ID: <nycvar.YFH.7.76.2310121805480.3534@cbobk.fhfr.pm>
References: <20231007140454.25419-1-w@1wt.eu>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 7 Oct 2023, Willy Tarreau wrote:

> The linux-distros list relaxed their rules to try to adapt better to
> how the Linux kernel works. Let's update the Coordination part to
> explain why and when to contact them or not to and how to avoid trouble
> in the future.
> 
> Link: https://www.openwall.com/lists/oss-security/2023/09/08/4
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Solar Designer <solar@openwall.com>
> Cc: Vegard Nossum <vegard.nossum@oracle.com>
> Signed-off-by: Willy Tarreau <w@1wt.eu>

With my distro hat on:

	Acked-by: Jiri Kosina <jkosina@suse.cz>

Thanks a lot,

-- 
Jiri Kosina
SUSE Labs

