Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83179D515
	for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 04:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.195
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769748411; cv=pass; b=PdD4FjIrEqZFX/W+HXTtcG0AE+bBekf9+BIx+tAnDkb6XLvW+Uy4WPqL9lwO63WMs+dLbWP6gLya1Vm+e6wowO9xR8+ewe7ghwXqzT2q7kkB6Wv2pyB7gzGwnGEduux3vK5j74/Ng5EqCvCvWY59Jzg4g2jGuRgbTPLfph1VemI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769748411; c=relaxed/simple;
	bh=1QJyDJE8/RwVdlpn5wHmp1OKZDbqaPptfo9AX+CnuJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TIpgOQGgey/g1o2m7robFRMkEjeHtFG7fewUdcfh68xOLgP+H9z/hQGGcFFuS3J6EE96QgiX6cat6CvZe45VfcKiCMHPDIL20m0D0OhqFilbBBT1VbjjYaT/VLUmTeoPW+LBVQu4gU97/NubDb2oVIdXl/T34ljTg6cOpJtTQhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TO0Nge2W; arc=pass smtp.client-ip=209.85.222.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TO0Nge2W"
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-8c532d8be8cso174779485a.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 20:46:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769748408; cv=none;
        d=google.com; s=arc-20240605;
        b=BaTjZhnyAbeb4a7T3Yf6iP+mEyKuCmZCcxcDekMsNi7XjukvbWK/5tFpbVo3pOI3Um
         3bMoASGumJQPNKInioPT8HCobT7ypVoHcJm2Upvy8uu6H6YwQAld/xXMlvlAGkCBZo8w
         qwuE134bebjOU8IHXBRO/A5ysjkFE7//fKxTIoqw01lqZAAeZ+2CpUIVsPWV/uz1UnMS
         liWCfT4kuBbvOWok4Z9lKnZvku30UonYlz3P2D6aqPF15j8+lPdzradyIp3Hx3XkfKdI
         cnaQMdNE5HyeTn9aLB+qOMMCyPMHPrg5BEzL5Zoersp2bLoUz5ANQ8hppAL+byc5y/qh
         AlQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t4LF6SauvoM56B4cbnm2wB20O1YxkaswIBTQd/3l4QQ=;
        fh=CjJi72hwig0S1kHGW7Dcc3FfJKZeVoo+kuvaMp0x7cw=;
        b=c3e5JcZ2tzDbNEZRsukbP7IVmaNRSb/maqY3lD73J5NE5vR0wF/QMTxr4q2oiOveI/
         KR92gwoEjTq3Kkc8b95wTGB6P0g5ZIrgxAx9W/CHd3wUqUEpjiUfO61TS6DMdVCsO93E
         5qSirU4omjJ0+u/ygqZjscUvYsERGTfpwyozWcqm4bwSEG/6PRpOWDmbsOum1aNPykZE
         Y0lqD2SRo6kjYLbAxYg4dhqxvCivGspn2WnddTtO2qvFDdU9m93+5iCgQohZI5cglARr
         eHFAEFuT4ESKHyA3rz2VWNxMG2RPK8aHIYnmgpXeX/p9FDLSyMj4VhMA73WtvDJ7fJsd
         mlkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769748408; x=1770353208; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4LF6SauvoM56B4cbnm2wB20O1YxkaswIBTQd/3l4QQ=;
        b=TO0Nge2WHvR77HYLdbsOMvsZjLPth4rVAvBzcl5/LE/VfPhF6ZG/sDqBrTSxqDvx0P
         9f4T42NcuJnT2s+Pw8OibXAYtTHxYlK06iETTPO8jGtw3Cb2dO8z4knHTu8v2bdVctTr
         VIWzRL3sHqqo/Riw0tgALM6ztHGmwvoKzzrMd9o2ZvVfhEMhRqM+QW/L+N3bfBVw6s22
         wrNaJ4TAX5P7kcnbVBdXVN+3estYZ6qfhpvndim3eEoilf3f40sd7JTjppVk+D2Tb3JC
         aQ0ZcG4WY+gEQSiM4LfL+vcwCl4PBpq3IV8RizfKLGZIVk9Jq2H0nDajQ3oHLtiK6XX7
         wswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769748408; x=1770353208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t4LF6SauvoM56B4cbnm2wB20O1YxkaswIBTQd/3l4QQ=;
        b=oM3EFuV44r/9NIKR4GijOUZclHr84oZjbOI15X84ndiLQj9QxTkfuQXqIRoxAQBbCP
         gPdivCSE1/BqUe2NAPhtVOFdrVBBFUwSspTNNRecYaSt6XiQLztJZLei/5CecRCf8nd+
         JHWhH8XCjNMShF27dzbLV+Pyu31xzffPGk8MU4JJAh4Q2vax5wyJE8nnuQpKH2obcaSG
         /AoKwVpXlQQYFfhVVeKktkb9hGg/7HyV2MnwQTQXo+cYXisnkZxa0vmDcXVtAjCXoXqv
         yyhcMsn1jNroBGNOlWhCaSvvGekrOgPI1VFGyHL9L8w3ZzbudBwU4q+etoMXuPSydhEJ
         wVLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrSLrxFCJ2nDTyLhghckJBKpEY44p4zLYhlpTID5vxKtjdR8a8lpZiUZ4cpmUmrXHGP4E0hGMnC1k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyADgHgcDK0ePnvdoNa2+wnolhISzIVpreVC7tw1LMJkhOtah+M
	S0xFcbvOYW7RqIkxXg3vb/rJ8HdiIvImcRYNVmeh828nGa/RPCVGGeChWs4XtCAZQ1jDBDA6HJp
	Rk2B8p/obO3XwaM+Z6K11JO9SMlPiv9w=
