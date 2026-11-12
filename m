Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794442511;
	b=Nbh6kDQJpQ2DdbzN6R8hLKlhib+2Z6AL5YOGjZgg2yffVgcss+ek29z5u+mtkCe5+PUw
	 WjGs8fecIokimvH9a1zNfJY/DEJ4MLi7Us8M87zFX6qQ25oA5cqBegETtglKHmx52X6BJ
	 KJq6bE2Kr+FoAo6QMlW40By1lWX9U8cP3oiWkjPWfJDmcyL+hTrIgU0PPLSgD7ESgf35h
	 8fTFYcPCLERyFes561W+saK9isUlc66l1FvM4fsk9FaorydDnL6naIyWjqiNyE1LlcqHI
	 d82/Xw+sRQGmbXAzDYZcWw147hmSCTpRt3YGwFPZkaW9VYUxQVmfl3amUDMCJMCRG0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dw1WUYLsTA9Q/qnezh21Fe6yq9ZjLtY8qDqIN1OSww0=;
	b=bki7CMcde++oLT8vxDhg/6PbsUQ5wYNfTAG+VS5KKyeeJAekpnMpt2OiwkITslBxNo2a
	 mWHnqqI/MHDfMRH25TqcMKvF+330R2iDH/jb7fR7u0yUFImcZgDVd1tktmU5AuQaG4Gia
	 TngJtFl2k/Zz9sPh5BnaDmLaDeWz1dzkDVUmUsWcDrDCsc3Cx+zZOWpyoKAdrGqle8cFT
	 KA1hnezQBgov/D/NlHxq/1yXR/a4MDF9/Qtwarukn5XelY1TTrjTrU1CXpuXjuDp6pJy3
	 2AeXEK7eh8GFwc5fX6pPSy5ig+SdgfrTIWROCdiBE9Emz08MgYdLxx1AvPk4PdoznmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PeXxi254;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC358606A32E
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 00:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC358606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PeXxi254
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b571a45a2aso2624a12.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 16:15:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794442509; cv=none;
        d=google.com; s=arc-20260327;
        b=fOlkpBY/xqW851/KFDdHFRYuRV6ISdC9mjOyfT3LR1tJCQPfFPUEdCAk3rFrZbWn82
         CWnWqWNc61pQG6c9U093/FG52fN+mMFxsrKwemziYdCynFso/ElljCg+TkaV7YWwfNXa
         plPIowMeaoXIdYmacJLewTNgjqS8kAwyHwrVLbLU2NMGxEgj5Hg+0CIIdUN8vf8kZe6i
         M6Eta4M+F2AgaQsXH2C4KSYLMZ7CEeB7EHWJIBXwqjgr4ftPEcJ7aqa25z1w8Uw20L1F
         OFu3wI/KNPU91JlUBcHv7dtHfmfwQUSu8WUZt/NUuhGL3KO1NmVeW0PJ7Vwfu5b4HjFs
         vAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dw1WUYLsTA9Q/qnezh21Fe6yq9ZjLtY8qDqIN1OSww0=;
        fh=WnfVurzCiAh69LSM+y2r6P7Uadc3opzjYTnCZKqphpw=;
        b=QTjnBzIrBdEdFZcECP/g0eP1PVGD2vNOMEYHlK1A2+U1qyvWjrQKkfSe0qtP2Bfbv1
         bK8z9QKpL86NR8mM66mleYD16zYlbObsPuwpGPRgQfLT085PDyLdznT5LCIZ8rAI+L27
         ROjO2aPAVXmkeE9RgNnxtk+uRAMpeiBKISuTiODLlB93SVIzHxm/7fjR0cVcxGkcQHEj
         Y292jXShdvBnNYEXd6v6z2k1UrsvGu2u5MtbcEjeX7Tn6Olyim34kxJgARSWxhGaCAjQ
         7CCHV7xiVmYgyMollIP1WpiMmml0vF0gXNQWY7z4XGsmf0Qjrh2jydGZl6Eee58Gs+68
         MuQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794442509; x=1795047309; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dw1WUYLsTA9Q/qnezh21Fe6yq9ZjLtY8qDqIN1OSww0=;
        b=PeXxi254jVjJacLsg6c1v/0BankO6tVHFh6AbYJLckSeraKvBRZxAmvwufFHuIVvYD
         jkbmKo+FCqg0SBryL3bUXvdBw51kokdvPo2t6gGxmjYdEHwSqQgDRMyLkfxw6Qp51+n6
         ds9EgQSzXH+7ac2mHfXsp4u1eSCMlEnVwNktB8TG93pvpqlbZBzyalG5b9BR63ygTWb1
         54jvVxknikvPOoIpc0TQ+p4Y/l5uIhkotGtCrINmedkhL7tPKuRHQebn+aYEdDwEO9WT
         RBjg4bOD2siCWSJ9hGnHGD2RvFWe4jctIyHb7Z/Vd8399Z05QaZSbFC2/xwSG/vqhQC/
         fReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442509; x=1795047309;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dw1WUYLsTA9Q/qnezh21Fe6yq9ZjLtY8qDqIN1OSww0=;
        b=huDwkN1LHJLh1iY86JR/RF5oTwOCQAgV0iOAZgGveS1uv0pEu5eCzCXeZKuTixG8GS
         k89gWOTN8mxHG9eip4fr9i16aDmH//WJf1ToWtpGs4uYsA3Mg+CfOg8cljDOcawQJdGU
         4Ops0Nx8agBioo105MKiCqabeHrBqYi2hShJX3AjHAoKnGklyS73Dqss7/oabOJRwcL9
         5TlijYWkh80Jwyd0FRUX5miOIiJh/FZLJlHH/71ONpU3PKYBhxJ4+KTcFt30soVX8i5n
         P2gsJz3vMJ45lC52O6aIYKq/yuhNPdvYvh3iqfRbE2vHL6V02xyJ29zb2fRbPINKQD0T
         G+pQ==
