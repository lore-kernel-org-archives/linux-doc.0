Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41B450B43C
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 20:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790800882; cv=pass; b=PY5ylDro09m2oX9glLe/wZn32VJXirn4dTupHPCC3T13ZTmxtg2ni6zc9EFNu5cfkgB1FoHOB/3CgMSvvxQtUqLQ8TBnzge3nf4ZDb4eZMTeseS4ApYmHADas3jDByev4A3HfX50wyrczk6ofC2NvFSKACNLJ7jG3h/zQTNSC2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790800882; c=relaxed/simple;
	bh=4ZgBL9At6wAfTG1eapgAa5Mkts6axxE7nn1CIos/pc0=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=igwxii6Saf8CklS6aRy14WTTLHYbBQFHSiYzP9IG7lZ9J2rUGk5MGe0lcQzGC24yUKUsGBC1wXAvdYdhDJM3hIZTaxLvC8OR3EP8QZyrlINHCDmlI3vfasKdXMt6lxD8LfilxeFw67yx1oENt9P7XHm+vPXk4rbMO2NFkvUq4jo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/2M+WH9; arc=pass smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/2M+WH9"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-532bd8c7f70so9330351cf.0
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 13:41:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790800880; cv=none;
        d=google.com; s=arc-20260327;
        b=Z6zw9yAMSEblYWistLPknJmNTkrjOCjozHZzGvp6facCWCQY1uHOLPKjKJosMlrtxA
         iINtBVm9HXQq1k9CRIixk73ZDla1enVPRnWzHoIM+NFZlfs6NTPeSrd+fzNssdutlnW8
         9q1ajzcmaD+h1fBAO+9Cm7GXx6sN0Owus1+JvJiS5nRoi41+ldR7ELcFX2/4yNWfEHl7
         IPXWmmrCbKqifFL0lgNkcrMGai/l7xEe1Hl0WY/Gd24H/JS3dfPX1gjGw/vVAxUvsAkT
         IEHW1D5vehwDTaaUzljMt6qi0KDPXiawprxMh5fhPj56h60b1TgagLQdfat3ZzInAYC4
         qjKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=4ZgBL9At6wAfTG1eapgAa5Mkts6axxE7nn1CIos/pc0=;
        fh=PBlI91hALry740vA/Jd6c/5dD86lQwLo1ORk5oEYmSo=;
        b=Bgk9W25FFNzQ/IzLRj1G0DWNZu950l97ecqqji47fGB0Fs4eJXmIDlDx49mg6W3Utc
         7Ps+LhfNwOTmx82xO9+HSwXi9e/E2lHiO9e94bpkyQnc7WQNyHNjr5yIN/6g6ogE5y64
         xzoqvuFS667eXZ2+DRPqT5vR05GpYo4nOLvjnyTXEhWucTB++fDzSKBJqM0LPtP6lO/5
         z2l2Zk/+RKTaz/+BXEsDqXVwnh9jujv1X8N9nxZosQsvujR9NDLEGVEw3tBihrWDrHp1
         tXnzgi9xiEPy0AtV79bXMVXlwaxT57j4+S7H76+PSD/ocCXpdMyozcq4diRhLR9Z3mfm
         hXOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790800880; x=1791405680; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4ZgBL9At6wAfTG1eapgAa5Mkts6axxE7nn1CIos/pc0=;
        b=L/2M+WH9BPjv3gBD5XuIqtyyXziAr4FnWX7HFBXQkcgKBgza39T3xHpRgd45MH3Yho
         m0IJ0RrwHj6ce65/bHh/+gnj6kGSAqVY5UzfeSP90mguYnQPqxrgzpj4NuG/mkkguSfK
         GO20mK3/CfAVZC+agSrxGG954CwlKBllgMIfS5jdx4KuPpv/VtHD34Au88+wdYf6OMw5
         aDMSlHCwgEbKdeZTeiAhD4yXj0k4181yD7xQ2lapkug21sn1JRoi7Hy8etE+VbC48ZCv
         Lb6kqDzGt0FGySjuHzbMccaoEJgsmQmtPq+DYK2K5GZBJjAUQSBCuabsU/9gzs5PDyZk
         BNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790800880; x=1791405680;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4ZgBL9At6wAfTG1eapgAa5Mkts6axxE7nn1CIos/pc0=;
        b=ioUZdC0QQMM5QXUTxs7l72cbc74uILYmcajbbBvghCBwtyq16BLLy7gu6B+/vUWEJD
         b+0LEc9WYUqZWFSmdQFq9l5veABC9SQ083CiSz80yID20HFWiVELI63T3QhLvZd2Zs2U
         gnzkI9c5aypX60ZLs2Nglm1XfBaiScYKb9DjuBoCKHpyVaEx10pLr2slc3GkmFAtTam3
         ZxvKoYTFtxirzxj/PnAOqttGRZmQeqEDp8yCzuFEJFoet9Tdg7lvETX87OmfgIHdzqsn
         nXnETlxlJeKeRr2jgHsihWCMA6qpbr/UnOs8hK4JTysuKct8WxhlAipFw6DA9Pr6eLGv
         4WlA==
