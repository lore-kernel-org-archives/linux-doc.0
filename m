Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEDA3126B9;
	Thu, 16 Jul 2026 10:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784199491; cv=none; b=QwvWs7SVzYHjK+3ltIn2vYKG7YRhVykRdJkl1U1hpjG3n+/vqIOwq+8xkhMJJmYrax2CEO9jLEiXh6MIa6RdFkKyI148KdyS54SHI5tFIhB5+bJnygsUx23QaGgmywUJpXyuBZNfbJOCNc0J/om8hIFWb7JbavYz/ffTHi5VQZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784199491; c=relaxed/simple;
	bh=53r8H5xg7xmFUwyZYgqH8f+O8sfvFpfh0NRHu1wtfdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bnDSUcwiJiJcIrdWNovCYwvEMbmLbDKZZ9Xk9kTUimrHBwwRw9KvNEV5QUtp4S79vYVCTXfIxIaelh+IiP1F+mL7fcAjpawvp59xKEKtbk5+kG3edYOiD+MmAQ6o8+aYc+szZ0SLHBNrLxr4mjzBH4Zc67VjtmMB1J4sOdtWUc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R8mX7CnE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R8mX7CnE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2121F000E9;
	Thu, 16 Jul 2026 10:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784199490;
	bh=XuGqQGrV21GjVYaZtMHxkCtFSyxl6ccxDasX/4a2VJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R8mX7CnE7NTo1y4pcYLyuJEjGUSoNWuer6ncwtUmHFXaDNyjKp06mkVAuyTy5/1SU
	 1aqGggkpzsn6iGvzdzzNbypBry9xf3sR+kxJUxMSNB6bd/vEtuQNc3wBsylVHQ/JWy
	 HHUSwdptbZGze6sGIfcmEk/DQnvjoQNZX0IIDXJuwm81KIsVGiluHcit8VTTrHtw9r
	 BYBTnU+z4S+NdVge/SfMkWi1btVEFG+/YakVd7fqMVI72+vSBQbdvqwKFGi5bEt8De
	 mbSQ0Kjg+Ko1l0DggZouEwsT+6dkqvhNXy468laKTtzXd8OiZS019B0gCgTJmOuw5b
	 ezqjkNeUtQvVw==
Date: Thu, 16 Jul 2026 11:58:07 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arch: arm64: add early_param idle=<wfi|yield|nop>
Message-ID: <20260716-generous-organic-skylark-b9dfb1@sudeepholla>
References: <20260711-arm64-idle-param-v2-1-0ab67652a435@cyberchaos.dev>
 <20260713-bulky-thistle-leopard-c66a18@sudeepholla>
 <5f1af8d0-ed73-4dac-9bd3-30f8e82d4b26@cyberchaos.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f1af8d0-ed73-4dac-9bd3-30f8e82d4b26@cyberchaos.dev>

On Wed, Jul 15, 2026 at 03:24:03PM +0200, Yureka Lilian wrote:
> On 7/13/26 11:57, Sudeep Holla wrote:

[...]

> > 
> > If WFI is replaced by NOP or YIELD, do we really need to save/restore
> > IRQ context used for pseudo-NMIs which may add some overhead ?
> 
> There are optimizations, even in the ARM64_IDLE_WFI case, which could be
> done here, such as checking that an interrupt actually occurred before
> continuing (and repeating the wfi/yield/nop until this is the case). I would
> prefer not to do these optimizations in this patch series, and leave it as
> future work, because I don't understand all the implications at this point.
> Is this acceptable for you?
> 

Sure, I am fine with that. Anyways it is left to the maintainers.

-- 
Regards,
Sudeep
