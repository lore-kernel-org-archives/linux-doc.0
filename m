Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223B23515F3
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 12:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789562791; cv=pass; b=uxzqxcHtEy8SPSjKdcyr2nUIgVi4cCQqY2pMmbWPa6A5Z0MZ+J+yZPJvttguw79i4UPV7HIH0osJWrf0sdjcOU+4D5CKSytvWZkmRCY641h6mKTpRLESpB8gPVYgQaebv+IyIv3yDWzTRGjIblBcPULgLrMbTNJ5jBuoVcTUD5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789562791; c=relaxed/simple;
	bh=YWHIeJ0I1v0espp3H0KecDUrdwjo8I0plqipObYtH44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pP8d1FWhzUP1lxEeDqz7meM5wQloRYJ3URSRi5Ve8oHMbWmiG313jNfPGg22zQLOS3AXh8goFWuF63LCtWY7V9apX2vUW1pN7Kg+5a0fE5bCzL0enMe9O9hoRXbYfv3kRq5cSqbQd7DRVxIY+WfnxNofaM/NltYHoNigQMhM1f4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rN3GT4eR; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rN3GT4eR"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b79so836209e87.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 05:46:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789562788; cv=none;
        d=google.com; s=arc-20260327;
        b=Ruh+yAFPF82qKF4Jh7EnZd4rFo8a31LpdFhdOKe1VRL3qQlkZ1ZhprG+ZBSH3lQl0p
         c+RmJ4akoMc7JqYpoEi5ONOgJjxrvVZyAbKQjAXzDDj9+bBK5YyMfHVU5iqowByU/q7v
         ShM6urIXvOxwWiG+IznSGwh5ORKbSx8ZhirfssohA/KQviBWIC36N/DY04dEYG6C9a67
         pmmZH+kF793id9grVxywbuiHQr7DO41LQ72sBzeOv1kIc54huraYRsOjtqTzkYqlAF1s
         3LzFYPc5SQfSYlgpXwb1mg5zbO+XPjbxOvuYe4tmDQzuxPIKgpo8ugKpQ5U+C7CY/9yQ
         w3rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YWHIeJ0I1v0espp3H0KecDUrdwjo8I0plqipObYtH44=;
        fh=4Gf4s/cOyv9qqled5e0Rx5gwwhFbqV5JakMq5MTtzYY=;
        b=e6baJe2iTMxdHC7FZeHn4RHohRzIWrZT8C5BM1bgJ2PJmltvuK5yn01hl/wJ/ETqNY
         6O9sPSh+aR1yJGK7Aip5Wm6unsQPO6zvMGe92NWmF9BdO9RO+Ejdph75cY8s1pi+OiDB
         zROkHK4AjL0RCQGCOG5peaMRsHrl8Gc3nWwNyyb5/okTZIafzOaAnbnr6zpq5G8BeHOr
         5PIXT4FLnVq+okdc1QKLLbEdEORW5zhEZqg5ve4LYP9v0KWHIvRFrfIn5DLKJTctvvmW
         W72VQDtnXMjmlQ+DGGlyBO73o9X8gNJXYZO07Ah8TYvYoOYdHPfvJn4lNY59ti0mqxem
         JGYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789562788; x=1790167588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YWHIeJ0I1v0espp3H0KecDUrdwjo8I0plqipObYtH44=;
        b=rN3GT4eRL06IuNrj4EaFL/IlpwjWkodUnTh90KnNrnPumMIzi+j+5OqyS7Xzg5TdmB
         PKZbFnIY0krPkfr6HYm4fFN2kEMNc0GmJFCehqO6NJYPmIC2JGx20IgbEM05IDUWGHUe
         jFYhzmgLnNtcCGIEFNC0WSGLXCe3a/DQA/LYZhf26gsmyUeZD6xMNHJM62kP9Paf3XBl
         tTtj2BataGk0FvdByhtBNArNDHwEJX/0NmA9adkVdw9aJDTP1XSdewMdYyhqYmHMvHjZ
         inYrk8RKW5SbBTvYLkyBFxnO3ERcMoQWvc1WIpARsffic4fsJA8aZsECVMLDT+Vdp6GM
         PzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789562788; x=1790167588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YWHIeJ0I1v0espp3H0KecDUrdwjo8I0plqipObYtH44=;
        b=Eagm4yos0TcFyqiZnkhNSVoVlAwzsDVg6oROQeeg/JIlafnmf5aXjF9CHHqbgprRfe
         IDiBr9LgMgeN1Oia+IvO0xU38bu1xCjU3Nf4fGC5uIXe0Rzi/ElSSxc9w2MzZzpwF5lD
         FK5e9rPom1zQOY547LRMdYCw+g7NIH9sswc/kx6iK6E6kJ+Xhd7xlbyHjdfGADl+jWcr
         ce38g06OLn1Mmz6xYyqk4lh6dG7Ryy/5Iha1TF3EWaoHi+ylce0xLpLcg5Q5MT5d53Jv
         Lv+WER1JyYQMvISmhxhKS4lvVToOVazWujuMbgckneHaSwEtIvRGzTya02ZhsdeGTWHj
         dMGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxt4/eeFM8oapYmACpSyM4Vu+Dd+eAnSaa4ErUtvwHUu2IhjlfW+n14Grrd0/GOWEFWb9K3oyf0He0=@vger.kernel.org
