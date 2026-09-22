Received: from mail-ua2-f28.google.com (mail-ua2-f28.google.com [74.125.226.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADB83E1D11
	for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 14:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.220
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087738; cv=pass; b=msCOkQXxAE7lAW+ip3/U+Spc4JIsvl5vHMZgEZSWdGslx46ewhz/JZo407RGofb3/vUxoCL0a32w1u8WazBzBVXy2gCzOQfvXv0DKJ1EOmnKyB5Gm3IOFyrUmAPds+BG1ePi1p0J6FbAyP0SIi63moFqAQLRT9CfFR6OeeWHIk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087738; c=relaxed/simple;
	bh=hDy94WcuIGtpKVjdK7YmV9Ul+yIgKHdRmumOIolOZmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W7183s2/faKn/0ZaM/QJ5hhO3MRWduwQJ+xNXZg8yYZdTFIDLlwPFCjj7jE5mmDceABs7zPxb6G5UOnd+N4tRd8mQwPvB9vZSvKg7JlM6FYdZYeL2BTzHX297t2c9asQINyDQZSQ7ZGCNU5lOJ9pHqSBEW1Th8BYQ1vjC6RhItA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r/fsGBtt; arc=pass smtp.client-ip=74.125.226.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r/fsGBtt"
Received: by mail-ua2-f28.google.com with SMTP id a1e0cc1a2514c-97e7c796e3aso1208064241.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 07:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790087736; cv=none;
        d=google.com; s=arc-20260327;
        b=s8O61ajeirPRSliAJEelJYlqSok5qO2NIs+IrnhtVJaF/dNOASgw122M43fqaM7F6Y
         AENvcF9Ot1f2EU6Qyrta7hT+FaprD/w1QDV2wLj5k67jm++wzZOsfBs6t48GCdCgC+IA
         d4oPxdH8mGD5N6nN1qFVxlngXP1USCQ6cdqlwOLHES+tyqBE5KKFlIla6S42QNMmvn37
         tVNjLbOi6LDdKIbf1FSS2HJQISRWiwz3rHAuhf5Pvk1JN3dIIOuCyxduFW7BnemMJeZz
         Ka6H5YcG+FScLeWZrA4gtfuXR/iyhbHgY59yn3WE1ej2xhfKPlIbeioGsCuAIHaqWKNB
         TpOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BkwKU/k96wk8bIA/BnamNqyLU1VqFIWHcsHLmQnVQJs=;
        fh=UCzEwBPcHNgeOU4SmaedJfffrTSUz20ZI0z/mA4+BYg=;
        b=cAA2iw4tB28+j+1vqJG/plDyg8ynAWYQbtkVbn/wXrR5mP3JAzwhKfuesQmVDLGwDG
         +bNi8tyDCv9QWuY5YbitjQj24ugrWnLwHMsf8qwvxJt+SN+FyGkRjdGVN8BbuVVElGBk
         F8Ok8mKyBedZUvYpOmXOBre3FrvYXqvJU9Bt1/wh8LdOPUiwsJQ7QbkJCSMWumNEl3wQ
         15S83beG/WFWiuPvn3ItrhratBXgyNpn0EJOPx6L37XRrN3dp4KpA1CWENgn9AqzrcKh
         Ky9JA0wmW8apECJ2AWb3zeSSqYWXs8/sLf/U+kIWViwZPOyAf08urANSk0cMr8+yGq5M
         OOmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087736; x=1790692536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BkwKU/k96wk8bIA/BnamNqyLU1VqFIWHcsHLmQnVQJs=;
        b=r/fsGBttzfUURMeIkcaWuElVmA+ej+6IUFBSt+HoizMiZwJUFQ5mXbwPpuD8ApbPmC
         M7RLRRM8yDEbT7bVRYl02RI9tGams9LKArEpTZ7OsnsDkya5kQm8O4WdUdqCbzvdBOP2
         rPYHdRnOqM8qqCdOcUvr+q+2dejAEmqAsZC666I9cneHvERy6TuZKa+SXbIAlLso0xf+
         tbvOY2aKbHEz657qra93Wa2Q4p36om4CSQVlx6wzhBHa8i/Eq80xg9TU9dVIh0dslii5
         Ri9Mg+3c5ckL4ixqfx7eqa6mn58kHX24UEZm8nS4aydVzlSCaIwzGyqWGR2rxphhoaB4
         qnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087736; x=1790692536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BkwKU/k96wk8bIA/BnamNqyLU1VqFIWHcsHLmQnVQJs=;
        b=DRIv1b8TqzP6gLcHs+ziJoNKxf4jxndRBMWyIaWsIf3/VpO2M5PPY8DcXbrw8hV2WM
         vbjGeBnA44achtEApp+wcYXB0H+PzSqVNWzgAfaUg2OQwf5k4SEu7pvDf23cjkmw9hQl
         UQN1bXS49cOmKITwj8b8jAob+01AaErSv9m+h4wE5e1Xyig161JhYDz+w1pipiP+zPqX
         D+IYRoKLeXTfjyl8tgj3VLbhtWr6zvNQzGMkbwoQSzwRG86LakL5ApUW9cOlCNWxtf9A
         w3ofS0nJSx3TvDSNolokzV8T2jiW1/LkHtr7XHOJmNE6vUd/1YWvgVkUoZKlsr0LuA89
         ZZ7A==
X-Forwarded-Encrypted: i=1; AKwUvBz0LVzFnsybimm6yk3Nq7SQzfJ7ey0qR01qnK7HJ9r9ShB3ChcJ2rZCco/p+hnXhB3+mzVG85jdbBc=@vger.kernel.org
X-Gm-Message-State: AFuF++luZs6/tivBm7qYrXYbGRE4NR0MGWMdONJgV0xgILASWldwMwIn
	qdjhYesA0WOVr74gFsl6DSnsaMg5ShLhn9HfVfsLFhAKw6hAkEFv4XQhw3mnQ1SSthZW+xqXlAm
	MElyQLeVmm+QqdnPuoTxJ/R23otVAlac=
X-Gm-Gg: AYBFou3r9iJtF8m8euvfCeTKUzZLw+NLdtfaPejxg3+Kjiocd46oy9J52Mn5jP4Vc0r
	1pxFU0bC2MjXakeVBZyCQISPePrDFsCh2i75DCTfN/8yTj1NMp9SYXVfIiBUCtTvW3dF3lqISw6
	LN2PMlJHLTLzVsjz3Q3yo/xS17+aYSbKlRWnWa5Ok6r7fJfhUusADk8XSN+39YZ2KBziA78gpBE
	WZtDDNoS5eQbAAVamLc1FX5JpfM86Qo5ucgRJFynPZRDk6d/ZJkzSw4IMlbRXFCGnyEbX0qn/Em
	3cBFj9ARqKDO/w7h0ty6ZG27xIAr3ZXW0kXtAPzpA3ZdU/B7vny7DX7vNY3Xv3oj5KvmLLIOs0S
	d97mm8hCqATsfoDp9fJ4dHxrAeG3bXyh17GZTWe/BT3TInwOg4KMdZP8saTD+qUIo5e5Txg==
X-Received: by 2002:a05:6102:4bc9:b0:7a6:bc69:5a34 with SMTP id
 ada2fe7eead31-7a6bc695c4emr5597229137.22.1790087735769; Tue, 22 Sep 2026
 07:35:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922031247.182335-1-vinicius.m1821@gmail.com>
In-Reply-To: <20260922031247.182335-1-vinicius.m1821@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 22 Sep 2026 11:35:24 -0300
X-Gm-Features: AcwNN1V3Y0-bIN8uQK0ZGfTsLwYw3XWafCH-NgCxj5vT71QyY6kLcoyP6QRUQRU
Message-ID: <CAMAsx6d8B=QXh=CG-2bd3gv6mccPsXxHnhNJ3DT8CQZiVfQNWw@mail.gmail.com>
Subject: Re: [PATCH v2] docs: translations: pt_BR: translate threat-model.rst
To: vinihsr <vinicius.m1821@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 00:12:47AM -0300, vinihsr wrote:
> Translate threat-model.rst into Brazilian Portuguese,
> maintaining consistency with original formatting rules for v2.
> And add it to the pt_BR process documentation index.
>
> Assisted-by: LLM
>
> Signed-off-by: vinihsr <vinicius.m1821@gmail.com>

Hi Vini,

Thanks for the translation. The content is complete and faithful to the
original, and it applies cleanly on docs-next and builds without warnings.
There are a few things to fix before it can be merged, so please send a v3.

Patch format:

1. Please use your real name in the From: and Signed-off-by: lines.
   Documentation/process/submitting-patches.rst requires a known identity
   ("sorry, no anonymous contributions").

2. The blank line between Assisted-by: and Signed-off-by: makes git ignore
   the Assisted-by: tag, since only the last paragraph is parsed as
   trailers. Please keep all tags in a single block:

     Assisted-by: LLM
     Signed-off-by: Your Name <vinicius.m1821@gmail.com>

3. Please add the SPDX line at the top of the new file, as in the other
   pt_BR translations (checkpatch also warns about it):

     .. SPDX-License-Identifier: GPL-2.0

4. Notes about the version ("for v2") should not be in the commit message.
   Please add a changelog below the "---" line describing what changed
   since v1, and send the new version as a reply to the previous one
   (git send-email --in-reply-to=3D<message-id>).

Translation:

5. The index entry says "Modelos de amea=C3=A7as do kernel do Linux" (plura=
l),
   while the document title is "O modelo de amea=C3=A7as do kernel do Linux=
".
   Please use the singular in both.

6. "unix domain sockets" -> "UNIX domain sockets", as in the original.

7. "...de forma a permitir que m=C3=BAltiplos usu=C3=A1rios locais obtenham=
 [...] e,
   quando o hardware subjacente permitir, atribuir um n=C3=ADvel..."
   -> "atribuam", to agree with "obtenham".

8. "a=C3=A7=C3=B5es realizadas no namespace do usu=C3=A1rio" -> "a=C3=A7=C3=
=B5es realizadas em um
   namespace de usu=C3=A1rio". "User namespace" is the technical term, and =
it
   is already translated as "namespace de usu=C3=A1rio" in other pt_BR
   documents.

9. "bifurca=C3=A7=C3=B5es n=C3=A3o oficiais do kernel" -> "forks n=C3=A3o o=
ficiais do kernel",
   which is the term used in the other pt_BR documents.

10. "Hardening" is translated as "fortifica=C3=A7=C3=A3o (hardening)" and l=
ater as
    "fortalecido contra entradas hostis". Please use a single term, e.g.
    "fortificado contra entradas hostis".

11. "tornar o sistema irresponsivo" -> "tornar o sistema sem resposta"
    (or "n=C3=A3o responsivo").

12. "vazamentos de endere=C3=A7os/ponteiros de mem=C3=B3ria do kernel [...]=
" is a
    full sentence in the original ("Leaks of kernel memory..."), so please
    start it with an uppercase "V".

With these fixed, I'm happy to give my Reviewed-by.

Thanks,
Daniel
