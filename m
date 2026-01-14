Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D65339719;
	Wed, 14 Jan 2026 20:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768422363; cv=none; b=FPZyjtPDSZvKE02wShX7OuOUp4AKnAbX8nuxqVGlCIXUDleDmoP93ulOMvssGXptxy0Mp7SNpI1+vFngAQyGpzw/gs+pZ22mr7wgd/kqGgpLawOu2Wj/zKwtEEKhSoj5mJnixIHZ7zref9E8C+p+p13UG/yBaOUsWgi1acFzF/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768422363; c=relaxed/simple;
	bh=B+/ZjXaHl5t5NIx5dWtCgaCl26J8dtH8qRHeJJPcxFE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AcN/uIGi+yYgYjn5Z4VNjIRQq85dRKVM4ymN8yOzX/0GFIY+3zlonAFpWD3SSN1q1AQdQgfUjrc+7yJXl74RHANgPPpfa4b/dFmNhI045Vntea3HV342KBQc5YL4v4/e+qO4pgmmV90zMnEAfoowHWscupyAdT9UeL8ZbWqeTpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jWQo9IED; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jWQo9IED"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403A6C4CEF7;
	Wed, 14 Jan 2026 20:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768422363;
	bh=B+/ZjXaHl5t5NIx5dWtCgaCl26J8dtH8qRHeJJPcxFE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jWQo9IEDq708LxLdfy0GgN1zfztzzwJo9GZgYV9N6yYW0gfvOQ/4BQpawYKaJ3TR6
	 QV+D85XhEZt/OyRx3mDwVAYRYsewrkdyJFSmhnkrrGUTJm8+ZIU1yid7E1Uqg3HnoH
	 n7KLL0JFMLVKw4h6zPGXnJtUa1e4kTVzhCoZ90P5BPWRGZvEMauWefR9MkEA3/gGPW
	 SztCdyVNMD7TU460UE5n0Fkzm2pSD8CkJ8piMOQ4AxDDC19U8DH7MQ47Y7EFD7TUau
	 qQrR0HChbW6Jx8GCWHaBIiWNQgUneWKop82fja4dgzUqlaK6LbX3aKaAceXG+Hgu9U
	 /cFqdoThJ5nzg==
Date: Wed, 14 Jan 2026 21:25:58 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 0/2] Move kernel-doc to tools/docs
Message-ID: <20260114212558.1aeb1b17@foz.lan>
In-Reply-To: <87zf6gt2ts.fsf@trenco.lwn.net>
References: <20260114164146.532916-1-corbet@lwn.net>
	<813cd0b6-e23b-4571-91fa-224106d3ad54@infradead.org>
	<87zf6gt2ts.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 14 Jan 2026 12:24:31 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Randy Dunlap <rdunlap@infradead.org> writes:
> 
> > I do many of these on a regular basis:
> >
> > $ ./scripts/kernel-doc -none -Wall <path_to_source_file>
> >
> > Will I still be able to do that (by using ./tools/doc/kernel-doc ...)?  
> 
> Yes.  The tool moves, but its functionality remains unchanged.

That's actually a good point: should we preserve a link on scripts
pointing to ../tools/doc/kernel-doc? I suspect that a change like
that could break some machinery on several CI tools and scripts
out there. If so, it could be useful to keep a link - at least for
a couple of kernel releases.

Thanks,
Mauro
