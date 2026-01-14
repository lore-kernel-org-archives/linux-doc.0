Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BC538E128
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 10:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768385350; cv=pass; b=XBKpvt4u45m2BQk0pFAHKCOc4A+iN0l9OgX5YLWu3XdpRygmx+/RcHQshHs3MPxIMz6hgr1/yBp/TOnBNbBChkt4dgQ/tBFOWcFvcKDjSHUn0DcEAqf3H78LkYPS7Byu5BUaNwrb/xnNspxdwv1RJ3ex5tem0fQUrdg+FydPEuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768385350; c=relaxed/simple;
	bh=cboAZC/N7GAkgRpHFH255dWg88gOhZq5k/rXBB7Or3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYHTEdtVcjqJD41dUaqIVKPxUcqyywDAFXhSGLKItNC+XNhFkvVmTawjqsW+40UV03RWJ7P8KiBmB1bK9YjSoy7idoZck0qHX4B4mye4BogfpRikdek3KTb5bFMXjOyxy4zULWq5DstQL6UrjSo2vZwuhTs1bFimWAkCYdquc7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WS2mfg6M; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WS2mfg6M"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ee0a62115so41545e9.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 02:09:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768385346; cv=none;
        d=google.com; s=arc-20240605;
        b=by6+SEXeJweopNdkMFNVwhjPVE+m5G6XPKVDMF1M/wD8LJlJqSABD9dOfgbu7lvVXn
         0TsYcoOuTVARx7kHRpFi+j7k3Fw/Xc548ZcAlU3VEN5Spv+xmxGhxrPKL9OvqqbE45Cl
         9IV6QeHV/fL+zWxZqvILx/vMhh+zQ6t4uWrlA7j3FVjXogpbvzTohIptfbjVJ5wp+GKQ
         vcpFF7Ato4vRPXEB4YODlcoj5R2cnfTR+Hrjx+wis293HRRnTsTpYPTRwwmqlj2/qR1y
         FoMrwwCve66ZcbrV87nUU/r29BnRIC9SngxpTSxOpYQGDAmDDJIu+/28uVsbeX8k6RYj
         akkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9I9WuN49vDzL3jcHM+WJ2QBCVFtv9a9q6bPtMasJkpo=;
        fh=cB0O8+Ihzn+iaLmoQUq1nK8gcRP3C4nPKl6KR0d76R4=;
        b=KGH6Uqrk25gs06L5Ax6MDt2ucgvBl+wNSlc4q2RDkNBaK90IHBSr8dRhk69aPwJ3WS
         Qf+5DIwbjmQqp061R7/KSOwGSWe2Xnx250PRN/Qqpa1ummxJ/3OLj8v4iF1dc/Vip18d
         JJMGR4Tw1+34UvwLdOmoSBWxi2olC12r1XnxmGR2BDGxXk1ol5bxlXlXLUfTCXuTky/Z
         cr7k59RRJlUC/GJU4Tqzc2OwTFOjDvYQfHGQvU0MCxr8D4cMot34GuC9f9Yo3z/WFCf0
         3B9Th6zuxtVzFX8OubFZkeVh1azD71T5CsAonDW6mfIaZsEmeUbh6LlrfhhSuwFsVLNp
         XtRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768385346; x=1768990146; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9I9WuN49vDzL3jcHM+WJ2QBCVFtv9a9q6bPtMasJkpo=;
        b=WS2mfg6Mholga+XaO3LxfBMg4FKpWFmyqEjQVIGBvI2yMufZGzr/Zu8+5AWvMK8ALX
         Ad/onzJ/+aCIJO2aEgo7O+ERV2n5IATh74K+K79iZGECOP47UibHgfvnUkVh9JizeL+g
         jLFoIYs9Gtds0IVI6fPi9wIs1VXXlx/ORnzHPIW3h62xuJpVhjOF9flBxwf8ErzJ1si7
         UXFcyGwgA/A4KM05swg+8ZCw4GFY9N0tv7ReZNaSM1x+4sv/3A+Q6sB7Eu7hQfCLjsjn
         ULDhs5GwgqYknpkV9dlFWLvilm1NNFzfttr83OpFSwmMAEcunDmuQ81nuwsazV91iZ1G
         mqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768385346; x=1768990146;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9I9WuN49vDzL3jcHM+WJ2QBCVFtv9a9q6bPtMasJkpo=;
        b=guxqEOWIwBfwW6m9fc6EYepDHfdv6HOXlJpPJCnT29z56KFakxRfvQQ1sAqihbEGmY
         sXpeGLCIDacUCw7jQy58L0F3y/JPGqXfhrQGfc8D1UEyaLEwerNpGd7WoIKuU5FACHnM
         mUxzdMXYhzOtWUx1UyR/rrw/00///KsvkAXrRgBbBwb0hKidq8LNLt5qt811nAvEmayk
         jeqiixcavMWIP1lCNpTrbaawLIiLlIAzE/jDo3ozr722vlg0Hf3WSNX/be0XTj5II2T1
         XgsNDa9/ni72pSjTKmFmp95iP0y+8OZpXs8oyQkcfOy9KPysB52C2rMCPaGLx5WZyET3
         5r3w==
