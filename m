Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E6B387346
	for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 21:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787953871; cv=pass; b=T6KdvYO+dPOt2KFa87/uohnHI0mlX4NJaKUn+4Hc9eTUK0vVNWp9JQxR3CwntNnv6zgtITs+tNeOTSTF12g+fI8YV63sMzMVXXqROWNZ6U1elcOT2lZ2dWNRu8SWx74EpFxChM8UffO84O4r8EAoSshOTIONMrpwjws9Jd2MP9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787953871; c=relaxed/simple;
	bh=9OK73M8dTXU4RsAbZMeY1j1qUUYmedkbx17xriTUJOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OHyyt60rCqvkT+1P6JutU1cKhqOJ+loU1upyCq9pm21wY2DvI+JNcYh/3ZGni9fFX5d2YsXNg7ua6cXvnxzqEjrsoS5VsDniLn6X0VEfxWZtnDOdGFktjNCdUcx6/NFvoxP9+ghtyZ8t5etUfqPpwpuIjaqyGUaWfoIRw7J5V1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nhKOVPVl; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nhKOVPVl"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c10e86e52so38281cf.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 14:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787953868; cv=none;
        d=google.com; s=arc-20260327;
        b=Tzce5Knl7w3Y5edRJwMx69oFsf5lcgiGdD4nyq30gH4mB+h/MKidaqSD1snUuZ1bKy
         sg0/wXOA94AO9OWGqBApR1G7HY+0pgcd6awSG9Z9DFcNLDoHkfNJ6rmbNw3/wsCSPTow
         zQcWQ35Bf5wXNe492MWQHSQRhF/9W1Vxvy2IEAQkrnvLBZRtqnBh3faX8wC1L07SBDuH
         vE0IScKjyVa8iS2krpJY+RD9K9jOGepqzkkr3bCq0coCftCdPuXfpjPgPW4nv+kw+HzU
         /3fV1zkBuWB7WGsMo6LFCnUUtgxIoVn7v6R3301hmo2Q6TqNufUtqF47SrrrhFQ/cc2I
         dNqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9OK73M8dTXU4RsAbZMeY1j1qUUYmedkbx17xriTUJOs=;
        fh=DTnQ4O7JnU7BNPti0Lv33ZX7mojRs2fiE7moUJxogmY=;
        b=Hu7ZtBHmYKs++1gBKlan41E60gGdZnn6Pckf5Ot4zTvrcizBbgXUonV9MOxr+QT3wy
         aJHK3Ipq225hXFJhzqrkmAG9atTdsB60YvlpifL0nAFGDb5pRqBY89wab9w1oRc96r9y
         0Mr2vxLCqUpZVRvPLwNFaj18JHa8jExhlQ20UHWHIEi71zHtV6B2FLCexzfRrMIjSsat
         06x8FV1omVNGVilSBHFz3wYZ3Llbv+FSsAWkQCGfFhY+aMRIJPVAKs4WeGOajreqBeB8
         vfr7QntZqWZ+Iz3NG6T0iZ9F/AbAu1m8z0GSMbMKj4hhXkmc8YybNFTnNAaP81pjH+EA
         WOsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787953868; x=1788558668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9OK73M8dTXU4RsAbZMeY1j1qUUYmedkbx17xriTUJOs=;
        b=nhKOVPVlHx3BL3zTJSE38tj1HxbGb9p/Dd/ezT5gohNcrlV4+MewHI4HjyFjtULxTK
         KUd073gbcfGu3nX/a2NSojjM7jK1fxrta3py/ebC0mVuP6oaNc17uAgIHGvwvePPq87D
         SShO8vGriWlJ9ZFo2W0PTLSKTWeDEha9jLkbvHIpWyYsGBXU9XBFPwaBAiPZbrTOGdJl
         YGpVRcrUVg/iAsL7HmF0RL/ONdS7y+5X2OxHbuB97TTqQTFCmKpEYStDmLVm2yjZqEvn
         UBwLIAAt+hIhj9YMl6J/e4f91bdeGqdHJV0VBzYP1LEHiFzJCrxlVNa7diWHw3aQCywb
         tEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787953868; x=1788558668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9OK73M8dTXU4RsAbZMeY1j1qUUYmedkbx17xriTUJOs=;
        b=j4j9orq97yoVe2IS6xlOAaisvzG9TYWqUmkgAguVMNq49LkBNLAoEWiiIg8TVRa4pO
         eZYpg2cGJ1oUK0AP+UZdR73ZPJ4xHoIiW3GETbkdIMCLUz0h7cLVy20ThJV1opYvrM8h
         WqrDMpdQEPpXutjE9TNOhlf+0pbzW/ypbBzD/nQKSjnucsnmqeL3xYHHd9aSlaMrBZIf
         QGvByB6nomd7oSRnfQIckG8wmHnD4SNlDPjdzPQfuI2uN+qlOnoONxFw+VOtLrVQnYzb
         jOWaczY+14QXX+sJEIaG3fI6ESqilxmvLUK3pUvTKo4TVXcHodiXtovOaMiCxHaD0vNf
         xmLw==
