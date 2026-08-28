Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64FF33D4E5
	for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 19:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787945499; cv=pass; b=aSEC97gZR4H5Zratzuy3a9MtHBB6AazaIvyVQjXHN56Sl3D2DqDQX8AsBYoz7BDcHsf1k/7YfrnlpIx6uA6F3f8AIYnAo4K7lWdvNByZUpmx77oqtI5q0RhS+LFH3rtBX+vek0xjKqQXnUwyjAoybj56E3cGw8r0g4rbHkXA80w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787945499; c=relaxed/simple;
	bh=CdWj4WZBsPRTHGep9Z7y+jcoE1QqheNf+EyUKQPri1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qlAj4lsuMBaut7DVIYpI5bVWWSYajt0Gjz9S+UVKYFf+wf1TDnkOpK6RtqGA+SOc5wsrS8eeD5FRoNS/TIRs5bIkZoWDIc5duI8vviV7NcPb7boxPvL4DhloUH9htPm6LrcXlWaxd98Iaw2RvLDDfNXP3wWuHYpeSMZdhyUuTWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bPy7cmUX; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bPy7cmUX"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-52fac937235so44581cf.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 12:31:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787945496; cv=none;
        d=google.com; s=arc-20260327;
        b=Twui7MTmFrfbLnbuOgV3gL24druLbhjZbhAHucyR8P9vFyq12hDbeZtdRiKGgTcJl3
         0/mdHM8H1wTXO4Djzbuu7scRzVYfdHD9yp23kLMFwNOWFqBo5M9imCILUrtCa9z36Xax
         C0p03eOizAz7lsRc+78ypMMU4UKC/DOUo+NV+hcsnlg1MYcrZ4jK2ZTGGSdt2Jsq/8cc
         1zbgEEwRfWuvVEVpDf4KRYlbUf3brLZJBPWqtNlB13DC+ADcM8MW6WlY7XOTteQ/0tP3
         xh8yIPDf43EHQKDYfPyQpgG1ZGdIrBBTclJa8lx9AIUOSvW/D81flvy0ifq23vLbQT3A
         nTiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CdWj4WZBsPRTHGep9Z7y+jcoE1QqheNf+EyUKQPri1k=;
        fh=nPVwTSb5FeP5FaU9ZTk0ARyYKCFili9W6U2G8WxK/Ig=;
        b=atxE9xvDGyE+PCxGK1d3pA4W8yz+mQc7P378M0xbhk+wKRW8jS9a+vJc6Uc+1KQjvt
         td/6qJklEaYGTgclQPQXWc1Wm182Zs/JopEAFIrq2c3iOkvP8A1kRbq2v8wxsvT0a/gQ
         FhFw5idHYvntkcDieJOFCdWL/ztWK2O0fH9CCQmRLu2x78+ObnizCfnnzqEnax6Vxf/2
         Xd5NkPWayHPPMtv4/SfoswVa3Q+0FQ1d8MvJARSpUkolVeACxK79yVFmBbLwHnX1zfbO
         yJetSb7ntEopY6HuAsfV2NCXG0aOhqeMBhys0LlW2aMjZFhFxqIAqxEWK+Cg6J03NvdY
         xrYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787945496; x=1788550296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CdWj4WZBsPRTHGep9Z7y+jcoE1QqheNf+EyUKQPri1k=;
        b=bPy7cmUXA2ocqz1JBhVuVuAhsGRvd9VvaSeYQhJlJfKq0WpAVzn6jCrqJ9uTq3aZoo
         S3lSdQ2IYoD/NtfB3fHAP+GgVOlSdT/ri4c6XA8drs3v8o1In6gg+DhKRojq3AQoS1G8
         oHgzPwsmhVe8pZhCy06IbSgYL43gDwmvr6bCEMoqnZ7OQ2y3YeBvd9gbhk0n93KoQSBU
         yb4Y22m1vSDnzE/xbH9qhR8TzFCAvqlvpNaonbu0ot9l0h+sbW1dFZhO6PgoE12ncOm4
         v+xxQkEl5QiNkO4SsJAZ4eF+0R5PHtaMChY28Oay34biChIX8PAvs9152BJGrfm5YHVv
         w9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945496; x=1788550296;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CdWj4WZBsPRTHGep9Z7y+jcoE1QqheNf+EyUKQPri1k=;
        b=TT65PVC/qHimquHK17FAqvwi38d66CpBjKZXIotmL3//H6fQECDp3NffTtH8mg6nhs
         Qi0jagpBgwdhTQeEkElKJ+NKa5tzJewUNqX1reXCWsLSrDnkcqjxtVK0ktEmlqXTjMs/
         H8QEmvu1vrzjWdxsChOqCKdAiq1KIY7xlaFAWM5u6yk9CpyNGpu3m0hoyWBjVqRoe4pu
         0MN/nRLvBpxSLPesbFUvZQvWwnCc3dMFPDGQhF7Jt0vCEoHCxX0TxeuvG+fFUHklF1OY
         unb8h507GxEHA/4JPOiVBspuS0WWdhmX7SXrOR3GSJREIRc7k3pBkkMrPoawUvLSpPef
         saAg==
