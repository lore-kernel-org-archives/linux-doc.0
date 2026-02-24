Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A05233723
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 01:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771896191; cv=pass; b=lsxQfFO7mdZu+z5NqyW1aOGiOqVM/22AwxRZb3S4D4/p0LI71BX43oVi403CtwX494H1sC7NGixIsi3XsA/pXv1aStRNWKOO9/VXFxdrj53tGTk/tMdHzSmHMgeAa4dmLT8PyieZvhIzmaSLoUTB8mecSbTrk2+NKermPXQ7w+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771896191; c=relaxed/simple;
	bh=N8/JCjvJT+t7nzkUcJHM6+8bdpPOinVBqaOw6a34BXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uqKanUqd+N+itipbGC4tHFK0yxlKW5e1qlrQIXiPPJZyovp3lsDD1tFKeoA0W17k65vHNxOql6pEDPkU8mAsV3yBNMUL8Oa68wYY/lB6wkV3tfaNWqLv8IcHySIFo/nj5u95aWl5el8pXteqyrF8RbQcPYOEThuttXsp8Z6rqb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGL6oijb; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGL6oijb"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d1959ba05cso2292275a34.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 17:23:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771896189; cv=none;
        d=google.com; s=arc-20240605;
        b=f271f9HYfs3qCKDd/l5Sbk31XJb4TUFRGDttTEgj5+/+KV0qWOi7gjavOu9UhUzbz9
         zBkUU1aOeQu9ucgIqvk0leeCWqcSMaJ1z56tSAJWCdiioJA2PNcgpMQWeRwgiWcV5utF
         LFXLOfWR4KwoVTeRPwhRNTtLmWkrdoCP7nM2a+XWw7JmJZP0KtEynSjjRH0t7TQrIuHw
         nSDTIqHzWhbhJ2Yg30Wr4PMKPnc+WCwyEl1pIkEAi16abL3wMRDA/KWB624q9vM1cHwR
         hWfVJdUDoh6qnCIQHXi48DSKwJJI0GMyIIsq/afjo0caYYzACd+dGSMAIEw2dQoYfROQ
         /LWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N8/JCjvJT+t7nzkUcJHM6+8bdpPOinVBqaOw6a34BXE=;
        fh=MrEuju4FK4iljCFH2UsbVJfCW/CGquxOlTBW2d+x2J4=;
        b=OG6Aq7QktY0AMngFY07njQLPLkzRcxfacU5a9/33/xO1xP2CjUROTdxaFps2ZwO3io
         Y43Iaw7sKfCqyw2k5QL5GBoj0gdrb8PP81bQ2I9rUtkBFmtdDNny87ILU8rv9EwNUpbG
         0juRKLNR12rqIHvKWs5OZK/1g0nL2uMS2wmGfTSfgFo+UGaMw2f3FK8mQUtT/fbzDqJc
         PW3xleIMnhuoxJlWMv0UJEHJJSs4PdMXpaJJaVYvmsAAFv5jwgmO85ncDheiauBwq8/0
         ng2YR7x9o2y8yoFaYEDimMTvG2xPTXvtqTThL9YpXWJOILijt9nEuERMZiAvIu6sv/nV
         cm3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771896189; x=1772500989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8/JCjvJT+t7nzkUcJHM6+8bdpPOinVBqaOw6a34BXE=;
        b=VGL6oijbLvceZqNaeK0aUt4kUulvEjOqahAMlat5O58M+yeWHirdqpHuLcSeoHu/wt
         L4Z4BnzXPS6Bx7oEIc9e4LYo9AuSOfQigiue6lY5vNnQRkmHfkNCiljB25B6rdIvJlrx
         KhhDDnFGkTloAgHibsZKH6k2JXqed7hJNEPzou07etjcnR6p20gabPfrfFg+8OpEeIv/
         3FH3x9RA+jYd9pYQTvJY7ZKd/gY4r9Eyr6438hCf/eGTcGtSNxH5UCP46pqjbmzAYt5W
         7U/BDda2pIwy9/Tg35N2KhHNxS0w6a/OQjHEVgI8q5JtDBEdwtGxDGsUcv/z1RanK62e
         Ouxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771896189; x=1772500989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N8/JCjvJT+t7nzkUcJHM6+8bdpPOinVBqaOw6a34BXE=;
        b=kMSSQ86eOr4It7ag4gLhiRxKjMMIjnMn2Xa6DrvgeIeAgQ1ZZfvubXkYKRjvhPuc4o
         3PCGTI5GVh8nmV2IvH34Ka1Ohhzt9n+KE53A12y/5/NyitKXaraXKWr6EISaXq+/HOxo
         MdS2qPVTXaTIdXnoHpkZubq8WIUMlAv9rLG/cqGRBW6ys7khCdLWcaaxRK6SxI0WZTg9
         YcKJspM2PoTBU+tCEr62Xpr0kL04wsCwHRF0AvJya4vPRepjbUKU9puzwB9XeHvHpWCL
         Jk4Vocpdeouq0qyQFHdcJCMlFckeyK6mMbaI8neDxYcSeC/gxr//h0LH8PKyMGmkZ9s7
         QK7Q==
