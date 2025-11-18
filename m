Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFFA22DFA5;
	Tue, 18 Nov 2025 19:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763493013; cv=none; b=erLzpPUcd2BDx8j2y1oROCXNfAh5BqDzFPGQ0jIjfTcpT03C+axDjrY138E+X6cwGJ4x9b4aRsHAaFRBExazEjVRxRuCl5RK6d8fIxaq+YiFPokiXC9nfOkWO+B1nLGfWU2QEz6ieIa+DpLPfhBJjrcAGHuZYgm0a2FJ+YO+Ihs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763493013; c=relaxed/simple;
	bh=oU8/pcGu3t9PBSNqNYF1s+Novh7gTzyDhSWfbkRT4b0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i4NQxfaCmwMRKYMvU3YiVpJoIICz+aPcbueXbh7TRSxW6ZwTnCy91inYFmHnVW4oTUdBVoBxmjjQAPwjX6opb56Nitz+DzeWsyQ6/zxloOPYOYjtL+odlvGB+G+xeFNdOLG3W/xcdj2MzKEOf9eWP2WzSrUBkp1x3GuCl6yZro8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JS80PkKp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JS80PkKp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B72F6C116D0;
	Tue, 18 Nov 2025 19:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763493012;
	bh=oU8/pcGu3t9PBSNqNYF1s+Novh7gTzyDhSWfbkRT4b0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JS80PkKp/3hQO6GIK1ZL9DUj3jc3EMiG+qh5lz6De0u9VQWiRavmyGCOBwQqW4wk4
	 oM6iSJashJ5rQnR9T7aPgukXw5qR5GRLzLCQgXTRKJvsU/rh55NXmmoERu60GI9rv/
	 3pUWYCmgVnL34e0a7BJV/ozvBZa/b57NceP3Ia81zGAECDX5kxVAbT8tCpd1Jd9CTG
	 SesYdC0tOxF5kb1hc61iv9nEvig7w3RRgQnSMiYmZWZeFTXdp/eIwW3imV0n28S323
	 5KSfJm0Iz6++ltm3EVqbgBBuSc4BxwhnRaokqU+PO2dD/JEaOxpS3ppn/xFscMYrQt
	 Jk5NYvCyyZ5kg==
Date: Tue, 18 Nov 2025 20:10:05 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Convert get_feat to Python
Message-ID: <20251118201005.6b38e03d@foz.lan>
In-Reply-To: <87h5ur47eq.fsf@trenco.lwn.net>
References: <cover.1762877066.git.mchehab+huawei@kernel.org>
	<87a50swl6d.fsf@trenco.lwn.net>
	<20251111231232.3955f1fb@foz.lan>
	<87h5ur47eq.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 18 Nov 2025 09:44:45 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Em Tue, 11 Nov 2025 10:09:30 -0700
> > Jonathan Corbet <corbet@lwn.net> escreveu:
> >  
> >> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> >>   
> >> > Hi Jon,
> >> >
> >> > That's the final series to complete the migration of documentation
> >> > build: it converts get_feat from Perl to Python.
> >> >
> >> > With that, no Sphinx in-kernel extensions use fork anymore to call
> >> > ancillary scripts: everything is now importing Python methods
> >> > directly from the libraries.    
> >> 
> >> This, of course, conflicts with my library move ...  Maybe we review
> >> that and I go first this time? :)  
> >
> > Sure, go ahead with the library move, while this is reviewed. 
> >
> > This one is trivial enough to be rebased on the top of it.  
> 
> That time has come ... we should still be able to get this one into 6.19
> if all goes well.

OK.

Just sent a rebased version on the top of current docs-next.

Thanks,
Mauro
