Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3101FC7CD
	for <linux-doc@vger.kernel.org>; Wed, 19 Feb 2025 14:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739974189; cv=none; b=nyAWWGDvdOKVGOVYsnxXXkxnM45xeHnFMfkqvDRfIQi/Y7NF3whHzQsiZzAG6PduvxNJlDWfuSd3yuMCC/g21N/dfuvcaF1/X0f0D8dEbYuFhUKYqtwT2Ztw44Cs8DBZweby365P7noumUSTBmifd1ncQSnhs4Lpr4qbotB/JKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739974189; c=relaxed/simple;
	bh=10jMimjxuVlCFGM2ZCcbo0fe9PRhXfBjVBsvwxGav90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gtCIzZtR5vcD7Ry4+iLaJ+p7XN+Dj4I3TN6xObtkmYtNWoNpLf5X0k3DyGbl16PPbYRSw38RhqcHMr8AO1qouhZr5uTCe5o9E9dSgdAyCOHZE1q/QU9ncx3NkMEUolzWN6Cgfaxo9c2lhtyEsicInoUW5fdiVaviN/d5q73GlWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bfWKhPSD; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bfWKhPSD"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab7430e27b2so1153343166b.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Feb 2025 06:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739974186; x=1740578986; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10jMimjxuVlCFGM2ZCcbo0fe9PRhXfBjVBsvwxGav90=;
        b=bfWKhPSDk8e/Tj1SrdFTLWWe5QpJEeMVISVVjF1+oCcweeLf6nd9X/Kxo2dRMFjnNf
         UpW1eAx4cb/tcvKIIhb3ua+uKsdd+p8Qmvy+IOzEZKj7/h+/iGPiAgicXMu2IRA7dSDa
         rcNPgKidKV7vXL07YfBbQJ1O8OBlTLRMWL4wg8+FJzfcaPmyRzoNifjvMd5fHQ/imNxn
         OYKsnbcNP32F3CBvcIXmXR4IIyOAGC0HsguB8nWVo5XXifOQGCw8j77+N1YBgfT02fDF
         nG9MdtXG3gZSyXDgis9AWWqE1MvKAGZ5JsUFtJ9ZJ17R11WwRr8/uF/jNGsB7lOO4O4m
         EByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739974186; x=1740578986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10jMimjxuVlCFGM2ZCcbo0fe9PRhXfBjVBsvwxGav90=;
        b=glXxrHPUhPYhgkoQuCsb96RxYxau99xdgG7K6O9Eydn9oOGYXs2va6PJz+nQdmz8jt
         6nFMkMSPts26EjjZhkOtQ9m2S+3k13+Sv2/uBnS9NSPEA2GhfmHq3mZPVt7U5HsSE02J
         TfDcffpPspVxLsTPtQXIYxQJTY3N/OCeLGFUo/Ak2/HASLm8viQvlzimVuRDxlp/fxV/
         sQQBT3YYvBYZpRONyQXRF9rj91bnNz7dJCMvTHMkMpaNh/ZKbUEdH2SYcoC7iqI8m7qU
         wEi0DZGBznjKq6DJ/oC6xfRU+acC+umdjowA/BobwpZSLnBNIEC18CNFTfo27uJ3DhqQ
         Z/OA==
X-Forwarded-Encrypted: i=1; AJvYcCWJqL7HIjzqxPry7YwDybpH/b1xQowkCYFSR0Yli4JXx/oSNkF/fZFxvqYj/+xM7VfC2tCw2TNN58c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqvEPOqh1p6AwPCPsnEXOeEqFvC8FSpIUBZPHCSwi8jZW6Gyws
	ExWuU/7VzS+ZGsm9RxUL2RnXMlsAatodtPG8nHnO3bGVRqxuGlVFxp05AhnMAR6A+UQseytYTFA
	3NkpUiS6knQ+R6K25PJTYXiUDYBpXiOv2xydSWEHLCwBIRTiAKmMjdK8=
X-Gm-Gg: ASbGncss+3O03HNN4nF3sjvIGEarzNFyf3dcLAetQNT7dzBVUZN1vyc9ikeOfVmXLjU
	agom4GSTVbnQc7tAimzWWCs3BqTRaMBAms6LcnvQmpgNFm8Kz2mreh0IpVMohpZ6rUP8Xk7LdJl
	e35GlJ2E2Duxi/rIbl14SM9Cw2cA==
