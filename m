Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8121632C8;
	Mon, 30 Dec 2024 11:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735558571; cv=none; b=qL8ZIHIwSxadqxwvzTp0NIsDoPuYD8wouOrvSOryzRq7gCVo3isachdecw9gbskTT+o+CQV25O2BxYf5/SqZM00ch/xV9aO14I05slZoerKu5tWjqeokxpYHFArzqYf0fh1uqkypmTyJdWyFxmj6/jySg4D+OclPcpCmfQQuwqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735558571; c=relaxed/simple;
	bh=ZXyecpas4eCabcwr/0t9ZV3eF/8o0qAtlAzrrJs1Z1M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ON6VyESgxG8+sKHHWPLMcEA3JCYHJW1l21J8LbLDtVejqqJxz+EZprcVmU1zHDiRgTxkXRe7ajkv6pVRI8PQatJHfyr3101Xd+JexHiUHgfWrNo217x2c78lfoMCZd0sgzHlpKLvHMNq1LyuLtlkov8k7mO/P1EWnCrrRFpnsVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nX3RT0T+; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nX3RT0T+"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0B8160007;
	Mon, 30 Dec 2024 11:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735558558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZXyecpas4eCabcwr/0t9ZV3eF/8o0qAtlAzrrJs1Z1M=;
	b=nX3RT0T+rE2lMAHs+bicIONtjxrErMfma6Euo3h22mPvMzH6XkNBCqXQVP7WvnJq2ZmmzY
	WfRfI3crflRXMQcQg/Tm547nTZGRtWGWqrxII7hj8WiWmFsYCizVXuHZTHymW0R7c61cvR
	IUpqxd5kRMtah0r+wO/IsyNhy4ZufwZdlV+G7rbaYBQ2+pNH+ug0MMy6O0PQdbnof7UWTa
	cS03WsY+oIVdSPa8/k3i2nP6BF0lL72jIbPmOQTP0ZzjFwXfA8Yg5FToFA43T6wR+/LBE7
	oGIB6eLMTUq50UpATticbKPWcBebrgHuqthyFbYQz/3ysVnMfv96jk/m1ROrIA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>,  Steven Rostedt <rostedt@goodmis.org>,
  Rasmus Villemoes <linux@rasmusvillemoes.dk>,  Sergey Senozhatsky
 <senozhatsky@chromium.org>,  Jonathan Corbet <corbet@lwn.net>,  John
 Ogness <john.ogness@linutronix.de>,  Andrew Morton
 <akpm@linux-foundation.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] hexdump: Allow skipping identical lines
In-Reply-To: <Z2rYBc7QTTvviT3s@smile.fi.intel.com> (Andy Shevchenko's message
	of "Tue, 24 Dec 2024 17:49:25 +0200")
References: <20240826162416.74501-1-miquel.raynal@bootlin.com>
	<Zsy8JPaiGknBypw9@smile.fi.intel.com> <20240827110147.29a7481a@xps-13>
	<Zs3UrlufPJ9wVyep@smile.fi.intel.com> <87frmdnvkl.fsf@bootlin.com>
	<Z2rYBc7QTTvviT3s@smile.fi.intel.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 30 Dec 2024 12:35:57 +0100
Message-ID: <87ed1p2yjm.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Andy,

On 24/12/2024 at 17:49:25 +02, Andy Shevchenko <andriy.shevchenko@linux.int=
el.com> wrote:

> On Tue, Dec 24, 2024 at 12:56:26PM +0100, Miquel Raynal wrote:
>> On 27/08/2024 at 16:29:18 +03, Andy Shevchenko <andriy.shevchenko@linux.=
intel.com> wrote:
>> > On Tue, Aug 27, 2024 at 11:01:47AM +0200, Miquel Raynal wrote:
>> >> andriy.shevchenko@linux.intel.com wrote on Mon, 26 Aug 2024 20:32:20
>> >> +0300:
>> >> > On Mon, Aug 26, 2024 at 06:24:14PM +0200, Miquel Raynal wrote:
>
> ...
>
>> >> > Also here is the formal NAK till the series gains the test cases.
>> >>=20
>> >> What test cases are you talking about?
>> >
>> > Anything meaningful you come up with to show that the printed data is
>> > what it's expected. The module has a complimentary test case,
>> > lib/test_hexdump.c. Without changes in that file, there is no go
>> > to what ever golden ideas you have.
>>=20
>> I had a look. The tests never test the content of the kernel buffer,
>> while this is the only part that my changes have an impact on.
>
> So, it means that after your change there will be a deviation between the=
 core
