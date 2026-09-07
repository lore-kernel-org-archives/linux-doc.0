Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9952F466AE5
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 11:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779839; cv=pass; b=Xty4ODj/UQ0oMNEngWZDVVxJ0to/ZvFxdeQQEPmjQD1RZZEtMVCp0Uj4936+NhIXtoUISxkV7PQQ37dgXhXZnLXqtRQUPk8YymozByieqvXBHxX385wKptk0Veb+/rarNLDG3S5VjWsXOdmL1tiZ+txkMIYuqjRCRtwdDpPqgHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779839; c=relaxed/simple;
	bh=NRIOJ7LdHSiFoCy4s5VPIFe11Z/c9wcns1PStTsWpYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hF7IuBLS+DZzzBNN37KYYBam3FuSr1PmryhE4b/Ba6PvQSUwicxj3ff3AoZCS9v7sitZYxcFT3ohw3NSp09EPLT5pg/hpXdqCxc8PDhnzteDC5j6zVGYPa2/mXP/GSyuxJq8j229oVI9ZWqwRfICEbYsqTWAOY/+r1ugIcnHrwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=JTk3B7kI; arc=pass smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="JTk3B7kI"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6acc74fef22so1521418eaf.3
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2026 04:17:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788779834; cv=none;
        d=google.com; s=arc-20260327;
        b=hWKeN4F4bWlxDIWBKqxicfMFoPHBz73qx+PgJhSHRCi8REf490JE8il7/V44q9braZ
         ZrVpZAv3IyKgYewU/yBggSNFOKp3Pf72kkZEfhAxEm51vMP6xZU+ejasDxQg/FBnXu54
         /BVcZiATBceV4tDTA3zkhlEqsFci2vRQh17TlVeAkmxKqhWhOuMb8Ed5DFCHSjpiUiND
         h8R94WsfaOCUo77T/VBmCH3gR/PdE0BnPReeZ3WCzOEUEefrTzdMS9vVu0Tg7amjbfas
         3cZWcLZxqeZVGz2mwpTsL2cpHJCvyTdAq+Vu0EwU6E3mod521rEiTD6AeLyp6m4VxCYS
         gGIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sx8OmWpKZX9lW/xSqneryQkwLjJ1xoG1ldpS3CIMT6c=;
        fh=Prec4eZo7itkkMIWMT2cd7cF6sCrVTIYbLH5hlsQLX0=;
        b=YIzW5Z+Tatn2VXzrnobIMvJqiahHvCkDuv8HXRd0VyKKARK1ahoZReG9t7FZZkMESo
         +jaxzztATOekMbKNY7CXrgwJQEkqpP/TcYChtzvW32V6SidKAsgFftNJMQpSC+BwrYXR
         EoBsUrzN/Yb4aloShIBmGhcaB7Es+O9ZgCbybtruIgNiakIVzjym3wKPe3xaH3HmToi8
         Memzy0sSNQNwRA+Gh+S9atatBu72VSaJojZegz5lK03RWO7fWMis7tT8qFIuJ1OQLIvj
         UEvnx5/nbz7w6xTvxMYUXggD7RCfBx+S9k6+cRWEsaKYgMbTP/lguyU9SoVNbG0l3BS7
         EahA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1788779834; x=1789384634; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sx8OmWpKZX9lW/xSqneryQkwLjJ1xoG1ldpS3CIMT6c=;
        b=JTk3B7kIT/O2NHmbAYbIfXtgNJlqMsTFHBu18yPLQtnGiOlJMJ504Nfyj0lz8WRLjU
         sP/SOSggyu7UJKZd61Yfc47aASI2/X6tbn6VN4jWK0prVV0CIxAGZGI7DVF7VgWfborv
         8XvfmYzv3HKGfXrWfBLluBC+Y6gr0BkkFv+Z7bUl1E+OWEgYnT8k+WjWFZ13eTMStaN8
         XPBEts67if/LnB7oDnRTyf+aTWq4n8fHBz/mrz0zzqNjsSv+mhcReSAnjbmwRfd8BcEq
         fIuQxxMJ3rlo0BcZRQPX6iFYRcVo9CixytXy6zS9UIyjIhBklhVh1vkPaRgHQDDofH8K
         oBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779834; x=1789384634;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sx8OmWpKZX9lW/xSqneryQkwLjJ1xoG1ldpS3CIMT6c=;
        b=ps+hdikJ8RBaEqJtkX5e2gZCYXd/3LQERUbOCsSB6xleQgxeY5v9WX6GE9YkMngfsD
         ZDYOJ/n+PEq+vEHNdhqtc5br1ZZanunUYPNw0Mls7Wc4xjVHuy17dib9lQ9ksF9S9yu2
         TPDoo+St9UNtbAenmj57Vb+xgc0MCLTsE6kP1n1OgFFgI1f7tI8hqPwasPNb565jFTKt
         Snser9lRTB2PeX7y9BmrMHMNWtZwPfM7MnK5xlLRFMPV31vcmsrwQ4PiNaugtWNwHpZr
         rCffTx1qr7HNKCWRvGfis6KpAgaxr3GMhH04a43wGBf7vMvVgel5hlx4qKPWaqs1rPnW
         58mw==
