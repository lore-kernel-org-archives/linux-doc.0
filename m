Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83405293E9
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 13:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072284; cv=pass; b=qbO0z/tZ8BUytM0/fzzipoBXdjSyz4p+z/4pvNXZWB8Ve4k0iGlD4IhG/lGZ7BmxGY33KGY7uobNSFf9F0mQMaqxNStbuKKJPvVLZmUjBnib/BKWOMIPXCD+n46DRQFWbGqPwei9xPBTwiV8eZa4CfOJtMO3TA9BWj0GU3px94Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072284; c=relaxed/simple;
	bh=HmUmGGhgCmwu4QqELATIYyKkfGLgVxqbTfeFoXwzD+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PsK/G6EE/A1PEHiLNbztOmk2VP5FEbjFVnRV/yiDa3cFWDayfF0Klq4cSdw1xrwOVUAjmrAGEMgu0OS91MXc02aPrhiAhv2Nsi48QVkNq+8PmWTGoyGHRvvi0OMlxxPw6gXm0GU5IdQQTf8g21F7iBZGKZgiLvFYW1GE39vcj3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZ/dg9pr; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZ/dg9pr"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-34c522572bfso674925eec.3
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 06:51:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792072282; cv=none;
        d=google.com; s=arc-20260327;
        b=ck9+7SgBuRo1XPJjZINw2AlmI+iKkz0zmMYk6ICpbfOX0apHX2rzyvISmUtasoEwd7
         ImI1t9A1C/seaAvjbN4x/qRSSViyXsqT2+o5in/cFbxiDao6AaM4A24YDTP0TF2ddgNu
         3bWldT7Ky5h+sW/qlDGcWjMTOzSEB8zxQ4hr0rACHS1Wn6FBEHEEve5DYlsd84dK8Mvv
         Iobg3YKFTAhgnr9wZS39L66faYRHb+POynZCQGmvvWl2i5k3O3Ccvn83kmkNHM9shaLG
         r0SSmv/18J9+AW6P+D0WzKgpiKOnn7nmcx/bpR8kOLNXtp7wpcirzCxTkn/vJcq75OqJ
         XFfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HmUmGGhgCmwu4QqELATIYyKkfGLgVxqbTfeFoXwzD+o=;
        fh=+qx+QOGqCf8ToMot/SeZVee/498+cEi/tH3UUCZgLKg=;
        b=HARF25odCpiaL20hc7ItnlmbD5pBxxX6gI0vO0HLk7dMCiZ+hork1ufrwWD83/PUqb
         /eZXheZKvslKU6/X1/vKBxVfTL05FrzkmRUicOc8VZUeZeGESOwb1tEgu0eZKM02+DAJ
         ac7cfJwg72/0a1Qx/Ll71CEWZon3eTIzhyGzpH+xkYqt8QvbLNQl6oBV4TeyAUAaIXr8
         H300abxhxFxjyN2tqYD98cPG2eOhsApjRLlhTfw3Ceck/CwS7uwhwbfOVbmDdkQ7lw83
         0Hwzo/ivPEhRcat/Yp9DmDgDS2ZlXRKC7+yB8GBP9J1mb4X4mLug122GUCuWFK4i7J+8
         /2Jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792072282; x=1792677082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HmUmGGhgCmwu4QqELATIYyKkfGLgVxqbTfeFoXwzD+o=;
        b=dZ/dg9prZ0KP2YvTOd18NiLXxQ+1dQTnLq550qLNcPZqjDNTOPrBDuhRZIxTUZ7O2k
         3j4QzXttFStyAfLgpSPUDrDSCxQFPp38Us0Hh2N5AKr6iljz/J/XGqkX8KeDuT0Km6qI
         V9fiEczcKgMvrCjdkkvM8GVPqDOdSHR2gq2K3bPy0BjXCMGh9+Kt/1AQ2Oxu18bd+RvA
         fuVj/ml/SjwMtWdLUklSshYhoChVh2lF+/ixP11CkAeWa3iT+oSoeIq4HG6wa91QZMCG
         t1fHoDV595R/J683rh2NDoAzXCZpty3rWp9AzRQL1qhMx/3T2/jacEC/PoO8YndqgUVK
         gFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792072282; x=1792677082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HmUmGGhgCmwu4QqELATIYyKkfGLgVxqbTfeFoXwzD+o=;
        b=vQOBSGiInqkilc9pymLDIa7xhLSgd7nwslWfdS6z5okNZrFpVYriS8TgExN4u6a7o/
         Jhe40oCqfZOHnmSPBa/Hwb6N/p5IhwRdT61kjZyxataD5Sm3P+/Xhmc73n0ySktvqzgY
         ZAoOh+BAh4EaAT6XLARECnu0yAct/VjeEAyqyO3+pHKMESWJn85qqA3LI9fujnb7LLyg
         DA/AA/Kvniak6MvZ5la8YbF6kxf+seEyl5DwpTU6jADkZ1eIk85KYedHdO9Mc1rcZohM
         j/TOmWn5TJoMucPRbSuMYhIIUcfp5oDxUzyGfxgYw0yCAHipcqWPOcy2HHhunPZNVtMJ
         ZfSA==
