Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F5927A47F
	for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 22:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787956480; cv=pass; b=rEQOTkUnJFL4esDLkwun39zS6QsRDV0pEpaxrgnSQTHTFySLm5gBQyQZAhUITDk2Emom2in8Phtklbcykv0SoZaXHYVkvcpHqQ05LeJRMpaqcCmCvSMqAJRbQK8vbtPjWH0Vz9D8rSl24FLFEnPu+geFHKBeSXHoZjQFoMPCqXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787956480; c=relaxed/simple;
	bh=LsddL4PRlUTsAeoM7ovykaSIoHJp/TKPnksnw+b4W0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h7EDAO/TjXCux/NMJRsqJGF5dmXYmG8DZGF+esVKQ5L4Iru5KpKmHYlZTCTozoQYfMjMlcwucH/giRj34bD5Wp9RSJ4LyHtHe1DeYDLUOKRjB5DiqKofvGr1Bd5YG4l02SYv/BRV7u2dXm6WHlWrpMiQyWsLwXp7AOHaB9JzasU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DVLCf++P; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DVLCf++P"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-52fac937235so42011cf.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 15:34:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787956478; cv=none;
        d=google.com; s=arc-20260327;
        b=COU5lGcRKElUsjxAg9G97/t4ZHVnLipxihKwGsWr+Htownt4RXWjZ+/pC3CUyAgkEU
         sOJL4wnaF80GsQVl8f6O+MRi6j0itTH0FqdFK70YIPavi3VYCLSuUml85FYAdopJYXdw
         7Hsx0W+CtRDzp5cm9a/LdgsEaDQVTjjD7ljl5V8UXpzXRZCG1pU2o09zIOax2OB4yVxV
         pbtDxa3zILLYnqvSdaDfF0cnUwReGJQjJNlpY5rwqOxwO0ZtSj8M9PJuvpeg8gMI6xH/
         ur76vRYb6sbbqx9BZBrh1oAul9l+ChokQBXOrn/TFWuG/t8TaPfksd+FjVss5FKhe2U9
         iiPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cz3w4vC7ROKvyX2FGhFrH3o4RiUPpew0D579GCON3EU=;
        fh=PkQK+akHTa0ROYZiRpy+YixzshPIncnlmvtCyEQywB0=;
        b=HOOrsy/ZJdVNOVHkfd41oFQUpygc4HTfNwUcq+43Qb9EyrvE3312a8VhX9lVtVXEjR
         /CCwmmUXF3OvvJvlDNn3wPBFF6FDKA2ij+5OvUmfOaXiXVTIm9pW1Scj6mLdNpkNwFzH
         sxO4Cx/5mIUpn1lMuPVPBtMbXMdUc1IUPzMd2PtEVFHx1fzMbXL0lSy6rajH7G84m+AA
         a1oTUaDitkVpqavDz7unmtNgLAKAhmYSJLdkydhmvAoDH/0KXLUSOrD+twrE9X9NPSU6
         +EvjAQUxmEjM/YTXhPJPMjKMes8F5qXK3+SuE3aAdQ3jkZJm37CaKBkKn+C8ClXAQSyN
         gCIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787956478; x=1788561278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cz3w4vC7ROKvyX2FGhFrH3o4RiUPpew0D579GCON3EU=;
        b=DVLCf++PTc4ePRoNxkjNW7uu5fXBjVqgUxMXhWa9Gzwk961XDDCyCoQ1yJIL7xsHrf
         HFQZIzkk1jWm8SkEGD5hqobPB34AvGnFKSWyEA2Skn+yuhtOdCxCZTjBgstq/c7s3o3/
         v4furAvBYdnCCbQAy5HUfk19KY57h2eR0VVSK04FcPmjzrda9MWnxFP8bBEJtKREKh4N
         XFa4b3TUwmGzu6VZSexNafPKpZkzpY5QFxZhbNlePW4Ghrktb0KJ0iyORJhJIQGqvENU
         3lwffl6WQKlHFXoQOcuQWoFUZ/7YyxbCzOqn03k/hHNajPI6nYl4Lgdy2JAp6EM1DaTJ
         55qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787956478; x=1788561278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cz3w4vC7ROKvyX2FGhFrH3o4RiUPpew0D579GCON3EU=;
        b=o7J7ZLnHRmw7aUXwhlTP4fcaAFje5A1DWphA7KN++FC9PJu7iu5OSpNi6KZGmeUcoM
         0vFFp5yGwFQ95zbplVJaMQpCYTc8GRdU63rqJ0BZQupFLlGPTHVRe+LxTNSM8heHKsh1
         eNkPFrCa7OoVlUL5y92YTLGzjuWyOSDnnV8OFc+fPznYBYzUQ0lxEuWL3YJc3b0ST6pc
         gW+58qRWa0dL36HZsVEVqjd9pSMAxISjOpIguXY23FX2UF+mur80qd9h2/niDxM0gchu
         E1pzgInQgsL3sHNOojzixalTiKydcn+fxnM+C9WwOjGVgLRsH6e3nOgQMzIEgaVDcQvY
         mzbA==
