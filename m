Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4167390237
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 15:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165943; cv=pass; b=q1jzMIhk3qP6Ddc17IYOO79RwL2g79FXupIfkMCM5L62fp3ylLnce0UPqudb+DTQ1RqIytraealXKqmuvo1uZYDGhooxncBQOzV10pJk3m8nfg2eap/DxsceuGTo7E+SUYfkV5ZMsv+753xh3WajDc2JCqHgpKAU92TMH0FiMDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165943; c=relaxed/simple;
	bh=uF1fNPxVyFqjEpgw53mbvgBu6WUcDvDr1PA4TgWZFlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lL0kLz+y/5IKN5tPmp15IgOQPndniqs58BftX3XjyJDH1CDFM9QLcyxXWgKWxcak+W7SzjnRY6MS85pAuHJEZDC6qnkpdg+JUui8zoP7BqlGu7Opnn0xMl+OFRW9vizXmUwCo8MpZH/OewnHaobyEZKGQ9e5oede852Ub4iv6VI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnMlg+ZC; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnMlg+ZC"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1c4c7ddaf6so412492766b.3
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 08:25:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785165940; cv=none;
        d=google.com; s=arc-20260327;
        b=sYOJGhJEj0aRuAjEbG8iHJR/zu7hSjmdEDXHWXTp7C++Vtmz6Czx+f7308erWRz4m1
         Itf51rm3k9Aj9gcQCH0uJ3qurwHP4r9FEDWcui3x3//cjse7tqOb0ltcd4xBsW2n3DOo
         OATbHRnL8zajsyWZIQS2K03KvrHmDA7HpBLxkwG22+0efdggz6hsba1QNcZEb2womVf3
         xo9dzM3kAcDnHE6s3GsyGvgdJtanTDYrpNWPTDASi5z6p1h5QEi4DKZ18AXljEtpwLZL
         ywJpcrtfOzAVdP5UMRTIUllMfkCwdK+l3RJN2CGepFNtTy6HhCMTcCPMe4liIfNtiR4i
         etiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZyQ5PZuTPEONWfNnvhVP4hsLVBIUJquX0mumyw6bxWs=;
        fh=tFjO62X6MhpJ2tdutsdo3qH6TJ8zIBLnO2qfESWAvek=;
        b=Y6VuA1ihcDbNxdht4oK1EpgXx1NoJivGIOQVmU0Lb6HySdFOTFksDyKND6Okfv0EaI
         0C4Wc8ZGy6CUjAEnqpOduq7BvsMWp0f1vdnufvdJJ+839eFMy1w5epDbctk1jjrrMpYV
         2IVXVtmyl8thc7X82JAzPhwj7IeVO2wz6+IN84EB6aBj9Lyjk3jSqRa1Ffbheaw2nRVP
         pyaiF4DkE8bQg/eXMo5d6mMVQBeqjaYKQx4k7WhK0OyAhPHSW4pKRN2stFOKMboAbdhs
         m0eT8yHEcoOezPgKxMHwyyhwIdEFW4V1UK+G5qzlnf/9w+/Hw8meIA4+C+A29+DuUHux
         9ayA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785165940; x=1785770740; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZyQ5PZuTPEONWfNnvhVP4hsLVBIUJquX0mumyw6bxWs=;
        b=cnMlg+ZC5Xaqh6CuSuFvImkISd2XUh+oSEYCCiVEf+g0Fs701fEhOGxwIrdWpBAnWf
         i9XuDK9XVOZByLclKIp5r8tOma7VxGlIkvgcDTUq4kg9yyVxtNi1KSdSehQt8Yc/mnlx
         nBIp15zhsJ/FFw3XP2ed6ao5DURUJ/HUNv9tJ1iPFctEXDx1B161QdhcWHP+MdDR0Y0i
         Njxk7v3jjPe1MFVJA9D0FxbjsB+kgofQCpXdcURN6D03OhbF7Vy5wi2iz168wWlfkyCL
         11tz2LgB3D7wSPA3X9LhpHl0FYBRWGkT+cOgklUjtrYpe0U6E86Zijmk4f9axFDBXRSW
         51dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785165940; x=1785770740;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZyQ5PZuTPEONWfNnvhVP4hsLVBIUJquX0mumyw6bxWs=;
        b=LmXMeDmOXHztI1u7I4O5Jv5mRHpcBiqanObH+YB/Uo6PC60Q41QOulgvUzRSyBeYCf
         N3xQ+FmiQ1Ar1ESKFBA8hs4Bq2e5YzXWHtD/D0Rr9a0VFTpnRZ7OQk7Oppt+eHJrrltc
         lvJwJ2DtYogHocRSAQpl9wtRx/B9TiryGcyEA6HBijg4LXbww8F1Bvp96pbKWAE0uwSY
         AMaXV3y8qTK5MUuhYSki5ttoy0Ouo7pq7hDPhs9SaFwVu60Zh3arjH9MTfTQk/RqMsYo
         sc3NKLBxqBWV6RDD00c43z2F+a3Bgk0vzzsiKEfqQVfXJ6DQz7GoUgeSgbkaukyjYLa9
         SMnw==
