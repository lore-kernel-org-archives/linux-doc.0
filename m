Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B6B219A8E
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 02:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763001298; cv=none; b=seG13Ar59Xkhz4FJq/NUzYp5+WJPjIk7lbnH5j8jJ0kuWb+P6nifdwc/RZ+I4ypsV+z+qtbVaXLXWcmqXODuOyWLXPIWCL1O+hTFk5Tksh8N7A1s/eye5If2V2QJIGkimSmrmOGIjoCktwSJnC6IVD5duPvCEbikytVOH0Bu09w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763001298; c=relaxed/simple;
	bh=2be84pmSGoqY5LY6UKe7Kjzv5ECj0W6rD+fdLU1Dgdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ASdUVQesmywzub6PdP7R5e5B20CTFW+JovthvvxAMf8s085UNBFILXZSDnVdl5bTMNJcpca4GcFltRYzWb/gZCck+ZtxzmAPIVVrZ+Qh/EldeBFDfIeqSU/RZSY09FxAMTqo5m61zOIa16/VcxlX3PwOzqnByTzZO1BxnzsS0JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KpYZYZ+h; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KpYZYZ+h"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b73161849e1so42815666b.2
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 18:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763001295; x=1763606095; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zv02JfQdgNQDAuVUUhZD9gwf/2OoSOdMlkTDlq5Wbwk=;
        b=KpYZYZ+h1mVzvUhVP49A9aTVZV2U8caBqLuRPOHxrgUz7g5ZH41UhKreWoI+PJ9g8e
         GnEs3HgWv1NcDLE+eWqanGWE6Y4vvsbQHD1MqHrAi3jGFBqxv2NGg7zmoXngkqSeZouI
         yGeifwVxWOVYV18IisWapCqO4gSUgRBnEq0NFw0p7CP2NUcimrN5FspRzRqyAnSkoCUN
         6lAQBKy2GhYxc7Z7j3y4ncrHaWo6haw6tDtmZppsFewmj+UQGSBz9FEi+NVkODqlFO3+
         MC2pEdxne9CHoEVW7JALOFXDT3/MqvaT7b6xaFMzUXTQv54+vpaILVXhQXXfMvoGQhUv
         Q86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763001295; x=1763606095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zv02JfQdgNQDAuVUUhZD9gwf/2OoSOdMlkTDlq5Wbwk=;
        b=VGbn38v1TzpNCtumSVxQNv8UsOS1TNt6Yik7FcYprApnEEejXhHtoZEh1P617Uj6b5
         +5M4VwItmP1XXl2JdhC5+XoUpcB5cKp6Em5Zv/Rkwfmo2Xvb1xrWDr06EwDZBRuRBvYp
         0bOokVTgK9Q6uAdez0dIfuJT6OSHZw8hwF4pwZaaIAXPpMI+z3PMt/hSkHsO0P3ttm4b
         Picwb7OAEjwenDc4VbkOZvLaRUljRO5CMI83JZHsKnw+b1zvz0Csq0eTKwoz0hVI+ou2
         1cA7nnhJqhIfOtumx4TQy19tQQUSGUhsuhMLBwa2rE+VJo3bh3THuvUPh+cQYad8nB5d
         Q/nw==
X-Forwarded-Encrypted: i=1; AJvYcCUqbfr4PAuVtn4iW5Vr1td9NGVmt1ZVdZ6wCV8si5bqss+uR2RIEzpUSjA3VdSnHkXXDtLEWURhiAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2z+euj/DjM5WFLK1xlwxb72x112XtxYktpW1pzx/vXGvJvzyF
	olVaZzffT8+YLEZUEMPknCySFQfuXDc2IREOuMb8tYHnb02nDPmAWMXP0hvixYIBSNfGncjEiIT
	gCatS6dRD6sBrrV/7wxJgqkyl0eS9Eto=
X-Gm-Gg: ASbGnctg7lP1Aw03L4yhYLfZA06MmefGz8Y9fDMxTLzDiNUyUl2Lm8NhV9Tdwio/nDT
	oflih4pcAEP5vWpK/Oze5sTkqWcpaA9kBntcJZD5OcZEKPU56NhBTGb9OdJc7n5GxF5fOBSNkKH
	80/f/DbXN40hTN1caoVnwZ6sLXqfktsyz/216aZkUe7Nu1SYcsumBHSr69IeDOnoXYlZQ8ikYcG
	Bp2Y50/ec28qH7mXgpvc8prn6GrXVGmbOo+JfqnceaatNVFVVPaBxr1eo2p+VY1N5IHCyKb
X-Google-Smtp-Source: AGHT+IHnM5JSPUAxCvA9H9uZ3tXrWbt1AXlQ5LnzI4R1/1MgrQjv91aPRT1UFoRpJikcTedZWVwfEVHUSRM43aX+kGo=
X-Received: by 2002:a17:906:dc8f:b0:b71:8448:a8bf with SMTP id
 a640c23a62f3a-b7331aec77emr541405966b.62.1763001294763; Wed, 12 Nov 2025
 18:34:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAN2Y7hwttMyUn0qsEcSBbrQ1h+aSzNpHMhgAxEbqJZn4vf5hBw@mail.gmail.com>
 <aROfRBGmglPgcPVf@slm.duckdns.org> <CAN2Y7hwUmdFMM=mwYq7gsBpbSEBq6n0nXzmES4_=p3fDV=S+Ag@mail.gmail.com>
 <aRSvxyoWiqzcBj-N@slm.duckdns.org>
In-Reply-To: <aRSvxyoWiqzcBj-N@slm.duckdns.org>
From: ying chen <yc1082463@gmail.com>
Date: Thu, 13 Nov 2025 10:34:43 +0800
X-Gm-Features: AWmQ_bmqqpz2BzShuLtpfDU10VTxD7EM0FTkyssYomi0u4miw5mWWt5iNq3Aejg
Message-ID: <CAN2Y7hzDZxt5tBPeqwKwNNwwGXgmhj_uYDMkxx5_QtoqV97v1A@mail.gmail.com>
Subject: Re: [PATCH] workqueue: add workqueue.mayday_initial_timeout
To: Tejun Heo <tj@kernel.org>
Cc: corbet@lwn.net, jiangshanlai@gmail.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, laoar.shao@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 12:03=E2=80=AFAM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Wed, Nov 12, 2025 at 10:01:10AM +0800, ying chen wrote:
> > Works that have already been scheduled will be executed sequentially
> > within the rescuer thread.
> > static int rescuer_thread(void *__rescuer)
> > {
> >                 ......
> >                 /*
> >                  * Slurp in all works issued via this workqueue and
> >                  * process'em.
> >                  */
> >                 WARN_ON_ONCE(!list_empty(scheduled));
> >                 list_for_each_entry_safe(work, n, &pool->worklist, entr=
y) {
> >                         if (get_work_pwq(work) =3D=3D pwq) {
> >                                 if (first)
> >                                         pool->watchdog_ts =3D jiffies;
> >                                 move_linked_works(work, scheduled, &n);
> >                         }
> >                         first =3D false;
> >                 }
> >
> >                 if (!list_empty(scheduled)) {
> >                         process_scheduled_works(rescuer);
> >                         ......
> >                 }
>
> Ah, I see what you mean. The slurping is to avoid potentially O(N^2)
> scanning but that probably the wrong trade-off to make here. I think the
> right solution is making it break out after finding the first matching wo=
rk
> item and loop outside so that it processes work item one by one.

Processing work items one-by-one is indeed an excellent solution.
However, wouldn't it also be necessary to provide a method for
adjusting the mayday initial timeout?

Thanks.
