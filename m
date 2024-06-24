Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DB81EA87
	for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 16:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719245952; cv=none; b=JXNYBN8BoMDnxlv9AbY/vAIKu8/mByPa8zquWF3/9FkTtMMd3QR/TAdol4S6i5LonokFjbjin1I6kT+bwgQSgkyXsn9TgHOb8mxhga8C3iNvi9Pmz6lrioLFtKaBKBKHoaoFZvRxdA+o9fz4LF/VPJs1cmr28s3IrBjjU+Yc0MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719245952; c=relaxed/simple;
	bh=nyAl615ThVvV+3Fn0R2Zo+cJmdR4uumn11lPVUXlXNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKnoMCdjVE1T5e5+Vi2no9Y4Jt4Nsn3crusuy77s3D2psWYpdUiAEFezBmRPeAMkYjO7gpoDBQtEumfKvFGsdqKQ2/A1R3bnmqGaEBcuDd8xBhSaxNi7S0gH5NmMkN5NG2Z1XYgq/XoMBhFhD3hUn5SQu9rsqD+86JltnwpQ+fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vTyTVcpT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vTyTVcpT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-421b9068274so40055265e9.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 09:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719245949; x=1719850749; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exDolX4nznB1E5gtLAh07wVpA+L122DNFPurXAqZ6H8=;
        b=vTyTVcpTyvd1j2Z2OSpZs5fwdG7jtc1P39YjNdkPu3Fj8NSg0SKkhegMMAxkqyKYe1
         6s/DjMeDhbWOlRpbqImqQ9cfqz+2lSm97XltNxcrhnrciZzPZXe44AEKBuAS672dVGOU
         z42qRmYouhK3bIqCjrP1Eg09RpWkXvUYUBzRIxzmvougqNY2EhMjcJcJlQ9o6DnoClRC
         XRI8x0ql8jg1WLVplLu9FJgz02JovFogci/5xa0gUelj8n0Mjrp9EL7/u4XSXPWlzAwv
         qYJ0S7qMx5lmXv4o+nYz4qA10af1CuMLKZmy9Ot7alpqTMxveO/ykr8zE4iEkcXIQ2l7
         6kmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719245949; x=1719850749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exDolX4nznB1E5gtLAh07wVpA+L122DNFPurXAqZ6H8=;
        b=Sv00qrvIgfAg824lWGYjbDy/RubdCBFUGbCuNpukfjMJmLkM0n6DxeH/ZFj7a2IB2Z
         TdAotjR0aiTPHxm90hw0Y4untg00YdOxfOds+Xkpud2veG1RX1A5tX7aBmKWrbXCUY66
         SfE9o2U0FjegMPwNp5utnXBCVGG1iwInhjhJdq5G+4hw4HrjsOjJjqVCqpOYT8c3ENNv
         bCtGnfaZPFPrdkyFSu1ogs/CJPPBz7S7YdYWFNmCCWN1ybOfx64MP1KHnW4eM8IfejZd
         9MS/d4EdJfXKqvkAFMTcj0FjM9dp54/w5vW4gOVDrYIHCBFIo4iGOv0KRNBdGv9RFC+s
         +wsA==
X-Forwarded-Encrypted: i=1; AJvYcCW6LdKNiExPl5D0KaUmA+iHeF4V7eavVOeVvWpWnnPWzS0weCgdGyrgI7Q4WzRQDO1cbiUZx1wm+Dgtpc1l60TdDbnchYjVhaP9
X-Gm-Message-State: AOJu0YyNJ3oq2av4uTpXr0ewaanLw4u3Pz5Bg2kp3appHAJP8rSWhgAV
	TgF0YmW3+FrM6JAxQYEGjGK35Rdn2c+Lv1mKapYqx2SKCX2E/vSc3NDEVIEB3QLiG6GMPlg+ERR
	lDH6/rBskiPa60lpLIacha1jxx+jCRYsEKbPo
X-Google-Smtp-Source: AGHT+IGSVw5qqaiDJoJAzv1QgeYc1bbCjN8cj3oSXD+wUBpbm1EzCyUsNE5BXJsde0s7ePDGMdkvsVzOvReKFpqIj9s=
X-Received: by 2002:a7b:cd91:0:b0:421:9502:3f24 with SMTP id
 5b1f17b1804b1-4248b958d46mr33592405e9.14.1719245949267; Mon, 24 Jun 2024
 09:19:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620184856.600717-1-jiaqiyan@google.com> <20240620184856.600717-3-jiaqiyan@google.com>
 <a272d16f-fb9a-48df-c90a-e848f2d44210@huawei.com>
In-Reply-To: <a272d16f-fb9a-48df-c90a-e848f2d44210@huawei.com>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Mon, 24 Jun 2024 09:18:55 -0700
Message-ID: <CACw3F52XdxHJhDDyz1jM9SEuLYO21rvyCVZdn56-h2k=XaKiQg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] mm/memory-failure: userspace controls
 soft-offlining pages
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: muchun.song@linux.dev, akpm@linux-foundation.org, shuah@kernel.org, 
	corbet@lwn.net, rientjes@google.com, duenwen@google.com, fvdl@google.com, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, nao.horiguchi@gmail.com, jane.chu@oracle.com, 
	osalvador@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2024 at 8:41=E2=80=AFPM Miaohe Lin <linmiaohe@huawei.com> w=
rote:
>
> On 2024/6/21 2:48, Jiaqi Yan wrote:
> > Correctable memory errors are very common on servers with large
> ...
> >
> >  /*
> > @@ -2749,8 +2760,9 @@ static int soft_offline_in_use_page(struct page *=
page)
> >   * @pfn: pfn to soft-offline
> >   * @flags: flags. Same as memory_failure().
> >   *
> > - * Returns 0 on success
> > - *         -EOPNOTSUPP for hwpoison_filter() filtered the error event
> > + * Returns 0 on success,
> > + *         -EOPNOTSUPP for hwpoison_filter() filtered the error event,
> > + *         -EOPNOTSUPP if disabled by /proc/sys/vm/enable_soft_offline=
,
>
> No strong opinion, but it might be better to write as "or disabled by /pr=
oc/sys/vm/enable_soft_offline".

Sure, will update in v5 (which is mainly about the kselftest-related change=
s).

>
> Acked-by: Miaohe Lin <linmiaohe@huawei.com>

Thanks Miaohe!

> Thanks.
> .
>