X-Forwarded-Encrypted: i=1; AHgh+RrIjWNpksFLXu36jQq70W/zRTuHorEQF286sbPHayjJqOOdxpKz2OZkeF/oIPA4GTmsfE0sTSIHUNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzewnsGVG+wlM/wRTYhtpWzYdnRyFYeuIyAz1DDSasmJNdXuv8D
	FLzmnkSawiYszw+/vdcJltfOGZ0m2juWIBMCj4C9v5HvAbbxBsbwG3D1MU7jup3BGWIn19cgZG3
	R+c1JHjskbcJVWb4fYo6Bj39ctBS98xw=
X-Gm-Gg: AR+sD10otuKrlihIwvqR5b73qRZv753/BEA5MXfOGLQTgtL8Hl4SqVUiTzRRQkmEr8z
	qQUPCSCVuvEwznObFmN8mxTyyuvHkizRShyHId2bEo3EMZwquurldWstcFP6MRPy7iYgDLg2skP
	43jp6+HXkqQGvGXI8GsDd33MOlaSMNxrbzMjyW9IfrGmVVHpvjYbrMKugYiChNwqT3hiMxbgjRZ
	LtzPMc0WnshK2SHNt8t/mYCRvfgBarbpJPJf8CmBXVqIXf02qSVC8BTIH737b4XYRE17GieiZzJ
	BwHnnILyNWLwjbrNqlvJ7iq1GzkR8Ow6bd8qNq9DjBxCkzJE6JiFxIQTPw==
X-Received: by 2002:a17:907:c26:b0:c15:cd7c:fcf0 with SMTP id
 a640c23a62f3a-c1f1eabef74mr350397466b.1.1785165939596; Mon, 27 Jul 2026
 08:25:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717195336.98500-1-nikhilsolanke5@gmail.com>
 <20260717195336.98500-2-nikhilsolanke5@gmail.com> <20260726182946.79a4ef98.michal.pecio@gmail.com>
In-Reply-To: <20260726182946.79a4ef98.michal.pecio@gmail.com>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Mon, 27 Jul 2026 20:55:27 +0530
X-Gm-Features: AUfX_mz3Tx6f_QGAH6lPEIgpArKnzr7KWgpSIZN5Zn993HpKDUv4hxmZ1aapDq8
Message-ID: <CAFgddh+1Bk=CFkKYNzB=L++UejkhCEcTHp4A2JL2v+P6uBuF2w@mail.gmail.com>
Subject: Re: [PATCH 1/2] usbcore: Add quirk for 255-bytes initial config read
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, stern@rowland.harvard.edu, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 26 Jul 2026 at 21:55, Michal Pecio <michal.pecio@gmail.com> wrote:
> > diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> > index 45e20c6d76c0..442c15f92ccd 100644
> > --- a/drivers/usb/core/config.c
> > +++ b/drivers/usb/core/config.c
> > @@ -912,6 +912,17 @@ int usb_get_configuration(struct usb_device *dev)
> >       unsigned char *bigbuffer;
> >       struct usb_config_descriptor *desc;
> >       int result;
> > +     size_t usb_config_req_size;
> > +
> > +     /*
> > +      * Devices with quirky firmware will stall or reset when the initial
>
> Has anyone actually seen a device that stalls?
>


Regarding the "stall" wording, I was referring to the condition where
they fail with -EPIPE error when these devices are connected through
external usb hubs. The directly connected devices I've tested
typically fail with -EPROTO instead.  I'm happy to reword the comment
if you think that would make it clearer.


> Even if no device currently uses both quirks, I think this belongs
> after the msleep() below, to minimize interaction between the quirks.
>
> >               if (dev->quirks & USB_QUIRK_DELAY_INIT)
> >                       msleep(200);
> >


Alright I'll address this change in next revision.

For the remaining comment and log message wording, I'd prefer to keep
the current version for now unless there's a strong objection. The
patch has already gone through several review rounds and I'd like to
avoid extending the review cycle further over comment phrasing,
especially since the implementation itself now seems to be in good
shape.

Thanks,
Nikhil Solanke
