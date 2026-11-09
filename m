Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794229889;
	b=LgrjYZcAFFfQLRCA4hZO4+lGaES2+lH2aByIhiNGmd3eyem+UU4NqHW3ZD5szhgPzVi1
	 VMaiLC+Byp/W7lq/oNQ1p9L5PzaJEYDx8EIZ99ScpAGrQ/uFKVGT57LxUppjz8c93nOw7
	 OTBXWfHiYP8ZTmwBqbh2GfMA8ptNx1fKhL83MSnjx3R/0VFqm9yTx7gBf+vGIO4qLKa10
	 Vjv+NWJ1h3hJGEiw4/0vYWqN2kYWH8gWL1z+QNWxcjmbW39OszDZZL8YaVtlUCWze23iK
	 MrtOdrE8vlLS/dQh4PJ6uKW+My04wtf4pCvusRHAXaVJgSO03JSs0adcExWepnCmgPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hUJXyPH6zLDpAwnCmjc82BETffXEe/qWcreTBUEPjBk=;
	b=hATwCN0EfBMXDQ4WDhTwUXobflgclfscAfoVAueqbU2aCzt0KARWMKGS5heCR8cRqZC9
	 upulo3DcEc74ZLzOun5l6HYsmK/MZ3MBmWn1BbDcjSU8qKtlMTGjQI7ix+WiDAWr1i/Kd
	 1IYK1xE8CS407ShkAsM8JgibDE8BOx7yzKwKdQE9YdTuBpAPtJRdCHyBc6o14shkkmRHj
	 bASDp4FLd+QUlw7rsz8MhqtkmmzGZTYpwBD2Q9B0fKAEYEqdsuANugrk/29dro74sKDcn
	 Waj6SPNBUUd+tJvCUYoAoEdZvbLT6B414fIH8T3TdIXnASqhEQa1RiUnJTWiD1avu9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TlYxLweL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CE4606A33D
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 13:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1CE4606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TlYxLweL
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c154a41f8aso7998e87.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 05:11:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794229887; cv=none;
        d=google.com; s=arc-20260327;
        b=dys2mNwQIi4qdp5mTRU234U+XWTvaJ6QuTGzv5Oj5M6wVaaSuavp1lzKgSHrSyR4dv
         jVxMHbWp2Dqb2RekBmTAmZSgbrr0/Y5jJS11K7OJi8+nWC7dXDnHlG5mpmdJroYleLoT
         iT9oN4Zz1atwahRYON+i+BdPvuVBlxUqpbBBXJvgQoXE0rSXcNSLWual0ooK5ttYDryS
         RDokFQ5F4T4zR8iT/T+nAc1pOKBTiMjZ9uQGsZYuoYA4vM3dD18J1w8xARxEPaPKLzY9
         4X0mZTd2HoQ4bBtYRpyQknlAV+jLpb/PxlXLO4fvgGlD0TL9J3acMAe00DGBokw9aIIt
         S7Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hUJXyPH6zLDpAwnCmjc82BETffXEe/qWcreTBUEPjBk=;
        fh=l0nhq3Y8KvcnqOFCDKmsn9QHpS12RD7gTGAuV+TDciY=;
        b=BHuV0oPPHkJ3EEjUYZUoj3e3zJU2TJhqSJsdmVn5MTkF/dRlBQI0rBq2yoEbCmMvhY
         thmTAUfIqHOoTBK5dX3tDtWOypK2lTTQAi2fnD8+2EyWmN9jnxozbNOb+QQlxF9qHYfl
         05aTw43dRFA1syRil3YDSYtGtNvPVAMVn+KrLXz4j64REXhQX9DGniozI5i8AWpjP1ul
         VCTf9Eqrgpy02pumzqDeOAIL1df16Q2tyBX/7ai8cYzlXmNTVuXpyIuxtvrj/j87nQaO
         NWagSoKRFune/N4eb5yAwk7UY3la3aQEFXIDePI5nty3O25QXPJJocZMyQSlLwQzdG4c
         jufg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794229887; x=1794834687; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hUJXyPH6zLDpAwnCmjc82BETffXEe/qWcreTBUEPjBk=;
        b=TlYxLweL5cnGw7kcvkwBnXE496pEYOz46n9I8mIZaOWbRk/zE3gtaI2/aAagwoEzog
         ruIdONyvii0IBixHJQerhe1ly28H2J1eL0F0VAKiDMN1dkerDGBgsfQQ0EbbkWSttfBT
         GddaiTUwWtTnCyzNRnBQv9RDdjSgHc/ww0TxA02ls+6YW8KbrWxpgvTOAnEW7gQIifZj
         FD6X9IqSRTnUHWSHomjUdqbZZ/7/r9YKYi/DjaV05fAWouL+3c/Q3qm5IgVH8OWbdyki
         r23MkJq7UAmHjnMb5+WBrZG9LKBBcOU62C/sXjiPX06EWunaY/1AmJRljyC3vSJvWX5c
         lZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229887; x=1794834687;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hUJXyPH6zLDpAwnCmjc82BETffXEe/qWcreTBUEPjBk=;
        b=tlWD7nm0VjoFFY1PifN08kwaxF4GS6RafdUfQ3WXNMt42UVwiay2cx2+ziAOdFvEwo
         rgy9sOHoCFyiKUUOWW3Y2qgoBi1rPVLxU0nHtlkCJ5ao7Ql0dF7eKq1CGLUFr5yUg/iO
         N06hYa7gejcEnQPj/fzH1iA9coZO7apowKk+1sbvs0PqcD50EQNeql9LIlUeRbJe6CTs
         k0RFTI7dEiHK4UmLOvOF7VGKM6FPbh97ns6AbIYU9Df+LuDRu3A9iY1FzYve6hCxaiRN
         ZdNWDWlwID0ppy7AMcKQZtaoX7nvd0frlXMsNks+2hk1eV+eyfZXGnu39gSznJuCIDDn
         OvPg==
