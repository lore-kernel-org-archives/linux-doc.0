Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3CB1494D9;
	Sat, 11 Jan 2025 09:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736589304; cv=none; b=RMyYSunZVySmytEDV35U+ERwFHPUhbLhk8GHD+Xl+79vH0tDn/d9SQLlnMW6AoRR/I4350iXsaXhWkdDKV4ZtLjErE4dSg8VV/4zn0apcXwGMAIVEZZ4ZuSRpPVwvFo7YoCQADTYSB48HuQ9EVD51yzmVD0b9bGSXFBZfp7FMaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736589304; c=relaxed/simple;
	bh=tTuCUsiT8nJImOQJbatEc0Pltr0wRSV2f9a8lVw6S08=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rwzbCrqLA6UhxuOpOFyqepIknre1OgoNl25d1MDcDDkPStbiAEYyWcrhrnlpgFHLxP7/kVfNbvptSp9XW0snc+u/3Z9TW9xIsfoL7sdcylcjkajniZaqD/Z9HTD5AaiVkhnOfHVNBIjf9JruE9ln2p3g1u/Vs2AmKmRIPw/smaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=p1ONRouF; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="p1ONRouF"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0268A1C0003;
	Sat, 11 Jan 2025 09:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736589300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rQruXORObHFSK2+gwF1X665y/vw+SakXoRGGHcqKIL0=;
	b=p1ONRouFirx8BgSv0LzEab/Ye1bHqQBGJm6YoFniYappDi5BtRy2Fg3plzc6Hed+S+ScGT
	oHoBupHeXl6esegclkRRoPq64mDkGuDScYRmPVQ4CExMtptnOOG/W0oAMEZTlUH/Tw/EIo
	dweb5GncEgzWJobchObqZv+7sEwOv5pDWERZBiBn7ZcopxKy63YufGrD0W83l3ykIcsCac
	3RYaDKvKG6U5Ytz0ns4Ly00RVCqowh+m3TCCovPasVOtB/q5Jczj+PE1GFMuq4B7sEuXNx
	2qKlgPsb0/GnmpmyznPXhvHlstMmwEM0lcA3yr9TEZY3D/1zkMVgKcd+eTU3xQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>,  Steven Rostedt <rostedt@goodmis.org>,
  Rasmus Villemoes <linux@rasmusvillemoes.dk>,  Sergey Senozhatsky
 <senozhatsky@chromium.org>,  Jonathan Corbet <corbet@lwn.net>,  John
 Ogness <john.ogness@linutronix.de>,  Andrew Morton
 <akpm@linux-foundation.org>,  Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hexdump: Allow skipping identical lines
In-Reply-To: <20250110193930.26b08c2f@pumpkin> (David Laight's message of
	"Fri, 10 Jan 2025 19:39:30 +0000")
References: <20250110-perso-hexdump-v2-0-7f9a6a799170@bootlin.com>
	<20250110-perso-hexdump-v2-2-7f9a6a799170@bootlin.com>
	<20250110193930.26b08c2f@pumpkin>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Sat, 11 Jan 2025 10:54:58 +0100
Message-ID: <87o70dsmj1.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi David,

On 10/01/2025 at 19:39:30 GMT, David Laight <david.laight.linux@gmail.com> =
wrote:

> On Fri, 10 Jan 2025 19:42:05 +0100
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
>> When dumping long buffers (especially for debug purposes) it may be very
>> convenient to sometimes avoid spitting all the lines of the buffer if
>> the lines are identical. Typically on embedded devices, the console
>> would be wired to a UART running at 115200 bauds, which makes the dumps
>> very (very) slow. In this case, having a flag to avoid printing
>> duplicated lines is handy.
> ...=20
>>  enum {
>>  	DUMP_FLAG_ASCII,
>> +	DUMP_FLAG_SKIP_IDENTICAL_LINES,
>>  };
> ...
>> +		if (flags & DUMP_FLAG_SKIP_IDENTICAL_LINES) {
>
>
> That doesn't look right to me.
> You want:
> enum {
> 	DUMP_FLAG_HEX_ONLY =3D false,
> 	DUMP_FLAG_ASCII =3D true,
> 	DUMP_FLAG_SKIP_IDENTICAL_LINES =3D BIT(1),
> };
>
> and maybe you can get away with not changing all the other files.

I'm a bit sad all the time spent on these changes will go to trash :),
they kind of looked "nicer", but for sure this approach would be
transparent. I can definitely try that.

Thanks,
Miqu=C3=A8l