X-Forwarded-Encrypted: i=1; AKwUvBy+82qvt2JKeTyX9Hv+IK1AqncxUcZm9NYVjVSgScWbg9cgQ1aY6wibACJgYghYlrX4ZyptXPNb41w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDusFQOoueavdoKQ0JeKm3xo2mkyea3IWN4ThCdg8LMcAPxQlj
	WPTUHF83oTK35PqTpuIZrvILxCIZOrkfmfmI67DIkPoXu+L3ZxxSFHxaTyU+Qn3M8fPlmaM2bzH
	sJQ9duKjsuu50dC1aV1ePtC4rTgXclTQ=
X-Gm-Gg: AYBFou2H+UTkhK0MGRNhG+AKhKajVOOmonU0OZ8ALcrGGjSFc3GAT2XbePsf4LXcgu6
	+xVETSjjvensO7rdk+FHrWDbtJpwCYzpgauZiQ7bRqeotQRmgehPbQst0RWu/dqL/eb5c79qox/
	VWQ16vtXE9oVdunqBB5rB4gcTEu+TmYfuaSqbYA4x4aJkjmVFUIqj6R5MFQVCsKlLtIdX2Gx16V
	rIiChed7AMtIqnHaUXgMMb43lNIRrxuDREdOwkzvLtrj/6FviPXevJsrKz9zGrWpdT6EkuvZl8B
	kjwEnyQdFlBqyR4ZbsOYHL88qxl2vyAWEniW+4tMVj/tXXChYhLVlGfhp1cXmMxs6s1HV0fqlvK
	pN+5yxGf0LLC6l/FS2ykCNXhVXaYfrvAg3ahGCvckX1H1+ULQu/58XYU2oCloez01vHiQOfhljY
	0czC/xHlCGshNguMCz5I10g52XOWE/f3Dbr5ox4VDxpFQm9jgQptY=
X-Received: by 2002:a05:7301:5413:b0:358:c9f3:b055 with SMTP id
 5a478bee46e88-358c9f3b260mr33438025eec.1.1792072281724; Thu, 15 Oct 2026
 06:51:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791499378.git.sashal@kernel.org> <20261014174838.114990-1-ojeda@kernel.org>
 <as_Cr4FhzyAh-kC4@laps> <CANiq72m6okeCHuR8BCGENTw=wJhfXXZbXZtJq8xtoeVfvfo3TQ@mail.gmail.com>
 <atDYWe9L0tv90Xjk@laps>
In-Reply-To: <atDYWe9L0tv90Xjk@laps>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 15:51:08 +0200
X-Gm-Features: AclHuK933tu3BAWh-cwxecRjdQSXXLVeGjwcSrIBo12nakv0bx34xsgXHhrLXdA
Message-ID: <CANiq72mgS15ZKwd-u1t1xvAaNf3ivpXdUMmVDfmGRyq1OewLvw@mail.gmail.com>
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes attribution
To: Sasha Levin <sashal@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org, corbet@lwn.net, 
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rdunlap@infradead.org, 
	skhan@linuxfoundation.org, tytso@mit.edu, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 3:42=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> Sorry, what I meant to say is that the spec seems to require markdown as =
it's
> preferred format. We can experiment with other options, but then the risk=
 is
> that we'll break some tools.

Ah, got it, thanks! Yeah, at the very least the `SKILL.md` main file
should most likely be all Markdown inside (and of course the
filename).

Now, if we go with `agents/` instead of `Documentation/`, then I would
personally prefer Markdown for the other files in the same folder like
the `guide.rst`, but that is just my bias, and it has a small
disadvantage: if we happen to move things between `Doc/` and
`agents/`, then it is a bit painful to reformat.

In fact, if it is all Markdown, perhaps we don't need that file to be
separate? Actually, is it a separate file in the current patch because
of the markup language difference?

Cheers,
Miguel
