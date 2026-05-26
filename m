Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE362F549F;
	Tue, 26 May 2026 15:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779808811; cv=none; b=aKRGxzsQGkGowxSNFa3bfieealS99vOBaAJFVKHWxyigCxPaq9vGnTfpcqNTdJ7Hy4r9THKdZhrIQ/QGdEYReK/DkjBJZ+iblSv8BEhpZHrYeeyC1L6F39OjPMyWjoPfG7zz4MfM3wxkZrwlpNCG8x9mKWerIjHmxv2XjxpiT0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779808811; c=relaxed/simple;
	bh=SH8qWHJju4uEAUf18GIpquuRbDg0vcsabcryMTE0gLE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sPqJTNt//jgnGd9kcfCv4qISU//KHFk54rj8/0JVtgFlzN/x3CPXyeSdcfPdAKInTloNNGzJU/BBSvH21TBp3W6Nbcwtsy+rvx7+6chZslmQT4zKeUxaDdNGj52Ki6jl76geAcpuF3co84NIFw1sRvxndW3JjktTTa37+1upffY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yf74Wara; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yf74Wara"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9D91F000E9;
	Tue, 26 May 2026 15:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779808810;
	bh=SH8qWHJju4uEAUf18GIpquuRbDg0vcsabcryMTE0gLE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Yf74WaraQu+culrxNM7OHuH/zSP4TM4/HGEx2r/fpoNbU4BL7xtLWNZxgSbUt7SXh
	 9T6fAf5xsM2R0n5yG8qom6jBLJIp+HKzyfs1j/9YkdJ2/T+gUycOjKkEBH6KnE+Xcj
	 geeN1dYKtNOtgXZ6COQi/gJnMToYeDPUVWQcI11nnoARWBfi8xpqWkJiWhueZevFEY
	 +R3MeI0W6TilQF5kgigh6D+kl9WvKV642zUaO5awh/BwT1jOmqMd6iiNJEraBusVMe
	 V+zWOYT16/jLo2/oBL18U5Cny1aV31ES4zb7gm4LLjeWtfwZZ2dlc0Mu9Y9z/KmPij
	 da3VA4tVczz1Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Michael Walle <mwalle@kernel.org>,  Takahiro
 Kuwano <takahiro.kuwano@infineon.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Jonathan Corbet
 <corbet@lwn.net>,  Shuah Khan <skhan@linuxfoundation.org>,  Sean Anderson
 <sean.anderson@linux.dev>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org,  stable@kernel.org
Subject: Re: [PATCH v5 04/28] mtd: spi-nor: swp: Improve locking user
 experience
In-Reply-To: <87v7cakz7u.fsf@bootlin.com> (Miquel Raynal's message of "Tue, 26
	May 2026 16:44:05 +0200")
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
	<20260507-winbond-v6-18-rc1-spi-nor-swp-v5-4-93453e1a9597@bootlin.com>
	<9432f07f-3724-4257-b6ab-84721e619f78@linaro.org>
	<875x4fphgr.fsf@bootlin.com>
	<779f2680-2c67-4bbd-9576-bde8e83d111d@linaro.org>
	<87o6i7o0tj.fsf@bootlin.com> <2vxz8q965ub7.fsf@kernel.org>
	<87v7cakz7u.fsf@bootlin.com>
Date: Tue, 26 May 2026 17:20:06 +0200
Message-ID: <2vxzcxyi42qh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 26 2026, Miquel Raynal wrote:

> Hi Pratyush,
>
>> And here's what I am thinking: the first 9 patches are reviewed and good
>> to go. I want to land them in this merge window so we cut down your
>> patchset and land stuff sooner.
>>
>> Unfortunately I just can't seem to find time to review this series so I
>> hope this helps some at least.
>
> I know what the maintainer load can be, sometimes it does not play well
> with the rest of the your personal and professional duties. But the
> series has already been on the list for about 8 months, it's been looked
> at by other people, the ones who had enough time to dedicate to it. From
> my perspective, asking such contributions to wait indefinitely and then
> suggesting partial application without a technical reason is not a
> sustainable way to handle contributions. This series has not moved much,
> it could have been applied *much* earlier. I've now addressed most of
> the comments from Sashiko, v6 is coming, further improving the quality
> for sure, as there were bugs - there are always. I am of course happy to
> address further technical concerns, if there are any, but I would
> strongly prefer merging the series as the coherent set it was intended
> to be, rather than only taking the preparatory parts.

Unfortunately I am only a patch monkey for SPI NOR these days and do not
have any time to do reviews, especially for big series. I mainly check
for reviewed patches and try to apply them. Even that is becoming harder
these days since I am more busy at new $DAYJOB.

I understand your frustration, and do take the blame for this, but
unfortunately can't promise anything better in the future. We pretty
much don't have any active reviewers in SPI NOR. Michael and Tudor are
also short on time these days. If your employer cares about SPI NOR,
perhaps you can encourage them to support developers in helping out with
reviews and maintenance.

Applying the reviewed patches reduces the total patchset size and does
make things easier to review and land. So I don't get why you are so
opposed to the idea.

But anyway, I'll bite the bullet here and apply the series. You
generally have high quality patches so I am not super worried about this
to begin with. We can deal with the bugs or shortcomings later I
suppose...

>
> On top of that, as mentioned previously, I now have additional spi-nor
> improvements and cleanups waiting behind this series. Keeping such a
> large stack of out of tree patches for months is becoming painful to
> maintain.
>
> Thanks,
> Miqu=C3=A8l

--=20
Regards,
Pratyush Yadav