X-Forwarded-Encrypted: i=1; AKwUvByBaDVIllx3Bd3WI+JFpeGh6xnv+b2B6vko0bTMLqGLfP3fxkFlTQ5KKdVr/PHvObZNalQRnMUbNPs=@vger.kernel.org
X-Gm-Message-State: AFuF++nLDC68JTU9UrlMRfNFHUdQmdcvsUM5b2dfc5/szKKLx3Zm2uGy
	IZCvnefYsCgHH26zAwD/BANB6Xfo37jtrixyNtUi9m5PtbRWCtyFuas+A0USOOJO9RXeVBylpq6
	73NnWoXgzyVVnPvI5bcs+jCNtCAmpTns=
X-Gm-Gg: AYBFou0paoj9p6Ru/uzqiHROIHBI70NrF6fsTrFI++heOjWx9iavLt0mHD9eduIvLSG
	a/+ZkmHIuxuCv1J0OcdAaa3Q+LpYw+dYdj9NBJjj+r2RxLPw3Y+xwq43LbHh7N49eFkllOZdIjC
	sTxlTvGh+AqdgSIj3bWeG74Tvurf+PorAcDtBB0DARZxK0HPBNR3zjWMF2KqY9fqR84qt/eDnsN
	FzO7cA2RzueULy1dGM4vfCo2cUVZBy+NoswPZGkwyjhcLMjbur0DfMmhMFAHGPDnc9k82x7eTno
	7Zqi+s4/P7n8C+RWc/lUkoGmHA/X4T3fSoMnC/tSP23meZ7RO90h86rAL3BGFt7sCQex1KuM+o9
	EVqjEp52kncpIjgZISRmxZtik8XRWQjD+SxMuijmP
X-Received: by 2002:ac8:7fd1:0:b0:52e:3991:84c8 with SMTP id
 d75a77b69052e-5337433c972mr47060651cf.2.1790800879485; Wed, 30 Sep 2026
 13:41:19 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 30 Sep 2026 16:41:18 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 30 Sep 2026 16:41:18 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aqfyj9saFPR2K8j2@ashevche-desk.local>
References: <20260913095111.2543502-1-miguelgarciaroman8@gmail.com> <aqfyj9saFPR2K8j2@ashevche-desk.local>
From: =?UTF-8?B?TWlndWVsIEdhcmPDrWEgUm9tw6Fu?= <miguelgarciaroman8@gmail.com>
Date: Wed, 30 Sep 2026 16:41:18 -0400
X-Gm-Features: AclHuK9Ie7lhPgTp1aQTn9gk8FsouNbrLOg2hwfGPxPNkd7QeiClVQ6hAoric8s
Message-ID: <CABKbRo+zGanUe4uJU1HC=Nwm6E4j6DUh55pEgvng3U3AmaOPQw@mail.gmail.com>
Subject: Re: [PATCH] ACPI: device-id: document struct acpi_device_id
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: rafael@kernel.org, u.kleine-koenig@baylibre.com, kmehltretter@gmail.com, 
	corbet@lwn.net, linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks Andy, agreed on both points. For v2, I'll use
ACPI_DEVICE_CLASS() in the commit message and move the drafting and
validation notes below the --- separator.

Miguel


On Mon, 14 Sep 2026 16:11:43 +0300, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Sun, Sep 13, 2026 at 11:51:05AM +0200, Miguel Garcia wrote:
> > struct acpi_device_id lacks kernel-doc, so extracting documentation from
> > its header describes ACPI_DEVICE_CLASS but not the matching table entry.
>
> ACPI_DEVICE_CLASS()
>
> > Document the four members, ID and class-code matching, and the table
> > terminator. This complements the pending documentation header-split
> > update without changing its include directives.
>
> > An LLM drafted this comment and changelog after being asked to address
> > the missing documentation noted in the header-split discussion. The
> > field descriptions were checked against the ACPI matching code. The
> > extracted documentation passes kernel-doc and a focused Sphinx HTML
> > build with warnings treated as errors; checkpatch reports no warnings.
>
> This paragraph is more for the comment, no need to include as is into
> the commit message.
>
> ...
>
> > +/**
> > + * struct acpi_device_id - ACPI device matching table entry
> > + * @id: NUL-terminated hardware ID (_HID) or compatible ID (_CID) to match.
> > + * @driver_data: Data private to the driver.
>
> > + * @cls: PCI-defined class, subclass and programming interface code (_CLS).
> > + * @cls_msk: Mask selecting the class-code fields to match.
>
> Hmm... The only driver which uses this is AHCI. Yeah, that's fine, of course,
> but might be that in the future we can replace that with a traditional list of
> _HID:s, who knows...
>
> > + * Use @id for ID matching or ACPI_DEVICE_CLASS() for class-code matching.
> > + * Terminate the table with an entry whose @id is empty and @cls is zero.
> > + */
>
> --
> With Best Regards,
> Andy Shevchenko
