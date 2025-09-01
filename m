Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74F92F0C41
	for <linux-doc@vger.kernel.org>; Mon,  1 Sep 2025 14:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756736655; cv=none; b=Hp8Z78ojRoGc2tx1ZH9mcTjbaL5YzBLek69eHl6xFYJ96f3YskFk8VY1hNAxBU1BGfg6HADbpM/2Ty5bhi1JwJ12JfYB0okaHcLuNfuoKllND/+88b6Qo4p4t/YBwT6bvyYsZ1XJjNVh9UG9aHCgtbGJpkCCo4Hw+GdAaeTRBs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756736655; c=relaxed/simple;
	bh=qAAqpIJ1sZ+WXhv9jSL+yNgDxW9OQV2lwq5CpKUVeRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZSxfQSnMwuBKJH59HvhUMZvhTjVQs0YiJrX30O/Sud1KJAdkt1vfmCbFjS2zL4v+3Ew8cxry50ZjpKwdGQVz8zekRnGmvEXkFkGsh8wHzkiGfRKhJjHi2uXnBvA0gEnKb6o0C8GSlbGWCg/Yzd77ynwvqslnyWhjGzXs620wGcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i0VGwwad; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i0VGwwad"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756736652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DIgXc9xeVr9BBWUbZa2zZn7PQsTxZuClMXuY+mTcrPY=;
	b=i0VGwwadF4Rh5zlNRO5EQtIKVWC49lSRiyoerOOD2ZIy5ceRKAAGghfNO7zfUiV/sgrX5j
	mmGBITjay3c+O4fcVmj3hmQ4YmV8rPeyTBwVFNdLSX7sNHXcls2/+99lc1XY2MHujB3AbZ
	nHlEI5UstLQ30swFF4RdJ1iodjWMRW0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-zHAMV-NGOAWrO45Lnrzfzg-1; Mon, 01 Sep 2025 10:24:11 -0400
X-MC-Unique: zHAMV-NGOAWrO45Lnrzfzg-1
X-Mimecast-MFC-AGG-ID: zHAMV-NGOAWrO45Lnrzfzg_1756736650
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aff0df4c4abso347759666b.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Sep 2025 07:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756736650; x=1757341450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIgXc9xeVr9BBWUbZa2zZn7PQsTxZuClMXuY+mTcrPY=;
        b=gU0nZq81Ihiv1OZd8i0N5qm4MjqN//jjQSDMWt24v6s3I5BY2Vw4Ac3ib4G06TxwBr
         izq50mo4iZnMKiZ/YJSH+2tp2A4oaxJ6MZhgMMX9HDPvUMUnwVjxFhtKt0DgDx0a3tBq
         fOMoPCFM1NMGep38gwZarUenrWdDyaDrfaDS2Eir8sZqjV45BRcb26wVfI5jRhNJn6Jl
         2txZ4tsDO/RiN46mUxgJJM9T/U/W5DdpxSDKGfHr61lhi3EPMgGtMTmvxkFZf52OnGWN
         8/eZCf0GNZzgg05XGwOiSuFEiChB0ZIfJa2sb68hswW0VoLIa6e9laki2IGv5lO/ACoy
         UzGA==
X-Forwarded-Encrypted: i=1; AJvYcCVJn/CTRmZljnH6Fo+WDEYHKbTPJ8nPRhRs0yGjYJrzBgOrRBLUPsMPxsQ8PusHLa5/iN9CwA9vodU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMok4DwQIrZen0SdO8lL6lApoPB67Ju0FucBmK5EO/yxFPskGE
	KVCjSWI201UalQkkfDH5xmy8ge7v9kUB6avUuI+RU0/2wWJbF3XQHHaFF7vy+P1PVIRE6SMSUyv
	D5VSrss6WaxRENadHVGnzu/fNU3QGpIkwwMCrGdkEaiPky0ZYxb03R1JIEnsG70WJ86M7hQ0Qzh
	IrkHH8IQXqxPX6WCOOawUTLEFV5/c+i3MZYTuQZtqpyllcNz0=
X-Gm-Gg: ASbGnctHZfR5tzRjxmLonKhecPNwz0SBfBGeZmzTwfU1AVsttPGKUgZFfMWD/zlGinB
	hBEn3MLZ/IGtDUZXB2LAgd8y6n/SlJVvALJcfW5HSHI+28n6IbCE0jz3OGCCe6IR2IvFCbnTDE5
	AQJsSebtS/KGXRGIKhXIzC6OwNooUDru0zReHbwZBWR1CfJ2vk/sc=
X-Received: by 2002:a17:907:94c8:b0:aff:7:4f12 with SMTP id a640c23a62f3a-b01d8a2778dmr739983566b.5.1756736649578;
        Mon, 01 Sep 2025 07:24:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGn4xY0HH8qCdFSyK5OTzgVVXjJ12ZvaUYluQIqf0B2o60S1nht1dzIxUJp1Vzx3IwFYsWYnxkzkFbv5Vovccg=
X-Received: by 2002:a17:907:94c8:b0:aff:7:4f12 with SMTP id
 a640c23a62f3a-b01d8a2778dmr739980466b.5.1756736649117; Mon, 01 Sep 2025
 07:24:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1755018581.git.ipravdin.official@gmail.com> <96f305f622de233c28d4ed9f23583b4d6ab2d1ac.1755018581.git.ipravdin.official@gmail.com>
In-Reply-To: <96f305f622de233c28d4ed9f23583b4d6ab2d1ac.1755018581.git.ipravdin.official@gmail.com>
From: Tomas Glozar <tglozar@redhat.com>
Date: Mon, 1 Sep 2025 16:23:55 +0200
X-Gm-Features: Ac12FXx63Tybu7ddN4dNpy-VZp0KptTHLkvU7Nm5KFnqWm7q4-qPMwNWVhWSlzk
Message-ID: <CAP4=nvRZ_SY_xdC6N8LkKUA=a-QP5gc5SMgBr4jod6+tu0TFeA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] rtla: fix -a overriding -t argument
To: Ivan Pravdin <ipravdin.official@gmail.com>
Cc: rostedt@goodmis.org, corbet@lwn.net, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C3=BAt 12. 8. 2025 v 19:22 odes=C3=ADlatel Ivan Pravdin
<ipravdin.official@gmail.com> napsal:
>
> When running rtla as
>
>     `rtla <timerlat|osnoise> <top|hist> -t custom_file.txt -a 100`
>
> -a options override trace output filename specified by -t option.
> Running the command above will create <timerlat|osnoise>_trace.txt file
> instead of custom_file.txt. Fix this by making sure that -a option does
> not override trace output filename even if it's passed after trace
> output filename is specified.
>

Yes, this should not be overridden, it's a bug in both the old
implementation and the new one using actions. Thank you for the fix.

> Remove clear_terminal in timerlat top as it removes "Saving trace to <fil=
ename>"
> line from the terminal and is not used in other modes.
>

This is not the correct fix for the issue. clear_terminal is needed in
timerlat top (and osnoise top) to clear the terminal before the
updated status is printed, the fix removes it without a replacement,
breaking this behavior. Also, this is a different issue that appeared
only when the actions patchset [1] was merged, and should go into a
separate patch with a different Fixes tag.

[1] https://lore.kernel.org/linux-trace-kernel/20250626123405.1496931-1-tgl=
ozar@redhat.com/T/#t

Tomas

