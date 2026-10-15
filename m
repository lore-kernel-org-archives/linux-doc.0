Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C35521203
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 12:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068972; cv=pass; b=dqDcmr6iYZNO0Ot4ExuKuTQKaofe4fsFK0AWlM4QTX7CDsiJoI49NNwYWa+osAyKdlXVW6pRjtZt5VvdcpbT9ehWP7kYMUR0J3WDFM3k/sN6nV/T4k0Gq2FycYNmsLBATM8HF6HX5xU/jNBtfUb2mOQESeP3osengmVdoIxhRPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068972; c=relaxed/simple;
	bh=xJZzNgRQ324//rzTuOjELrAp8ovgVJgs5PkpDayBXic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QYiiTJUXmpecbIXDDcO6da1q+85uJrFsuRupKMT5sqZN5jS4Eex1UjwBFonkdBq4yeSvQ+ZR2i6hYZZhsmb2ifdvYeeUvu5Uc+Vz6XvSoXY5pojPKuWSTzsElDDqOnheLzHlzO4Rgdm4xoVaUzDxo1h61/by5H4Zwk7rTKiH5+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q1mkMmzE; arc=pass smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1mkMmzE"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-917a04338c1so56200216d6.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 05:56:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792068969; cv=none;
        d=google.com; s=arc-20260327;
        b=RXX/rFer2w+G9ucH9RuYG+cVT5LnHkLKbu2FSxrXDMoWWTZrmbqXPWr0o9jjENDldI
         vHZIgs5zxdRl6wOiBKqBEI/FnZmMrpbjJOrd6gJqm5nS7jIGCroiijg/k5smYweVPBGm
         RlsEVR1WcInLs5tRrSqgOZZonhXQmX1QeDLkHy2UMVVHnNgg4ZeiHQ4CWoUNaqKw1BNz
         qVxwfsEYuLaeR/P6tfJfX88IgUmgPbRUmTptIQDrtJWIWuqMPhdoE/DdJcc8sRS+dkcJ
         SnUBblUJlQ0fH60xBWe3JcXJXthrh2uUQK+dXL2W+5rFzDA+YvlLGn4ZBB0cXgCdPB1C
         cUqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xJZzNgRQ324//rzTuOjELrAp8ovgVJgs5PkpDayBXic=;
        fh=8gMPrAhPPV2t/7/gaXNNfSuvLzpF6C5fSowASYFbZ3I=;
        b=l0Ql3zbU1dTu5iDBE4CUTnvV5PmG6ks5H2co726JClSd44sKOVtcJv/QrQzPwE9VUz
         agddmU35I+f0v0YVUYrWg6rNLj2yE2K5b8wTTDBJL7c9YJsyODc/G9gZsD9Z1imMpDz4
         jh+W+1LXa2pyDOvBJ+4/HRle+Xab7VfV7Iy3R5omP7+h7QxFFL8k8VcYradZlP8NaI8H
         1PCpoSJcH98BNHuVOhAdUQc5ETid/M7h+JPvNJVLiT5z524x5MD8fQl9g1zNZ/zGFpVf
         r6r+PHzgyz0Cyczam59QqO2GXsCcfsw90hHasx1A2b1u9iXU27O9W0lpx9o8IhkUUkHf
         KtSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792068969; x=1792673769; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xJZzNgRQ324//rzTuOjELrAp8ovgVJgs5PkpDayBXic=;
        b=q1mkMmzEhHmj1FwM6JvEOkxVfYGMKpBu3LI+SwInDaAk7NESl7XBGb817suDFkQ9/l
         bR9cXz5CUwJchupPjMQO3I60qM/H6+nqPS/DxmtFsZy1JhzScj/4yKQLYQF+yBF/gueN
         RmkBTWnEWwRGdo/b0uVJBfNg4uG4h70tKsCYyAvpH+FqDrk2/QVLcM4c1qY+JL5ni7TU
         /7iipAO1rHzPIwekf5TVth5t8aJQ9PLyTWgz2d72Smr5syw+7BsYYuuxCAbHpYdMKpJR
         r9u1gO0va8UcptWTVztmX84MWCmwwqXy2m8tIPN6nEV983twCD1jW2bX2v3fIP5bfRS4
         rcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792068969; x=1792673769;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xJZzNgRQ324//rzTuOjELrAp8ovgVJgs5PkpDayBXic=;
        b=Zp6Fj3ium8rTVkkz1TyBgOoojKlBsk2nsO5mrYv7SnWkwbHXuRqMM6evDhGK+W3qI3
         SPJYDuY4kgeEW3aE4BpZcgAJybdSPJMAaSXS6t6Zwj0J1JYcQnD0qceSUw4VNAFzouJs
         ZafbAM8c2gOtmc2lydjvbUbHvozvPSRwydVzNbzCbUebrBCwsu29/7KcKT7iE+5hQ/vW
         3mgy3h2IimPmZuOkVVyjF8o0vd7mo7wpWlTkTcQ2JMjvRFCMGPbivCY7sZUcnzCmjU1H
         3DMHpcptwsye621tM4DABglUlCH8uFlSK0RzrJmJAhcb1CuvQ+eWpvgunhUuTw1XohoA
         QHYg==
