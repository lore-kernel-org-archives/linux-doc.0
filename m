Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030660;
	b=E29afhQFx/7xc7Z4fNmZnBup4AjCYULpW8hXy6BTrhyw6IC3kO+zTASZ/0/fMtNqqxyt
	 K6a3CmWYd9jVz37QM3YmhujUSQOqHUNlEr3lyXDDMolFEgFlqiSZtS/TRygEUAjYDDKNi
	 3ISso7IPZH202WuzKCRj2CNseQ0CYVlD2fcnsnJpYYrtKhAkKnSo3LTXf8Lp5yAI0/LBG
	 a4BRUo+8tJKimtaI/jgATOKgm7/bUQCUOySLrHyEfL8RY5xFzcU7SDlrgGupIgUyq/XXE
	 aKeS4dOKbWC5V9DQ3daSKmbUv2gVxJCG4x+4qvjLu7YfaVVvO/K+qz1lZwtZjXOVM4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=BtlG9GazPDheIdOzNzDs4NZFQum26PeBlhzgVoUNI/o=;
	b=bUa51923WJfon/IAhsuPHUfhwUK8VmoHiDuw+fDi4Oq0biHxB/Jd52IABLIU+r6GH7um
	 xHnxSXo9ihWXNM/Z80QIiIyJ+mrUBqQlwJ8dGdHOSsVxgvE53zk/0cohsadL3JXSmDRNf
	 j1Arz+V3rffVU0Vh4oyS3R9YtMWn4u4K3JKcL6zalNuHhqvwaLGXI4tZZsIXV72y6bDuw
	 CRMx/u9S5g0iBxVJHZUBgtqWFXrRJ8m6yeCmB7b1Hulq8tuR9fb3W0bce0/90t9RvRaiw
	 mI1d9aT2RSUmUP+p+vVZEQynoLsbSu+9Qu0oU9EVZiluWHg/unsMqddzEesp4NbV4bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=BUTqpZmq;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A079C606A31F
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 16:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A079C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=BUTqpZmq
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3adf71ee6a5so3082629a91.2
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 09:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793030659; x=1793635459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BtlG9GazPDheIdOzNzDs4NZFQum26PeBlhzgVoUNI/o=;
        b=BUTqpZmqz96ANztGzcjwFuJS4uRuTsaLFaxLx09DXbzdy0ACNLUfFKRgYojgw1tkID
         KkIDeF02IrlSnZagJ3sVarcvU2wtlkHd31wUE9D66+bE926A/RC+6cYXYGuqi9Us22qv
         47/YUFqrhIgCI3VERXohI1kZcMWPstYXtu41L9s8VJTrfOaXr1teX+uVI3LL4yThjLfg
         jAiSIlu7UTdu4l5sBItUbH4pvNuFdElEoAYws6LSIUuor+J3CdMaF0H+zigNh9rt2WPh
         rkSPsayMlw2LKDHPSk5mo20lEIAWrPKsPsMT3gR+zpZj0M9vYEGWm2tw1dVB1ac21HxT
         VoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030659; x=1793635459;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BtlG9GazPDheIdOzNzDs4NZFQum26PeBlhzgVoUNI/o=;
        b=idYMKHD3XF+aF6rdqVEDEMZbpj3+AIubWCjc/8pirCx7xNWgfTrg683hhSRCHnt8UR
         EhZveYNmGGoSBRSvGUqOy9opX5tjGWXYtVYIhxCkutkGxBsGq36gSSDBJ4jpdM06QflR
         dmWnr2T53fK5SM1KOUj0YYwI6w0ms6DrROmBKHKsnyKinxyetep9pwgtE4Ip/cJj20BF
         lDvgCqX/azj9vOWosQtAa4uqBLWIe0cjBo3432KCpwziXOm6N8FwHV1d5t2UBkVtqbJ3
         c9yUi4e6SO9D86dB5/c+5fW9ERstKJf9Tw9SUjorLWKgE4hjOldAjBzLt2CIjiqrl88r
         q2rw==
X-Forwarded-Encrypted: i=1; AKwUvBxmOKx3kMDCik7A5EAXXwRPFh2MDo+hM/NhywQpuYeMBu11ns61tqbMCC3EUDXWUvmlIVOvjgbvOjY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmtTr2L5c9U5z8cwanPNJCaVPp3tX93lawnSuKQ9GbPM5EU2PT
	OhBUB9FcD9wJf6FPMpE9tB0VpAS/3sSdWdsoVwBx08gkYsAuer/NlcGDrXxLcltdNUXhq+Wcc5k
	b8I2BOw==
