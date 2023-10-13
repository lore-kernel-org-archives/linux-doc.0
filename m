Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533DD5692
	for <linux-doc@vger.kernel.org>; Fri, 13 Oct 2023 06:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h74FvzZA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A115AC433C8;
	Fri, 13 Oct 2023 06:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697180047;
	bh=nr8fpppCCpes0TPI97zPmzyYSXvU36WGGZWf3aHc5C8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=h74FvzZAiV0rKj0VS6ofjX1kaIgCrHLEPDscvnkCRQLy/8S5T+JD5Utb1lGnCiEg5
	 NEM+fPkuszfkUv4PGVOgA3c2tSqM85DcKMJJPF7Z9OF/mAGr1hoE7sjkh40rf9qSfJ
	 AawIutr4yDaieO26Wn/jByJwjTKSct+DSWIoaO/SwxhbeQfCaxwvJtpnZbVDIT91Bb
	 49tf2HuEYc0umHl87k4aqyYa3V4iWrrZaEtD/KDBMbJkQswxR7PZn2oyTrcXRsvjp4
	 kNzAhG6CYcgB/+AvJEuUTKJ4y8Ol7wiuL2axQkOdWTrCrt58qJ8oMII+rKYbHNvxmK
	 lU990PNR8E67A==
Date: Fri, 13 Oct 2023 08:54:03 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Willy Tarreau <w@1wt.eu>
cc: Solar Designer <solar@openwall.com>, 
    Vegard Nossum <vegard.nossum@oracle.com>, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org, security@kernel.org, corbet@lwn.net, 
    workflows@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Kees Cook <keescook@chromium.org>
Subject: Re: [RFC PATCH] Documentation: security-bugs.rst: linux-distros
 relaxed their rules
In-Reply-To: <20231013034712.GC15920@1wt.eu>
Message-ID: <nycvar.YFH.7.76.2310130853320.3534@cbobk.fhfr.pm>
References: <20231007140454.25419-1-w@1wt.eu> <5ae47535-b6e0-8b48-4d59-a167e37c7fcc@oracle.com> <20231007163936.GA26837@1wt.eu> <20231012215122.GA8245@openwall.com> <20231013034712.GC15920@1wt.eu>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Oct 2023, Willy Tarreau wrote:

> Jiri, does your Acked-by still stand with these adjustment ? If so, I'll
> resend the updated version today or this week-end, as time permits.

As it doesn't change the spirit but pretty much just improves the wording, 
my Ack still holds.

Thanks again,

-- 
Jiri Kosina
SUSE Labs