X-Forwarded-Encrypted: i=1; AKwUvBxaBgvURousDaqbqakCpUUBCCrlxKDCNTYMUOig0lN99CB4kKnNFso47Q4LU7J8q9ox0xjORZAcFcc=@vger.kernel.org
X-Gm-Message-State: AFuF++lYpohuKatv+t4bCXbQfFhKRhW/pOpu8dhxbKYJXHO0u77YpPzA
	9+ecCS5B5TDUI9FNX5QWBl9MVSEld+sn5n8f3v2uo39jX6yrpKC6GIFY/pFhDQ5mSjzu3FwopA7
	U+HGcLJXQ/ly9trQa4+VCWaoyB/2YbP8=
X-Gm-Gg: AYBFou1Y8c51HZCfRMGqLR02DwUIOfufUpfHM1USX0WQUCY9Kj3JirEPJdhXdRlvaMm
	5RaM/l4oNlf+OolkF/pbPfvax5qJsYJc7XfN8NemOAqbyTgM7UkGRBW6CEjgHlz4YuakdRbFluN
	gi+fsYJCex8553QTiV9kImDttKVAvvhs0nhlSb2LRH8IU5cvBWy0gYLrDX8yG3iHErG/h1BQi67
	b97NOoGUv0RmrYPyav2c7rtSUPs7gqTE8uThvlf+RJcd3ZN81U/oztdxyam6Ds/3p9DaxSC6hgw
	7YTcAucSULaOeUILcp5kZNFwNHlwgY2Hju4xliEARIKe+8bLr7zHEMDJ67vv8GKz0HVd7Q3TWA=
	=
X-Received: by 2002:a05:6820:1613:b0:6aa:da04:b56f with SMTP id
 006d021491bc7-6b6fa7e183amr13654410eaf.3.1788779834482; Mon, 07 Sep 2026
 04:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813062039.14567-1-kmehltretter@gmail.com> <rvsksbxeput4impcquq3kjxg6pv3ixovpk5or2mgtuifsu65fh@wuoukaeelovg>
In-Reply-To: <rvsksbxeput4impcquq3kjxg6pv3ixovpk5or2mgtuifsu65fh@wuoukaeelovg>
From: Karl Mehltretter <kmehltretter@googlemail.com>
Date: Mon, 7 Sep 2026 13:17:02 +0200
X-Gm-Features: AcwNN1UczZjMW4p4EYJlnlzfPEBGVu9_4lKAUmRz_TMoKp6TJFSsoOPV9Fyqs_0
Message-ID: <CACzUYvRVi+XW2piwsBE1Lhe1Pg7Z_mNvFq2HX+da8RDpzTXxQw@mail.gmail.com>
Subject: Re: [PATCH] syscall_user_dispatch: Use CONFIG_SYSCTL for sysctl guard
To: Joel Granados <joel.granados@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Gregory Price <gourry@gourry.net>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Kees Cook <kees@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Mark Brown <broonie@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Am Mo., 7. Sept. 2026 um 12:37 Uhr schrieb Joel Granados
<joel.granados@kernel.org>:
> I don't see this in 7.3-rc2. Did we miss pushing this in? At the moment
> I see that syscall_user_dispatch.c is still using CONFIG_PROC_SYSCTL
> which is never defined anywhere.
>
> Two questions:
>
> 1. Did I miss anything. Is this not supposed to be upstreamed at the
>    end?

I already sent an updated v2 rebased on mainline with an adjusted
commit message:

https://lore.kernel.org/r/20260822072325.51994-1-kmehltretter@gmail.com/

Thanks,
Karl
