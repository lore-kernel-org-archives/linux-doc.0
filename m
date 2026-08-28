Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1301F39891E
	for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 19:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787946654; cv=pass; b=u9netbQZTyKSQMOK2WKJvl5NT+B2B+7ge7rNwaq9V/qnqaXUNGgr2tUvs/+PiQrBlVb353EvsKX54577hMraX+iJzWM+etMqt2uLu85ewHacLOIoBBKcgpkJTJY+WCkkx03CiMTZdCa6e7pSupl4csfj5y52yvotQhiRAJvshuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787946654; c=relaxed/simple;
	bh=V6Nh/imCu2DksXoUrx1x6JfWGC3imxXsFDlVlCThN9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kWZOjylSq3qfM07a3TSdobanTVP6/ixSHUtO+iXbnPxJDo3fcgBIoqFR5AZ0msZxv+2n70PyKHr/rzaGVA4xZwqfPtRgAnYFknsDvvkzxDQmSWspKz2ChQesD0U1v94N2mN7fTyGdtvkOm8S7hrX0nC/Q0NUgu+lYNHZUq1gSVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ckaTpbj+; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ckaTpbj+"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-52faa58bff5so45791cf.0
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 12:50:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787946652; cv=none;
        d=google.com; s=arc-20260327;
        b=mpyU2KBaYkHd72SJSEbK6EAsH1jn3aq8cHgDdbSon5gT5ddzyvNInXs6Y4KptIcdny
         ecjVf7xHZ+CUavscWCn7EOL4OwpgtNjIcMG+pC6Z0AYPP6FucEPasu4EAXX33aXszjCt
         rijgcaAtRVwpnui3xmcBMxgO1twYxpHu0Yh7TEQtUsGJDfmTGXvQDbQuUYmrGPILCxI3
         ykDED1FrrgAnlQrK7l/cWg2OoSzsJ6FY7nhg/ROTczpdSxzmCkBa/2sWehIr2ZRpGyUo
         thvCxG0c+mCUNi8z8zdbr9Lc2EKmjBDZR9HWQNhYfP8JXwtgebCjWEtjNceMlJOcf7aV
         h6Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V6Nh/imCu2DksXoUrx1x6JfWGC3imxXsFDlVlCThN9Q=;
        fh=KUUcx6wy7+/99cmq0tK5N15VnbUZE5CJ+gkwnsGoPVk=;
        b=SgyaKGaFZH7Ub/OdqG9MlPRT4t4u0nZRmP5eweqTF1NoHKyTz+SF8WhEhUpYWEv5NC
         7x8Yk7Z51l6xYyqkv/BiFoHM7OxraM0oEVVkcOrspC380vYA+zwj0xP/qttkRbgYqIcv
         J+pXel/IFCslglhH9xvUtmVwque2IHgC6xGPP8hRwhmAEsmq2B0kl7BFKKRb782+Jfja
         E7rBEfGZzzAmD33jrTJR6KHeUY6i2+vmpQU7mIeZp4BSZLnpSo97U64kh9DhVwvKFX2J
         tul6a6vDgn7YJxjS+CfOTOwayXLAKZ+upFo8ifpg3k1GuhfwDk0/rSxnL2MIGO6ePn1O
         7LUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787946652; x=1788551452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V6Nh/imCu2DksXoUrx1x6JfWGC3imxXsFDlVlCThN9Q=;
        b=ckaTpbj+NxSM3jGyluFreV9L6TYg1sWUEFlLuxYQcxwyjbeo1xHw1XgmkjHFuBQnZu
         eeClPLkF3Eq3aYM48Pu5khSiKEdW3XhU59DuZpuRPa3q6qhZBNAaNb7Ih0sAw36tSqas
         F9c/XtGkNpLfTT/CH5NRP/svCTt3P3P54D24lGunh2vL+FPYtjWHtfeW7LxSEEN4yPcn
         z/Q/2SxZ06LiEYsawxRJtqPvum81kl5uVfe/t8zkOkJptbzidzimBItbJivDt0CaLZjf
         yrQRQ8gv4OnHpvnFfo8m8E53IcPOUOy4tDX7XXKBPGTjCG4sJrQ9k/46r1KnPEv05gPa
         42Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787946652; x=1788551452;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6Nh/imCu2DksXoUrx1x6JfWGC3imxXsFDlVlCThN9Q=;
        b=m51qckiP3wtrH7G/xx/H180KtUsaDq6u07OhEdyTLUwGuDeT7DOFYruQW+TtQ0hLHm
         LCETK+R70SFKubqZAcR8oCOwHhK6ICZkiM2q1SfusCW73oom4VGH8hGYUNwIGqYd8kPr
         n2jbglypQgDtzuFHl2eQD3dNOrkpkJOMjh3vAgtPF9rlKEmyd1GgmKEysgRjdaatGEcU
         a1lSoNyctFjTcpK0caa8mHWn4ndHz0WBvs5mWoTOwoG046r1DRJvLfSbJBCdhyI34kni
         0qFF7aggpt1P2o7Ih+6H/Izp7chMEZxcP6xJquxgkdOB9zhntSCEAbpgI52+lR5F4Ct4
         nHgA==