X-Forwarded-Encrypted: i=1; AHgh+RonALhUSgR/4xzV9V7TDXS1Okng134SIin86pe5xVnv9R74ZlJb+MPBtrb2yWsXl1MROyyztyhieGU=@vger.kernel.org
X-Gm-Message-State: AFuF++mw/KE8f8VCFs+OFDyzXrmg9DW/yfIhKCudTzaQtRMvHqEeWLpy
	d1l6npL1Z8sjxM/90Otf2ttQLfq1IaekAPrJrY/xsWiwzjroN4YELEA29QPv1x8VKP3tQ0zQ3Nu
	ewit2/ffboHihlRt1KQPsxZT22LYuxL7KvBAkXSh4
X-Gm-Gg: AR+sD12Qk/oA8hXdM1tiMFMdBFGA1NGuUVKOp6HdyOvQYV0bZSET6i/NNP1iUKm8XGJ
	RVGgcQFRMX34t6Vb1xrCukGDQKi1VEDscJ9nrHMJ596eI65Ih/QkM0lUyD6Ccgd8B73om64Tf6u
	vyILec3KRX80JSm+XK8Lg5y1wdMCkQXzoOviUv5srDFkbrd41/iBpdu2Ul4Q1Q7dtlVcG2Xyok4
	1VafxDmNi/2HpxEhbgxKFjCviGfp0XVy3mBmwhnWb/8E3xMJ/kxCxP2E8m7VvKLJ/TvoYcRlo91
	uR1RTIGDuGRmLTgBItOCEl1zbwsVfZIHGqlaJsevC0diSBBGA698HFS29bzng41je/GeEi2qVKs
	=
X-Received: by 2002:a05:622a:c18:b0:51c:ae6:a57 with SMTP id
 d75a77b69052e-52ff715be0cmr4613111cf.11.1787953867807; Fri, 28 Aug 2026
 14:51:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-7-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-7-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 14:50:56 -0700
X-Gm-Features: AcwNN1WH8NGHkZoUiv8RzQRpWDdLlBSrkCbScz0MXSyRTt5NyzGO5osqGDfsOxU
Message-ID: <CAGtprH_6-KDfDbtZCq+F+2_Qzu7+Wkc_2ukJRniWTgVkNvyVqA@mail.gmail.com>
Subject: Re: [PATCH v9 06/11] KVM: TDX: Allocate PAMT memory for TD and vCPU
 control structures
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
> Use control page helpers for allocating and freeing TD control structures=
,
> such that these operations can work for Dynamic PAMT.
>
> The TDX module tracks some state for each page of physical memory that it
> might use. It calls this state the PAMT. It includes separate state for
> each page size a physical page could be utilized at within the TDX module
> (1GB, 2MB, 4KB). In Dynamic PAMT, only the 4KB page size state is
> allocated dynamically. So the kernel must ensure PAMT backing is installe=
d
> for any 4KB page being gifted to the TDX module, and must tear down the
> backing when all associated gifted pages are reclaimed.
>
> TD scoped control pages (TDR, TDCS) and vCPU scoped control pages (TDVPR,
> TDCX) are all handed to the TDX module at 4KB page size and are therefore
> subject to this requirement. Replace the raw alloc_page()/__free_page()
> calls for these pages with tdx_alloc/free_control_page().
>
> Switching between special Dynamic PAMT operations or normal page
> alloc/free operations is handled internally in
> tdx_alloc/free_control_page(). So don't check for Dynamic PAMT around the=
se
> calls. Just call them unconditionally. Similarly, drop the NULL checks
> before freeing, as tdx_free_control_page() handles NULL internally.
>
> No functional change intended when Dynamic PAMT is not in use.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> [sean: handle alloc+free+reclaim in one patch]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> [rick: enhance log, reviewing, rebase, with help from AI tooling]
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>
> Acked-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
