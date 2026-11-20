Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795203320;
	b=BSye4NrJ8M33cTXaxKMFE1fC805OFk0JTgNp8Ium56yuYBeHJXUOxPf4gUvqRtzgqek4
	 mmjvk/NdhMwxO6TeBAgS4DpOuMneX0jxQrUayxFDWn1SUjYz0qHrMx/zqHLtp0p18sEWy
	 3dhHbKEJH2r5uL5SbBtC9O+QdSl6bE5xFYj6/mWW6+CkVPlAahTTTu0P4kxHicyVAQ/y9
	 vd+tsR47ZQtXhKNpF9SxwepYRx80v5UM4vX/+2YvHnR8xXHvOcpfFqAf7DTg0IXQg2y1H
	 N3vsABA87dcqNbNxpmXukjPN8QTcUcVrXq+GpxxLNdrYPSVJ+kgXM4/Cg5104scubGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rVJmHutVQZugQ3dWxOPlJ+2HDsz3aYGVNDsjIuC8ZbE=;
	b=pzY1Oqq1Sj6zv+yII8Mf807uhsX4TZ/wNsQy23XkFr+8sA0mlRUjPdTO8AbYVOhjag4P
	 vrR390zQVXgJqUDGPL5YgzI5BvtTESJW/bBzD3xlanlhpfExAB3L3B4+rpO7IOhhzdiwj
	 VyEopu25RicZkkSTqDYe23hXNGT+DSXobL5INaJmgblOS+c5q2dkavbf6PoxXCdKhXias
	 0nIPWWE9S0XVPKq0g28Iw79Zm0m8sdixZHBjFRE84ImRETIYcY/izhLsLS5UK64fuX65d
	 kmP6G2XqXctQ5clpF6eDSbWfAuEBhRb3o8/PC9NlyeidH/+cpc16eVSwzvQzWUQLjgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mEayzNdI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD9D60A2606
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 19:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDD9D60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mEayzNdI
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so499012866b.1
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 11:35:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795203317; cv=none;
        d=google.com; s=arc-20260327;
        b=j+eqLE3cHwsquVVczDk8CyLNTAO2xIg9gRcxs+Bqc0euZlZVMtv3XlVtQQuzmmyNGP
         JGryRJ7lobHV/JJOlnfzzdEwB7946bWQH8g+GxMNS9Qj8C8y7UHReqYSM6aXVhYZuG6d
         E2vC0OJ61fDyaALC/2PeTN29goFTrJxjzmgNBDsBu4RyITpWu5P1xnhRm1bog1l2rb5b
         Xr0TJn9Ny8fEhwrHRXYJPMo7W1W6f871bBgZFkrJ+uDyRgL3BHvSSEnxEzjZkeIqq4yf
         nC3MBxRLduFDDD+R1hh4aCHe0LvbAklm3/+O+67IfYz1cq/w7IPYIYsmOoEHz0WVwxjz
         n3TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rVJmHutVQZugQ3dWxOPlJ+2HDsz3aYGVNDsjIuC8ZbE=;
        fh=R6zU8CkKZdaatQ/ajz9c+ZtdA7CTAvzom3gwlBHtdb8=;
        b=ONpuOcQYxLUOOV8hV/BtA6+MtWq7Le2Oo+ADQ2qLuRyfZ6Ul4+XTzzKIhRqoP9LEhf
         HSrq6qW2BuH6Urnek1hm18lgnm8fEfPihkp2U4IlicRg/LC/OjEBFGTzpFH5VqshBNjI
         UZ5vhNh51vt0vGbcEIlYVlWi2EBB3zS9/RASfCsIFE4YxXzYWFBpni075vkiEhZi4FTk
         cdcIaVU2e0jX56ytWorfoWc7oZOWP5T3lRoOAyVebIqR4Ef7oBOjTb1ONZcqg26kWDuf
         LEP5UgHVlByod7Y6/ok2jvHhST3UY4LBiEdpX+HDm6omCi4uCjixQS78poX7V1nhkbar
         up4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795203317; x=1795808117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rVJmHutVQZugQ3dWxOPlJ+2HDsz3aYGVNDsjIuC8ZbE=;
        b=mEayzNdI3RbBXowLZsBRN9QL9E85SiUM+2Zma239sU2Kh5ksSQzTSY0ziLpiHV59CM
         7SYo/SGHf9f/BuaQcw7L2iv8PrZbptbwejj5saAaosdugF+c/B6mu2N2VcFs3P0J30Xs
         iJONriwUSnCKSsvV3YNuTBiMdGh2ko87iKPSXKaspCKEn8Eg4sIKq9PASEMF25S3rqL+
         ikrtvub/lopTx+V9oIV7ULiuNbYeJREQZANEFrs6J/Ra/Ji6BEJHH9f6CAD3wgAgK2ZV
         tPPXZ4d3w3MMsU/kZaH+NVG54K7lHkycb/em4YaaXq8r36ZApv2ERWimswbtCLQ2nAOA
         NkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203317; x=1795808117;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rVJmHutVQZugQ3dWxOPlJ+2HDsz3aYGVNDsjIuC8ZbE=;
        b=cuGoGh4lcaGStTvAYErxcGVvUiKmWwNPKA1E5PKVBR1Y/La9bkQEmCmK5bHKGL0kIu
         OLCw390V28GDjLdHqVAD7AJsEsuvVUY41mkvFMrcQVUpsZgZq3UaYge6XAyTA/4F+ZEG
         2azItB4acjvB5KJYwOV3UAGeu/lkpc/bCk8xIzOO6KFc38GLSmQ90oKuvq+fWprGLe8o
         oSjDgIcPN7yV/YFOfY7v57Yz5ydd+xNbfkoR3lAJpMMowwutbJaQxLnva1TXSCagU4xu
         T3jAtFrQ3VHjfjPmFEvx20K2lNgClmRG4ZDw4Of8K1s/kPS2vewVw903tBaNkgQbU0ng
         M5QQ==
