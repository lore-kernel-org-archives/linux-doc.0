Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D32734C98C
	for <linux-doc@vger.kernel.org>; Tue,  7 Apr 2026 23:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775605954; cv=none; b=LVObTkdIa1AidCZzO+cs+Igif2weoLhzDr2P2bmybRUv2VLaBHzm/t7U+hUxuliKyy0KDxcy32cufg3IbCFTdApfN1fh2hmHdS93YOHu62N6zAAzjbyxYGfeFfYylBjhHVJ5Hi7BSMjc1MUPsx5mP8X4AvZPMN467t+djYuvbTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775605954; c=relaxed/simple;
	bh=SdsNngXjH3hSHT9gMgfDRt8l0hAzE4oAuI9Clo4mOaQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VPRW0XYZGI5U6ADsQ0rFC88o2hlG2q0P/oZ69787Phsj7Yr5E9daD04BrXw3Ai9Va2jhD21NtAg1xtWghnJEqr6Icc+5DJarHeBTzpcidIQPkpS0OagjGh3aXPu2rh+MF3OsxOtbE/dCeZQUi93DLHMqApUOyfS2zShUpw+cIIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t+A9uukX; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t+A9uukX"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c741b950511so3017296a12.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Apr 2026 16:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775605952; x=1776210752; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iz2WszebLY+x/oGqa2xe58ntUzkUx8FiRFvZTUBudmU=;
        b=t+A9uukXvH97+MHaPGfBtAxvV8gY0p+zyJia22Mki8ZTOoK5+RuklL3KQXDrUe52oH
         VtqYh7Y1gHO3dvwMLGNnEY5xBhdON6g2EMH1N7WFNDgCNxWKI/O2LMttSIgmFxxTxoVq
         m5lLQI02QQBHXM7f1WVj1sCupmglkdjVI8fR1dIsY468lRd0wFKCCz7gMt1SO6zLUDB1
         qqh+y6IiV1sxFNmBVTBxktBHToLfqGaMj6VYQMdLSPnfpK8erZE8opuSr55qhz3W/Om2
         rCJicNqFy86kHat6hta8Sbf3cJDp6KMcCotGiS3XDtDQtf/V8IE942CJNf4E95drTACx
         5nTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775605952; x=1776210752;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Iz2WszebLY+x/oGqa2xe58ntUzkUx8FiRFvZTUBudmU=;
        b=R2fwcRD9jnra9OJqSp8cYYdACd27+fAgoRKgNqWPGiN5vB2+NzSVer75EUS/tEqnOL
         jDzgBuZa3G+8XBT7coLGFFegP93yxzF/sqCXNrV4hodJCB/KSBoEkCCR6uEAMFc8RcX5
         FOaJqg68F+jpm49aRUIJXjX03wCfH/uFBmUDvehap4yTMe9WDVkcwInA8hARjG0SLxSy
         a2ZzxORVd5h5l5MFtcrT/p/OgKL7gf53wGcUav2+F27n8rtixzPskZ4cX9P92r1W2+Cg
         tOt+lWa/lYK6GRKmPE+HmEDITQBvYmTQNrSLwTAQwktbqy4bXRx9yMo/NMFOxuLpb1cP
         1bUw==
X-Forwarded-Encrypted: i=1; AJvYcCXQKkxFJ76WNtUbjeuSIahxUGMsAoaM1xiATQDj1GqDkxlurc0xyTyiTkKxU/gqaiyaw8kuaNjMGmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwITKHh4YJA7ONkYHane5KatX78/dQjqgJ0Q2vUXgg+y3bWPFLS
	2ROdzW4iYKu23ysasCjSaiKAvxlGa3ywlqn1dBCrMk+ZHifqBvU2M7/LT0Cl4P+lAZKz5sX7G6C
	UIZIm9Q==
X-Received: from pfcp1.prod.google.com ([2002:a05:6a00:a241:b0:82c:5b7c:f4ce])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4c14:b0:82c:2480:4e95
 with SMTP id d2e1a72fcca58-82d0db4fcaamr17900679b3a.33.1775605952332; Tue, 07
 Apr 2026 16:52:32 -0700 (PDT)
Date: Tue, 7 Apr 2026 16:52:31 -0700
In-Reply-To: <CALMp9eS+XiJ=u2618Hke9ePyzeTuChU=dLt+e=x2nXLTMVH5mw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260407190343.325299-1-jmattson@google.com> <20260407190343.325299-6-jmattson@google.com>
 <adVZ7-EiekghvDMD@google.com> <CALMp9eS+XiJ=u2618Hke9ePyzeTuChU=dLt+e=x2nXLTMVH5mw@mail.gmail.com>
Message-ID: <adWYvwA2BzEj7eDE@google.com>
Subject: Re: [PATCH] KVM: x86: nSVM: Redirect IA32_PAT accesses to either hPAT
 or gPAT
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 07, 2026, Jim Mattson wrote:
> On Tue, Apr 7, 2026 at 12:24=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > On Tue, Apr 07, 2026, Jim Mattson wrote:
> > > When KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT is disabled and the vCPU is =
in
> > > guest mode with nested NPT enabled, guest accesses to IA32_PAT are
> > > redirected to the gPAT register, which is stored in VMCB02's g_pat fi=
eld.
> > >
> > > Non-guest accesses (e.g. from userspace) to IA32_PAT are always redir=
ected
> > > to hPAT, which is stored in vcpu->arch.pat.
> > >
> > > Directing host-initiated accesses to hPAT ensures that KVM_GET/SET_MS=
RS and
> > > KVM_GET/SET_NESTED_STATE are independent of each other and can be ord=
ered
> > > arbitrarily during save and restore. gPAT is saved and restored separ=
ately
> > > via KVM_GET/SET_NESTED_STATE.
> > >
> > > Use WARN_ON_ONCE to flag any host-initiated accesses originating from=
 KVM
> > > itself rather than userspace.
> > >
> > > Use pr_warn_once to flag any use of the common MSR-handling code (now
> > > shared by VMX and TDX) for IA32_PAT by a vCPU that is SVM-capable.
> >
> > Changelog is stale, but otherwise this LGTM.  I'll fixup the changelog =
when
> > applying (in a few weeks).
>=20
> Oh, crud. This was supposed to be 5/8, but I made some changes after
> checkpatch.pl complained and then tried to just regenerate this one,
> but I totally flubbed it.

Huh.  The patch shows up when I grab the thread via b4 mbox and open it wit=
h mutt,
but b4 am skips it.  I'm guessing there's version-based filtering somewhere=
 in b4.

No need for a v9 on my account, I can splice in 5/8 when applying.
