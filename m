Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246C518C2C;
	Sat,  2 May 2026 02:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777687548; cv=none; b=OJJiHE6CTmq5kRsHXzFvGO+kJ0k9EX15UUaZfvtifxZ3ZkNjKdermO9qmrdyV43JkM1A4PARoHk2vAu74/FYV2hhZq8NCS0AtR3nFMcJBXENJBREF0YGFH2dfPnmAmSVbXu9cX7AtglDEJi1RdH5t1+6A4HOGuzEbQGdcwa839M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777687548; c=relaxed/simple;
	bh=pk+5xmPgFUWzKuOFMUVCMIMKS1QfyRWp141mh5wMQOI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FXBPuMf4Fm2VZ12bI+SZmF92GeEZOJZCUKD3YUw1X4PmO9j2wHIPgPsKI/Y5eQq3OhUGnwF78gzRf+f+Gj0AadODqHJKLdqm3mF8ls5HD6S/0YpJHkVIoiKNyyTbocvQVPkVBLZAaJpcbIyelzr2SSHODOHoDvGzbrjp9U+NyhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c0CQfoKu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c0CQfoKu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB9FC2BCB4;
	Sat,  2 May 2026 02:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777687547;
	bh=pk+5xmPgFUWzKuOFMUVCMIMKS1QfyRWp141mh5wMQOI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=c0CQfoKumBsKp6hsVkW24AmTK1jsBePdWZNG9NsU56KWw9pmQNPnGMrOYmZ+Tlykq
	 dbgKOo8bAfKc0MeBw/34TE6P7R36TshlSXWr/JVZDbb0G4EJVa+OyHVyE3M+ZHzDaa
	 vw1M5vZ5lHZ6n1tMDKJ2426aYCIJdKBUhFvvetj7pwPtiu9iDhMGDeBTfoIGeoMct6
	 kvn3PDEZden2WfnS+nW2XBjSRiGi7U/wH/SShWZyQRiV71RkIDQMrgk1kYFQKfD3jP
	 d8U2OzTC3qTqLecRytn5k7TJkav/+jM71jLeSTyRx7j3WNCvZAKNpeMPi+optwOmbj
	 MvSwpjk3b/jCw==
Date: Fri, 1 May 2026 19:05:46 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Costa Shulyupin <costa.shul@redhat.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, Randy Dunlap
 <rdunlap@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, Dapeng
 Mi <dapeng1.mi@linux.intel.com>, Kees Cook <kees@kernel.org>, Marco Elver
 <elver@google.com>, Li RongQing <lirongqing@baidu.com>, Eric Biggers
 <ebiggers@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] docs: Remove icn= ISDN parameter
Message-ID: <20260501190546.27a6f8fb@kernel.org>
In-Reply-To: <20260501182634.1110715-1-costa.shul@redhat.com>
References: <20260501182634.1110715-1-costa.shul@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  1 May 2026 21:26:30 +0300 Costa Shulyupin wrote:
> The ICN ISDN driver was removed in commit 02bbd9802da7
> ("staging: i4l: delete the whole thing"), but the icn= kernel
> parameter documentation was left behind.
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>

Acked-by: Jakub Kicinski <kuba@kernel.org>

Jon, since linux-doc got CCed I suppose it's most expedient for you to
take this? LMK if you prefer us to handle it via netdev.
