Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAE03EB0EC
	for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 11:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781178269; cv=pass; b=YlLz+sfPuWRrerXHfP8UjFGq57nU7N/lDJaldA6GWzT+wRPomQ4+QwfiGQfJfQ0VH9aMlWNba8VPZL9ijOslQ21e2mAfb3h2k1Q3dOSifyNnd8CvJ29+NpXZQ9MGpICatXYoA2x/M1Zu7HUaCrsRrBboTOBZtxHR9LuXOFC8bys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781178269; c=relaxed/simple;
	bh=u0l12GK251wv3DytcvATpkwIc7MpVJPzcrdqPx2x+qg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XwbHZrNKpWdnGhh1xtLvL30l3ACoueUr6TXXtJ5a51vqtjE7eh0QBt2OmddGPuFlkiwoSoBlTX8i7SAdsaWUAdJ1G//ckgd6Nfs5wgHRY7jetLwyOVyZpaijxOyGstsb3L3oe964SJhQDVtS12IAClZDEekeLDy8C10dyJCpCSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UhRg9Vgl; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UhRg9Vgl"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-68e5f7c1131so14820617a12.2
        for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 04:44:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781178263; cv=none;
        d=google.com; s=arc-20240605;
        b=bnHCopl7VL0YJskzK08SaXDz8tlTWo80HuD/QL9jmkMxIdcvwVPMJtvz2uznKkjpq1
         OB9cfw5doJj5VwpD2RlN4HgTrD/ar9JKIarWJNS2RKOB2fcEOIzPZlVVJ9/xcCi3kY8r
         GPBosGzyYM6wqz4Si7o6kzl/zFMLzyO10HVlERBL2P5ZJwqlaOrjwdvsVyWOvIScq6bI
         OtpsRq1YAJSVr4+qBUlfFu4zSuEKre4uF7YE/qhdhcgUxjU/8W4SfOgtL/DjNxe/ZD0p
         pTdIgBdHH7++0uwSqt9cJU99nnpdW4TA31IQQMBjfUmXwUuHDrJXwyMVbP9DzfBJiydy
         udGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q/Tdlvp6c2L+uM9YnfN/q8tY2YDVcYxunw2VmcNUyXs=;
        fh=n0/GlIZw9tZkLLpKDYVfXW03zV/lpTxGbPFQpcByLns=;
        b=RcOlnJ9zAxIF4hJPKrlMAKXFwvvgjS2YEgJ7mPpVMuhd6Cuthg/QBUnnTGkimOf31q
         rnbnUHlz5aTY2g4tJ8uIB+f2r1Yv7ZPRbCnRwbVcpb6XQaND8k9Psq381lMB1klvhQnA
         HSLRmkcDI5doCcwsnCG0UQMV0ymizdhj1CwqIn7Lnr3TM0vrg2tsR43NnteBgy6RpoZF
         ztdJro7UdgKLkInJteffuX4yoVHbAdi29Ob51h9ZEPQXYlSl5EtsuUft7v9tHXMfd2nt
         oj4lHIrSx8KeKZjvZfrfXBlu7XbLXYE6xubXEL8mKcJllLF6qXLkPNyHD1YgTF/42Bjd
         ZpjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781178263; x=1781783063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/Tdlvp6c2L+uM9YnfN/q8tY2YDVcYxunw2VmcNUyXs=;
        b=UhRg9Vglm0EAClZLiAWhp9KUekhJJU3aSk1EMMmp+qpNhXMi3jEO8i++Lcd7mGQlTv
         0z57LxS4NNIaERPZu9GVhUwvkao6wuowE7hnid0rs7cSJo1KZFqGgJ0R98izm5Rsug8Z
         t0WRxuHDaqyj6A/VMJ8kbmQFiOjUZo83tqeA4P4gWWbq9iHY9CCaYW9VBInHMJxxPLrV
         J5pfPvxocOOFC9hu6QV3Gm+jbhXrBFDy8cgNsaYB+ORK9cqzXyxS0hTLwZG78j9dBdXN
         ojw9Wk+WPc1t79kG+Q8/NPhwXkK+0Zi+mocThhx1xC8lv9i6XOEWivmAUQwpG645UOf7
         P1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781178263; x=1781783063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q/Tdlvp6c2L+uM9YnfN/q8tY2YDVcYxunw2VmcNUyXs=;
        b=nAX1SieEPnb76mpVpNz3Ma5VBbXG78mYtuE4RsT1KP+5G9OObHtKex81inSLxuikBE
         7E/Iw5i8Op9IpWl2Ti+o8fQQ53t0uf8TOh2Y/kTgpjlUg9Q4U/iu6JY6pmOcQJEQoAXx
         R1+c13569giJGPmU60aAqAvlCmez7VReMS6hyex0uzjvNkWRY/KW/ppXelDcKMp5IMDt
         v4vf3wabpIehEnZE7GFzQm6Qx4mxOfJOOmwqgOobWi686cZbFvuFLF/XHGhxRrRIjQ03
         JknzMlxDtpgr8DfomkgOaY5hGln5ojAjo9laDk7qkOxQ6auC4e2nqveV9M9Q1gwKNAe2
         u4Ag==
