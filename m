Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD9D39A046
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 19:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780516202; cv=pass; b=q9RWAsZXhXYJEjbz00ykl4W1An16ETM/gH4LX6PtZ67wCzUFTYysyp0NqdotGXjahr7iBT3dlFXWd6NUe9cVuNENy53DOCGHMPd1z1j75ZwMOECAEXOZjFk+wXnZLKvFYIfYe7h7V9TeZMCW3GOXk8N1AV93sbM0w5yYmnb+kGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780516202; c=relaxed/simple;
	bh=3VBngLxBF2I0xQYlaMR5j2hNOPHXqKUlcrKWvcZJ13Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UjcStrMXYDljFsZPa7XRmazBc1CxKuaMhufcVH5VGwPMYC4ki8yyPC5upElRcTyaqeBLxzRT3uwmLvZL22OaTBt4/WsqdM0sQPxtrK+TbOtcdUNluYQ7lNECTKwAdp/54zArH0rhiNv1ercodOESZDaPq644a7sXitHNxCrrozM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FLntJZTF; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FLntJZTF"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51765531803so149181cf.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 12:49:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780516198; cv=none;
        d=google.com; s=arc-20240605;
        b=edAwp0TFT12M9rvOt0b6SkdZUPWGW7dpyFSm8l9v5HH78grnvXnSx601dGJxf1/aFp
         PczMPdES6DL+7N26AMOyXJYWFpq/zZgeHCOvzdl+rEjFMlpIW/CmHybxFmefCGdbdjjM
         fjhf4i2u9Er5IC3kQQbSwshZ7SObFJLrfyUC8hm39EReek85L2pfBsTFLZE1y+8CPjk3
         7eS1Lf4Zvh5bhcL6JH4vgmB2DueFHg7Q5M/PV0UnlzgRnKweC7+fY5vc5S/wVAThuxb8
         QGGGsBD5gx5tWpMz23ohJG04LzuAA5L/A5pqJ4Eipkn5Y9gm3YdC+LPYA8pGHuVK8Are
         uJyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Wm9+xx3S7bwmxXSWwexU50eaBO95emwKPo2CvJTqv8=;
        fh=wjB2u78x2Ey5deZQwLJf7PcoAzSdOYEwsB+8WO9hvOE=;
        b=LxoXK8TTjhfWFaNEa58PTCcVrEG+uFeDy97XpDX750ljikoClFEUPDxaKdI404P/jJ
         jrHf/V3IHjauyzZGD0Jda9NCMUtkie/KFFX2tHuI/DARQUeFKoGnd9FZVWhqxM0ImoJm
         RLpAZqxvW1+0dnY6yewQuzThz1jau/LPfNOTtfnVHOVmT/wuvJ63cD03SEgF2AyKi2Vf
         HX/uNVNPxNfhAzYY5L15aylBl2tgC8RFKTkBr7zilYOsR/IH54aIchEI7EvTFbd3nUpY
         f7ZZXo7s8BYCejJHy1hBhGYL/ZZTpG/S9oT8L3gyosF+RWnXxNTlHOlTz2xcyqQ1QKTN
         9OEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780516198; x=1781120998; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Wm9+xx3S7bwmxXSWwexU50eaBO95emwKPo2CvJTqv8=;
        b=FLntJZTFz7GsVTd7FrrQeInnCETeY+5C+mmRAzBZux8hHT5j/WOF0CHL/1/4nMlbQN
         rZ5OGzHoS03ZKuhdzT/xPub7Tffe7EycHdxzXGhWEouPAWyGwVkjcEMTzlcjAtTUJNPk
         9cNn3J3eMREcOXBiodinsXSYGYDnihn5MRROA3ntDrzabNGuydKrCIeA7wJiO3C8+lhA
         h6t2ICaGr/r5fTRWFBIwwC4RH16fLpPZ2oTN7Su0AP2SAKHmlNY+CKU7fzziVPzrwNwi
         43/vKGjSSzLcGUF28naV7wA0vYmwdPcJPfEcC7x1swLHRv4U7R8sV1/JvqCL8UWsl+RE
         GbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780516198; x=1781120998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3Wm9+xx3S7bwmxXSWwexU50eaBO95emwKPo2CvJTqv8=;
        b=j3gKR4Udn72xy9wqA5XRjNWeEQnebpR4MXpHfIjdUuXlf5x1zz9VQR5sFFeFv2d+55
         woZkoCC4Kvz05Nked0AXVXj+9IPT0KsCnr9p/Kgf61SP3TVg0JB0ksyK9L7DZnEcy46n
         EUL4R33rjtXiYHjmMPV9BicqxgBB40hGUhfbAfjmQgrq3unXlUEZHopvP8+gfbFGIcYP
         efwxQJtT1FcFTfGSdg9+klV1zwJpSWDLFdPJvHpk9kWYDeKtyVK1yke1hApXnev/m7uX
         SHMsfnz+jt7I+PChsk3iBh5EPiLgPYmkVifed4cNO/5IgDxL1UmG10nSvvzdHlXlsmAp
         FMCQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Ae+B+GqxN4oPmhoYhwcmh+DrJQKOrvhlZ25w7KFsCqTvgNVicfU5SxxLn6G9BQ5o24gvhUkUi52A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWeuyCssiUnH+i0T3xbJ/uRmIflBjYlFNoWdzI44w8veE8Q4JX
	kat+CRfFXEpd/0wB9cokVmLnHfAJCK7KD8wCJBrsIP60Cf2ebH5XPCGA/mCTc9V7mgRaDavCu0y
	fexWYdTTnd6RRElo7X+LFwYUrbj2JQujLyyW/RAVh
