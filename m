Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AF51FDA61
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 18:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782281; cv=pass; b=fWMqlYXvfHd5W7z9huYjeWDsUmMFSXqMLlxifGJvFnaMDpHGHY3Lxi/P9xB0kU5HLzezbb0fTVaitjLvWDYibRGs2BL0/9gALzrfHpJD+A77MDUlnFGNjKvZxcYg5oaSryHxdstVISFmtbbFVeLVhDcnC/ZjXWjVWlO/baLOJR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782281; c=relaxed/simple;
	bh=rKksm0VsMA+U3d/OgxO9tQoRLoG9hQKxXQ6/L3bh6zI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l33RjDD56IZXaW5LdA5yapBiZ+kIEhp3gBpttHb+TD5xCcIbM8PE4kfFrp+z07kzxmlnn6IU6uLepStU200OVdiDw+frWFaBJ42sspiI6OrHz3+nlpB0yAyTi5wwPDZ+eGpl/Rix38dr0CfuvldPal3N4mXr4ry2+ZvBN+FwIeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4/8yVfO; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4/8yVfO"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8f1a8e914a9so28219536d6.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 11:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785782279; cv=none;
        d=google.com; s=arc-20260327;
        b=P47ImUviQpLu5xa4DPlddyIHO6FgKDqX8wQeoP3tEkITXz0z2sdotsCI7XOme1GxFW
         NAfQBZr3lK0V6S+L3Kj37tVPMDLgl/Bm/G1iY8X2cnTU6HZfcNdoZaar1FIpZ6quJ3GT
         rCfdrC3/E99DMy+0BxDZGHsbJjqjFazAGAtA/GJqlaeH5zR+EAMVYH4QjqdkbfGoWJB5
         VPLVApP9hkRCBOxVLCx6OxS1/us2cZ0covpRvkf+jJ9MXghyJLqXfOUwnWhlo7r5Pyt5
         rZdt0Ssmtw5foBOxMHUZBd5N2/ixVa7T4SZaN4qfwCjnXVxPE+Xaof7XIZKWr6rKajKI
         Mkjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mRwVOwJsZLZggZ6iGw9wOgGLRZKz+iqLSxrDRaEjuvU=;
        fh=CvAoNJxu24rG0D2SJaE2994iI9FE2xtVN6/18KyIvjo=;
        b=Ssp9X68KVCuKPkgWuwnbGRbM04B2aKuqRDwqiTeFFFaDowv1Pf3yYBIuGjhGZhb7gc
         seI75DxPB/gg9sqQUgbcbxKMC7LqsMFPWGQv67VAZg8BkaUxKEvwt4nCvmWRh+Rby+hq
         o+Z0GzAbJsKgHG8m/GBrTVxbzFXME+f6lbTdmFVm82ub0/OlrDWnpsIKh1xiT5bVkJGc
         dOpr+WCnYEJFWYBYrZSGizzYmeOD+bNiR1cF/x/Gsdk4safeqCDzAX4cN+2EOt962fjZ
         g0dnHYPG6Nw9kEvEqA8ymHkDieJ7KSMsMaVo0TRd4BcBkZ4R8R9SgGVuujsenLoz0l4P
         T3UA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785782279; x=1786387079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mRwVOwJsZLZggZ6iGw9wOgGLRZKz+iqLSxrDRaEjuvU=;
        b=E4/8yVfOaWEl1bBb8EpAIUkkfQTXnZso8/4DFWGjfbk1o6vH42I6UcxdKGxXKOz8AF
         El/b2naj71c2Q5cuaQlswM2z35C/jCHjod/XYaUN+Ma1RQHRU3WJMmONYe+uvG3SxOsE
         5ocm7mQ3focOfQa0K8kxQsjn9Felk8yKYy8QPQLTHxSXHb0PxQAW2B02JRnHh5q0JvJu
         ll2bWam3cqOM0TMbOLfZ6cYj6qP1dYnDO2UBMt/EoFZ9xJqFGQl8ZJaDvwsvF9+ATL/x
         gT/AK7GVCspV/Sd26jOoGj8a8z22+tBDwFAqkB214N9gKW0cli7FNng3PB+ZYGxsNCxj
         lK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785782279; x=1786387079;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRwVOwJsZLZggZ6iGw9wOgGLRZKz+iqLSxrDRaEjuvU=;
        b=PHSg4fxF5DG+rqJz4G++RYj7m7VuFIaff/MKkbqMTHDchUXkevjkW3qJBA58aD8u5Q
         vD5z0VarWIWow7VqR8dtlFUNUd3I4GiqDqQMZhBDSSOF2Z6kVcXGbspURm/TaRKAe8gC
         tsQadh49oov1BisfCqpK1Y9t2Ppd+Mbf+ZW3l7ZWWPwrO0xIBUx3OViC9sTjcKVk6thR
         Qc9kOrxDN1NagbCySoeJ0JoiiZ3RYJ9t/JXQ4SJTMB3Uaj2iLk7aV7Y37k63522sMuys
         Xv8AdAs9I1GgHZwLTgR/GkH84xhFaHg9/be2JeAAeZHyQiE8fB3EZEVA23fFX7+Q99jE
         ZZDA==
