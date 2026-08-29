Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD3341C72
	for <linux-doc@vger.kernel.org>; Sat, 29 Aug 2026 11:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788001321; cv=pass; b=g1pWefXMlmbiHhNnMGOmX7/o0bud0E1rAjZesPFZkAuJgiWxhTT9HWnqbyf5p8eOoWqx+fdExG8jrPXAp30WDI+vam2JnPR0nPywCW+GifaIMi7ll5ZOcyhUTVXQ5dG8eazzWZtyhQTDzsdJByTkZwcR2C6BRTP8pP1U1S+075g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788001321; c=relaxed/simple;
	bh=PGN0umUN7ZwJT7rzn/2t7QWwI4c5VBIve6Ja7MU/aek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YMX2SPxYanrjGXDsonUOzuakh1j4rCYPMr6FyrMkpDUuJMq2BZ4HscLAJohqsWd4JttKHXbTYcxVQMe9gxcIoY12vhyIqzrsA4bqg6rHdtPQZwWCVDWwDoBJBVlCAmGVDu9eUsUNNYHwKmwhOVbWl94bJdc68B4oXUzrnkJmZnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULY/4yEK; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULY/4yEK"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d590f4c291so5147345ad.0
        for <linux-doc@vger.kernel.org>; Sat, 29 Aug 2026 04:01:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788001319; cv=none;
        d=google.com; s=arc-20260327;
        b=IaBfLkrlntHgZ0zsuMarMPjbLqMJwaOGEWfuPtbpYLI+i5VWjhW5AuhBHNnsOI/ler
         Ib+PfTyNR/lKjTSRChgZemRXqjKVPtu3C+ft/gr4t8zGGvbJ5oIm3/sXTsb7FHMvPnsJ
         OaTyYYhGhgrN7wRf7zUlckh1DDfQA+L05oWlUtrnJXyFjvMCwy9xlQFNdaml8gm9KXLA
         +UkZbct/q7WYCLT6k9pkfB/UXA0zIkME1Fa/9JTyQlNouiNvDL0xUtDeUWFlapHpB4TA
         jQBOa/lcGv93O9SmR+ZZx44X6mhuPIgNuy4cVv3WanGc/MKiYL0jKt7pkvcAkmle79II
         187A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PGN0umUN7ZwJT7rzn/2t7QWwI4c5VBIve6Ja7MU/aek=;
        fh=H3IHbm7zm3DEJEZyAJavfBMv6IRdi33Q8AVE9UiGnlY=;
        b=aCIjeTI6XMdDdy7kW84NmxPkj+P/UfQErKsZptjd9vAXGMgGRTPPyRwD5aqFUif2KA
         fPfe6D+G9aQzNPuShQiucWVA1BXVcA3fLT/qQBM1pCM83xqybpEc3oP6E72fheJ21EVn
         ywi7/H0jh6g6f3UkCnBxXtQRyRCnjlzsQeaWCHcbSDhJWDWkTCY44H+x7YTF+6Jt2/Mt
         g8b5wNT+1bWZIbBHNXuunRZH7hN4M9a1Gw9cKWAotkM+V/NT79bDzpZppYDOAvofQiHL
         1x8VVMkTKHIngdRYyLJoXF7oIcbbzbD1f1KuofiaahNwGNH6/UYR5mXJQUkrYsRFpQv1
         Py3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788001319; x=1788606119; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PGN0umUN7ZwJT7rzn/2t7QWwI4c5VBIve6Ja7MU/aek=;
        b=ULY/4yEK/OIiEqWn0gINn/0zr+jhfFt2Hmb7UdU5PhDYhCKiZ/XEyFVW0fzWgR83FF
         rgDVvp6gNTgymqikWmL5xLfNdE0/GAmAfWcf0zBKSqfcyg+GbtCPgseRu4mbTV+eeDw7
         w6hM1fMEVUUD1g2NgAyU5A6LX/1rUtFHxVssN8iciKkldDjtCRyqdaZMgu8ZI2nrZBli
         MfjO9Bg6za2Xqlz8j6liqXDJ38WDtIl/NRRwJnPJw9oy+7tu4Ayjl6u9I4M8HdMzhjgq
         Fbu9QZ/RcF+77fA0G120L64raDnchxzfwejLB6GqZTN/4PT3ElQWrlPHzAoHIe1fXhcQ
         j0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788001319; x=1788606119;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGN0umUN7ZwJT7rzn/2t7QWwI4c5VBIve6Ja7MU/aek=;
        b=Pb/1s9JRnwR+zj9LZKFFRYc1rDjzpH7/ivoDvvq8w5l2YavwaT0Ec+uW7cHlKdK2LC
         /XRlGKDfj9GY47exxzBg8GNbTmeWVEzkCw2L9H+JCNHjMTkhwdzpzRZxJl7Fp9I4Ehtb
         176jaa7cE+5OZAdwgg+F0jNgBgEimd2MFmWoH4n7412fHqYwDeM5RBi53o+WA+r+fcpa
         M16w0GCGLs2EQF71770N+X4VLO2g8FMOKrVuxH1oyqcfh0TjrfDBTnKvbIsA/zL/yWj0
         Ta8RinjgHhhRf5Z4E75np+Lkc5Xqd7Y09R+biQD77TEb0dC7cHqWdTnUtkeqxgB25dTw
         Fxww==
