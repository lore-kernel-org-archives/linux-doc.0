Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC651E2858
	for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 08:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751271927; cv=none; b=i6r9UlBRzBsbslHbnqxZKmJDAMssFvHb+Ts9brs+fGIQWT1hNjy1OjVmjzjoaZnEh+NBylMV38JETDJhDBnBKDAHPykQ7nfKdikwiOIEpWCIWS6NV2N4pK3aVpI2Y+VCqv+rYXl9Pdlfk4wPAXgHRUXy/AUGt7XRcABw7aQQcgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751271927; c=relaxed/simple;
	bh=3i7exFRMw/cozc31u51qSuQ6FVkvdtk5t2I0S/5G5wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B492ApKamzR6IPBBrD4NsX2AICMu65Gidps1I565qycH8L+GGqiGrGBu4wvUaqefuQeJT8hMXcSQakLVvYnlFRZVklaEgibaAhrJi0QfvEq0ZFK0IO79S/Jo1TsSx6qyWcg7H6OzlK5CT+/AS4BRnyd1fWks6j1JWRPIbeSniA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cHkVYu17; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cHkVYu17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751271924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3i7exFRMw/cozc31u51qSuQ6FVkvdtk5t2I0S/5G5wk=;
	b=cHkVYu17iBKjpWjVLSsATbuCGrQuezOByh995mr+PG/WrvllZJ6tSu9dW+AtTvb5mfr+cn
	mIsuImnX9cqGMwoTUl5nI1Jpe69QyaiD1g2cpq1kcFjt8y6GpoW/75Qupew5lDc8MFSnUX
	NwtduDniHW7Ejr47vQYoZSF1IDT8ctE=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-w5cMENbAPW6BMjmAvR9hsA-1; Mon, 30 Jun 2025 04:25:22 -0400
X-MC-Unique: w5cMENbAPW6BMjmAvR9hsA-1
X-Mimecast-MFC-AGG-ID: w5cMENbAPW6BMjmAvR9hsA_1751271921
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-32b4a06b780so16133571fa.0
        for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 01:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751271921; x=1751876721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3i7exFRMw/cozc31u51qSuQ6FVkvdtk5t2I0S/5G5wk=;
        b=tbQ2HJlgfJVRT9/pZMCuDP5sgLSBvgRZ/gtNyp9TuXhv/g3nKa0QGt5/Kbdu3dfFR3
         lQX95Sc90mR5bROWSwzf+NmHvq7201f2fhzwHiZI3WAHhBtaFKXQbIpHZTywj/5EXekV
         os2LqEfAUtN0Jr1b4MpE1hvqjvHGBrPQ9dMxLCMGRJ4/N+tp0rB6Ian0wxFM41Rk0IGP
         i42cMiK0A+6pqP+wZ6DwI5kOO0HEABx25dedF7osLznFaKTpBXHqDetFRNv9xPzFnMg5
         93gp8ojEXD4dgq17dDUF5V3Wkr9udFfDdOFhYDy+2UI7KchwT7dd7zGN5ugp5XKJ0N0Y
         jU+A==
X-Forwarded-Encrypted: i=1; AJvYcCUfLkfEYWPUxu+Ym0CbYafiyDqOTgMaTkql972xki0jOAVQ4sjB6kXILV7c8rkaXwWxrf077bgC89M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJYoxOmxC8Fj2+XthgFV8zy6T0VppCvzyilSBKD483gd0TaEtk
	NmEq4qdPvOr0w3lPRsH4adSS8GJV19Uyqyq2C8JGPASPOuGLQRzNv0LGCqxnQ05awXDSUwjm76A
	sP9NydNWi2dIT13SPM3dUGsVlGlnqAXAyTzr8mtO6/3HfZ9lnYNBl6ZWF8dF9x6Nkskf2oaJ2cd
	tAyKPBrQTQWdngb3iva98TS1/3gtlJoDe1jFEr
X-Gm-Gg: ASbGncuKl64EOhyECLZJ3GM3BgbTfGEXCnbk4qc+JIVMoUV5OVnD2CwEzgj/21Pjw5w
	byDSrz4tyEU3np099Sahtzbtd6TkHLO7nTNcx6C0utalFuCiN0QkjrWJpXKjR5spMqPrzghDu9I
	1RfrPu
X-Received: by 2002:a05:651c:4117:b0:32b:755e:6cd3 with SMTP id 38308e7fff4ca-32cdc532c2cmr22541621fa.41.1751271920833;
        Mon, 30 Jun 2025 01:25:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOD7CVZuRKH0gNSW9nJZzyhf8E2LUvK9KnuDXKhGnQuR+p0oOC4yON8e9NAf5N+eFAGQxCUQo8KCHTCYXupAo=
X-Received: by 2002:a05:651c:4117:b0:32b:755e:6cd3 with SMTP id
 38308e7fff4ca-32cdc532c2cmr22541551fa.41.1751271920400; Mon, 30 Jun 2025
 01:25:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524061320.370630-1-yukuai1@huaweicloud.com>
 <20250524061320.370630-17-yukuai1@huaweicloud.com> <c76f44c0-fc61-41da-a16b-5a3510141487@redhat.com>
 <cf6d7be1-af73-216c-b2ab-b34a8890450d@huaweicloud.com>
In-Reply-To: <cf6d7be1-af73-216c-b2ab-b34a8890450d@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Mon, 30 Jun 2025 16:25:07 +0800
X-Gm-Features: Ac12FXxrOjnQjLYtYr_oMWC178CsZXqR9oTQxnqBCt1WFfve1EisfYIBhUPGmic
Message-ID: <CALTww2-RT64+twHo3=Djpuj81jArmePQShGynDrRtYab3c1i2w@mail.gmail.com>
Subject: Re: [PATCH 16/23] md/md-llbitmap: implement bit state machine
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: hch@lst.de, colyli@kernel.org, song@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org, yi.zhang@huawei.com, 
	yangerkun@huawei.com, johnny.chenyi@huawei.com, 
	"yukuai (C)" <yukuai3@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 10:25=E2=80=AFAM Yu Kuai <yukuai1@huaweicloud.com> =
wrote:
>
> Hi,
>
> =E5=9C=A8 2025/06/30 10:14, Xiao Ni =E5=86=99=E9=81=93:
> > For reload action, it runs continue here.
>
> No one can concurent with reload.
>
> >
> > And doesn't it need a lock when reading the state?
>
> Notice that from IO path, all concurrent context are doing the same
> thing, it doesn't matter if old state or new state are read. If old
> state is read, it will write new state in memory again; if new state is
> read, it just do nothing.

Hi Kuai

This is the last place that I don't understand well. Is it the reason
that it only changes one byte at a time and the system can guarantee
the atomic when updating one byte?

If so, it only needs to concern the old and new data you mentioned
above. For example:
raid1 is created without --assume-clean, so all bits are BitUnwritten.
And a write bio comes, the bit changes to dirty. Then a discard is
submitted in another cpu context and it reads the old status
unwritten. From the status change table, the discard doesn't do
anything. In fact, discard should update dirty to unwritten. Can such
a case happen?

Regards
Xiao
>
> Thanks,
> Kuai
>