X-Forwarded-Encrypted: i=1; AKwUvBzbLTcbsmt0TLFSl88sgFHChPao3XWbKZo5eooO0MALSb/sWczkLsB/IfKmFHUBuVIFcermVPUR1Sg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvZtXFZcHcZ3YE7DuwtTaaXmZtMg6B3iiUOAPoGselHSPT5UXE
	cEdHvjsla9PqEirKruCpFbF5lV3CTjkM5db7EY0vepqLkZIm8elCBe4zr1tmzLom7xhy2MKCSfa
	nBf0FMMC62rbbIw1z/Gw2JM86b1G18XU=
X-Gm-Gg: AYBFou1RVUNA+NO6NcWEVPpaAXWgzUxnbmvyEr7oDZPdSQA7WhWqiuae2OTGVeHuvra
	OXch2gpHl8Zj/K8H5MqtRLTSTl8YChfwbyuu8RmEXC6QrBrl6qO3E+r19xKLw9/q7dGN+tZeN3y
	MuzyO9wGk8rJSUCZezoge5HOoXSPDYxiq6q7CcSLxFVMpyzv6OaIh6bhgYQNdsEhgSPL/oen3wy
	fVRBxmhcKPPMXSjAR9BQH7piwyq8XTa6jf0ZY/oCTNvwKobREvyr6LecZ4qyxCIV6HHs7zCmLpm
	TpneS8335H7TL6Ms2Fb0hatIAuDG12dGJhOG3ifC8yvJSZu3ndryxGYB+53W9BbejS4hxo4fAOZ
	lSkCcCbXp3W+ELTtYh4yZ1I5TRqgmgwb3c/dscVNqARUNdt/C2edb2+mC9QbNF4wiu5T2EQ==
X-Received: by 2002:a05:620a:711a:b0:93e:c12c:f12b with SMTP id
 af79cd13be357-93ec12d070amr2974615985a.70.1792068969457; Thu, 15 Oct 2026
 05:56:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013003702.5824-1-danielmaraboo@gmail.com>
 <20261013003702.5824-2-danielmaraboo@gmail.com> <atC5u4RPzVkVgTNm@wyuan.org>
In-Reply-To: <atC5u4RPzVkVgTNm@wyuan.org>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 15 Oct 2026 09:55:58 -0300
X-Gm-Features: AclHuK_GybjK468UjbNVzrWUTX3KGAPJSmhXF07BfS6LCMP087rHpUpK_iiw2Dk
Message-ID: <CAMAsx6eef_2Gcf_WhvTkFWz-fOjyaWjP+h3US0v1=w-W5RdHBQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs: doc-guide: add a guide for translators
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Weijie,

On Thu, Oct 15, 2026 at 19:32 +0800, Weijie Yuan <wy@wyuan.org> wrote:
> Thanks for doing this.

Thanks a lot for the review, and for confirming that a guide like this
was missing.

> Current practice of the field Original in zh_CN is:
>
> :Original: Documentation/xxx/xxx.rst

Agreed. The example now uses a plain path, and the guide notes that the
documentation build turns "Documentation/..." paths into links on its
own.

> For the Translator field, zh_TW just did a cleanup to totally remove
> them.

Makes sense. I dropped the ":Translator:" line from the example, and the
guide keeps the advice to leave contact information to MAINTAINERS.

> Requirement for "Assisted-by" trailer has been changed recently. ;-)

Right, I missed that. All the Assisted-by references are gone from the
guide (the AI tools section, the tags example and the checklist); it now
only says that Signed-off-by can only be added by the human who
certifies the contribution.

> Shall we Cc all the maintainers of translations for more comments?

Yes, good idea. I have prepared a v2 with these changes, rebased on
docs-next, and I am sending it with all the translation maintainers in
Cc, so that every team can comment.

Thanks,
Daniel
