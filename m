Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EED0274677
	for <linux-doc@vger.kernel.org>; Fri, 25 Jul 2025 09:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753434843; cv=none; b=ZEeZM9GcY4DT0Sgk4EBisIp1i0UPpHYAajehO3ADct3UcX1SqOx9TiYEjcPQAj0Y/yakxQ1qowsbPjmx/dduo47Iu5SxyogjvvuE9Vq8xTRHac0zhBHRxmO2Z4d7akB/wvkqaGF+pmapXDqU7Zs8DwLmqwTDec3UtsSgmpDbIMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753434843; c=relaxed/simple;
	bh=cUyg1SkNBxbS54LqH20gfKt7ycihR9zZ00+Od8G44+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mAFq+kPs8eqQE/C0J8C05GYsYBE/mJneI7c4S5m3fRVwyLm8ebFeSQE0VCbglEHOt6+sUVlBpt8ZIe2tMcZRmsw0Uz1KEOFPR378yj5K5EmrN6lbc+JXGpdK2dPSOKXcBcc+LgRda85RsAILHyy/HTO8KplZAdmfw8BFPtDukxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fRp8Tb1y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fRp8Tb1y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753434838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JydGIle7+KIUgbdtBYbE6AFRK1qmMolB16FeEOA/Yzg=;
	b=fRp8Tb1ywxhtPzpXLBVUxlc365oJay6BdF9JKv8SgBvAnpecoK3tQ0ejKQuampKhTl+sPo
	nADmWTHYUjVmLPsZXw/IIOEzUFCLSxrucEHRCrUOvCAEbvPuys04iWH26CL8SqGFOVdfft
	HDK79zu8wni+6qhfr325FKyfY8G3Om8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44--EaIrodgNvSbpEJK9bVAvQ-1; Fri, 25 Jul 2025 05:13:56 -0400
X-MC-Unique: -EaIrodgNvSbpEJK9bVAvQ-1
X-Mimecast-MFC-AGG-ID: -EaIrodgNvSbpEJK9bVAvQ_1753434835
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-613559d197dso1633162a12.2
        for <linux-doc@vger.kernel.org>; Fri, 25 Jul 2025 02:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753434835; x=1754039635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JydGIle7+KIUgbdtBYbE6AFRK1qmMolB16FeEOA/Yzg=;
        b=fhAVISFvCl1N2tTsPqJoaZWmxK5L2q2NH5xCtMA23JMjzIxKYy6vSgzc0BvaCREFi2
         yoV9dlOifegVDeh/wQbUHppHFGW54sZIpRz0UdDisxxlmo+HHQXGN5IHHIIsSpaiUUSV
         Zmcmm11TBRYZnc2ddFJ4UXQcgHaOHtbhMog2kvK5pj6DmK0fKTLd6MLNngklvZpKHE2W
         hkmE20lOq+crvE2jTUkFQ4J/jshcyqBCC6PFXPUMlyGYe0O0v3dMO8EGBkTb+lYa3IqB
         qYrOn2tmLLtzSV6g85tFukmkHYOfdZKuTR2SItSmVTRAy5S/BWzF6GNeDv9fOzvzLppG
         DoXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTuPKuoCKnd3o4BSWhR1cIcG2UUJh2aWklt+/bFpSBQO1IhMogBgPignzYkvN0f5ZfIeE8q4KO+ps=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws00lWpxlK8KHNcx5ykglJ/LnmzwSqQOkLoT5jyKHLlnKXIPUw
	VWIgqpRXYST8HxnZJJVAHw7aa4oX16txx7+9JNZEMsH+rVghCs0OU97e2XT5Iy/NmUsGf456e7P
	Q1AZCIGQ4+1HtA5RsxTGkfH3HoxOtGAVVy/J5YV82eNaSzmQ1+Mj13zB6QIbyKi7QG7asaTqPYs
	u/3gX6+neXVeS/ZOPp7jmAkkr0scMkZ1bwxZcc
X-Gm-Gg: ASbGncvkLE/k9JTxxnMViHcEiJuedRCO7I3ikkGKER0KVGzPGj90PNhz/16AG0rM7O0
	PeLsrWdBTIQtqI96hpQuGabmUyDXs0NtNieBL7vErZyBgcadgcmc6AdgcdsW7TKC7byF1Dlb2Fj
	cQR/ccTYf+xJ9gXCl6SDFqsHA0lClDgPQT3kYWk9jazEwcFEZXqio=
X-Received: by 2002:a17:907:869f:b0:adb:23e0:9297 with SMTP id a640c23a62f3a-af61c6b913fmr140268966b.17.1753434834752;
        Fri, 25 Jul 2025 02:13:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTpH7eehWGEJJmFeTf+Td/G4IxZvXvweyFMbHchaLdc5IGS9b+k1MYrJRBTxvLHA9m4a++NsLGQ3PTlEI/B3g=
X-Received: by 2002:a17:907:869f:b0:adb:23e0:9297 with SMTP id
 a640c23a62f3a-af61c6b913fmr140266766b.17.1753434834329; Fri, 25 Jul 2025
 02:13:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723015233.173630-1-ipravdin.official@gmail.com> <20250724095627.572c1cff@batman.local.home>
In-Reply-To: <20250724095627.572c1cff@batman.local.home>
From: Tomas Glozar <tglozar@redhat.com>
Date: Fri, 25 Jul 2025 11:13:43 +0200
X-Gm-Features: Ac12FXwqtYT-kICQMGWTXZpELDsse6D6d7kSh7SWGB9TkFKXpKIy-t5EXJV3ZDA
Message-ID: <CAP4=nvQde7JcbhR56--4EfEsJ+F9oL4WBCRcLaOqfV1MZ-XvjQ@mail.gmail.com>
Subject: Re: [PATCH] rtla: clarify trace option syntax in documentation and
 usage help
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Ivan Pravdin <ipravdin.official@gmail.com>, bristot@kernel.org, corbet@lwn.net, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C4=8Dt 24. 7. 2025 v 15:59 odes=C3=ADlatel Steven Rostedt <rostedt@goodmis=
.org> napsal:
>
> On Tue, 22 Jul 2025 21:52:33 -0400
> Ivan Pravdin <ipravdin.official@gmail.com> wrote:
> > Valid usage:
> >     - `-t[file]`
> >     - `-t=3D[file]`
> >     - `--trace=3D[file]`
> >
> > Invalid usage:
> >     - `-t [file]`
> >     - `--trace [file]`
>
> I wonder if the better fix would be to make the above valid?
>

Definitely. There is also another case where only =3D syntax is
accepted,  C/--cgroup. In my opinion, both are confusing, and both
should accept =3D as well as space. I even had some trouble with the
latter as it fails to parse silently and looks like the cgroup setting
code is not working.

Tomas

