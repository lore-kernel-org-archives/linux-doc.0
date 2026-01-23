Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC3F315D23
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 11:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769167503; cv=none; b=D3qn+b+UqkDcEmsBmX2BHl9IN7tKDEY6O5Z+Fbw8otYr0gJG+ZbYq14Qv7e84kKxURdMQ3yT053wBDarT6jxxd8ossaYDoFSMLPz7O0ZFWd4wOJGVEo06Dmnr7a5B++zQcnDAyolTrinLq4CgW2Pjhpve0a9vrmX78izy6sEeuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769167503; c=relaxed/simple;
	bh=XH4nSX4LPoSkxa/PYwaKG8lQRqVVZ4EkQiKIGnDG4eA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XHJJrZWdrwcVnIn6Cnd3oEBJpxMgPV9HnVnoEsbW9Z+k8/s1Wa44nebpxnwmlt6/BErOROLFHDB5zPhJe7eO1ejHb7UU7Mcs9cZ5sKA8ddX36lMjhnQ4ut3P3MIsRJvEGqpntZn1MATPlWU8GE2WplVbF5J7UfdrZIsPPtRPgVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vImoSdZx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vImoSdZx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5342EC2BCB6
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 11:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769167503;
	bh=XH4nSX4LPoSkxa/PYwaKG8lQRqVVZ4EkQiKIGnDG4eA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vImoSdZxWuENWQ9XTIv4zgJJsA8xnMlR5GGWiXjXIaPNv6UDkKR8xE1Ul9Apoweiw
	 ZLX9UJiM3jedkkbZgjIlcL2aaXWOlrxqd8Hcx3xGFnFOhUE7b0enizsjZwSnWZLDV2
	 p5tD95NRqijpc70J13k+Ltty6ajJ72IOCKRsBxfITIOMXqDp1IbIWUPxyWgIkMcbOh
	 owkVejI4dyylue5mbXIN8bYB+aDGBUeTsNCd7b/J9NUYK2ftdidUjtzJdgg393Xf2p
	 crCCsf5H90xXKkgy0NJ2zV0xx6Hu5W1pI6ufxtwvjsijYTFFNfHKRdcg1AWZGqlO7q
	 gxdjNo45oTTRg==
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-bde0f62464cso694178a12.2
        for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 03:25:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1EsttQWSv5ZGIjZWcdwkbyWiafTR4xDHcWsbrqQWMim3T1+d9nq4uTwgXEFdmINYXGGohPDDArk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwrLdYcDpJhNuUaFFfJx45BOLryt5pbGwAmUeP2PDiGw3pGU2U
	IVD3KQRYgZ4LG2uZhp6YoDZCpVQ8f72fckg2A8WNCTv7lH0pAX+cDe2zm+3gBuFHjFlLv0Yb7oO
	I2LRpPVx9UaUFs2tQ5K2VYbYSjaXAq98=
X-Received: by 2002:a17:90b:180d:b0:34a:8e4b:5b52 with SMTP id
 98e67ed59e1d1-3536701d1e7mr2303386a91.8.1769167502720; Fri, 23 Jan 2026
 03:25:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123074820.310605-1-ruanjinjie@huawei.com> <aXM-vOUVbD8iwicr@gmail.com>
In-Reply-To: <aXM-vOUVbD8iwicr@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 23 Jan 2026 12:24:50 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHQKDMvrj-NUWVTN=AP0W5rUMdxXFzzp=OphxM7bE2PNQ@mail.gmail.com>
X-Gm-Features: AZwV_Qi6WVvWtdcSAOAhjgAaETyZIPQoHF0jNjo-Svsw9pyXs6exzF62LuGjDdM
Message-ID: <CAMj1kXHQKDMvrj-NUWVTN=AP0W5rUMdxXFzzp=OphxM7bE2PNQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: kexec: Add support for crashkernel CMA reservation
To: Breno Leitao <leitao@debian.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net, catalin.marinas@arm.com, 
	will@kernel.org, akpm@linux-foundation.org, bp@alien8.de, 
	pawan.kumar.gupta@linux.intel.com, mingo@kernel.org, 
	feng.tang@linux.alibaba.com, kees@kernel.org, elver@google.com, arnd@arndb.de, 
	lirongqing@baidu.com, fvdl@google.com, bhelgaas@google.com, bhe@redhat.com, 
	dave.hansen@linux.intel.com, rppt@kernel.org, ryan.roberts@arm.com, 
	osandov@fb.com, jbohac@suse.cz, sourabhjain@linux.ibm.com, cfsworks@gmail.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Jan 2026 at 10:30, Breno Leitao <leitao@debian.org> wrote:
>
> Hello Jinjie,
>
> On Fri, Jan 23, 2026 at 03:48:20PM +0800, Jinjie Ruan wrote:
> > Extend crashkernel CMA reservation support to arm64.
>
> This is awesome. I was waiting for this patch! Thanks for working on it.
>

That is great!

But the commit log contains no motivation whatsoever why this is such
a good thing, so perhaps one of you can enlighten us? This endless
fiddling with boot-time memory reservations doesn't make the system
more robust, so having a good reason in the commit log why this change
is needed is really needed.