X-Google-Smtp-Source: AGHT+IH8Kk8ypOlI+q0204bWOg0K+kei1efTO1AVFOuvMiUq/prv2i2qE+mN7M/RL4ubsnylAhdc2zfoJmjYvSACjtk=
X-Received: by 2002:a17:906:18b2:b0:ab7:d10b:e200 with SMTP id
 a640c23a62f3a-abb70aa66dfmr1211679466b.22.1739974166997; Wed, 19 Feb 2025
 06:09:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1737577229.git.babu.moger@amd.com> <2119b76ef8be21b1d8b2deedfab23e8e33ba724c.1737577229.git.babu.moger@amd.com>
 <Z7XfcV05ZZkHm6bc@e133380.arm.com>
In-Reply-To: <Z7XfcV05ZZkHm6bc@e133380.arm.com>
From: Peter Newman <peternewman@google.com>
Date: Wed, 19 Feb 2025 15:09:16 +0100
X-Gm-Features: AWEUYZmLnt6t_Sm9Rq-kqfE53HCQG6LWj-INsRp5bS0oFoaS6xQL7aEZNuvjSPk
Message-ID: <CALPaoCiPkjbTf2He2tXsguxHDtGF+YfVUZScL8dseVc6rvAfvA@mail.gmail.com>
Subject: Re: [PATCH v11 17/23] x86/resctrl: Auto assign/unassign counters when
 mbm_cntr_assign is enabled
To: Dave Martin <Dave.Martin@arm.com>
Cc: Babu Moger <babu.moger@amd.com>, corbet@lwn.net, reinette.chatre@intel.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, tony.luck@intel.com, fenghua.yu@intel.com, 
	x86@kernel.org, hpa@zytor.com, paulmck@kernel.org, akpm@linux-foundation.org, 
	thuth@redhat.com, rostedt@goodmis.org, xiongwei.song@windriver.com, 
	pawan.kumar.gupta@linux.intel.com, daniel.sneddon@linux.intel.com, 
	jpoimboe@kernel.org, perry.yuan@amd.com, sandipan.das@amd.com, 
	kai.huang@intel.com, xiaoyao.li@intel.com, seanjc@google.com, 
	xin3.li@intel.com, andrew.cooper3@citrix.com, ebiggers@google.com, 
	mario.limonciello@amd.com, james.morse@arm.com, tan.shaopeng@fujitsu.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	maciej.wieczor-retman@intel.com, eranian@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Wed, Feb 19, 2025 at 2:41=E2=80=AFPM Dave Martin <Dave.Martin@arm.com> w=
rote:
>
> Hi,
>
> On Wed, Jan 22, 2025 at 02:20:25PM -0600, Babu Moger wrote:
> > Assign/unassign counters on resctrl group creation/deletion. Two counte=
rs
> > are required per group, one for MBM total event and one for MBM local
> > event.
> >
> > There are a limited number of counters available for assignment. If the=
se
> > counters are exhausted, the kernel will display the error message: "Out=
 of
> > MBM assignable counters". However, it is not necessary to fail the
> > creation of a group due to assignment failures. Users have the flexibil=
ity
> > to modify the assignments at a later time.
>
> If we are doing this, should turning mbm_cntr_assign mode on also
> trigger auto-assingment for all extant monitoring groups?
>
> Either way though, this auto-assignment feels like a potential nuisance
> for userspace.
>
> If the userspace use-case requires too many monitoring groups for the
> available counters, then the kernel will auto-assign counters to a
> random subset of groups which may or may not be the ones that userspace
> wanted to monitor; then userspace must manually look for the assigned
> counters and unassign some of them before they can be assigned where
> userspace actually wanted them.
>
> This is not impossible for userspace to cope with, but it feels
> awkward.
>
> Is there a way to inhibit auto-assignment?
>
> Or could automatic assignments be considered somehow "weak", so that
> new explicit assignments can steal automatically assigned counters
> without the need to unassign them explicitly?

We had an incomplete discussion about this early on[1]. I guess I
didn't revisit it because I found it was trivial to add a flag that
inhibits the assignment behavior during mkdir and had moved on to
bigger issues.

If an agent creating directories isn't coordinated with the agent
managing counters, a series of creating and destroying a group could
prevent a monitor assignment from ever succeeding because it's not
possible to atomically discover the name of the new directory that
stole the previously-available counter and reassign it.

However, if the counter-manager can get all the counters assigned once
and only move them with atomic reassignments, it will become
impossible to snatch them with a mkdir.

-Peter

[1] https://lore.kernel.org/lkml/CALPaoCihfQ9VtLYzyHB9-PsQzXLc06BW8bzhBXwj9=
-i+Q8RVFQ@mail.gmail.com/
