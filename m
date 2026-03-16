Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD3727FB18
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 23:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773705318; cv=none; b=FKSM24k03QrTRgZcrdodUm9ZQnHHsfePnk5JwunfH6CwmSQNJ2hmV+v2S7N7LE03WFjQHhx1Ngp6NGDCOoGcNHUC3fXaOBXtbYP92bjP+ej0ucOQCnxkYAOKmfJpAlzta2f9xDOxCd6jc60+nsSjedNI5hgE+vfLAP3OdRwYiDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773705318; c=relaxed/simple;
	bh=Eojo8S31XBnuESLOvCn5ghJZ9VpEHUyR0OMw33Q4fPg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=p7y2LfqGwrLtCWri1op9ETC5L6JAX5nIbuD5t3RXP27rsN99OProkJEk7Y/N5X++bw6q9zo+pKzA5OXAw7PxB/u/eVsemqzKOWYB/0hXQcRhAekJC0Ujts8J17K3S+wEtwoeVi1B7ifneIzZaDq9ztSYxa19RHoHIVpIeKV026o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=AsnVL5GY; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="AsnVL5GY"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C13CD40423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773705316; bh=Da2jtKjezzeV2ds56xiBmzQTNln7RfSzOl/yBdgZpkA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AsnVL5GYKQ4AGHpSPTl/IuXssRGiyKpFX1MhMpo4bM27p+WEReI/pJCgBBjCirPgT
	 TT+cx+yf/DurJyFKUkt6X5/Ox1XI6fvbIWYQCSGisIQpgC151tbdceU7uaacT6efWb
	 I7vQNhWwvBTxLJiqn04/LOWm5XmTdTKNSixlJpZHlRseYJTUU4ethb2XCy4bWWpV11
	 FojmVgwuRxAH+3nAexDMjgQ6LoJ0VTzDB7Al72jFkCdBuj7I/SdeoHUWr07daT+KmC
	 NaetKtSoF/9lIdlRgGE3ECBqFfSik31whyDFS0Y/ptLSAYLiAdNc48hPbjERF+L0Cy
	 /HZTxzXmWvySQ==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C13CD40423;
	Mon, 16 Mar 2026 23:55:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>, Daniel Castro
 <arantescastro@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: pt_BR: translate process/1.Intro.rst
In-Reply-To: <CAMAsx6e9qqdw+aBGkkU3tDONdAmF=ATiCOn50FMfmd1Mzsfuxw@mail.gmail.com>
References: <20260316212435.19303-1-arantescastro@gmail.com>
 <CAMAsx6e9qqdw+aBGkkU3tDONdAmF=ATiCOn50FMfmd1Mzsfuxw@mail.gmail.com>
Date: Mon, 16 Mar 2026 17:55:16 -0600
Message-ID: <87cy13fhy3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Daniel C.: please CC the documentation maintainer on docs patches.

Daniel P.: thanks for reviewing!  I do have some comments below...

Daniel Pereira <danielmaraboo@gmail.com> writes:

> On Mon, Mar 16, 2026 at 6:25=E2=80=AFPM Daniel Castro <arantescastro@gmai=
l.com> wrote:
>>
>> Add Brazilian Portuguese translation of the development process
>> introduction (Documentation/process/1.Intro.rst), covering the
>> executive summary, importance of mainline code, and licensing.
>>
>> Assisted-by: Claude:claude-opus-4-6
>> Signed-off-by: Daniel Castro <arantescastro@gmail.com>
>> ---
>>  Documentation/translations/pt_BR/index.rst    |   1 +
>>  .../translations/pt_BR/process/1.Intro.rst    | 300 ++++++++++++++++++
>>  2 files changed, 301 insertions(+)
>>  create mode 100644 Documentation/translations/pt_BR/process/1.Intro.rst

> Removal of AI credits: Remove the Assisted-by: Claude tag. Kernel
> documentation requires full human review to ensure no conceptual or
> literal translation errors. As the author, you are legally responsible
> for the integrity of the text under the DCO.

I have to disagree with this; the Assisted-by tag is part of our
emerging consensus on work resulting from these tools.  See
Documentation/process/coding-assistants.rst.

I will confess to having mixed feelings, at best, about the use of such
tools.  But I do not feel it's right to ban such output just based on
its origin.  Documentation patches, like all others, need to be
carefully reviewed and are, in the end, the responsibility of the person
submitting them.

> There are lines with residual white spaces (visible as isolated +
> symbols in the diff). Remove these to prevent rendering warnings in
> Sphinx.

Comments like this are best made inline so that the submitter can see
exactly where the problem is.

> Legal Terminology: In the licensing section, change "propriedade
> original" to "titularidade original". This is the technically correct
> term for copyright in Portuguese.
>  Remove the reference label at the top of the file (..
> _development_process_intro:), as it is unnecessary for this stage of
> the translation.

These too - please use our normal style for review comments.

Glad to see you calling out the top label! :)

Daniel C.: the presence of that label suggests that you did not actually
build your changes with sphinx, since it should have resulted in a
"duplicate label" warning.

Thanks,

jon