X-Forwarded-Encrypted: i=1; AL+hErFyX+Mqb2k5Z61nx4bmATAEVvSBHuOIn0QRClh0amQzleUvULiqNNZ67kaYYT1e+dJX/HdXqiW5cmw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Hvbu1Xte9B8JYYYhvh0uELEeSDdTbpVw81+q4+2tZjDW8Qwas
	T85R88HW5MeZ9w83kLBP1KkUZa2K5emL2l9X3jrktiwBBEDhUm4B3zxacrNhzvXApsNw1XaJc1s
	tCuW8/TOUHI8LZ/uI2N0HY+9T7bgwNQF32ll+G622
X-Gm-Gg: AZFdTZc4y76xOeA5dyA8X0+UCe9sh5I4fegEckOVi+uceZAWnYXHqa7bUfQN1Bs11lu
	nZDj/qVHgP4rjxhgXmdXE3ygyaoDErdz/tDstgOjdmr2WGCJvV5pFRGpwXplqwXD9/TFO6JhoG7
	cLCk76fIqMUETb/CRMGfNij9DkmprdSlyR5dJTjHkzH/YrdOunsCPt1Tis2Zeg16rcLbJ0Tdvsm
	jQn+bR4z4EuZDfOJLAmPhLddS3EV1kdrHAPf44s5hQ/+q8GAAWSvu4kb0nqAcFz6PJKLr/AnqCH
	BgrqyYRy50BSAq8dFVvXED9Z8a4LQlWVLGvEx7gJvC50zGd9HrfybwSAwYvDhgX8iHoVqreZeQi
	N9OmSDwtx4dLbNgWOJYtTJpfs0gj8HlDjO/PpYiGxDnXPNPxCLurqPWWAjPnFDaj0B9Sp
X-Received: by 2002:a17:907:60ce:b0:c25:5159:6a25 with SMTP id
 a640c23a62f3a-c51317e322amr590730366b.6.1795203316417; Fri, 20 Nov 2026
 11:35:16 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
 <20261113221248.3535369-12-wusamuel@google.com> <20261120-antitoxisch-flott-sense-8c2a09fc9679@brauner>
In-Reply-To: <20261120-antitoxisch-flott-sense-8c2a09fc9679@brauner>
From: Samuel Wu <wusamuel@google.com>
Date: Fri, 20 Nov 2026 11:35:05 -0800
X-Gm-Features: Aa3M54pZ23SffgU83N8qfNlS7foyPp12zk6Rc2qBKf5ucMmFiR6202xmw20UsI0
Message-ID: <CAG2Kctri9R6b-_OiKcsabdBmLdeWGVY_zmpqqFgDHLKKCDDezA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/9] Documentation: ioctl-number: Add
 PROCFS_IOCTL_MAGIC range 0x10-0x11
To: Christian Brauner <brauner@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 2:23=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Fri, Nov 13, 2026 at 02:12:46PM -0800, Samuel Wu wrote:
> > +'f'   10-11  linux/fs.h                                               =
 conflict! procfs ioctls (PROCFS_IOCTL_MAGIC)
>
> Those are PAGEMAP_SCAN (16) and PROCMAP_QUERY (17) which are already
> in the tree. The two ioctls this series adds are 48 and 49, i.e.,
> 'f' 30-31, and they aren't registered here at all. Please add them as
> well.

Patch 1/9 here only backfills the existing PAGEMAP_SCAN (16) and
PROCMAP_QUERY (17) entries. 'f' 30-31 for 48 and 49 are respectively
in patches 3/9 and 4/9, where their functionalities are added.

Patch 1/9 is standalone, so it can be picked up independently (or I
can resend it separately).

Thanks!
Sam
