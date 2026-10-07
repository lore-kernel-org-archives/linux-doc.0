Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F115247DD4E
	for <linux-doc@vger.kernel.org>; Wed,  7 Oct 2026 11:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374022; cv=pass; b=gRiZhUQk7jtOzfFd0gDWF0vPC4vwqf+yziQTTJm/iz3FB9D49B2cBGV2UqxLV+mNx4q4vA7fZKPECGmCn1c4y+UavOrVEY9HG7X6Cm7bVR7bvKoCsXDKE6zk3t28TghYaQr21Kixs1fjugOSv1Dn+nJKBfzmZuK+Ya/gKto3WAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374022; c=relaxed/simple;
	bh=l11SxpTuwANf57f5KsVOqnNNhjMstDSs7fMcPi3T/OI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CYYymJRPTVjodcrugt/wDNUXfrkMUZb63FyKU6tSUTsQN/L43A8lQYgzpaKif+1iDi+KvocbezWNNm/qAc2JE+KUu6Pyfpl+MfSkdGMDMq9bj5GiQerHevwMsttTpiY8BfcVpM/bbXNyIJzadoEWvBh3PggL6dFKTj8nvRcrke8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2jVc83n; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2jVc83n"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e5fb79ce82so4458525ad.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Oct 2026 04:53:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791374012; cv=none;
        d=google.com; s=arc-20260327;
        b=JmmHcbvQRDFaUc7dWsQKY+d0/80LpY03FW6GTJhRPcxLYUlYemwkW4F7Esiwa/PzTF
         ZIP0IP8s3oCq6ZHb2d2iiNpyvBBadEfqB3wXXEfEz/gVWDNewrNa4s5w/LydWhYy9Ub+
         LMj4arAP3WOeCc3rjfXGeJ1meWGH/4BVaGwzoeyLBlLx9uVQEbWFYO+fLxUZyoMuRVdG
         Q+F534m4TUMg6ThjkgPtwpr21ooErP/An9BxWkOAuGyxQxdX/2yZ3UCX0kxEGe+13kPt
         3SIgfY/d10TFVmKfWJVL412P8ww3RLq8HCcMxWqEoFDVaeC4AAQebjfF4PjX14Bu1pQp
         eKtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l11SxpTuwANf57f5KsVOqnNNhjMstDSs7fMcPi3T/OI=;
        fh=oCCDob0jW1aABgLlmNr7piDUJYyqshQqSjtBrLPcfGU=;
        b=mtdXqoiP7e24TtJarDGMubosV9oy0CQNd+l+ITOhf40T52yVR6enX7aki4AYRT894Q
         s8tx7HxQxGr26JzVUXIgpe0BH5+yLpVHcGumd/cjlTUAc/2bjb2XD5EIOwfJyz4OOGG9
         7grqC0koCWBh4rElx45e2nzKZlqrhhKZQKHSecrWwQHM1iDLNQSy6ZliNKTB0wa0JC6q
         3IC0FDqTrUnm+MILnAT0+aWIkWDHHHAVTEglBNk9CrOiFGGyVY70pXdVVwlOJnoMj1IV
         zyyWtw5welSvTPrt4ej8EkguJR5IXsWz+llbDCk/df85kTBlBNMC7z4x6cPNffqpEU8K
         HZQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791374012; x=1791978812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l11SxpTuwANf57f5KsVOqnNNhjMstDSs7fMcPi3T/OI=;
        b=K2jVc83nrzC9u98XFs6c7s1RMoDzKdEpkZXv/O27O8gI6RnYYBr15BPX03OX6hH0Hr
         iSpJFlg/ALBKVO6xoUfrlqWBM9Gg22Y9IaRkRDZL/Uobkfpmsp9Q7iTa5PURTQRaRGCr
         LNHXnnX0Tr+okNiHgvbBq/t3qkMMpEamsb0HYwyPtFqii9L+W2iCKGKKMoIBJvqIcT+/
         h9M8k4fjvcelsrcZbtpjgrNyMM404vVg+T1mPkeBLHRGVPiVvfH9jeyv3wgHyLTIPvLc
         1PuW9WyMYLWP9hNu/XN1AHiJ05KUVRJE9/e1mi7GUC7Ac8h9XzXUIxq5xZFejxXHshCo
         1pXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791374012; x=1791978812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l11SxpTuwANf57f5KsVOqnNNhjMstDSs7fMcPi3T/OI=;
        b=BUwzBODSw8CcUI4JQOFEXykEnSqixRG+ZxmOE+sqZjth12kDGASwpqJyLXvxI0HJGQ
         1Rk+au0KUeNOm1yXq02m3S/7mNOPYfv6LFZeVvrDMi+TlQ5R6y+R8By0uq+RsEvFTKem
         uYR3fThyqi6TgQQE8eL3lfNDoIGw455L4HoRrpqxusi1E6Qa2rGnOBUivqhuHZFGXMBd
         hbkqxecQgbVgStauhB8sXQ5e+Pg6b4rKBdVJAa5CeOCbB5Rn8JJ1QoBHSGF6fegy53gL
         YKfAlrnL+42DIdzTDq4SHVCWYz6QMMu9VR2ORoyTUJYILn7J6Dp4LQlkYoPVULd1W/Gn
         Hr4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxQOf51CHfBaI8OZJJqf28rzI+7jjmTx67aJjVOL6VMiZqI4uyLUQcOPd0EwaiJfzd6iikkWnT6NiA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2M38DN5tDcJxz7mDZhgfSheYQ0x8tAj/K+elXWh1/a7pROmqX
	5OJBsz89OAQF4UgQxjbiKaV99sDPeUJQ9TZJ9qqmpEdD1yYuhQUNOB3Kky87Mx/QOns6uXMI4QM
	LcLOi3xX4Iub/COKQLuxe0WSy68tk3Rg=
