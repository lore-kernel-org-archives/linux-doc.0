Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794442402;
	b=Sf8g3fZY/fP/Px/PHirtTHwXw324/GaIHd2+5xFU39JrmzkHSIe/t2I81XnhLHCX5I8F
	 0FKYqehnufo/YTt2eizNBiHJAsSfzUnjECkn1Vr3HjDhgZEqL5a1sxnPbDMTBu8jWf+uU
	 BGfuXHO/1YOiJivfNr6PRlkP4a3QGWlyfc/wl/tylq1Rt/iyLjoA/8LY7jp4O9aWWlNJL
	 H98wffXQAGKAkszDZBXIQmNGDjxdyphylf2gY5EUIbFTxkPiX5Win+X2jGGwbL2IjTuO2
	 JFCWLDIWfrQuYPRPUp89ZU+xacN3XVyaBa3IyGZMfrLRZjIkfsDu8IiK3iBdTSC7tLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x6GQlR97tIMyvsNz+qk5iDCNekyRuVayoebvkV1BUAA=;
	b=u5Ty9HMv+sxdQjIPHsIATCfGRWogtbzBfKHBqAse9HKBKxyrR5z2Mkhb7P48Jb5WFa81
	 MWL5sS2Jid8+YInf4MvziWS252ieUGz2wMKe9eN64IQ03iU363uZiVAihFJg3DHBzEU1C
	 QYnC3ZmBeM55UD4CDDPEsGgG2kLEHETbkeq8WdmtxBwMb4dmLSPuB3imIVYefF7KJMU3Y
	 BnoFk0WJUpZPgP3QR0rUO1ZBwpniN2VFjL3H1szbHUMpH1z4HqP72SAfiGc/hXzjMymyR
	 gHo9T21WEuU7LVFXoB5K17oey9v83scDBA+h/u2qSB2IHuEcNv+TRKqsZTc/2wMxTLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="iH/wd37L";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D24B606A321
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 00:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D24B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iH/wd37L
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b571a45a2aso2598a12.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 16:13:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794442400; cv=none;
        d=google.com; s=arc-20260327;
        b=rGiPevR5WWag6+eKU6al3HSaNl9WjjLS/5SHlkATUJzPsqZMiXBsHaSJzVn+5qUNph
         oHm4y5RXRVV20hsOKrUVIsICeNSZkdYtH+GVgj/wuu6jaARRTr5v0208ahLftw7wguyp
         OEThmZ919Ft++UTmgTaQU8qZYYf4zmy+pvfgSlkRBHJUrs9HFnKawZ3ByKcBKMTRPQoB
         kGC9KPGZ7om5fiiCbxEdXkIZui86B6EAl0edEoI5B+XNH5KQDlNp4oebniF3CRN1waAM
         7sFUXnrTaSZBoSGUZsdLPYRSvgS9RC8xaP5eRh6ZASHKbColGPmoLDq8KiJeBVFnwF0q
         bBHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x6GQlR97tIMyvsNz+qk5iDCNekyRuVayoebvkV1BUAA=;
        fh=bqwdmjR+2dAaupYFXinP2luFyW2aLqgIQ9Z9Wj4xqec=;
        b=OrLrAay9na/WH/8jsKmbxufKOwrTxuLjxdIq8lJUjeJNzpwUn0YkWjso2yXK4YqQTZ
         8P/NX77AjjLAKuLosDrDQLM1MT+/4HuzdYoI0s/ZDogq/aUhC6w0TfnnnbVV8m0uxyL3
         DNz3OJJ0BsUB4HJOa4KfI8HcNMwxqkGtRkjSZvoa302DZOMFnsuWwSYETTxIvyTvXMmw
         MsLb0PXGp1QymDtQoGEAiBUddPeZ+0OeWszNPJRyGmZSx0O3grSRUM2ylJo8U3Al2wqC
         V/a1CRz/JJBcBL4375XZF2cvDZlIc3VwGYIFR8UsGkHpWwcS5s2yVkKmm1M55KEzzbKN
         9Y4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794442400; x=1795047200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x6GQlR97tIMyvsNz+qk5iDCNekyRuVayoebvkV1BUAA=;
        b=iH/wd37LOg2hD3TTD1m4q0qaLfhoXoQUtQjEilEqBxnKJxbifvZHG67+MeME0M8WGu
         Ux8INvsQJMiPw/PdFkvNsGCSdtaFu6NBxDAsk1VA6RyZR1qKKE4Ckl/UH6Rig7phjNE9
         WklDOtODfrt37ymWxn1AQUGJUokgTSG1AgdjMwN1gkaesF4YiZ1DgZnnrUJr+yqaPWAT
         UUtWdqd0zZJpy8uuQOIaki113+rawIwWPmfRJmt0rGg8wPGEBlnazc8MLfvWbf9d4Z3L
         zt0wT6rl8FNYicdd1gO8Al8EClUL06yC17IuiUHAhAeEQ1K6vFZhcjqE0SueEd0Jut4F
         XEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442400; x=1795047200;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6GQlR97tIMyvsNz+qk5iDCNekyRuVayoebvkV1BUAA=;
        b=aEhBXm+XLV46FoH1OpxlRc7zJYbPYAOeTgzA2qXT5vn/yDcgF8h93aZBvvGSWb0tlY
         g1AdkGNWN2mCfoENF8TF0TEtoVvVygy4TEu9st4EUvnniPRdljPn6w6RO5ae023CsH5D
         wWo92dqi6pzrq50CzO0HFflwGI8/3vb7qzs5geJJ2OD5rapgs42vImust5Mtd4HBrD4i
         /Z+QegLas3tTD+RZcLVGR91cbKuEkYdprNy/9IzK081xJORXaflCBn2HwsLe5asL9y90
         FwkgMD44KfhEhBRSe+CkNA0wXWIms2fmW52pRQrG5EOuABAx7+c6yfL75ZeueMVXJEpi
         atMg==