X-Forwarded-Encrypted: i=1; AFNElJ+NTJzPNcC6pCwMmT4rf8SKNu2k6nt8Gjqu53sxn7Qf1r/arS1gT/K8dgEu8WN9gDQl6bErz4Sr+Ek=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgp5zHI7tMCe8tgGzYDPaNm7CYaj+8KxfEbQF+rZ5kVKc1DfNQ
	Qjg7iTM7NkbZXit4H36MCDFyt4dz+jIYLbflMh+2B8ZabbQoKkLg2J35ivC1jlpI7sA4007N6r/
	/UD1r9m9msvRII9vEafK9PB/xNG3YIWDAm7bdtIhS
X-Gm-Gg: Acq92OFcPcsdV1vIBzVwcOt8Tdi58mIzSy61p2JIb+IrPZNiZYMKwoBTERlh40JzTew
	6zX9PltIIBSQvCxHpYUrC1eYfRr1CDnhKjoEg+T6jKBXf7hgVBOMfXgA5KoDfTvCZKAP58CN0AM
	lIZbf7e8DNsHdW3TImzUNJ8io18rDWz9+QWlra6einjt2eKNp3GKL5tsr9XQXEMv4cxr+1vsyNp
	TNEpp9mtnMA6GoQapXEVRwXaQQeiTTm7Ae7ifCnNM+SFBAgc+NSYKpLrqy293WjKqKxa/kvCV8E
	qc1L1Q48yDOU09pOcOmaiq/S9ktv09+Ix2231jlIrVT7PKI=
X-Received: by 2002:a17:906:4787:b0:beb:a431:6750 with SMTP id
 a640c23a62f3a-bfc87bfb90emr115609866b.29.1781178262321; Thu, 11 Jun 2026
 04:44:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777591496.git.babu.moger@amd.com> <0cfd813e10072eefc8f4d84328e83bd9a6220ad4.1777591497.git.babu.moger@amd.com>
 <agzPTMvJ_LdEmKXe@agluck-desk3> <1a410ca9-f4a2-4956-8477-033d61a733be@amd.com>
 <ag4ywKHsH1Fc15wH@agluck-desk3> <a56f8ecc-cf1e-48a4-836d-7e7723072c38@amd.com>
In-Reply-To: <a56f8ecc-cf1e-48a4-836d-7e7723072c38@amd.com>
From: Peter Newman <peternewman@google.com>
Date: Thu, 11 Jun 2026 13:44:10 +0200
X-Gm-Features: AVVi8CedvYMnYvHwCmqlZGq9ykfYUOfyxRV3aN9y8cBd0plibH6YTiQnpO5_ouQ
Message-ID: <CALPaoCj=UTSvk42n3+OY8LZ_mrEmDpsNXJ53oJd5t+9QVXA6Uw@mail.gmail.com>
Subject: Re: [PATCH v3 04/12] x86,fs/resctrl: Program PLZA through kmode arch hooks
To: "Moger, Babu" <bmoger@amd.com>
Cc: "Luck, Tony" <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, corbet@lwn.net, 
	reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com, 
	tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	skhan@linuxfoundation.org, x86@kernel.org, mingo@redhat.com, hpa@zytor.com, 
	akpm@linux-foundation.org, rdunlap@infradead.org, 
	pawan.kumar.gupta@linux.intel.com, feng.tang@linux.alibaba.com, 
	dapeng1.mi@linux.intel.com, kees@kernel.org, elver@google.com, 
	lirongqing@baidu.com, paulmck@kernel.org, bhelgaas@google.com, 
	seanjc@google.com, alexandre.chartre@oracle.com, yazen.ghannam@amd.com, 
	peterz@infradead.org, chang.seok.bae@intel.com, kim.phillips@amd.com, 
	xin@zytor.com, naveen@kernel.org, thomas.lendacky@amd.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, eranian@google.com, 
	sos-linux-ext-patches@mailman-svr.amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Babu,