X-Forwarded-Encrypted: i=1; AL+hErGlKfsTR6NOpUtqjdauuNqoRYbt6GVG1X5CeopY+OXrpqSCjRPGat6JPmLBiI/i6XBgnYiyFoO74Po=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YV8g5fkqOKXzd8QDf+yfaY6eccRv40J7oMfhawJH26FPUfe83
	Hrku2cgOTq7FwMY8Fg9xWWlKj/xJ13CKD5XU5R7Miz/vasoLBkJpTis8fzMhQxuVTizHr00dGuc
	bwx4MLE1e5mabjIqgA/KRwm+zGtmQmQmANFowAKHw5+eGezcyFVG4VMIcfKQ=
X-Gm-Gg: AYBFou0HVXWqBosLGZViiaVcvh68GxFP/N8lbqI1eXwrdoReLQH4B0TAS150/QYvIOx
	ouRb0G4xvObYzMZi54pLU0Tm4KaT60GMqkvoWtYLeue8IiOrGcA/rJIMvvNoW7wOIPXUvaUA+V0
	DiLN+M9pdBpWZwRT9ELSf+iKa9Hr8Y/TBK2wZy8PEFRpGZEaI+igpiu6ZfmO0cnoPsfn5K4HCx6
	sqd5mC1tJEHEW3NnzblcGlyLzYk8yz60QZX0dxvDNbyNbbWqkB6QRCxKXIay842XBeHrB+gZidG
	GPDg9h5IMLLixqHDs1CuhTfEKI1SynsrN/fNE5ueq0BtDh0AmfbOIqPLzzamGuLBq1MAuomdimH
	F1lJWGmgeI1ncs6OJu4XjXTv/ToedSP0J/Z5BvxUbV3ZkYxkZbQbuaWXBOs/uYIEJBgyUX11iLu
	984GS9T/YXBeah8zGeFQ==
X-Received: by 2002:a05:6402:a3cc:b0:6b1:b3bd:1576 with SMTP id
 4fb4d7f45d1cf-6b7a29ac02fmr15840a12.8.1794442508697; Wed, 11 Nov 2026
 16:15:08 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <76008acc660e337e7bbeab3310623a87046ac70d.1794374897.git.zack.rusin@broadcom.com>
In-Reply-To: <76008acc660e337e7bbeab3310623a87046ac70d.1794374897.git.zack.rusin@broadcom.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 11 Nov 2026 16:14:55 -0800
X-Gm-Features: AclHuK87L8uvSccN7ek3E-oclf6HfrUbptT1NvBilCQRrlrDsTQ4W7H0chAi-Kk
Message-ID: <CALMp9eQQG5U1JUbAiYBTaSRysux=F6VS8vra2KpJaEy=L6vBKw@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] KVM: x86: Encapsulate VMware backdoor checks
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
> Add kvm_is_vmware_backdoor_enabled(), kvm_is_vmware_io_port(),
> kvm_is_vmware_backdoor_pmc() and kvm_is_vmware_backdoor_opcode(), and
> use them instead of checking enable_vmware_backdoor and the VMware port
> and pseudo-PMC numbers directly.  Make the module parameter and the
> pseudo-PMC numbers private to vmware.c, and take the backdoor port
> numbers from <asm/vmware.h> instead of keeping a second copy.
>
> The next patches make the backdoor a per-VM setting.  With every caller
> asking whether a vCPU accepts a VMware interface, instead of reading a
> global, that change stays inside vmware.c.
>
> Check the enabled state inside the port and pseudo-PMC predicates, so
> that no caller can treat a port or PMC index as VMware's for a VM that
> hasn't enabled the backdoor.
>
> No functional change intended.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Link: https://lore.kernel.org/r/aIEgVpjXDR0BXgHq@google.com
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
 Reviewed-by: Jim Mattson <jmattson@google.com>