X-Forwarded-Encrypted: i=1; AJvYcCUFjuYXmSNmLGLte8DeekMh+zPpcITG8ewyLgrV6D51SGk1uvKkb8Ohve3POW83VV2ngCIX2Ls0xGg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9SZfe9rTdJ0WEYM01uVH2nhFwLxgxkjz8i1VmWRWMuIZrG8sF
	PvTFDeYScDROTH/YMDYSvEcT75OucN/MuhjDSj7T/2+wRETlWp5qyUX0sU1vCLyTUVNojKIdMoF
	Ialnsiv69eCylBgqfcrNb3178ZQsnYt8ybGlVUX4b
X-Gm-Gg: AY/fxX783hcf+5H2SP2cDXqr4N/lISTdB6RULa1uDzlmgh+FAvH4mGGC5beNr79KbJD
	LoS2601Xlae40lK8rbyWyF75t1/D01cqDLVYA47DD3o1kcAirruG8274X1c5pcqE6TugAcoladQ
	hsPCTVlbNxUF3oCQtFY/JJC9qIGVgJxxBj0+6H5jpZ/LkAMJBaZ7CIRJjGox7hbCiHr0zB9nNBW
	0n6EirOcoxQVFJUrhUTWrIqR+owEiPi3av7Sotp76l6sY4Q130fnjinxggK1TSaeDg4FmnifY9R
	Ri12bMCa1uBMHUU7H7EWX7Safg==
X-Received: by 2002:a05:600c:4c09:b0:477:772e:9b76 with SMTP id
 5b1f17b1804b1-47ee452990amr280725e9.7.1768385345996; Wed, 14 Jan 2026
 02:09:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <20251223-kvm-arm64-sme-v9-19-8be3867cb883@kernel.org> <CA+EHjTwQ4fLBE1YXoB6M0eamSgGDW=nfLaC+-_surBfVbh3byQ@mail.gmail.com>
 <6f0e94ab-7c9c-4705-a90b-aea09ca629de@sirena.org.uk>
In-Reply-To: <6f0e94ab-7c9c-4705-a90b-aea09ca629de@sirena.org.uk>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 14 Jan 2026 10:08:27 +0000
X-Gm-Features: AZwV_QjZbcO1T13jUPtvWgDAfMEoLsYIn7-Rzu9SF6LWm46DZ1iruQdxKvCCi9Y
Message-ID: <CA+EHjTwJw0D2w3oGC_ZSJsciUgiACoLAcRQv+_QSsA_bJKYj+A@mail.gmail.com>
Subject: Re: [PATCH v9 19/30] KVM: arm64: Provide assembly for SME register access
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>, 
	Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Jan 2026 at 19:20, Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Jan 12, 2026 at 05:59:17PM +0000, Fuad Tabba wrote:
> > On Tue, 23 Dec 2025 at 01:22, Mark Brown <broonie@kernel.org> wrote:
>
> > > +void __sme_save_state(void const *state, bool restore_zt);
> > > +void __sme_restore_state(void const *state, bool restore_zt);
>
> > Would it be a good idea to pass the VL to these functions. Currently,
> > they assume that the hardware's current VL matches the buffer's
> > intended layout. But if there is a mismatch between the guest's VL and
> > the current one, this could be difficult to debug. Passing the VL and
> > checking it against _sme_rdsvl would be an inexpensive way to avoid
> > these.
>
> This mirrors the way that we've handled this for the SVE and for the
> host kernel.  We don't really have any good way to tell anything about
> problems if things go wrong inside the hypervisor.

I know this is how we've handled this for the SVE, but back then we
only had one VL and one mode to worry about. The chances of something
going wrong now are much higher.


> > > +SYM_FUNC_START(__sve_get_vl)
> > > +       _sve_rdvl       0, 1
> > > +       ret
> > > +SYM_FUNC_END(__sve_get_vl)
>
> > Since this is just one instruction, would it be better to implement it
> > as an inline assembly in the header file rather than a full
> > SYM_FUNC_START, to reduce the overhead?
>
> Actually this isn't referenced anymore so could just be deleted.  It
> mirrors what we've got in the host code, we have to hand assemble
> everything because we still don't require binutils that supports SVE,
> let alone SME, and that's done with macros that do argument validation
> which don't play nice with C.  Even with an assembler that supports the
> instruction using a SVE instruction from C code gets annoying.  It has
> crossed my mind to inline but it never seemed worth the effort
>
> > > +SYM_FUNC_START(__sme_save_state)
>
> > I think that this needs an isb(). We need to ensure that SMCR updates
> > are visible here. Looking ahead to where you introduce
> > __hyp_sme_save_guest(), that doesn't have a barrier after updating
> > SMCR. The alternative is to call the barrier where it's needed, but
> > make sure that this is well documented.
>
> I think we should put the barrier where the update that needs it is.

That's fine, but then we should at least document this.

Cheers,
/fuad
