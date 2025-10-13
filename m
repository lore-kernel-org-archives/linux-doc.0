Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E492DCC1A
	for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 06:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760335595; cv=none; b=e5qUCos2invqWO/WPkGVZqULRRYQPF0Z9/tbVeZXpIjoM6fOgQxH4Iwe9rxzS7qJ+XswoAle0UGl4C8VtJH+BnvB0Ny/pL7qj95J7dRdcbCdUyrEI02lWbQyvRYcDNbb5oEbD44nDy4LXrlYAedQpUSrd2kE1b29P4CxoclRQ8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760335595; c=relaxed/simple;
	bh=RSL7ODefchx0oaqAeJ6n26+cCreCbBCiVlRzlUCjIjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r9hrwhPvDVmJs6Chj1wllKILnFbkoCcufuRI3Oda35QPamNYGD231JWQTGzN3onAx0fb6FiJqPQG0zN2gpvtiTucC2AdM3COoo7ERcOuD9dKCOsY3AL7MzfSwJcVSzytOJmXf7f3TF9oxWQt/omnvv3Jv3Yfpr3XsxgsSsBUnZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E08XGpzm; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E08XGpzm"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6348447d5easo3603462d50.0
        for <linux-doc@vger.kernel.org>; Sun, 12 Oct 2025 23:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760335592; x=1760940392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSL7ODefchx0oaqAeJ6n26+cCreCbBCiVlRzlUCjIjc=;
        b=E08XGpzmHVw0+qDzU5sCl5j2nWjFq/4gmZrI+HSMqUtrUQdW75O40jzorsqViIJ5Op
         YueCYgQvB7QPc4pUrMdPo6WnC+J7hR1UlRYyfnedh94HC57pUVWE3OllsoN75neJ05zd
         7IcSugJKTLhjY0wSwmbSfQ1BF+GIHKMdxFsZBTI139vylrWwsfot4THqwBnc5WWO1ADS
         owqxNkoEXxySlcupDmKJPMhXmeet3aWT00Ul8qKcfRlZ1+XFeBRnw6Pd6ASpf6fNaQKa
         kriZgtpxAU1TcDZRtFRbT0eY4rS6fV6XOKhazNP5uPTqs37bNueBArVUKMrsryxA49Ua
         /esQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760335592; x=1760940392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSL7ODefchx0oaqAeJ6n26+cCreCbBCiVlRzlUCjIjc=;
        b=D3s79w+QRe2umeEQPzzXihL8lZbK4UVzB6tbd24JVo/0L9j6HRnpts4LLCSo7ol4xk
         ty+xkRnSjqLnZOS8YyYZuFpBvcNX9hmB8scmUYUaQmt7EuJVMlTU+CDld5NnBrrodQGM
         Tj3rgg5P5K+Vu//rA9C6DFHL12Oq1pXTQkXUHNsmV4XEQhyqi8vB+JswhoxlZOVb7l8I
         NIe/9zK2pFBXcndKcLmqmRJHHJuR0qS7Uh/agCOEARA2eNyvaa8EKgU7+57prTf3juu/
         tHxIBSHShxW4PvVdaQel1y5NoNUyt5nvAzLV+CNAYuQpkGkI+6XGgGdmgPSVwmUwHRP+
         6rPA==
X-Forwarded-Encrypted: i=1; AJvYcCWArlx086y1YmSt7MhZa2Fts3zX52By9afTnOYZzqndqBFIVwBbc1ZjBsIqWlijnrB3h1UYUgSDA/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFzc6K+Ty6dp9qdQexrkUin2hO65LzG1GgDKyUps1x7SspXXFf
	O5kl/do5C8bTFqFGEY2dDQLpsdfRv1uOmPOgQhnQVgZrAEsJy+3VFARcMGnzAuezpXkCgjtVtDd
	ef4c7epNdgA4nhMkSUKc2GxtR2BmgJms=
X-Gm-Gg: ASbGncurOKHb2z3IVr+UZqUU9jeI84wyalrgP2j2jDWsaCNCqW5F29mrHIjIBsU2qDg
	cafcMKRxXcAYg3h3/ucV4Q5kEljV8EcuT5nNSz+5KjP/vlYN9y7M3wfga17PNz61vAgG55kPRID
	mWuv2D3P67/C5nPgazQqZZJIxQrX6TjOzDZNZksq/zg4oA4C8NTacWX9tiPc/zlvFHRJPDbBlsP
	Gvb8bqugi+vJgwQ0QGCybKHhC/F4gXm6jJc
X-Google-Smtp-Source: AGHT+IGNAOIcFLi0/Sm93Y3jSHSuxr+30gS3y7Fr34MKhVqQQnt1MJ/lLmHR6+qpb+bVmq5VVWr9ycljJFZ2Qxe2L4U=
X-Received: by 2002:a05:690e:4142:b0:63c:f4eb:1b0d with SMTP id
 956f58d0204a3-63cf4eb1b25mr7582533d50.22.1760335592286; Sun, 12 Oct 2025
 23:06:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010094047.3111495-1-safinaskar@gmail.com>
 <20251010094047.3111495-2-safinaskar@gmail.com> <CAHp75VeJM_OoCWDX20FhphRi6e7rG9Z4X6zkjx9vFF12n7Ef7A@mail.gmail.com>
In-Reply-To: <CAHp75VeJM_OoCWDX20FhphRi6e7rG9Z4X6zkjx9vFF12n7Ef7A@mail.gmail.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Mon, 13 Oct 2025 09:05:56 +0300
X-Gm-Features: AS18NWAQKixJeSnu1jMDTs2ReasUmQ44oKevMSLcLyEUnjeI8Werl5Jwf9tycOM
Message-ID: <CAPnZJGDvHbDt_JvDNLN+LaU+5yFyB_qkdBtVhSEV60_yktAVzw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] init: remove deprecated "load_ramdisk" and
 "prompt_ramdisk" command line parameters
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Aleksa Sarai <cyphar@cyphar.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Graf <graf@amazon.com>, 
	Rob Landley <rob@landley.net>, Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
	linux-block@vger.kernel.org, initramfs@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	Michal Simek <monstr@monstr.eu>, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Dave Young <dyoung@redhat.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Jessica Clarke <jrtc27@jrtc27.com>, 
	Nicolas Schichan <nschichan@freebox.fr>, David Disseldorp <ddiss@suse.de>, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 6:02=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> 1) often the last period is missing in the commit messages;
I will fix in v3.

> 2) in this change it's unclear for how long (years) the feature was
> deprecated, i.e. the other patch states that 2020 for something else.
> I wonder if this one has the similar order of oldness.

These two commits were done in 2020, too. I will fix in v3.

--
Askar Safin
