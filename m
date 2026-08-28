Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285103D4133
	for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 19:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787945340; cv=pass; b=DKXhap6YOAIUFilvie4n6FQkYG4ERKX1lBlBo1y0nrUmjX+gV5t9g0c0L9fuWVkIJVVCXSyUCPU4/DXYqGfgNigGtljjVHpWEqrkQ3rW6Mb/+fJjkjkvTAldS9/w5ySOGEC0E8ffX2e20tfxxy6n4yOMxXRUtxuNtgGG0h73Akc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787945340; c=relaxed/simple;
	bh=fHmMOkDnc0DAMDW7+UXClup/98JMmn4tO04WF2LBRAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZHoGEmQ3votMTkIyp4QsI0SP2PAF1xqV98T9HjDB4FLfGHwZpzceQj1h1HmS11KQAeV8E/PfQ4tY2YjqnxoDhcco9FvSU/5tYKDjjCr7uiEeuB8UxLO3gzj9dejh05UNw6DB7etAlzwcUb9GzxQQ2vV8SAlS3LFLEVXY2iWzCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tPLmx28I; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tPLmx28I"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51c10e86e52so46251cf.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 12:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787945338; cv=none;
        d=google.com; s=arc-20260327;
        b=dxImBi/H3bt/efUbXe4D4wpFXjd9YcVdQTLSmtrS0OETiIQD5BsWOYc7P6sRCCKQhP
         nifPez1ZtyMWBFk86IW5GC/o5Jlsij2ATMdgMffnjJe/BK0Xc6Tfz11LMSwhfEtGSJ+b
         svM+oRmsysgHonRfkYpGfTZRWAnMjdRRc3hy/GxfavQMg767aVkccZhAVmf67n0mKLKA
         rX63mCnQJryJ49HIMOHVHGAwR/7h57NMXmT6+x3vbmE1DUafuVW4wE+BoG5QeyisvJQz
         lMG2VAx5nRKhtfq5Dir0dXcSq2nGjgcXQPd16lL1UDhwD/b/y9QkuHK6psZ1MDp5o8ZB
         mRiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fHmMOkDnc0DAMDW7+UXClup/98JMmn4tO04WF2LBRAo=;
        fh=lMVae8VrlOSSD88HSXybzIX65UPO41L3vh1xPwKqTTQ=;
        b=D/2CJlOBHfUVSEaWxaQTCAI4ULFTVQ7Zaw90syNbJqIyRIkhYleVP3NdZVqEod/TGE
         y+sCcOx2iFmKPz/hLFfv60YTHfjYKPaOXoBKd6L6gqyfz7qDgDABUI/tv+Kmnf5AASrB
         tBjBdaaE3knJ7160mEYwkRO3w3KTkSUUa8uHBGaerwAxbWuIGoAMcVDm1NCZERxHpKFG
         CQrJptppGgIJMs27l5y0relpxKIHbuV9mhxuT7igo9T8WllNNwiae0xndrrgh9wfnEbx
         fI+9F8CarwGfSpwks4uDG3BgzUs0WtEWtFsysyfeZjYEovy4LY8fnMtA+4/88mq6C2e3
         y5pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787945338; x=1788550138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fHmMOkDnc0DAMDW7+UXClup/98JMmn4tO04WF2LBRAo=;
        b=tPLmx28Ikq/AKKwVgvg6shpzmukqJJ3cGhEZVGAL5lKJ3KCnR3F3y+8Zl7z2rjdd7D
         ljanT2DvUU1M9Jv2CNvf2xLopGbzaqif3LNCjat5MweDLZR+4rFIZPfDI3I6nKSQGuXt
         VU1D++KbWezknV2AXXYwdeFZVpUWaQZEhol/mPajIdTXYqttCpVeuI8pRN1xnGeZaeEi
         uQ6hY40qnz9PYnjx7U6YAoyFwUVB+TK1pknBpmU983OLYspja1KhqYkU5YcYTsNAIfO+
         bK1bfPXtbfrwTe/1sXwqZL8/x24zhZE/pEgL8D5wBlnk6PzxU1jhXUUbmqNA/gxLGxma
         olKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945338; x=1788550138;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fHmMOkDnc0DAMDW7+UXClup/98JMmn4tO04WF2LBRAo=;
        b=ij9QBRc5BNtoONF1/JfErhN8xftnRSmBSk6M8FWEX7a1lKepU4WopKNMCVwteNAA/z
         sVvLGtKjOcFH/7t67tQttz4BxVc0gryZVFrtRGkATLRJ/B4H39KS30GSLGhvn2pwAUde
         Naj8+QdTpofEP+phL6vB+15tIPRfvdycZ4ydbpaev/z8/m8jxJG0whZYSlTWcKbeWx74
         h09CFQ3hsz1Ya6mhBOpWgySpG92veBxkkGQzj0FA/g+VzInjVwEHYBZXmoj4sHZvqfJv
         Km2CbtJhn3KYxISPQ9hh/XczQ8wOVJ/o1SzBfxm/CApeE7JckPmCEE3T9WbD7+sxr8Id
         t53A==
