Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792937943;
	b=tydS6JbsaKNNv0B1ejAoMXJqxKH8TWx2C2QGZSUkSQxAdYenV5+tTFDZOj3uY7YIx1mV
	 99z5Z/thxFjLXsg4YANABLDT3MOu2NYFVY5i7OCIJ4WiqxOnSk+gLMfvb8aGyK1nuwrpA
	 wZlZN/PJkVZhB3hqScDAL9fv8mfGyOkQLwWVtYZ1NQLYFQPF7og/G2hZ44GrS0o9gwJp9
	 OhE8Wa0mR/Hpponu6bLEahjG8vD/RYRRB4FJrKDBQZjNWEZww3LWpoyNrEnyOKEEtbvwZ
	 6qxYMEULg1TAUh9T3Frs2uCtjmAj4cD14jf6OGxVLas+mYClxz0eIOGFRanB2WjCtcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792937943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=e6eB5/+HfPV8iGsvdknKspHRvaocTX1S/a3F3L9xITg=;
	b=ARlRNTy5FY/ypy9W/537LxW+0gd3luXgyoUtEZiA+AZhQsLCmy38haQS4h/VGKuP53Ue
	 +F61P0Xd4lwy8hPuCPktxirAk+J37UQRkTCTo7whLn7dpnFCeWU4OWGeHnlAI/z5mRWs7
	 bT7o7jPlZokbf9H2m2ad9XGZihl+Tf7uGAj+0EYM9kbaqa5RdMHB9RXnQcytR4ZgccdAm
	 INTwpzctan84EXKyoU5XKdaoQHpaScPWWE68pFLUX5Kezgqi2klHyMB++NMtK/wOCDHjf
	 GLbCVg8d7gcaDtcOd69gRhk+d/W2Um269kKnnT+jKhdHSv4j4gU92m63JBieKNnqCKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="krKMF/a3";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F312606A320
	for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 14:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F312606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=krKMF/a3
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91b8306b9f8so14290456d6.3
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 07:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792937942; cv=none;
        d=google.com; s=arc-20260327;
        b=qlaAxWCkofUiIEWnsLFuP+R3/J9TIImYBI+Ywt/ckCGOMjj7bklsJpTFWxIkPIlKd7
         Rh0gkk5FSpD3yGRVAOnrja81IN/27uG1c0jVx4DCirsSkGWI7rfym6yDwtTYfB7oC9vk
         z/Tb2kR9h9W7+MEU36+mwdY5UvS+1ADL0bltxo2KT7MQ0c46E1jqELm98iFFSqfI375p
         xVzYKKpBvHZkl6Wh0cW/a9cpJdIFEUANjwA5vqBFoc+a6c+6mWJjBa/2VHvn4pdp2HXl
         bhjEGGjXH8j+zeOrg8sDCxD61Jlwv3yHADjRUFXE3mOXAziaVXeS2UFhLJWV6SI2aoB8
         ksmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=e6eB5/+HfPV8iGsvdknKspHRvaocTX1S/a3F3L9xITg=;
        fh=1xTgBzbYKnI2S3RU7ZTLFswadzFFUh+I4zA5ZzZfIFY=;
        b=NPXbXuQInGzofstZtbDI6FXST3G2LDhjrfZUw/coHWpEa78Eafa1nCFNgCOJ+Tsedq
         CQkcWeb1VU0DNB81dm70Wh9BA1YzfW2uzTUwsuxPCBj15qpBZljXLp0l16ZKCRLJjL8q
         pqbtpYBu53s0CBJCF7tNuw+Ds8ssn6ScGp7Vq0C6Q/Z4KKZAA8lVm+FWbbWfifKRBKO3
         kSyC0QQym0Is27a9JtRv+xYWLZmvqaI2frLAluImCehfITgeOEOiGHBwwaK8xMnYtycR
         IDywrxdQg2+qCui48mtmXhoBecJmHGjGUla1pbRI3Gv+NYO3zOKKLgTEnUZOcwdU0snr
         xKkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792937942; x=1793542742; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e6eB5/+HfPV8iGsvdknKspHRvaocTX1S/a3F3L9xITg=;
        b=krKMF/a37dmQMGFgWjgS1lgoM6RJ0MCOZs2MWdstZSDiAD4I9yNYPYzczmFXh8SJsI
         X28FSziCwuvSXswP4y7ixvKPZ7NchH6arExeiii8VSWMplzgyw/ORvp6ABWkIf0Enupb
         yey4Zc7e1QS73OWCgkKQY9b1FSwPqpSs8rHkdyG4f2BS/0bTp+dptDnI3yMt6cykLruC
         ZgGQijwsYWasLpv/rdXpNMNr3f54Drm3vbjXd04NrfbQRgpRLvocSFadd958IoRLup5l
         p8QusmI21ASpHemoe7AeBJ7fGN0SkQaY2pkF2yAZXS4vztUb8ulLC30STQQLoNQnICz8
         7How==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792937942; x=1793542742;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e6eB5/+HfPV8iGsvdknKspHRvaocTX1S/a3F3L9xITg=;
        b=f5nz49B+TTpZ/4uBxPIu8tskQz5pZSVr4MDouS/zb3idbRFBEZBRGOBPNEGidt9Gj+
         J2WxvUIu5sS4+DqyW48jyZptl+3Ove8418nArFjb9fK4/D4TlWuPFGCFZXj67o5Dr7zs
         j/6I0bvq22J6xkmrtRJlB7uxXU79HMHktpeKyS8/KzUxeXagDvd0vJEcVtWPAw4MGI6g
         b8zYKmYQQmOPFTpqMDqRfP7ofUc4NBwG8/ZLrawQFVBcwLrObrK5OgL9m1Qa68vGy2Qf
         a8Gr5F/7JxI6gXX7fccIYSosrL+QJ7AGlvhazvEIvaQFakWZ3DuMU9lzlrNKq1pRbnjx
         xqWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxENcjsITFqEs/W7UPTV5iFCYl8eozELaXYyx9YqjWp9M+PbyJTJlFjye4LJkQ5GCUczs4OW3d0TKU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFPgI6L+d7ahsqfa5kHbzq/jJuGwT0TrTnPIfMVzmQHtnbojNw
	9WNTTPZkerfQMALvjEEojo7gYYrH2gJ2g1VGBWEAtLS2YEBZn8g7s1acWq0DtCDK3uZGlYXkcY6
	Tqgc3WjViaYSwIplVPkp4JQOBtZMUfAU=