X-Forwarded-Encrypted: i=1; AL+hErFnhOPxyyM+DAKePGXF1hQhQVlwjtnwNZD5dl9FeU8LFp4bqC40E61Q21G3SW4CMexHSY4i82MAC/k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q641sKIWfH+X61qlxyZ05e/5prjuSsFMTuWBJtuXsPO8B61Mc
	5kapMP4LRTiEYhK9T8FJ7uVQQsCe+lXP+jYTRjaWHz9SJ/VkOCQE9Vom4rspH1E03vfBCvhf748
	ewRU6Yih6a7L6Pif5KBOI18Chs5P1Yn6Cb7iLT9jY
X-Gm-Gg: AYBFou2G/hZw3RVhw07a1cQgUxQpcdkfLh/ocUVRLJWfOveQIF3dv6pUf6hqB7joeO0
	w95mIaAn9uWmpoV1jPYlctH7ovGACfXkjcAhKmxyh/GaZk1BLIZ3kbBp32w8B1DqlqMmsJC+IMU
	eWwkQmYPJB77sg/z9zdG+wQZO/vxx2svF5AfrBffqLDFHzXwcOfhjc3E4UG8JKUiwY2wP0FQwtQ
	kqjneB02bZ0IliN6CzAO4SEBr0pDH1SCI89gYQr0NjQ+lBLhXjyT59MTQiMt+o9pTuiHU0PBwj4
	2ai9T2E3uF9PLlZl7YD66bgFXA+DkbaRUO9U0D0SQvbUnMadEdABtYjr7A2FkivojQykA4/4ezK
	uhWZER5RQ+1mZxV65ocHtOjJt1oR9zHKskhAly+lNTfqxje2mE2H3/AzXBmTJUSNo27tdYWZg
X-Received: by 2002:aa7:d1d7:0:b0:6b5:77a4:e7c9 with SMTP id
 4fb4d7f45d1cf-6b79f51181fmr33260a12.2.1794442399569; Wed, 11 Nov 2026
 16:13:19 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <e08e3b6d0a8dcd25f1ee3e97a64acc1cbd3c0f1d.1794374897.git.zack.rusin@broadcom.com>
In-Reply-To: <e08e3b6d0a8dcd25f1ee3e97a64acc1cbd3c0f1d.1794374897.git.zack.rusin@broadcom.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 11 Nov 2026 16:13:07 -0800
X-Gm-Features: AclHuK8odVhxcsphtnxehMA2gTchgOO8TDhX7Llo8FUPPxJ2xf2wIKtREyW4NxM
Message-ID: <CALMp9eQ5CAZ5GASL80qQBB-86nKskdiadFinbw+6g0=9ycYXGw@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] KVM: x86/pmu: Honor enable_vmware_backdoor for
 VMware pseudo-PMCs
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Doug Covelli <doug.covelli@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, Xin Li <xin@zytor.com>, 
	Francesco Lavra <flavra@baylibre.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	Liran Alon <liran.alon@oracle.com>, Arbel Moshe <arbel.moshe@oracle.com>, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:08=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> Check enable_vmware_backdoor before kvm_pmu_rdpmc() hands an RDPMC of a
> VMware pseudo-PMC to the VMware emulation.
>
> The pseudo-PMCs are part of the VMware backdoor, but only the
> emulator's check for RDPMC at CPL3 with CR4.PCE clear honors
> enable_vmware_backdoor.  An RDPMC that KVM intercepts at CPL0, or at
> CPL3 with CR4.PCE set, returns the host TSC or time to any guest, even
> with the backdoor disabled.  Inject #GP instead, as for any other
> invalid PMC index.
>
> Fixes: 2d7921c499af ("KVM: x86: Add support for VMware backdoor Pseudo-PM=
Cs")
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
 Reviewed-by: Jim Mattson <jmattson@google.com>