X-Gm-Message-State: AFuF++ntSbKE5wMQ2DnO8bDX86ovWNSnZSux2bqWjUUA4zFBfHmtO2/v
	u7zDh+NUu+o4peiYTMFr2RHPVmLG98cY5ci8hengrIB+fdZA0b1vt00Cz+iIZPzjLRJEtn7RT10
	dSVU5gqo4VtuOnqtqrYbeeWq4Ac4KYPTHRV4vo/U=
X-Gm-Gg: AYBFou0pdJ59kg2CacpirlwnLo1TOMvuvJDEW98aT6u4OizVDBmEhQTnt4wmRp++U20
	WYP9ehAbVRv+NdwJV1OYFuUYXFWhTCMFq5ki6i9sEFuf7FJfJtK1duSTShMs1deyy/w/b5z+Iqg
	RrWygqbfeKU0mwnO3E3CYBbhcuPP0iyXPpTb3mAMF7LczT8r5qppdPGv79Lg96jvJXfoxu4JtXP
	y5OZav85OUQ3vJUvavQO3HE70OJScHeIPmWEhxK0umICi7hUMgB8FNDtdXbS6co7VsBAJeO2Uad
	brIKKVkzn0I3vVRcoeLar4zBfz6tzvO5PWT1FSuuWvzMAcatiMt0Pn6GKwwurtDUwlr6dS5yOHZ
	Y/RfFAY0NlXHdd66i10bjIs49G3FswFH0M7FIZhOp+nA5uO2YvkigS8w0CgqB/McwIatx
X-Received: by 2002:a05:6512:ad1:b0:5b0:23b4:be97 with SMTP id
 2adb3069b0e04-5b8b660a9femr1322851e87.6.1789562787731; Wed, 16 Sep 2026
 05:46:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-ptbr-stable-api-nonsense-v4-1-0ef5e58504cc@gmail.com>
In-Reply-To: <20260831-ptbr-stable-api-nonsense-v4-1-0ef5e58504cc@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 16 Sep 2026 09:46:13 -0300
X-Gm-Features: AcwNN1W_zJHxuzAnaqcw-sN6wvhG5SctbHt1TF2qFBrLs2Cvll_dgxM-Y9xAZzU
Message-ID: <CAMAsx6dyL3o6LsG_VAhKi6DKS5LTPXHMFnBaS6QhA_zYCOROJQ@mail.gmail.com>
Subject: Re: [PATCH v4] docs: translations: pt_BR: translate stable-api-nonsense.rst
To: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 31 de ago. de 2026 =C3=A0s 20:26, Lucas Adryell Ramalho
<lucasadramalho@gmail.com> escreveu:
>
> Translate Documentation/process/stable-api-nonsense.rst into Brazilian
> Portuguese.
>
> Assisted-by: ChatGPT:GPT-5.5
> Acked-by: Daniel Pereira <danielmaraboo@gmail.com>
> Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>

I'm fine with the change itself, but a note on the tag again:
coding-assistants.rst (line 48) asks for the literal word "LLM" rather
than the model name, so this would be just "Assisted-by: LLM".
