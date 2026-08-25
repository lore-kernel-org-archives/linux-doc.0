Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BD34734E5
	for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 13:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787664108; cv=pass; b=mtcqiKQkKy3w96FzHvTSWvwkM9bDhEiwCKLlQHR/D6z07LIh/yehDiRspIdl4bGK7rDBXnqt+bYvZaEGpJgleNWRwJUkhohLPoR6S3jJVh+CRRq97hdPCLfZf1oveDIw8ji2n8zLnMCh8Tx/UzKGwg5r/jDykzBVe5PRxHKNo28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787664108; c=relaxed/simple;
	bh=rGnV+DzleLZLGDgYCh6fqbHOhz1i+uz8fr4FdgLezJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VljNqRNVtupGdtFxJKEakZRpCmGH6RIgVz6sy+6FE5ugZZlGSOzwpsjMe7APzuVhofRPuNIPbzr6gxgM2IgFAKMCyqo6hRYwdKxUOiJ1OmIsoHGca6gNO5r7anFvxs/RfRsY/wGjmODxGX2PynCSTm1hM7Z6d1o7XKaLDvc+J+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zl8IlPJl; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zl8IlPJl"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8ee43b3e5abso28328666d6.3
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 06:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787664092; cv=none;
        d=google.com; s=arc-20260327;
        b=gWdg2nIgI+rxKfude5JuY70OfxpSaioar+WvkkhsTYATUuCFVnEpRJ2YSYynjPyWaO
         cr3+v7HlXpBsAbPeO51edyltMwPKhnnehpIjos2eWxxCADQxE4BakeuSNEEM28XbvSSM
         xXa/0bY0tIDfptjcHbBGyq1fGGgScpvojwPaANTWukK69/YEdUo+/ApxhdnsaacW6Q2M
         OR4oF+GKbwridzDxQzw9V4o80xkoFvnXRw0g8h3HhHHcgOGrDzAV5vcQ/dRqlGPBeEks
         PoG5gv6EwdgRDnRsIXiwoGaH9/SjC72PtG8HkRKRxihPoZsC8VmC2JDlmaoE+kjdSjum
         Fl8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DDYfY/x6HAEZY4cH+uJoPK9XDjtciPCOODlqT7J88A4=;
        fh=mrM+nzA3vCyIyo4kYKSq1rbgjJhFOG0akz9aZGWixww=;
        b=pc+jbIqEKSHaT1VW3PdWLKoLuWn6Fj7mq0gwnYA+dmi2Bo0SXSQTqDqjqX6CX4mOyr
         x4b9XG8gRJJAf6GC8Ax0bUBakjNp+o2klnTTbnq4TPlOOK6+cVU5n9Z/w3m55HyRo492
         nmkV5P1EvxJMyVfiC1QMGfdBi0D5QB245+FsbuKImdmhXekT1Auuv2GeK+DQomen0POQ
         sqBtygDsNbMccJEOkTJajPkG39CR9t0VB0ph8IH/CPz4sudX3nHzy2WwuwXONyineHUB
         zO8VRnQafBMDUstygVrAgGu3oZr9RCi93dFNwspDMJ60gw8Dx3iDCzZCjLuw2vnlbSd/
         G2kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787664092; x=1788268892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DDYfY/x6HAEZY4cH+uJoPK9XDjtciPCOODlqT7J88A4=;
        b=Zl8IlPJlmEIsJI2DCcgztV6JhgCPgIc7AC5xKaJ9fpYdw9Y7ijyxisKts1YASboJUP
         lUd2AdnEOtBh+TWLvvx+Lf2rGc5ou+gmlsTOwpW3S97DJS9Koyg0L3HUDsgYreoAPIas
         WsGdD8OoIjm3OE4iUGu6/hHKqUiQIW61UnxU3yY10MVGSRBnBW/jXuOmRQNhWoe3CX4B
         IojP1NEUHhnKa2XSabsUkVCMGkfOqdF8FaxBfwKcrEZ58zUfE1nshrj85JkCcsayUM7k
         A1NfeQ38KnyotxuAsMIp6rnjc5D6wk9EoC2iQ8f4/t33qEfnJwnNnBDvI/7nrsOBre+t
         UApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787664092; x=1788268892;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DDYfY/x6HAEZY4cH+uJoPK9XDjtciPCOODlqT7J88A4=;
        b=b6CMXJsMyKfrbEBhO7i3VjfVqQ8MHSoDVT4EAn2XPpJnCTfWpYpkMgdNmCmCXB0i28
         H1mnltM1swhRVygfoiWJtypy8lsCzFCCCT5YH+jWpNDfpCT7nmbWVUebcvLUTqqIIEPd
         6Lju6EoFppkqatgydMOS6ypvFsKvxr0RpPhf62Ljk25caZNfFVfJcN7H/fHFN8JZLX/l
         ByYai8yswiat7wqr/8hq/UYVmYJi/9kv2N1/mMsTfH0HXsPVHKlXXNu0ofjHLxwDbv+8
         37JNOAMalVqChE4TZSVZXcR2GJc/2K8TqzOuAsVcQHDa3G/SzmEBbU5QJ+0ntj7IPZH7
         J8RQ==
