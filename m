Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303F821171F
	for <linux-doc@vger.kernel.org>; Mon, 31 Mar 2025 16:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743437547; cv=none; b=dOU3UfuoeL4Ww576X3fl8YXzdpzuHp25pXco23UZ7RG+KDEOcKJL7V0lbhF7XEY9Pbe570k5CHyOtDtDnkoxo1G6ZIHOH0il7E4O9rGSHiP2NYuTmrNi2GdSq1tvOMJCjfxnO9zM8iAAUMu/aYYzw+1hT9FM9vpBly9AQ5JxOBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743437547; c=relaxed/simple;
	bh=an1+g/h3bnaPeIBepE6aMJ/6ukgx++5dzCS3i3DiqDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pEt0VRoM2HnLay6ZHJ0Vn0T9uSjwKO/rSADKCFRZ08MTnlpGReU9VUwQPhOIGkr4IiU3SfVJa/bIJmzF4nKhI1jxqQr1vtXCdjqh8pWnsobmCuVQ0PhEXKxnl1ELG8rG3ivS2Ks2fHDXm5n40+5Mgiy7r18FWLH7980rrKKIQ0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W2zaazU2; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W2zaazU2"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d5bc35ed3aso577755ab.0
        for <linux-doc@vger.kernel.org>; Mon, 31 Mar 2025 09:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743437545; x=1744042345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=an1+g/h3bnaPeIBepE6aMJ/6ukgx++5dzCS3i3DiqDU=;
        b=W2zaazU2qTKxCwXisZL/xY9mDKvOZ+06dsud+XxJ0GnPr8G0EscyngW6xMOeLe3EM7
         B2aBKbl0VdZo7ZIM4JiLlycGF13qgpEXsbRrdQh1rYCAKgA9NvPKp5v9VeqPP1hLJgaQ
         j5env/gxeZXe4U4J0AL6cPB5r7I2tZWZpKuKr4y5/qVSnIsr6y0ndHplEHUZ2tcPojMw
         3IkvN3w37MouiYFz0nn1lOT8LiENQlaWe8MUr7zguBCNGybf77WqWc2XdZ6R6tzN8Min
         YV/EPI3oXVKi2+qImQDMkbG2hrdNzTBrlTFSymtGaZWZmYy2AYNofeH13D/FUNQ7kfgG
         0g1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743437545; x=1744042345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=an1+g/h3bnaPeIBepE6aMJ/6ukgx++5dzCS3i3DiqDU=;
        b=KgIO4PnLcsrU+LGzk3UHzLiBit7CqikldfE3BFVtxAJwCMNI4EgsDszAwM+6hnzMLV
         BUvrIbLwg8jQf1/ZYrPayvvK+a/dQtp1IXVnu2KPQmgSsdDo8sQ946QhGfZUc9UEN1PO
         S7DgMJyaEPVaScXWjE+QfUONG1mmU8nDeN7KHbOah5qdO4Rt1NkvWeigWVHNmu1+Y75r
         /31gh9LXVjZBOhWxqprhg6R3vXM6cRVCB3AWYKKfHPUVNH6AXAkd3xs+MgJc8/YuAJI8
         EMuyhuQT7J8B5qTCYloWhh8ELURs6ynjvvUCAZ7oN8LPbDOdy6qy3kWTPEQ1JAqX47WQ
         mqog==
X-Forwarded-Encrypted: i=1; AJvYcCXgzShH3Go2G19M8UO860rnkdXyKNWhPw3wFtmn056ur+laz8AjDfG0SmAGJV4BSma2r25LvZTjpBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwduzHYyeQi4HWAHk6KW4OHn37zT6QvXiUpDtHMkbdox88efij
	RMx4pSHA8996U25JtHgM1UBhHHz4N3aFZhOc9iFlte4/poecNZcZ+df0ZrOooVqBBNi7otkrQL0
	WLRH3PL4IkG1FyMCJWNnGWeH+8QJc10JkpQZq
X-Gm-Gg: ASbGncsum6t5VJjWwSPxYZo8+1O1nilZVWnDrrbRGJoDLI4iwBnTkp1qlFfloIn1Whg
	tEXzzLdAmvIL8lDW2JTMyGv4/BShbYMhc96ZNAIBRMdAGKh8c5odsQNze7h+dCSlTiLfPQYIfTh
	/X9Z83STYIcuVKb8s8ovHU0tkyewQ=
X-Google-Smtp-Source: AGHT+IHkkrnJidXNy1ORXW0y5wmiSeC6Z+atM6xwCyKPc4zUkW9tuui2BDyeFn4t44wEgufSUXTW6I8SJc78PrrsIxo=
X-Received: by 2002:a05:6e02:2386:b0:3d3:cd81:e7c5 with SMTP id
 e9e14a558f8ab-3d5e0f479a7mr7942495ab.8.1743437545077; Mon, 31 Mar 2025
 09:12:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324065328.107678-1-avagin@google.com> <7263e869-d733-44f4-bd2b-9c6f89202909@lucifer.local>
In-Reply-To: <7263e869-d733-44f4-bd2b-9c6f89202909@lucifer.local>
From: Andrei Vagin <avagin@google.com>
Date: Mon, 31 Mar 2025 09:12:14 -0700
X-Gm-Features: AQ5f1JpNhLVBHOZ1scUgN574PAKvq55Nm3GTeM5MgiHWALnnJEtPRQSdKckpLU8
Message-ID: <CAEWA0a6KdODW2hD3G0PO+yUFC4rZCaTGU_orC3CAuHXRXoqREQ@mail.gmail.com>
Subject: Re: [PATCH 0/3 v2] fs/proc: extend the PAGEMAP_SCAN ioctl to report
 guard regions
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	criu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 4:26=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Mon, Mar 24, 2025 at 06:53:25AM +0000, Andrei Vagin wrote:
> > Introduce the PAGE_IS_GUARD flag in the PAGEMAP_SCAN ioctl to expose
> > information about guard regions. This allows userspace tools, such as
> > CRIU, to detect and handle guard regions.
> >
> > Currently, CRIU utilizes PAGEMAP_SCAN as a more efficient alternative t=
o
> > parsing /proc/pid/pagemap. Without this change, guard regions are
> > incorrectly reported as swap-anon regions, leading CRIU to attempt
> > dumping them and subsequently failing.
> >
> > This series should be applied on top of "[PATCH 0/2] fs/proc/task_mmu:
> > add guard region bit to pagemap":
> > https://lore.kernel.org/all/2025031926-engraved-footer-3e9b@gregkh/T/
> >
> > The series includes updates to the documentation and selftests to
> > reflect the new functionality.
> >
> > v2:
> > - sync linux/fs.h with the kernel sources
> > - address comments from Lorenzo and David.
>
> Thanks, sorry for delay, LSF/MM/BPF is why :)

Yep, I know. I hope it was productive. You mentioned in another thread that
you are going to handle compatibility for the older kernel. Let me know if =
I can
help with anything.

Thanks for your cooperation.
