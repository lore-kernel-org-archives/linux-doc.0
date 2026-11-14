Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.222.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794691147;
	b=qsJRVljDuu77vEAL/EHZDYrKGIDrU2mE344tZd7hIMrHxhm85vpF2y2wn68TZthnTFjB
	 UmmiffmQLaoeyRPvignNBaMWgPVLJ2KLKiKdUNFpS04ORPNo1VdnlqMpWJ59suUcxxK1D
	 XSAl9a4+DeT3gyyInXgANGassCrUNbRq9XGN4kPBShWD1dUumi+hV7PqvFI5dS/enFeCZ
	 mZsq3eHiA3+L86wYspN1w5xqmrSOogaGJlZuiLwYWpw1eNg61bff4jeF2wxShm3SMJmd6
	 CbHtgzCGnhRahO2rT6R1jqsO+FOtEEuwI3VifAiG86amFwwV3nEejkiCPDlgCfzKWOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794691147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=jicOixy8WojTbeyefnlFqHoPsgyXZ7JZdBPs4flDM5E=;
	b=YsrdsG+HWs98Aape++qB21eaiE4C86PfHYv6Syby0Yr/pOgvWd24iTlxJ2B3/6/NZVnC
	 1njwmtuyHn/bx760hNUm74kaTwdLhkYJml1otH79uHPY6kthsUXzKefTFgjh2aDAqgcQa
	 zEWp5yIIf7JEwagAzqWwzFboSRCo6nb06/9HhGexWcffDkP+dLoCG9Sb5b7LMNAQJEFFi
	 cJXGSkbrHYn5v9W3dTMzjzusXceOBl1BLcDN7NsZgutpXw+ToL/ATAXqsPTJMGbXlK9oV
	 5TDg3z2uVM+3rSWRd15J7wgAnofVV4yZ2yGNOZzZ5w91x49esjUGS39QCwDrCUmneLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dqXLinqo;
	arc=fail smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E74606A323
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 21:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07E74606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dqXLinqo
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9496400270fso84135385a.1
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 13:19:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794691146; cv=none;
        d=google.com; s=arc-20260327;
        b=NUGlM2pBkm5HNyowySrHbTUay6as5KCexi5wqR0ayhFA/l9s1XMOeZYPyCMYlea0nx
         jTrd9BMiYISmZbwug7Ca/sHvUOr53QLKJK1D0m0nOiZNqeMlCcOsjI71W19J2TeRDRfz
         Qvq409FI45kVkviXlb+1R3s/79vcToQPHiYtzzdgchTWQNlNQS7PvjS/lW20X4y6ZP02
         MM5YegK6I8MTUwoK3pHT0uwyRsGLiIEzL+79K+mybLabiAs9Yval3TYvYcnqadbzk2tr
         Ljh5rKqyBJezGRZ9tNPHWhyzs2oVn+N89QZIo2IP6U6gsuehRk/BP9PDKyCq3U2zS2uY
         /CaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jicOixy8WojTbeyefnlFqHoPsgyXZ7JZdBPs4flDM5E=;
        fh=UpB3aOixqy07PR5vjDco8M9lm+zM8E58si46F5dVP/A=;
        b=ikkfzzeQrTIEapBHxFODwPUUYuWOyKna2reBua3DWhLz7mLHNNV4ciWoII2hd43YsZ
         NdtXca4zUwS+ZiVMebCKtVcR4tCjTsn/+xcBc9M4KWp6dJfMB0zlgBNTh4bfcOTVsb+l
         6YnWlWDmz7spOWpjJNWUBhb74DhqHQxSEzMOGUwqvcJDr5pyg4+8U7JFkc3KZLrvb2/V
         hVvpz6qO7+3nv/ks8BxzVZj5/gfdbaFQYilFvOFoSVMxWmm8jcVf6NT7IKWUN8pCGpmd
         suCXlTwg+bPU5gcS7Q50+24spcZYNISC+nC7pb+U5j+04zsgCAGktRu0VapeqR/909Bk
         Rmeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794691146; x=1795295946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jicOixy8WojTbeyefnlFqHoPsgyXZ7JZdBPs4flDM5E=;
        b=dqXLinqoV3D1GaO5v3E1Izd5SIIeqOHvJWw0UCGVwI5D5Xx0016WA4HTzXiAYmecWX
         J8QM6pzAH697qEi00cA0a3Dy7r09qVJ38JTHX4toJFF76+8CFm7BY3ASyYjaEmZR9KXP
         qFw5Le/ShexNgo87GlIcPdU4CAuAte6lCQwksQVLhKKyURThLOYUhjXkHk/cwpZMzOPp
         QKDHaY264eUbzS4J6smSr7ZwR4J3m9GWnYAHf5NA709tc301Qc/DYoLBmgCbE34fLGNU
         D7GFlOny9IoRGt24DORRxPg07xLWlI1Qdemd1dN+uzcv7LfahM3kmFhpvrsK8wQnjjrz
         2IEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794691146; x=1795295946;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jicOixy8WojTbeyefnlFqHoPsgyXZ7JZdBPs4flDM5E=;
        b=ikQebpFPkm5/bfZSAzvG15JrUCEQaF/SD3gP3UZEA4KQTnrPNlKB8hRwdqYOpQq3Bo
         WmfK/w7iF6wqU8derWIqNJS3hPz3+CQIbJrqHItR1WgxiA0uuQBTXhNqAp96B/+djWO5
         7xKK2+rgILUwah5qnkpauvv6opH7iIxhpa2hCsDTc3KEq2F9mRtX4wbZCQoaGc3ALNuI
         y7OdZOCyFdUwq2/lHJIOv8/a2yqmNyxTXdJk7I95A7oRl9K5veX8OfWD1UX15GlxwSvF
         a2c3d22SSdO1uYILZ9fOeuwkZNUYDheQIU6/BlLY4DPb88hbduMDApjDJg1IpYeZFULa
         WvMQ==
