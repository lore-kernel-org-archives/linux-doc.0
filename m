Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A9F1B81D
	for <linux-doc@vger.kernel.org>; Tue, 16 Jan 2024 16:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Wmh1ntQ7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mIelKKUa"
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1705424148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oNIEbNbhSERNMsLVQ6obK3TIIQ1HF3R8vapK461ykVE=;
	b=Wmh1ntQ7X7pSf/Zy64vA3ilxBpHWct33GQMxqpLgAztr5y9oYMkY+feQJERKyZgdJd6qJc
	YL+Sv8GBlJeht1Kge4FtKp3WZz3cDTGmoYYo3VCEtIMmZZ/xGEcLBP9NNILzGJwurwp5g3
	br9ovmHIY1gyf1uB0k6NoJ8/iNnNcM0OfWYBsNwF7X+cTxWP0+iATYt/68JX9iafmdgK/W
	PEIvKEffkfYTKLSN5+FInIRtT1E5kFPoEmuUbHAZ0ZYhwJ/twCp7rluALx/VSmZLqbWuVT
	6VlAsi0EXKYVLLssi2LrC+liwNrrgrpfDTw8AQwdYwy9xgSMJVezClzcQByutw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1705424148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oNIEbNbhSERNMsLVQ6obK3TIIQ1HF3R8vapK461ykVE=;
	b=mIelKKUaDf9h0ofCrMidSniinDSC+qYnr1eGI7ObvLfNRHXbA5r9HtVUl98KeljFog5yYd
	74L9whIDBIiuYSBQ==
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: Help required - kernel-doc, code block and backslash
In-Reply-To: <87ttnee69t.fsf@meer.lwn.net>
References: <87y1cqbg01.fsf@somnus> <87ttnee69t.fsf@meer.lwn.net>
Date: Tue, 16 Jan 2024 17:55:47 +0100
Message-ID: <878r4pxlnw.fsf@somnus>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Jon,

Jonathan Corbet <corbet@lwn.net> writes:

> Anna-Maria Behnsen <anna-maria@linutronix.de> writes:

>> Another question: Is there an linux-doc irc channel to ask simple
>> questions?
>
> I don't really do IRC, just don't have the spare attention span for it.
> Feel free to email me anytime though.

Thank you very much! So I directly use this to ask another questions :)

When using the kernel-doc 'identifiers' option, is there a way to use
wildcards or a easy way to enable wildcards? Something like this:

.. kernel-doc:: include/linux/jiffies.h
   :identifiers: time_*

Thanks,

	Anna-Maria