X-Gm-Gg: AYBFou3vtpn12OHv8PH3dfuTYAOYV9/fjop+f1j6Md+tMaPNs1CfFyvO1gK4FwEqHK2
	LZCeBCgWNylQ5jCGXTGjiiw45c6GHVsPQOs79GTRjb7XLBFZf1t46ur99TV7Un6GQ+K2eH6G5N3
	EybPPDn8zGMJ0EJju7wD7V7Qb6G6tnBqu91kLrJOAHL0JI1pvmy7ETcUQ1UJWUX0NFyPYMC+njP
	Hk2fEE5R9rcsWAnrMKs3M73FljhBJpTKsMjdzlh0V1ZNl3IUg0665h9o/dp/MFJLGp+4MPJP/mg
	RQ397zikwzQ8/4bnUr+CgV+9kcqYhiJR3Ax4q9F0XeYHOcD9V8wi27qJpvpBwchl7RlLTLSxj6K
	7iBPvxbPLNEVrDkAMFLpJOkLSfvfaIgzYdaO5vY4ZtXgifQD5Z0FEn2M+aUDLkROwwvQYfGiiAo
	5Ed1CIkGjRobwe1E2rxL7i65SZwQD4w3ZtiWd3wLUYNUqJgF67vB4=
X-Received: by 2002:a05:6214:2b82:b0:91b:5d39:e140 with SMTP id
 6a1803df08f44-91c48f143efmr72761506d6.53.1792937942225; Sun, 25 Oct 2026
 07:19:02 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014162921.450235-1-steve@sk2.org>
In-Reply-To: <20261014162921.450235-1-steve@sk2.org>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 25 Oct 2026 11:18:50 -0300
X-Gm-Features: AclHuK9O3SRqSOfWpY-PAriDEEl8Pmx9Mwub1R5Mhg0M9i69HhGFGrrSKFIMqcE
Message-ID: <CAMAsx6ey3CMZrsMH9HfJdU9o+uGySAGvLWXAoAdfFSF3ZudoTg@mail.gmail.com>
Subject: Re: [PATCH] docs: ext4 filesystems can be converted to 64-bit
To: steve@sk2.org
Cc: tytso@mit.edu, adilger.kernel@dilger.ca, corbet@lwn.net, 
	linux-ext4@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 14, 2026, Stephen Kitt wrote:
> Since commit fe12931 ("resize2fs: convert fs to and from 64bit mode")
> in e2fsprogs, which shipped in version 1.43, resize2fs can convert
> filesystems from 32-bit to 64-bit and back, so the mention in the
> checksum documentation that this is impossible is obsolete.

Hi Stephen,

I checked the claims against the e2fsprogs sources: commit fe12931 is
"resize2fs: convert fs to and from 64bit mode" (Darrick J. Wong), the
v1.43 RELEASE-NOTES say that resize2fs can now convert file systems
between 64-bit and 32-bit mode, and resize/main.c at v1.43 accepts -b
(enable 64bit) and -s (disable 64bit), which v1.42.13 does not have. So
the new text is accurate. This was also the only place in
Documentation/filesystems/ext4/ that mentioned the old limitation.

I built the documentation with the patch applied and it adds no new
warnings. checkpatch only complains about the unknown commit id, which
is expected since it is an e2fsprogs commit.

One optional suggestion, which does not change my review: in v1.43
resize2fs refuses to change the 64bit feature while the filesystem is
mounted ("Cannot change the 64bit feature while the filesystem is
mounted."), and enabling it also requires the extents feature. Since
the sentence replaces one that was about a limitation, it might be
worth saying that the conversion is done on an unmounted filesystem,
for example:

``resize2fs`` in ``e2fsprogs`` 1.43 or later can be used to convert
unmounted filesystems from 32-bit to 64-bit and back (using the
``-b`` and ``-s`` options).

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
