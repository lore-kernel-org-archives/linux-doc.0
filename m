Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A373533D6;
	Fri, 21 Nov 2025 21:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763760463; cv=none; b=g4FocuHpMorYRJ12OaAE/194GmThmvHmdvZ49gQMKYucbfMtNlWkWCkiH3Kx84vWtVYSufHA+kSDxDTmU4qVv4XwJjh24z1H0sDHZpm4dTjZYVtgXn+KrnUMNUWRcJBos3woWK/7BF8mA4oiRq5yZ26L7GHndUhMrVjcw4ZqgI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763760463; c=relaxed/simple;
	bh=Xc58NU2PWTwKL3lZt8RXJSsmsbVj6237FsL+wMXYY98=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tIu320tWweJCufgqsgcMrYF21aF2ccnvrKJKfJz+LsfL98ZQDftyTDW7sGOBuUQmoZZB+ibszB3atoR64IOh/CbpgwTFyPZ1lljurH2yDBd14O3zU2zXi5unpmIOEBUnbR0ckWkL2Qz0fY0odpRm84YWizjDeQVHptOPX3bOgOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RGhvBZrI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RGhvBZrI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BAE1C4CEF1;
	Fri, 21 Nov 2025 21:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763760462;
	bh=Xc58NU2PWTwKL3lZt8RXJSsmsbVj6237FsL+wMXYY98=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RGhvBZrIgFeI2dlPUlzOun1UnPaqW1ZhAzSraY4CG5FJUVye3EM7sYX82Kwgqc4CT
	 f7Ablr7fw1dEI6DRBoKwvZDEoq5Mvql9vLAbHdr5LsvaqmSRSVReYZ23acP3TqPouM
	 L3t8UDitcrQ3cz9C4Sx0zGGtRqOSFjZw6qRsjIAG56vWSQoPvF0dTL/wuOBzR1V7NI
	 Lmg0OlTVIJBbUFTI5/zkYgQVHxIvWm6mYFsQwcVwBPxQPuoqc4uvePorOgx/oafNJ8
	 L1+xNfNzsn1QKMjtR2r7/FVuFI3NQEf/quKwchWa4xwLJMc8Xj8CaDy5Df7Pl306G8
	 S7/A0GOC9qo+w==
Date: Fri, 21 Nov 2025 22:27:36 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Convert get_feat to Python
Message-ID: <20251121222736.205d2a3f@foz.lan>
In-Reply-To: <87jyzjth1j.fsf@trenco.lwn.net>
References: <cover.1763492868.git.mchehab+huawei@kernel.org>
	<87jyzjth1j.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 21 Nov 2025 10:46:32 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> So you had me worried with this:
> 
> > As we don't have a definition yet for the location of the Python
> > libraries yet, I opted to place the parse features library inside
> > tools/docs/lib. It shouldn't be hard to move it elsewhere once we
> > define a better place for them.  
> 
> But it seems that you did, in fact, update the library location. 

Heh, forgot to update the description ;-)

> I've
> applied these, thanks.

Thanks!

Mauro