X-Forwarded-Encrypted: i=1; AHgh+RoqLsRwPkUmMXnHwXXnVpZjZf3n4t3fzlr7iJXLV2GIrF6BJgXFxG+9NWGcbhZj6Ce4e6sI57BED0U=@vger.kernel.org
X-Gm-Message-State: AFuF++l3U+Kf2CRDQRK9ZvU8P2/4eW53vk3rOid2LDkg7d6LEksirc1u
	B00p9VcEpvgfWESBdSngzRQMhAeoDdwupHHKxpLQpNjQGOUGtnZiamo7l87eOgOBctpKGpV21vd
	HE2ZTeGLqoNTq/4Xu8gYIbWz6d1zseopnRzXKYBBm
X-Gm-Gg: AR+sD13aKJrUOVs1asdXxa9CnpMxtEhpug28GGuCJ4OeYaukLR9DoDXE6mrNZIE9/Az
	msyZJALx7v1hBHXd79IiSQRZfL+JcRBzRtuHfGa7/MpyOnT0R4oOfFVsYYoiXwg8Ax3e7pncEcP
	6AIFyeeZ0NW6XegIJEeA3x1NgqmObcNNHpFJkmM3xdmQmfFblQStAc40o7+j9EEVj5H2m6oHJ4G
	Njd/mdjO6Kvs/hKfGvrvrD3+sHpRyP3n1yU/0d2Bq6X8NxlbOWwJna2GI0oVplQlJk+3J65P5uK
	Lhl3Vc1VLHy/fhJXSyqM+AOHUfySbSpRidX5WtLd5Nq39adsa1PIMcHYFndeqdJgc5QXghVr56g
	=
X-Received: by 2002:a05:622a:c18:b0:51c:ae6:a57 with SMTP id
 d75a77b69052e-52ff715be0cmr2273411cf.11.1787945336495; Fri, 28 Aug 2026
 12:28:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-2-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-2-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 12:28:45 -0700
X-Gm-Features: AcwNN1Vl_L43jPWnHgUrkMtGPi--G2PYnVYEwuFbR2C4J7lwt5ES-sPxDWtK__4
Message-ID: <CAGtprH8JLx886qA4rVg5vCKg4M3u9sdEfPig_CtL1kbfvj5B9w@mail.gmail.com>
Subject: Re: [PATCH v9 01/11] x86/virt/tdx: Simplify PAMT layout calculation
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
> For each memory region that the TDX module might use (called TDMR), three
> separate traditional PAMT allocations are needed. There is one for each
> supported page size (1GB, 2MB, 4KB). These store information on each page
> in the TDMR. In Linux, they are allocated out of one physically contiguou=
s
> block, in order to more efficiently use some internal TDX module
> bookkeeping resources. So some simple math is needed to break the single
> large allocation into three smaller allocations for each page size.
>
> There are some commonalities in the math needed to calculate the base and
> size for each smaller allocation, and so an effort was made to share logi=
c
> across the three. Unfortunately doing this turned out unnaturally torture=
d,
> with a loop iterating over the three page sizes, only to call into a
> function with case statements for each page size. In the future Dynamic
> PAMT will add more logic that is special to the 4KB page size, making the
> benefit of the math sharing even more questionable.
>
> Three is not a very high number, so get rid of the loop and just duplicat=
e
> the small calculation three times. In doing so, setup for future Dynamic
> PAMT changes.
>
> Since the loop that iterates over it is gone, further simplify the code b=
y
> dropping the array of intermediate size and base storage. Just store the
> values to their final locations.
>
> AI was used under supervision to collect/apply feedback, review code and
> workshop logs.
>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