X-Forwarded-Encrypted: i=1; AHgh+RrToKjM+Hh32y9OLSNLkjGW6WpCr+vDnrUoVmnB+jz3dbmMFsK9//9DR0KN8D0/jTg10tIN2tzbAwc=@vger.kernel.org
X-Gm-Message-State: AFuF++lMKoa34W0x5R6xcL4OvN31p0xtlitSBB3epZN4N7T+D2CS1ufM
	RwS55KREx4RzjcpcB0w71TWCJP/wLl2PyGrGGB7kpgAo1gJ4pp+z49qr07xo9sW0NN/kavs+71p
	PYe9rDYRMI69IXQMMLxaGTJswKYwEq7Z3IiasGAp6
X-Gm-Gg: AR+sD13xmU/9S2xXeEtdAImDmQaIjVGP5JpDwZ+TDWLkqv11kLCagdSMVHy64UTgDbx
	E98vlQGOk4j5hJjTThuXPAGmNCasi7qqHQJM6yeGca4/brNQtkJgvsuPfjdltwZxlsaihf9LR2z
	vALKFLtjzLy9FM2j2kb5rxkY37zz/GPIiwh5qG8vTOuri0o8gv6QjaOztvUSNbGsD9rcmrvEOIU
	Dl3oUgNtnlHjn0CQKjFNJI0obUjBPKwnnNvtL+2AGKKg8aklWqjVesUI7v5zy7QyUMQzO+BdIGG
	tkFG3816yv2NTCc2H47Nms9HjRxNxSN1C7zglItvHxL6wYU3akj6z/mmJFMIoqZxhmgMHrxMiBU
	=
X-Received: by 2002:a05:622a:e3d1:10b0:51b:ff0a:2048 with SMTP id
 d75a77b69052e-52ff716ce29mr1709001cf.3.1787945495743; Fri, 28 Aug 2026
 12:31:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-3-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-3-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 12:31:24 -0700
X-Gm-Features: AcwNN1WNSpQsijIEuWA2m2XaHo35MQhGxpQjLiFkQcVF5TdNjD6IsdWSCXD5vno
Message-ID: <CAGtprH-qD_P=_GTNmjKbhHk+ep959xcaP0PqUD-KgOv80=OPXg@mail.gmail.com>
Subject: Re: [PATCH v9 02/11] x86/virt/tdx: Allocate page bitmap for Dynamic PAMT
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
> The TDX Physical Address Metadata Table (PAMT) holds data about the
> physical memory used by TDX, and must be allocated by the kernel during
> TDX module initialization.
>
> The exact size of the required PAMT memory is determined by the TDX modul=
e
> and may vary between TDX module versions. Currently it is approximately
> 0.4% of the system memory. This is a significant commitment, especially i=
f
> it is not known upfront whether the machine will run any TDX guests.
>
> Each memory region that the TDX module might use needs three separate PAM=
T
> allocations. One for each supported page size (1GB, 2MB, 4KB). The
> TDX module supports a new feature designed to reduce PAMT overhead called
> Dynamic PAMT. Under Dynamic PAMT the 4KB level is allocated dynamically
> during runtime, while the 1GB and 2MB levels remain allocated on TDX
> module initialization.
>
> However, in the details, Dynamic PAMT still needs some smaller per 4KB
> page scoped data (currently it is 1 bit per page). The TDX module exposes
> the number of bits as a separate piece of metadata than the 4KB static
> allocation for normal PAMT. Although the size is enumerated differently,
> it is handed to the TDX module in the same way the 4KB page size PAMT
> allocation is for normal PAMT.
>
> Begin to implement Dynamic PAMT in the kernel by reading the bits-per-pag=
e
> needed for Dynamic PAMT. Calculate the size needed for the bitmap,
> and use it instead of the 4KB size determined for normal PAMT, in the cas=
e
> of Dynamic PAMT.
>
> The existing metadata reading code was generated by a script, but the
> current plan is to stop generating this code, as the script has continued
> to need adjustments. So add manually written code and adjust the comment
> about it being autogenerated to be more generic. Start to adopt a more
> normal kernel code style without the ternary statements and if
> conditionals assignments that the auto generated code has.
>
> AI was used under supervision to collect/apply feedback, review code and
> workshop logs.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Vishal Annapurve <vannapurve@google.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>
> ---

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