X-Gm-Gg: AYBFou0ki43rJJFwDFjH7mltQAFBGYrTcZ1yI9hIIKvXSy3KMAMsoifGdN4DbsRIxMI
	piMzqSc5gCHt2o64IqRUzFdzpzjb3GBZyor6qzS0IqqZpdi0ylfzCjg2TsV2W0J5kd7MPnknRly
	Pv3fUjsxdrFUuvJIPC8j/NQ174Dxb0NjaZr7fymuM4w+G4ovF9pyDuXCLCZ79ca//vYRSxUwYBT
	B983fJLLH9nlLWhoSf0EeCqL4IRBuQNEDEkdQfZCIbWgYPwiABr+nQ+0LjnUl714xKGudexJdvw
	pC2jL4uMtZdcXjT61uAgrk62DYnR6vfge0jPZYTgfUxNkmlPexLCcvnD7Y/jM8l0s3+B4UCx98s
	HWAJ7Vl24
X-Received: by 2002:a17:903:110f:b0:2e5:c563:c0dc with SMTP id
 d9443c01a7336-2e600509c23mr20094385ad.42.1791374012035; Wed, 07 Oct 2026
 04:53:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006061549.627-1-adrianhuang0701@gmail.com>
 <20261006061549.627-2-adrianhuang0701@gmail.com> <311d97da9ba4b870ef03aa412586b751bc7da3f5.camel@mailbox.org>
In-Reply-To: <311d97da9ba4b870ef03aa412586b751bc7da3f5.camel@mailbox.org>
From: Huang Adrian <adrianhuang0701@gmail.com>
Date: Wed, 7 Oct 2026 19:53:18 +0800
X-Gm-Features: AclHuK_APIuynXW_Vvb6ZGIqmtWSwMFkf9exrzESzLpquCiFRKPp55oN2AWzJJY
Message-ID: <CAHKZfL3z0-fVa7HhW+J5E0RdEUoR-E3wMFYmQ6C0ZQh7t1xoGQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] Docs/admin-guide/mm/damon: Fix various typos
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, ahuang12@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Manuel,

On Wed, Oct 7, 2026 at 6:30=E2=80=AFPM Manuel Ebner <manuelebnerli@mailbox.=
org> wrote:
>
> Hi Adrian,
>
> I have read your patch and the affected files. I have found
> a lot of issues, non in your patch.
>
> This got kinda big, so if you don't want add it to your series
> let me know, then I'll make a patch on top of yours.

Since you found those typos and grammatical errors, I think you=E2=80=99re =
the
best person to submit another patch. The credit should go to you. ;-).

Also, as SJ suggested in the previous email, please post another patch
to fix those issues.

Thanks.
-- Adrian