X-Gm-Message-State: APuU4Z/gMb9PN9BlTVhJUvVS/9tHb+E240smJcEW+yiVFaSsk9KU7QBH
	JPidYkRsmqqa2y0tq3Hfm6R03geymQ+zsacPcvoXBheeHHygNxTexikIEhY9ZKXQIo+arNac7bd
	IblP6fhHiCeDgQDl0pEXbcm/6mtpIIdo=
X-Gm-Gg: AYBFou0KMHAsV5Q25Sxywyng4tBumLisHwAgn9BVMYZWJFhIEQEaE25/gz9MM7p0BrB
	skOE5sAzU0P89zYMUq2TteMt9jJJQcnhLHrwnj+MSa+PKm7yntQpUL2pmjczOGUKE+H6E5lgLHc
	PpjDHhIPyOXSFf/Uc31pdNueVy2bDuTOk5eKkpKdVSePfMjr1lX3Y1rzowJErjtzedWhZ5xm3o0
	s3vq8T/VOYIKCZrJXlwDSWvUwFQU5lHy93xF5aTAFr1YIhbgqdCmfGyHzayxFkRfqtCUplcHlFM
	74aMRwLgMujp2ViW6DI3CvJhBxtPDpxvriSLihDh5sDXtO1c3++9LGl6hHxOxuNkhIxdu/I5n2e
	p25Fr4V6Spt7s+tJDKyxNqQWFPtCX8O8x/6dzllIBYXbytGHRERQPuvqzDtRT4PisblRFU5GHa3
	GANN5NJYav6JKk6UMOp/PdbQNXJV/qOfRRMb9xHA+wW4VprExxebirZ7rQ2csgzv5dnTEUWl/sW
	BvvGHd0ChoESGcr2jkDvg8cghnWPA+wiTnftrOx4KIw45Hl7lMChw==
X-Received: by 2002:a05:620a:29d4:b0:949:70ec:7e9d with SMTP id
 af79cd13be357-94970ec8db5mr196827985a.14.1794691145881; Sat, 14 Nov 2026
 13:19:05 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113160153.216027-1-ic.gabrielribeiro@gmail.com>
In-Reply-To: <20261113160153.216027-1-ic.gabrielribeiro@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sat, 14 Nov 2026 18:18:54 -0300
X-Gm-Features: AclHuK96omU8VBYd6Kei0gbAR-XQC3yfGNQMjfo8eHw_GJ7QcfWCe_a9INHqobE
Message-ID: <CAMAsx6dpp5RGM3FwS2Qx5ojbJoA-rbs1Mh83bqif28LcpTwXAQ@mail.gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: add researcher guidelines
To: ic.gabrielribeiro@gmail.com
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 01:02 PM, Gabriel Ribeiro
<ic.gabrielribeiro@gmail.com> wrote:
>
> Translate the kernel researcher guidelines into Brazilian Portuguese and
> link the page from the pt_BR process index.

The Signed-off-by line is missing (checkpatch: "ERROR: Missing
Signed-off-by"). Please add it.

> - Declara=C3=A7=C3=A3o sobre Drivers do Kernel <kernel-driver-statement>
> - A interface de drivers do kernel Linux <stable-api-nonsense>
> - Estilo de gerenciamento do kernel Linux <management-style>
> - Assistentes de c=C3=B3digo <coding-assistants>
> + Declara=C3=A7=C3=A3o sobre Drivers do Kernel <kernel-driver-statement>
> + A interface de drivers do kernel Linux <stable-api-nonsense>
> + Estilo de gerenciamento do kernel Linux <management-style>
> + Diretrizes para pesquisadores <researcher-guidelines>
> + Assistentes de c=C3=B3digo <coding-assistants>

Please keep the original 3 spaces and add only the new line:

+ Diretrizes para pesquisadores <researcher-guidelines>

The diffstat ("index.rst | 1 +") should also match the actual change
once this is fixed.

Thanks,
Daniel