X-Forwarded-Encrypted: i=1; AKwUvBxpBJpICNNLCj5Zka48VbWE/pWit4iFTxOmUZuZnM9guG738xL6IvauEIeYCi5TTCOL/fbIK1vgtek=@vger.kernel.org
X-Gm-Message-State: AFuF++kk0WC5DkF9KjVL8Nu86Uw+fQuGe6mZ2GkFrJzo5dtHPuQBgoa2
	75+O1Bc+kkGT56e+YKzCKb5ad+XMS58xwW5wPliRw4Zw2U59nZQD4K9K4cj630rqvCdMR+eTwl1
	8YaKSpu7pzYE412TF1AaeeM7BfJcj8Mg=
X-Gm-Gg: AYBFou0mk+WBqWXN4TxoD3v3vLh4ev0w3xWKP8CBQisJol0Jcrqf6j4BywwIfyUk/FP
	o18CmYpZwNduH1XHSR8WCrje1amcTT+nnGctFkUjFY8JhxL4LLSNMRghfk5I2/ZKfVfMq7Ewnp3
	LVLRrjDblt7VrSbOgLH0va45454C+aJwxTWBCkLzWWHwTWfXYHz5lsJMGeTeYBFq2ulxwLPMKoX
	kaJl+AeLQBqedtmN+3tA3YPdf8l0jAWr9yFIkku+vWzivf/Pdt0IvFdBZt9rsAez5F21BeIRdpW
	wYe4PoZ28lyaz3pA1hNrLM3RytJKuA05ckNvkJPB+RNYqY2BjpxSA0/cKz5welqPFLjlZ+6rtwk
	7BQG63VAdFwUX2lDxg7E8vGvuXxyAvsSCEbD9reP92449UT28M+8jMXIR8tAN
X-Received: by 2002:a17:90b:5546:b0:381:77cd:38ca with SMTP id
 98e67ed59e1d1-398bacc54eemr1390032a91.4.1788001318956; Sat, 29 Aug 2026
 04:01:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
 <apG3hwaPA8f7SJeI@levanger> <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
 <CANiq72k6T9Y_Vubih6pFMQBxju2xQq0VQkCXT1WL0qSyCXKxyA@mail.gmail.com> <faa022bc-bda5-47ee-9984-4e8ff067c6e1@gtucker.io>
In-Reply-To: <faa022bc-bda5-47ee-9984-4e8ff067c6e1@gtucker.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 29 Aug 2026 13:01:45 +0200
X-Gm-Features: AcwNN1XslLuUNYYS77elbKGG8v398s8YpVlpDc2SDM6GYH7rCRkfYicjHiuXC00
Message-ID: <CANiq72mmxxrm3-a-sN7G=t6CEqHkG3MVvkfRMqe7NyNR+C7C7Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts: add TOML config to container tool
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, automated-testing@lists.yoctoproject.org, 
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 10:56=E2=80=AFAM Guillaume Tucker <gtucker@gtucker.=
io> wrote:
>
> In
> principle newer, version should be backwards compatible so if we just
> bumped the minimum to v3.13 older scripts that were written for v3.9
> should still work - but it'd be nice to have a way to test that.

If they don't work today with e.g. v3.13, then that is something we
would need to fix regardless of the minimum.

Since some distributions offer the latest versions all the time, then
it is likely things generally work (or they are niche enough that
nobody notices).

But, yeah, it would be very nice to have tests on most scripts and
thus be able to run those with every version etc.

Cheers,
Miguel