X-Forwarded-Encrypted: i=1; AHgh+RrGjaGcMmnQVlj/eRBYV9I6LdwEOlDStiTggpesqZYjNf+pVV1hI/lTHvMnAU1Ts7y5Rgz4OPD/flw=@vger.kernel.org
X-Gm-Message-State: AFuF++nH6921/HuRnlg6/8TBAr8m9h48QyKMI6TEJipfv9FESP2hs1hj
	SUZVdxGbyXRRQMKoND9zWaPryd04fprpkpBshODzKhPnRcDsRr/uAKifNNumG1FAaOk3jOt433z
	EmrAmCZUqtqEEcpTxW5h9QBbrfA/cAk0=
X-Gm-Gg: AR+sD106F0Nu4CfXCl95ROomZ1Sa6KmpA2oBdkEY8N1TE8nD8/rvzKTmdZPfR2Qqi/h
	qb+Wgg3kQXomELZS789Xy7BS2uQNFxpv+vY++pNz7H6m2bvhr62aLtUbDRTpXoL5P+NvPoo1DLh
	pyLPyknaBIrB0VtiAJo9Ys6vH1GsFIdftLNlBeEhkvyVM8XbQKCNznfKmwcT82x2rYIMGeMPciX
	B1O4mPkTha2z95E+OeTFtw0g3ZThAqOeO3qSESMSy15ujCb38RbP31kOGCLeSVpBvEt8DrOFkdF
	k2nxo88wi4tgGb81QIvbbaBoM1cUPONgTRsGI8xlK9yyze4kN1Fb0coMM772k4WNDIHs3l21mii
	9MfVaqV8Bp4DMkLZvJVxvVl1VSqdpQEsWYxoyZMzqtEAea2p4Fribjxd8nw==
X-Received: by 2002:a05:6214:4304:b0:8dd:4979:4b19 with SMTP id
 6a1803df08f44-90c80dbf980mr403997976d6.13.1787664091528; Tue, 25 Aug 2026
 06:21:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823-ptbr-stable-api-nonsense-v3-1-58c9beebf9bd@gmail.com>
In-Reply-To: <20260823-ptbr-stable-api-nonsense-v3-1-58c9beebf9bd@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 25 Aug 2026 10:21:19 -0300
X-Gm-Features: AcwNN1UFumBtzjimnXeeVB3HFa2sShVcDY-GoQdnVKF8WwVXYaIOzAmoH7d51FE
Message-ID: <CAMAsx6deFMUZF164J5m7Fujxsno0eBm4EwmC3eRHu+odPASaJA@mail.gmail.com>
Subject: Re: [PATCH v3] docs: translations: pt_BR: translate stable-api-nonsense.rst
To: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em dom., 23 de ago. de 2026 =C3=A0s 10:40, Lucas Adryell Ramalho
<lucasadramalho@gmail.com> escreveu:
>
> Translate Documentation/process/stable-api-nonsense.rst into Brazilian
> Portuguese.
>
> Assisted-by: ChatGPT:GPT-5.5
> Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
> ---
> Changes in v3:
> - Remove blank lines between bullet points, as Daniel suggested, to match
>   the style used in the other kernel documentation files.
> - Link to v2: https://lore.kernel.org/r/20260821-ptbr-stable-api-nonsense=
-v2-1-f07df4a0fc3b@gmail.com
>
> Changes in v2:
> - Remove the unnecessary top-of-file label that caused a duplicate-label =
warning during the documentation build.
> - Add disclosure for generative tools used while preparing and reviewing =
the translation.
> - Build the documentation with make htmldocs and verify that the translat=
ed document introduces no new warnings or errors.
> - Link to v1: https://lore.kernel.org/r/20260820-ptbr-stable-api-nonsense=
-v1-1-0341f55fec2d@gmail.com
>
> I used ChatGPT and DeepL to help me clarify some Portuguese sentences tha=
t did not sound entirely natural or clear to me.
> ---
>  Documentation/translations/pt_BR/process/index.rst |   1 +
>  .../pt_BR/process/stable-api-nonsense.rst          | 207 +++++++++++++++=
++++++
>  2 files changed, 208 insertions(+)
>

Hi Lucas,

Thank you for the update. This version looks good and addresses the
previous suggestions regarding formatting consistency perfectly.

Acked-by: Daniel Pereira <danielmaraboo@gmail.com>