X-Gm-Gg: Acq92OHqHhysJe2Ym+o3ahSmjJrXKMNc4nKZE/DNsFUyQyYSlB51oGSMnKhMnNEThO7
	EePMVIS0+/sXV+K92xi9+XhUMnl1l6kMP+CVTxVc0/kd2v8YH5RTW8sPXpD6/1FPIp0SPXiJ5YJ
	5IeP0gpiSBBKl+10F+O7lD7cYKeUUTkThfzeYxb8abQAkbe2inItxOUEHJiijAKSDoPM8F4uBN+
	ijFpZfCoNrGjyzOAdhlHOxZkGdG5AEfcbt0WgmFcc8e4OYYuYtSmZtPM7KyNcc05pl8EvrOE8Lg
	lQuISpo/6k49hfnGZnNzDOmxa6b9rK2T4p3m6lAOwuBY/kBe
X-Received: by 2002:a05:622a:30e:b0:517:6488:904a with SMTP id
 d75a77b69052e-5178789c190mr519281cf.20.1780516197590; Wed, 03 Jun 2026
 12:49:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779471082.git.abhishekbapat@google.com> <20260522131108.f972659717367c67082f3766@linux-foundation.org>
In-Reply-To: <20260522131108.f972659717367c67082f3766@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 3 Jun 2026 12:49:46 -0700
X-Gm-Features: AVHnY4JK2eGu6vAIyV7j2iWie90EfZmLlPJI578QpZKL8AELxwAYPqn3IE5wdxA
Message-ID: <CAJuCfpH+DQePnCFy5Ro-yKMYQsizQHPuY25m1tWgzGGg05xm6Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] alloc_tag: introduce IOCTL-based filtering for MAP
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Abhishek Bapat <abhishekbapat@google.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Hao Ge <hao.ge@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 1:11=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Fri, 22 May 2026 17:45:32 +0000 Abhishek Bapat <abhishekbapat@google.c=
om> wrote:
>
> > Currently, memory allocation profiling data is primarily exposed throug=
h
> > /proc/allocinfo. While useful for manual inspection, this text-based
> > interface poses challenges for production monitoring and large-scale
> > analysis:
> >
> > 1. Userspace must parse large amounts of text to extract specific
> > fields.
> > 2. To find specific tags, userspace must read the entire dataset,
> > requiring many context switches and high data copying.
> > 3. The kernel currently aggregates per-CPU counters for every allocatio=
n
> > size, even those the user intends to filter out immediately.
> >
> > This series introduces a new IOCTL-based binary interface for allocinfo
> > that supports kernel-side filtering. By allowing the user to specify a
> > filter mask, we significantly reduce the work performed in-kernel and
> > the amount of data transferred to userspace.
> >
> > Performance measurements were conducted on an Intel Xeon Platinum 8481C
> > (224 CPUs) with caches dropped before each run.
> >
> > The IOCTL mechanism shows a ~20x performance improvement for
> > filtered queries. The kernel avoids the expensive per-CPU counter
> > aggregation (alloc_tag_read) for any tags that fail the initial string
> > or location filters.
> >
> > Scenario 1: Specific File Filtering (arch/x86/events/rapl.c)
> > 1. Traditional (cat /proc/allocinfo | grep): 22ms (sys)
> > 2. IOCTL Interface: 1ms (sys)
> >
> > Scenario 2: Compound Filtering (Filename + Size)
> > 1. Traditional: (cat ... | grep | awk): 21ms (sys)
> > 2. IOCTL Interface: 1ms (sys)
> >
> > Scenario 3: Size-Based Filtering (min_size =3D 1MB)
> > 1. Traditional: (cat ... | awk): 21ms (sys)
> > 2. IOCTL Interface: 14ms (sys)
>
> Yup, textual interfaces aren't fast.
>
> And ioctl-baed interfaces aren't popular.  One would prefer to see an
> interface which uses read()/lseek(), pread(), etc.  It would be
> appropriate for this [0/N] to have a discussion of why that approach
> was not chosen.

We chose ioctl because it allows us to filter data without aggregating
the per-CPU counters, which is the main overhead when reading this
file. That's why we can achieve 20x performance improvement, provided
we do not filter based on the allocation size.
Aside from that, I plan on introducing an additional ioctl command to
enable context capture for specific allocations.

>
> >  .../userspace-api/ioctl/ioctl-number.rst      |   2 +
> >  MAINTAINERS                                   |   2 +
> >  include/linux/codetag.h                       |   1 +
> >  include/uapi/linux/alloc_tag.h                |  87 +++
> >  lib/alloc_tag.c                               | 303 ++++++++++-
> >  lib/codetag.c                                 |  11 +
> >  tools/testing/selftests/alloc_tag/Makefile    |   9 +
> >  .../alloc_tag/allocinfo_ioctl_test.c          | 505 ++++++++++++++++++
> >  8 files changed, 918 insertions(+), 2 deletions(-)
> >  create mode 100644 include/uapi/linux/alloc_tag.h
> >  create mode 100644 tools/testing/selftests/alloc_tag/Makefile
> >  create mode 100644 tools/testing/selftests/alloc_tag/allocinfo_ioctl_t=
est.c
>
> At some point this should grow user-facing documentation, please.
>
> And the right time for that is now, because such documentation is
> useful for code review - it makes that review both easier and more
> useful.

Ack. I believe Abhishek is working on that.

>
> Sashiko had a few things to say:
>
>         https://sashiko.dev/#/patchset/cover.1779471082.git.abhishekbapat=
@google.com

Ack.
