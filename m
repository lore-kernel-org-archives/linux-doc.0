Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDBF3AEF21
	for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 08:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785312124; cv=pass; b=YYwQATIHx1NXmiHHdL3L88b7vS1ZwMCnfHHDb0KkzM0UlqdnByLeUI18cpGCA2AdY8NToo+r38YsVv69zu99/LDM1uQmsVn0jKOKO/pywlyAZvDXRiPhk/nk2yTAyfrNZyY4Lw2lpYgwTi5d4b/GXIEFHuG0dOUsj84SjfZkSeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785312124; c=relaxed/simple;
	bh=E+d/wxfijpG5a03pesaWaRBShh6JdAWrTDqdnE//6u4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tNvctxpm2IO2iGO7TYBMznimWvjKdT1DjURFQNd8fBSQ9fNuDHgmrHI4UFt9mqYVMmOt7oXDGhx8dVUPtZN19cJSl4n3SiTyP+eeG7u8VUefeZv2mfYziGMMr1/5GQf5FCjTvN4cChl71QDxgQpsvXwmCPLmwLeJFdn7Psyz/D0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGAyz7Yb; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGAyz7Yb"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca12086c06eso487911a12.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 01:02:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785312121; cv=none;
        d=google.com; s=arc-20260327;
        b=fpSmqv0qYlCCKHikrcv9ph/N+wt1eM3LJ6an+Hg/z3fsQjgPIRnRuI+95N2gcFJh5M
         jZA8cMorcVN8Dt7C9PAQCrDbmeKCaE/pMmLrilg3ABuLmtvaqekBCVACgDZ/HBIfb5p1
         T3vMOAdg3osWznCKh/2R4ikjzI9WPsXl2Eaw0SzsEJZ9dH30rptizqkydf7tIeYeMDub
         7bnd2vv05sA9raBVOZS2jEXZy99QGcoTSda7OB9fig14XmUKHcbdDiO9C7PjJgJ0BYVn
         JLHuOegQC49oZ5OOlCDEltrilLhVQDYGds2mE2VR+7WJd19FG+LPNkzliK5Yx3N4TNc8
         mzfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E+d/wxfijpG5a03pesaWaRBShh6JdAWrTDqdnE//6u4=;
        fh=HOilxDZC4+LRe0OMpu2wQrgX8PFZldKFwEDrKxo/TAk=;
        b=WxTIRGxWbqidfZHw394qntQKKqXGXmWEbyBpw3OBiDYehaVrXZ3q0zOShjLWUjHO4c
         53XH6S4ihG9E1AnFv9LKIZehUST3K6TgdQzHJVX113oOX8r7eFDh5tjjbCf+ZC1npDYP
         AHYeRH4zKUeHcCoXkhXESt/4F+Y9ZQxLpSmDbXyUZKx3RDOBNduGU7haTZ4zsQk81tgu
         nQN0KAAzC+qtuqYl3261az0DD6PMe19T+ku9dIfdBTh4U6Y4StoBrCAb4DcfzP4mcz1L
         E8+XCHK8rGkNSrNIMaQx/gy/a6rugHIasF0X67eNw7SFnGp8nAoqh+FoO7VO4TPh7by7
         raIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785312121; x=1785916921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E+d/wxfijpG5a03pesaWaRBShh6JdAWrTDqdnE//6u4=;
        b=HGAyz7YbjqwQCS78HNN6+1yo41ZmDdgr6pTBGgLfkOrzFZGxXzI0Hu2a7N5iD0KI8H
         vqHEtS4SitZ8wh2t9qvw8dxajGHEokBRII13PaySxx9U6pR1Jz5DNBjOmbX/ZF0xR7oI
         bGa94NhPoyCCEwGLqTtxi509ZMPsIO46AYFnTJyfvDKfoly+fh/cnEAc3HWuSsZ3ECnO
         wDOCHpPbcKr2DiP5yxTWNSOMh7E3uTezROvHrWwCnl25NBmS7naORlUXzZjf64vmcLk7
         7LfCyVrOGhp8piWIfqFgUckPvNXGiFfIQG43GxCIxaGe8bzplhw5/ppkbhdk33ZdicFK
         vUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785312121; x=1785916921;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E+d/wxfijpG5a03pesaWaRBShh6JdAWrTDqdnE//6u4=;
        b=VQtr3Gl5CJlNazbChUu8IOvlYiBNQWWqf+1GvQbVlTeDymgeUsNjAxzRwk+rVwpQie
         r2UEDbgOwW4tLc577OiyVpoxQUZC0l9Jau+7GJC5msqkqrzdzYXIaWLek7YznHOGXCUi
         JEvgpwvGvd6y1JUpEMj46E/FiLUgRZaBF7J+lkY2h8St4sVNscLxEJ7Cw6NU+C8f3mM2
         vk9LgzQ0nCscFDsLRVJBKaIIFuJFIRl9VCKasqJI9YLCYq1AiRTGqr4d/K6zPdweKrKV
         loA8pkbtrLpIYXiOMRslIA7GNpQTfml8plMLUhKsgUrXNScrNcZa75i2CmU+z5X+hdxn
         /Pyg==
