Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1FB2D3A86;
	Mon, 17 Nov 2025 10:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763376525; cv=none; b=YvSbozMKrEvrLxnh9zqYXv0z9X2mlJuoS6Dkcorc7SxlD5m22IG8DmYkf93YLntsS8RH8q38/Uxs+O6vlV6dsYBothqJz0XdZ/pjzjGKPc67vkOHexkJvklNTsscRB0T3g7vh6TRzEW6T1hWrktmOiAkc9n+h08hh9nhJCguUfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763376525; c=relaxed/simple;
	bh=T4Q1fl4gkbSo9AV+KXyADuzkRnYYu7+asXsxbC+7nVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXy7I/RDenyEmVUvSVu88ING95Mku8wZdqwH9g0VQYluAcP/2PdNyc7sIErNQoBOU+bKKLofG531SNFyONg4QaFrreibDu52LKhEHAETD+QeBSLi9LNPINSdKRPazlFLrYg49QnjP/luHRDwdNW8Vc9pVshjNlYG5uSdrKdHZ0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tf3w+x6a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tf3w+x6a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF295C4CEFB;
	Mon, 17 Nov 2025 10:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763376525;
	bh=T4Q1fl4gkbSo9AV+KXyADuzkRnYYu7+asXsxbC+7nVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tf3w+x6al9YBCsyTYiJsdlq5TnjJDY28GGMbIZ14qu/g2XBEaPqQIy4XoUbz0RxVJ
	 lImuLkhT2Y6KWUxuy2JhplMBC3T73lHb0UgsGTmRcNkjRyCHPiQBht0F7MqRIqjARa
	 +zLwUNb6K8hNn1XB0/XyjGMP9MIRZjF3scFL7SzE8qn4SzyDdzHczhCrW4VjcLn54k
	 wolvIHWubnPdtkcaCqpNdhld48x6kll6ZjAsOZEbp1/OR6mp3K4jCIOmULx8MUgKNf
	 ofIBj/2GpLc9nQfi0C4uRddbZGO4cK5p4IJSz63SwnXeuDyhfA3+2SK7wFhI4tnEKb
	 IiJbTNdIJrGkw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vKwmo-0000000GmC1-0zpc;
	Mon, 17 Nov 2025 11:48:42 +0100
Date: Mon, 17 Nov 2025 11:48:42 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH 0/1] fix rustdoc build detection
Message-ID: <6sczezthaixabzw5lddhemrx2yivfdf65zfvpew7tpzl3gqire@vjx4rpju5wxc>
References: <cover.1763370163.git.mchehab+huawei@kernel.org>
 <CANiq72=79rhJ5Sh+yp2vRSuSLD=nyR2DuQ26hFeBmyszRC3ALA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=79rhJ5Sh+yp2vRSuSLD=nyR2DuQ26hFeBmyszRC3ALA@mail.gmail.com>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Mon, Nov 17, 2025 at 10:19:18AM +0100, Miguel Ojeda wrote:
> On Mon, Nov 17, 2025 at 10:13 AM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Another alternative would be to modify the rustdoc target inside
> > rust Makefile to make it dependent on htmldocs, but that would require
> > more work.
> 
> Why? No, there is no need to build any htmldocs to build the Rust
> documentation, so that would be wrong.

Sure, Sphinx (including kernel-doc) build and rust doca build are
independent. Yet, Makefile "htmldocs" target currently does both. 

It could make sense to have a separate target if one want to build
them both, e.g. something like:

    make rustdoc - builds just rust docs
    make htmldocs - builds all non-rust docs
    make allhtmldocs - makes both

On other words, we could add a rule like:

    rusthtmldocs: rustdoc htmldocs

and simplify the makefile and the wrapper.

PS.: I'm using "allhtmldocs" just to make clear about what
     I meant. Not sure if this would be the best name for the
     joint html output target.

-- 
Thanks,
Mauro