> function that dumps into a buffer and one that prints message into the ke=
rnel
> buffer.

No, it's always been like that. The formatting of the prefixes have
always been totally different in this function, probably because filling
a memory buffer and sending these messages to dmesg is fundamentally
different and we may want a different behaviour *when sending to the
kernel buffer*. That is what I believe is useful. If someone wishes to
port the feature to the other functions, they can, but it is irrelevant
to the change brought here.

> Moreover it lefts seq_hex_dump() out of the picture.

seq_hex_dump() has diverged already and is a very specific case that is
probably under stability constraints, where trimming down the output
lines is likely much less useful.

I am not strongly opposed to it, but it is probably a bit useless.

> I think you need to start from modifying hex_dump_to_buffer() to have a
> functionality you want (note, there are cases in the kernel that use
> hex_dump_to_buffer() for formatting messages in the kernel buffer and they
> might want to have the same functionality to be available.

No... that is not how these function work nor have been designed for,
hex_dump_to_buffer is used as a line-oriented helper to fill a kernel
buffer line which *is* a line-oriented buffer. A prefix gets added to
it, and I want to skip the printing if it's redundant. Lines are sent
one after the other using printk anyway. All this logic has nothing to
do inside hex_dump_to_buffer at all. Plus, what you ask for would
require a new buffer to be allocated, potentially big and unbounded,
which would require a GFP flag (yay! a new parameter). And finally the
implementation itself would be much less obvious if the algorithm was
not line oriented.

I am sorry, but I really took the time to understand your request but it
is simply not working well technically nor conceptually desirable IMO.

>> These tests verify the hex_dump_to_buffer() logic, but never how it is u=
sed
>> through the print_hex_dump_*() helpers.
>
> I haven't checked and don't remember for sure, but KUnit rings a bell tha=
t it
> might be possible to test the actual kernel output. (However, after the a=
bove
> modifications been made it won't be needed anymore as test_hexdump.c will=
 be
> extended to support new feature.)
>
>> In this series I am just enabling a new way to print the content of the
>> buffer, like for instance enabling a prefix, which is not directly
>> related to the core implementation of hexdump.
>>=20
>> Hence, I am sorry, but I will disregard this request unless someone
>> comes up with a working idea which is worth the effort, considering the
>> minimum impact of this change and the fact that it is mostly (if not
>> only) for debugging purposes and will most likely never reach users.
>
> I'm sorry, but my NAK still stands. No tests =E2=80=94 no go.

Please Andy, stop asking loads and loads of unachievable changes to fit
your ideal. I am bringing something that I feel can be useful, just stop
with your endless list of unrelated (and in this case unreachable)
wishes. There is nothing testing the prefixes, if there was a suitable
test case I would improve it, but there is none, because the test suite
is not used like that.

> And it does not matter if it's only for debugging or for ABI, we require =
test
> cases for the lib/ changes.

Who's we? Where is this documented?
There is no test case checking the kernel buffer printing.
I'm not skilled enough to write one.

> We don't know and don't care much about how these
> new features will be utilized

And this is typically what I dislike in some of your reviews. There is
always a context, trying to ignore it is pointless.

> (the requirement here is to have a user for it,
> so you might need to consider to convert one of the existing user to use =
a new
> feature, besides the [updated] test cases).

I know this is generally requested, but once again, dumping pages of
data where this flag might be useful makes sense during debug sessions
in very particular places, keeping these debug calls does not seem very
useful to me, but that's certainly easier to achieve than your previous
request.

Miqu=C3=A8l