On Thu, May 21, 2026 at 1:09=E2=80=AFAM Moger, Babu <bmoger@amd.com> wrote:
>
> Hi Tony,
>
> On 5/20/2026 5:16 PM, Luck, Tony wrote:
> > On Wed, May 20, 2026 at 12:49:25PM -0500, Babu Moger wrote:
> >> Hi Tony,
> >>
> >>
> >> On 5/19/26 15:59, Luck, Tony wrote:
> >>> On Thu, Apr 30, 2026 at 06:24:49PM -0500, Babu Moger wrote:
> >>>> +void resctrl_arch_configure_kmode(cpumask_var_t cpu_mask, u32 closi=
d, u32 rmid, bool enable)
> >>>> +{
> >>>> +  union msr_pqr_plza_assoc plza =3D { 0 };
> >>>> +
> >>>> +  plza.split.rmid =3D rmid;
> >>>> +  plza.split.rmid_en =3D 1;
> >>>
> >>> Shouldn't there be a parameter for the value of rmid_en?
> >>
> >>
> >> I realized that behavior is not required=E2=80=94it was actually due t=
o a mistake in
> >> my v2 series implementation.

Really? This is in fact the only behavior we wanted:

https://lore.kernel.org/lkml/CABPqkBSq=3Dcgn-am4qorA_VN0vsbpbfDePSi7gubicpR=
OB1=3Ddjw@mail.gmail.com/

-Peter


> >>
> >> Below are the relevant definitions:
> >>
> >>
> >> GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU:
> >> The CLOSID is applied to kernel work, while the RMID used for monitori=
ng is
> >> inherited from the currently running user task.
> >> No separate monitoring group is assigned for kernel work, so kernel
> >> execution naturally inherits the user-space RMID.
> >>
> >>
> >> GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU:
> >> Both CLOSID and RMID are explicitly assigned to kernel work.
> >> This allows assigning a dedicated monitoring group for kernel executio=
n and
> >> therefore requires a separate RMID.
> >>
> >> Example: For GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU:
> >>
> >> # mount -t resctrl resctrl /sys/fs/resctrl
> >>
> >> # cat /sys/fs/resctrl/info/kernel_mode
> >> [inherit_ctrl_and_mon:group=3D//]
> >> global_assign_ctrl_inherit_mon_per_cpu:group=3Dnone
> >> global_assign_ctrl_assign_mon_per_cpu:group=3Dnone
> >>
> >> # mkdir /sys/fs/resctrl/ctrl1   (PQR_ASSOC closid=3D1 rmid=3D1)
> >>
> >> This configures all the CPU threads to use closid=3D1 and rmid=3D1 for=
 both
> >> allocation and monitoring across user and kernel modes.
> >>
> >>
> >> # echo "global_assign_ctrl_inherit_mon_per_cpu:group=3Dctrl1//" \
> >>    > /sys/fs/resctrl/info/kernel_mode
> >>
> >> # cat /sys/fs/resctrl/info/kernel_mode
> >> inherit_ctrl_and_mon:group=3Dnone
> >> [global_assign_ctrl_inherit_mon_per_cpu:group=3Dctrl1//]
> >> global_assign_ctrl_assign_mon_per_cpu:group=3Dnone
> >>
> >> This overrides the previous configuration, and PQR_PLZA_ASSOC is writt=
en.
> >>
> >> Possible options:
> >>
> >> 1. (closid=3D1, rmid_en=3D0, rmid=3D1)
> >> Here, hardware uses closid=3D1 for kernel work, but RMID tracking is d=
isabled
> >> for kernel mode.
> >>
> >> As a result, reading RMID 1 reports only user-mode activity
> >> This contradicts the definition of this mode, since kernel work is exp=
ected
> >> to inherit the user RMID for monitoring.
> >>
> >> 2. (closid=3D1, rmid_en=3D1, rmid=3D1)
> >> In this case, RMID tracking is enabled for both user and kernel modes.
> >>
> >> Reading RMID 1 reports combined user + kernel activity
> >> This aligns with the expected inherit_monitoring behavior
> >>
> >>
> >> The preferred approach is to separate kernel monitoring by assigning i=
t a
> >> dedicated monitoring group and updating PQR_PLZA_ASSOC to use a differ=
ent
> >> RMID (e.g., closid=3D1, rmid_en=3D1, rmid=3D2). This is exactly the be=
havior
> >> implemented by GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU.
> >
> > So maybe I'm just confused by the name "global_assign_ctrl_inherit_mon_=
per_cpu"
> >
> > That sounds like "Use the CLOSID from PLZA, but keep the RMID from
> > legacy PQR_ASSOC.
>
> Yes. That is correct. We need to work on naming this correctly.
>
> >
> > So:
> >
> > # mkdir ctrl1 # maybe gets CLOSID=3D1, RMID=3D1
> > # echo global_assign_ctrl_inherit_mon_per_cpu:group=3Dctrl1//" > info/k=
ernel_mode
>
> This makes kernel mode run with CLOSID 1 and RMID 1(Use the same RMID as
> the user mode). [1]
>
> > # mkdir ctrl2 # maybe gets CLOSID=3D2, RMID=3D2
> > # echo $$ > ctrl2/tasks
> >
> > My shell, and all children run with CLOSID=3D2 and RMID=3D2 from ctrl2.=
 But
> > when they do system calls, take page faults or there is an interrupt I'=
d
> > expect the code in the kernel to run with the CLOSID=3D1, while inherit=
ing
> > RMID=3D2.
>
> ctrl2 is not a PLZA group. So, RMID 2 is not connected to PLZA.
> >
> > To make that happen, I thing the PLZA MSR should have rmid_en =3D 0. Bu=
t
> > the only code I see that sets this always sets rmid_en=3D1.
>
> Setting rmid_en =3D 0 in [1] disables counting of kernel usage for RMID 1
> (from ctrl1).
>
> The key difference between the two modes is:
>
> In one mode, user and kernel usage are counted together.
> In the other mode, kernel usage is counted separately from user usage.
>
> Please feel free to continue the discussion if anything is still unclear.
>
>
> Thanks,
> Babu
>