X-Forwarded-Encrypted: i=1; AHgh+RojbEDRn3gs7E9h2ldI5E95QZF7XYfPbHatzZlWwH8c0yJXGqQpAvl5dmNt2M+Xz7t8kf/rvfHUgVU=@vger.kernel.org
X-Gm-Message-State: AFuF++nnWP18NlJL6ckmK6TMUNvr2PezCWddOpsxuoUtef/rDsG6+NU4
	tL/VULudEBRjti5dVL/rq8SOvt5ZARMgZ4ydFHcgufEZxFfgBuvDQcDD4LBUAg5SiuqO6D8HqTt
	A4FkBFCMubmTDovdwBDSDnM0jBKlCMhLC9Pe/Yr9e
X-Gm-Gg: AR+sD12w8xOVLpVaEwGXRZ71rkY5zM7KU3uP7I0b/sYh06GZOlMi/j0MyLu0WcE/hv1
	HDQwznumP5ahc9LGuvxx7qxL2dMWj5rqC4MWRx3leHzc7BYeui/jHbjwhHVcOj8KWgpw3oQg5yr
	8v7Cw4wwl4AZ8l/uuPQ2RhjOBxi5oUHXZPOCbp/uv3Zopo18Y1pjBKPDcq8fi5QpihC4pUiSZrP
	vgwm15Kz/m+WsYJqwpWIdgQ2KM6usVgrhkxynPQRxOVwMZiqtjyFiSYyvX2uyh6pSAKwSkeYZCi
	c+DKKImr9WsgE99VR0uUPcpiBXIlMP7cT/lRSOb3eAhHZ92sGX1UxoD4lfsPmJg/pw86j/Bli50
	=
X-Received: by 2002:ac8:5d0d:0:b0:528:38d6:71b4 with SMTP id
 d75a77b69052e-52ff73ae215mr4559061cf.11.1787956477427; Fri, 28 Aug 2026
 15:34:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-9-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-9-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 15:34:26 -0700
X-Gm-Features: AcwNN1VVNzU9UspnZq9FN__NwaWjASBppoxqnYJM22b0AQZYrchahcz9KPBbKug
Message-ID: <CAGtprH8TceU0x4ivPk23jNGmhKBmJkhu=9YiHw2ibEJZ8gDhpg@mail.gmail.com>
Subject: Re: [PATCH v9 08/11] KVM: TDX: Get/put PAMT pages when (un)mapping
 private memory
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@intel.com, sohil.mehta@intel.com, 
	Hongyu Ning <hongyu.ning@linux.intel.com>, Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 7:09=E2=80=AFPM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
>
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>
> Add Dynamic PAMT support to KVM's S-EPT MMU by "getting" a PAMT page when
> adding guest memory (PAGE.ADD or PAGE.AUG), and "putting" the page when
> removing guest memory (PAGE.REMOVE).
>
> To access the per-vCPU PAMT caches without plumbing @vcpu throughout the
> TDP MMU, begrudgingly use kvm_get_running_vcpu() to get the vCPU, and bug
> the VM if KVM attempts to set an S-EPT leaf without an active vCPU.  KVM
> only supports creating _new_ mappings in page (pre)fault paths, all of
> which require an active vCPU.
>
> The PAMT memory holds metadata for TDX protected memory. With Dynamic
> PAMT, PAMT_4K is allocated on demand. The kernel supplies the TDX module
> with a few pages that cover 2MB of host physical memory.
>
> Releases are balanced via tdx_pamt_put(): every control-page free goes
> through tdx_free_control_page(), and guest data pages are put directly on
> the successful tdh_mem_page_remove() path and in the
> tdx_mem_page_add/aug() error path.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> [rick: enhance log, reviewing, rebase, with help from AI tooling]
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>
> Acked-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
