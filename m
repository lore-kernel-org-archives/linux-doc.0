Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB77F125D5
	for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 21:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706651671; cv=none; b=ruG/m/egYXnSeUkBjmY8Z/AIXHaoBb4sZPmG6zEBOOrHmdjEB/adFQRieoHIR+QQbD6987JiobE6j4GDS7DQOr7nfCVoc8oQB28PzicQGCgDP10DvIntHnKngWLhavQPznIfHLLMgISIi9bV7GIFWEJlyRndWoBzYLytryTYWpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706651671; c=relaxed/simple;
	bh=0VdAOONvZo7dctE15xW6qsHCcA5X4r70BrR1ln0QXqk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uGehgCCivg1gB+Z2AuWPVrrg0fCv9VSt7qxs3FLilScVoAbc8yx4CxzhFZizZ5wIaVsIHN9HvlIL3763G+fD1Bh2gC95a1joPBryYsoOp6h1e3RpuPqPdrs/2bY8IX+sd6QvpkQKCfXxvxxf7tRNZVGUuFL1zO58Ccq/tQpDH/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=dKFoVX0M; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="dKFoVX0M"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BF62A41A47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1706651668; bh=NtNNGntGfPZPrh3j5HnjvVV+nUJJpRYGss0WitNJIoQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dKFoVX0M6llKVpkjue0R8TCR/FsXtzNj5UboMSGk2BJtTO/6LOGyjPr5ABDgfsB5J
	 +i9FSsUabGeAy17O4Rea4jUsNrHCLPXSHpwgQxmQ1oOS1AHi993lXrBW1yPf/pNiNY
	 TTHFTvpMHVyqGKtZPCoDDYk9woqrzX98tefdUK0AyVCoWaKmeyX62pWm2zIj2wEx8D
	 u4CchGB+Hho2k+hFwx+eKkfOUhb4QwZYfraKehqnfoixf3GaKXG4DvPe8n0xzQlwgp
	 HxFDLJlUgVvIHoDraJEgGdPtuUeJeULr1KD9sz/V12B+1B8LZIDMQPBcOImP+80Niz
	 fberKVl7vElKA==
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BF62A41A47;
	Tue, 30 Jan 2024 21:54:28 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil
 <hverkuil@xs4all.nl>, Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Bin Liu <bin.liu@mediatek.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia
 <quic_vgarodia@quicinc.com>, Bryan O 'Donoghue
 <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu
 <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-doc@vger.kernel.org
Subject: Re: [RFC 1/1] kernel-doc: Support arrays of pointers struct fields
In-Reply-To: <CANiDSCuhO+kaHSJgnHMi0VWVyz+ouzONNmeWfWUNj7SDifEPMQ@mail.gmail.com>
References: <20240126-gix-mtk-warnings-v1-17-eed7865fce18@chromium.org>
 <20240127185311.391940-1-sakari.ailus@linux.intel.com>
 <87bk92a5of.fsf@meer.lwn.net>
 <CANiDSCuhO+kaHSJgnHMi0VWVyz+ouzONNmeWfWUNj7SDifEPMQ@mail.gmail.com>
Date: Tue, 30 Jan 2024 14:54:27 -0700
Message-ID: <87plxi8p2k.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ricardo Ribalda <ribalda@chromium.org> writes:

> Hi Jon,
>
> On Tue, 30 Jan 2024 at 22:10, Jonathan Corbet <corbet@lwn.net> wrote:
>>
>> Sakari Ailus <sakari.ailus@linux.intel.com> writes:
>>
>> > In a rather unusual arrangement in include/media/v4l2-vp9.h struct
>> > v4l2_vp9_frame_symbol_counts has fields that are arrays of pointers, not a
>> > pointer to an array, which is what's usually done.
>> >
>> > Add support for such arrays of pointers to kernel-doc.
>> >
>> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> > ---
>> > Hi Ricardo,
>> >
>> > I tried to ram it together with processing the rest but it seemed
>> > to complicate processing the usual fields.
>> >
>> >  scripts/kernel-doc | 9 +++++++++
>> >  1 file changed, 9 insertions(+)
>>
>> So I went to apply this...but b4 then pulls in a whole series of
>> patches, none of which were sent to me.  Since this says "1/1", I was
>> not expecting that...  I've unapplied it; can I get something that isn't
>> buried in a bunch of other work?
>>
>
> b4 shazam -P _ 20240127185311.391940-1-sakari.ailus@linux.intel.com
>
> worked with me, including the trailers... Do you prefer to try that or
> to wait for Sakari to resend it?

Yes, I can work out ways too - going back to the dark pre-b4 days if
nothing else :)  But I'd rather not blindly apply a patch that clearly
seems to be a part of a larger set that I've not seen.  Getting a
standalone version would be preferable.

Thanks,

jon
