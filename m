Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DE24C601
	for <linux-doc@vger.kernel.org>; Fri, 22 Mar 2024 15:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711119632; cv=none; b=uqSe32+En1NMOP6I1zA+H8YOYQCY7io1A/JPGBWPOJPZHsRyWrj4cy6g3QhYL2GII1e33LR04nN98fPGQ4XKcEfo3L+YXsH8bmLz5+5fDzNo7VDzKp/tEjtWGIApNvn63CTQ3zoC6xm5hwss00zaV639ulnDTcD/YuMnsc/RkkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711119632; c=relaxed/simple;
	bh=qXdtNxvPpsbpNODgvKjpT5XrGKp9Pc9HMJY7AIX1h3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j2QXOTD67SQpNJSJZ9+hzqRDn+5KZCP4F06VlkonlHazjpXOnmMz0JXwo1mXEl+llAHjV/xfGB59QFO2jPTZxLkBPgCgT6OFgEV+Q/M3HZVyBQNU13WfQuT3SkJc8xal+Qo30QQmlg3Xt+55/FvEE7dUo94SLAfm9tS+EWEOcRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=COJyZ6FO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="COJyZ6FO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711119629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ot97iwVakR2lkEIdq7JcwHUhieIrzYpSO8j17uVWGlI=;
	b=COJyZ6FOuIon+FQ+E1/FTPUqOdGYH+sEhw22jkTQm1NQsin4/kWhth9vzH43gEyFHRwedd
	i2Wtv6yxtCxzyjLYwhswrl99GEBaupdBX0SW/tGBlm3tDreu7y6yp4qWRCXwoveUPXah1x
	nHWLwBX7MhBLD68vX8WxpILHJJXT7ps=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-E0mnUopkPxK9xFX-QZwjUA-1; Fri, 22 Mar 2024 11:00:27 -0400
X-MC-Unique: E0mnUopkPxK9xFX-QZwjUA-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2d4af32be9fso22459701fa.2
        for <linux-doc@vger.kernel.org>; Fri, 22 Mar 2024 08:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711119624; x=1711724424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ot97iwVakR2lkEIdq7JcwHUhieIrzYpSO8j17uVWGlI=;
        b=v5wED0zul+MKtAPcEh3ULTan/ZDgejnAqqUqtRkaNnA5s6Dh/moYmcgTxhjhClK80x
         nPbKHg3bn6TI0/VMK9mlqKyR3HU4+D3ko3f/g16lX3mL8aq4yGXfCchNbLwLlVHM3LIL
         L5OeMPFHlWmqZADjZZrXHZbaHPiHlEXZw4OIjD/d1K8tXx4ihzO13XIZaoIGlKeR4yN9
         ixEDgq+CUDagDzSKFYuaDP8xyexPFZiwidNv7sA9l/C94P7j0pySZFMXh+wfI8bjQtW9
         WzLStBsaNNqi2uUOYwdVfH1wYDMwXElhOCuAkufocluYGiiEhyr+0yNUxCyjCBgZ3LaK
         lwNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCfHWnY4obfuGAH1vwWzsjp5EYBYHI/wCxAr6nhQdj42BUi9+vuZIY8K70++ihQCWr28dBAIquC2dR7HdFwneYR8trFFdaiJMx
X-Gm-Message-State: AOJu0Yynqb8+xcIXlJYYxNem8QI6/Ha3kfKOJW7cbO/NfyElxikfuDjX
	n5M9nn2l+sF60DmtrgxV2yFQI4EwtZbu8aXY01X6YkYRT9C+24b6Lt9LAncXW2TXABsPAS4I+T+
	ocI7SRyDQdVOnqFlfwI5u6rL8T7JOBPeJAr4bttQjz/7F0Yx3K6jy3dIYpKuHXhUnVgLVCIYnnS
	eqHgskoLaOaZm3cR59YvMRJ1aFxwN3tEMuJ0DGNwqG
X-Received: by 2002:a05:6512:612:b0:515:9ae2:93b0 with SMTP id b18-20020a056512061200b005159ae293b0mr1451126lfe.19.1711119624758;
        Fri, 22 Mar 2024 08:00:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoRqFuVFSCcYFtb/4CXLayeI15qnsRqHHZP3UDWQYikqtlTHVTRgMB97SI5tl1UUWqtCQprd6t9b/Lw0uFLEw=
X-Received: by 2002:a05:6512:612:b0:515:9ae2:93b0 with SMTP id
 b18-20020a056512061200b005159ae293b0mr1451109lfe.19.1711119624396; Fri, 22
 Mar 2024 08:00:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315-b4-hid-bpf-new-funcs-v4-0-079c282469d3@kernel.org>
 <20240315-b4-hid-bpf-new-funcs-v4-2-079c282469d3@kernel.org> <1c1ea8cc-22ba-40c4-a26a-5339c3050678@infradead.org>
In-Reply-To: <1c1ea8cc-22ba-40c4-a26a-5339c3050678@infradead.org>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Fri, 22 Mar 2024 16:00:12 +0100
Message-ID: <CAO-hwJLgx=vndgMRW=f-Gy_36CJLqwAzOoELbckvBn8NvCJB6g@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] HID: bpf: export hid_hw_output_report as a BPF kfunc
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 15, 2024 at 5:06=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 3/15/24 07:44, Benjamin Tissoires wrote:
> > +/**
> > + * hid_bpf_hw_output_report - Send an output report to a HID device
> > + *
> > + * @ctx: the HID-BPF context previously allocated in hid_bpf_allocate_=
context()
> > + * @buf: a %PTR_TO_MEM buffer
> > + * @buf__sz: the size of the data to transfer
> > + *
> > + * @returns the number of bytes transferred on success, a negative err=
or code otherwise.
> > + */
>
> Minimum change:
>
>       @returns:
>
> Preferred change:
>
>       Returns:
>
> "@returns" is not documented.

Thanks for the doc review (and in 5/7).

FWIW, I'm still waiting for other reviews if any, and if there are
none, I'll just amend the commit before pushing.

Cheers,
Benjamin

>
>
> Thanks.
> --
> #Randy
>

