Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51A04A3419
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 18:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005389; cv=none; b=p2SqUIg+yhk+g52AV08CGv1UVFShRTbrxHNgz7Gup7g/6NJbgaggNzGlmUBLP6IBJrcMcuYbfIvTM4oUjjoXFqEen5Jzz8m/lhyiVb2gH854/EWQwBfnswXAUSlagSFRLz58kV4iM7LJV8ck6MMKNkbAj/BkrFK6AEJcDmHf8BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005389; c=relaxed/simple;
	bh=elWym54amaGJ+H496UxkUuCA8BP/AXXnzi+ilbZupJQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pfsCd/ixZA++TF/L5MXb+UUTTq2SqLEWOgdvLhgG5nQ9rzwFYuI1uFDg+wingoxLOfjNecBumGxk2GHr+sQr8E6xCDipt3rkC+JkVitbDcYvpHYWbuJD9xemmohMt6YhS4RyiuBAbQW5dZFdakFI7XkiIzfCu1X98UMX0wxjeDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vaga.pv.it; spf=pass smtp.mailfrom=vaga.pv.it; dkim=pass (2048-bit key) header.d=vaga.pv.it header.i=@vaga.pv.it header.b=QPWzZ7/2; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaga.pv.it header.i=@vaga.pv.it header.b="QPWzZ7/2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaga.pv.it;
	s=protonmail; t=1778005369; x=1778264569;
	bh=JnbKp4jFwvgDhRVP4fnUP8IslF+VxKZMYsgnVgnlyvI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QPWzZ7/2M6qJMs8vetRj4WxQOHWGE++L7SqrDLM7pyqbNvc1olQwzpFUSPF5YT++C
	 yUKv7IgLdMmCTH6d8a1Dcj5EI0hXUk1fhnh1/JcgHWX5PZqa510BfWLgdWxaESfh8F
	 7zEDRI4iizoMnpNXje5c+zgnR99fklum7iO0qJII896/BD+hcXTD4PRuaGNkYGS9TL
	 1f7vwm7xIHD818KgalLdFBLf+DrTAXfc8bYXZWx2A19Wja/wFZ9KwYVmdUzZJ1YBSZ
	 qLlBYfXJ5b8exy/isK7x4IJU0ToLo6K2q35VNv7U/msBayhlmUMjxx+lZbOCwIvoK8
	 u42hQNGxV/YAQ==
Date: Tue, 05 May 2026 18:22:45 +0000
To: Jonathan Corbet <corbet@lwn.net>
From: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: Wang Zihan <jiyu03@qq.com>, linux-doc@vger.kernel.org, skhan@linuxfoundation.org, carlos.bilbao@kernel.org, avadhut.naik@amd.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: translations: Fix "Linux Torvalds" -> "Linus Torvalds"
Message-ID: <iudqx2deqkn7tgnci5img4e2myig36pqaai4mhogtmlr4wbqg5@bnijdnhc4dyb>
In-Reply-To: <87ecjsef3c.fsf@trenco.lwn.net>
References: <tencent_B98271DD90AC356719E15C06ACE473BB820A@qq.com> <87ecjsef3c.fsf@trenco.lwn.net>
Feedback-ID: 124726690:user:proton
X-Pm-Message-ID: 77e9cad57606fb26b2516e55a4ea71cd86dfb6c1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, May 03, 2026 at 08:35:03AM -0600, Jonathan Corbet wrote:
>Wang Zihan <jiyu03@qq.com> writes:
>
>> Fix the misspelling of Linus Torvalds' first name in Italian
>> and Spanish translations.
>>
>> Also fix "Linus Torvald" -> "Linus Torvalds" (missing 's') in
>> Italian translations.
>>
>> Found by Christian Marillat.
>>
>> Signed-off-by: Wang Zihan <jiyu03@qq.com>
>
>The fixes all seem good.  It should have a proper Reported-by line,
>though, and it seems you didn't CC Christian on this email...?

Of course it is all good. Sorry for the typos

--=20
Federico Vaga