X-Forwarded-Encrypted: i=1; AHgh+Rr8CbsRkSS2BkljAfGqh0QTgX3sN8lnjMVbd/qAQQF07IAOLsqJ4U8g2AvJavWDrOyTt99Woh5hojI=@vger.kernel.org
X-Gm-Message-State: AFuF++k6rPvzkiLhzlqFP0f+NybplXqY5bqUELL7VauDwYI3iglnYphy
	XBDC2Aj7uJYZgY26aiBQy2FUPBfRrLle5WvwxGU+9iGlClxef69JK/RfI2d4jRkjHUBWwM62lT4
	Z16ol/6vtr4fXzQWqiR0XNPYtGY+rExJlj56w3XFe
X-Gm-Gg: AR+sD12TgI8GC4FbMoG7wTt8w0bclcvRpmrXHN8z0NIQmV0prP4MtxK7sJfTaKEJkYq
	/IWzvAvh2h8nU1gbqeHTpZKtm5JMC4CZhU/ofVHByace9/0zaT4qxI+ncXWcr6JnJ+BPbtXfpJa
	9q3J4p9x+nbA09tcHQhsNBv+b97/YOjzM84KvAGfg5ViGQu0KLvNNw3WVgppPaG1VN75GxMpZJd
	j+gj4CANh9tDmEhL1o6fR+eWDlLmTNQ1TVUOLr8cPKrHnuj/2jTvutCaBMTf9ZbyYMZ0fEs/N20
	RXz2tclTiW3YrGvhXD1FrMUqMTqJ39wTp9o0TqYKGfkyifvB2yLE9mGjflgxjHhhs1jrq8hxh7M
	=
X-Received: by 2002:ac8:7f51:0:b0:519:b82d:fe62 with SMTP id
 d75a77b69052e-52ff715f969mr2184691cf.7.1787946651120; Fri, 28 Aug 2026
 12:50:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-4-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-4-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 12:50:40 -0700
X-Gm-Features: AcwNN1UGA8VSxLqG_WtYxcyIroEJNe3FATQouEdY6s-KcMOngGCRN2JEgv1FXj0
Message-ID: <CAGtprH9ERb_fFG-4JYR1Bjxyyvnk3Ys4q=9ioQz0Cq6QCXtVBw@mail.gmail.com>
Subject: Re: [PATCH v9 03/11] x86/virt/tdx: Add tdx_alloc/free_control_page() helpers
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
> Add helpers to use when allocating or preparing pages that are handed to
> the TDX module for use as control/S-EPT pages, and thus need Dynamic PAMT
> adjustments.
>
> The TDX module tracks some state for each page of physical memory that it
> might use. It calls this state the PAMT. It includes separate state for
> each page size a physical page could be utilized at within the TDX module
> (1GB, 2MB, 4KB). In Dynamic PAMT, only the 4KB page size state is
> allocated dynamically.
>
> KVM will need to hand pages to the TDX module that it will use at 4KB
> granularity. So these pages will need Dynamic PAMT backing added before
> they are used by the TDX module, and removed afterwards.
>
> Add tdx_alloc_control_page() and tdx_free_control_page() to handle both
> page allocation and Dynamic PAMT installation. Make them behave like
> normal alloc/free functions where allocation can fail in the case of no
> memory, but free (with any necessary Dynamic PAMT release) always
> succeeds. Do this so they can support the existing TDX flows that require
> teardowns to succeed.
>
> Also create tdx_pamt_get/put() to handle installing Dynamic PAMT 4KB
> backing for pages that are already allocated (such as KVM's use of S-EPT
> page tables or guest private memory). Have them take a pfn instead of a
> struct page, as future changes will want to use these helpers for guest
> pages which are tracked by PFN.
>
> Don't CLFLUSH the Dynamic PAMT pages handed to the TDX module, as is done
> for some other SEAMCALLs, as the TDX docs specify that this is only
> needed on "TD private memory or TD control structure page".
>
> Since these allocations will be easily user triggerable, account the
> memory.
>
> Only one pair of Dynamic PAMT pages is required for each 2MB-aligned
> physical region, so multiple callers could trip over each other if they
> try to manage the shared backing for two separate 4KB pages contained in
> one. To build the logic up iteratively, don't do anything to handle pages
> from the same 2MB region yet. Functionality to handle this will be added
> before Dynamic PAMT can be enabled.
>
> AI was used under supervision to collect/apply feedback, split patches,
> review code and workshop logs.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>

Reviewed-by: Vishal Annapurve <vannapurve@google.com> for the
SEAMCALLs and the get/put helpers, assuming your are still thinking to
shift things a bit between the current and the next patch.
