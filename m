Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE790130A58
	for <linux-doc@vger.kernel.org>; Thu,  4 Apr 2024 19:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712257278; cv=none; b=EKTU7CCxm6DdWspYYH7Jp1T65RJrzkOayDCmO2h/+Tsu2ExqolNDf2uMilXNmWFqrERDOd+pDMrryrOAnpvtMYGxLLzOudc4i0ALT2aI+KzFcJe1t8IkUNtHzTpRq8AHltKK/Q31L+0mg45XuHUK/BJUe3j+tpzLl3NP1PAc4lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712257278; c=relaxed/simple;
	bh=6F9JtmS6q3l7l4wzo0k5Ul6ynXqiVKXW/Eg8kXMxe48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzg+NapNqh4L/cHUEIrwd+HPsao6swITtP0VDz9OZVXvxa8bhPxaom5yldIGQPWqKrGeBEGwSkh2j7+xZ+KGej6D7m/tT6UUGKsg8q1FvHPY2mSnsuusSJF1CmgfWU73DYQSj4USIB45Hs3p35aK5n5qZXhHI9/ZCVSV6zi/9F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QQB/EhkI; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QQB/EhkI"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-432d55b0fa9so70191cf.1
        for <linux-doc@vger.kernel.org>; Thu, 04 Apr 2024 12:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712257275; x=1712862075; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6F9JtmS6q3l7l4wzo0k5Ul6ynXqiVKXW/Eg8kXMxe48=;
        b=QQB/EhkIWZHPWusjUoiSwg0Qg/UPp24eWEfbD2ncbRHKrnRs9SmCRHIa0XrrMDjs3J
         Onw/zAIrujasxi0grcnWopVH2gCmtzoKcwTepjam40IpIHB8/1pMCCVzq8rRbHErFhhO
         W5aoMV1rJRUP66aDBocZaJ84Wh5mb/4tRc0zzW4zhPg03AfJaMdOAROjVIOiRWGl20/h
         Y03dcTTjukzk8O8iSBA2rz+HAaaZazBUN0sNq4L+Mg8eClKjaEdD0vN5I99MJ40+28Ji
         SOVme6VFATIRTpMkeczBgKpjtCuRGVca7gygVUcff7XlsYQoF3b3YG8XWUs8qVI5UBP0
         FiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712257275; x=1712862075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6F9JtmS6q3l7l4wzo0k5Ul6ynXqiVKXW/Eg8kXMxe48=;
        b=kvmuGNnlyvnGroAC4+vscxhqu+ty5rP07Isahva7LwOyJGVrBq5R1w9PKoSnmA+NX0
         ySG2r9yk1gGQT5bMWHHKspkjmyBZD2zU74bFT8RENQhk8+wGHnn9s2v2ebGVGN9UZjRe
         8csla7F8NYRiTO+NUumALLV2j5U5yYoZFu0T1rRjjLOQf4vWl4VzrkhtVjCxPBu1DND+
         LNHw63BCbgNM0gBTafMGcaOxUNBH6zavB7SDAbf/yXUih12ODVFOxXvE0gfaV/W136pL
         R3P5BbmPNUPjeYYKfjJmOMjb1tM7GwikB+W2leEqZLd0uij7CPQqU9P5p+/Y5KYHqkEH
         R9LQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVtj7jn9nRvRjk0FaRXGo3+u3p1ZgsOyixFjO3wgWSiBmVMkQDdZPMKpoVk5uZJsEeqPyzrq2FHfiX+FfbLGNndDDyFoojflJo
X-Gm-Message-State: AOJu0Yy/wyErah0xGUz68KUMOXQI33ncXhIvshPjHM4Q42UZqsqFrrcS
	cQsFwjSgqfUtZ0mj7czrSHYS6DlREowIz4RmIzecENIUiV0mrsU8ifE5QlKunSVmG+9c7Z/D2tO
	dtihhGdGO3643NCZaO9VAjQz0ZeAx8b9/o3vs
X-Google-Smtp-Source: AGHT+IGscPnJMaTflamSyiou6qNPGPoJh7bHworqGeF+ZpFaqtTdQxOvpK0LbohyrD8zZtbSFVEzTa9SHwxS88UjGC4=
X-Received: by 2002:a05:622a:1808:b0:432:fea5:e3b4 with SMTP id
 t8-20020a05622a180800b00432fea5e3b4mr242008qtc.3.1712257275379; Thu, 04 Apr
 2024 12:01:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1711674410.git.babu.moger@amd.com> <0db75c94886da62b8da498ef159d8fe27b0b3811.1711674410.git.babu.moger@amd.com>
 <CALPaoCgRtYLnzpkL6uVjb+LvBbxD8ANRuzACP1UQ=rkzk8TCqg@mail.gmail.com> <08c8162a-f7d7-4e78-8a2a-d9c86780429c@intel.com>
In-Reply-To: <08c8162a-f7d7-4e78-8a2a-d9c86780429c@intel.com>
From: Peter Newman <peternewman@google.com>
Date: Thu, 4 Apr 2024 12:01:04 -0700
Message-ID: <CALPaoCjTbTStJiSYRCtcdDgqyNvFrbF3WH3iW18nq8Qk5D4BZg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 07/17] x86/resctrl: Add support to enable/disable
 ABMC feature
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Babu Moger <babu.moger@amd.com>, corbet@lwn.net, fenghua.yu@intel.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	paulmck@kernel.org, rdunlap@infradead.org, tj@kernel.org, 
	peterz@infradead.org, yanjiewtw@gmail.com, kim.phillips@amd.com, 
	lukas.bulwahn@gmail.com, seanjc@google.com, jmattson@google.com, 
	leitao@debian.org, jpoimboe@kernel.org, rick.p.edgecombe@intel.com, 
	kirill.shutemov@linux.intel.com, jithu.joseph@intel.com, kai.huang@intel.com, 
	kan.liang@linux.intel.com, daniel.sneddon@linux.intel.com, 
	pbonzini@redhat.com, sandipan.das@amd.com, ilpo.jarvinen@linux.intel.com, 
	maciej.wieczor-retman@intel.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, eranian@google.com, james.morse@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Reinette,

On Thu, Apr 4, 2024 at 11:43=E2=80=AFAM Reinette Chatre
<reinette.chatre@intel.com> wrote:
>
> Hi Peter,
>
> On 4/3/2024 5:30 PM, Peter Newman wrote:
>
> ...
> >
> > Presumably this would be called holding the rdtgroup_mutex? Perhaps a
> > lockdep assertion somewhere would be appropriate?
> >
>
> Considering that you are digging into the implementation already, can
> it be assumed that you approve (while considering how "soft RMID" may
> build on this) of the new interface as described in the cover letter?

Yes, I believe we came back to an agreement when discussing the last
series. I'll look over the cover letter in this series just to make
sure everything is there.

-Peter