X-Forwarded-Encrypted: i=1; AL+hErEL3JHO8SQED2UAYk3x8lhlhXeKwX4bJQ8HTY67f5tECk639wjsvgF5joMEjaoIHbkrCRdn3i0TBRE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rKfTTAFMuycH7aQEQViVr3g04AWU9l5FreY0vvG/J7PwLbRpS
	x/ijhxYWtwI5e6ua7vF2O2EslKpXV/cK8aoaxUOCkFl70wXMt3r0INV33IJztMjypnnZGlBhFPY
	iuBdu6lj1yZKYJDUY0ANWJv8NpLggV8I=
X-Gm-Gg: AYBFou1ZqBfwnXto3eugfwKoeFOrU7T2S/haakQzWFLvO95bDvOfYqiNoJDxikzksRG
	8+Hc2wEOUs2Ta1iQrCYz/3M2gwaHPwE9KvPisRWMcgz2YrwTYVzC1wfLrZw0VsBk0LEd/jU/wJb
	0VCUU+jN41k4wuXCPzPKUN4U51iPE169xLuW8E+DFnvhi5L5TocXlAs0Jm+dhKz9iJOf7fTHU+P
	91IZFQRh28N4doUwImGWr4vUz3i7WteGpGGx08FW4LjbZ49W1eo7iMQa1ovIXxYlu+QzvpFOW7q
	+DWIfMn9ojSbYtZFUJCWA5dz0ewDxj1Goz5CGcspR4d8QpKuOxmridFViyQHClEpVZQh+4Wa1d/
	UmbekY1S5WeL9G6arnNWqvV3W0Nfvo8EJJBPR/qyQimJNvHzWUQEDGBHLrxUm36lEVTR+ceSOGJ
	8JyPEt+j3IS9/3D1y9QuN1B7vNuRD6vWPtBpYuQk+LdtImHjMe5A==
X-Received: by 2002:a05:6512:6402:b0:5c0:62:7fc3 with SMTP id
 2adb3069b0e04-5c14c0521a4mr1492621e87.5.1794229886753; Mon, 09 Nov 2026
 05:11:26 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106113545.708896-1-chenyou910331@gmail.com>
 <3bbce43f-476c-4a21-8da3-2be98a696e9c@hust.edu.cn> <bab86e6c-bbda-4ad0-bd88-5ace76946eb0@hust.edu.cn>
In-Reply-To: <bab86e6c-bbda-4ad0-bd88-5ace76946eb0@hust.edu.cn>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Mon, 9 Nov 2026 21:11:14 +0800
X-Gm-Features: AclHuK8D9gYdXznX6LC4moeS7v-8RvkJxZ4j_oXJHpo9nIA22wV5WJg6HcIkwAA
Message-ID: <CAKspUh+n2giArsUzKeHq1F-D8VkV89kUNevc-hFnpxjWFWNZsw@mail.gmail.com>
Subject: Re: [PATCH 00/13] docs/zh_TW: process: add translations of 13 documents
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Weijie Yuan <wy@wyuan.org>, Yanteng Si <si.yanteng@linux.dev>, Alex Shi <alexs@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> In the current stage, it would be more important
> to fix all severe issues in the translation other than adding more
> translation.

Thanks for sharing your plan.  I think you are right that fixing
existing translations and making them reference each other matters more
than adding new ones, and I'd like zh_TW to work that way too.

zh_TW is at an earlier stage, though: it has only a few dozen
translations, most of them converted from zh_CN, so there are few zh_TW
documents for references to point at yet.  Much of what needs fixing
also only became visible while translating; that is how the terminology
issues and these unused labels came up.

So my plan is to first finish process/, the area the scope RFC commits
us to maintaining.  After that I'll follow your approach: resolve the
references so they point at zh_TW documents where a translation exists,
fix the remaining issues in the existing translations, and only then
add new translations.  The terminology cleanup will go in alongside.