X-Gm-Message-State: AOJu0Yxhnr0umIHCvCplB+wDulAxcdETeY6vz/p4bThBf/YZAbQgL6G1
	tiHBeuPSQD2W9n9sKg5lUvgin/qXLMoYG4qbQtnGLCpV/OR2t6gzNKlvyByssjmSE6JCm77G0i+
	hbquQn6g44PjjJR2YkiQ5BsJZYNA1KoOHN0PtxwI=
X-Gm-Gg: AR+sD12fxnSID9hmjq5W05p1q/60l97VNHuTxyn/exlwsKtAgY2hjMslMUTr/MGnUCg
	+Sj+tUc9icpRVs1G140fh9dv6zylrWJS3dF2oFBSoefOo3OaREXfc3LMj/TeiuA5O993Tyo3eMM
	ROalVKhm5HcaWol9jjHIu24FKHoECs5nh0D1aLjPgP2QZ1oARMjoP9Uba+a8gJvkCSPsv0wpXQO
	WPXG0GqRYOxVDmq6lVI6xPKkdmqwYuQIjPjiLaEFbJDF7ZpWXEv7n39ACn+sqe9dGFD0MKYoxuL
	NSrtYxFy5C9VFBmViCN1YmWrSmBwsFv1Aek5aCRVNfI6ZcImVTkUJpeOJ4EuAH4mjaqbrf2yIdL
	LC4Om28zATiSj13zDqeteW4aDlQ/sDWBMQFj494s/iMJ0mq1+cfPfeGngQQ==
X-Received: by 2002:a05:6214:509c:b0:8f3:13e4:739d with SMTP id
 6a1803df08f44-9084955d96dmr239250846d6.7.1785782279112; Mon, 03 Aug 2026
 11:37:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727115218.109323-1-danielmaraboo@gmail.com> <87fr0vys54.fsf@trenco.lwn.net>
In-Reply-To: <87fr0vys54.fsf@trenco.lwn.net>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 3 Aug 2026 15:37:48 -0300
X-Gm-Features: AUfX_mwtcMKoB0sHUccbHsYHJ8zkso0pwt-3YjZo_aHVbg7Hq0PCwCOxMLPxTlc
Message-ID: <CAMAsx6e-UHxnKKf25FKR42auZiLskVv5J4CVBQ_QYL8rdHKBjQ@mail.gmail.com>
Subject: Re: [PATCH] docs: pt_BR: Reorganize index.rst to avoid merge conflicts
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 3 de ago. de 2026 =C3=A0s 15:29, Jonathan Corbet <corbet@lwn.net> =
escreveu:
>

> Here is my suggestion: I'll apply the outstanding Portuguese translation
> patches today, then say "no more" for 7.3.  You can then create a new
> index.rst that is current with all of the done translations; we can
> apply that either before or after the merge window.  Everybody doing
> translation patches can then work against that new index.rst file and,
> hopefully, life will get smoother.
>
> Does that work for you?
>

Hi Jon,

You are absolutely right. I agree that just moving the entries won't
solve the long-term conflict issues.

Please discard this patch. I will wait for you to apply the
outstanding translation patches, and once those are in, I will prepare
a new index.rst structure as you suggested.

Thanks for the guidance,

Daniel