X-Forwarded-Encrypted: i=1; AHgh+Rq03N8HRctOwmSrjpAf8Wx4aNcfxQT+BSvjXqlBFvoWZeuTt6q/+njdc6EEoChqM150hmA1QTX+J8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZEI898qpu7gM9gzq3g5gDGl5v2F8SeS+LdiaUa+xntuT+3tqp
	igtIB5OiF2JChAbvcFFyuFUNwNxAJ6u/i7QmAdyfFspP3FZTGk0TU+pLwzH1yL5Ci5jYwjXTRP6
	KFGzi4DoehZZTLKBQxgMBmrXoLyT9M4I=
X-Gm-Gg: AR+sD120bfllZyVyOY5SSfZwEO/U0JlR0r7andr2geD2i46IyEmYyvnn/i/ZinZJzbz
	fnlNJAGJ/eY6GSR9HNNUnx1BDXYf58CUjy0P9DkjW2E/RU0DUCnUStbx70EcqIRxtqqCkRAjmfY
	ZlTBgW10//UMQRsevwZzjh171gzMwJGtJMPMdcSBpHIsL2F3NIr1uV4Rh6kF6J1SmhZw2C3fM28
	i820580r1J3A/HR/sPjHbQTGYOvlHXzSDkyvdvvkAzmLeVNG5gs14APRhxT+dN5iwS+4Q6mSKp8
	R3fbH7w3wKgNXyActwv9GnnZH4zp9Mw7t7fvG9JqvUQH
X-Received: by 2002:a05:6a21:1f85:b0:3c3:9ed1:2563 with SMTP id
 adf61e73a8af0-3c8ba5c030fmr6542961637.42.1785312120646; Wed, 29 Jul 2026
 01:02:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728052442.626076-1-cihan.cihan@gmail.com> <20260728073143.0e665e36@kernel.org>
In-Reply-To: <20260728073143.0e665e36@kernel.org>
From: Cihan Karadag <cihan.cihan@gmail.com>
Date: Wed, 29 Jul 2026 02:01:48 -0600
X-Gm-Features: AUfX_myTsB4DNkHmtassqq87MW8r-GiqBz-oPHH4kRzi-QYYRJCIYHJb-nKGroQ
Message-ID: <CA+JfJhbda3VbLcAO9KEPgJVH-3WwVvJjdgh0MQUH=Fhnsp28iw@mail.gmail.com>
Subject: Re: [PATCH] checkpatch: warn about possible missing gitignore
 coverage in selftests
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 8:31=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 27 Jul 2026 23:24:41 -0600 Cihan Karadag wrote:
> > Per selftests documentation [1], every generated test binary must be
> > added to gitignore to prevent leaving untracked files in the kernel
> > tree.
> >
> > This is an easy mistake to make when adding a new test. In fact, a
> > search of selftests history turns up dozens of standalone follow-up
> > patches with titles like "add missing gitignore for <binary>", each
> > needed only because the original patch adding a new test
> > didn't also update gitignore.
> >
> > Add a SELFTESTS_GITIGNORE check that warns about gitignore coverage
> > whenever a patch adds a new file under tools/testing/selftests/, the
> > same way FILE_PATH_CHANGES warns about MAINTAINERS on any added,
> > moved, or deleted file.
>
> What percentage of changes to selftests from last 2 releases will
> false-positive trigger this? Would be good to know, checkpatch has
> a tendency of generating false positives which is quite counter
> productive.

It will trigger whenever a new file is added to selftests, which has
a chance of introducing a test artifact into the tree. I checked the
last 20 commits touching selftests and only 6 of them were new file
additions, so this warning would have fired 6 times. Actually, one of
those 6 had a missing gitignore entry that this check is supposed to
warn about (fuse_acl_cache_test, 9acb102522b9).

Comparing to other WARNINGs that checkpatch generates, such as
FILE_PATH_CHANGES which has existed since 2014, this seems like a
reasonable and already accepted way for checkpatch to operate.

For comparison, I checked the last 20 commits that triggered
FILE_PATH_CHANGES in the tree, and none of them actually needed a
MAINTAINERS update.

> In netdev CI at least we build the selftests and check
> if there are any untracked files after.

That is a good practice. But as evidenced by commits already in the
tree, this type of coverage does not exist in all places.

Since this is a mistake that is frequently made, I think it deserves
a warning on its own. In the end I think it is acceptable that this
warning fires more than necessary, the same way FILE_PATH_CHANGES
does, because the cost of an extra check is low and the mistakes it
warns about are easy to miss.