X-Received: from pjbmq5.prod.google.com ([2002:a17:90b:3805:b0:3ab:f091:d7bd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c88c:b0:3ac:7c4d:8be1
 with SMTP id 98e67ed59e1d1-3adeb1622d2mr5782528a91.62.1793030658656; Mon, 26
 Oct 2026 09:04:18 -0700 (PDT)
Date: Mon, 26 Oct 2026 09:04:17 -0700
In-Reply-To: <9467c7b6-d797-4462-bee1-1406bb8469cd@zytor.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260911213659.2025974-1-sohil.mehta@intel.com>
 <E7D55C5F-91DF-45AC-BCC8-BD2759CEE0C4@zytor.com> <9467c7b6-d797-4462-bee1-1406bb8469cd@zytor.com>
Message-ID: <at96Aex_dl8-yUk6@google.com>
Subject: Re: [PATCH v10 00/28] KVM: Enable FRED support with KVM VMX
From: Sean Christopherson <seanjc@google.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Xin Li <xin@zytor.com>, Sohil Mehta <sohil.mehta@intel.com>, kvm@vger.kernel.org, 
	x86@kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Shivansh Dhiman <shivansh.dhiman@amd.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	Chao Gao <chao.gao@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Zhao Liu <zhao1.liu@intel.com>, Yosry Ahmed <yosry@kernel.org>, 
	David Matlack <dmatlack@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026, H. Peter Anvin wrote:
> On 2026-09-14 23:03, Xin Li wrote:
> >=20
> >> On Sep 11, 2026, at 2:36=E2=80=AFPM, Sohil Mehta <sohil.mehta@intel.co=
m> wrote:
> >>
> >> I mainly rebased the patches to the latest kvm-x86/next branch and fix=
ed
> >> a handful of issues reported during internal testing and basic AI
> >> reviews. I've avoided making any major code changes or commit message
> >> updates as this is the first iteration that I am posting.=20
> >=20
> > Thanks a lot for taking care of the patch series.
> >=20
> >>
> >> Going forward, based on the feedback, I'll rework the patches as neede=
d.
> >> I've listed a few opens below that need additional discussion or
> >> clarification. I'm relatively new to the KVM subsystem, so please feel
> >> free to provide suggestions on the series structure, code organization
> >> as well as commit log clarity to smoothen the review process.
> >=20
> > I=E2=80=99ve been thinking about an optimization: because FRED drops mo=
st of the old   =20
> > syscall MSRs (IA32_LSTAR/IA32_CSTAR/IA32_SFMASK), we should be able to =
omit    =20
> > them from KVM's uret MSR tracking entirely as if host enables FRED (no =
matter  =20
> > whether a guest uses FRED).
> >=20
> Yes, although they will need to be handled properly between VCPU switches=
, of
> course.

And we'd want to keep the optimizations to elide writes when vCPUs are usin=
g the
same value(s).  So, compile tested only...

From: Sean Christopherson <seanjc@google.com>
Date: Mon, 26 Oct 2026 07:37:03 -0700
Subject: [PATCH] KVM: x86: Don't bother loading host values for SYSCALL MSR=
s
 when FRED is in use

Elide the WRMSRs for the SYSCALL MSRs when returning to userspace if FRED
is in use, in which case said MSRs are never actually used in Linux.

Note, KVM never saves/restores MSR_CSTAR via the user-return MSR mechanism,
as the MSR is unused by Intel/VMX hardware, and SVM unconditionally context
switches the MSR via a dedicated VMCB field (along with all other SYSCALL
MSRs).  Include MSR_CSTAR to provide a contiguous range of values in the
case statements, e.g. so that the compiler can optimize the case statements
into a simple bounds checks.

Suggested-by: Xin Li (Intel) <xin@zytor.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/msrs.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/msrs.c b/arch/x86/kvm/msrs.c
index e91650af44c2..ef3596d8c780 100644
--- a/arch/x86/kvm/msrs.c
+++ b/arch/x86/kvm/msrs.c
@@ -65,6 +65,23 @@ void kvm_destroy_user_return_msrs(void)
 	kvm_nr_uret_msrs =3D 0;
 }
=20
+static bool kvm_is_msr_used_in_host(u32 msr)
+{
+	if (!cpu_feature_enabled(X86_FEATURE_FRED))
+		return true;
+
+	switch (msr) {
+	case MSR_STAR:
+	case MSR_LSTAR:
+	case MSR_CSTAR:
+	case MSR_SYSCALL_MASK:
+		return false;
+	default:
+		break;
+	}
+	return true;
+}
+
 static void kvm_on_user_return(struct user_return_notifier *urn)
 {
 	unsigned slot;
@@ -77,7 +94,8 @@ static void kvm_on_user_return(struct user_return_notifie=
r *urn)
=20
 	for (slot =3D 0; slot < kvm_nr_uret_msrs; ++slot) {
 		values =3D &msrs->values[slot];
-		if (values->host !=3D values->curr) {
+		if (kvm_is_msr_used_in_host(kvm_uret_msrs_list[slot]) &&
+		    values->host !=3D values->curr) {
 			wrmsrq(kvm_uret_msrs_list[slot], values->host);
 			values->curr =3D values->host;
 		}

base-commit: 7e60162b16f9da0d2fa83da5c1723b6853a0ac1d
--=20