X-Gm-Message-State: AOJu0YxDM0qFt++BubToxTkHhpu3BcxzSoNgUnEla+tgdIrqyVMlqC6p
	YyRbaCZgDFRJ1RP3v+4Rf4IVKcz00qv1bWtTRykj7qZqi7GTCEbHIuo6BBhUSBEFOPIX8k8QQtw
	K3aLNg4TQFT+6qoTF9U71W9vOkowKDkM=
X-Gm-Gg: AZuq6aIKHvnFbcPVV16kCtOSNqobG4CsNrtwSiRlTQ4pDZj1OOJJF1fXzM3R3iQ7k5e
	Gpsy2HNxccE9lg178ZZv/DuwOzH7UGu6ZJqxT6h0u4QwbW7opegJFR3SxhNXOLLtnkUtWBWXwW8
	YTuz68Bcag3sSGaAOjqiDgKuWC29HTXPZ4M19Fl4jCeg/TiLurWG26Lzq22FZ3u286Y+hhRxf8n
	wvohDzimlEysCv+6I7Ak16PkV1bEz/1kz4Xwyun3b8fQOs5c9qcJpUrumslnvO46cxz0gmsWef7
	SW28BTQRgMPolJ+JmzwsJLzgU8TNvKkCItT/u695Y62iNTPKOH9xi/hcBFtepzz5bOU9FC4SXvf
	hXRY+WtcD
X-Received: by 2002:a05:6820:828:b0:679:be21:1c68 with SMTP id
 006d021491bc7-679c4700f81mr5257589eaf.51.1771896188962; Mon, 23 Feb 2026
 17:23:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223234523.50960-1-danielmaraboo@gmail.com>
In-Reply-To: <20260223234523.50960-1-danielmaraboo@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 23 Feb 2026 22:22:57 -0300
X-Gm-Features: AaiRm53D8pqfXIuDYAkv2LWlDOIR3uJ8OlHH027FcfjxDjyyAWRhDo8FS9Mmr9k
Message-ID: <CAMAsx6eszfnzdCBppXNFu_zkASYjLpjzHM_yB0g0mYXXBbCYuA@mail.gmail.com>
Subject: Re: [PATCH v4] docs: pt_BR: translate process/changes.rst
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 8:46=E2=80=AFPM Daniel Pereira <danielmaraboo@gmail=
.com> wrote:
>
> Translate the Documentation/process/changes.rst file into Portuguese.
> This document provides the list of minimum software requirements
> necessary to compile and run the Linux kernel.

Hi Jonathan,

I just wanted to let you know that I found several blank lines when
applying patch v4. I have fixed these in v5 and will be sending it out
in a few hours.

Thanks,

Daniel