X-Gm-Gg: AZuq6aJx8bWDPhTep9qUoi3tihpR+laR0aaoM8YC6aWM6AIhygK6jx+MTHc0SxruwMz
	z+bJfhRa3yHvkdexbXCU+ykFindDvAr7I7z/n8673YQzzTN/d3r6/K3P9MksB1IE5txbKrqV7+N
	e+va1l4iNMpA7JnmNrYJS0zBAOkGfzEdJgzerBAgCTqYP+/NWFUsHS31BYv2ZeiSc8oIbG1BlcJ
	7AooryquUs101enJXo7Rx0HfazoQaozOkRMKDw2iDPjYnwiSZ/qvrWucwFVEGa7t79u3WB3C8IS
	I4i+tIw3Dqu0h2FjZoCUMRZz0n7cVas6yxwBGbzoVMefd5bK1iNB3APf
X-Received: by 2002:a05:620a:178b:b0:8b1:2853:673f with SMTP id
 af79cd13be357-8c9eb218b95mr231028585a.15.1769748408447; Thu, 29 Jan 2026
 20:46:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129075200.38060-1-enelsonmoore@gmail.com> <24935907-76b8-4369-a221-f408c9747642@kernel.org>
In-Reply-To: <24935907-76b8-4369-a221-f408c9747642@kernel.org>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Thu, 29 Jan 2026 20:46:37 -0800
X-Gm-Features: AZwV_QjXPANZJhFTUmAD_xs-kXsc12oeZYASoSpgH3VuFAFrYtXsvMe2H33A0d4
Message-ID: <CADkSEUiN=5X8XjmVE-SfF1GGQbfxkHPQB=BvCJdHG7jgDBiTew@mail.gmail.com>
Subject: Re: [PATCH] tty: synclink_gt: remove broken driver
To: Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org, linux-doc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-api@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Haren Myneni <haren@linux.ibm.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Simon Horman <horms@kernel.org>, 
	Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jiri,

Thanks for your feedback.

On Thu, Jan 29, 2026 at 3:41=E2=80=AFAM Jiri Slaby <jirislaby@kernel.org> w=
rote:
> Have you checked this is not included in any relevant userspace? How?
> Hints: debian code search, github...
The only references in Debian Code Search outside the kernel are in
libexplain (which has a configure test for the presence of this header
and should be fine), lists of files, and lists of ioctls, e.g. in
strace, which do not include the header itself.
The only reference of note on GitHub (although I can't look past the
5th page of results) is in
https://github.com/sunfishcode/linux-raw-sys, which includes every
Linux header as part of its binding generation process, and has
already had to drop other headers as they were removed:
https://github.com/sunfishcode/linux-raw-sys/commit/a804ac01491f63c8ce879ef=
27254d27dfcf89ff2
The package ships a generated version of the bindings, so the header
is not needed by normal users.
If this commit is merged, I will send a pull request to remove
<linux/synclink.h> from the code.
It was also used in old versions of
https://github.com/jerome-pouiller/ioctl but recent versions
automatically generate the list of ioctls on every build.
Is this okay with you, or should I send a new version of the patch
with <linux/synclink.h> retained?

> I would just drop the line, removing one conflicting entry. The letter
> is not going to be dead.
>
> Or is this Dead note some ioctl-number's policy?
It was used in quite a few other entries, so I just followed their example.

> This paragraph actually talks about long removed synclink.c, removed in:
>    a1f714b44e34 tty: Remove redundant synclink driver
Good to know.

Ethan
