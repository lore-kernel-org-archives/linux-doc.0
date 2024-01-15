Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8BF18636
	for <linux-doc@vger.kernel.org>; Mon, 15 Jan 2024 18:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2Ud1DMvz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BisbFPUd"
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1705343806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=LBvhS+xDnVDgpkHH62qGJNvIZNF0SYbfguY9Ri2oBZM=;
	b=2Ud1DMvzC4XxhDFoYs+6xc6EFqpHOfZgPaxJMRAbLGAuk2IfeEskCH0a/KnF+GXhwrCeHX
	882XlujbiXyKqaWczdvHnVsgRqIKnwCsjgoaTwWokjCb3JB2K9ZrNPJpZN3YcxEYjsQvzE
	u4C02UKAp3oSCbTgKEN2us4yxPtzuRVeTprIRvN6vlXrR2lPkK0CJXdQ5C3rb9/DPINRcl
	XBmFlQurfrSvuAB2gS55uB26nZF5Hh+8lNTIv+XRSSFVLCFoT4pF8Zn8WXOi10VgvRXGq5
	9PYHGM8HS/eYUOWFUDZ2xkSMogbIexTq4bYJUMxw2qhTC6kaei+dSqEw6Tk3Pg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1705343806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=LBvhS+xDnVDgpkHH62qGJNvIZNF0SYbfguY9Ri2oBZM=;
	b=BisbFPUdGl2GP1O+wEbIU1ggfVycI+I0rPVGoalzaa1avNloYUoTFTUBjz3k9YfUrtcV2G
	f75/N1KPJ6lyvcCg==
To: linux-doc@vger.kernel.org
Subject: Help required - kernel-doc, code block and backslash
Date: Mon, 15 Jan 2024 19:36:46 +0100
Message-ID: <87y1cqbg01.fsf@somnus>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

I'll try to integrate some documentation which is already written in
code comments into the kernel documentation.

There I face the problem with a backslash at the end of a line in a
'code block' and this ends up in removing the newline.

So I have this comment in code and I simply want to use the kernel-doc
'doc' option to integrate it into documentation:

/**
 * DOC: example
 *
 * This should illustrate a hierarchy as a code block::
 *
 *                    Top Level
 *                /               \
 *        Parent A                 Parent B
 *       /        \               /        \
 *  Child A      Child B       Child C   Child D
 *
 */

And the code block looks like this after using the make target
'htmldocs':

             Top Level
         /                *        parent A                 parent B
/        \               /         *  Child A      Child B       Child C   Child D


I wonder, if there is something broken (as the * of the c comment is in
there again)?

Another question: Is there an linux-doc irc channel to ask simple
questions?

Thanks,
	Anna-Maria

